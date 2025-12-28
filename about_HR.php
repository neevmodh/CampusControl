<?php //include "footer.php" ?>

<?php
    $conn = new mysqli("localhost", "root", "", "gpa_admin_panel");
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    
    // Function to get committee data
function getCommitteeData($conn) {
    $sql = "SELECT c.CommitteId, c.CommitteName, f.Prefix, f.FirstName, f.LastName AS Convener, c.Description 
            FROM committe c 
            JOIN faculty f ON c.CommitteConvener = f.FacultyID";
    $result = $conn->query($sql);

    $committees = [];
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $committees[] = $row;
        }
    }
    return $committees;
}

// Function to get committee members
function getCommitteeMembers($conn, $committeeId) {
    $stmt = $conn->prepare("SELECT f.Prefix, f.FirstName, f.LastName, f.DepartmentID 
                            FROM committe_member cm 
                            JOIN faculty f ON cm.FacultyID = f.FacultyID 
                            WHERE cm.CommitteID = ?");
    $stmt->bind_param("i", $committeeId);
    $stmt->execute();
    $result = $stmt->get_result();

    $members = [];
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $members[] = $row;
        }
    }
    $stmt->close();
    return $members;
}

$committees = getCommitteeData($conn);
?>
<!DOCTYPE html>
<html lang="en">

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
</head>

<body>
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.php"><span class="fa fa-home"></span> </a></li>
                <li class="breadcrumb-item"><a href="dept.php">About</a></li>
                <li class="breadcrumb-item active" aria-current="page">Institute Admin Committees</li>
            </ol>
        </nav>
        <h3 class="headingtitle">Institute Admin Committees</h3>
        <div class="container content">

            <div class="row">

                <div class="col-md-3 col-md-push-9 md-margin-bottom-40" style="padding-left: 0px;padding-right: 0px;">

                    <aside itemscope="" itemtype="http://schema.org/WPSideBar">
                        <ul class="list-group sidebar-nav-v1 margin-bottom-40" id="sidebar-nav-1">
                            <li itemprop="name" class="list-group-item active">
                                <a itemprop="url" href="about_HR.php"><i class="fa fa-angle-right"></i>HR (Faculty &
                                    Staff)</a>
                            </li>
                            <li itemprop="name" class="list-group-item ">
                                <a itemprop="url" href="about_student_affairs.php"><i
                                        class="fa fa-angle-right"></i>Student
                                    Affairs</a>
                            </li>
                            <li itemprop="name" class="list-group-item ">
                                <a itemprop="url" href="about_sp.php"><i class="fa fa-angle-right"></i>Store &
                                    Purchase</a>
                            </li>
                            <li itemprop="name" class="list-group-item ">
                                <a itemprop="url" href="about_academics.php"><i class="fa fa-angle-right"></i>Academics
                                </a>
                            </li>
                            <li itemprop="name" class="list-group-item ">
                                <a itemprop="url" href="about_IM.php"><i class="fa fa-angle-right"></i>Infrastructure &
                                    Maintenance </a>
                            </li>
                            <li itemprop="name" class="list-group-item ">
                                <a itemprop="url" href="about_IO.php"><i class="fa fa-angle-right"></i>Industry &
                                    Outreach</a>
                            </li>
                            <li itemprop="name" class="list-group-item ">
                                <a itemprop="url" href="about_amenities.php"><i
                                        class="fa fa-angle-right"></i>Amenities</a>
                            </li>
                            <li itemprop="name" class="list-group-item ">
                                <a itemprop="url" href="about_activities.php"><i
                                        class="fa fa-angle-right"></i>Activity</a>
                            </li>
                        </ul>
                    </aside>
                </div>
                <div class="col-md-9 col-md-pull-3 mb-5">

                    <div class="row">
                        <div class="col-md-12">
                            <h5 class="headline">1.Head: Human Resource (Faculty & Staff)</h5>
                            <table class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th width="10%">Sr. No</th>
                                        <th width="23%">Committee</th>
                                        <th width="20%">Convener</th>
                                        <th>Members</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                $srNo = 1;
                foreach ($committees as $committee) {
                    $members = getCommitteeMembers($conn, $committee['CommitteId']);
                    $rowspan = count($members) + 1;
                    echo "<tr>
                            <td rowspan='$rowspan'>$srNo</td>
                            <td rowspan='$rowspan'><h6>{$committee['CommitteName']}</h6></td>
                            <td rowspan='$rowspan'>{$committee['Convener']}</td>
                          </tr>";
                    foreach ($members as $member) {
                        $name = "{$member['Prefix']} {$member['FirstName']} {$member['LastName']}";
                        echo "<tr><td>{$name} ({$member['DepartmentID']})</td></tr>";
                    }
                    $srNo++;
                }
                ?>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>

            </div>

        </div>
    </div>
</body>

</html>
<?php //include 'footer.php'; ?>