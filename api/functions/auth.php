<?php
require_once '../models/config.php';

function login($username, $password) {
    global $pdo;

    // Kiểm tra xem người dùng có tồn tại không
    $stmt = $pdo->prepare("SELECT * FROM employee WHERE Username = :username");
    $stmt->execute(['username' => $username]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    // Kiểm tra mật khẩu
    // if ($user && password_verify($password, $user['Password'])) {
    if ($user && $password === $user['Password']) {
        return [
            'status' => 'success',
            'message' => 'Login successful',
            'user_id' => $user['EmployeeID'],  
        ];
    } else {
        return [
            'status' => 'error',
            'message' => 'Invalid username or password',
        ];
    }
}
?>
