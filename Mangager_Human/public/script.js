function login() {
  const username = document.getElementById("username").value;
  const password = document.getElementById("password").value;

  // Check if the username and password are filled
  if (username && password) {
    // Redirect to profile page (profile.html)
    window.location.href = "path/to/profile.html";
    // Replace "profile.html" with your file name
  } else {
    alert("Vui lòng nhập tên người dùng và mật khẩu!");
  }
}
function showForgotPassword() {
  document.getElementById("login-form").style.display = "none";
  document.getElementById("forgot-password-step1").style.display = "block";
}

function sendVerificationCode() {
  // Thực hiện gửi mã xác nhận tới email (được giả định là đã thực hiện)
  // Ẩn bước nhập email và hiện bước nhập mã xác nhận
  document.getElementById("forgot-password-step1").style.display = "none";
  document.getElementById("forgot-password-step2").style.display = "block";
}

function verifyCode() {
  // Thực hiện kiểm tra mã xác nhận (giả định là mã hợp lệ)
  alert("Mã xác nhận hợp lệ. Chuyển tới bước đặt lại mật khẩu.");
  document.getElementById("forgot-password-step2").style.display = "none";
  document.getElementById("reset-password").style.display = "block";
}

function resetPassword() {
  const newPassword = document.getElementById("new-password").value;
  const confirmPassword = document.getElementById("confirm-password").value;

  if (newPassword === confirmPassword) {
    alert("Mật khẩu đã được đặt lại thành công!");
    // Tiến hành lưu mật khẩu mới vào cơ sở dữ liệu (giả định)
    // Quay trở lại giao diện đăng nhập
    document.getElementById("reset-password").style.display = "none";
    document.getElementById("login-form").style.display = "block";
  } else {
    alert("Mật khẩu xác nhận không khớp. Vui lòng thử lại.");
  }
}
function togglePasswordVisibility(inputId) {
  const input = document.getElementById(inputId);
  const type = input.getAttribute("type") === "password" ? "text" : "password";
  input.setAttribute("type", type);
}
function showSection(sectionId) {
  // Hide all sections
  const sections = document.querySelectorAll(".section");
  sections.forEach((section) => section.classList.remove("active"));

  // Show the selected section
  document.getElementById(sectionId + "-section").classList.add("active");
}

// Set default active section
document.addEventListener("DOMContentLoaded", () => {
  showSection("checkin");
});
// script.js

function loginAndRedirect() {
  // Get username and password
  const username = document.getElementById("username").value;
  const password = document.getElementById("password").value;

  // Hardcoded credentials for demo
  const validUsername = "admin";
  const validPassword = "123";

  // Check if credentials match
  if (username === validUsername && password === validPassword) {
    // Login successful
    window.location.href = "profile.html";
  } else if (!username || !password) {
    showNotification("Vui lòng nhập đầy đủ thông tin đăng nhập!");
  } else {
    showNotification("Tài khoản hoặc mật khẩu không đúng!");
  }
}

// Function to show the notification with a specific message
function showNotification(message) {
  const notification = document.getElementById("notification");
  const messageElement = document.getElementById("notification-message");

  // Set the message
  messageElement.textContent = message;

  // Show the notification
  notification.style.display = "block";
}

// Function to close the notification
function closeNotification() {
  const notification = document.getElementById("notification");
  notification.style.display = "none";
}
