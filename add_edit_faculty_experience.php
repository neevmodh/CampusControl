<?php
session_start();
if (!isset($_SESSION["FacultyID"])) {
  header("Location: login.php");
  exit();
}

require 'server_config.php';
require 'upload.php';
require_once './services/faculty_experience.service.php';

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$DepartmentID = $_SESSION["SavedDeptID"];
$FacultyID = $_SESSION["FacultyID"];

$id = isset($_GET['id']) ? $_GET['id'] : null;
$isEditMode = $id !== null;

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['onsubmit'])) {
  $service = new FacultyExperienceService();
  $currentwork = isset($_POST['currentwork']) ? 1 : 0;

  if ($currentwork) {
    $EndDate = date('Y-m-d');
  } else {
    $EndDate = $_POST['EndDate'];
  }
  $data = [
    'DepartmentID' => $DepartmentID,
    'UserName' => $_SESSION['FacultyName'],
    'FacultyID' => $FacultyID,
    'InstituteorCompany' => $_POST['InstituteorCompany'],
    'Designation' => $_POST['Designation'],
    'StartDate' => $_POST['StartDate'],
    'EndDate' => $EndDate,
    'Status' => $_POST['Status'],
  ];

  if ($isEditMode) {
    $result = $service->update($id, $data);
  } else {
    $result = $service->save($data);
  }

  if (isset($result)) {
    header("Location: facExperience.php");
    exit();
  } else {
    echo "Error: " . $conn->error;
  }
}

if ($isEditMode) {
  $experience = (new FacultyExperienceService())->fetchOne($id);
  if (!$experience) {
    echo "Subject not found.";
    exit();
  }
}

$conn->close();
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
  <link href="https://fonts.googleapis.com/css?family=Open+Sans|Nunito|Poppins" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/css/style.css" rel="stylesheet">
</head>

<body>

  <?php include 'header_nav.php' ?>

  <main id="main" class="main">
    <div class="main-spacing">
      <div class="custom-breadcrumb">
        <div>
          <h3 style="font-weight: 600;">Faculty Experience</h3>
          <div class="breadcrumb-link">
            <ul class="text-primary">
              <li>
                <a class="text-primary" href="#">Dashboard</a>
              </li>
              <li>
                <a class="text-primary" href="facExperience.php">Faculty Experience</a>
              </li>
              <li class="disabled text-secondary"><?php echo $isEditMode ? 'Edit' : 'Create'; ?></li>
            </ul>
          </div>
        </div>
      </div>

      <div class="d-flex justify-content-center">
        <div class="d-flex align-items-center w-100">
          <div class="card w-100">
            <div class="card-body mt-3 h-100 w-100">
              <form class="form" method="POST" enctype="multipart/form-data">
                <div class="row">
                  <div class="form-group col-md-4 mb-3">
                    <label class="mb-1" for="Department">Department</label>
                    <select class="form-control" id="Department" name="Department" required disabled="true" ?>">
                      <option selected disabled><?php echo $_SESSION["SavedDeptID"] . "-" . $_SESSION['SavedDeptName'] ?></option>
                    </select>
                  </div>
                  <div class="form-group col-md-4 mb-3">
                    <label class="mb-1" for="InstituteorCompany">Collage/Company Name</label>
                    <input type="text" class="form-control" id="InstituteorCompany" name="InstituteorCompany" required value="<?php echo $isEditMode ? $experience['InstituteorCompany'] : ''; ?>">
                  </div>
                  <div class="form-group col-md-4 mb-3">
                    <label class="mb-1" for="Designation">Designation</label>
                    <input type="text" class="form-control" id="Designation" name="Designation" required value="<?php echo $isEditMode ? $experience['Designation'] : ''; ?>">
                  </div>
                  <div class="form-group col-md-6 mb-3">
                    <label class="mb-1" for="StartDate">Start Date</label>
                    <input type="date" class="form-control" id="StartDate" name="StartDate" min="1980-01-01" max=<?php echo date('Y-m-d'); ?> value="<?php echo $isEditMode ? $experience['StartDate'] : ''; ?>" required>
                  </div>
                  <div class="form-group col-md-6 mb-3">
                    <label class="mb-1" for="EndDate">End Date</label>
                    <input type="date" class="form-control" id="EndDate" name="EndDate" min="1980-01-01" max=<?php echo date('Y-m-d'); ?> value="<?php echo $isEditMode ? $experience['EndDate'] : ''; ?>" required>
                  </div>
                  <div class="form-group col-md-6 mb-3">
                    <label class="mb-1" for="Status">Status</label>
                    <select class="form-control" id="Status" name="Status" required>
                      <option value="active" <?php echo $isEditMode && $experience['Status'] == 'active' ? 'selected' : ''; ?>>Active</option>
                      <option value="inactive" <?php echo $isEditMode && $experience['Status'] == 'inactive' ? 'selected' : ''; ?>>Inactive</option>
                    </select>
                  </div>
                  <div class="form-group col-md-6 mb-3">
                    <div style="display: flex; height: 100%; align-items: center; gap: 10px; text-align: center;">
                      <label class="mb-1" for="Practical">Currently Working ?</label>
                      <input class="form-check-input is-invalid" value="1" name="currentwork" value="" type="checkbox" id="invalidCheckNew">
                    </div>
                  </div>
                  <div class="d-flex justify-content-end">
                    <button type="submit" name="onsubmit" class="btn btn-primary"><?php echo $isEditMode ? 'Update Experience' : 'Add Experience'; ?></button>
                  </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
  <script src="ajaxValidation.js"></script>
</body>

</html>