
/*==============================================================*/
/* Database: E-Raport Final Version (dengan relasi lengkap)     */
/*==============================================================*/

DROP DATABASE IF EXISTS e_raport_final;
CREATE DATABASE e_raport_final;
USE e_raport_final;

/*==============================================================*/
/* Table: user (login admin)                                    */
/*==============================================================*/
CREATE TABLE user (
    id_user INT NOT NULL AUTO_INCREMENT,
    nama_lengkap_user VARCHAR(150),
    email_user VARCHAR(150),
    no_telepon_user VARCHAR(20),
    username VARCHAR(20),
    password_user VARCHAR(255),
    PRIMARY KEY (id_user)
) ENGINE=InnoDB;

/*==============================================================*/
/* Table: sekolah                                               */
/*==============================================================*/
CREATE TABLE sekolah (
    id_sekolah INT NOT NULL AUTO_INCREMENT,
    logo_sekolah VARCHAR(255),
    nama_sekolah VARCHAR(150),
    npsn_sekolah VARCHAR(50),
    nsm_sekolah VARCHAR(50),
    alamat_sekolah TEXT,
    no_telepon_sekolah VARCHAR(20),
    kecamatan_sekolah VARCHAR(50),
    kabupaten_atau_kota_sekolah VARCHAR(50),
    provinsi VARCHAR(50),
    nama_kepala_sekolah VARCHAR(150),
    nip_kepala_sekolah VARCHAR(50),
    PRIMARY KEY (id_sekolah)
) ENGINE=InnoDB;

/*==============================================================*/
/* Table: semester                                              */
/*==============================================================*/
CREATE TABLE semester (
    id_semester INT NOT NULL AUTO_INCREMENT,
    nama_semester VARCHAR(50),
    tahun_ajaran VARCHAR(50),
    PRIMARY KEY (id_semester)
) ENGINE=InnoDB;

/*==============================================================*/
/* Table: kelas                                                 */
/*==============================================================*/
CREATE TABLE kelas (
    id_kelas INT NOT NULL AUTO_INCREMENT,
    nama_kelas VARCHAR(50),
    nama_wali_kelas VARCHAR(150),
    PRIMARY KEY (id_kelas)
) ENGINE=InnoDB;

/*==============================================================*/
/* Table: siswa                                                 */
/*==============================================================*/
CREATE TABLE siswa (
    id_siswa INT NOT NULL AUTO_INCREMENT,
    no_absen_siswa VARCHAR(10),
    no_induk_siswa VARCHAR(10),
    nama_siswa VARCHAR(150),
    jenis_kelamin_siswa VARCHAR(10),
    id_kelas INT,
    PRIMARY KEY (id_siswa),
    CONSTRAINT fk_siswa_kelas FOREIGN KEY (id_kelas) REFERENCES kelas(id_kelas)
) ENGINE=InnoDB;

/*==============================================================*/
/* Table: mata_pelajaran                                        */
/*==============================================================*/
CREATE TABLE mata_pelajaran (
    id_mata_pelajaran INT NOT NULL AUTO_INCREMENT,
    nama_mata_pelajaran VARCHAR(50),
    kode_mata_pelajaran VARCHAR(10),
    kelompok_mata_pelajaran VARCHAR(50),
    PRIMARY KEY (id_mata_pelajaran)
) ENGINE=InnoDB;

/*==============================================================*/
/* Table: ekstrakurikuler                                       */
/*==============================================================*/
CREATE TABLE ekstrakurikuler (
    id_ekstrakurikuler INT NOT NULL AUTO_INCREMENT,
    nama_ekstrakurikuler VARCHAR(50),
    PRIMARY KEY (id_ekstrakurikuler)
) ENGINE=InnoDB;

/*==============================================================*/
/* Table: nilai_mata_pelajaran                                  */
/*==============================================================*/
CREATE TABLE nilai_mata_pelajaran (
    id_nilai_mata_pelajaran INT NOT NULL AUTO_INCREMENT,
    id_siswa INT,
    id_mata_pelajaran INT,
    id_semester INT,
    tp1_lm1 INT,
    tp2_lm1 INT,
    tp3_lm1 INT,
    tp4_lm1 INT,
    sumatif_lm1 INT,
    tp1_lm2 INT,
    tp2_lm2 INT,
    tp3_lm2 INT,
    tp4_lm2 INT,
    sumatif_lm2 INT,
    tp1_lm3 INT,
    tp2_lm3 INT,
    tp3_lm3 INT,
    tp4_lm3 INT,
    sumatif_lm3 INT,
    tp1_lm4 INT,
    tp2_lm4 INT,
    tp3_lm4 INT,
    tp4_lm4 INT,
    sumatif_lm4 INT,
    sumatif_tengah_semester INT,
    PRIMARY KEY (id_nilai_mata_pelajaran),
    CONSTRAINT fk_nilai_mapel_siswa FOREIGN KEY (id_siswa) REFERENCES siswa(id_siswa),
    CONSTRAINT fk_nilai_mapel_mapel FOREIGN KEY (id_mata_pelajaran) REFERENCES mata_pelajaran(id_mata_pelajaran),
    CONSTRAINT fk_nilai_mapel_semester FOREIGN KEY (id_semester) REFERENCES semester(id_semester)
) ENGINE=InnoDB;

/*==============================================================*/
/* Table: absensi                                               */
/*==============================================================*/
CREATE TABLE absensi (
    id_absensi INT NOT NULL AUTO_INCREMENT,
    id_siswa INT,
    id_semester INT,
    sakit INT,
    izin INT,
    alpha INT,
    PRIMARY KEY (id_absensi),
    CONSTRAINT fk_absensi_siswa FOREIGN KEY (id_siswa) REFERENCES siswa(id_siswa),
    CONSTRAINT fk_absensi_semester FOREIGN KEY (id_semester) REFERENCES semester(id_semester)
) ENGINE=InnoDB;

/*==============================================================*/
/* Table: nilai_ekstrakurikuler                                 */
/*==============================================================*/
CREATE TABLE nilai_ekstrakurikuler (
    id_nilai_ekstrakurikuler INT NOT NULL AUTO_INCREMENT,
    id_siswa INT,
    id_ekstrakurikuler INT,
    id_semester INT,
    nilai_ekstrakurikuler VARCHAR(10),
    PRIMARY KEY (id_nilai_ekstrakurikuler),
    CONSTRAINT fk_nilai_ekskul_siswa FOREIGN KEY (id_siswa) REFERENCES siswa(id_siswa),
    CONSTRAINT fk_nilai_ekskul_ekskul FOREIGN KEY (id_ekstrakurikuler) REFERENCES ekstrakurikuler(id_ekstrakurikuler),
    CONSTRAINT fk_nilai_ekskul_semester FOREIGN KEY (id_semester) REFERENCES semester(id_semester)
) ENGINE=InnoDB;

/*==============================================================*/
/* Table: pengaturan_cetak                                      */
/*==============================================================*/
CREATE TABLE pengaturan_cetak (
    id_pengaturan_cetak INT NOT NULL AUTO_INCREMENT,
    tempat_cetak VARCHAR(50),
    tanggal_cetak DATE,
    id_semester INT,
    PRIMARY KEY (id_pengaturan_cetak),
    CONSTRAINT fk_pengaturan_semester FOREIGN KEY (id_semester) REFERENCES semester(id_semester)
) ENGINE=InnoDB;
