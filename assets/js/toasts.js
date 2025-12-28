export function showToast(message, type = 'primary', dismissable = true, autoHide = true, delay = 5000) {
    // Validate message
    if (!message) {
        console.error('Error: Message is required for toast.');
        return;
    }

    // Validate type
    const validTypes = ['primary', 'secondary', 'success', 'danger', 'warning', 'info', 'light', 'dark','error'];
    if (!validTypes.includes(type)) {
        console.error(`Error: Invalid type for toast. Valid types are: ${validTypes.join(', ')}.`);
        return;
    }
    type = type === 'error' ? 'danger' : type;
    // Toast auto-hide attribute
    const autoHideAttribute = autoHide ? `data-bs-autohide="true" data-bs-delay="${delay}"` : 'data-bs-autohide="false"';

    // Button for dismissing the toast
    const dismissButton = dismissable ? '<button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>' : '';

    // Create a unique ID for the toast
    const id = `toast-${Date.now()}`;

    // Create toast HTML
    const toastHTML = `
        <div id="${id}" class="toast align-items-center text-bg-${type} border-0" role="alert" aria-live="assertive" aria-atomic="true" ${autoHideAttribute}>
            <div class="d-flex">
                <div class="toast-body">${message}</div>
                ${dismissButton}
            </div>
        </div>
    `;

    // Append toast to the container
    const toastContainer = document.getElementById('toast-container');
    toastContainer.insertAdjacentHTML('beforeend', toastHTML);

    // Show the toast
    const toastEl = document.getElementById(id);
    const toast = new bootstrap.Toast(toastEl);
    toast.show();

    // Remove toast from the DOM after it hides
    toastEl.addEventListener('hidden.bs.toast', () => {
        toastEl.remove();
    });
}
