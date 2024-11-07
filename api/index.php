<?php
require_once '../models/config.php';
require_once '../api/functions/auth.php'; // Đảm bảo đường dẫn là chính xác

header('Content-Type: application/json');  // Đảm bảo rằng API trả về JSON

if ($_SERVER['REQUEST_METHOD'] === 'POST' && $_GET['action'] === 'login') {
    $data = json_decode(file_get_contents("php://input"), true);
    $username = $data['username'] ?? '';
    $password = $data['password'] ?? '';

    // // Gọi hàm login và nhận kết quả
    $response = login($username, $password);

    // // Xuất kết quả dưới dạng JSON
    echo json_encode($response);
    
} else {
    echo json_encode(['status' => 'error', 'message' => 'Hành động không hợp lệ']);
}
?>