<?php
session_start();

require './../upload.php';
require '../toasts.php';

// AUTHORIZATION
if (!isset($_SESSION["FacultyID"])  || $_SESSION["isAdmin"] == "No") {
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

    $deptId = $_POST['deptId'];
    $success = false;

    // IF UPLOADING LOGO
    if (isset($_POST['logo'])) {
        $imageTitle = 'logo';

        // Retrieve current logo name from database
        $row = $departmentService->fetchOne($deptId);
        $currentImageName = $row['LogoName'];

        try {
            // Call the function with the appropriate parameters
            $logoPath = handleFileUpload($imageTitle, '../../uploads/department_images/' . $deptId . '/', ['.jpg', '.jpeg', '.png'], $currentImageName);
        } catch (InvalidArgumentException $e) {
            // Handle invalid argument exceptions
            echo json_encode([
                "status" => "error",
                "code" => 401,
                "response" => "Arguments are Invalid."
            ]);
        } catch (RuntimeException $e) {
            // Handle runtime exceptions (e.g., file upload errors)
            echo json_encode([
                "status" => "error",
                "code" => 401,
                "response" => "Unknown Error occurred."
            ]);
        } catch (Exception $e) {
            // Handle any other exceptions
            echo json_encode([
                "status" => "error",
                "code" => 501,
                "response" => "Error occurred."
            ]);
        }

        if ($logoPath) {

            try {
                $success = $departmentService->update($deptId, [ "LogoName" => $logoPath ]);
            } catch (\InvalidArgumentException $th) {
                echo json_encode([
                    "status" => "error",
                    "code" => 401,
                    "response" => "Arguments are invalid."
                ]);
            }

            if ($success) {
                echo json_encode([
                    "status" => "success",
                    "code" => 200,
                    "response" => "Logo is successfully updated."
                ]);
            } else {
                echo json_encode([
                    "status" => "error",
                    "code" => 401,
                    "response" => "Error occurred."
                ]);
            }
        } else {
            echo json_encode([
                "status" => "error",
                "code" => 501,
                "response" => "File not uploaded."
            ]);
        }

        exit();
    }

    // IF UPLOADING IMAGE
    if (isset($_POST['imageNumber'])) {
        $imageNum = $_POST['imageNumber'];
        $imageTitle = "image" . $imageNum;
        $imageNameTitle = "ImageName" . $imageNum;
        $imageDescTitle = "ImageDesc" . $imageNum;
    }

    // CHECK IF FILES IS OK
    if (isset($_FILES[$imageTitle]) && $_FILES[$imageTitle]['error'] === UPLOAD_ERR_OK) {

        // Retrieve current logo name from database
        $row = $departmentService->fetchOne($deptId);
        $currentImageName = $row[$imageNameTitle];
        
        try {
            // Call the function with the appropriate parameters
            $logoPath = handleFileUpload($imageTitle, '../../uploads/department_images/' . $deptId . '/', ['.jpg', '.jpeg', '.png'], $currentImageName);
        } catch (InvalidArgumentException $e) {
            // Handle invalid argument exceptions
            echo json_encode([
                "status" => "error",
                "code" => 401,
                "response" => "Arguments Invalid."
            ]);
        } catch (RuntimeException $e) {
            // Handle runtime exceptions (e.g., file upload errors)
            echo json_encode([
                "status" => "error",
                "code" => 401,
                "response" => "Unknown Error occurred."
            ]);
        } catch (Exception $e) {
            // Handle any other exceptions
            echo json_encode([
                "status" => "error",
                "code" => 501,
                "response" => "Error occurred."
            ]);
        }

        if ($logoPath) {

            $data =[
                $imageNameTitle => $logoPath, 
                $imageDescTitle => $_POST['imageDesc']
            ];
            $success = $departmentService->update($deptId, $data);


            if ($success) {
                echo json_encode([
                    "status" => "success",
                    "code" => 200,
                    "response" => "File is successfully uploaded and Description updated."
                ]);
            } else {
                deleteOldFile($logoPath);
                echo json_encode([
                    "status" => "error",
                    "code" => 500,
                    "response" => "There was an error inserting the file in the database."
                ]);
            }
        } else {
            echo json_encode([
                "status" => "error",
                "code" => 501,
                "response" => "There was an error moving the uploaded file."
            ]);
        }
    } else {
        // UPDATING DESC ONLY 
        $success = $departmentService->update($deptId,  [ $imageDescTitle => $_POST['imageDesc'] ]);

        if ($success) {
            echo json_encode([
                "status" => "success",
                "code" => 200,
                "response" => "Description is successfully updated."
            ]);
        } else {
            echo json_encode([
                "status" => "error",
                "code" => 500,
                "response" => "There was an error updating the description in the database."
            ]);
        }
    }
} else if ($_SERVER["REQUEST_METHOD"] == "GET") {
    if (isset($_GET["imageNumber"])) {
        $imageNum = $_GET['imageNumber'];
        $imageNameTitle = "ImageName" . $imageNum;
        $imageDescTitle = "ImageDesc" . $imageNum;

        $deptId = $_GET['deptId'];

        $row = $departmentService->fetchOne($deptId);
        $currentImageName = $row[$imageNameTitle];

        deleteOldFile($currentImageName);
        $departmentService->update($deptId, [$imageNameTitle => '',$imageDescTitle => '']);

        echo json_encode([
            "status" => "success",
            "code" => 200,
            "response" => "File deleted Succesfully."
        ]);
    }
}