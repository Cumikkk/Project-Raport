-- Active: 1759783745852@@127.0.0.1@3306@project_raport
-- Active: 1759783745852@@127.0.0.1@3306@mysql.0.1@3306@sekolah.0.1@3306@mysql
CREATE DATABASE project_raport;
USE project_raport;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

INSERT INTO users (username, password) VALUES ('admin@gmail.com', '12345');

CREATE TABLE siswa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    absen INT NOT NULL,
    nis VARCHAR(20) NOT NULL,
    nama VARCHAR(100) NOT NULL,
    wali_kelas VARCHAR(100) NOT NULL
);
