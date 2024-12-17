-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 10, 2024 at 09:08 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan_sederhana_fahmi`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE IF NOT EXISTS `anggota` (
  `MemberID` int(11) NOT NULL AUTO_INCREMENT,
  `Nama` varchar(100) NOT NULL,
  `Alamat` varchar(255) NOT NULL,
  `NoTelp` varchar(15) NOT NULL,
  `Registrasi` date NOT NULL,
  PRIMARY KEY (`MemberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE IF NOT EXISTS `buku` (
  `BookID` int(11) NOT NULL AUTO_INCREMENT,
  `Judul` varchar(255) NOT NULL,
  `Penulis` varchar(100) NOT NULL,
  `Penerbit` varchar(100) NOT NULL,
  `Tahun_terbit` year(4) NOT NULL,
  `Jumlah_halaman` int(11) NOT NULL,
  `KategoriID` int(11) NOT NULL,
  PRIMARY KEY (`BookID`),
  FOREIGN KEY (`KategoriID`) REFERENCES `kategori`(`KategoriID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE IF NOT EXISTS `kategori` (
  `KategoriID` int(11) NOT NULL AUTO_INCREMENT,
  `Nama_kategori` varchar(50) NOT NULL,
  PRIMARY KEY (`KategoriID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE IF NOT EXISTS `peminjaman` (
  `LoanID` int(11) NOT NULL AUTO_INCREMENT,
  `MemberID` int(11) NOT NULL,
  `BookID` int(11) NOT NULL,
  `Pinjam` date NOT NULL,
  `Kembali` date NOT NULL,
  PRIMARY KEY (`LoanID`),
  FOREIGN KEY (`MemberID`) REFERENCES `anggota`(`MemberID`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`BookID`) REFERENCES `buku`(`BookID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
