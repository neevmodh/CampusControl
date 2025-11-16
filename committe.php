<?php
session_start();
if (!isset($_SESSION["FacultyID"]) || !$_SESSION["isDepartmentAdmin"]) {
    header("Location: login.php");
    exit();
}

require 'server_config.php';
require './services/committe.service.php';

$committeService = new CommitteService();
$committes = $committeService->fetchAll();
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
            <h3 style="font-weight: 600;">Admin Committe</h3>
            <div class="end-btn">
                <a href="add_edit_committe.php" role="button" class="btn btn-primary add-btn">
                    <i class="bi bi-plus" style="font-size: 20px;"></i> Add
                </a>
            </div>
            <div class="breadcrumb-link">
                <ul class="text-primary">
                    <li><a class="text-primary" href="index.php">Dashboard</a></li>
                    <li><a class="text-primary" href="committe.php">Admin Committe</a></li>
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
                                            <th scope="col">Committe Name</th>
                                            <th scope="col">Convener</th>
                                            <th scope="col">Description</th>
                                            <th scope="col">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody id="committeBody">
                                        <?php
                                        if (!empty($committes)) {
                                            foreach ($committes as $row) {
                                                $stmt = $conn->prepare("SELECT FirstName, LastName FROM faculty WHERE FacultyID = ?");
                                                $stmt->bind_param("i", $row['CommitteConvener']);
                                                $stmt->execute();
                                                $result = $stmt->get_result();
                                                $ConvenerRow = $result->fetch_assoc();
                                                $ConvenerName = $ConvenerRow['FirstName'] . ' ' . $ConvenerRow['LastName'];
                                                $stmt->close();

                                                echo "<tr>";
                                                echo "<td>" . htmlspecialchars($row['CommitteName']) . "</td>";
                                                echo "<td>" . htmlspecialchars($ConvenerName) . "</td>";
                                                echo "<td>" . htmlspecialchars($row['Description']) . "</td>";
                                                echo "<td>
                          <div class='dropdown'>
                            <button class='btn own-dots-btn' type='button' id='dropdownMenuButton' data-bs-toggle='dropdown' aria-expanded='false'>
                              <i class='bi bi-three-dots-vertical'></i>
                            </button>
                            <ul class='dropdown-menu' aria-labelledby='dropdownMenuButton'>
                              <li>
                                <a class='dropdown-item d-flex align-items-center' href='add_edit_committe.php?CommitteId=" . htmlspecialchars($row['CommitteId']) . "'>
                                  <i class='bi bi-pencil me-2'></i> Edit
                                </a>
                              </li>
                              <li>
                                <a class='dropdown-item d-flex align-items-center text-danger bg-light' href='#' data-bs-toggle='modal' data-bs-target='#deleteModal' data-id='" . htmlspecialchars($row['CommitteId']) . "'>
                                  <i class='bi bi-trash text-danger me-2'></i> Delete
                                </a>
                              </li>
                            </ul>
                          </div>
                        </td>";
                                                echo "</tr>";
                                            }
                                        } else {
                                            echo "<tr class='text-center'><td colspan='4'>No results found</td></tr>";
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
                                <h5 class="modal-title" id="deleteModalLabel">Delete Committe</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Are you sure you want to delete this committe?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                <a href="#" id="confirmDelete" class="btn btn-danger">Delete</a>
                            </div>
                        </div>
                    </div>
                </div>
                <?php if (isset($_SESSION['error'])): ?>
                <div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="errorModalLabel">Error</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <?php echo $_SESSION['error']; unset($_SESSION['error']); ?>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <script>
                    var errorModal = new bootstrap.Modal(document.getElementById('errorModal'));
                    errorModal.show();
                </script>
                <?php endif; ?>
            </section>
        </div>
    </main>

    <?php include "footer.php"; ?>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        var deleteModal = document.getElementById('deleteModal');
        deleteModal.addEventListener('show.bs.modal', function(event) {
            var button = event.relatedTarget;
            var committeId = button.getAttribute('data-id');
            var confirmDelete = document.getElementById('confirmDelete');
            confirmDelete.href = 'delete_committe.php?CommitteId=' + committeId;
        });
    </script>
</body>

</html>
