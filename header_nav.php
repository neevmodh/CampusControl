<?php
// session_start();

if (!isset($_SESSION["FacultyID"])) {
  header("Location: index.php");
  exit();
}

require 'server_config.php';
require_once 'toasts.php';
require_once './services/department_service.php';

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$DepartmentID = $_SESSION["SavedDeptID"];
$DepartmentName = $_SESSION['SavedDeptName'];
$FacultyID = $_SESSION["FacultyID"];

$departmentService = new DepartmentService();

$sql = "SELECT * FROM `faculty` WHERE `FacultyID` = '$FacultyID'";
$result = $conn->query($sql);
$data = $result->fetch_array();

$prefix = $data["Prefix"];
$FirstName = $data["FirstName"];
$LastName = $data['LastName'];
$photo = $data['Photo'];

if (isset($_POST['signout'])) {
  $newData = json_encode([]);
  $oldData = json_encode([]);
  $userInfo = new UserInfo();
  $transDetails = json_encode($userInfo->get_user_details());
  $sqlLOG = "INSERT INTO `log` (`DepartmentID`, `FacultyID`, `new_data`, `old_data`, `TransDetails`,`log_title`) 
            VALUES ('$DepartmentID', '$FacultyID', '$newData', '$oldData', '$transDetails', 'Logged Out')";
  $conn->query($sqlLOG);
  session_unset();
  session_destroy();

  header('Location: login.php');
  exit();
}

$current_page = basename($_SERVER['PHP_SELF']);
?>

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>GP Ahmedabad Admin Portal</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <link href="assets/img/icon.ico" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link
        href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
        rel="stylesheet">

    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">

    <link href="assets/css/style.css" rel="stylesheet">

    <style>
    @media screen and (min-width:1200px) {
        .active-side-tab {
            background: #e0e9fa !important;
            border-radius: 10px !important;
        }

        .main-div #btn-none {
            display: none;
        }
    }

    .nav-item {
        border-radius: 10px;
    }

    .nav-item:hover {
        background: #e0e9fa;
        color: white !important;
    }

    .sub-nav-item:hover {
        background: none !important;
        list-style-type: disc;
        list-style: unset !important;
    }

    .sub-nav-item {
        color: #4154f1;
    }

    .sub-nav-item a {
        justify-content: space-between;
    }

    select:disabled {
        background-color: #e9ecef;
        cursor: not-allowed;
    }
    </style>
</head>

<header id="header" class="header fixed-top d-flex align-items-center">

    <div class="main-div d-flex align-items-center justify-content-between ">
        <div class="image-container">
            <img src="assets/img/Icon.png" style="width: 50px; height: 50px;" alt="">
        </div>
        <div class="text-container">
            <a href="" class="logo d-flex align-items-center " style="text-decoration: none; width:fit-content;">
                <span class="d-none d-lg-block">GP Ahmedabad</span>
            </a>
        </div>
        <i id="btn-none" class="bi bi-list toggle-sidebar-btn"></i>
    </div>

    <nav class="header-nav ms-auto d-flex">
        <?php if ($_SESSION['isSuperAdmin']) { ?>
        <div class="d-flex justify-content-end align-items-center">
            <label for="switch-department-toggle"
                style="width: fit-content; text-wrap: nowrap;font-weight: 600;color: rgb(5 24 57 / 72%);">Current
                Department:</label>
            <select class="form-select ms-2" id="switch-department-toggle"
                <?php echo !$_SESSION['isSuperAdmin'] ? 'disabled' : '' ?>>
                <?php
          $rows = $departmentService->fetchAll();
          foreach ($rows as $row) {
            echo '<option value=' . $row['DepartmentID'];
            echo ($row['DepartmentID'] == $_SESSION['DepartmentID']) ? ' selected' : '';
            echo '>' . $row['DepartmentName'] . '</option>';
          }
          ?>
            </select>
        </div>
        <?php } ?>
        <ul class="ms-2 d-flex align-items-center">

            <li class="nav-item dropdown pe-3">

                <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
                    <img src="<?php echo $photo; ?>" alt="Profile" class="rounded-circle object-fit-cover "
                        style="width: 40px; height: 35px; border-radius: 50%;">

                    <span class="d-none d-md-block dropdown-toggle ps-2">
                        <?php echo "$prefix $FirstName $LastName"; ?>
                    </span>
                </a>

                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                    <li class="dropdown-header">
                        <h6>
                            <?php echo "$prefix $FirstName $LastName"; ?>
                        </h6>

                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li>
                        <form method="POST">
                            <div class="btn w-100">
                                <a class="dropdown-item d-flex align-items-center w-100" href="#">
                                    <i class="bi bi-box-arrow-right"></i>
                                    <button class="btn border-none btn-primary w-100" name="signout">Sign Out</button>
                                </a>
                            </div>
                        </form>
                    </li>

                </ul>
            </li>

        </ul>
    </nav>

