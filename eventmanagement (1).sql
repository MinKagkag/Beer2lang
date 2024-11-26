-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2024 at 09:20 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eventmanagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `EventID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` text DEFAULT NULL,
  `Date` date NOT NULL,
  `CreatorID` int(11) NOT NULL,
  `ImageURL` varchar(2083) DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`EventID`, `Name`, `Description`, `Date`, `CreatorID`, `ImageURL`, `CreatedAt`) VALUES
(1, 'Pop Night', 'Enjoy an unforgettable pop music experience!', '2024-11-12', 12, 'J-POP.png', '2024-11-25 15:16:29'),
(11, 'Music Festival', 'Join the biggest music festival of the year!', '2024-11-28', 12, 'music_festival.jpg', '2024-11-25 15:19:29'),
(13, 'Rock Concert', 'Experience an epic rock performance.', '2024-11-24', 12, 'concert_login.jpg', '2024-11-25 15:20:58'),
(24, 'Tour', 'funn music', '2024-11-21', 23, '1732607302303-20240808-184010-0.jpg', '2024-11-26 07:48:22'),
(25, 'Foodd', 'dee food', '2024-11-27', 24, '1732607600853-1732607056043-Screenshot 2024-08-27 121431.png', '2024-11-26 07:53:20');

-- --------------------------------------------------------

--
-- Table structure for table `joins`
--

CREATE TABLE `joins` (
  `JoinID` int(11) NOT NULL,
  `EventID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `JoinedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `joins`
--

INSERT INTO `joins` (`JoinID`, `EventID`, `UserID`, `JoinedAt`) VALUES
(1, 1, 20, '2024-11-25 15:47:21'),
(2, 1, 12, '2024-11-25 16:03:50'),
(3, 11, 12, '2024-11-25 16:04:12'),
(4, 11, 20, '2024-11-25 16:14:27'),
(5, 13, 20, '2024-11-25 16:14:29'),
(7, 1, 21, '2024-11-26 06:38:13'),
(9, 24, 23, '2024-11-26 07:48:52'),
(10, 1, 24, '2024-11-26 07:53:34'),
(11, 11, 24, '2024-11-26 07:53:40'),
(12, 13, 24, '2024-11-26 07:53:42'),
(13, 24, 24, '2024-11-26 07:53:58'),
(14, 25, 24, '2024-11-26 07:54:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Username`, `Email`, `Password`, `CreatedAt`) VALUES
(12, 'Icee', 'ice.hiruntivakul@gmail.com', '123', '2024-11-24 18:41:56'),
(18, '000', '000@gmail.com', '123', '2024-11-25 14:12:15'),
(19, '449', '003w@gmail.com', '123', '2024-11-25 14:14:19'),
(20, '99987', 'mnbmbn@gmail.com', '123', '2024-11-25 14:16:25'),
(21, 'as', 'A@gmail.com', '123', '2024-11-26 06:36:36'),
(22, 'asf', 'as@gmail.com', '12345', '2024-11-26 06:52:19'),
(23, '333', '333@gmail.com', '123', '2024-11-26 07:05:55'),
(24, 'zxc', '123@gmail.com', '123', '2024-11-26 07:52:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`EventID`),
  ADD KEY `CreatorID` (`CreatorID`);

--
-- Indexes for table `joins`
--
ALTER TABLE `joins`
  ADD PRIMARY KEY (`JoinID`),
  ADD KEY `EventID` (`EventID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `EventID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `joins`
--
ALTER TABLE `joins`
  MODIFY `JoinID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`CreatorID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE,
  ADD CONSTRAINT `events_ibfk_2` FOREIGN KEY (`CreatorID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE;

--
-- Constraints for table `joins`
--
ALTER TABLE `joins`
  ADD CONSTRAINT `joins_ibfk_1` FOREIGN KEY (`EventID`) REFERENCES `events` (`EventID`) ON DELETE CASCADE,
  ADD CONSTRAINT `joins_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
