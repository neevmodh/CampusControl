<?php
session_start();
if (!isset($_SESSION["FacultyID"]) || !$_SESSION["isDepartmentAdmin"]) {
    header("Location: login.php");
    exit();
}

require 'server_config.php';

if (isset($_GET['CommitteId'])) {
    $committeId = $_GET['CommitteId'];

    // Check if the committee has members
    $checkSql = "SELECT COUNT(*) as memberCount FROM committe_member WHERE CommitteID = ?";
    $stmt = $conn->prepare($checkSql);
    $stmt->bind_param("i", $committeId);
    $stmt->execute();
    $result = $stmt->get_result();
    $row = $result->fetch_assoc();
    $stmt->close();

    if ($row['memberCount'] > 0) {
        // Redirect back with an error message
        $_SESSION['error'] = "Cannot delete committee with members.";
        header("Location: committe.php");
        exit();
    } else {
        // Proceed with deletion
        $sql = "DELETE FROM committe WHERE CommitteId = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $committeId);
        if ($stmt->execute()) {
            $_SESSION['success'] = "Committee deleted successfully.";
        } else {
            $_SESSION['error'] = "Error deleting committee.";
        }
        $stmt->close();
        header("Location: committe.php");
        exit();
    }
} else {
    header("Location: committe.php");
    exit();
}
?>
