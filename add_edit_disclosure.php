<?php
session_start();
if (!isset($_SESSION["FacultyID"]) || !($_SESSION["isSuperAdmin"])) {
  header("Location: login.php");
  exit();
}

require 'server_config.php';
require 'upload.php';
require './services/disclosure.service.php';

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$DepartmentID = $_SESSION["DepartmentID"];
$FacultyID = $_SESSION["FacultyID"];

$disclosureID = isset($_GET['id']) ? $_GET['id'] : null;
$isEditMode = $disclosureID !== null;

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['onsubmit'])) {
  $Name = $_POST["name"];

  if ($isEditMode) {
    $sql = "SELECT file FROM disclosure WHERE id='$disclosureID'";
    $result = $conn->query($sql);
    $existingFiles = $result->fetch_assoc();
  }

  try {
    $File = handleFileUpload('file', "disclosure/", [".pdf"], $isEditMode ? $existingFiles['file'] : null);
  } catch (InvalidArgumentException $e) {
    echo "Invalid argument error: " . $e->getMessage();
  } catch (RuntimeException $e) {
    echo "Runtime error: " . $e->getMessage();
  }

  $disclosureService = new DisclosureService();

  $data = [
    'name' => $Name,
    'file' => $File,
  ];

  if ($isEditMode) {
    $result = $disclosureService->update($disclosureID, $data);
  } else {
    $result = $disclosureService->save($data);
  }

  if (isset($result)) {
    header("Location: disclosure.php");
    exit();
  } else {
    echo "Error: " . $conn->error;
  }
}

if ($isEditMode) {
  $disclosure = (new DisclosureService())->fetchOne($disclosureID);
  if (!$disclosure) {
    echo "Disclosure not found.";
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
          <h3 style="font-weight: 600;">Disclosure</h3>
          <div class="breadcrumb-link">
            <ul class="text-primary">
              <li>
                <a class="text-primary" href="#">Dashboard</a>
              </li>
              <li>
                <a class="text-primary" href="disclosure.php">Disclosure</a>
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
                    <label class="mb-1" for="name">Name</label>
                    <input type="text" class="form-control" id="name" name="name" required value="<?php echo $isEditMode ? $disclosure['name'] : ''; ?>">
                  </div>
                  <div class="form-group col-md-6 mb-3">
                    <label class="mb-1" for="file">File</label>
                    <input type="file" class="form-control" id="file" onchange="handleFileChange(event, ['.pdf'])" name="file" <?php echo !$isEditMode ? 'required' : ''; ?> accept=".pdf">
                    <?php if ($isEditMode && $disclosure['file']) { ?>
                      <p>Current file: <a href="<?php echo $disclosure['file']; ?>" target="_blank">View File</a></p>
                    <?php } ?>
                  </div>
                  <div class="d-flex justify-content-end">
                    <button type="submit" name="onsubmit" class="btn btn-primary"><?php echo $isEditMode ? 'Update Disclosure' : 'Add Disclosure'; ?></button>
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