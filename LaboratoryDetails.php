<?php
session_start();
if (!isset($_SESSION["FacultyID"]) || !$_SESSION["isDepartmentAdmin"]) {
  header("Location: login.php");
  exit();
}

require 'server_config.php';
require './services/laboratory.service.php';

$laboratoriesService = new laboratoryservice();
$admin = $_SESSION["isAdmin"];

// Fetch all departments
$departmentsQuery = "SELECT DepartmentID, DepartmentName FROM department";
$departmentsResult = mysqli_query($conn, $departmentsQuery);
$departments = [];
while ($row = mysqli_fetch_assoc($departmentsResult)) {
  $departments[] = $row;
}

// Get selected department ID from query parameter
$selectedDepartmentID = isset($_GET['department_id']) ? $_GET['department_id'] : null;

if ($admin == "true" || $admin == "yes" || $admin == 1 || $admin == "Yes" || $admin == "True") {
  if ($selectedDepartmentID) {
    $laboratories = $laboratoriesService->fetchAll("DepartmentID = '$selectedDepartmentID'");
  } else {
    $laboratories = $laboratoriesService->fetchAll();
  }
} else {
  $DepartmentID = $_SESSION["DepartmentID"];
  $laboratories = $laboratoriesService->fetchAll("DepartmentID = '$DepartmentID'");
}

usort($laboratories, function ($a, $b) {
  return $a['DepartmentID'] <=> $b['DepartmentID'];
});
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>GP Ahmedabad Admin Portal</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
  <link href="assets/img/Icon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/css/style.css" rel="stylesheet">
  <link rel="stylesheet" href="assets/css/zoom.css">
  <style>
    .end-btn {
      width: 100%;
      display: flex;
      justify-content: end;
    }
    .filter-container {
      display: flex;
      justify-content: flex-end;
      align-items: center;
      margin-bottom: 20px;
    }
    .filter-container .form-group {
      display: flex;
      align-items: center;
      margin-bottom: 0;
      margin-left: 20px;
    }
    .filter-container .form-group label {
      margin-right: 10px;
    }
  </style>
</head>

