/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     08/10/2025 00.57.09                          */
/*==============================================================*/


drop table if exists absensi;

drop table if exists ekstrakurikuler;

drop table if exists kelas;

drop table if exists mata_pelajaran;

drop table if exists nilai_ekstrakurikuler;

drop table if exists nilai_mata_pelajaran;

drop table if exists pengaturan_cetak;

drop table if exists sekolah;

drop table if exists siswa;

drop table if exists user;

/*==============================================================*/
/* Table: absensi                                               */
/*==============================================================*/
create table absensi
(
   id_absensi           int not null  comment '',
   sakit                varchar(10)  comment '',
   izin                 varchar(10)  comment '',
   alpha                varchar(10)  comment '',
   primary key (id_absensi)
);

/*==============================================================*/
/* Table: ekstrakurikuler                                       */
/*==============================================================*/
create table ekstrakurikuler
(
   id_ekstrakurikuler   int not null  comment '',
   nama_ekstrakurikuler varchar(50)  comment '',
   primary key (id_ekstrakurikuler)
);

/*==============================================================*/
/* Table: kelas                                                 */
/*==============================================================*/
create table kelas
(
   id_kelas             int not null  comment '',
   nama_kelas           varchar(50)  comment '',
   nama_wali_kelas      varchar(150)  comment '',
   primary key (id_kelas)
);

/*==============================================================*/
/* Table: mata_pelajaran                                        */
/*==============================================================*/
create table mata_pelajaran
(
   id_mata_pelajaran    int not null  comment '',
   nama_mata_pelajaran  varchar(50)  comment '',
   kode_mata_pelajaran  varchar(10)  comment '',
   kelompok_mata_pelajaran varchar(50)  comment '',
   primary key (id_mata_pelajaran)
);

/*==============================================================*/
/* Table: nilai_ekstrakurikuler                                 */
/*==============================================================*/
create table nilai_ekstrakurikuler
(
   id_nilai_ekstrakurikuler int not null  comment '',
   nilai_ekstrakurikuler varchar(10)  comment '',
   primary key (id_nilai_ekstrakurikuler)
);

/*==============================================================*/
/* Table: nilai_mata_pelajaran                                  */
/*==============================================================*/
create table nilai_mata_pelajaran
(
   id_nilai_mata_pelajaran int not null  comment '',
   tp1_lm1              int  comment '',
   tp2_lm1              int  comment '',
   tp3_lm1              int  comment '',
   tp4_lm1              int  comment '',
   sumatif_lm1_         int  comment '',
   tp1_lm2              int  comment '',
   tp2_lm2_             int  comment '',
   tp3_lm2_             int  comment '',
   tp4_lm2_             int  comment '',
   sumatif_lm2_         int  comment '',
   tp1_lm3_             int  comment '',
   tp2_lm3_             int  comment '',
   tp3_lm3_             int  comment '',
   tp4_lm3_             int  comment '',
   sumatif_lm3_         int  comment '',
   tp1_lm4_             int  comment '',
   tp2_lm4_             int  comment '',
   tp3_lm4_             int  comment '',
   tp4_lm4_             int  comment '',
   sumatif_lm4_         int  comment '',
   sumatif_tengah_semester_ int  comment '',
   primary key (id_nilai_mata_pelajaran)
);

/*==============================================================*/
/* Table: pengaturan_cetak                                      */
/*==============================================================*/
create table pengaturan_cetak
(
   id_pengaturan_cetak  int not null  comment '',
   tempat_cetak         varchar(50)  comment '',
   tanggal_cetak        date  comment '',
   primary key (id_pengaturan_cetak)
);

/*==============================================================*/
/* Table: sekolah                                               */
/*==============================================================*/
create table sekolah
(
   id_sekolah           int not null  comment '',
   logo_sekolah         varchar(255)  comment '',
   nama_sekolah         varchar(150)  comment '',
   npsn_sekolah         varchar(50)  comment '',
   nsm_sekolah          varchar(50)  comment '',
   alamat_sekolah       text  comment '',
   no_telepon_sekolah   varchar(20)  comment '',
   kecamatan_sekolah    varchar(50)  comment '',
   kabupaten_atau_kota_sekolah varchar(50)  comment '',
   provinsi             varchar(50)  comment '',
   nama__kepala_sekolah varchar(150)  comment '',
   nip_kepala_sekolah   varchar(50)  comment '',
   primary key (id_sekolah)
);

/*==============================================================*/
/* Table: siswa                                                 */
/*==============================================================*/
create table siswa
(
   id_siswa             int not null  comment '',
   no_absen_siswa       varchar(10)  comment '',
   no_induk_siswa       varchar(10)  comment '',
   nama_siswa           varchar(150)  comment '',
   jenis_kelamin_siswa  varchar(10)  comment '',
   primary key (id_siswa)
);

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   id_user              int not null  comment '',
   nama_lengkap_user    varchar(150)  comment '',
   email_user           varchar(150)  comment '',
   no_telepon_user      varchar(20)  comment '',
   username             varchar(20)  comment '',
   password_user        varchar(255)  comment '',
   primary key (id_user)
);

