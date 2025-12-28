<?php
session_start();
if (!isset($_SESSION["FacultyID"]) || !($_SESSION["isDepartmentAdmin"] || $_SESSION["isSuperAdmin"])) {
  header("Location: login.php");
  exit();
}

require 'server_config.php';
require 'upload.php';
require_once './services/subjects.service.php';

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$DepartmentID = $_SESSION["DepartmentID"];
$FacultyID = $_SESSION["FacultyID"];

$subjectID = isset($_GET['id']) ? $_GET['id'] : null;
$isEditMode = $subjectID !== null;

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['onsubmit'])) {
  $Department = isset($_POST["Department"]) ? $_POST["Department"] : $DepartmentID;
  $Semester = $_POST["Semester"];
  $SubjectCode = $_POST["SubjectCode"];
  $SubjectName = $_POST["SubjectName"];
  $Theory = $_POST["Theory"];
  $Tutorial = $_POST["Tutorial"];
  $Practical = $_POST["Practical"];
  $TotalHours = $_POST["TotalHours"];
  $GTUTheory = $_POST["GTUTheory"];
  $MID = $_POST["MID"];
  $ESE = $_POST["ESE"];
  $PA = $_POST["PA"];
  $Total = $_POST["Total"];
  $Status = $_POST["Status"];

  $allowedTypesSyllabus = [".pdf", ".doc", ".docx", ".ppt", ".pptx"];
  $allowedTypesAssignments = [".pdf", ".doc", ".docx", ".ppt", ".pptx"];

  if ($isEditMode) {
    $sql = "SELECT SyllabusFile, Assignments FROM subjectdetails WHERE SubjectCode='$subjectID'";
    $result = $conn->query($sql);
    $existingFiles = $result->fetch_assoc();
  }

  try {
    $SyllabusFile = handleFileUpload('SyllabusFile', "syllabus_subjects/", $allowedTypesSyllabus, $isEditMode ? $existingFiles['SyllabusFile'] : null);
    $Assignments = handleFileUpload('Assignments', "assignments_subjects/", $allowedTypesAssignments, $isEditMode ? $existingFiles['Assignments'] : null);
  } catch (InvalidArgumentException $e) {
    echo "Invalid argument error: " . $e->getMessage();
  } catch (RuntimeException $e) {
    echo "Runtime error: " . $e->getMessage();
  }

  $subjectsService = new SubjectService();

  $data = [
    'DepartmentID' => $Department,
    'Semester' => $Semester,
    'SubjectCode' => $SubjectCode,
    'SubjectName' => $SubjectName,
    'Theory' => $Theory,
    'Tutorial' => $Tutorial,
    'Practical' => $Practical,
    'TotalHours' => $TotalHours,
    'GTUTheory' => $GTUTheory,
    'MID' => $MID,
    'ESE' => $ESE,
    'PA' => $PA,
    'Total' => $Total,
    'SyllabusFile' => $SyllabusFile,
    'Assignments' => $Assignments,
    'Status' => $Status
  ];

  if ($isEditMode) {
    $result = $subjectsService->update($subjectID, $data);
  } else {
    $result = $subjectsService->save($data);
  }

  if (isset($result)) {
    header("Location: subjects.php");
    exit();
  } else {
    echo "Error: " . $conn->error;
  }
}

