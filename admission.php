<?php
session_start();
if (!isset($_SESSION["FacultyID"]) || !$_SESSION["isDepartmentAdmin"]) {
  header("Location: login.php");
  exit();
}

require 'server_config.php';
require './services/admission.service.php';
$admissionService = new admission();
$admissions = $admissionService->fetchAll();
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>GP Ahmedabad Admin Portal</title>
  <link href="assets/img/Icon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/css/style.css" rel="stylesheet">
  <style>
    .end-btn {
      width: 100%;
      display: flex;
      justify-content: end;
    }
  </style>
</head>

<body>

  <?php include 'header_nav.php'; ?>

  <main id="main" class="main">
    <div class="main-spacing">
    <h3 style="font-weight: 600;">Diploma Admissions & Courses</h3>
      <div class="end-btn">
        <a href="add_edit_admission.php" role="button" class="btn btn-primary add-btn">
          <i class="bi bi-plus" style="font-size: 20px;"></i> Add
        </a>
      </div>
      
        <div class="breadcrumb-link">
          <ul class="text-primary">
            <li><a class="text-primary" href="index.php">Dashboard</a></li>
            <li><a class="text-primary" href="admission.php">Diploma Admissions</a></li>
            <li class="disabled text-secondary">List</li>
          </ul>
        </div>
        <section class="section">
          <div class="row">
            <div class="col-lg-12">
              <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;">
                <div class="card-body">
                  <table class="table datatable">
                    <thead>
                      <tr class="bg-primary">
                        <th scope="col">Programme</th>
                        <th scope="col">Level</th>
                        <th scope="col">Intake</th>
                        <th scope="col">Course Duration</th>
                        <th scope="col">Actions</th>
                      </tr>
                    </thead>
                    <tbody id="admissionBody">
                      <?php
                      if (!empty($admissions)) {
                        foreach ($admissions as $row) {
                          echo "<tr>";
                          echo "<td>" . $row['Programme'] . "</td>";
                          echo "<td>" . $row['Level'] . "</td>";
                          echo "<td>" . $row['Intake'] . "</td>";
                          echo "<td>" . $row['CourseDuration'] . " years</td>";
                          echo "<td>
                          <div class='dropdown'>
                            <button class='btn own-dots-btn' type='button' id='dropdownMenuButton' data-bs-toggle='dropdown' aria-expanded='false'>
                              <i class='bi bi-three-dots-vertical'></i>
                            </button>
                            <ul class='dropdown-menu' aria-labelledby='dropdownMenuButton'>
                              <li>
                                <a class='dropdown-item d-flex align-items-center' href='add_edit_admission.php?ID=" . $row['ID'] . "'>
                                  <i class='bi bi-pencil me-2'></i> Edit
                                </a>
                              </li>
                              <li>
                                <a class='dropdown-item d-flex align-items-center text-danger bg-light' href='#' data-bs-toggle='modal' data-bs-target='#deleteModal' data-id='" . $row['ID'] . "'>
                                  <i class='bi bi-trash text-danger me-2'></i> Delete
                                </a>
                              </li>
                            </ul>
                          </div>
                        </td>";
                          echo "</tr>";
                        }
                      } else {
                        echo "<tr class='text-center'><td colspan='6'>No results found</td></tr>";
                      }
                      ?>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
          <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="deleteModalLabel">Delete Admission</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  Are you sure you want to delete this admission?
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

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    var deleteModal = document.getElementById('deleteModal');
    deleteModal.addEventListener('show.bs.modal', function(event) {
      var button = event.relatedTarget;
      var admissionId = button.getAttribute('data-id');
      var confirmDelete = document.getElementById('confirmDelete');
      confirmDelete.href = 'delete_admission.php?ID=' + admissionId;
    });
  </script>
</body>

</html>