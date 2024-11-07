<?php
header('Content-Type: application/json'); // Đảm bảo rằng API trả về JSON

require_once '../auth.php'; // Đảm bảo đường dẫn là chính xác

if ($_GET['action'] === 'login') {
    $username = $_POST['username'] ?? '';
    $password = $_POST['password'] ?? '';

    // Gọi hàm login và nhận kết quả
    $result = login($username, $password);

    // Xuất kết quả dưới dạng JSON
    echo json_encode($result);
} else {
    echo json_encode(['status' => 'error', 'message' => 'Hành động không hợp lệ']);
}
