<?php
require __DIR__ . '/../../vendor/autoload.php';
include __DIR__ . '/../../koneksi.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

$spreadsheet = new Spreadsheet();
$sheet = $spreadsheet->getActiveSheet();

// Header kolom
$sheet->setCellValue('A1', 'Absen');
$sheet->setCellValue('B1', 'NIS');
$sheet->setCellValue('C1', 'Nama');
$sheet->setCellValue('D1', 'Wali Kelas');

// Ambil data dari database
$query = mysqli_query($conn, "SELECT * FROM siswa ORDER BY absen ASC");
$rowNumber = 2;
while ($row = mysqli_fetch_assoc($query)) {
    $sheet->setCellValue('A' . $rowNumber, $row['absen']);
    $sheet->setCellValue('B' . $rowNumber, $row['nis']);
    $sheet->setCellValue('C' . $rowNumber, $row['nama']);
    $sheet->setCellValue('D' . $rowNumber, $row['wali_kelas']);
    $rowNumber++;
}

// Download Excel
$writer = new Xlsx($spreadsheet);
$filename = 'Data_Siswa_' . date('Y-m-d_His') . '.xlsx';
ob_end_clean();
header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header("Content-Disposition: attachment; filename=\"$filename\"");
header('Cache-Control: max-age=0');
$writer->save('php://output');
exit;
?>
