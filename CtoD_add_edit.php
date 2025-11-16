<?php
session_start();
if (!isset($_SESSION["FacultyID"]) || !$_SESSION["isDepartmentAdmin"]) {
  header("Location: login.php");
  exit();
}

require 'server_config.php';
require 'upload.php';
require './services/CtoD.service.php';

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$admissionID = isset($_GET['ID']) ? $_GET['ID'] : null;
$isEditMode = $admissionID !== null;

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $Programme = htmlspecialchars($_POST["Programme"]);
  $Level = htmlspecialchars($_POST["Level"]);
  $Intake = htmlspecialchars($_POST["Intake"]);
  $CourseDuration = htmlspecialchars($_POST["CourseDuration"]);
  $admission = new CtoD();
  $data = [
    'Programme' => $Programme,
    'Level' => $Level,
    'Intake' => $Intake,
    'CourseDuration' => $CourseDuration,
  ];
  if ($isEditMode) {
    $result = $admission->update($admissionID, $data);
  } else {
    $result = $admission->save($data);
  }

  if (isset($result)) {
    header("Location: C_TO_D.php");
    exit();
  } else {
    echo "Error: " . $conn->error;
  }
}

if ($isEditMode) {
  $admission = (new CtoD())->fetchOne($admissionID);
  if (!$admission) {
    echo "not found.";
    exit();
  }
}

// Fetch existing admissions
$existingAdmissions = [];
$sql = "SELECT Programme FROM c_to_d_admission";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
  while ($row = $result->fetch_assoc()) {
    $existingAdmissions[] = $row['Programme'];
  }
}

// Fetch department names
$departments = [];
$sql = "SELECT DepartmentName FROM department";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
  while ($row = $result->fetch_assoc()) {
    if (!in_array($row['DepartmentName'], $existingAdmissions) || ($isEditMode && $admission['Programme'] == $row['DepartmentName'])) {
      $departments[] = $row['DepartmentName'];
    }
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
  <meta content="" name="Intake">
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
          <h3 style="font-weight: 600;">C to D Diploma Admissions & Courses</h3>
          <div class="breadcrumb-link">
            <ul class="text-primary">
              <li><a class="text-primary" href="index.php">Dashboard</a></li>
              <li><a class="text-primary" href="C_TO_D.php">C to D Diploma Admissions</a></li>
              <li class="disabled text-secondary">Add & Edit</li>
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
                    <label class="mb-1" for="Programme">Programme</label>
                    <select class="form-control" id="Programme" name="Programme" required>
                      <option value="" disabled <?php echo !$isEditMode ? 'selected' : ''; ?>>Please select</option>
                      <?php foreach ($departments as $department) : ?>
                        <option value="<?php echo htmlspecialchars($department); ?>" <?php echo $isEditMode && $admission['Programme'] == $department ? 'selected' : ''; ?>>
                          <?php echo htmlspecialchars($department); ?>
                        </option>
                      <?php endforeach; ?>
                    </select>
                  </div>
                  <div class="form-group col-md-12 mb-3">
                    <label class="mb-1" for="Level">Level</label>
                    <textarea class="form-control" id="Level" name="Level" required><?php echo $isEditMode ? $admission['Level'] : 'Diploma'; ?></textarea>
                  </div>
                  <div class="form-group col-md-12 mb-3">
                    <label class="mb-1" for="Intake">Intake</label>
                    <input type="number" class="form-control" id="Intake" name="Intake" required min="1" max="30" value="<?php echo $isEditMode ? $admission['Intake'] : ''; ?>">
                  </div>
                  <div class="form-group col-md-12 mb-3">
                    <label class="mb-1" for="CourseDuration">Course Duration(In Years)</label>
                    <select class="form-control" id="CourseDuration" name="CourseDuration" required>
                      <option value="1" <?php echo $isEditMode && $admission['CourseDuration'] == '1' ? 'selected' : ''; ?>>1 Year</option>
                      <option value="2" <?php echo $isEditMode && $admission['CourseDuration'] == '2' ? 'selected' : ''; ?>>2 Years</option>
                      <option value="3" <?php echo $isEditMode && $admission['CourseDuration'] == '3' ? 'selected' : ''; ?>>3 Years</option>
                      <option value="4" <?php echo $isEditMode && $admission['CourseDuration'] == '4' ? 'selected' : ''; ?>>4 Years</option>
                    </select>
                  </div>
                  <div class="d-flex justify-content-end">
                    <button type="submit" class="btn btn-primary"><?php echo $isEditMode ? 'Update Admission' : 'Add Admission'; ?></button>
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
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/js/main.js"></script>
</body>

</html>
