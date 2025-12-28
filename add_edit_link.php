<?php
session_start();
if (!isset($_SESSION["FacultyID"]) || !($_SESSION["isDepartmentAdmin"] || $_SESSION["isSuperAdmin"])) {
    header("Location: login.php");
    exit();
  }

require 'server_config.php';
require './services/Imp_link.service.php';

$implinkService = new ImplinkService();
$DepartmentID = $_SESSION["DepartmentID"];
$FacultyID = $_SESSION["FacultyID"];
$isEditMode = false;
$link = null;

if (isset($_GET['id'])) {
    $isEditMode = true;
    $id = $_GET['id'];
    $link = $implinkService->fetchOne($id);
}

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['onsubmit'])) {
    $department = isset($_POST["department"]) ? $_POST["department"] : $DepartmentID;
    $link_title = $_POST['link_title'];
    $link_url = $_POST['link_url'];
    
    $stmt = $conn->prepare("SELECT MAX(ID) AS max_id FROM importantlinks");
    $stmt->execute();
    $result = $stmt->get_result();
    $row = $result->fetch_assoc();
    $new_id = $row['max_id'] + 1;
    $stmt->close();

    
    $data1 = array(    
        'ID' => $new_id,
        "DepartmentID" => $department,
        "Title" => $link_title,
        "URL" => $link_url,         
    );
    $data = array(    
        "DepartmentID" => $department,
        "Title" => $link_title,
        "URL" => $link_url,         
    );
    $id = $_GET['id'];  
    if ($isEditMode) {
        $success = $implinkService->update($id, $data);
        $message = $success ? "Link updated successfully" : "Link update failed";
    } else {
        $success = $implinkService->save($data1);
        $message = $success ? "Link added successfully" : "Link addition failed";
    }

    $_SESSION['notification'] = array(
        "message" => $message,
        "type" => $success ? "success" : "error",
    );
    header("Location: Imp_link_panel.php");
    exit();
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
                    <h3 style="font-weight: 600;"><?php echo $isEditMode ? 'Edit Link' : 'Add Link'; ?></h3>
                    <div class="breadcrumb-link">
                        <ul class="text-primary">
                            <li><a class="text-primary" href="index.php">Dashboard</a></li>
                            <li><a class="text-primary" href="Imp_link_panel.php">Important Links</a></li>
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
                                                <option selected disabled>--Select--</option>
                                                <?php
                                                    if ($_SESSION["isSuperAdmin"]) {
                                                        $sqlDegree = "SELECT * FROM `department`";
                                                        $Degrees = $conn->query($sqlDegree);
                                                        while ($row = mysqli_fetch_array($Degrees)) {
                                                            $selected = ($isEditMode && $link['DepartmentID'] == $row['DepartmentID']) ? 'selected' : '';
                                                            echo "<option value='" . $row['DepartmentID'] . "' $selected>" . $row['DepartmentID'] . " - " . $row['DepartmentName'] . "</option>";
                                                        }
                                                    } else {
                                                        $sqlDegree = "SELECT * FROM `department` WHERE DepartmentID = '$DepartmentID'";
                                                        $Degrees = $conn->query($sqlDegree);
                                                        $row = mysqli_fetch_array($Degrees);
                                                        echo "<option value='" . $row['DepartmentID'] . "'selected disabled='true'>" . $row['DepartmentID']  . " - " . $row['DepartmentName'] . "</option>";
                                                    }
                                                ?>
                                            </select>
                                        </div>
                                    </div>

                                    <div class=" row mb-3">
                                        <label for="link_title" class="col-sm-2 col-form-label">Link Title</label>
                                        <div class="col-sm-10">
                                            <input type="text" id="link_title" name="link_title" class="form-control"
                                                value="<?php echo $isEditMode ? $link['Title'] : ''; ?>" required>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="link_url" class="col-sm-2 col-form-label">Link URL</label>
                                        <div class="col-sm-10">
                                            <input type="url" id="link_url" name="link_url" class="form-control"
                                                value="<?php echo $isEditMode ? $link['URL'] : ''; ?>" required>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-sm-10 offset-sm-2">
                                            <button type="submit" name="submit"
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