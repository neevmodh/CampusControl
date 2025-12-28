<?php
session_start();
if (!isset($_SESSION["FacultyID"]) || !($_SESSION["isDepartmentAdmin"] || $_SESSION["isSuperAdmin"])) {
    header("Location: login.php");
    exit();
}

require 'server_config.php';
require 'upload.php';
require './services/activity.service.php';

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$DepartmentID = $_SESSION["DepartmentID"];
$FacultyID = $_SESSION["FacultyID"];

$id = isset($_GET['id']) ? $_GET['id'] : null;
$isEditMode = $id !== null;

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['onsubmit'])) {
    $Department = isset($_POST["Department"]) ? $_POST["Department"] : $DepartmentID;
    $Title = $_POST["title"];
    $Type = $_POST["type"];
    $StartDate = $_POST["StartDate"];
    $EndDate = $_POST["EndDate"];
    $Venue = $_POST["venue"];
    $Status = $_POST["Status"];
    $ActivityReport = $_POST["ActivityReportFileName"];
    $Description = $_POST["description"];

    if ($isEditMode) {
        $sql = "SELECT ActivityReportFileName FROM activity WHERE ID='$id'";
        $result = $conn->query($sql);
        $existingFiles = $result->fetch_assoc();
    }

    try {
        $File = handleFileUpload('ActivityReportFileName', "activity/", [".pdf", ".doc", ".docx", ".ppt", ".pptx"], $isEditMode ? $existingFiles['ActivityReportFileName'] : null);
    } catch (InvalidArgumentException $e) {
        echo "Invalid argument error: " . $e->getMessage();
    } catch (RuntimeException $e) {
        echo "Runtime error: " . $e->getMessage();
    }
    $activityService = new ActivityService();

    $data = [];

    if ($isEditMode) {
        $result = $activityService->update($id, [
            'DepartmentID' => $Department,
            'ActivityTitle' => $Title,
            'ActivityType' => $Type,
            'ActivityReportFileName' => $File,
            'StartDate' => $StartDate,
            'EndDate' => $EndDate,
            'Description' => $Description,
            'Status' => $Status,
            'Venue' => $Venue,
            'ModifiedBy' => $_SESSION['FacultyName'],
            'ModfiedDate' => date('Y-m-d H:i:s'),
        ]);
    } else {
        $result = $activityService->save([
            'CreatedBy' => $_SESSION['FacultyName'],
            'DepartmentID' => $Department,
            'ActivityTitle' => $Title,
            'ActivityType' => $Type,
            'ActivityReportFileName' => $File,
            'StartDate' => $StartDate,
            'EndDate' => $EndDate,
            'Description' => $Description,
            'Status' => $Status,
            'Venue' => $Venue,
        ]);
        var_dump($result);
    }

    if (isset($result)) {
        echo "hee";
        header("Location: activity.php");
        exit();
    } else {
        echo "Error: " . $conn->error;
    }
}

