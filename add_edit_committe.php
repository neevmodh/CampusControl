<?php
session_start();
if (!isset($_SESSION["FacultyID"]) || !$_SESSION["isDepartmentAdmin"]) {
  header("Location: login.php");
  exit();
}

require 'server_config.php';
require 'upload.php';
require './services/committe.service.php';

// Set the character set to UTF-8
$conn->set_charset("utf8");

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
$DepartmentID = $_SESSION["DepartmentID"];

$committeID = isset($_GET['CommitteId']) ? $_GET['CommitteId'] : null;
$isEditMode = $committeID !== null;

$committeIDExists = false;

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $CommitteName = $_POST["CommitteName"];
  $ConvenerID = $_POST["ConvenerID"];
  $Description = $_POST["Description"];
  $committe = new CommitteService();
  $data = [
    'CommitteName' => $CommitteName,
    'CommitteConvener' => $ConvenerID,
    'Description' => $Description,
  ];

  if ($isEditMode) {
    $result = $committe->update($committeID, $data);
  } else {
    // Generate a 4-digit random number for CommitteID
    // $data['CommitteId'] = rand(1111,9999);

    // Check if CommitteID already exists
    // $checkSql = "SELECT COUNT(*) as count FROM committe WHERE CommitteId = ?";
    // $stmt = $conn->prepare($checkSql);
    // $stmt->bind_param("i", $data['CommitteId']);
    // $stmt->execute();
    // $stmt->bind_result($count);
    // $stmt->fetch();
    // $stmt->close();

    // if ($count > 0) {
    //   $committeIDExists = true;
    // } else {
    //   $result = $committe->save($data);
    // }
    $result = $committe->save($data);
  }

  if (isset($result)) {
    header("Location: committe.php");
    exit();
  } else {
    echo "Error: " . $conn->error;
  }
}

if ($isEditMode) {
  $committe = (new CommitteService())->fetchOne($committeID);
  if (!$committe) {
    echo "not found.";
    exit();
  }
}

// Fetch department names
$departments = [];
$sql = "SELECT DepartmentName FROM department";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
  while ($row = $result->fetch_assoc()) {
    $departments[] = $row['DepartmentName'];
  }
}

// Fetch faculty names and IDs
$faculty = [];
$sql = "SELECT FacultyID, FirstName, LastName FROM faculty";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
  while ($row = $result->fetch_assoc()) {
    $faculty[] = $row;
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
          <h3 style="font-weight: 600;">Admin Committe Management</h3>
          <div class="breadcrumb-link">
          <ul class="text-primary">
            <li><a class="text-primary" href="index.php">Dashboard</a></li>
            <li><a class="text-primary" href="committe.php">Admin Committe</a></li>
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
                    <label class="mb-1" for="CommitteName">Committe Name</label>
                    <input type="text" class="form-control" id="CommitteName" name="CommitteName" required value="<?php echo $isEditMode ? htmlspecialchars($committe['CommitteName']) : ''; ?>">
                  </div>
                  <div class="form-group col-md-12 mb-3">
                    <label class="mb-1" for="ConvenerID">Convener</label>
                    <select class="form-control" id="ConvenerID" name="ConvenerID" required>
                      <option value="" disabled <?php echo !$isEditMode ? 'selected' : ''; ?>>Please select</option>
                      <?php foreach ($faculty as $member) : ?>
                        <option value="<?php echo htmlspecialchars($member['FacultyID']); ?>" <?php echo $isEditMode && $committe['CommitteConvener'] == $member['FacultyID'] ? 'selected' : ''; ?>>
                          <?php echo htmlspecialchars($member['FirstName'] . ' ' . $member['LastName']); ?>
                        </option>
                      <?php endforeach; ?>
                    </select>
                  </div>
                  <div class="form-group col-md-12 mb-3">
                    <label class="mb-1" for="Description">Description</label>
                    <textarea class="form-control" id="Description" name="Description" required><?php echo $isEditMode ? htmlspecialchars($committe['Description']) : ''; ?></textarea>
                  </div>
                  <div class="d-flex justify-content-end">
                    <button type="submit" class="btn btn-primary"><?php echo $isEditMode ? 'Update Committe' : 'Add Committe'; ?></button>
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

  <?php if ($committeIDExists): ?>
    <script>
      alert("Error: CommitteID already exists. Please try again.");
    </script>
  <?php endif; ?>
</body>

</html>
