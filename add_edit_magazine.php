<?php
session_start();
if (!isset($_SESSION["FacultyID"]) || !($_SESSION["isDepartmentAdmin"] || $_SESSION["isSuperAdmin"])) {
  header("Location: login.php");
  exit();
}

require 'server_config.php';
require 'upload.php';
require './services/magazine.service.php';

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$DepartmentID = $_SESSION["DepartmentID"];
$FacultyID = $_SESSION["FacultyID"];

$id = isset($_GET['id']) ? $_GET['id'] : null;
$isEditMode = $id !== null;

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['onsubmit'])) {
  $Department = isset($_POST["Department"]) ? $_POST["Department"] : $DepartmentID;
  $Name = $_POST["Name"];
  $LaunchON = $_POST["LaunchON"];
  $launchDate = new DateTime($LaunchON);
  $LaunchONFormatted = $launchDate->format('F Y');


  if ($isEditMode) {
    $sql = "SELECT FileName FROM dept_magazine WHERE ID='$id'";
    $result = $conn->query($sql);
    $existingFiles = $result->fetch_assoc();
  }

  try {
    $File = handleFileUpload('FileName', "magazine/", [".pdf"], $isEditMode ? $existingFiles['FileName'] : null);
  } catch (InvalidArgumentException $e) {
    echo "Invalid argument error: " . $e->getMessage();
  } catch (RuntimeException $e) {
    echo "Runtime error: " . $e->getMessage();
  }

  $service = new MagazineService();

  $data = [
    'DepartmentID' => $Department,
    'Name' => $Name,
    'LaunchON' => $LaunchONFormatted,
    'FileName' => $File,
  ];

  if ($isEditMode) {
    $result = $service->update($id, $data);
  } else {
    $result = $service->save($data);
  }

  if (isset($result)) {
    header("Location: magazine.php");
    exit();
  } else {
    echo "Error: " . $conn->error;
  }
}

if ($isEditMode) {
  $magazine = (new MagazineService())->fetchOne($id);
  if (!$magazine) {
    echo "Magazine not found.";
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
          <h3 style="font-weight: 600;">Magazine</h3>
          <div class="breadcrumb-link">
            <ul class="text-primary">
              <li>
                <a class="text-primary" href="#">Dashboard</a>
              </li>
              <li>
                <a class="text-primary" href="magazine.php">Magazine</a>
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
                    <select class="form-control" id="Department" name="Department" required <?php echo $_SESSION["isSuperAdmin"] ? '' : 'disabled="true"'; ?>">
                      <option selected disabled>--Select--</option>
                      <?php
                      if ($_SESSION["isSuperAdmin"]) {
                        $sqlDegree = "SELECT * FROM `department`";
                        $Degrees = $conn->query($sqlDegree);
                        while ($row = mysqli_fetch_array($Degrees)) {
                          $selected = ($isEditMode && $magazine['DepartmentID'] == $row['DepartmentID']) ? 'selected' : '';
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
                  <div class="form-group col-md-6 mb-3">
                    <label class="mb-1" for="Name">Name</label>
                    <input type="text" class="form-control" id="Name" name="Name" required value="<?php echo $isEditMode ? $magazine['Name'] : ''; ?>">
                  </div>
                  <div class="form-group col-md-6 mb-3">
                    <label class="mb-1" for="LaunchON">Launch On</label>
                    <input type="month" class="form-control" id="LaunchON" name="LaunchON" required value="<?php echo $isEditMode ? date('Y-m', strtotime($magazine['LaunchON'])) : ''; ?>">
                  </div>
                  <div class="form-group col-md-6 mb-3">
                    <label class="mb-1" for="FileName">File</label>
                    <input type="file" class="form-control" id="FileName" onchange="handleFileChange(event, ['.pdf'])" name="FileName" <?php echo !$isEditMode ? 'required' : ''; ?> accept=".pdf">
                    <?php if ($isEditMode && $magazine['FileName']) { ?>
                      <p>Current file: <a href="<?php echo $magazine['FileName']; ?>" target="_blank">View File</a></p>
                    <?php } ?>
                  </div>
                  <div class="d-flex justify-content-end">
                    <button type="submit" name="onsubmit" class="btn btn-primary"><?php echo $isEditMode ? 'Update Magazine' : 'Add Magazine'; ?></button>
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