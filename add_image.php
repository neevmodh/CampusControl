<?php
session_start();
require 'server_config.php';
require './services/add_image.service.php';
header('Content-Type: application/json');
date_default_timezone_set('Asia/Kolkata');
$response = [];

try {
    // Validate request method and file upload
    if ($_SERVER['REQUEST_METHOD'] !== 'POST' || empty($_FILES['images'])) {
        throw new Exception('No files uploaded or invalid request.');
    }

    // Validate event ID and session
    $eventId = isset($_POST['event_id']) ? intval($_POST['event_id']) : 0;
    if ($eventId <= 0 || !isset($_SESSION["DepartmentID"])) {
        throw new Exception('Invalid event ID or session.');
    }

    // Directory where images will be uploaded
    $targetDir = 'uploads/' . $_SESSION["DepartmentID"] . '/gallery/' . $eventId . '/';
    if (!is_dir($targetDir) && !mkdir($targetDir, 0777, true) && !is_dir($targetDir)) {
        throw new Exception('Failed to create directories.');
    }

    // File details
    $imageFiles = $_FILES['images'];
    $titles = $_POST['titles'] ?? [];

    if (!is_array($titles) || count($titles) != count($imageFiles['name'])) {
        throw new Exception('Title count does not match image count.');
    }

    // Allowed file formats
    $allowedTypes = ['jpg', 'jpeg', 'png', 'gif'];

    // Insert image details into database
    $pdo = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $addImageService = new AddImageService();
    $stmt = $pdo->prepare("INSERT INTO eventphotos (DepartmentID, EventID, ImageName, IID, UploadedOn, ImageTitle) VALUES (?, ?, ?, ?, ?, ?)");

    foreach ($imageFiles['name'] as $index => $name) {
        $targetFile = $targetDir . basename($name);
        $imageFileType = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));

        // Check file size (10 MB limit)
        if ($imageFiles['size'][$index] > 10485760) {
            throw new Exception('Sorry, your file is too large. Maximum size is 10MB.');
        }

        // Check file type
        if (!in_array($imageFileType, $allowedTypes)) {
            throw new Exception('Sorry, only JPG, JPEG, PNG & GIF files are allowed.');
        }

        // Generate a unique filename if file exists
        if (file_exists($targetFile)) {
            $name = pathinfo($name, PATHINFO_FILENAME) . '_' . time() . '.' . $imageFileType;
            $targetFile = $targetDir . $name;
        }

        // Move uploaded file to target directory
        if (!move_uploaded_file($imageFiles['tmp_name'][$index], $targetFile)) {
            throw new Exception('Sorry, there was an error uploading your file.');
        }

        // Insert image details into database
        $stmt->execute([$_SESSION["DepartmentID"], $eventId, $name, substr(str_shuffle("0123456789"), 0, 5), date('Y-m-d H:i:s'), $titles[$index]]);
    }

    // Success response
    $response['status'] = 'success';
    $response['message'] = 'All images and titles have been uploaded.';
    echo json_encode($response);
    exit();
} catch (Exception $e) {
    // Error response
    $response['status'] = 'error';
    $response['message'] = $e->getMessage();
    echo json_encode($response);
    exit();
}
?>
