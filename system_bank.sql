-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 21, 2023 at 03:26 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `system_bank`
--

-- --------------------------------------------------------

--
-- Table structure for table `rekening`
--

CREATE TABLE `rekening` (
  `no_rekening` bigint(14) NOT NULL,
  `ID_nasabah` int(13) NOT NULL,
  `Saldo` int(11) NOT NULL,
  `Tanggal_Daftar` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rekening`
--

INSERT INTO `rekening` (`no_rekening`, `ID_nasabah`, `Saldo`, `Tanggal_Daftar`) VALUES
(19210204000001, 1, 150000000, '2023-07-09 05:41:32'),
(19210204000002, 2, 40000000, '2023-06-12 13:39:14');

-- --------------------------------------------------------

--
-- Table structure for table `setor_tunai`
--

CREATE TABLE `setor_tunai` (
  `ID_transaksi` int(13) NOT NULL,
  `no_rekening` bigint(14) NOT NULL,
  `Tanggal_Transaksi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Jenis_Transaksi` varchar(50) NOT NULL,
  `Jumlah_Transaksi` varchar(14) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `setor_tunai`
--

INSERT INTO `setor_tunai` (`ID_transaksi`, `no_rekening`, `Tanggal_Transaksi`, `Jenis_Transaksi`, `Jumlah_Transaksi`, `keterangan`) VALUES
(1, 19210204000001, '2023-06-12 13:33:51', 'Setor Tunai', '150000000', 'Berhasil'),
(2, 19210204000002, '2023-06-12 13:35:41', 'Setor Tunai', '100000000', 'Berhasil');

-- --------------------------------------------------------

--
-- Table structure for table `tarik_tunai`
--

CREATE TABLE `tarik_tunai` (
  `ID_transaksi` int(13) NOT NULL,
  `no_rekening` bigint(14) NOT NULL,
  `Tanggal_Transaksi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Jenis_Transaksi` varchar(50) NOT NULL,
  `Jumlah_Transaksi` varchar(14) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tarik_tunai`
--

INSERT INTO `tarik_tunai` (`ID_transaksi`, `no_rekening`, `Tanggal_Transaksi`, `Jenis_Transaksi`, `Jumlah_Transaksi`, `keterangan`) VALUES
(1, 19210204000002, '2023-06-12 13:39:14', 'Tarik Tunai', '10000000', 'Berhasil'),
(2, 19210204000001, '2023-07-09 05:41:32', 'Tarik Tunai', '50000000', 'Berhasil');

-- --------------------------------------------------------

--
-- Table structure for table `transfer`
--

CREATE TABLE `transfer` (
  `ID_transaksi` int(13) NOT NULL,
  `no_rekening` bigint(14) NOT NULL,
  `Tanggal_Transaksi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Jenis_Transaksi` varchar(50) NOT NULL,
  `Jumlah_Transaksi` varchar(14) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transfer`
--

INSERT INTO `transfer` (`ID_transaksi`, `no_rekening`, `Tanggal_Transaksi`, `Jenis_Transaksi`, `Jumlah_Transaksi`, `keterangan`) VALUES
(1, 19210204000002, '2023-06-12 13:35:58', 'Transfer Keluar', '50000000', 'ke 19210204000001'),
(2, 19210204000001, '2023-06-12 13:35:58', 'Transfer Masuk', '50000000', 'dari 19210204000002');

-- --------------------------------------------------------

--
-- Table structure for table `user_bank`
--

CREATE TABLE `user_bank` (
  `ID_nasabah` int(13) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `username` varchar(6) NOT NULL,
  `password` varchar(6) NOT NULL,
  `no_hp` varchar(12) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_bank`
--

INSERT INTO `user_bank` (`ID_nasabah`, `nama_lengkap`, `username`, `password`, `no_hp`, `email`) VALUES
(1, 'Maulana Haekal Noval Akbar', 'hae192', '190204', '081345671234', 'noval.akbar.906@gmail.com'),
(2, 'Leny Latifaturohmah ', 'leny54', '110154', '081312345678', 'leny54@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `rekening`
--
ALTER TABLE `rekening`
  ADD PRIMARY KEY (`no_rekening`),
  ADD KEY `ID_nasabah` (`ID_nasabah`);

--
-- Indexes for table `setor_tunai`
--
ALTER TABLE `setor_tunai`
  ADD PRIMARY KEY (`ID_transaksi`),
  ADD KEY `no_rekening` (`no_rekening`);

--
-- Indexes for table `tarik_tunai`
--
ALTER TABLE `tarik_tunai`
  ADD PRIMARY KEY (`ID_transaksi`),
  ADD KEY `no_rekening` (`no_rekening`);

--
-- Indexes for table `transfer`
--
ALTER TABLE `transfer`
  ADD PRIMARY KEY (`ID_transaksi`),
  ADD KEY `no_rekening` (`no_rekening`);

--
-- Indexes for table `user_bank`
--
ALTER TABLE `user_bank`
  ADD PRIMARY KEY (`ID_nasabah`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `rekening`
--
ALTER TABLE `rekening`
  MODIFY `no_rekening` bigint(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19210204000003;

--
-- AUTO_INCREMENT for table `setor_tunai`
--
ALTER TABLE `setor_tunai`
  MODIFY `ID_transaksi` int(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tarik_tunai`
--
ALTER TABLE `tarik_tunai`
  MODIFY `ID_transaksi` int(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transfer`
--
ALTER TABLE `transfer`
  MODIFY `ID_transaksi` int(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_bank`
--
ALTER TABLE `user_bank`
  MODIFY `ID_nasabah` int(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rekening`
--
ALTER TABLE `rekening`
  ADD CONSTRAINT `rekening_ibfk_1` FOREIGN KEY (`ID_nasabah`) REFERENCES `user_bank` (`ID_nasabah`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `setor_tunai`
--
ALTER TABLE `setor_tunai`
  ADD CONSTRAINT `setor_tunai_ibfk_1` FOREIGN KEY (`no_rekening`) REFERENCES `rekening` (`no_rekening`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tarik_tunai`
--
ALTER TABLE `tarik_tunai`
  ADD CONSTRAINT `tarik_tunai_ibfk_1` FOREIGN KEY (`no_rekening`) REFERENCES `rekening` (`no_rekening`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transfer`
--
ALTER TABLE `transfer`
  ADD CONSTRAINT `transfer_ibfk_1` FOREIGN KEY (`no_rekening`) REFERENCES `rekening` (`no_rekening`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
