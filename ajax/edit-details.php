<?php
session_start();

// AUTHORIZATION
if (!isset($_SESSION["FacultyID"]) || !($_SESSION["isDepartmentAdmin"] || $_SESSION["isSuperAdmin"])) {
    header("Content-Type: application/json");
    echo json_encode([
        "status" => "error",
        "code" => 401,
        "response" => "Unauthorized access."
    ]);
    exit();
}

require '../server_config.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $deptId = $_POST['deptId'];
    
    if (isset($_POST['yearOfStarting'])) { // IF COURSE DETAILS
        $yearofStarting = (int)$_POST['yearOfStarting'];
        $firstYearofApprovalFromCouncil = (int)$_POST['yearOfApproval'];
        $period = (int)$_POST['period'];
        $intake = (int)$_POST['intake'];
        $level = (int)$_POST['level'];

        try {
            $data = [
                "YearofStarting"=> $yearofStarting,
                "Level"=> $level,
                "FirstYearofApprovalFromCouncil"=> $firstYearofApprovalFromCouncil,
                "Period"=> $period,
                "Intake"=> $intake
            ];
            $success = $departmentService->update($deptId, $data);

            if ($success) {
                echo json_encode([
                    "status" => "success",
                    "code" => 200,
                    "response" => "Data successfully updated."
                ]);
            } else {
                echo json_encode([
                    "status" => "error",
                    "code" => 500,
                    "response" => "There was an error executing the query: " . $stmt->error,
                    "session" => json_encode($_POST)
                ]);
            }

        } catch (\InvalidArgumentException $th) {
            echo json_encode([
                "status" => "error",
                "code" => 401,
                "response" => "Arguments are invalid."
            ]);
        }

    } elseif (isset($_POST['vision'])) { // IF UPDATING VISION
       
        $vision = $_POST['vision'];

        try {
            $success = $departmentService->update($deptId, [ "Vision" => $vision]);

            if ($success) {
                echo json_encode([
                    "status" => "success",
                    "code" => 200,
                    "response" => "Data successfully updated."
                ]);
            } else {
                echo json_encode([
                    "status" => "error",
                    "code" => 500,
                    "response" => "There was an error executing the query: " . $stmt->error,
                    "session" => json_encode($_POST)
                ]);
            }

            $stmt->close();
        } catch (\Throwable $th) {
            echo json_encode([
                "status" => "error",
                "code" => 500,
                "response" => "There was an error updating the Data: " . $th->getMessage()
            ]);
        }

    } elseif (isset($_POST['mission1'])) { // IF UPDATING MISSIONS
       
        $mission1 = $_POST['mission1'];
        $mission2 = $_POST['mission2'];
        $mission3 = $_POST['mission3'];
        $mission4 = $_POST['mission4'];
        $mission5 = $_POST['mission5'];

        try {
            $stmt = $conn->prepare("UPDATE `department` SET `Mission1`=?,`Mission2`=?,`Mission3`=?,`Mission4`=?,`Mission5`=? WHERE DepartmentID = ?");
            $stmt->bind_param('ssssss', $mission1,$mission2,$mission3,$mission4,$mission5,$deptId);

            if ($stmt->execute()) {
                if ($stmt->affected_rows > 0) {
                    echo json_encode([
                        "status" => "success",
                        "code" => 200,
                        "response" => "Data successfully updated."
                    ]);
                } else {
                    echo json_encode([
                        "status" => "error",
                        "code" => 404,
                        "response" => "No rows were updated. Check if the DepartmentID is correct.",
                        "session" => json_encode($_POST)
                    ]);
                }
            } else {
                echo json_encode([
                    "status" => "error",
                    "code" => 500,
                    "response" => "There was an error executing the query: " . $stmt->error,
                    "session" => json_encode($_POST)
                ]);
            }

            $stmt->close();
        } catch (\Throwable $th) {
            echo json_encode([
                "status" => "error",
                "code" => 500,
                "response" => "There was an error updating the Data: " . $th->getMessage()
            ]);
        }

    } elseif (isset($_POST['peo1'])) { // IF UPDATING PEOs
       
        $peo1 = $_POST['peo1'];
        $peo2 = $_POST['peo2'];
        $peo3 = $_POST['peo3'];
        $peo4 = $_POST['peo4'];
        $peo5 = $_POST['peo5'];

        try {
            $stmt = $conn->prepare("UPDATE `department` SET `PEO1`=?,`PEO2`=?,`PEO3`=?,`PEO4`=?,`PEO5`=? WHERE DepartmentID = ?");
            $stmt->bind_param('ssssss', $peo1,$peo2,$peo3,$peo4,$peo5,$deptId);

            if ($stmt->execute()) {
                if ($stmt->affected_rows > 0) {
                    echo json_encode([
                        "status" => "success",
                        "code" => 200,
                        "response" => "Data successfully updated."
                    ]);
                } else {
                    echo json_encode([
                        "status" => "error",
                        "code" => 404,
                        "response" => "No rows were updated. Check if the DepartmentID is correct.",
                        "session" => json_encode($_POST)
                    ]);
                }
            } else {
                echo json_encode([
                    "status" => "error",
                    "code" => 500,
                    "response" => "There was an error executing the query: " . $stmt->error,
                    "session" => json_encode($_POST)
                ]);
            }

            $stmt->close();
        } catch (\Throwable $th) {
            echo json_encode([
                "status" => "error",
                "code" => 500,
                "response" => "There was an error updating the Data: " . $th->getMessage()
            ]);
        }

    } elseif (isset($_POST['pso1'])) { // IF UPDATING PSOs
       
        $pso1 = $_POST['pso1'];
        $pso2 = $_POST['pso2'];
        $pso3 = $_POST['pso3'];
        $pso4 = $_POST['pso4'];
        $pso5 = $_POST['pso5'];

        try {
            $stmt = $conn->prepare("UPDATE `department` SET `PSO1`=?,`PSO2`=?,`PSO3`=?,`PSO4`=?,`PSO5`=? WHERE DepartmentID = ?");
            $stmt->bind_param('ssssss', $pso1,$pso2,$pso3,$pso4,$pso5,$deptId);

            if ($stmt->execute()) {
                if ($stmt->affected_rows > 0) {
                    echo json_encode([
                        "status" => "success",
                        "code" => 200,
                        "response" => "Data successfully updated."
                    ]);
                } else {
                    echo json_encode([
                        "status" => "error",
                        "code" => 404,
                        "response" => "No rows were updated. Check if the DepartmentID is correct.",
                        "session" => json_encode($_POST)
                    ]);
                }
            } else {
                echo json_encode([
                    "status" => "error",
                    "code" => 500,
                    "response" => "There was an error executing the query: " . $stmt->error,
                    "session" => json_encode($_POST)
                ]);
            }

            $stmt->close();
        } catch (\Throwable $th) {
            echo json_encode([
                "status" => "error",
                "code" => 500,
                "response" => "There was an error updating the Data: " . $th->getMessage()
            ]);
        }

    } elseif (isset($_POST['facility1'])) { // IF UPDATING FACILITIES
       
        $facility1 = $_POST['facility1'];
        $facility2 = $_POST['facility2'];
        $facility3 = $_POST['facility3'];
        $facility4 = $_POST['facility4'];
        $facility5 = $_POST['facility5'];
        $facility6 = $_POST['facility6'];
        $facility7 = $_POST['facility7'];
        $facility8 = $_POST['facility8'];
        $facility9 = $_POST['facility9'];
        $facility10 = $_POST['facility10'];

        $facilityLink1 = $_POST['facilityLink1'];
        $facilityLink2 = $_POST['facilityLink2'];
        $facilityLink3 = $_POST['facilityLink3'];

        try {
            $stmt = $conn->prepare("UPDATE `department` SET `Facility1`=?,`Facility2`=?,`Facility3`=?,`Facility4`=?,`Facility5`=?,`Facility6`=?,`Facility7`=?,`Facility8`=?,`Facility9`=?,`Facility10`=?,`FacilityLink1`=?,`FacilityLink2`=?,`FacilityLink3`=? WHERE DepartmentID = ?");
            $stmt->bind_param('ssssssssssssss', $facility1,$facility2,$facility3,$facility4,$facility5,$facility6,$facility7,$facility8,$facility9,$facility10,$facilityLink1,$facilityLink2,$facilityLink3,$deptId);

            if ($stmt->execute()) {
                if ($stmt->affected_rows > 0) {
                    echo json_encode([
                        "status" => "success",
                        "code" => 200,
                        "response" => "Data successfully updated."
                    ]);
                } else {
                    echo json_encode([
                        "status" => "error",
                        "code" => 404,
                        "response" => "No rows were updated. Check if the DepartmentID is correct.",
                        "session" => json_encode($_POST)
                    ]);
                }
            } else {
                echo json_encode([
                    "status" => "error",
                    "code" => 500,
                    "response" => "There was an error executing the query: " . $stmt->error,
                    "session" => json_encode($_POST)
                ]);
            }

            $stmt->close();
        } catch (\Throwable $th) {
            echo json_encode([
                "status" => "error",
                "code" => 500,
                "response" => "There was an error updating the Data: " . $th->getMessage()
            ]);
        }

    }

    $conn->close();
}
