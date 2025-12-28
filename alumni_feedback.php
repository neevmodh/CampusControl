<?php
session_start();
if (!isset($_SESSION["FacultyID"]) || !($_SESSION["isDepartmentAdmin"] || $_SESSION["isSuperAdmin"])) {
  header("Location: login.php");
  exit();
}

require 'server_config.php';
require_once './services/alumni_feedback.service.php';

$service = new AlumniFeedbackService();

$searchQuery = '';
if (isset($_GET['search'])) {
  $searchQuery = $_GET['search'];
}

$DepartmentID = $_SESSION["DepartmentID"];
$departmentCondition = "DepartmentID = '$DepartmentID'";
$searchCondition = !empty($searchQuery) ? "(name LIKE '%$searchQuery%' OR email LIKE '%$searchQuery%')" : "";

$feedbacks = $service->fetchAll("$searchCondition", ['submission_date' => 'DESC']);

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
          <h3 style="font-weight: 600;">Alumni Feedback</h3>
          <div class="breadcrumb-link">
            <ul class="text-primary">
              <li><a class="text-primary" href="index.php">Dashboard</a></li>
              <li><a class="text-primary" href="alumni_feedback.php">Alumni Feedback</a></li>
              <li class="disabled text-secondary">List</li>
            </ul>
          </div>
        </div>

        <div class="breadcrumb-actions">
          <form class="input-group" method="GET" action="alumni_feedback.php">
            <input class="form-control" type="text" id="searchInput" name="search" placeholder="Search..." aria-label="Search" value="<?php echo htmlspecialchars($searchQuery); ?>">
            <button class="btn btn-outline-success" type="submit">Search</button>
          </form>
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
                      <th scope="col">Email</th>
                      <th scope="col">Phone</th>
                      <th scope="col">Submitted Date</th>
                      <th scope="col">Actions</th>
                    </tr>
                  </thead>
                  <tbody id="subjectTableBody">
                    <?php
                    if (!empty($feedbacks)) {
                      foreach ($feedbacks as $row) {
                        echo "<tr>";
                        echo "<td>" . $row['name'] . "</td>";
                        echo "<td>" . $row['email'] . "</td>";
                        echo "<td>" . $row['mobile'] . "</td>";
                        echo "<td>" . $row['submission_date'] . "</td>";
                        echo "<td>
                                <div style='color: var(--bs-primary);'>
                                    <a class='btn own-dots-btn' href='alumni_feedback_view.php?id=" . $row['id'] . "' style='color: var(--bs-primary);'>
                                        <i class='bi bi-eye-fill'></i>
                                    </a>
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

</body>

</html>