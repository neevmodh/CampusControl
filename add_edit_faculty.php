<?php
session_start();
if (!isset($_SESSION["FacultyID"]) || !($_SESSION["isSuperAdmin"])) {
  header("Location: login.php");
  exit();
}

require 'server_config.php';
require 'upload.php';
require_once './services/faculty.service.php';

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$DepartmentID = $_SESSION["DepartmentID"];
$FacultyID = $_SESSION["FacultyID"];

$id = isset($_GET['id']) ? $_GET['id'] : null;
$isEditMode = $id !== null;

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['onsubmit'])) {
  $Department = isset($_POST["Department"]) ? $_POST["Department"] : $DepartmentID;
  $Prefix = $_POST['Prefix'];
  $FirstName = $_POST["FirstName"];
  $LastName = $_POST["LastName"];
  $Email = $_POST["Email"];
  $ProfessionalEmail = $_POST["ProfessionalEmail"];
  $ContactNo = $_POST["ContactNo"];
  $UserName = $_POST["UserName"];
  $JoiningDate = $_POST["JoiningDate"];
  $InstituteJoiningDate = $_POST["InstituteJoiningDate"];
  $MaxEducationQualification = $_POST["MaxEducationQualification"];
  $AreaofIntrest = $_POST["AreaofIntrest"];
  $GTUStaffID = $_POST["GTUStaffID"];
  $TeachingExp = $_POST["TeachingExp"];
  $IndustrialExp = $_POST["IndustrialExp"];
  $TotalExp = $TeachingExp + $IndustrialExp;
  $FacultyStatus = $_POST['FacultyStatus'];
  $isDAdmin = isset($_POST["isDAdmin"]) ? "Yes" : "No";
  $isAdmin = isset($_POST["isAdmin"]) ? "Yes" : "No";

  $allowedTypesAssignments = ['.jpg', '.jpeg', '.png', '.JPG', '.JPEG', '.PNG'];

  if ($isEditMode) {
    $sql = "SELECT Photo FROM faculty WHERE FacultyID='$id'";
    $result = $conn->query($sql);
    $existingFiles = $result->fetch_assoc();
  }

  try {
    $Photo = handleFileUpload('Photo', "faculty_profile/", $allowedTypesAssignments, $isEditMode ? $existingFiles['Photo'] : null);
  } catch (InvalidArgumentException $e) {
    echo "Invalid argument error: " . $e->getMessage();
  } catch (RuntimeException $e) {
    echo "Runtime error: " . $e->getMessage();
  }

  $facultyService = new FacultyService();

  $data = [
    'DepartmentID' => $Department,
    'Prefix' => $Prefix,
    'FirstName' => $FirstName,
    'LastName' => $LastName,
    'Email' => $Email,
    'ProfessionalEmail' => $ProfessionalEmail,
    'ContactNo' => $ContactNo,
    'UserName' => $UserName,
    'JoiningDate' => $JoiningDate,
    'InstituteJoiningDate' => $InstituteJoiningDate,
    'MaxEducationQualification' => $MaxEducationQualification,
    'AreaofIntrest' => $AreaofIntrest,
    'GTUStaffID' => $GTUStaffID,
    'TeachingExp' => $TeachingExp,
    'IndustrialExp' => $IndustrialExp,
    'TotalExp' => $TotalExp,
    'FacultyStatus' => $FacultyStatus,
    'isDAdmin' => $isDAdmin,
    'isAdmin' => $isAdmin,
    'Photo' => $Photo
  ];

  if ($isEditMode) {
    $result = $facultyService->update($id, $data);
  } else {
    $result = $facultyService->save($data);
  }

  if (isset($result)) {
    header("Location: faculty.php");
    exit();
  } else {
    echo "Error: " . $conn->error;
  }
}

