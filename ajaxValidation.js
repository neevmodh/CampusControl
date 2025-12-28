function handleFileChange(event, types, maxFileSizeMB = 30) {
  console.log(types);
  const fileInput = event.target;
  const file = fileInput.files[0];

  if (!file) {
    return;
  }

  const fileName = file.name.toLowerCase();
  const extension = fileName.substring(fileName.lastIndexOf('.'));
  const fileSizeMB = file.size / (1024 * 1024);

  if (!types.includes(extension)) {
    const message = 'Please select a file with one of these extensions: ' + types.join(', ');
    showErrorMessage(message);
    fileInput.value = '';
    return;
  }

  if (fileSizeMB > maxFileSizeMB) {
    const message = `File size exceeds ${maxFileSizeMB} MB.`;
    showErrorMessage(message);
    fileInput.value = '';
    return;
  }

  console.log("File type and size are allowed:", file);
}

function handleNumberChange(event, minValue, maxValue) {
  const value = parseInt(event.target.value);

  if (!value) {
    return;
  }

  if (value < minValue || value > maxValue) {
    const message = `Value must be between ${minValue} and ${maxValue}.`;
    showErrorMessage(message);
    event.target.value = '';
    return;
  }

  console.log("Value is within the allowed range:", value);
}

function showErrorMessage(message) {
  $.ajax({
    url: 'toasts.php',
    type: 'POST',
    dataType: 'html',
    data: {
      message: message,
      type: 'danger',
      dismissable: true,
      autoHide: true,
      delay: 3000
    },
    success: function (response) {
      $('#toast-container').append(response);
      $('.toast:last').toast('show');
    },
    error: function (xhr, status, error) {
      console.error('Error:', error);
    }
  });
}