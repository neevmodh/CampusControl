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

if (!isset($_GET['id'])) {
  header("Location: subjects.php");
  exit();
}

$SubjectCode = '';
if (isset($_GET['id'])) {
  $SubjectCode = $conn->real_escape_string($_GET['id']);
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

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['onsubmit'])) {
  $title = $_POST['title'];

  try {
    $GTUPaperFileName = handleFileUpload('GTUPaperFileName', "gtu_papers/", [".pdf", ".doc", ".docx", ".ppt", ".pptx"], null);
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

  $data = ['SubjectCode' => $SubjectCode, 'Title' => $title, 'GTUPaperFileName' => $GTUPaperFileName, 'DepartmentID' => $DepartmentID];

  $result = $paperService->save($data);

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
  <title>Add GTU Paper</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
  <link href="assets/img/Icon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/css/style.css" rel="stylesheet">
</head>

<body>

  <?php include 'header_nav.php'; ?>

  <main id="main" class="main">
    <div class="container">
      <div class="card mt-5">
        <div class="card-header">
          <h3>Add GTU Paper for Subject: <?php echo htmlspecialchars($SubjectCode); ?></h3>
        </div>
        <div class="card-body">
          <form method="POST" enctype="multipart/form-data">
            <div class="mb-3">
              <label for="title" class="form-label">Title</label>
              <input type="text" class="form-control" id="title" name="title" required>
            </div>
            <div class="mb-3">
              <label for="GTUPaperFileName" class="form-label">GTU Paper File</label>
              <input type="file" class="form-control" id="GTUPaperFileName" name="GTUPaperFileName" required accept=".pdf,.doc,.docx,.ppt,.pptx" onchange="handleFileChange(event, ['.pdf','.doc','.docx','.ppt','.pptx'])">
            </div>
            <button type="submit" name="onsubmit" class="btn btn-primary">Upload</button>
            <a href="subjects.php" class="btn btn-secondary">Cancel</a>
          </form>
        </div>
      </div>
    </div>
  </main>

  <?php include "footer.php"; ?>

  <script src="ajaxValidation.js"></script>
</body>

</html>