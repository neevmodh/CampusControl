<?php
session_start();
if (!isset($_SESSION["FacultyID"])) {
    header("Location: login.php");
    exit();
}

require 'server_config.php';
require_once './services/faculty_publication.service.php';

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $service = new FacultyPublicationService();
    $result = $service->delete($id);
    if ($result) {
        header("Location: publication.php");
        exit();
    } else {
        $_SESSION['notification'] = array(
            "message" => "No record found",
            "type" => "danger",
        );
    }
}

$conn->close();
