<?php
session_start();
if (!isset($_SESSION["FacultyID"]) || !$_SESSION["isDepartmentAdmin"]) {
  header("Location: login.php");
  exit();
}

require 'server_config.php';
require 'upload.php';
require './services/committe_member.service.php';

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

if (isset($_GET['ID'])) {
  $ID = $_GET['ID'];

  // Use prepared statements to prevent SQL injection
  $stmt = $conn->prepare("SELECT * FROM committe_member WHERE CommitteId = ?");
  $stmt->bind_param("i", $ID);
  $stmt->execute();
  $result = $stmt->get_result();

  if ($result->num_rows > 0) {
    $committe = new CommittememberService();
    $deleteResult = $committe->delete($ID);

    if ($deleteResult) {
      $_SESSION['notification'] = array(
        "message" => "Record deleted successfully",
        "type" => "success",
      );
      header("Location: committe_member.php");
      exit();
    } else {
      $_SESSION['notification'] = array(
        "message" => "Error deleting record",
        "type" => "danger",
      );
      header("Location: committe_member.php");
      exit();
    }
  } else {
    $_SESSION['notification'] = array(
      "message" => "No record found",
      "type" => "danger",
    );
    header("Location: committe_member.php");
    exit();
  }
} else {
  echo "ID parameter is missing";
}

$conn->close();
?>
