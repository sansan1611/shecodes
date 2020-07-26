-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 25, 2020 lúc 08:41 PM
-- Phiên bản máy phục vụ: 10.4.8-MariaDB
-- Phiên bản PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `corona`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `adminId` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`adminId`, `username`, `password`) VALUES
(1, 'lena', 'lena');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vietnam`
--

CREATE TABLE `vietnam` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `cases` int(10) NOT NULL,
  `active` int(10) NOT NULL,
  `deaths` int(10) NOT NULL,
  `recovered` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `vietnam`
--

INSERT INTO `vietnam` (`id`, `name`, `cases`, `active`, `deaths`, `recovered`) VALUES
(2, 'VN-HN', 121, 0, 0, 121),
(3, 'VN-SG', 62, 0, 0, 62),
(4, 'Vinh Phuc', 19, 0, 0, 19),
(5, 'Ninh Binh', 23, 10, 0, 13),
(6, 'Binh Thuan', 9, 0, 0, 9),
(14, 'Quang Ninh', 11, 2, 0, 9),
(15, 'VN-DN', 7, 1, 0, 6),
(16, 'Ha Tinh', 4, 0, 0, 4),
(17, 'Ha Nam', 4, 0, 0, 4),
(18, 'Bac Giang', 4, 0, 0, 4),
(19, 'Dong Thap', 6, 0, 0, 6),
(20, 'Thanh Hoa', 17, 4, 0, 13),
(21, 'Tay Ninh', 4, 0, 0, 4),
(22, 'Bac Lieu', 24, 3, 0, 21),
(23, 'Quang Nam', 5, 0, 0, 5),
(24, 'Thai Binh', 30, 0, 0, 30),
(25, 'VN-CT', 2, 0, 0, 2),
(26, 'Lao Cai', 2, 0, 0, 2),
(27, 'Ninh Thuan', 2, 0, 0, 2),
(28, 'Thua Thien-Hue', 2, 0, 0, 2),
(29, 'Tra Vinh', 2, 0, 0, 2),
(30, 'Thai Nguyen', 1, 0, 0, 1),
(31, 'Hung Yen', 5, 0, 0, 5),
(32, 'Dong Nai', 1, 0, 0, 1),
(33, 'Ha Giang', 1, 0, 0, 1),
(34, 'Hai Duong', 5, 1, 0, 4),
(35, 'Lai Chau', 1, 0, 0, 1),
(36, 'Khanh Hoa', 1, 0, 0, 1),
(37, 'Ben Tre', 1, 0, 0, 1),
(38, 'Bac Ninh', 1, 0, 0, 1),
(55, 'Ba Ria- Vung Tau', 26, 17, 0, 9),
(56, 'Nam Dinh', 7, 7, 0, 0),
(57, 'Hoa Binh', 4, 4, 0, 0),
(58, 'Ca Mau', 1, 1, 0, 0),
(59, 'Quang Ngai', 1, 1, 0, 0),
(60, 'Kien Giang', 1, 1, 0, 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminId`);

--
-- Chỉ mục cho bảng `vietnam`
--
ALTER TABLE `vietnam`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `adminId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `vietnam`
--
ALTER TABLE `vietnam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
