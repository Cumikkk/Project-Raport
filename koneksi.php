<?php
$host = "127.0.0.1"; // localhost
$user = "root";      // default user MySQL
$pass = "design1";           // kosongkan jika belum diset password
$db   = "project_raport"; // nama database kamu

$conn = mysqli_connect($host, $user, $pass, $db);

if (!$conn) {
    die("Koneksi gagal: " . mysqli_connect_error());
} else {
    // echo "Koneksi berhasil!"; // untuk test awal
}
?>
