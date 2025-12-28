<?php
session_start();

// AUTHORIZATION
if (!isset($_SESSION["FacultyID"]) || $_SESSION["isAdmin"] == "No") {
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

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $about = $_POST['about'];
    $deptId = $_POST['deptId'];

    // VALIDATION
    if (empty($about)) {
        echo json_encode([
            "status" => "error",
            "code" => 412,
            "response" => "About can't be empty."
        ]);
    } elseif (strlen(trim($about)) > 65535) {
        echo json_encode([
            "status" => "error",
            "code" => 413,
            "response" => "The About is too long. Max limit is 65535 chars."
        ]);
    } else {
        // UPDATING DB
        try {
            $success = $departmentService->update($deptId,[ "About" => $about ]);

            if ($success) {
                echo json_encode([
                    "status" => "success",
                    "code" => 200,
                    "response" => "About successfully updated."
                ]);
            } else {
                echo json_encode([
                    "status" => "error",
                    "code" => 500,
                    "response" => "There was an error executing the query: " . $stmt->error
                ]);
            }

        } catch (\InvalidArgumentException $th) {
            echo json_encode([
                "status" => "error",
                "code" => 401,
                "response" => "Arguments are invalid."
            ]);
        }
    }

    $conn->close();
}
