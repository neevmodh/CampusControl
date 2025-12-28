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

$DepartmentID = $_SESSION["SavedDeptID"];
$FacultyID = $_SESSION["FacultyID"];

$sql = "select FirstName, LastName from faculty where DepartmentID = $DepartmentID and FacultyID = $FacultyID";
$result = $conn->query($sql);
$arr = mysqli_fetch_array($result);
$FacultyName = $arr['FirstName'] . " " . $arr['LastName'];

$service = new FacultyPublicationService();

$isEditMode = false;
if (isset($_GET['id'])) {
    $isEditMode = true;
    $id = $_GET['id'];
    $publication = $service->fetchOne($id);
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['onsubmit'])) {
    $type = $_POST['pub_type'];
    $department = $_POST['department'];
    $data = [
        'DepartmentID' => $_POST['department'],
        'FacultyID' => $FacultyID,
        'Type' => $_POST['pub_type'],
        'PublicationDate' => $_POST['publication_date'],
        'Title' => $_POST['title'],
        'Author' => $_POST['author'],
        'ConferenceJournal' => $_POST['conjour'],
        'details' => $_POST['details'],
    ];

    if ($department == "selectdep") {
        $notification = array(
            "message" => "Please select the department",
            "type" => "danger",
        );
        $_SESSION['notification'] = $notification;
    } else if ($type == "Select publication type") {
        $notification = array(
            "message" => "Please select the Publication type",
            "type" => "danger",
        );
        $_SESSION['notification'] = $notification;
    } else {
        if ($isEditMode) {
            $success = $service->update($id, $data);
            if ($success) {
                $notification = array(
                    "message" => "Publication updated successfully",
                    "type" => "success",
                );
                $_SESSION['notification'] = $notification;
            } else {
                $notification = array(
                    "message" => "Error updating publication",
                    "type" => "danger",
                );
                $_SESSION['notification'] = $notification;
            }
        } else {
            $success = $service->save($data);
            if ($success) {
                $notification = array(
                    "message" => "Publication added successfully",
                    "type" => "success",
                );
                $_SESSION['notification'] = $notification;
            } else {
                $notification = array(
                    "message" => "Error adding publication",
                    "type" => "danger",
                );
                $_SESSION['notification'] = $notification;
            }
            $conn->close();
        }

        if (isset($success)) {
            header("Location: publication.php");
            exit();
        } else {
            echo "Error: " . $conn->error;
        }
    }


}

if ($isEditMode) {
    $publication = (new FacultyPublicationService())->fetchOne($id);
    if (!$publication) {
        echo "Publication not found.";
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
    <title>GP Ahmedabad Admin Portal</title>
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
                    <h3 style="font-weight: 600;">Faculty Publication</h3>
                    <div class="breadcrumb-link">
                        <ul class="text-primary">
                            <li>
                                <a class="text-primary" href="index.php">Dashboard</a>
                            </li>
                            <li>
                                <a class="text-primary" href="publication.php">Faculty Publication</a>
                            </li>
                            <li class="disabled text-secondary"><?php echo $isEditMode ? 'Edit' : 'Add'; ?></li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="d-flex justify-content-center">
                <div class="d-flex align-items-center w-100">
                    <div class="card w-100">
                        <div class="card-body mt-3 h-100 w-100">
                            <form method="POST" class="form" enctype="multipart/form-data" action="">

                                <div class="row mb-3">
                                    <label class="col-sm-2 col-form-label" for="department">Department</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="department" name="department" required <?php echo $_SESSION["isSuperAdmin"] ? '' : 'disabled="true"'; ?>>
                                            <option value="selectdep" selected>--Select--</option>
                                            <?php
                                            if ($_SESSION["isSuperAdmin"]) {
                                                $sqlDegree = "SELECT * FROM `department`";
                                                $Degrees = $conn->query($sqlDegree);
                                                while ($row = mysqli_fetch_array($Degrees)) {
                                                    $selected = ($isEditMode && $publication['DepartmentID'] == $row['DepartmentID']) ? 'selected' : '';
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

                                <div class="row mb-3">
                                    <label for="faculty_name" class="col-sm-2 col-form-label">Faculty</label>
                                    <div class="col-sm-10">
                                        <input type="text" id="faculty_name" name="faculty_name" class="form-control"
                                            value="<?php echo $FacultyName ?>" readonly required>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label class="col-sm-2 col-form-label" for="pub_type">Type</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="pub_type" name="pub_type" required>
                                            <option value="Select publication type" selected>--Select--</option>
                                            <option value="Research Paper" <?php echo $isEditMode && $publication['Type'] == "Research Paper" ? 'selected' : ''; ?>>Research
                                                Paper
                                            </option>
                                            <option value="Book" <?php echo $isEditMode && $publication['Type'] == "Book" ? 'selected' : ''; ?>>Book</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="publication_date" class="col-sm-2 col-form-label">Publication
                                        Date</label>
                                    <div class="col-sm-10">
                                        <input type="date" id="publication_date" name="publication_date"
                                            class="form-control"
                                            value="<?php echo $isEditMode ? $publication['PublicationDate'] : ''; ?>"
                                            required>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="title" class="col-sm-2 col-form-label">Title</label>
                                    <div class="col-sm-10">
                                        <input type="text" id="title" name="title" class="form-control"
                                            value="<?php echo $isEditMode ? $publication['Title'] : ''; ?>" required>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="author" class="col-sm-2 col-form-label">Author</label>
                                    <div class="col-sm-10">
                                        <input type="text" id="author" name="author" class="form-control"
                                            value="<?php echo $isEditMode ? $publication['Author'] : ''; ?>" required>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="conjour" class="col-sm-2 col-form-label">Conference / Journal</label>
                                    <div class="col-sm-10">
                                        <input type="text" id="conjour" name="conjour" class="form-control"
                                            value="<?php echo $isEditMode ? $publication['ConferenceJournal'] : ''; ?>"
                                            required>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="details" class="col-sm-2 col-form-label">Details</label>
                                    <div class="col-sm-10">
                                        <input type="text" id="details" name="details" class="form-control"
                                            value="<?php echo $isEditMode ? $publication['Details'] : ''; ?>" required>
                                    </div>
                                </div>

                                <!-- <?php if ($isEditMode) { ?>
                                    <div class="row mb-3">
                                        <label for="pdf_file" class="col-sm-2 col-form-label">File Name</label>
                                        <div class="col-sm-10">
                                            <input type="text" id="pdf_file" name="pdf_file" class="form-control"
                                                value="<?php echo basename($calendar['FileName']); ?>" readonly required>
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
                                <?php } ?> -->

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
        </div>
    </main>

    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
            class="bi bi-arrow-up-short"></i></a>
    <script src="ajaxValidation.js"></script>
</body>

</html>