<?php
session_start();
if (!isset($_SESSION["FacultyID"]) || !($_SESSION["isDepartmentAdmin"] || $_SESSION["isSuperAdmin"])) {
  header("Location: login.php");
  exit();
}

require 'server_config.php';
require 'upload.php';
require_once './services/gtu_question_paper.service.php';

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$DepartmentID = $_SESSION["DepartmentID"];
$FacultyID = $_SESSION["FacultyID"];

$notification = -1;
$paperID = isset($_GET['id']) ? $_GET['id'] : null;
$isEditMode = $paperID !== null;

$sqlSubjects = "SELECT SubjectCode, SubjectName FROM subjectdetails WHERE DepartmentID = '$DepartmentID'";
$resultSubjects = $conn->query($sqlSubjects);

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['onsubmit'])) {
  $Department = isset($_POST["Department"]) ? $_POST["Department"] : $DepartmentID;
  $SubjectCode = $_POST["SubjectCode"];
  $Title = $_POST["Title"];

  if ($isEditMode) {
    $sql = "SELECT GTUPaperFileName FROM subjectwisegtupapers WHERE ID='$paperID'";
    $result = $conn->query($sql);
    $existingFiles = $result->fetch_assoc();
  }

  try {
    $GTUPaperFileName = handleFileUpload('GTUPaperFileName', "gtu_papers/", [".pdf", ".doc", ".docx", ".ppt", ".pptx"], $isEditMode ? $existingFiles['GTUPaperFileName'] : null);
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

  $paperService  = new GtuQuestionPaperService();

  $data = ['Title' => $Title, 'SubjectCode' => $SubjectCode, 'GTUPaperFileName' => $GTUPaperFileName, 'DepartmentID' => $Department];

  if ($isEditMode) {
    $result = $paperService->update($paperID, $data);
  } else {
    $result = $paperService->save($data);
  }

  if (isset($result)) {
    header("Location: gtu_question_paper.php");
    exit();
  } else {
    $notification = array(
      "message" => "Error: " . $sql . "<br>" . $conn->error,
      "type" => "danger",
    );
  }
}

if ($isEditMode) {
  $paper = (new GtuQuestionPaperService())->fetchOne($paperID);
  if (!$paper) {
    $notification = array(
      "message" => "Paper not found.",
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
          <h3 style="font-weight: 600;">GTU Question Paper</h3>
          <div class="breadcrumb-link">
            <ul class="text-primary">
              <li>
                <a class="text-primary" href="#">Dashboard</a>
              </li>
              <li>
                <a class="text-primary" href="gtu_question_paper.php">GTU Question Paper</a>
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
                  <div class="form-group col-md-6 mb-3">
                    <label class="mb-1" for="Department">Department</label>
                    <select class="form-control" id="Department" name="Department" required onchange="fetchSubjects(this.value)">
                      <option selected disabled>--Select--</option>
                      <?php
                      if ($_SESSION["isSuperAdmin"]) {
                        $sqlDegree = "SELECT * FROM `department`";
                        $Degrees = $conn->query($sqlDegree);
                        while ($row = mysqli_fetch_array($Degrees)) {
                          $selected = ($isEditMode && $paper['DepartmentID'] == $row['DepartmentID']) ? 'selected' : '';
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
                  <div class="form-group col-md-6 mb-3">
                    <label class="mb-1" for="SubjectCode">Subject</label>
                    <select class="form-control" id="SubjectCode" name="SubjectCode" required>
                      <option value="">Select Subject</option>
                      <!-- Options filled dynamically by JavaScript -->
                    </select>
                  </div>
                  <div class="form-group col-md-6 mb-3">
                    <label class="mb-1" for="Title">Paper Title</label>
                    <input type="text" class="form-control" id="Title" name="Title" required value="<?php echo $isEditMode && isset($paper['Title']) ? $paper['Title'] : ''; ?>">
                  </div>
                  <div class="form-group col-md-6 mb-3">
                    <label class="mb-1" for="GTUPaperFileName">File</label>
                    <input type="file" class="form-control" id="GTUPaperFileName" name="GTUPaperFileName" <?php echo !$isEditMode ? 'required' : ''; ?> accept=".pdf,.doc,.docx,.ppt,.pptx" onchange="handleFileChange(event, ['.pdf','.doc','.docx','.ppt','.pptx'])">
                    <?php if ($isEditMode && isset($paper['GTUPaperFileName']) && $paper['GTUPaperFileName']) { ?>
                      <p>Current file: <a href="<?php echo $paper['GTUPaperFileName']; ?>" target="_blank">View File</a></p>
                    <?php } ?>
                  </div>
                </div>
                <div class="d-flex justify-content-end">
                  <button type="submit" name="onsubt" class="btn btn-primary"><?php echo $isEditMode ? 'Update Paper' : 'Add Paper'; ?></button>
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
            $('#SubjectCode').val('<?php echo $paper['SubjectCode']; ?>');
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
        fetchSubjects('<?php echo $paper['DepartmentID']; ?>');
      <?php } ?>
    });
  </script>

</body>

</html>