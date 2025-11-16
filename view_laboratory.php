<?php
session_start();
if (!isset($_SESSION["FacultyID"]) || !$_SESSION["isDepartmentAdmin"]) {
    header("Location: login.php");
    exit();
}

require 'server_config.php';
require './services/laboratory.service.php';

$laboratoriesService = new laboratoryservice();

$ID = $_GET['ID'];
$laboratories = $laboratoriesService->fetchAll("ID = '$ID'");
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
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="assets/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="assets/css/zoom.css">

</head>

<body>

  <?php include 'header_nav.php'; ?>  

  <main id="main" class="main">
    <div class="main-spacing">
    <div class="breadcrumb-actions">
          <a href="LaboratoryDetails.php" role="button" class="btn btn-primary add-btn">
            <i style="font-size: 20px;"></i>BACK
          </a>
        </div>
      <section class="section">
        <div class="row">
          <div class="col-lg-12">
            <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;">
              <div class="card-body">
                <?php
              if (!empty($laboratories)) {
                foreach ($laboratories as $row) {
                  echo "<table class='table'>";
                  echo "<tr><th>Department Name</th><td>" . $_GET['department_name'] . "</td></tr>";
                  echo "<tr><th>Laboratory Name</th><td>" . $row['LaboratoryName'] . "</td></tr>";
                  echo "<tr><th>Photo1</th><td>";
                  if (!empty($row['PhotoURL1'])) {
                    echo "<a href='" . $row['PhotoURL1'] . "' class='image-link'><img src='" . $row['PhotoURL1'] . "' alt='Photo 1' width='150' height='150'></a>";
                  } else {
                    echo "No image added";
                  }
                  echo "</td></tr>";
                  echo "<tr><th>Photo2</th><td>";
                  if (!empty($row['PhotoURL2'])) {
                    echo "<a href='" . $row['PhotoURL2'] . "' class='image-link'><img src='" . $row['PhotoURL2'] . "' alt='Photo 2' width='150' height='150'></a>";
                  } else {
                    echo "No image added";
                  }
                  echo "</td></tr>";
                  echo "<tr><th>Photo3</th><td>";
                  if (!empty($row['PhotoURL3'])) {
                    echo "<a href='" . $row['PhotoURL3'] . "' class='image-link'><img src='" . $row['PhotoURL3'] . "' alt='Photo 3' width='150' height='150'></a>";
                  } else {
                    echo "No image added";
                  }
                  echo "</td></tr>";
                  echo "<tr><th>Photo4</th><td>";
                  if (!empty($row['PhotoURL4'])) {
                    echo "<a href='" . $row['PhotoURL4'] . "' class='image-link'><img src='" . $row['PhotoURL4'] . "' alt='Photo 4' width='150' height='150'></a>";
                  } else {
                    echo "No image added";
                  }
                  echo "</td></tr>";
                  echo "<tr><th>Photo5</th><td>";
                  if (!empty($row['PhotoURL5'])) {
                    echo "<a href='" . $row['PhotoURL5'] . "' class='image-link'><img src='" . $row['PhotoURL5'] . "' alt='Photo 5' width='150' height='150'></a>";
                  } else {
                    echo "No image added";
                  }
                  echo "</td></tr>";
                  echo "<tr><th>Subjects</th><td>" . $row['Subjects'] . "</td></tr>";
                  echo "<tr><th>Location</th><td>" . $row['Location'] . "</td></tr>";
                  echo "<tr><th>Description</th><td>" . $row['Description'] . "</td></tr>";
                  echo "</table><br>";
                }
              }
                 else {
                  echo "<div class='text-center'>No results found</div>";
                }
                ?>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
  </main>

  <?php include "footer.php"; ?>

</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>
<script>
$(document).ready(function() {
  $(".image-link").magnificPopup({
    type: "image",
    closeOnContentClick: true,
    fixedContentPos: true,
    mainClass: "mfp-no-margins mfp-with-zoom",
    image: {
      verticalFit: true,
      titleSrc: function(item) {
        return item.el.attr("title");
      }
    },
    zoom: {
      enabled: true,
      duration: 300,
      opener: function(openerElement) {
        return openerElement.is("img") ? openerElement : openerElement.find("img");
      },
      nonTouch: true, // Prevent browser zooming
      modal: false, // Allow zooming on zoomed image
      cursor: 'mfp-zoom' // Change cursor style to zoom
    },
    callbacks: {
      buildControls: function() {
        this.contentContainer.append(this.controls);
      },
      markupParse: function(template, values, item) {
        values.title = "";
      }
    },
    // gallery: {
    //   enabled: true
    // }
  });
});

</script>
</html>