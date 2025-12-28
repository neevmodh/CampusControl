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

if (isset($_GET['id'])) {
  $id = $_GET['id'];

  $sql = "SELECT FileName FROM dept_magazine WHERE ID='$id'";
  $result = $conn->query($sql);
  if ($result->num_rows > 0) {
    $files = $result->fetch_assoc();

    deleteOldFile($files['FileName']);

    $service = new MagazineService();
    $result = $service->delete($id);
  } else {
    $_SESSION['notification'] = array(
      "message" => "No record found",
      "type" => "danger",
    );
  }
  header("Location:magazine.php");
  exit();
}

$conn->close();
