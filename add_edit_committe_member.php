<?php
session_start();
if (!isset($_SESSION["FacultyID"]) || !$_SESSION["isDepartmentAdmin"]) {
  header("Location: login.php");
  exit();
}

require 'server_config.php';
require './services/committe_member.service.php';

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
$DepartmentID = $_SESSION["DepartmentID"];

$committeMemberID = isset($_GET['CommitteMemberId']) ? $_GET['CommitteMemberId'] : null;
$isEditMode = $committeMemberID !== null;

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $CommitteID = htmlspecialchars($_POST["CommitteID"]);
  $FacultyIDs = isset($_POST["FacultyID"]) ? $_POST["FacultyID"] : []; // This will be an array of selected FacultyIDs

  // Fetch the current members of the committee
  $currentMembers = [];
  $sql = "SELECT FacultyID FROM committe_member WHERE CommitteID = ?";
  $stmt = $conn->prepare($sql);
  $stmt->bind_param("i", $CommitteID);
  $stmt->execute();
  $stmt->bind_result($currentFacultyID);
  while ($stmt->fetch()) {
    $currentMembers[] = $currentFacultyID;
  }
  $stmt->close();

  // Determine which members to add and which to remove
  $membersToAdd = array_diff($FacultyIDs, $currentMembers);
  $membersToRemove = array_diff($currentMembers, $FacultyIDs);

  // Remove deselected members
  foreach ($membersToRemove as $FacultyID) {
    $sql = "DELETE FROM committe_member WHERE CommitteID = ? AND FacultyID = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ii", $CommitteID, $FacultyID);
    $stmt->execute();
  }

  // Add selected members
  foreach ($membersToAdd as $FacultyID) {
    $FacultyID = htmlspecialchars($FacultyID);

    // Fetch the DepartmentID of the faculty member
    $sql = "SELECT DepartmentID FROM faculty WHERE FacultyID = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $FacultyID);
    $stmt->execute();
    $stmt->bind_result($facultyDepartmentID);
    $stmt->fetch();
    $stmt->close();

    // Insert into committe_member table
    $sql = "INSERT INTO committe_member (CommitteID, FacultyID, DepartmentID) VALUES (?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("iii", $CommitteID, $FacultyID, $facultyDepartmentID);
    $stmt->execute();
  }

  header("Location: committe_member.php");
  exit();
}

if ($isEditMode) {
  $committeMember = (new CommitteMemberService())->fetchOne($committeMemberID);
  if (!$committeMember) {
    echo "not found.";
    exit();
  }
}

// Fetch committee names and IDs
$committees = [];
$convenerIDs = [];
$sql = "SELECT CommitteID, CommitteName, CommitteConvener FROM committe";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
  while ($row = $result->fetch_assoc()) {
    $committees[] = $row;
    $convenerIDs[] = $row['CommitteConvener'];
  }
}

