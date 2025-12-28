<?php
session_start();
if (!isset($_SESSION["FacultyID"]) || !($_SESSION["isDepartmentAdmin"] || $_SESSION["isSuperAdmin"])) {
    header("Location: login.php");
    exit();
}

require 'server_config.php';
require 'upload.php';
require './services/add_calendar.service.php';

$calendarsService = new AddCalendarService();
$DepartmentID = $_SESSION["DepartmentID"];
$FacultyID = $_SESSION["FacultyID"];
$isEditMode = false;

if (isset($_GET['id'])) {
    $isEditMode = true;
    $id = $_GET['id'];
    $calendar = $calendarsService->fetchOne($id);
}

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['onsubmit'])) {
    $success = false;
    $department = isset($_POST["department"]) ? $_POST["department"] : $DepartmentID;
    $term_type = $_POST['term_type'];
    $term_year_from = $_POST['term_year_from'];
    $term_year_to = $_POST['term_year_to'];
    $term_type = $_POST['term_type'];
    $year_regex = '/^(19|20)\d{2}$/';
    if ($department == "selectdep") {
        $notification = array(
            "message" => "Please select the department",
            "type" => "danger",
        );
        $_SESSION['notification'] = $notification;
    } else {
        if ($term_type == "Select term type") {
            $notification = array(
                "message" => "Please select the Term type",
                "type" => "danger",
            );
            $_SESSION['notification'] = $notification;
        } else {
            if (!preg_match($year_regex, $term_year_from)) {
                $notification = array(
                    "message" => "Enter a valid year",
                    "type" => "danger",
                );
                $_SESSION['notification'] = $notification;
            } else if (!preg_match($year_regex, $term_year_to)) {
                $notification = array(
                    "message" => "Enter a valid year",
                    "type" => "danger",
                );
                $_SESSION['notification'] = $notification;
            } else {
                if ($isEditMode) {
                    $edit_data = array(
                        'DepartmentID' => $department,
                        'TermType' => $term_type,
                        'TermYearFrom' => $term_year_from,
                        'TermYearTo' => $term_year_to
                    );
                    $success = $calendarsService->update($id, $edit_data);
                    if ($success) {
                        $notification = array(
                            "message" => "Calender updated successfully",
                            "type" => "success",
                        );
                        $_SESSION['notification'] = $notification;
                    } else {
                        $notification = array(
                            "message" => "Error updating calendar",
                            "type" => "danger",
                        );
                        $_SESSION['notification'] = $notification;
                    }
                } else {
                    try {
                        $pdf_file = handleFileUpload("pdf_file", "academic_calendar/", [".pdf"]);
                        $add_data = array(
                            'DepartmentID' => $department,
                            'TermType' => $term_type,
                            'TermYearFrom' => $term_year_from,
                            'TermYearTo' => $term_year_to,
                            'FileName' => $pdf_file
                        );
                        $success = $calendarsService->save($add_data);
                        if ($success) {
                            $notification = array(
                                "message" => "Calendar added successfully",
                                "type" => "success",
                            );
                            $_SESSION['notification'] = $notification;
                        } else {
                            $notification = array(
                                "message" => "Error adding calendar",
                                "type" => "danger",
                            );
                            $_SESSION['notification'] = $notification;
                        }
                        $conn->close();
                    } catch (Exception $e) {
                        echo "<script>alert('Error: " . $e->getMessage() . "')</script>";
                    }
                }

                if (isset($success)) {
                    header("Location: calendar.php");
                    exit();
                } else {
                    echo "Error: " . $conn->error;
                }
            }
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>GP Ahmedabad Admin Portal</title>
<meta content="" name="description">
<meta content="" name="keywords">
<link href="assets/img/Icon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
    href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i"
    rel="stylesheet">
<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="assets/css/style.css" rel="stylesheet">
</head>

<body>

    <?php include 'header_nav.php'; ?>

    <main id="main" class="main">
        <div class="main-spacing">
            <div class="custom-breadcrumb">
                <div>
                    <h3 style="font-weight: 600;"><?php echo $isEditMode ? 'Edit Calendar' : 'Add Calendar'; ?></h3>
                    <div class="breadcrumb-link">
                        <ul class="text-primary">
                            <li><a class="text-primary" href="index.php">Dashboard</a></li>
                            <li><a class="text-primary" href="calendar.php">Academic Calendar</a></li>
                            <li class="disabled text-secondary"><?php echo $isEditMode ? 'Edit' : 'Add'; ?></li>
                        </ul>
                    </div>
                </div>
            </div>

            <section class="section">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;">
                            <div class="card-body">
                                <form method="POST" class="form" enctype="multipart/form-data" action="">
                                    <div class=" row mb-3">
                                        <label class="col-sm-2 col-form-label" for="department">Department</label>
                                        <div class="col-sm-10">
                                            <select class="form-control" id="department" name="department" required
                                                <?php echo $_SESSION["isSuperAdmin"] ? '' : 'disabled="true"'; ?>>
                                                <option value="selectdep" selected>--Select--</option>
                                                <?php
                                                if ($_SESSION["isSuperAdmin"]) {
                                                    $sqlDegree = "SELECT * FROM `department`";
                                                    $Degrees = $conn->query($sqlDegree);
                                                    while ($row = mysqli_fetch_array($Degrees)) {
                                                        $selected = ($isEditMode && $calendar['DepartmentID'] == $row['DepartmentID']) ? 'selected' : '';
                                                        echo "<option value='" . $row['DepartmentID'] . "' $selected>" . $row['DepartmentID'] . " - " . $row['DepartmentName'] . "</option>";
                                                    }
                                                } else {
                                                    $sqlDegree = "SELECT * FROM `department` WHERE DepartmentID = '$DepartmentID'";
                                                    $Degrees = $conn->query($sqlDegree);
                                                    $row = mysqli_fetch_array($Degrees);
                                                    echo "<option value='" . $row['DepartmentID'] . "'selected disabled='true'>" . $row['DepartmentID'] . " - " . $row['DepartmentName'] . "</option>";
                                                }
                                                ?>
                                            </select>
                                        </div>
                                    </div>

                                    <div class=" row mb-3">
                                        <label class="col-sm-2 col-form-label" for="term_type">Term Type</label>
                                        <div class="col-sm-10">
                                            <select class="form-control" id="term_type" name="term_type" required>
                                                <option value="Select term type" selected>--Select--</option>
                                                <option value="Even" <?php echo $isEditMode && $calendar['TermType'] == "Even" ? 'selected' : ''; ?>>Even</option>
                                                <option value="Odd" <?php echo $isEditMode && $calendar['TermType'] == "Odd" ? 'selected' : ''; ?>>Odd</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <label for="term_year_from" class="col-sm-2 col-form-label">Term Year
                                            From</label>
                                        <div class="col-sm-10">
                                            <input type="number" id="term_year_from" name="term_year_from"
                                                class="form-control"
                                                value="<?php echo $isEditMode ? $calendar['TermYearFrom'] : ''; ?>"
                                                required>
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <label for="term_year_to" class="col-sm-2 col-form-label">Term Year From</label>
                                        <div class="col-sm-10">
                                            <input type="number" id="term_year_to" name="term_year_to"
                                                class="form-control"
                                                value="<?php echo $isEditMode ? $calendar['TermYearTo'] : ''; ?>"
                                                required>
                                        </div>
                                    </div>

                                    <?php if ($isEditMode) { ?>
                                        <div class="row mb-3">
                                            <label for="pdf_file" class="col-sm-2 col-form-label">File Name</label>
                                            <div class="col-sm-10">
                                                <input type="text" id="pdf_file" name="pdf_file" class="form-control"
                                                    value="<?php echo basename($calendar['FileName']); ?>" readonly
                                                    required>
                                            </div>
                                        </div>
                                    <?php } else { ?>
                                        <div class="row mb-3">
                                            <label for="pdf_file" class="col-sm-2 col-form-label">File</label>
                                            <div class="col-sm-10">
                                                <input type="file" id="pdf_file" name="pdf_file" class="form-control"
                                                    accept=".pdf" required>
                                            </div>
                                        </div>
                                    <?php } ?>

                                    <div class="row mb-3">
                                        <div class="col-sm-10 offset-sm-2">
                                            <button type="submit" name="onsubmit"
                                                class="btn btn-primary"><?php echo $isEditMode ? 'Update' : 'Add'; ?></button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </main>

    <?php include "footer.php"; ?>
</body>

</html>