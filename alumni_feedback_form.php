<?php
session_start();
require('toasts.php');

if (isset($_POST["submit"])) {
  $formData = $_POST;

  // Required fields
  $requiredFields = [
    "name", "address", "pass_out_year", "branch", "mobile", "email",
    "organization_and_designation", "curriculum_meeting_needs", "adequate_knowledge",
    "faculty_cooperation", "student_teacher_relationship", "industry_academia_bridge",
    "campus_placement_opportunities", "career_counselling", "extracurricular_activities",
    "infrastructure", "grievance_redressal"
  ];

  $emptyFields = array();
  foreach ($requiredFields as $field) {
    if (empty($_POST[$field])) {
      $emptyFields[] = $field;
    }
  }

  if (!empty($emptyFields)) {
    $_SESSION['formData'] = $formData;
    $notification = array(
      "message" => "Please fill in all required fields.",
      "type" => "danger",
    );
    $_SESSION['notification'] = $notification;
    header("Location: alumnus_feedback.php");
    exit();
  }

  require 'server_config.php';

  try {
    $stmt = $conn->prepare("INSERT INTO alumnus_feedback (name, address, pass_out_year, branch, mobile, email, higher_study_institute, organization_and_designation, curriculum_meeting_needs, adequate_knowledge, faculty_cooperation, student_teacher_relationship, industry_academia_bridge, campus_placement_opportunities, career_counselling, extracurricular_activities, infrastructure, grievance_redressal, other_suggestions) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

    $stmt->bind_param(
      "ssisissiiiiiiiiiiis",
      $_POST["name"],
      $_POST["address"],
      $_POST["pass_out_year"],
      $_POST["branch"],
      $_POST["mobile"],
      $_POST["email"],
      $_POST["higher_study_institute"],
      $_POST["organization_and_designation"],
      $_POST["curriculum_meeting_needs"],
      $_POST["adequate_knowledge"],
      $_POST["faculty_cooperation"],
      $_POST["student_teacher_relationship"],
      $_POST["industry_academia_bridge"],
      $_POST["campus_placement_opportunities"],
      $_POST["career_counselling"],
      $_POST["extracurricular_activities"],
      $_POST["infrastructure"],
      $_POST["grievance_redressal"],
      $_POST["other_suggestions"]
    );

    if ($stmt->execute()) {
      $notification = array(
        "message" => "Feedback submitted successfully",
        "type" => "success",
      );
      $_SESSION['notification'] = $notification;
    } else {
      throw new Exception("Error: " . $stmt->error);
    }
  } catch (Exception $e) {
    error_log($e->getMessage(), 3, 'error_log.txt');
    $notification = array(
      "message" => "An error occurred while submitting your feedback. Please try again later.",
      "type" => "danger",
    );
    $_SESSION['notification'] = $notification;
  } finally {
    $conn->close();
  }

  header("Location: alumni_feedback.php");
  exit();
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>GP Ahmedabad Alumnus Feedback Form</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <link href="assets/img/Icon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">

  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
  <link href="assets/css/style.css" rel="stylesheet">

</head>

<body>

  <main>
    <div class="container">

      <section class="section register d-flex flex-column align-items-center justify-content-center" style="min-height: 90vh;">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-8 col-md-10 d-flex flex-column align-items-center justify-content-center">

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
                    <h5 class="card-title text-center pb-0 fs-4">Alumnus Feedback Form</h5>
                    <p class="text-center small">Please fill in the feedback form below</p>
                  </div>

                  <form class="row g-3 needs-validation" novalidate method="POST">

                    <?php
                    $formData = isset($_SESSION['formData']) ? $_SESSION['formData'] : [];
                    ?>

                    <div class="col-12">
                      <label for="name" class="form-label">Name of Alumnus</label>
                      <input type="text" name="name" class="form-control" id="name" value="<?= isset($formData['name']) ? $formData['name'] : '' ?>" required>
                      <div class="invalid-feedback">Please enter your name.</div>
                    </div>

                    <div class="col-12">
                      <label for="address" class="form-label">Address for Correspondence</label>
                      <textarea name="address" class="form-control" id="address" rows="3" required><?= isset($formData['address']) ? $formData['address'] : '' ?></textarea>
                      <div class="invalid-feedback">Please enter your address.</div>
                    </div>

                    <div class="col-12">
                      <label for="pass_out_year" class="form-label">Year of Pass Out</label>
                      <select name="pass_out_year" class="form-select" id="pass_out_year" required>
                        <option value="" selected disabled>Select Year</option>
                        <?php
                        $currentYear = date('Y');
                        for ($year = 2000; $year <= $currentYear; $year++) {
                          $selected = (isset($formData['pass_out_year']) && $formData['pass_out_year'] == $year) ? 'selected' : '';
                          echo "<option value=\"$year\" $selected>$year</option>";
                        }
                        ?>
                      </select>
                      <div class="invalid-feedback">Please select your pass out year.</div>
                    </div>

                    <div class="col-12">
                      <label for="branch" class="form-label">Branch</label>
                      <select name="branch" class="form-select" id="branch" required>
                        <option value="" selected disabled>Select Branch</option>
                        <?php
                        $branches = [
                          "Automobile Engineering", "Biomedical Engineering", "Civil Engineering",
                          "Computer Engineering", "Electrical Engineering", "Electronics & Communication Engineering",
                          "Instrumentation & Control Engineering", "Information Technology", "Mechanical Engineering",
                          "Plastic Engineering", "Architecture", "Automation and Robotics",
                          "Information and communication Technology", "Mechanical (CAD/CAM)"
                        ];
                        foreach ($branches as $branch) {
                          $selected = (isset($formData['branch']) && $formData['branch'] == $branch) ? 'selected' : '';
                          echo "<option value=\"$branch\" $selected>$branch</option>";
                        }
                        ?>
                      </select>
                      <div class="invalid-feedback">Please select your branch.</div>
                    </div>

                    <div class="col-12">
                      <label for="mobile" class="form-label">Mobile No.</label>
                      <input type="tel" name="mobile" class="form-control" id="mobile" value="<?= isset($formData['mobile']) ? $formData['mobile'] : '' ?>" pattern="[0-9]{10}" minlength="10" maxlength="10" required>
                      <div class="invalid-feedback">Please enter your mobile number.</div>
                    </div>

                    <div class="col-12">
                      <label for="email" class="form-label">E-mail</label>
                      <input type="email" name="email" class="form-control" id="email" value="<?= isset($formData['email']) ? $formData['email'] : '' ?>" required>
                      <div class="invalid-feedback">Please enter a valid email address.</div>
                    </div>

                    <div class="col-12">
                      <label for="higher_study_institute" class="form-label">If in higher study - Name of Institute</label>
                      <input type="text" name="higher_study_institute" class="form-control" id="higher_study_institute" value="<?= isset($formData['higher_study_institute']) ? $formData['higher_study_institute'] : '' ?>">
                    </div>

                    <div class="col-12">
                      <label for="organization_and_designation" class="form-label">If in service/self-employed name of organization, Designation</label>
                      <input type="text" name="organization_and_designation" class="form-control" id="organization_and_designation" value="<?= isset($formData['organization_and_designation']) ? $formData['organization_and_designation'] : '' ?>" required>
                      <div class="invalid-feedback">Please enter your organization and designation.</div>
                    </div>

                    <?php
                    $questions = [
                      "curriculum_meeting_needs" => "The extent to which the curriculum is meeting the industrial/professional needs",
                      "adequate_knowledge" => "Do you feel that adequate knowledge was gained during your course of study",
                      "faculty_cooperation" => "Were the faculty members cooperative for academic support and overall development?",
                      "student_teacher_relationship" => "How do you rate student teacher relationship as a whole?",
                      "industry_academia_bridge" => "How do you rate the academic initiatives taken by the college to bridge the gap between industry & academia",
                      "campus_placement_opportunities" => "Has the T&P Cell provided ample On Campus placement opportunities?",
                      "career_counselling" => "Have you availed career counselling and guidance for higher studies from T&P Cell?",
                      "extracurricular_activities" => "How do you rate Co-curricular/Extra-curricular activities, sports activities at institute",
                      "infrastructure" => "Infrastructural facility at institute, Drinking water, Toilet blocks",
                      "grievance_redressal" => "Grievances/Problems are Redressed/Solved well in time"
                    ];

                    $options = [
                      "5" => "5 - Excellent",
                      "4" => "4 - Very Good",
                      "3" => "3 - Good",
                      "2" => "2 - Satisfactory",
                      "1" => "1 - Poor"
                    ];

                    foreach ($questions as $fieldId => $question) {
                      $selectedOption = isset($formData[$fieldId]) ? $formData[$fieldId] : '';
                      echo "<div class='col-12'>
                                                    <label class='form-label'>$question</label>";
                      foreach ($options as $value => $option) {
                        $checked = $selectedOption == $value ? 'checked' : '';
                        echo "<div class='form-check'>
                                                        <input class='form-check-input' type='radio' name='$fieldId' id='{$fieldId}{$value}' value='$value' $checked required>
                                                        <label class='form-check-label' for='{$fieldId}{$value}'>$option</label>
                                                      </div>";
                      }
                      echo "<div class='invalid-feedback'>Please select an option.</div></div>";
                    }
                    ?>

                    <div class="col-12">
                      <label for="other_suggestions" class="form-label">Any other suggestions</label>
                      <textarea name="other_suggestions" class="form-control" id="other_suggestions" rows="3"><?= isset($formData['other_suggestions']) ? $formData['other_suggestions'] : '' ?></textarea>
                    </div>

                    <div class="col-12">
                      <button class="btn btn-primary w-100" type="submit" name="submit">Submit Feedback</button>
                    </div>
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
            unset($_SESSION['formData']);
          }
          ?>
        </div>
      </section>

    </div>
  </main>

  <?php include "footer.php" ?>

</body>
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script>
  (function() {
    'use strict'

    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.querySelectorAll('.needs-validation')

    // Loop over them and prevent submission
    Array.prototype.slice.call(forms)
      .forEach(function(form) {
        form.addEventListener('submit', function(event) {
          if (!form.checkValidity()) {
            event.preventDefault()
            event.stopPropagation()
          }

          form.classList.add('was-validated')
        }, false)
      })
  })()
</script>

</html>