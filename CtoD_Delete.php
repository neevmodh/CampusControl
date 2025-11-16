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

if (isset($_GET['ID'])) {
  $ID = $_GET['ID']; 

  $sql = "SELECT * FROM c_to_d_admission WHERE ID='$ID'";
  $result = $conn->query($sql);
  if ($result->num_rows > 0) {
    $admission = new CtoD();
    $result = $admission->delete($ID); 
    header("Location: C_TO_D.php");
    exit();
  } else {
    $_SESSION['notification'] = array(
      "message" => "No record found",
      "type" => "danger",
    );
    header("Location: C_TO_D.php");
    exit();
  }
}

$conn->close();
?>
