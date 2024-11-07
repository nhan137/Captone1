document.getElementById('loginForm').addEventListener('submit', function(e) {
    e.preventDefault();

    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;

    fetch('../api/fuctions/index.php?action=login', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ username, password })
    })
    .then(response => response.json())
    .then(data => {
        document.getElementById('message').textContent = data.message;
        if (data.status === 'success') {
            window.location.href = 'profile.html'; // Điều hướng đến trang khác sau khi đăng nhập thành công
        }
    })
    .catch(error => console.error('Error:', error));
});

//QUEN MAT KHAU
document.getElementById('forgotPasswordForm').addEventListener('submit', function(e) {
    e.preventDefault();

    const email = document.getElementById('forgotEmail').value;

    fetch('../api/index.php?action=forgot_password', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ email })
    })
    .then(response => response.json())
    .then(data => {
        document.getElementById('forgotMessage').textContent = data.message;
    })
    .catch(error => console.error('Error:', error));
});

// mat khau mơi
document.getElementById('resetPasswordForm').addEventListener('submit', function(e) {
    e.preventDefault();

    const newPassword = document.getElementById('newPassword').value;

    fetch('../api/index.php?action=reset_password', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ new_password: newPassword })
    })
    .then(response => response.json())
    .then(data => {
        document.getElementById('resetMessage').textContent = data.message;
    })
    .catch(error => console.error('Error:', error));
});