<?php
session_start();
if (!isset($_SESSION["FacultyID"]) || !$_SESSION["isDepartmentAdmin"]) {
  header("Location: login.php");
  exit();
}

require 'server_config.php';
require 'upload.php';
require './services/laboratory.service.php';

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$DepartmentID = $_SESSION["DepartmentID"];
$FacultyID = $_SESSION["FacultyID"];
$admin = $_SESSION["isAdmin"];

$laboratoryID = isset($_GET['ID']) ? $_GET['ID'] : null;
$isEditMode = $laboratoryID !== null;

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['onsubmit'])) {
  $LabName = htmlspecialchars($_POST["LabName"]);
  $Description = htmlspecialchars($_POST["Description"]);
  $status = $_POST["status"];
  $Location = htmlspecialchars($_POST["Location"]);
  $Subjects = htmlspecialchars($_POST["Subjects"]);
  $DepartmentID = $admin ? $_POST["DepartmentID"] : $_SESSION["DepartmentID"];
  $allowedTypesImages = [".jpg", ".jpeg", ".png"];

  $directory = "$DepartmentID/labphotos";

  if ($isEditMode) {
    $sql = "SELECT PhotoURL1, PhotoURL2, PhotoURL3, PhotoURL4, PhotoURL5 FROM laboratorydetails WHERE ID='$laboratoryID'";
    $result = $conn->query($sql);
    $existingFiles = $result->fetch_assoc();
  }

  try {
    $PhotoURL1 = handleFileUpload('PhotoURL1', $directory, $allowedTypesImages, $isEditMode ? $existingFiles['PhotoURL1'] : null);
    $PhotoURL2 = handleFileUpload('PhotoURL2', $directory, $allowedTypesImages, $isEditMode ? $existingFiles['PhotoURL2'] : null);
    $PhotoURL3 = handleFileUpload('PhotoURL3', $directory, $allowedTypesImages, $isEditMode ? $existingFiles['PhotoURL3'] : null);
    $PhotoURL4 = handleFileUpload('PhotoURL4', $directory, $allowedTypesImages, $isEditMode ? $existingFiles['PhotoURL4'] : null);
    $PhotoURL5 = handleFileUpload('PhotoURL5', $directory, $allowedTypesImages, $isEditMode ? $existingFiles['PhotoURL5'] : null);
  } catch (InvalidArgumentException $e) {
    echo "Invalid argument error: " . $e->getMessage();
  } catch (RuntimeException $e) {
    echo "Runtime error: " . $e->getMessage();
  }

  $laboratoriesService = new LaboratoryService();

  $data = [
    'LaboratoryName' => $LabName,
    'Description' => $Description,
    'PhotoURL1' => $PhotoURL1,
    'PhotoURL2' => $PhotoURL2,
    'PhotoURL3' => $PhotoURL3,
    'PhotoURL4' => $PhotoURL4,
    'PhotoURL5' => $PhotoURL5,
    'Location' => $Location,
    'Subjects' => $Subjects,
    'status' => isset($status) ? $status : '',
    'DepartmentID' => $DepartmentID
  ];

  if ($isEditMode) {
    $result = $laboratoriesService->update($laboratoryID, $data);
  } else {
    $result = $laboratoriesService->save($data);
  }

  if (isset($result)) {
    header("Location: LaboratoryDetails.php");
    exit();
  } else {
    echo "Error: " . $conn->error;
  }
}

if ($isEditMode) {
  $laboratory = (new LaboratoryService())->fetchOne($laboratoryID);
  if (!$laboratory) {
    echo "Laboratory not found.";
    exit();
  }
}

