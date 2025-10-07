<?php
require '../../vendor/autoload.php';
include '../../koneksi.php';

use PhpOffice\PhpSpreadsheet\IOFactory;

if (isset($_FILES['file_excel']['name'])) {
    $file_name = $_FILES['file_excel']['name'];
    $file_tmp  = $_FILES['file_excel']['tmp_name'];
    $ext = pathinfo($file_name, PATHINFO_EXTENSION);

    if ($ext == 'xls' || $ext == 'xlsx') {
        $spreadsheet = IOFactory::load($file_tmp);
        $sheetData = $spreadsheet->getActiveSheet()->toArray();

        // Lewati baris pertama (header)
        for ($i = 1; $i < count($sheetData); $i++) {
            $absen = mysqli_real_escape_string($conn, $sheetData[$i][0]);
            $nis   = mysqli_real_escape_string($conn, $sheetData[$i][1]);
            $nama  = mysqli_real_escape_string($conn, $sheetData[$i][2]);
            $wali  = mysqli_real_escape_string($conn, $sheetData[$i][3]);

            if ($absen != '') {
                $query = "INSERT INTO siswa (absen, nis, nama, wali_kelas)
                          VALUES ('$absen','$nis','$nama','$wali')";
                if (!mysqli_query($conn, $query)) {
                    echo "Error: " . mysqli_error($conn) . "<br>";
                }
            }
        }

        echo "<script>alert('Import berhasil!');window.location='data_siswa.php';</script>";
    } else {
        echo "<script>alert('Format file harus .xls atau .xlsx');window.location='data_siswa.php';</script>";
    }
} else {
    echo "<script>alert('File tidak ditemukan');window.location='data_siswa.php';</script>";
}
?>
