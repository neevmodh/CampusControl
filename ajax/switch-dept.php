<?php
session_start();

// AUTHORIZATION
if (!isset($_SESSION["FacultyID"])) {
    header("Content-Type: application/json");
    echo json_encode([
        "status" => "error",
        "code" => 401,
        "response" => "Unauthorized access."
    ]);
    exit();
}

require_once './../services/department_service.php';

$departmentService = new DepartmentService();

if (isset($_GET['deptId'])) {
    $departmentID = $_GET["deptId"];
    $oldDepartmentID = $_SESSION["DepartmentID"];
    $_SESSION["DepartmentID"] = $departmentID;
    $success = false;

    try {
        $success = $departmentService->registerLog(
            $departmentID,
            $_SESSION['FacultyID'],
            json_encode(["Department ID: " => $departmentID]),
            json_encode(["Department ID: " => $oldDepartmentID]),
            "Changed Department"
        );
        
    } catch (\Throwable $th) {
        var_dump($th);
    }
    if ($success) {
        echo json_encode([
            "status" => "success",
            "code"=> 200,
            "response"=> "Successfully changed Department"
        ]);
    } else {
        echo json_encode([
            "status"=> "error",
            "code"=> 501,
            "response"=> "Error occured"
        ]);
    }
} else {
    echo json_encode([
        "status"=> "error",
        "code"=> 501,
        "response"=> "Error occured"
    ]);
}