if ($isEditMode) {
  $faculty = (new FacultyService())->fetchOne($id);
  if (!$faculty) {
    echo "Faculty not found.";
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
    function calculateTotalExp() {
      const TeachingExp = parseInt(document.getElementById('TeachingExp').value) || 0;
      const IndustrialExp = parseInt(document.getElementById('IndustrialExp').value) || 0;
      const total = TeachingExp + IndustrialExp;
      console.log(TotalExp);
      document.getElementById('TotalExp').value = total;
    }

    document.addEventListener('DOMContentLoaded', function() {
      console.log("SDfsdf");
      document.getElementById('TeachingExp').addEventListener('input', calculateTotalExp);
      document.getElementById('IndustrialExp').addEventListener('input', calculateTotalExp);
    });
  </script>
</head>

<body>

  <?php include 'header_nav.php' ?>

  <main id="main" class="main">
    <div class="main-spacing">
      <div class="custom-breadcrumb">
        <div>
          <h3 style="font-weight: 600;">Faculty</h3>
          <div class="breadcrumb-link">
            <ul class="text-primary">
              <li>
                <a class="text-primary" href="#">Dashboard</a>
              </li>
              <li>
                <a class="text-primary" href="faculty.php">Faculty</a>
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
                  <div class="form-group col-md-3 mb-3">
                    <label class="mb-1" for="Department">Department</label>
                    <select class="form-control" id="Department" name="Department" required <?php echo $_SESSION["isSuperAdmin"] ? '' : 'disabled="true"'; ?>">
                      <option selected disabled>--Select--</option>
                      <?php
                      if ($_SESSION["isSuperAdmin"]) {
                        $sqlDegree = "SELECT * FROM `department`";
                        $Degrees = $conn->query($sqlDegree);
                        while ($row = mysqli_fetch_array($Degrees)) {
                          $selected = ($isEditMode && $faculty['DepartmentID'] == $row['DepartmentID']) ? 'selected' : '';
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
                  <div class="form-group col-md-3 mb-3">
                    <label class="mb-1" for="Prefix">Prefix</label>
                    <input type="text" class="form-control" id="Prefix" name="Prefix" required value="<?php echo $isEditMode ? $faculty['Prefix'] : ''; ?>">
                  </div>
                  <div class="form-group col-md-3 mb-3">
                    <label class="mb-1" for="FirstName">First Name</label>
                    <input type="text" class="form-control" id="FirstName" name="FirstName" required value="<?php echo $isEditMode ? $faculty['FirstName'] : ''; ?>">
                  </div>
                  <div class="form-group col-md-3 mb-3">
                    <label class="mb-1" for="LastName">Last Name</label>
                    <input type="text" class="form-control" id="LastName" name="LastName" required value="<?php echo $isEditMode ? $faculty['LastName'] : ''; ?>">
                  </div>
                  <div class="form-group col-md-3 mb-3">
                    <label class="mb-1" for="Email">Email</label>
                    <input type="email" class="form-control" id="Email" name="Email" required value="<?php echo $isEditMode ? $faculty['Email'] : ''; ?>">
                  </div>
                  <div class="form-group col-md-3 mb-3">
                    <label class="mb-1" for="ProfessionalEmail">Professional Email</label>
                    <input type="email" class="form-control" id="ProfessionalEmail" name="ProfessionalEmail" required value="<?php echo $isEditMode ? $faculty['ProfessionalEmail'] : ''; ?>">
                  </div>
                  <div class="form-group col-md-3 mb-3">
                    <label class="mb-1" for="ContactNo">Contact No.</label>
                    <input type="number" class="form-control" id="ContactNo" maxlength="10" name="ContactNo" required value="<?php echo $isEditMode ? $faculty['ContactNo'] : ''; ?>">
                  </div>
                  <div class="form-group col-md-3 mb-3">
                    <label class="mb-1" for="UserName">User Name</label>
                    <input type="text" class="form-control" id="UserName" name="UserName" required value="<?php echo $isEditMode ? $faculty['UserName'] : ''; ?>">
                  </div>
                  <div class="form-group col-md-3 mb-3">
                    <label class="mb-1" for="JoiningDate">Joining Date</label>
                    <input type="date" class="form-control" id="JoiningDate" name="JoiningDate" required value="<?php echo $isEditMode ? $faculty['JoiningDate'] : ''; ?>">
                  </div>
                  <div class="form-group col-md-3 mb-3">
                    <label class="mb-1" for="InstituteJoiningDate">Institute Joining Date</label>
                    <input type="date" class="form-control" id="InstituteJoiningDate" name="InstituteJoiningDate" required value="<?php echo $isEditMode ? $faculty['InstituteJoiningDate'] : ''; ?>">
                  </div>
                  <div class="form-group col-md-3 mb-3">
                    <label class="mb-1" for="MaxEducationQualification">Max. Qualification</label>
                    <input type="text" class="form-control" id="MaxEducationQualification" name="MaxEducationQualification" required value="<?php echo $isEditMode ? $faculty['MaxEducationQualification'] : ''; ?>">
                  </div>
                  <div class="form-group col-md-3 mb-3">
                    <label class="mb-1" for="AreaofIntrest">Area of Interest</label>
                    <input type="text" class="form-control" id="AreaofIntrest" name="AreaofIntrest" required value="<?php echo $isEditMode ? $faculty['AreaofIntrest'] : ''; ?>">
                  </div>
                  <div class="form-group col-md-3 mb-3">
                    <label class="mb-1" for="GTUStaffID">GTU Staff ID</label>
                    <input type="number" class="form-control" id="GTUStaffID" name="GTUStaffID" required value="<?php echo $isEditMode ? $faculty['GTUStaffID'] : ''; ?>">
                  </div>
                  <div class="form-group col-md-3 mb-3">
                    <label class="mb-1" for="TeachingExp">Teaching Experience</label>
                    <input type="number" class="form-control" id="TeachingExp" name="TeachingExp" required value="<?php echo $isEditMode ? $faculty['TeachingExp'] : ''; ?>">
                  </div>
                  <div class="form-group col-md-3 mb-3">
                    <label class="mb-1" for="IndustrialExp">Industrial Experience</label>
                    <input type="number" class="form-control" id="IndustrialExp" name="IndustrialExp" required value="<?php echo $isEditMode ? $faculty['IndustrialExp'] : ''; ?>">
                  </div>
                  <div class="form-group col-md-3 mb-3">
                    <label class="mb-1" for="TotalExp">Total Experience</label>
                    <input type="number" class="form-control" id="TotalExp" name="TotalExp" required readonly value="<?php echo $isEditMode ? $faculty['TotalExp'] : ''; ?>" disabled required>
                  </div>
                  <div class="form-group col-md-3 mb-3">
                    <label class="mb-1" for="Photo">Profile Photo</label>
                    <input type="file" class="form-control" id="Photo" name="Photo" accept=".jpg , .jpeg , .png , .JPG , .JPEG , .PNG" onchange="handleFileChange(event, ['.jpg', '.jpeg', '.png', '.JPG', '.JPEG', '.PNG'])"">
                  </div>
                  <div class=" form-group col-md-3 mb-3">
                    <label class="mb-1" for="FacultyStatus">Status</label>
                    <select class="form-control" id="FacultyStatus" name="FacultyStatus" required>
                      <option value="Active" <?php echo $isEditMode && $faculty['FacultyStatus'] == 'Active' ? 'selected' : ''; ?>>Active</option>
                      <option value="Transfer" <?php echo $isEditMode && $faculty['FacultyStatus'] == 'Transfer' ? 'selected' : ''; ?>>Transfer</option>
                      <option value="Inactive" <?php echo $isEditMode && $faculty['FacultyStatus'] == 'Inactive' ? 'selected' : ''; ?>>Inactive</option>
                    </select>
                  </div>
                  <div class="form-group col-md-3 mb-3">
                    <div style="display: flex; height: 100%; align-items: center; gap: 10px; text-align: center;">
                      <label class="mb-1" for="isDAdmin">Department Admin ?</label>
                      <input class="form-check-input is-invalid" <?php echo ($isEditMode && ($faculty['isDAdmin'] === "Yes" || $faculty['isDAdmin'] === "yes" || $faculty['isDAdmin'] === "true")) ? 'checked' : ''; ?> name=" isDAdmin" type="checkbox" id="invalidCheckNew">
                    </div>
                  </div>
                  <div class="form-group col-md-3 mb-3">
                    <div style="display: flex; height: 100%; align-items: center; gap: 10px; text-align: center;">
                      <label class="mb-1" for="isAdmin">Super Admin ?</label>
                      <input class="form-check-input is-invalid" <?php echo ($isEditMode && ($faculty['isAdmin'] === "Yes" || $faculty['isAdmin'] === "yes" || $faculty['isAdmin'] === "true")) ? 'checked' : ''; ?> name="isAdmin" type="checkbox" id="invalidCheckNew">
                    </div>
                  </div>
                  <div class="d-flex justify-content-end">
                    <button type="submit" name="onsubmt" class="btn btn-primary"><?php echo $isEditMode ? 'Update Faculty' : 'Add Faculty'; ?></button>
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