if ($isEditMode) {
    $activity = (new ActivityService())->fetchOne($id);
    if (!$activity) {
        echo "Activity not found.";
        exit();
    }
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>GP Ahmadabad Admin Portal</title>
    <meta content="" name="description">
    <meta content="" name="keywords">
    <link href="assets/img/Icon.png" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans|Nunito|Poppins" rel="stylesheet">
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
</head>

<body>

    <?php include 'header_nav.php' ?>

    <main id="main" class="main">
        <div class="main-spacing">
            <div class="custom-breadcrumb">
                <div>
                    <h3 style="font-weight: 600;">Activity</h3>
                    <div class="breadcrumb-link">
                        <ul class="text-primary">
                            <li>
                                <a class="text-primary" href="#">Dashboard</a>
                            </li>
                            <li>
                                <a class="text-primary" href="activity.php">Activity</a>
                            </li>
                            <li class="disabled text-secondary"><?php echo $isEditMode ? 'Edit' : 'Create'; ?></li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="d-flex justify-content-center">
                <div class="d-flex align-items-center w-100">
                    <div class="card w-100">
                        <div class="card-body mt-3 h-100 w-100">
                            <form class="form" method="POST" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="form-group col-md-4 mb-3">
                                        <label class="mb-1" for="Department">Department</label>
                                        <select class="form-control" id="Department" name="Department" required <?php echo $_SESSION["isSuperAdmin"] ? '' : 'disabled="true"'; ?>">
                                            <option selected disabled>--Select--</option>
                                            <?php
                                            if ($_SESSION["isSuperAdmin"]) {
                                                $sqlDegree = "SELECT * FROM `department`";
                                                $Degrees = $conn->query($sqlDegree);
                                                while ($row = mysqli_fetch_array($Degrees)) {
                                                    $selected = ($isEditMode && $activity['DepartmentID'] == $row['DepartmentID']) ? 'selected' : '';
                                                    echo "<option value='" . $row['DepartmentID'] . "' $selected>" . $row['DepartmentID'] . " - " . $row['DepartmentName'] . "</option>";
                                                }
                                            } else {
                                                $sqlDegree = "SELECT * FROM `department` WHERE DepartmentID = '$DepartmentID'";
                                                $Degrees = $conn->query($sqlDegree);
                                                $row = mysqli_fetch_array($Degrees);
                                                echo "<option value='" . $row['DepartmentID'] . "' selected disabled='true'>" . $row['DepartmentID'] . " - " . $row['DepartmentName'] . "</option>";
                                            }
                                            ?>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-4 mb-3">
                                        <label class="mb-1" for="title">Title</label>
                                        <input type="text" class="form-control" id="title" name="title" required value="<?php echo $isEditMode ? $activity['ActivityTitle'] : ''; ?>">
                                    </div>
                                    <div class=" form-group col-md-4 mb-3">
                                        <label class="mb-1" for="type">Type</label>
                                        <select class="form-control" id="type" name="type" required>
                                            <option value="">--Select--</option>
                                            <option value="Co-curricular" <?php echo $isEditMode && $activity['ActivityType'] == 'Co-curricular' ? 'selected' : ''; ?>>Co-curricular</option>
                                            <option value="Extra-Curricular" <?php echo $isEditMode && $activity['ActivityType'] == 'Extra-Curricular' ? 'selected' : ''; ?>>Extra-Curricular</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6 mb-3">
                                        <label class="mb-1" for="StartDate">Start Date</label>
                                        <input type="date" class="form-control" id="StartDate" name="StartDate" min="1980-01-01" max=<?php echo date('Y-m-d'); ?> value="<?php echo $isEditMode ? $activity['StartDate'] : ''; ?>" required>
                                    </div>
                                    <div class="form-group col-md-6 mb-3">
                                        <label class="mb-1" for="EndDate">End Date</label>
                                        <input type="date" class="form-control" id="EndDate" name="EndDate" min="1980-01-01" max=<?php echo date('Y-m-d'); ?> value="<?php echo $isEditMode ? $activity['EndDate'] : ''; ?>" required>
                                    </div>
                                    <div class="form-group col-md-4 mb-3">
                                        <label class="mb-1" for="venue">Venue</label>
                                        <input type="text" class="form-control" id="venue" name="venue" required value="<?php echo $isEditMode ? $activity['Venue'] : ''; ?>">
                                    </div>
                                    <div class="form-group col-md-4 mb-3">
                                        <label class="mb-1" for="Status">Status</label>
                                        <select class="form-control" id="Status" name="Status" required>
                                            <option value="Active" <?php echo $isEditMode && $activity['Status'] == 'Active' ? 'selected' : ''; ?>>Active</option>
                                            <option value="Inactive" <?php echo $isEditMode && $activity['Status'] == 'Inactive' ? 'selected' : ''; ?>>Inactive</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-4 mb-3">
                                        <label class="mb-1" for="ActivityReportFileName">Report File</label>
                                        <input type="file" class="form-control" id="ActivityReportFileName" onchange="handleFileChange(event, ['.pdf','.doc','.docx' ,'.ppt','.pptx'])" name="ActivityReportFileName" <?php echo !$isEditMode ? 'required' : ''; ?> accept=".pdf,.doc,.docx,.ppt,.pptx">
                                        <?php if ($isEditMode && $activity['ActivityReportFileName']) { ?>
                                            <p>Current file: <a href="<?php echo $activity['ActivityReportFileName']; ?>" target="_blank">View File</a></p>
                                        <?php } ?>
                                    </div>
                                    <div class="form-group col-md-12 mb-3">
                                        <label class="mb-1" for="description">Description</label>
                                        <textarea class="form-control" name="description" id="description" rows="4"><?php echo $isEditMode ? $activity['Description'] : ''; ?></textarea>
                                    </div>
                                    <div class="d-flex justify-content-end">
                                        <button type="submit" name="onsubmit" class="btn btn-primary"><?php echo $isEditMode ? 'Update Activity' : 'Add Activity'; ?></button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
    <script src="ajaxValidation.js"></script>
</body>

</html>