<?php
session_start();
if (!isset($_SESSION["FacultyID"]) || !($_SESSION["isSuperAdmin"])) {
  header("Location: login.php");
  exit();
}

require 'server_config.php';
require './services/aicte_eoa_approvals.service.php';

$service = new AICTE_EOA_ApprovalsService();

$searchQuery = '';
if (isset($_GET['search'])) {
  $searchQuery = $_GET['search'];
}

$DepartmentID = $_SESSION["DepartmentID"];
$searchCondition = !empty($searchQuery) ? "name LIKE '%$searchQuery%'" : "";

$resultFetchAll = $service->fetchAll("$searchCondition");

?>
<!DOCTYPE html>
<html lang="en">
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
</head>

<body>

  <?php include 'header_nav.php'; ?>

  <main id="main" class="main">
    <div class="main-spacing">
      <div class="custom-breadcrumb">
        <div>
          <h3 style="font-weight: 600;">AICTE EOA Approvals</h3>
          <div class="breadcrumb-link">
            <ul class="text-primary">
              <li><a class="text-primary" href="index.php">Dashboard</a></li>
              <li><a class="text-primary" href="aicte_eoa_approvals.php">AICTE EOA Approvals</a></li>
              <li class="disabled text-secondary">List</li>
            </ul>
          </div>
        </div>

        <div class="breadcrumb-actions">
          <form class="input-group" method="GET" action="aicte_eoa_approvals.php">
            <input class="form-control" type="text" id="searchInput" name="search" placeholder="Search..." aria-label="Search" value="<?php echo htmlspecialchars($searchQuery); ?>">
            <button class="btn btn-outline-success" type="submit">Search</button>
          </form>
          <a href="add_edit_approval.php" role="button" class="btn btn-primary add-btn">
            <i class="bi bi-plus" style="font-size: 20px;"></i> Add Approval
          </a>
        </div>
      </div>
      <section class="section">
        <div class="row">
          <div class="col-lg-12">
            <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;">
              <div class="card-body">
                <table class="table datatable">
                  <thead>
                    <tr class="bg-primary">
                      <th scope="col">Name</th>
                      <th scope="col">View File</th>
                      <th scope="col">Actions</th>
                    </tr>
                  </thead>
                  <tbody id="subjectTableBody">
                    <?php
                    if (!empty($resultFetchAll)) {
                      foreach ($resultFetchAll as $row) {
                        echo "<tr>";
                        echo "<td>" . $row['name'] . "</td>";
                        echo "<td><a href='" . $row["file"] . "' target='_blank'>View File</a></td>";
                        echo "<td>
                                <div class='dropdown'>
                                    <button class='btn own-dots-btn' type='button' id='dropdownMenuButton' data-bs-toggle='dropdown' aria-expanded='false'>
                                        <i class='bi bi-three-dots-vertical'></i>
                                    </button>
                                    <ul class='dropdown-menu' aria-labelledby='dropdownMenuButton'>
                                        <li>
                                            <a class='dropdown-item d-flex align-items-center' href='add_edit_approval.php?id=" . $row['id'] . "'>
                                                <i class='bi bi-pencil me-2'></i> Edit
                                            </a>
                                        </li>
                                        <li>
                                            <a class='dropdown-item d-flex align-items-center text-danger bg-light' href='#' data-bs-toggle='modal' data-bs-target='#deleteModal' data-id='" . $row['id'] . "'>
                                                <i class='bi bi-trash text-danger me-2'></i> Delete
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </td>";
                        echo "</tr>";
                      }
                    } else {
                      echo "<tr class='text-center'><td colspan='8'>No results found</td></tr>";
                    }
                    ?>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
  </main>

  <?php include "footer.php"; ?>

  <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="deleteModalLabel">Delete Subject</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          Are you sure you want to delete this AICTE EOA Approval?
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
          <a href="#" id="confirmDelete" class="btn btn-danger">Delete</a>
        </div>
      </div>
    </div>
  </div>

  <script>
    var deleteModal = document.getElementById('deleteModal');
    deleteModal.addEventListener('show.bs.modal', function(event) {
      var button = event.relatedTarget;
      var disclosureID = button.getAttribute('data-id');
      var confirmDelete = document.getElementById('confirmDelete');
      confirmDelete.href = 'delete_approval.php?id=' + disclosureID;
    });
  </script>
</body>

</html>