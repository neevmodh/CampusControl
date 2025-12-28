<?php
session_start();
if (!isset($_SESSION["FacultyID"]) || !($_SESSION["isDepartmentAdmin"] || $_SESSION["isSuperAdmin"])) {
  header("Location: login.php");
  exit();
}

require 'server_config.php';
require 'upload.php';
require_once './services/subject_material.service.php';

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$DepartmentID = $_SESSION["DepartmentID"];
$FacultyID = $_SESSION["FacultyID"];

$materialID = isset($_GET['id']) ? $_GET['id'] : null;
$isEditMode = $materialID !== null;

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['onsubmit'])) {
  $Department = isset($_POST["Department"]) ? $_POST["Department"] : $DepartmentID;
  $SubjectCode = $_POST["SubjectCode"];
  $Unit = $_POST["Unit"];
  $Title = $_POST["Title"];

  if ($isEditMode) {
    $sql = "SELECT UnitFile, AssignmentFile FROM subjectunitdetails WHERE ID='$materialID'";
    $result = $conn->query($sql);
    $existingFiles = $result->fetch_assoc();
  }

  try {
    $UnitFile = handleFileUpload('UnitFile', "unit_materials/", [".pdf", ".doc", ".docx", ".ppt", ".pptx"], $isEditMode ? $existingFiles['UnitFile'] : null);
    $AssignmentFile = handleFileUpload('AssignmentFile', "assignment_materials/", [".pdf", ".doc", ".docx", ".ppt", ".pptx"], $isEditMode ? $existingFiles['AssignmentFile'] : null);
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
    'DepartmentID' => $Department,
    'SubjectCode' => $SubjectCode,
    'Unit' => $Unit,
    'Title' => $Title,
    'UnitFile' => $UnitFile,
    'AssignmentFile' => $AssignmentFile
  ];

  if ($isEditMode) {
    $result = $subjectMaterialService->update($materialID, $data);
  } else {
    $result = $subjectMaterialService->save($data);
  }

  if (isset($result)) {
    header("Location: subject_material.php");
    exit();
  } else {
    $notification = array(
      "message" => "Error: " . $sql . "<br>" . $conn->error,
      "type" => "danger",
    );
  }
}

if ($isEditMode) {
  $material = (new SubjectMaterialService())->fetchOne($materialID);
  if (!$material) {
    $notification = array(
      "message" => "Subject Material not found.",
      "type" => "danger",
    );
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
          <h3 style="font-weight: 600;">Subject Material</h3>
          <div class="breadcrumb-link">
            <ul class="text-primary">
              <li>
                <a class="text-primary" href="#">Dashboard</a>
              </li>
              <li>
                <a class="text-primary" href="subject_material.php">Subject Material</a>
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
                    <select class="form-control" id="Department" name="Department" required onchange="fetchSubjects(this.value)">
                      <option selected disabled>--Select--</option>
                      <?php
                      if ($_SESSION["isSuperAdmin"]) {
                        $sqlDegree = "SELECT * FROM `department`";
                        $Degrees = $conn->query($sqlDegree);
                        while ($row = mysqli_fetch_array($Degrees)) {
                          $selected = ($isEditMode && $material['DepartmentID'] == $row['DepartmentID']) ? 'selected' : '';
                          echo "<option value='" . $row['DepartmentID'] . "' $selected>" . $row['DepartmentID'] . " - " . $row['DepartmentName'] . "</option>";
                        }
                      } else {
                        $sqlDegree = "SELECT * FROM `department` WHERE DepartmentID = '$DepartmentID'";
                        $Degrees = $conn->query($sqlDegree);
                        $row = mysqli_fetch_array($Degrees);
                        echo "<option value='" . $row['DepartmentID'] . "' selected>" . $row['DepartmentID'] . " - " . $row['DepartmentName'] . "</option>";
                      }
                      ?>
                    </select>
                  </div>
                  <div class="form-group col-md-4 mb-3">
                    <label class="mb-1" for="SubjectCode">Subject</label>
                    <select class="form-control" id="SubjectCode" name="SubjectCode" required>
                      <option value="">Select Subject</option>
                      <!-- Options filled dynamically by JavaScript -->
                    </select>
                  </div>
                  <div class="form-group col-md-4 mb-3">
                    <label class="mb-1" for="Unit">Unit</label>
                    <input type="number" class="form-control" id="Unit" name="Unit" required value="<?php echo $isEditMode ? $material['Unit'] : ''; ?>" min="1" max="10" onchange="handleNumberChange(event,1,10)">
                  </div>
                  <div class="form-group col-md-4 mb-3">
                    <label class="mb-1" for="Title">Title</label>
                    <input type="text" class="form-control" id="Title" name="Title" required value="<?php echo $isEditMode ? $material['Title'] : ''; ?>">
                  </div>
                  <div class="form-group col-md-4 mb-3">
                    <label class="mb-1" for="UnitFile">Unit File</label>
                    <input type="file" class="form-control" id="UnitFile" name="UnitFile" <?php echo !$isEditMode ? 'required' : ''; ?> accept=".pdf,.doc,.docx,.ppt,.pptx" onchange="handleFileChange(event, ['.pdf','.doc','.docx','.ppt','.pptx'])">
                    <?php if ($isEditMode && $material['UnitFile']) { ?>
                      <p>Current file: <a href="<?php echo $material['UnitFile']; ?>" target="_blank">View File</a></p>
                    <?php } ?>
                  </div>
                  <div class="form-group col-md-4 mb-3">
                    <label class="mb-1" for="AssignmentFile">Assignment File</label>
                    <input type="file" class="form-control" id="AssignmentFile" name="AssignmentFile" <?php echo !$isEditMode ? 'required' : ''; ?> accept=".pdf,.doc,.docx,.ppt,.pptx" onchange="handleFileChange(event, ['.pdf','.doc','.docx','.ppt','.pptx'])">
                    <?php if ($isEditMode && $material['AssignmentFile']) { ?>
                      <p>Current file: <a href="<?php echo $material['AssignmentFile']; ?>" target="_blank">View File</a></p>
                    <?php } ?>
                  </div>
                </div>
                <div class="d-flex justify-content-end">
                  <button type="submit" name="onsubmit" class="btn btn-primary"><?php echo $isEditMode ? 'Update Material' : 'Add Material'; ?></button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>

  <?php include "footer.php" ?>

  <script src="ajaxValidation.js"></script>
  <script>
    function fetchSubjects(departmentId) {
      $.ajax({
        url: 'fetch_subjects.php',
        method: 'GET',
        data: {
          departmentId: departmentId
        },
        success: function(response) {
          $('#SubjectCode').html(response);
          <?php if ($isEditMode) { ?>
            $('#SubjectCode').val('<?php echo $material['SubjectCode']; ?>');
          <?php } ?>
        },
        error: function(xhr, status, error) {
          console.error('Error fetching subjects:', error);
        }
      });
    }

    $(document).ready(function() {
      $('#Department').change(function() {
        fetchSubjects($(this).val());
      });

      fetchSubjects($('#Department').val());

      $('#Department').prop('disabled', <?php echo $_SESSION["isSuperAdmin"] ? 'false' : 'true'; ?>);

      <?php if ($isEditMode) { ?>
        fetchSubjects('<?php echo $material['DepartmentID']; ?>');
      <?php } ?>
    });
  </script>
</body>

</html>