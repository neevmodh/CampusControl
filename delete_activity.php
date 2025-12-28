<?php
session_start();
if (!isset($_SESSION["FacultyID"]) || !($_SESSION["isSuperAdmin"])) {
  header("Location: login.php");
  exit();
}

require 'server_config.php';
require 'upload.php';
require_once './services/activity.service.php';

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

if (isset($_GET['id'])) {
  $id = $_GET['id'];

  $sql = "SELECT ActivityReportFileName FROM activity WHERE ID='$id'";
  $result = $conn->query($sql);
  if ($result->num_rows > 0) {
    $files = $result->fetch_assoc();

    deleteOldFile($files['ActivityReportFileName']);

    $activityService = new ActivityService();
    $result = $activityService->delete($id);
  } else {
    $_SESSION['notification'] = array(
      "message" => "No record found",
      "type" => "danger",
    );
  }
  header("Location: activity.php");
  exit();
}

$conn->close();
