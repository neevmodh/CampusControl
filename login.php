<?php
session_start();
require('toasts.php');
require 'user_info.php';

if (isset($_SESSION["FacultyID"])) {
  header("Location: index.php");
}

if (isset($_POST["submit"]) && isset($_POST["email"]) && isset($_POST["password"])) {
  $formEmail = $_POST["email"];
  $formPassword = $_POST["password"];

  require 'server_config.php';
  if ($conn->connect_error) {
    $notification = array(
      "message" => "Invalid Username or Password",
      "type" => "warning",
    );
    $_SESSION['notification'] = $notification;
    ("Location : login.php");
    exit();
  }

  $sql = "SELECT faculty.*,  department.* FROM  faculty LEFT JOIN     department   ON   faculty.DepartmentID = department.DepartmentID WHERE  faculty.UserName = '$formEmail' AND  faculty.Password = BINARY '$formPassword'
";
  $result = $conn->query($sql);

  if ($result->num_rows == 1) {
    $row = $result->fetch_array();
    $_SESSION["isAdmin"] = $row["isAdmin"];
    if ($row['isDAdmin'] == "Yes" || $row['isDAdmin'] == "yes" || $row['isDAdmin'] == "true") {
      $_SESSION["isDepartmentAdmin"] = true;
    } else {
      $_SESSION["isDepartmentAdmin"] = false;
    }

    if ($row['isAdmin'] == "Yes" || $row['isAdmin'] == "yes" || $row['isAdmin'] == "true") {
      $_SESSION["isSuperAdmin"] = true;
    } else {
      $_SESSION["isSuperAdmin"] = false;
    }

    $_SESSION["DepartmentID"] = $row["DepartmentID"];
    $_SESSION["DepartmentName"] = $row["DepartmentName"];
    $_SESSION["isSuperAdmin"] ? $_SESSION['SavedDeptID'] = $row["DepartmentID"] : $_SESSION['SavedDeptID'] = $_SESSION["DepartmentID"];
    $_SESSION["isSuperAdmin"] ? $_SESSION['SavedDeptName'] = $row["DepartmentName"] : $_SESSION['SavedDeptName'] = $_SESSION["DepartmentName"];
    $_SESSION["FacultyID"] = $row["FacultyID"];
    $_SESSION["FacultyName"] = $row["Prefix"] . " " . $row["FirstName"] . " " . $row["LastName"];
    $DepartmentID = $_SESSION["DepartmentID"];
    $FacultyID = $_SESSION["FacultyID"];
    $newData = json_encode([]);
    $oldData = json_encode([]);
    $userInfo = new UserInfo();
    $transDetails = json_encode($userInfo->get_user_details());
    $sqlLOG = "INSERT INTO `log` (`DepartmentID`, `FacultyID`, `new_data`, `old_data`, `TransDetails`,`log_title`) 
            VALUES ('$DepartmentID', '$FacultyID', '$newData', '$oldData', '$transDetails', 'Logged In')";
    $conn->query($sqlLOG);
    if ($row["Password"] == $row["FirstName"]) {
      header("Location: change_pass.php");
      exit();
    } else {
      $notification = array(
        "message" => "Login Success",
        "type" => "success",
      );
      $_SESSION['notification'] = $notification;
      var_dump($_SESSION);
      header("Location: index.php");
      exit();
    }
  } else {
    $notification = array(
      "message" => "Invalid Username or Password",
      "type" => "warning",
    );
    $_SESSION['notification'] = $notification;
  }

  $conn->close();
}
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

  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
  <link href="assets/css/style.css" rel="stylesheet">

</head>

<body>

  <main>
    <div class="container">

      <section class="section register  d-flex flex-column align-items-center justify-content-center" style="min-height: 90vh;">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

              <div class="d-flex align-items-center justify-content-between">
                <div class="image-container">
                  <img src="assets/img/Icon.png" style="width: 60px; height: 60px;" alt="">
                </div>
                <div class="text-container">
                  <a href="index.html" class="logo d-flex align-items-center" style="width:fit-content">
                    <span class="d-none d-lg-block">GP Ahmedabad</span>
                  </a>
                </div>
              </div>

              <div class="card mb-3">

                <div class="card-body">

                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">Login to Your Account</h5>
                    <p class="text-center small">Enter your email & password to login</p>
                  </div>

                  <form class="row g-3 needs-validation" novalidate method="POST">

                    <div class="col-12">
                      <label for="yourUsername" class="form-label">EmailID</label>
                      <div class="input-group has-validation">
                        <input type="text" name="email" class="form-control" id="yourUsername" required>
                        <div class="invalid-feedback">Please enter your EmailID.</div>
                      </div>
                    </div>
                    <div class="col-12">
                      <label for="yourPassword" class="form-label">Password</label>
                      <div class="d-flex justify-content-center align-items-center position-relative">
                        <input type="password" name="password" class="form-control" id="yourPassword" required>
                        <div class="position-absolute" id="togglePassword" style="right: 10px;">
                          <i class="d-flex justify-content-center align-items-center far fa-eye" style="cursor: pointer;"></i>
                        </div>
                      </div>
                      <div class="invalid-feedback">Please enter your password!</div>
                    </div>
                    <div class="col-12">
                      <button class="btn btn-primary w-100" type="submit" name="submit">Login</button>
                    </div>
                    <a href="forgot-password.php">
                      <label class="form-label">Forgot Password ?</label></a>
                  </form>

                </div>
              </div>
            </div>
          </div>
        </div>

      </section>
      <!-- TOAST CONTAINER -->
      <section>
        <div class="toast-container position-fixed top-0 end-0 p-3">
          <?php
          if (isset($_SESSION['notification'])) {
            $notification = $_SESSION['notification'];
            echo toast($notification['message'], $notification['type'], true, true, 3000);
            unset($_SESSION['notification']);
          }
          ?>
        </div>
      </section>

    </div>
  </main>

  <?php include "footer.php" ?>

</body>
<script>
  const togglePassword = document.getElementById('togglePassword');
  const passwordInput = document.getElementById('yourPassword');
  const eyeIcon = togglePassword.querySelector('i');

  togglePassword.addEventListener('click', () => {
    if (passwordInput.type === 'password') {
      passwordInput.type = 'text';
      eyeIcon.classList.remove('fa-eye');
      eyeIcon.classList.add('fa-eye-slash');
    } else {
      passwordInput.type = 'password';
      eyeIcon.classList.remove('fa-eye-slash');
      eyeIcon.classList.add('fa-eye');
    }
  });
</script>
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</html>