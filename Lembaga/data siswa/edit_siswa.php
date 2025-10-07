<?php
include '../../koneksi.php';

// Cek apakah parameter NIS dikirim
if (!isset($_GET['nis'])) {
    echo "NIS tidak ditemukan.";
    exit;
}

$nis = $_GET['nis'];

// Ambil data siswa berdasarkan NIS
$query = mysqli_query($conn, "SELECT * FROM siswa WHERE nis='$nis'");
$data = mysqli_fetch_assoc($query);

// Jika data tidak ditemukan
if (!$data) {
    echo "Data siswa tidak ditemukan.";
    exit;
}

// Jika tombol simpan ditekan
if (isset($_POST['simpan'])) {
    $absen = $_POST['absen'];
    $nama = $_POST['nama'];
    $wali_kelas = $_POST['wali_kelas'];

    $update = mysqli_query($conn, "UPDATE siswa SET 
        absen='$absen',
        nama='$nama',
        wali_kelas='$wali_kelas'
        WHERE nis='$nis'
    ");

    if ($update) {
        // kembali ke halaman data siswa setelah berhasil
        header("Location: data_siswa.php");
        exit;
    } else {
        echo "Gagal memperbarui data!";
    }
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Edit Data Siswa</title>
    <link rel="stylesheet" href="../../assets/css/style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f8f9fa;
            padding: 30px;
        }
        .container {
            width: 400px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        label {
            font-weight: bold;
        }
        input {
            width: 100%;
            padding: 8px;
            margin: 5px 0 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            background: #28a745;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background: #218838;
        }
        a {
            display: inline-block;
            margin-top: 10px;
            text-decoration: none;
            color: #007bff;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Edit Data Siswa</h2>
    <form method="post">
        <label>Absen:</label>
        <input type="number" name="absen" value="<?= $data['absen']; ?>" required>

        <label>NIS:</label>
        <input type="text" value="<?= $data['nis']; ?>" disabled>

        <label>Nama:</label>
        <input type="text" name="nama" value="<?= $data['nama']; ?>" required>

        <label>Wali Kelas:</label>
        <input type="text" name="wali_kelas" value="<?= $data['wali_kelas']; ?>" required>

        <button type="submit" name="simpan">💾 Simpan Perubahan</button>
    </form>
    <a href="data_siswa.php">⬅️ Kembali ke Data Siswa</a>
</div>

</body>
</html>