</header>
<section>
    <div class="toast-container position-fixed top-0 end-0 p-3" id="toast-container">
        <?php
    if (isset($_SESSION['notification'])) {
      $notification = $_SESSION['notification'];
      echo toast($notification['message'], $notification['type'], true, true, 3000);
      unset($_SESSION['notification']);
    }
    ?>
    </div>
</section>
<aside id="sidebar" class="sidebar">
    <ul class="sidebar-nav" id="sidebar-nav">
        <li class="nav-item">
            <a class="nav-link bg-transparent <?php echo $current_page == 'index.php' ? 'active-side-tab' : ''; ?>"
                href="index.php">
                <i class="bi bi-person-square"></i>
                <span>Dashboard</span>
            </a>
        </li>

        <?php if ($_SESSION["isSuperAdmin"]) { ?>
        <li class="nav-item">
            <a class="nav-link bg-transparent <?php echo $current_page == 'faculty.php' ? 'active-side-tab' : ''; ?>"
                href="faculty.php">
                <i class="bi bi-people-fill"></i>
                <span>Faculties</span>
            </a>
        </li>
        <?php } ?>

        <li class="nav-item">
            <a class="nav-link bg-transparent <?php echo $current_page == 'edit-profile.php' ? 'active-side-tab' : ''; ?>"
                href="edit-profile.php">
                <i class="bi bi-pencil-square"></i>
                <span>Edit Your Profile</span>
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link bg-transparent <?php echo $current_page == 'facEducation.php' ? 'active-side-tab' : ''; ?>"
                href="facEducation.php">
                <i class="bi bi-mortarboard"></i>
                <span>Faculty Education</span>
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link bg-transparent <?php echo $current_page == 'facExperience.php' ? 'active-side-tab' : ''; ?>"
                href="facExperience.php">
                <i class="bi bi-briefcase"></i>
                <span>Faculty Experience</span>
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link bg-transparent <?php echo $current_page == 'facTraining.php' ? 'active-side-tab' : ''; ?>"
                href="facTraining.php">
                <i class="bi bi-tools"></i>
                <span>Faculty Training Details</span>
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link bg-transparent <?php echo $current_page == 'publication.php' ? 'active-side-tab' : ''; ?>"
                href="publication.php">
                <i class="bi bi-book"></i>
                <span>Faculty Publication</span>
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link bg-transparent <?php echo $current_page == 'change_pass.php' ? 'active-side-tab' : ''; ?>"
                href="change_pass.php">
                <i class="bi bi-gear-fill"></i>
                <span>Change Password</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link bg-transparent <?php echo $current_page == 'calendar.php' ? 'active-side-tab' : ''; ?>"
                href="calendar.php">
                <i class="bi bi-calendar-plus"></i>
                <span>Academic Calendar</span>
            </a>
        </li>
        <?php
    if ($_SESSION["isDepartmentAdmin"] || $_SESSION["isSuperAdmin"]) {
    ?>
        <li class="nav-item">
            <a class="nav-link bg-transparent <?php echo $current_page == 'Imp_link_panel.php' ? 'active-side-tab' : ''; ?>"
                href="Imp_link_panel.php">
                <i class="bi bi-link"></i>
                <span>Important Links</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link bg-transparent <?php echo $current_page == 'activity.php' ? 'active-side-tab' : ''; ?>"
                href="activity.php">
                <i class="bi bi-activity"></i>
                <span>Activity</span>
            </a>
        </li>
        <li class="nav-item sub-nav-item">
            <a class="nav-link bg-transparent" data-bs-toggle="collapse" role="button" aria-expanded="false"
                data-bs-target="#new-tab">
                <div>
                    <i class="bi bi-journal"></i>
                    <span>Academic Program</span>
                </div>
                <i class="bi bi-caret-down-fill"></i>
            </a>
            <div class="collapse" id="new-tab">
                <ul>
                    <li class="nav-item">
                        <a href="subjects.php"
                            class="nav-link bg-transparent <?php echo $current_page == 'subjects.php' ? 'active-side-tab' : ''; ?>">
                            <div>
                                <i class="bi bi-circle-fill" style="font-size: small;"></i>
                                <span>Subjects</span>
                            </div>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="subject_material.php"
                            class="nav-link bg-transparent <?php echo $current_page == 'subject_material.php' ? 'active-side-tab' : ''; ?>">
                            <div>
                                <i class="bi bi-circle-fill" style="font-size: small;"></i>
                                <span>Subject Material</span>
                            </div>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="gtu_question_paper.php"
                            class="nav-link bg-transparent <?php echo $current_page == 'gtu_question_paper.php' ? 'active-side-tab' : ''; ?>">
                            <div>
                                <i class="bi bi-circle-fill" style="font-size: small;"></i>
                                <span>GTU Question Papers</span>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
        </li>

        <?php if ($_SESSION["isAdmin"] == 'Yes') {  ?>
        <li class="nav-item">
            <a class="nav-link bg-transparent <?php echo $current_page == 'i_ehome.php' ? 'active-side-tab' : ''; ?>"
                href="i_ehome.php">
                <i class="bi bi-images"></i>
                <span>Institute Gallery</span>
            </a>
        </li>
        <?php }
            if ($_SESSION["isAdmin"] or $_SESSION["isDAdmin"]) { ?>
        <li class="nav-item">
            <a class="nav-link bg-transparent <?php echo $current_page == 'ehome.php' ? 'active-side-tab' : ''; ?>"
                href="ehome.php">
                <i class="bi bi-images"></i>
                <span>Event Gallery</span>
            </a>
        </li>
        <?php } ?>
        </li>

       <li class="nav-item">
        <a class="nav-link bg-transparent <?php echo $current_page == 'LaboratoryDetails.php' ? 'active-side-tab' : ''; ?>" href="LaboratoryDetails.php">
          <div>
          <i class="bi bi-laptop"></i>
            <span>Laboratory Details</span>
          </div>
        </a>
      </li>
      <?php
    $admin= $_SESSION["isAdmin"];
    if($admin=="true" ||$admin=="yes"||$admin==1||$admin=="Yes"||$admin=="True"){
    ?>
    <li class="nav-item">
        <a class="nav-link bg-transparent <?php echo $current_page == 'admission.php' ? 'active-side-tab' : ''; ?>" href="admission.php">
          <i class="bi bi-journal"></i>
          <span>Diploma Admissions & Courses</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link bg-transparent <?php echo $current_page == 'C_TO_D.php' ? 'active-side-tab' : ''; ?>" href="C_TO_D.php">
          <i class="bi bi-journal"></i>
          <span>C to D Diploma Admissions & Courses</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link bg-transparent <?php echo $current_page == 'committe.php' ? 'active-side-tab' : ''; ?>" href="committe.php">
          <i class="bi bi-journal"></i>
          <span>Admin Committees</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link bg-transparent <?php echo $current_page == 'committe_member.php' ? 'active-side-tab' : ''; ?>" href="committe_member.php">
          <i class="bi bi-journal"></i>
          <span>Admin Committees Member</span>
        </a>
      </li>
    <?php } ?>

        <li class="nav-item sub-nav-item">
            <a class="nav-link bg-transparent" data-bs-toggle="collapse" role="button" aria-expanded="false"
                data-bs-target="#feedback-tab">
                <div>
                    <i class="bi bi-ui-radios-grid"></i>
                    <span>Feedback Forms</span>
                </div>
                <i class="bi bi-caret-down-fill"></i>
            </a>
            <div class="collapse" id="feedback-tab">
                <ul>
                    <li class="nav-item">
                        <a href="parents_feedback.php"
                            class="nav-link bg-transparent <?php echo $current_page == 'parents_feedback.php' ? 'active-side-tab' : ''; ?>">
                            <div>
                                <i class="bi bi-circle-fill" style="font-size: small;"></i>
                                <span>Parents Feedback</span>
                            </div>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="alumni_feedback.php"
                            class="nav-link bg-transparent <?php echo $current_page == 'alumni_feedback.php' ? 'active-side-tab' : ''; ?>">
                            <div>
                                <i class="bi bi-circle-fill" style="font-size: small;"></i>
                                <span>Alumni Feedback</span>
                            </div>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="industry_feedback.php"
                            class="nav-link bg-transparent <?php echo $current_page == 'industry_feedback.php' ? 'active-side-tab' : ''; ?>">
                            <div>
                                <i class="bi bi-circle-fill" style="font-size: small;"></i>
                                <span>Industry Feedback</span>
                            </div>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="facilities_feedback.php"
                            class="nav-link bg-transparent <?php echo $current_page == 'facilities_feedback.php' ? 'active-side-tab' : ''; ?>">
                            <div>
                                <i class="bi bi-circle-fill" style="font-size: small;"></i>
                                <span>Facilities Feedback</span>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
        </li>

        <li class="nav-heading">Department</li>
        <li class="nav-item">
            <a class="nav-link bg-transparent <?php echo $current_page == 'edit-dept-about.php' ? 'active-side-tab' : ''; ?>"
                href="edit-dept-about.php">
                <i class="bi bi-pencil-square"></i>
                <span>Edit Department About</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link bg-transparent <?php echo $current_page == 'edit-dept-details.php' ? 'active-side-tab' : ''; ?>"
                href="edit-dept-details.php">
                <i class="bi bi-info-circle"></i>
                <span>Edit Department Details</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link bg-transparent <?php echo $current_page == 'magazine.php' ? 'active-side-tab' : ''; ?>"
                href="magazine.php">
                <i class="bi bi-book-half"></i>
                <span>Department Magazine</span>
            </a>
        </li>
        <?php if ($_SESSION["isSuperAdmin"]) { ?>
        <li class="nav-item">
            <a class="nav-link bg-transparent <?php echo $current_page == 'disclosure.php' ? 'active-side-tab' : ''; ?>"
                href="disclosure.php">
                <i class="bi bi-file-earmark-text"></i>
                <span>Disclosure</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link bg-transparent <?php echo $current_page == 'aicte_eoa_approvals.php' ? 'active-side-tab' : ''; ?>"
                href="aicte_eoa_approvals.php">
                <i class="bi bi-file-earmark-text"></i>
                <span>AICTE EOA Approvals</span>
            </a>
        </li>
        <?php } ?>
        <?php } ?>
    </ul>
</aside>

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>

<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/vendor/jquery/jquery-3.7.1.min.js"></script>
<script src="assets/vendor/jquery-datatables/jquery.dataTables.min.js"></script>
<script src="assets/js/main.js"></script>
<script defer src="assets/js/switch-dept.js" type="module"></script>

</body>

</html>
