<?php
session_start();
if (!isset($_SESSION["FacultyID"])) {
  header("Location: login.php");
  exit();
}

require 'server_config.php';
require 'upload.php';
require_once './services/fac_education.service.php';

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$facultyEducationService = new FacultyEducationService();
$success = false;

$DepartmentID = $_SESSION["SavedDeptID"];
$FacultyID = $_SESSION["FacultyID"];
$isSuperAdmin = $_SESSION["isAdmin"] == "Yes" || $_SESSION["isAdmin"] == "yes" || $_SESSION["isAdmin"] == "true";

$id = isset($_GET['id']) ? $_GET['id'] : null;
$isEditMode = $id !== null;

if ($isEditMode) {
  $experience = $facultyEducationService->fetchOne($id, "FacultyID = $FacultyID");
  if (!$experience) {
    echo "Education not found.";
    $_SESSION['notification'] = array(
      "message" => "Education not found...",
      "type" => "error",
    );
    header("Location: facEducation.php");
    exit();
  }
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['onsubmit'])) {

  $data = [
    "DepartmentID" => $DepartmentID,
    "FacultyID" => $FacultyID,
    "Degree" => $_POST['Degree'],
    "University" => $_POST['University'],
    "Specialization" => $_POST['Specialization'],
    "Percentage" => $_POST['Percentage'],
    "PassingYear" => $_POST['PassingYear'],
  ];

  if ($isEditMode) {
    $success = $facultyEducationService->update($id, $data);
  } else {
    $success = $facultyEducationService->save($data);
  }

  if ($success) {
    $notification = array(
      "message" => $isEditMode ? "Details details updated succesfully..." : "Details details added succesfully...",
      "type" => "success",
    );
  } else {
    $notification = array(
      "message" => $isEditMode ? "Details details not updated succesfully..." : "Details details not added succesfully...",
      "type" => "error",
    );
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
          <h3 style="font-weight: 600;">Faculty Education</h3>
          <div class="breadcrumb-link">
            <ul class="text-primary">
              <li>
                <a class="text-primary" href="index.php">Dashboard</a>
              </li>
              <li>
                <a class="text-primary" href="facEducation.php">Faculty Education</a>
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
                    <select class="form-control" id="Department" name="Department" required disabled="true">
                      <option selected disabled><?php echo $_SESSION["SavedDeptID"] . "-" . $_SESSION['SavedDeptName'] ?></option>
                    </select>
                  </div>
                  <div class="form-group col-md-4 mb-3">
                    <label class="mb-1" for="University">University</label>
                    <input type="text" class="form-control" id="University" name="University" required value="<?php echo $isEditMode ? $experience['University'] : ''; ?>">
                  </div>
                  <div class="form-group col-md-4 mb-3">
                    <label class="mb-1" for="Degree">Degree</label>
                    <input type="text" class="form-control" id="Degree" name="Degree" required value="<?php echo $isEditMode ? $experience['Degree'] : ''; ?>">
                  </div>
                  <div class="form-group col-md-4 mb-3">
                    <label class="mb-1" for="PassingYear">Passing Year</label>
                    <input type="number" class="form-control" id="PassingYear" name="PassingYear" min="1900" max="<?php echo date('Y'); ?>" required value="<?php echo $isEditMode ? $experience['PassingYear'] : ''; ?>">
                  </div>
                  <div class="form-group col-md-4 mb-3">
                    <label class="mb-1" for="Percentage">Percentage</label>
                    <input type="number" class="form-control" id="Percentage" name="Percentage" min="0" max="100" step="0.01" required value="<?php echo $isEditMode ? $experience['Percentage'] : ''; ?>">
                  </div>
                  <div class="form-group col-md-4 mb-3">
                    <label class="mb-1" for="Specialization">Specialization</label>
                    <input type="text" class="form-control" id="Specialization" name="Specialization" required value="<?php echo $isEditMode ? $experience['Specialization'] : ''; ?>">
                  </div>
                  <div class="d-flex justify-content-end">
                    <button type="submit" name="onsubmit" class="btn btn-primary"><?php echo $isEditMode ? 'Update Experience' : 'Add Experience'; ?></button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>

    </div>
  </main>

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
</body>

</html>