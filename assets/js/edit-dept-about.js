import { showToast } from './toasts.js';
$(document).ready(function () {

    $('input[type="text"],textarea').on('focus', function () {
                
        $(this).attr('readonly') !=="readonly" && $(this).select();
    });
    // ABOUT IMAGES STARTS
    // EDIT
    $('.edit-icon.edit-about-image').click(function () {
        // TOGGLING THE INPUTS 
        const cardBody = $(this).closest('.card-body');

        cardBody.find('input[type="text"]').removeAttr('readonly').addClass('form-control').removeClass('form-control-plaintext'); // TOGGLES THE READONLY INPUT

        // SAVING THE OLD DATA
        let oldDesc = cardBody.find('input[type="text"]').val();
        cardBody.find('input[type="text"]').attr('old-desc', oldDesc)

        // TOGGLING INPUTS AND ICONS
        $(this).addClass('d-none');
        cardBody.find('.form-label, .form-control, .form-text').removeClass('d-none');
        cardBody.find('.delete-icon').addClass('d-none');
        cardBody.find('.close-icon, .success-icon').removeClass('d-none');
    });

    // CLOSE or CANCEL
    $('.close-icon.edit-about-image').click(function () {
        const cardBody = $(this).closest('.card-body');

        // RESETTING TO OLD DATA
        let desc = cardBody.find('input[type="text"]').attr('old-desc');
        cardBody.find('input[type="text"]').removeAttr('old-desc').attr('readonly', true).addClass('form-control-plaintext').removeClass('form-control').val(desc);
        cardBody.find('input[type="file"]').val('');

        // TOGGLING INPUTS AND ICONS
        cardBody.find('.form-label, .form-control, .form-text').addClass('d-none');
        $(this).addClass('d-none');
        cardBody.find('.success-icon').addClass('d-none');
        cardBody.find('.edit-icon, .delete-icon').removeClass('d-none');
    });

    // SUCCESS or SUBMIT
    $('.success-icon.edit-about-image').click(function () {

        const cardBody = $(this).closest('.card-body');
        const fileInput = cardBody.find('input[type="file"]').val();
        let desc = cardBody.find('input[type="text"]').attr('old-desc');
        if (desc == cardBody.find('input[type="text"]').val() && !fileInput) {
            return;
        }
        $(this).closest('.card-body').find('form').submit();
    });

    $(".delete-icon.edit-about-image").click(function () {
      if (confirm("Are you sure you want to delete this image?")) {
        const cardBody = $(this).closest(".card-body");
        const deptId = $(this).closest(".main").data("department-id");
        let imageNumber = cardBody.find("form").attr("id");
        imageNumber = imageNumber.substr(-1);        

        $.ajax({
          url: "ajax/edit-about-images.php",
          method: "GET",
          data: {
            deptId: deptId,
            imageNumber: imageNumber,
          },
          success: function (response) {
            const jsonResponse = JSON.parse(response);
            if (jsonResponse.status === "success") {
              console.table(jsonResponse.response);
              showToast(jsonResponse.response, "success");
            } else {
              console.log("Error: " + jsonResponse.response);
              showToast(jsonResponse.response, "error");
            }
          },
        });
      }
    });

    // SUBMITING DATA
    $('form.image-form').on('submit', function (event) {
        event.preventDefault();
        const formData = new FormData(this); // STARTING WITH INITIAL FORM DATA
        const fileInput = $(this).find('input[type="file"]')[0];
        const deptId = $(this).closest('.main').data('department-id');
        
        // VALIDATION
        const validTypes = ['image/png', 'image/jpeg'];
        if (fileInput.files.length > 0) {
            const fileType = fileInput.files[0].type;
            const fileSize = fileInput.files[0].size;

            if (!validTypes.includes(fileType)) {
                showToast('Invalid file type. Only PNG and JPEG are allowed.', 'error');
                return;
            }

            if (fileSize > 40 * 1024 * 1024) { // 40MB
                console.log('File size exceeds 40MB.');
                return;
            }
        }

        // FINDING IMAGE NUMBER
        let imageNumber = $(this).attr('id');
        imageNumber = imageNumber.substr(-1);

        // ADDING DATA
        formData.append('imageNumber', imageNumber);
        formData.append('deptId', deptId);

        // SAVING THE DATA
        $.ajax({
            url: 'ajax/edit-about-images.php',
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            success: function (response) {
                const jsonResponse = JSON.parse(response);
                if (jsonResponse.status === 'success') {
                    console.table(jsonResponse.response);
                    showToast(jsonResponse.response, 'success');
                    window.location.reload()
                } else {
                    console.log('Error: ' + jsonResponse.response);
                    showToast(jsonResponse.response, 'error');
                }
            }
        });
    });
    // ABOUT IMAGES ENDS


    // ABOUT TEXT STARTS
    // EDIT
    $('.edit-icon.edit-about').click(function () {
        const cardBody = $(this).closest('.card-body');

        // TOGGLING THE TEXTAREA
        cardBody.find('textarea').removeAttr('readonly').addClass('form-control').removeClass('form-control-plaintext'); // TOGGLES THE READONLY TEXTAREA

        // SAVING THE OLD DATA
        let about = cardBody.find('textarea').val();
        cardBody.find('textarea').attr('old-about', about);

        // TOGGLING INPUTS AND ICONS
        $(this).addClass('d-none');
        cardBody.find('.close-icon, .success-icon.edit-about').removeClass('d-none');
    });

    // CLOSE or CANCEL
    $('.close-icon.edit-about').click(function () {
        const cardBody = $(this).closest('.card-body');

        // RESETTING TO OLD DATA
        let about = cardBody.find('textarea').attr('old-about');
        cardBody.find('textarea').removeAttr('old-about').attr('readonly', true).addClass('form-control-plaintext').removeClass('form-control').val(about);

        // TOGGLING INPUTS AND ICONS
        cardBody.find('.edit-icon.edit-about').removeClass('d-none');
        $(this).addClass('d-none');
        cardBody.find('.success-icon.edit-about').addClass('d-none');
    });

    // SUCCESS or SUBMIT
    $('.success-icon.edit-about').click(function () {
        $('#about').submit();
    });

    // SUBMITTING DATA
    $('#about').on('submit', function (event) {
        event.preventDefault();
        const formData = new FormData(this); // STARTING WITH INITIAL FORM DATA
        const deptId = $(this).closest('.main').data('department-id');

        // ADDING DATA
        formData.append('deptId', deptId);

        // SAVING THE DATA
        $.ajax({
            url: 'ajax/edit-about.php',
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            success: function (response) {
                const jsonResponse = JSON.parse(response);
                if (jsonResponse.status === 'success') {
                    showToast(jsonResponse.response, 'success');
                    window.location.reload()
                } else {
                    console.log('Error: ' + jsonResponse.response);
                    showToast(jsonResponse.response, 'error');
                }
            }
        });
    });
    // ABOUT TEXT ENDS


    // LOGO SECTION STARTS

    // EDIT
    $('.edit-icon.edit-logo').click(function () {
        // TOGGLING THE INPUTS AND ICONS
        const cardBody = $(this).closest('.card-body');
        $(this).addClass('d-none');
        cardBody.find('.close-icon, .success-icon').removeClass('d-none');
        cardBody.find('.form-label, .form-control, .form-text').removeClass('d-none');
    });

    // CLOSE or CANCEL
    $('.close-icon.edit-logo').click(function () {
        const cardBody = $(this).closest('.card-body');

        // RESETTING FILE INPUT
        cardBody.find('.form-label, .form-control, .form-text').addClass('d-none');
        cardBody.find('.edit-icon').removeClass('d-none');
        $(this).addClass('d-none');
        cardBody.find('.success-icon').addClass('d-none');
        cardBody.find('input[type="file"]').val('');
    });

    // SUCCESS or SUBMIT
    $('.success-icon.edit-logo').click(function () {
        $('#logoForm').submit();
    });

    // SUBMITTING DATA
    $('#logoForm').on('submit', function (event) {
        event.preventDefault();
        const formData = new FormData(this); // STARTING WITH INITIAL FORM DATA
        const deptId = $(this).closest('.main').data('department-id');
        formData.append('deptId', deptId);
        formData.append('logo', true);

        // SAVING THE DATA
        $.ajax({
            url: 'ajax/edit-about-images.php',
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            success: function (response) {
                const jsonResponse = JSON.parse(response);
                if (jsonResponse.status === 'success') {
                    console.table(jsonResponse);
                    showToast(jsonResponse.response, 'success');
                    window.location.reload();
                } else {
                    console.log('Error: ' + jsonResponse.response);
                    showToast(jsonResponse.response, 'error');
                }
            }
        });
    });

    // LOGO SECTION ENDS


    // COURSE DETAILS SECTION STARTS

    // EDIT
    $('.edit-icon.edit-course-details').click(function () {
        // TOGGLING THE INPUTS AND ICONS
        const cardBody = $(this).closest('.card-body');
        $(this).addClass('d-none');
        cardBody.find('.close-icon, .success-icon').removeClass('d-none');

        // SAVING THE OLD DATA
        let formContent = {};
        cardBody.find('input,textarea').each(function () {
            formContent[this.id] = $(this).val();
        });
        localStorage.setItem('formContent', JSON.stringify(formContent));        

        // TOGGLING INPUTS
        cardBody.find('.form-label, .form-control, .form-text').removeAttr('readonly');
        cardBody.find('.close-icon, .success-icon').removeClass('d-none');
    });

    // CLOSE or CANCEL
    $('.close-icon.edit-course-details').click(function () {
        const cardBody = $(this).closest('.card-body');

        // RESETTING TO OLD DATA
        cardBody.find('.form-label, .form-control, .form-text').attr('readonly', true);
        const formContent = JSON.parse(localStorage.getItem('formContent'));
        for (let element in formContent) {
            $(`#${element}`).val(`${formContent[element]}`);
        }
        localStorage.removeItem('formContent');

        // TOGGLING INPUTS AND ICONS
        cardBody.find('.edit-icon').removeClass('d-none');
        $(this).addClass('d-none');
        cardBody.find('.success-icon').addClass('d-none');
    });

    // SUCCESS or SUBMIT
    $('.success-icon.edit-course-details').click(function () {
        $(this).closest('.card-body').find('form').submit();
    });

    // SUBMITTING DATA
    $('form.details-form').on('submit', function (event) {
        event.preventDefault();
        const formData = new FormData(this); // STARTING WITH INITIAL FORM DATA
        const deptId = $(this).closest('.main').data('department-id');
        formData.append('deptId', deptId);

        // SAVING THE DATA
        $.ajax({
            url: 'ajax/edit-details.php',
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            success: function (response) {
                const jsonResponse = JSON.parse(response);
                if (jsonResponse.status === 'success') {
                    window.location.reload();
                    showToast(jsonResponse.response, 'success');
                } else {
                    showToast(jsonResponse.response, 'error');
                }
            }
        });
    });

    // COURSE DETAILS SECTION ENDS
});
