<?php
session_start();
if (!isset($_SESSION["FacultyID"]) || !($_SESSION["isDepartmentAdmin"] || $_SESSION["isSuperAdmin"])) {
  header("Location: login.php");
  exit();
}

require 'server_config.php';
require 'upload.php';
require './services/subject_material.service.php';

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$subjectCode = '';
if (isset($_GET['id'])) {
  $subjectCode = $conn->real_escape_string($_GET['id']);
} else {
  header("Location: subjects.php");
  exit();
}

$DepartmentID = '';
if (isset($_GET['dept_id'])) {
  $DepartmentID = $conn->real_escape_string($_GET['dept_id']);
} else {
  header("Location: subjects.php");
  exit();
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  $Unit = $_POST["Unit"];
  $Title = $_POST["Title"];

  try {
    $UnitFile = handleFileUpload('UnitFile', "unit_materials/", [".pdf", ".doc", ".docx", ".ppt", ".pptx"], null);
    $AssignmentFile = handleFileUpload('AssignmentFile', "assignment_materials/", [".pdf", ".doc", ".docx", ".ppt", ".pptx"], null);
  } catch (InvalidArgumentException $e) {
    $notification = array(
      "message" => "Invalid argument error: " . $e->getMessage(),
      "type" => "danger",
    );
  } catch (RuntimeException $e) {
    $notification = array(
      "message" => "Runtime error: " . $e->getMessage(),
      "type" => "danger",
    );
  }

  $subjectMaterialService  = new SubjectMaterialService();

  $data = [
    'SubjectCode' => $subjectCode,
    'Unit' => $Unit,
    'DepartmentID' => $DepartmentID,
    'Title' => $Title,
    'UnitFile' => $UnitFile,
    'AssignmentFile' => $AssignmentFile
  ];

  $result = $subjectMaterialService->save($data);

  if (isset($result)) {
    header("Location: subjects.php");
    exit();
  } else {
    $notification = array(
      "message" => "Error: " . $sql . "<br>" . $conn->error,
      "type" => "danger",
    );
  }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Add Material</title>
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/css/style.css" rel="stylesheet">
</head>

<body>
  <?php include 'header_nav.php'; ?>
  <main id="main" class="main">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-6">
          <div class="card mt-5">
            <div class="card-header">
              <h4>Add Material for Subject Code: <?php echo htmlspecialchars($subjectCode); ?></h4>
            </div>
            <div class="card-body">
              <?php if (!empty($errorMessage)) : ?>
                <div class="alert alert-danger" role="alert">
                  <?php echo $errorMessage; ?>
                </div>
              <?php endif; ?>
              <form method="post" enctype="multipart/form-data">
                <div class="mb-3">
                  <label for="Unit" class="form-label">Unit</label>
                  <input type="number" class="form-control" id="Unit" name="Unit" required min="0" max="10" onchange="handleNumberChange(event,0,10)">
                </div>
                <div class="mb-3">
                  <label for="Title" class="form-label">Title</label>
                  <input type="text" class="form-control" id="Title" name="Title" required>
                </div>
                <div class="mb-3">
                  <label for="UnitFile" class="form-label">Unit File</label>
                  <input class="form-control" type="file" id="UnitFile" name="UnitFile" required accept=".pdf,.doc,.docx,.ppt,.pptx" onchange="handleFileChange(event, ['.pdf','.doc','.docx','.ppt','.pptx'])">
                </div>
                <div class="mb-3">
                  <label for="AssignmentFile" class="form-label">Assignment File</label>
                  <input class="form-control" type="file" id="AssignmentFile" name="AssignmentFile" required accept=".pdf,.doc,.docx,.ppt,.pptx" onchange="handleFileChange(event, ['.pdf','.doc','.docx','.ppt','.pptx'])">
                </div>
                <button type="submit" class="btn btn-primary">Add Material</button>
                <a href="subjects.php" class="btn btn-secondary">Cancel</a>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>

  <?php include 'footer.php'; ?>

  <script src="ajaxValidation.js"></script>
</body>

</html>