// Fetch faculty names and IDs, including conveners
$faculty = [];
$conveners = [];
$sql = "SELECT FacultyID, FirstName, LastName, DepartmentID FROM faculty";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
  while ($row = $result->fetch_assoc()) {
    $faculty[] = $row;
    if (in_array($row['FacultyID'], $convenerIDs)) {
      $conveners[$row['FacultyID']] = $row['FirstName'] . ' ' . $row['LastName'];
    }
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
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/css/style.css" rel="stylesheet">
  <style>
    .form-check-input:hover {
      background-color: #e0e0e0;
      border-color: #b0b0b0;
    }
  </style>
</head>

<body>

  <?php include 'header_nav.php' ?>

  <main id="main" class="main">
    <div class="main-spacing">
      <div class="custom-breadcrumb">
        <div>
          <h3 style="font-weight: 600;">Committe Member Management</h3>
          <div class="breadcrumb-link">
                <ul class="text-primary">
                    <li><a class="text-primary" href="index.php">Dashboard</a></li>
                    <li><a class="text-primary" href="committe_member.php">Admin Committe Member</a></li>
                    <li class="disabled text-secondary">Add & Edit</li>
                </ul>
            </div>
        </div>
      </div>

      <div class="d-flex justify-content-center">
        <div class="d-flex align-items-center w-100">
          <div class="card w-100">
            <div class="card-body mt-3 h-100 w-100">
              <form class="form" method="POST">
                <div class="row">
                  <div class="form-group col-md-6 mb-3">
                    <label class="mb-1" for="CommitteID">Committe</label>
                    <select class="form-control" id="CommitteID" name="CommitteID" required>
                      <option value="" disabled <?php echo !$isEditMode ? 'selected' : ''; ?>>Please select</option>
                      <?php foreach ($committees as $committe) : ?>
                        <option value="<?php echo htmlspecialchars($committe['CommitteID']); ?>" data-convener="<?php echo htmlspecialchars($committe['CommitteConvener']); ?>" <?php echo $isEditMode && $committeMember['CommitteID'] == $committe['CommitteID'] ? 'selected' : ''; ?>>
                          <?php echo htmlspecialchars($committe['CommitteName']); ?>
                        </option>
                      <?php endforeach; ?>
                    </select>
                  </div>
                  <div class="form-group col-md-6 mb-3">
                    <label class="mb-1" for="ConvenerID">Convener</label>
                    <select class="form-control" id="ConvenerID" name="ConvenerID" required>
                      <option value="" disabled <?php echo !$isEditMode ? 'selected' : ''; ?>>Please select</option>
                      <?php foreach ($conveners as $convenerID => $convenerName) : ?>
                        <option value="<?php echo htmlspecialchars($convenerID); ?>" <?php echo $isEditMode && $committeMember['ConvenerID'] == $convenerID ? 'selected' : ''; ?>>
                          <?php echo htmlspecialchars($convenerName); ?>
                        </option>
                      <?php endforeach; ?>
                    </select>
                    <input type="hidden" id="ConvenerIDHidden" name="ConvenerID" value="">
                  </div>
                  <div class="form-group col-md-6 mb-3">
                    <label class="mb-1" for="FacultyID">Faculty</label>
                    <div id="FacultyID">
                      <?php foreach ($faculty as $member) : ?>
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" name="FacultyID[]" value="<?php echo htmlspecialchars($member['FacultyID']); ?>" id="faculty-<?php echo htmlspecialchars($member['FacultyID']); ?>">
                          <label class="form-check-label" for="faculty-<?php echo htmlspecialchars($member['FacultyID']); ?>">
                            <?php echo htmlspecialchars($member['FirstName']) . ' ' . htmlspecialchars($member['LastName']) . " --" . htmlspecialchars($member['FacultyID']) . ""; ?>
                          </label>
                        </div>
                      <?php endforeach; ?>
                    </div>
                  </div>
                  <div class="d-flex justify-content-end">
                    <button type="submit" class="btn btn-primary"><?php echo $isEditMode ? 'Update Committe Member' : 'Add Committe Member'; ?></button>
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
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/js/main.js"></script>
  <script>
    document.getElementById('CommitteID').addEventListener('change', function() {
      var selectedOption = this.options[this.selectedIndex];
      var convenerID = selectedOption.getAttribute('data-convener');
      var convenerSelect = document.getElementById('ConvenerID');
      var convenerIDHidden = document.getElementById('ConvenerIDHidden');
      
      for (var i = 0; i < convenerSelect.options.length; i++) {
        if (convenerSelect.options[i].value == convenerID) {
          convenerSelect.selectedIndex = i;
          convenerIDHidden.value = convenerID;
          break;
        }
      }

      // Fetch members of the selected committee
      var committeID = selectedOption.value;
      fetch('fetch_committe_members.php?CommitteID=' + committeID)
        .then(response => response.json())
        .then(data => {
          var facultyCheckboxes = document.querySelectorAll('#FacultyID .form-check-input');
          facultyCheckboxes.forEach(checkbox => {
            checkbox.checked = data.includes(parseInt(checkbox.value));
            checkbox.disabled = (checkbox.value == convenerID); // Disable the convener's checkbox
          });
        });
    });
  </script>
</body>

</html>
