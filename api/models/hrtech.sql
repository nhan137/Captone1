-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 07, 2024 lúc 10:33 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `hrtech`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attendanceerrorreport`
--

CREATE TABLE `attendanceerrorreport` (
  `ErrorReportID` int(11) NOT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `ErrorDescription` text DEFAULT NULL,
  `ReportDate` date DEFAULT NULL,
  `ResolvedStatus` varchar(20) DEFAULT NULL,
  `ResolvedBy` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `checkincheckout`
--

CREATE TABLE `checkincheckout` (
  `CheckinCheckoutID` int(11) NOT NULL,
  `CheckinTime` datetime DEFAULT NULL,
  `CheckoutTime` datetime DEFAULT NULL,
  `WorkUnits` int(11) DEFAULT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `OvertimeHours` int(11) DEFAULT NULL,
  `OvertimeRate` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employee`
--

CREATE TABLE `employee` (
  `EmployeeID` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(250) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `IdentityNumber` varchar(20) DEFAULT NULL,
  `IdentityIssuedDate` date DEFAULT NULL,
  `IdentityIssuedPlace` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `MaritalStatus` varchar(20) DEFAULT NULL,
  `Hometown` varchar(100) DEFAULT NULL,
  `PlaceOfBirth` varchar(100) DEFAULT NULL,
  `Nationality` varchar(50) DEFAULT NULL,
  `Role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `employee`
--

INSERT INTO `employee` (`EmployeeID`, `Username`, `Password`, `FirstName`, `LastName`, `DateOfBirth`, `Gender`, `IdentityNumber`, `IdentityIssuedDate`, `IdentityIssuedPlace`, `Email`, `PhoneNumber`, `MaritalStatus`, `Hometown`, `PlaceOfBirth`, `Nationality`, `Role`) VALUES
(1, 'phutuan', '$2y$10$fjce4gcLOPtO4oLLZbtTLOyKUId40S57qvNnCW5EcE6uynIAlVeai', 'Tuan', 'Phan', '2002-04-27', 'n', '12345', '2020-11-18', 'Da Nang', 'phutuan112@gmail.com', '54321', 'Doc than', 'Da Nang', 'Da Nang', 'Viet Nam', 'Nhan Vien');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `leaverequest`
--

CREATE TABLE `leaverequest` (
  `LeaveRequestID` int(11) NOT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `StartDate` datpushe DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `Reason` text DEFAULT NULL,
  `ApprovedBy` varchar(50) DEFAULT NULL,
  `ApprovalDate` date DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `NotificationID` int(11) NOT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `Message` text DEFAULT NULL,
  `NotificationDate` datetime DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `salary`
--

CREATE TABLE `salary` (
  `SalaryID` int(11) NOT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `CheckinCheckoutID` int(11) DEFAULT NULL,
  `BaseSalary` decimal(15,2) DEFAULT NULL,
  `Bonus` decimal(15,2) DEFAULT NULL,
  `Deductions` decimal(15,2) DEFAULT NULL,
  `TotalSalary` decimal(15,2) DEFAULT NULL,
  `OvertimeHours` int(11) DEFAULT NULL,
  `OvertimeRate` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `attendanceerrorreport`
--
ALTER TABLE `attendanceerrorreport`
  ADD PRIMARY KEY (`ErrorReportID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Chỉ mục cho bảng `checkincheckout`
--
ALTER TABLE `checkincheckout`
  ADD PRIMARY KEY (`CheckinCheckoutID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Chỉ mục cho bảng `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EmployeeID`,`Username`);

--
-- Chỉ mục cho bảng `leaverequest`
--
ALTER TABLE `leaverequest`
  ADD PRIMARY KEY (`LeaveRequestID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`NotificationID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Chỉ mục cho bảng `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`SalaryID`),
  ADD KEY `EmployeeID` (`EmployeeID`),
  ADD KEY `CheckinCheckoutID` (`CheckinCheckoutID`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `attendanceerrorreport`
--
ALTER TABLE `attendanceerrorreport`
  ADD CONSTRAINT `attendanceerrorreport_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`);

--
-- Các ràng buộc cho bảng `checkincheckout`
--
ALTER TABLE `checkincheckout`
  ADD CONSTRAINT `checkincheckout_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`);

--
-- Các ràng buộc cho bảng `leaverequest`
--
ALTER TABLE `leaverequest`
  ADD CONSTRAINT `leaverequest_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`);

--
-- Các ràng buộc cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`);

--
-- Các ràng buộc cho bảng `salary`
--
ALTER TABLE `salary`
  ADD CONSTRAINT `salary_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`),
  ADD CONSTRAINT `salary_ibfk_2` FOREIGN KEY (`CheckinCheckoutID`) REFERENCES `checkincheckout` (`CheckinCheckoutID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