<body>

  <?php include 'header_nav.php'; ?>

  <main id="main" class="main">
    <div class="main-spacing">
      <h3 style="font-weight: 600;">Laboratory Detais</h3>
      <div class="filter-container">
        <!-- Department Filter Dropdown -->
        <?php if ($admin == "true" || $admin == "yes" || $admin == 1 || $admin == "Yes" || $admin == "True"): ?>
        <div class="form-group">
          <label for="departmentSelect">Select Department:</label>
          <select id="departmentSelect" class="form-control">
            <option value="">All Departments</option>
            <?php foreach ($departments as $department): ?>
              <option value="<?php echo $department['DepartmentID']; ?>" <?php echo $selectedDepartmentID == $department['DepartmentID'] ? 'selected' : ''; ?>>
                <?php echo $department['DepartmentName']; ?>
              </option>
            <?php endforeach; ?>
          </select>
        </div>
        <?php endif; ?>

        <a href="add_edit_laboratory.php" role="button" class="btn btn-primary add-btn">
          <i class="bi bi-plus" style="font-size: 20px;"></i> Add Laboratory
        </a>
      </div>

      <section class="section">
      <div class="breadcrumb-link">
      <ul class="text-primary">
              <li><a class="text-primary" href="index.php">Dashboard</a></li>
              <li><a class="text-primary" href="laboratoryDetails.php">Laboratory Deatils</a></li>
              <li class="disabled text-secondary">List</li>
      </ul>
      </div>
        <div class="row">
          <div class="col-lg-12">
            <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;">
              <div class="card-body">
                <div class="table-responsive" style="overflow-y: hidden;">
                  <table class="table datatable">
                    <thead>
                      <tr class="bg-primary">
                        <th scope="col">Photo</th>
                        <th scope="col">Laboratory Name</th>
                        <th scope="col">Subjects</th>
                        <th scope="col">Location</th>
                        <th scope="col">Description</th>
                        <th scope="col">Department Name</th>
                        <th scope="col">Actions</th>
                      </tr>
                    </thead>
                    <tbody id="laboratoryTableBody">
                      <?php
                      if (!empty($laboratories)) {
                        foreach ($laboratories as $row) {
                          echo "<tr>";
                          $departmentQuery = "SELECT DepartmentName FROM  department WHERE  DepartmentID = '$row[DepartmentID]'";
                          $departmentResult = mysqli_query($conn, $departmentQuery);
                          $departmentRow = mysqli_fetch_assoc($departmentResult);
                          $departmentName = $departmentRow['DepartmentName'];
                          echo "<tr>";
                          echo "<td><a href='" . $row['PhotoURL1'] . "' class='image-link'><img src='" . $row['PhotoURL1'] . "' alt='Photo 1' width='50' height='50' style='border-radius: 30px;'></a></td>";
                          echo "<td>" . $row['LaboratoryName'] . "</td>";
                          echo "<td>" . $row['Subjects'] . "</td>";
                          echo "<td>" . $row['Location'] . "</td>";
                          echo "<td>" . substr($row['Description'], 0, 30) . "...<a href='view_laboratory.php?ID=" . $row['ID'] . "&department_name=" . $departmentName . "'>more</a></td>";

                          echo "<td>$departmentName</td>";
                          echo "<td>
                        <div class='dropdown'>
                          <button class='btn own-dots-btn' type='button' id='dropdownMenuButton' data-bs-toggle='dropdown' aria-expanded='false'>
                            <i class='bi bi-three-dots-vertical'></i>
                          </button>
                          <ul class='dropdown-menu' aria-labelledby='dropdownMenuButton'>
                            <li>
                              <a class='dropdown-item d-flex align-items-center' href='add_edit_laboratory.php?ID=" . $row['ID'] . "'>
                                <i class='bi bi-pencil me-2'></i> Edit
                              </a>
                            </li>
                            <li>
                              <a class='dropdown-item d-flex align-items-center text-danger bg-light' href='#' data-bs-toggle='modal' data-bs-target='#deleteModal' data-id='" . $row['ID'] . "'>
                                <i class='bi bi-trash text-danger me-2'></i> Delete
                              </a>
                            </li>
                            <li>
                              <a class='dropdown-item d-flex align-items-center' href='view_laboratory.php?ID=" . $row['ID'] . "&department_name=" . $departmentName . "'>
                                <i class='bi bi-eye me-2'></i> View Details
                              </a>
                            </li>
                          </ul>
                        </div>
                      </td>";
                        }
                      } else {
                        echo "<tr class='text-center'><td colspan='7'>No results found</td></tr>";
                      }
                      ?>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="deleteModalLabel">Delete Laboratory</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                Are you sure you want to delete this laboratory?
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <a href="#" id="confirmDelete" class="btn btn-danger">Delete</a>
              </div>
            </div>
          </div>
        </div>

      </section>
    </div>
  </main>

  <?php include "footer.php"; ?>

</body>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>
<script>
  $(document).ready(function() {
    $(".image-link").magnificPopup({
      type: "image",
      closeOnContentClick: true,
      fixedContentPos: true,
      mainClass: "mfp-no-margins mfp-with-zoom",
      image: {
        verticalFit: true,
        titleSrc: function(item) {
          return item.el.attr("title");
        }
      },
      zoom: {
        enabled: true,
        duration: 300,
        opener: function(openerElement) {
          return openerElement.is("img") ? openerElement : openerElement.find("img");
        },
        nonTouch: true, // Prevent browser zooming
        modal: false, // Allow zooming on zoomed image
        cursor: 'mfp-zoom' // Change cursor style to zoom
      },
      callbacks: {
        buildControls: function() {
          this.contentContainer.append(this.controls);
        },
        markupParse: function(template, values, item) {
          values.title = "";
        }
      },
      // gallery: {
      //   enabled: true
      // }
    });

    // Handle department selection
    $('#departmentSelect').on('change', function() {
      var selectedDepartmentID = $(this).val();
      window.location.href = 'LaboratoryDetails.php?department_id=' + selectedDepartmentID;
    });
  });
</script>
<script>
  var deleteModal = document.getElementById('deleteModal');
  deleteModal.addEventListener('show.bs.modal', function(event) {
    var button = event.relatedTarget;
    var labId = button.getAttribute('data-id');
    var confirmDelete = document.getElementById('confirmDelete');
    confirmDelete.href = 'delete_lab.php?ID=' + labId;
  });
</script>

</html>
