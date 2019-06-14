-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2019 at 06:42 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `banmaytinh`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `chitietsanpham` (IN `id` INT)  NO SQL
SELECT sanpham.*, thuonghieu.TenThuongHieu, loaisanpham.TenLoaiSanPham
 FROM sanpham, thuonghieu, loaisanpham
  where sanpham.MaLoaiSanPham = LoaiSanPham.MaLoaiSanPham AND
  sanpham.MaThuongHieu = thuonghieu.MaThuongHieu
  and sanpham.MaSanPham = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `taoDonHang` (IN `MaNguoiDung` INT, IN `ghichu` TEXT, IN `TongTien` INT, IN `TrangThai` INT, IN `DiaChiNhan` VARCHAR(255))  NO SQL
INSERT INTO `donhang` (  `MaNguoiDung`,`DiaChiNhan`, `ghichu`, `TongTien`, `TrangThai`) VALUES ( MaNguoiDung, DiaChiNhan, ghichu, TongTien,TrangThai)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `chitietdonhang`
--

CREATE TABLE `chitietdonhang` (
  `MaChiTiet` int(11) NOT NULL,
  `MaDonHang` int(11) DEFAULT NULL,
  `MaSanPham` int(11) DEFAULT NULL,
  `SoLuong` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chitietdonhang`
--

INSERT INTO `chitietdonhang` (`MaChiTiet`, `MaDonHang`, `MaSanPham`, `SoLuong`) VALUES
(4, 22, 4, 1),
(5, 22, 7, 1),
(6, 23, 22, 13),
(7, 23, 1, 12),
(8, 23, 2, 14),
(9, 24, 1, 12),
(10, 27, 2, 1),
(11, 31, 2, 21),
(12, 32, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `danhgia`
--

CREATE TABLE `danhgia` (
  `MaDanhGia` int(11) NOT NULL,
  `MaNguoiDung` int(11) DEFAULT NULL,
  `MaSanPham` int(11) DEFAULT NULL,
  `GiaTri` int(11) DEFAULT NULL,
  `DanhGia` varchar(500) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `danhgia`
--

INSERT INTO `danhgia` (`MaDanhGia`, `MaNguoiDung`, `MaSanPham`, `GiaTri`, `DanhGia`) VALUES
(1, 2, 23, 2, 'Ngon'),
(2, 2, 28, 4, 'tot'),
(3, 2, 16, 5, 'good'),
(4, 2, 2, 5, 'sdffsdfsdf'),
(5, 2, 3, 1, '1'),
(6, 2, 3, 2, 'ok'),
(10, 2, 3, 5, 'không ổn');

-- --------------------------------------------------------

--
-- Table structure for table `donhang`
--

CREATE TABLE `donhang` (
  `MaDonHang` int(11) NOT NULL,
  `NgayDatHang` datetime DEFAULT CURRENT_TIMESTAMP,
  `MaNguoiDung` int(11) DEFAULT NULL,
  `DiaChiNhan` varchar(255) CHARACTER SET utf8 NOT NULL,
  `ghichu` text CHARACTER SET utf8 NOT NULL,
  `TongTien` int(11) DEFAULT NULL,
  `TrangThai` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `donhang`
--

INSERT INTO `donhang` (`MaDonHang`, `NgayDatHang`, `MaNguoiDung`, `DiaChiNhan`, `ghichu`, `TongTien`, `TrangThai`) VALUES
(22, '2019-06-05 16:19:48', 2, 'So 1 duong 1, Ho Chi minh', '', 1000, 5),
(23, '2019-06-05 23:35:29', 2, 'So 1 duong 1, Ho Chi minh', '', 16639, 1),
(24, '2019-06-05 23:38:46', 2, 'So 1 duong 1, Ho Chi minh', '', 9600, 5),
(25, '2019-06-06 00:32:12', 2, 'So 1 duong 1, Ho Chi minh', '', 0, 1),
(27, '2019-06-06 09:57:15', 2, 'So 1 duong 1, Ho Chi minh', '', 500, 5),
(30, '2019-06-06 10:09:08', 1, 's5 duong 4, hcm', 'Phone: 4564875613\nEmail: aaaaaaaaaaaa@gmail.com\n', 0, 1),
(31, '2019-06-06 10:10:09', 1, 's5 duong 4, hcm', 'Phone: 4564875613\nEmail: aaaaaaaaaaaa@gmail.com\n', 10500, 1),
(32, '2019-06-11 11:00:56', 1, ', ', 'Phone: \nEmail: \n', 500, 1);

-- --------------------------------------------------------

--
-- Table structure for table `loaisanpham`
--

CREATE TABLE `loaisanpham` (
  `MaLoaiSanPham` int(11) NOT NULL,
  `TenLoaiSanPham` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `loaisanpham`
--

INSERT INTO `loaisanpham` (`MaLoaiSanPham`, `TenLoaiSanPham`) VALUES
(1, 'Laptop'),
(2, 'PC'),
(3, 'CPU'),
(4, 'RAM'),
(5, 'HDD/SSD'),
(6, 'Phụ kiện khác');

-- --------------------------------------------------------

--
-- Table structure for table `nguoidung`
--

CREATE TABLE `nguoidung` (
  `MaNguoiDung` int(11) NOT NULL,
  `TenDangNhap` varchar(45) DEFAULT NULL,
  `HoTen` varchar(100) CHARACTER SET utf8 NOT NULL,
  `MatKhau` varchar(45) DEFAULT NULL,
  `NamSinh` int(11) DEFAULT NULL,
  `SoDienThoai` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Active` int(11) DEFAULT '0',
  `diachi` varchar(255) CHARACTER SET utf8 NOT NULL,
  `thanhpho` varchar(30) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nguoidung`
--

INSERT INTO `nguoidung` (`MaNguoiDung`, `TenDangNhap`, `HoTen`, `MatKhau`, `NamSinh`, `SoDienThoai`, `Email`, `Active`, `diachi`, `thanhpho`) VALUES
(1, 'any', 'khách Vãng lai', 'any', 1992, '0123456789', 'vanglai@gmail.com', 1, '', ''),
(2, 'binh', 'Tran Phuong Binh', '98', 1992, '0123456789', 'binhtp.net@gmail.com', 1, 'So 1 duong 1', 'Ho Chi minh'),
(3, '96', '', '96', 1992, '0123456789', 'binhtp.net@gmail.com', 0, '', ''),
(4, '1', '', '1', 1992, '0123456789', 'binhtp.net@gmail.com', 1, '', ''),
(5, '90', '', '90', 1992, '0123456789', 'binhtp.net@gmail.com', 1, '', ''),
(6, '88', '', '88', 1992, '0123456789', 'binhtp.net@gmail.com', 0, '', ''),
(7, '99', '', '99', 1992, '0123456789', 'binhtp.net@gmail.com', 0, '', ''),
(8, 'a', '', '123', 1992, '0123456789', 'aaaa@sss.copm', 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

CREATE TABLE `sanpham` (
  `MaSanPham` int(11) NOT NULL,
  `TenSanPham` varchar(450) CHARACTER SET utf8 DEFAULT NULL,
  `GiaTien` int(11) DEFAULT NULL,
  `MaLoaiSanPham` int(11) DEFAULT NULL,
  `SoLuong` int(11) DEFAULT NULL,
  `MoTa` varchar(450) CHARACTER SET utf8 DEFAULT NULL,
  `MaThuongHieu` int(11) DEFAULT NULL,
  `HinhSanPham` varchar(45) DEFAULT NULL,
  `KichThuoc` varchar(450) DEFAULT NULL,
  `MauSac` varchar(450) DEFAULT NULL,
  `TrongLuong` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`MaSanPham`, `TenSanPham`, `GiaTien`, `MaLoaiSanPham`, `SoLuong`, `MoTa`, `MaThuongHieu`, `HinhSanPham`, `KichThuoc`, `MauSac`, `TrongLuong`) VALUES
(1, 'Dell Latitude E7270', 800, 1, 2, 'i5 520/ Ram 2G/ HDD 250G  ', 1, 'i1.jpg', '1', 'naau', 5),
(2, 'HP Elibook 2740P', 500, 1, 2, 'I5 U560/Ram 3G/160G Cũ', 1, 'i2.png', '2', 'den', 5),
(3, 'Laptop NEC VK13MB-B', 700, 1, 2, 'i5 560U/ Ram 2G/ 160G Cũ', 1, 'i3.png', '3', NULL, 5),
(4, 'Laptop Fujisu P770/B', 500, 1, 2, 'i5 520/ Ram 2G/ HDD 250G  ', 1, 'i4.png', '5', NULL, 5),
(5, 'Dell Vostro 3460', 500, 1, 2, 'i5 520/ Ram 2G/ HDD 250G  ', 1, 'i5.png', '6', NULL, 55),
(6, 'Dell Vostro 3560', 500, 1, 2, 'i5 520/ Ram 2G/ HDD 250G  ', 1, 'i6.png', '7', 'w', 5),
(7, 'Dell XPS 13', 500, 1, 2, 'i5 520/ Ram 2G/ HDD 250G  ', 1, 'i7.png', '7', NULL, 5),
(8, 'Dell XPS 15', 500, 1, 2, 'i5 520/ Ram 2G/ HDD 250G  ', 1, 'i8.png', '4', 'e', 5),
(9, 'Dell Latitude E7240', 500, 1, 2, 'i5 520/ Ram 2G/ HDD 250G  ', 1, 'i9.png', '5', 'e', 5),
(10, 'Cấu Hình Gaming 1', 1, 2, 2, 'H110, G4560, RX470 4G, Ram 8G, SSD 120G, PSU 700W ', 2, 'p5.jpg', '7', 'e', 5),
(11, 'Cấu Hình Gaming 2', 2, 2, 4, 'A320, Ryzen 3 2200G, RX570 4G, Ram 8G, SSD 120G, PSU 700W ', 2, 'p2.jpg', '67', 'e', 5),
(12, 'Cấu Hình Gaming 3', 3, 2, 4, 'A320, Ryzen 3 2200G, GTX1050Ti 4G, Ram 8G, SSD 120G, PSU 500W ', 2, 'p3.jpg', '898', 'e', 5),
(13, 'Cấu Hình Gaming 4', 4, 2, 4, 'H81, Xeon E3 1220-V3, RX470 8G, Ram 8G, SSD 120G. PSU 700W ', 2, 'p4.jpg', '9', 'e', 5),
(14, 'Cấu Hình Gaming 5', 5, 2, 4, 'H310, i3 8100, RX570 4G, Ram 8G, SSD 120G, PSU 700W ', 2, 'p5.jpg', '546', 'e', 5),
(15, 'Cấu Hình Gaming 6', 6, 2, 4, 'H310, i3 8100, GTX1650 4G, Ram 8G, SSD 120G, PSU 700W ', 2, 'p6.jpg', '345', NULL, 5),
(16, 'Cấu Hình Gaming 7', 7, 2, 4, 'A320, Ryzen 3 2200G, GTX1060 3G, Ram 8G, SSD 120G, PSU 700W ', 2, 'p7.jpg', '43523', 'e', 5),
(17, 'Cấu Hình Gaming 8', 8, 2, 4, 'H310, i3 8100, GTX1060 3G, Ram 8G, SSD 120G. PSU 700W ', 2, 'p8.jpg', '432', 'e', 5),
(18, 'Cấu Hình Gaming 9', 9, 2, 4, 'H310, i3 8100, GTX1060 6G, Ram 8G, SSD 120G. PSU 500W ', 2, 'p9.jpg', '21', 'e', 5),
(19, 'Cấu Hình Gaming 10', 10, 2, 4, 'H310, i3 8100, GTX1660 6G, Ram 8G, SSD 120G, PSU 700W ', 2, 'p10.jpg', '332', 'e', 5),
(20, 'CPU i9 9900K', 1, 3, 9, '(3.60GHz Up to 5.0GHz, 16M) Box Chính Hãng ', 2, 'c4.jpg', '5543', 'w', 5),
(21, 'CPU i7 9700K', 2, 3, 9, '(3.60GHz Up to 5.0GHz, 16M) Box Chính Hãng ', 2, 'c2.jpg', '6', 'r', 5),
(22, 'CPU i5 9400F', 3, 3, 9, '(3.60GHz Up to 5.0GHz, 16M) Box Chính Hãng ', 2, 'c2.jpg', '547', 'e', 5),
(23, 'CPU i5 9400F', 4, 3, 9, '(3.60GHz Up to 5.0GHz, 16M) Box Chính Hãng ', 2, 'c4.jpg', '658', 'r', 5),
(24, 'CPU i3 9100F', 5, 3, 9, '(3.60GHz Up to 5.0GHz, 16M) Box Chính Hãng ', 2, 'c4.jpg', '7698', 'ew', 5),
(25, 'CPU i7 8700K', 6, 3, 9, '(3.60GHz Up to 5.0GHz, 16M) Box Chính Hãng ', 2, 'c4.jpg', '879', 'ew', 5),
(26, 'CPU E3-1220v3', 7, 3, 9, '(3.60GHz Up to 5.0GHz, 16M) Box Chính Hãng ', 2, 'c6.jpg', '78', 'r', 5),
(27, 'CPU i7 9700K', 8, 3, 9, '(3.60GHz Up to 5.0GHz, 16M) Box Chính Hãng ', 2, 'c7.jpg', '9', 'e', 5),
(28, 'CPU i7 9700K', 9, 3, 9, '(3.60GHz Up to 5.0GHz, 16M) Box Chính Hãng ', 2, 'c8.jpg', '87', 'e', 5),
(29, 'CPU i7 9700K', 10, 3, 9, '(3.60GHz Up to 5.0GHz, 16M) Box Chính Hãng ', 2, 'c9.jpg', '4', 'r', 5),
(34, 'Dell E7440', 500, 1, 1, 'i5 520/ Ram 2G/ HDD 250G  ', 2, 'i10.jpg', '35', 'do', 5);

-- --------------------------------------------------------

--
-- Table structure for table `thuonghieu`
--

CREATE TABLE `thuonghieu` (
  `MaThuongHieu` int(11) NOT NULL,
  `TenThuongHieu` varchar(45) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thuonghieu`
--

INSERT INTO `thuonghieu` (`MaThuongHieu`, `TenThuongHieu`) VALUES
(1, 'DELL'),
(2, 'ASUS'),
(3, 'MSI');

-- --------------------------------------------------------

--
-- Table structure for table `trangthai`
--

CREATE TABLE `trangthai` (
  `MaTrangThai` int(11) NOT NULL,
  `TenTrangThai` varchar(45) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trangthai`
--

INSERT INTO `trangthai` (`MaTrangThai`, `TenTrangThai`) VALUES
(1, 'Chưa thanh toán'),
(2, 'Đã gói hàng'),
(3, 'Đang giao hàng'),
(4, 'Đã nhận hàng'),
(5, 'Đã thanh toán');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD PRIMARY KEY (`MaChiTiet`),
  ADD KEY `FK_ChiTietDonHang_DonHang_idx` (`MaDonHang`),
  ADD KEY `FK_ChiTietDonHang_SanPham_idx` (`MaSanPham`);

--
-- Indexes for table `danhgia`
--
ALTER TABLE `danhgia`
  ADD PRIMARY KEY (`MaDanhGia`),
  ADD KEY `FK_DanhGia_NguoiDung_idx` (`MaNguoiDung`),
  ADD KEY `FK_DanhGia_SanPham_idx` (`MaSanPham`);

--
-- Indexes for table `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`MaDonHang`),
  ADD KEY `FK_DonHang_NguoiDung_idx` (`MaNguoiDung`),
  ADD KEY `FK_DonHang_TrangThai_idx` (`TrangThai`);

--
-- Indexes for table `loaisanpham`
--
ALTER TABLE `loaisanpham`
  ADD PRIMARY KEY (`MaLoaiSanPham`);

--
-- Indexes for table `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`MaNguoiDung`);

--
-- Indexes for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`MaSanPham`),
  ADD KEY `FK_SanPham_MaLoaiSanPham_idx` (`MaLoaiSanPham`),
  ADD KEY `FK_SanPham_ThuongHieu_idx` (`MaThuongHieu`);

--
-- Indexes for table `thuonghieu`
--
ALTER TABLE `thuonghieu`
  ADD PRIMARY KEY (`MaThuongHieu`);

--
-- Indexes for table `trangthai`
--
ALTER TABLE `trangthai`
  ADD PRIMARY KEY (`MaTrangThai`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  MODIFY `MaChiTiet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `danhgia`
--
ALTER TABLE `danhgia`
  MODIFY `MaDanhGia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `donhang`
--
ALTER TABLE `donhang`
  MODIFY `MaDonHang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `loaisanpham`
--
ALTER TABLE `loaisanpham`
  MODIFY `MaLoaiSanPham` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `MaNguoiDung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `MaSanPham` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `thuonghieu`
--
ALTER TABLE `thuonghieu`
  MODIFY `MaThuongHieu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `trangthai`
--
ALTER TABLE `trangthai`
  MODIFY `MaTrangThai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD CONSTRAINT `FK_ChiTietDonHang_DonHang` FOREIGN KEY (`MaDonHang`) REFERENCES `donhang` (`MaDonHang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ChiTietDonHang_SanPham` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`MaSanPham`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `danhgia`
--
ALTER TABLE `danhgia`
  ADD CONSTRAINT `FK_DanhGia_NguoiDung` FOREIGN KEY (`MaNguoiDung`) REFERENCES `nguoidung` (`MaNguoiDung`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DanhGia_SanPham` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`MaSanPham`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `donhang`
--
ALTER TABLE `donhang`
  ADD CONSTRAINT `FK_DonHang_NguoiDung` FOREIGN KEY (`MaNguoiDung`) REFERENCES `nguoidung` (`MaNguoiDung`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DonHang_TrangThai` FOREIGN KEY (`TrangThai`) REFERENCES `trangthai` (`MaTrangThai`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `FK_SanPham_LoaiSanPham` FOREIGN KEY (`MaLoaiSanPham`) REFERENCES `loaisanpham` (`MaLoaiSanPham`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SanPham_ThuongHieu` FOREIGN KEY (`MaThuongHieu`) REFERENCES `thuonghieu` (`MaThuongHieu`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