if ($isEditMode) {
  $subject = (new SubjectService())->fetchOne($subjectID);
  if (!$subject) {
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
  <script>
    function calculateTotalHours() {
      const theory = parseInt(document.getElementById('Theory').value) || 0;
      const tutorial = parseInt(document.getElementById('Tutorial').value) || 0;
      const practical = parseInt(document.getElementById('Practical').value) || 0;
      const totalHours = theory + tutorial + practical;
      document.getElementById('TotalHours').value = totalHours;
    }

    function calculateTotalMarks() {
      const mid = parseInt(document.getElementById('MID').value) || 0;
      const ese = parseInt(document.getElementById('ESE').value) || 0;
      const pa = parseInt(document.getElementById('PA').value) || 0;
      const gtu_theory = parseInt(document.getElementById('GTUTheory').value) || 0;
      const total = mid + ese + pa + gtu_theory;
      document.getElementById('Total').value = total;
    }

    document.addEventListener('DOMContentLoaded', function() {
      document.getElementById('Theory').addEventListener('input', calculateTotalHours);
      document.getElementById('Tutorial').addEventListener('input', calculateTotalHours);
      document.getElementById('Practical').addEventListener('input', calculateTotalHours);
      document.getElementById('GTUTheory').addEventListener('input', calculateTotalMarks);
      document.getElementById('MID').addEventListener('input', calculateTotalMarks);
      document.getElementById('ESE').addEventListener('input', calculateTotalMarks);
      document.getElementById('PA').addEventListener('input', calculateTotalMarks);
    });
  </script>
</head>

<body>

  <?php include 'header_nav.php' ?>

  <main id="main" class="main">
    <div class="main-spacing">
      <div class="custom-breadcrumb">
        <div>
          <h3 style="font-weight: 600;">Subjects</h3>
          <div class="breadcrumb-link">
            <ul class="text-primary">
              <li>
                <a class="text-primary" href="#">Dashboard</a>
              </li>
              <li>
                <a class="text-primary" href="subjects.php">Subjects</a>
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
                  <div class="form-group col-md-2 mb-3">
                    <label class="mb-1" for="Department">Department</label>
                    <select class="form-control" id="Department" name="Department" required <?php echo $_SESSION["isSuperAdmin"] ? '' : 'disabled="true"'; ?>">
                      <option selected disabled>--Select--</option>
                      <?php
                      if ($_SESSION["isSuperAdmin"]) {
                        $sqlDegree = "SELECT * FROM `department`";
                        $Degrees = $conn->query($sqlDegree);
                        while ($row = mysqli_fetch_array($Degrees)) {
                          $selected = ($isEditMode && $subject['DepartmentID'] == $row['DepartmentID']) ? 'selected' : '';
                          echo "<option value='" . $row['DepartmentID'] . "' $selected>" . $row['DepartmentID'] . " - " . $row['DepartmentName'] . "</option>";
                        }
                      } else {
                        $sqlDegree = "SELECT * FROM `department` WHERE DepartmentID = '$DepartmentID'";
                        $Degrees = $conn->query($sqlDegree);
                        $row = mysqli_fetch_array($Degrees);
                        echo "<option value='" . $row['DepartmentID'] . "' selected disabled='true'>" . $row['DepartmentID'] . " - " . $row['DepartmentName'] . "</option>";
                      }
                      ?>
                    </select>
                  </div>
                  <div class=" form-group col-md-2 mb-3">
                    <label class="mb-1" for="Semester">Semester</label>
                    <select class="form-control" id="semester" name="Semester" required>
                      <option value="">--Select--</option>
                      <option value="1" <?php echo $isEditMode && $subject['Semester'] == 1 ? 'selected' : ''; ?>>1</option>
                      <option value="2" <?php echo $isEditMode && $subject['Semester'] == 2 ? 'selected' : ''; ?>>2</option>
                      <option value="3" <?php echo $isEditMode && $subject['Semester'] == 3 ? 'selected' : ''; ?>>3</option>
                      <option value="4" <?php echo $isEditMode && $subject['Semester'] == 4 ? 'selected' : ''; ?>>4</option>
                      <option value="5" <?php echo $isEditMode && $subject['Semester'] == 5 ? 'selected' : ''; ?>>5</option>
                      <option value="6" <?php echo $isEditMode && $subject['Semester'] == 6 ? 'selected' : ''; ?>>6</option>
                    </select>
                  </div>
                  <div class="form-group col-md-3 mb-3">
                    <label class="mb-1" for="SubjectCode">Code</label>
                    <input type="text" class="form-control" id="SubjectCode" name="SubjectCode" required value="<?php echo $isEditMode ? $subject['SubjectCode'] : ''; ?>">
                  </div>
                  <div class="form-group col-md-3 mb-3">
                    <label class="mb-1" for="SubjectName">Name</label>
                    <input type="text" class="form-control" id="SubjectName" name="SubjectName" required value="<?php echo $isEditMode ? $subject['SubjectName'] : ''; ?>">
                  </div>
                  <div class="form-group col-md-2 mb-3">
                    <label class="mb-1" for="Status">Status</label>
                    <select class="form-control" id="Status" name="Status" required>
                      <option value="active" <?php echo $isEditMode && $subject['Status'] == 'active' ? 'selected' : ''; ?>>Active</option>
                      <option value="inactive" <?php echo $isEditMode && $subject['Status'] == 'inactive' ? 'selected' : ''; ?>>Inactive</option>
                    </select>
                  </div>
                  <div class="form-group col-md-3 mb-3">
                    <label class="mb-1" for="Theory">Theory</label>
                    <input type="number" class="form-control" id="Theory" name="Theory" required value="<?php echo $isEditMode ? $subject['Theory'] : ''; ?>" min="0" max="100" onchange="handleNumberChange(event,0,100)">
                  </div>
                  <div class="form-group col-md-3 mb-3">
                    <label class="mb-1" for="Tutorial">Tutorial</label>
                    <input type="number" class="form-control" id="Tutorial" name="Tutorial" required value="<?php echo $isEditMode ? $subject['Tutorial'] : ''; ?>" min="0" max="100" onchange="handleNumberChange(event,0,100)">
                  </div>
                  <div class="form-group col-md-3 mb-3">
                    <label class="mb-1" for="Practical">Practical</label>
                    <input type="number" class="form-control" id="Practical" name="Practical" required value="<?php echo $isEditMode ? $subject['Practical'] : ''; ?>" min="0" max="100" onchange="handleNumberChange(event,0,100)">
                  </div>
                  <div class="form-group col-md-3 mb-3">
                    <label class="mb-1" for="TotalHours">Total Hours</label>
                    <input type="number" class="form-control" id="TotalHours" name="TotalHours" required readonly value="<?php echo $isEditMode ? $subject['TotalHours'] : ''; ?>"disabled required>
                  </div>
                  <div class="form-group col-md-3 mb-3">
                    <label class="mb-1" for="GTUTheory">GTU Theory</label>
                    <input type="number" class="form-control" id="GTUTheory" name="GTUTheory" required value="<?php echo $isEditMode ? $subject['GTUTheory'] : ''; ?>" min="0" max="100" onchange="handleNumberChange(event,0,100)">
                  </div>
                  <div class="form-group col-md-3 mb-3">
                    <label class="mb-1" for="MID">MID</label>
                    <input type="number" class="form-control" id="MID" name="MID" required value="<?php echo $isEditMode ? $subject['MID'] : ''; ?>" min="0" max="100" onchange="handleNumberChange(event,0,100)">
                  </div>
                  <div class="form-group col-md-3 mb-3">
                    <label class="mb-1" for="ESE">ESE</label>
                    <input type="number" class="form-control" id="ESE" name="ESE" required value="<?php echo $isEditMode ? $subject['ESE'] : ''; ?>" min="0" max="100" onchange="handleNumberChange(event,0,100)">
                  </div>
                  <div class="form-group col-md-3 mb-3">
                    <label class="mb-1" for="PA">PA</label>
                    <input type="number" class="form-control" id="PA" name="PA" required value="<?php echo $isEditMode ? $subject['PA'] : ''; ?>" min="0" max="100" onchange="handleNumberChange(event,0,100)">
                  </div>
                  <div class="form-group col-md-2 mb-3">
                    <label class="mb-1" for="Total">Total</label>
                    <input type="number" class="form-control" id="Total" name="Total" required readonly value="<?php echo $isEditMode ? $subject['Total'] : ''; ?>"disabled required>
                  </div>
                  <div class="form-group col-md-5 mb-3">
                    <label class="mb-1" for="SyllabusFile">Syllabus File</label>
                    <input type="file" class="form-control" id="SyllabusFile" onchange="handleFileChange(event, ['.pdf','.doc','.docx' ,'.ppt','.pptx'])" name="SyllabusFile" <?php echo !$isEditMode ? 'required' : ''; ?> accept=".pdf,.doc,.docx,.ppt,.pptx">
                    <?php if ($isEditMode && $subject['SyllabusFile']) { ?>
                      <p>Current file: <a href="<?php echo $subject['SyllabusFile']; ?>" target="_blank">View File</a></p>
                    <?php } ?>
                  </div>
                  <div class="form-group col-md-5 mb-3">
                    <label class="mb-1" for="Assignments">Assignments</label>
                    <input type="file" class="form-control" id="Assignments" onchange="handleFileChange(event, ['.pdf','.doc','.docx','.ppt','.pptx'])" name="Assignments" <?php echo !$isEditMode ? 'required' : ''; ?> accept=".pdf,.doc,.docx,.ppt,.pptx">
                    <?php if ($isEditMode && $subject['Assignments']) { ?>
                      <p>Current file: <a href="<?php echo $subject['Assignments']; ?>" target="_blank">View File</a></p>
                    <?php } ?>
                  </div>
                  <div class="d-flex justify-content-end">
                    <button type="submit" name="onsubmit" class="btn btn-primary"><?php echo $isEditMode ? 'Update Subject' : 'Add Subject'; ?></button>
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
  <script src="ajaxValidation.js"></script>
</body>

</html>