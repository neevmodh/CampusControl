<?php
session_start();
 if (!isset($_SESSION["FacultyID"]) || !$_SESSION["isDepartmentAdmin"]) {
   header("Location: login.php");
   exit();
 }

require 'server_config.php';
require 'upload.php';
require './services/admission.service.php';

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

if (isset($_GET['ID'])) {
  $ID = $_GET['ID']; 

  $sql = "SELECT * FROM admission WHERE ID='$ID'";
  $result = $conn->query($sql);
  if ($result->num_rows > 0) {
    $admission = new admission();
    $result = $admission->delete($ID); 
    header("Location: admission.php");
    exit();
  } else {
    $_SESSION['notification'] = array(
      "message" => "No record found",
      "type" => "danger",
    );
    header("Location: admission.php");
    exit();
  }
}

$conn->close();
?>
