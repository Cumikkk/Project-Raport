<?php
include '../../koneksi.php';

if (isset($_GET['nis'])) {
    $nis = $_GET['nis'];
    mysqli_query($conn, "DELETE FROM siswa WHERE nis = '$nis'");
}

header("Location: data_siswa.php");
exit;
?>