import { showToast } from './toasts.js';

$(document).ready(function () {

    console.log($("#switch-department-toggle"));
    
    $("#switch-department-toggle").on('change',function () {

        
        const formData = new FormData();
        let deptId = $('#switch-department-toggle option:selected').val();

        
        // CHANGING DEPARTMENT
        $.ajax({
            url: 'ajax/switch-dept.php',
            type: 'GET',
            data: { deptId: deptId }, // Pass data directly as an object
            success: function (response) {
                const jsonResponse = JSON.parse(response);
                console.log(jsonResponse);
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
});