$departments = [];
$sql = "SELECT DepartmentID, DepartmentName FROM department";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
  while ($row = $result->fetch_assoc()) {
    $departments[] = $row;
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
          <h3 style="font-weight: 600;">Laboratory Details</h3>
          <div class="breadcrumb-link">
            <ul class="text-primary">
              <li><a class="text-primary" href="index.php">Dashboard</a></li>
              <li><a class="text-primary" href="laboratoryDetails.php">Laboratory Deatils</a></li>
              <li class="disabled text-secondary">ADD & EDIT</li>
            </ul>
          </div>
        </div>
      </div>

      <div class="d-flex justify-content-center">
        <div class="d-flex align-items-center w-100">
          <div class="card w-100">
            <div class="card-body mt-3 h-100 w-100">
              <form class="form" method="POST" enctype="multipart/form-data" onsubmit="return validateFileTypes()">
                <div class="row">
                  <div class="form-group col-md-6 mb-3">
                    <label class="mb-1" for="LabName">Lab Name</label>
                    <input type="text" class="form-control" id="LabName" name="LabName" required value="<?php echo $isEditMode && isset($laboratory['LaboratoryName']) ? $laboratory['LaboratoryName'] : ''; ?>">
                  </div>
                  <?php if ($admin == "true" || $admin == "yes" || $admin == 1 || $admin == "Yes" || $admin == "True") { ?>
                    <div class="form-group col-md-6 mb-3">
                      <label class="mb-1" for="DepartmentID">Department</label>
                      <select class="form-control" id="DepartmentID" name="DepartmentID" required>
                        <?php foreach ($departments as $department) { ?>
                          <option value="<?php echo $department['DepartmentID']; ?>" <?php echo $isEditMode && $laboratory['DepartmentID'] == $department['DepartmentID'] ? 'selected' : ''; ?>>
                            <?php echo $department['DepartmentName']; ?>
                          </option>
                        <?php } ?>
                      </select>
                    </div>
                  <?php } else { ?>
                    <input type="hidden" name="DepartmentID" value="<?php echo $_SESSION['DepartmentID']; ?>">
                  <?php } ?>

                  <div class="form-group col-md-6 mb-3">
                    <label class="mb-1" for="status">status</label>
                    <select class="form-control" id="status" name="status" required>
                      <option value="active" <?php echo $isEditMode && $laboratory['status'] == 'active' ? 'selected' : ''; ?>>Active</option>
                      <option value="inactive" <?php echo $isEditMode && $laboratory['status'] == 'inactive' ? 'selected' : ''; ?>>Inactive</option>
                    </select>
                  </div>
                  <div class="form-group col-md-12 mb-3">
                    <label class="mb-1" for="Subjects">Subjects</label>
                    <textarea class="form-control" id="Subjects" name="Subjects" required><?php echo $isEditMode ? $laboratory['Subjects'] : ''; ?></textarea>
                  </div>
                  <div class="form-group col-md-12 mb-3">
                    <label class="mb-1" for="Description">Description</label>
                    <textarea class="form-control" id="Description" name="Description" required><?php echo $isEditMode ? $laboratory['Description'] : ''; ?></textarea>
                  </div>
                  <div class="form-group col-md-12 mb-3">
                    <label class="mb-1" for="Location">Location</label>
                    <textarea class="form-control" id="Location" name="Location" required><?php echo $isEditMode ? $laboratory['Location'] : ''; ?></textarea>
                  </div>

                  <div class="form-group col-md-6 mb-3">
                    <label class="mb-1" for="PhotoURL1">Photo 1</label>
                    <input type="file" class="form-control" id="PhotoURL1" name="PhotoURL1" <?php echo !$isEditMode ? 'required' : ''; ?> accept=".jpg,.jpeg,.png,.gif">
                    <?php if ($isEditMode && $laboratory['PhotoURL1']) { ?>
                      <p>Current file: <a href="<?php echo $laboratory['PhotoURL1']; ?>" target="_blank">View File</a></p>
                    <?php } ?>
                  </div>
                  <div class="form-group col-md-6 mb-3">
                    <label class="mb-1" for="PhotoURL2">Photo 2</label>
                    <input type="file" class="form-control" id="PhotoURL2" name="PhotoURL2" <?php echo !$isEditMode ?: ''; ?> accept=".jpg,.jpeg,.png,.gif">
                    <?php if ($isEditMode && $laboratory['PhotoURL2']) { ?>
                      <p>Current file: <a href="<?php echo $laboratory['PhotoURL2']; ?>" target="_blank">View File</a></p>
                    <?php } ?>
                  </div>
                  <div class="form-group col-md-6 mb-3">
                    <label class="mb-1" for="PhotoURL3">Photo 3</label>
                    <input type="file" class="form-control" id="PhotoURL3" name="PhotoURL3" <?php echo !$isEditMode ?: ''; ?> accept=".jpg,.jpeg,.png,.gif">
                    <?php if ($isEditMode && $laboratory['PhotoURL3']) { ?>
                      <p>Current file: <a href="<?php echo $laboratory['PhotoURL3']; ?>" target="_blank">View File</a></p>
                    <?php } ?>
                  </div>
                  <div class="form-group col-md-6 mb-3">
                    <label class="mb-1" for="PhotoURL4">Photo 4</label>
                    <input type="file" class="form-control" id="PhotoURL4" name="PhotoURL4" <?php echo !$isEditMode ?: ''; ?> accept=".jpg,.jpeg,.png,.gif">
                    <?php if ($isEditMode && $laboratory['PhotoURL4']) { ?>
                      <p>Current file: <a href="<?php echo $laboratory['PhotoURL4']; ?>" target="_blank">View File</a></p>
                    <?php } ?>
                  </div>
                  <div class="form-group col-md-6 mb-3">
                    <label class="mb-1" for="PhotoURL5">Photo 5</label>
                    <input type="file" class="form-control" id="PhotoURL5" name="PhotoURL5" <?php echo !$isEditMode ?: ''; ?> accept=".jpg,.jpeg,.png,.gif">
                    <?php if ($isEditMode && $laboratory['PhotoURL5']) { ?>
                      <p>Current file: <a href="<?php echo $laboratory['PhotoURL5']; ?>" target="_blank">View File</a></p>
                    <?php } ?>
                  </div>
                  <div class="d-flex justify-content-end">
                    <button type="submit" name="onsubmit" class="btn btn-primary"><?php echo $isEditMode ? 'Update Laboratory' : 'Add Laboratory'; ?></button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>

  <!-- Modal for invalid file types -->
  <div class="modal fade" id="invalidFileModal" tabindex="-1" aria-labelledby="invalidFileModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="invalidFileModalLabel">Invalid File Types</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <p id="invalidFileMessage"></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
  <script src="assets/js/main.js"></script>
  <script>
    function validateFileTypes() {
      const allowedTypes = ['.jpg', '.jpeg', '.png', '.gif'];
      const fileInputs = document.querySelectorAll('input[type="file"]');
      let invalidFiles = [];

      for (const fileInput of fileInputs) {
        if (fileInput.files.length > 0) {
          const fileName = fileInput.files[0].name;
          const fileExtension = fileName.substring(fileName.lastIndexOf('.')).toLowerCase();
          if (!allowedTypes.includes(fileExtension)) {
            invalidFiles.push(fileName);
          }
        }
      }

      if (invalidFiles.length > 0) {
        document.getElementById('invalidFileMessage').innerText = `Invalid file types for the following files: \n${invalidFiles.join('\n')}\nOnly .jpg, .jpeg, .png, and .gif are allowed.`;
        const invalidFileModal = new bootstrap.Modal(document.getElementById('invalidFileModal'));
        invalidFileModal.show();
        return false;
      }

      return true;
    }
  </script>
</body>

</html>