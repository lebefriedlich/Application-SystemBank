# Application-SystemBank
The bank system application is built using Java GUI technology in NetBeans and supported by the MySQL database.

to create table user_bank

    CREATE TABLE `user_bank` (
      `ID_nasabah` int(13) NOT NULL AUTO_INCREMENT,
      `nama_lengkap` varchar(100) NOT NULL,
      `username` varchar(6) NOT NULL,
      `password` varchar(6) NOT NULL,
      `no_hp` varchar(12) NOT NULL,
      `email` varchar(30) NOT NULL,
      PRIMARY KEY (`ID_nasabah`)
    ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4

to create table rekening

    CREATE TABLE `rekening` (
      `no_rekening` bigint(14) NOT NULL AUTO_INCREMENT,
      `ID_nasabah` int(13) NOT NULL,
      `Saldo` int(11) NOT NULL,
      `Tanggal_Daftar` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
      PRIMARY KEY (`no_rekening`),
      KEY `ID_nasabah` (`ID_nasabah`),
      CONSTRAINT `rekening_ibfk_1` FOREIGN KEY (`ID_nasabah`) REFERENCES `user_bank` (`ID_nasabah`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE=InnoDB AUTO_INCREMENT=19210204000003 DEFAULT CHARSET=utf8mb4

to create table setor_tunai
    
    CREATE TABLE `setor_tunai` (
      `ID_transaksi` int(13) NOT NULL AUTO_INCREMENT,
      `no_rekening` bigint(14) NOT NULL,
      `Tanggal_Transaksi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
      `Jenis_Transaksi` varchar(50) NOT NULL,
      `Jumlah_Transaksi` varchar(14) NOT NULL,
      `keterangan` text NOT NULL,
      PRIMARY KEY (`ID_transaksi`),
      KEY `no_rekening` (`no_rekening`),
      CONSTRAINT `setor_tunai_ibfk_1` FOREIGN KEY (`no_rekening`) REFERENCES `rekening` (`no_rekening`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4

to create table tarik_tunai

    CREATE TABLE `tarik_tunai` (
      `ID_transaksi` int(13) NOT NULL AUTO_INCREMENT,
      `no_rekening` bigint(14) NOT NULL,
      `Tanggal_Transaksi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
      `Jenis_Transaksi` varchar(50) NOT NULL,
      `Jumlah_Transaksi` varchar(14) NOT NULL,
      `keterangan` text NOT NULL,
      PRIMARY KEY (`ID_transaksi`),
      KEY `no_rekening` (`no_rekening`),
      CONSTRAINT `tarik_tunai_ibfk_1` FOREIGN KEY (`no_rekening`) REFERENCES `rekening` (`no_rekening`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4

to create table transfer

    CREATE TABLE `transfer` (
      `ID_transaksi` int(13) NOT NULL AUTO_INCREMENT,
      `no_rekening` bigint(14) NOT NULL,
      `Tanggal_Transaksi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
      `Jenis_Transaksi` varchar(50) NOT NULL,
      `Jumlah_Transaksi` varchar(14) NOT NULL,
      `keterangan` text NOT NULL,
      PRIMARY KEY (`ID_transaksi`),
      KEY `no_rekening` (`no_rekening`),
      CONSTRAINT `transfer_ibfk_1` FOREIGN KEY (`no_rekening`) REFERENCES `rekening` (`no_rekening`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4
