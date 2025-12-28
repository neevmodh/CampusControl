<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <form method="post" enctype="multipart/form-data">
        <input type="file" name="pdf_file" />
        <input type="submit">
    </form>
</body>

</html>


<?php
if ($_FILES['pdf_file']) {
    // Check the file extension
    $file_ext = strtolower(pathinfo($_FILES['pdf_file']['name'], PATHINFO_EXTENSION));
    if ($file_ext == 'pdf') {
        // Check the file type
        $file_type = $_FILES['pdf_file']['type'];
        if ($file_type == 'application/pdf') {
            // File is a PDF, process it
            echo "Valid PDF.";
        } else {
            echo "Error: File is not a PDF.";
        }
    } else {
        echo "Error: Only PDF files are allowed.";
    }
} else {
    echo "Error: No file uploaded.";
}
?>