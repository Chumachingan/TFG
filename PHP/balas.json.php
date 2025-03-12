<?php
header('Content-Type: application/json');
require $_SERVER['DOCUMENT_ROOT'] . '/TFG/PHP/db.php';

$sql = "SELECT * FROM balas";
$result = $conn->query($sql);

$balas = [];

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $balas[] = $row;
    }
}

echo json_encode($balas, JSON_PRETTY_PRINT);
?>
