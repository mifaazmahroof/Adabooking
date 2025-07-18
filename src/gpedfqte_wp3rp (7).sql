-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 23, 2025 at 10:48 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gpedfqte_wp3rp`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `cus_id` int(11) NOT NULL,
  `pitch_id` int(11) NOT NULL,
  `booking_date` date NOT NULL,
  `timeslot` time NOT NULL,
  `rate_applied` decimal(10,2) NOT NULL,
  `status` enum('Pending','Confirmed','Cancelled','Payment Awaited') NOT NULL DEFAULT 'Pending',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `court`
--

CREATE TABLE `court` (
  `court_id` int(11) NOT NULL,
  `stadium_id` int(11) NOT NULL,
  `court_type` varchar(100) NOT NULL,
  `initial_cost` decimal(10,2) DEFAULT NULL,
  `extra_cost` decimal(10,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `discount_type` enum('percentage','amount','none') DEFAULT 'none'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `court`
--

INSERT INTO `court` (`court_id`, `stadium_id`, `court_type`, `initial_cost`, `extra_cost`, `discount`, `discount_type`) VALUES
(1, 2, 'Futsal', NULL, NULL, NULL, 'none'),
(2, 2, 'Futsal', NULL, NULL, NULL, 'none');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cus_id` int(11) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `NIC` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `image_path` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gametype`
--

CREATE TABLE `gametype` (
  `gameid` int(11) NOT NULL,
  `gamename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `gametype`
--

INSERT INTO `gametype` (`gameid`, `gamename`) VALUES
(1, 'Futsal');

-- --------------------------------------------------------

--
-- Table structure for table `holiday`
--

CREATE TABLE `holiday` (
  `holiday_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(11) NOT NULL,
  `district` varchar(100) NOT NULL,
  `province` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `district`, `province`, `city`) VALUES
(186, 'Colombo District', 'Western Province', 'Colombo 01'),
(187, 'Colombo District', 'Western Province', 'Colombo 02'),
(188, 'Colombo District', 'Western Province', 'Colombo 03'),
(189, 'Colombo District', 'Western Province', 'Colombo 04'),
(190, 'Colombo District', 'Western Province', 'Colombo 05'),
(191, 'Colombo District', 'Western Province', 'Colombo 06'),
(192, 'Colombo District', 'Western Province', 'Colombo 07'),
(193, 'Colombo District', 'Western Province', 'Colombo 08'),
(194, 'Colombo District', 'Western Province', 'Colombo 09'),
(195, 'Colombo District', 'Western Province', 'Colombo 10'),
(196, 'Colombo District', 'Western Province', 'Colombo 11'),
(197, 'Colombo District', 'Western Province', 'Colombo 12'),
(198, 'Colombo District', 'Western Province', 'Colombo 13'),
(199, 'Colombo District', 'Western Province', 'Colombo 14'),
(200, 'Colombo District', 'Western Province', 'Colombo 15'),
(201, 'Colombo District', 'Western Province', 'Dehiwala'),
(202, 'Colombo District', 'Western Province', 'Nugegoda'),
(203, 'Colombo District', 'Western Province', 'Kotte'),
(204, 'Colombo District', 'Western Province', 'Kolonnawa'),
(205, 'Gampaha District', 'Western Province', 'Negombo'),
(206, 'Gampaha District', 'Western Province', 'Gampaha'),
(207, 'Gampaha District', 'Western Province', 'Ja-Ela'),
(208, 'Gampaha District', 'Western Province', 'Wattala'),
(209, 'Gampaha District', 'Western Province', 'Katunayake'),
(210, 'Kalutara District', 'Western Province', 'Kalutara'),
(211, 'Kalutara District', 'Western Province', 'Panadura'),
(212, 'Kalutara District', 'Western Province', 'Beruwala'),
(213, 'Kalutara District', 'Western Province', 'Horana'),
(214, 'Kandy District', 'Central Province', 'Kandy'),
(215, 'Kandy District', 'Central Province', 'Peradeniya'),
(216, 'Kandy District', 'Central Province', 'Gampola'),
(217, 'Kandy District', 'Central Province', 'Ulapana'),
(218, 'Kandy District', 'Central Province', 'Gelioya'),
(219, 'Kandy District', 'Central Province', 'Katugsastota'),
(220, 'Kandy District', 'Central Province', 'Nawalapitiya'),
(221, 'Matale District', 'Central Province', 'Matale'),
(222, 'Matale District', 'Central Province', 'Dambulla'),
(223, 'Nuwara Eliya District', 'Central Province', 'Nuwara Eliya'),
(224, 'Nuwara Eliya District', 'Central Province', 'Hatton'),
(225, 'Nuwara Eliya District', 'Central Province', 'Haputale'),
(226, 'Galle District', 'Southern Province', 'Galle'),
(227, 'Galle District', 'Southern Province', 'Unawatuna'),
(228, 'Matara District', 'Southern Province', 'Matara'),
(229, 'Matara District', 'Southern Province', 'Weligama'),
(230, 'Hambantota District', 'Southern Province', 'Hambantota'),
(231, 'Hambantota District', 'Southern Province', 'Tangalle'),
(232, 'Batticaloa District', 'Eastern Province', 'Batticaloa'),
(233, 'Batticaloa District', 'Eastern Province', 'Kattankudy'),
(234, 'Trincomalee District', 'Eastern Province', 'Trincomalee'),
(235, 'Trincomalee District', 'Eastern Province', 'Kinniya'),
(236, 'Ampara District', 'Eastern Province', 'Ampara'),
(237, 'Ampara District', 'Eastern Province', 'Kalmunai'),
(238, 'Jaffna District', 'Northern Province', 'Jaffna'),
(239, 'Jaffna District', 'Northern Province', 'Chavakachcheri'),
(240, 'Vavuniya District', 'Northern Province', 'Vavuniya'),
(241, 'Mannar District', 'Northern Province', 'Mannar'),
(242, 'Kurunegala District', 'North Western Province', 'Kurunegala'),
(243, 'Puttalam District', 'North Western Province', 'Puttalam'),
(244, 'Puttalam District', 'North Western Province', 'Chilaw'),
(245, 'Anuradhapura District', 'North Central Province', 'Anuradhapura'),
(246, 'Polonnaruwa District', 'North Central Province', 'Polonnaruwa'),
(247, 'Badulla District', 'Uva Province', 'Badulla'),
(248, 'Badulla District', 'Uva Province', 'Bandarawela'),
(249, 'Monaragala District', 'Uva Province', 'Monaragala'),
(250, 'Ratnapura District', 'Sabaragamuwa Province', 'Ratnapura'),
(251, 'Kegalle District', 'Sabaragamuwa Province', 'Kegalle'),
(252, 'Kegalle District', 'Sabaragamuwa Province', 'Mawanella'),
(253, 'Nuwara Eliya District', 'Central Province', 'Hapugastalawa'),
(255, 'Anuradhapura District', 'North Central Province', 'Mihintale'),
(256, 'Nuwara Eliya District', 'Central Province', 'Kotmale'),
(257, 'Kandy District', 'Central Province', 'Pilimathalawa'),
(258, 'Kandy District', 'Central Province', 'Murthagahamula');

-- --------------------------------------------------------

--
-- Table structure for table `pitch`
--

CREATE TABLE `pitch` (
  `pitch_id` int(11) NOT NULL,
  `court_id` int(11) NOT NULL,
  `pitch_name` varchar(255) NOT NULL,
  `opening_time` time NOT NULL,
  `closing_time` time NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `Amenities` varchar(255) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `discount_type` enum('percentage','amount') DEFAULT 'amount',
  `WeekEnd_opentime` time DEFAULT NULL,
  `WeekEnd_closetime` time DEFAULT NULL,
  `stadium_id` int(11) DEFAULT NULL,
  `gametype_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pitch`
--

INSERT INTO `pitch` (`pitch_id`, `court_id`, `pitch_name`, `opening_time`, `closing_time`, `image_path`, `tag`, `Amenities`, `discount`, `discount_type`, `WeekEnd_opentime`, `WeekEnd_closetime`, `stadium_id`, `gametype_id`) VALUES
(1, 1, 'Regular', '00:00:00', '23:00:00', 'uploads/1750265592_canva-green-&-yellow-soccer-ball-soccer-team-logo-cWLplcBwUus.webp', NULL, NULL, NULL, 'amount', '00:00:00', '23:00:00', 2, 1),
(2, 1, 'Futsal Regular', '00:00:00', '23:00:00', 'uploads/1750518315_img_6856ca2b58f1b.jpeg', NULL, NULL, NULL, 'amount', '00:00:00', '23:00:00', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pitch_images`
--

CREATE TABLE `pitch_images` (
  `image_id` int(11) NOT NULL,
  `pitch_id` int(11) NOT NULL,
  `image_url` varchar(500) NOT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `main` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pricing`
--

CREATE TABLE `pricing` (
  `pricing_id` int(11) NOT NULL,
  `pitch_id` int(11) NOT NULL,
  `offpeak_start_time` time NOT NULL,
  `offpeak_end_time` time NOT NULL,
  `peak_rate` decimal(10,2) NOT NULL,
  `offpeak_rate` decimal(10,2) NOT NULL,
  `weekend_peak_rate` decimal(10,2) DEFAULT NULL,
  `weekend_offpeak_rate` decimal(10,2) DEFAULT NULL,
  `holiday_peak_rate` decimal(10,2) DEFAULT NULL,
  `holiday_offpeak_rate` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pricing`
--

INSERT INTO `pricing` (`pricing_id`, `pitch_id`, `offpeak_start_time`, `offpeak_end_time`, `peak_rate`, `offpeak_rate`, `weekend_peak_rate`, `weekend_offpeak_rate`, `holiday_peak_rate`, `holiday_offpeak_rate`) VALUES
(1, 1, '17:00:00', '07:00:00', 2000.00, 1800.00, 2000.00, 1800.00, 2000.00, 1800.00),
(2, 2, '17:00:00', '07:00:00', 2500.00, 2000.00, 2500.00, 2000.00, 2500.00, 2000.00);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `pitch_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `comment` text DEFAULT NULL,
  `review_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `slot_locks`
--

CREATE TABLE `slot_locks` (
  `id` int(11) NOT NULL,
  `slot_id` int(11) NOT NULL,
  `locked_at` datetime NOT NULL,
  `expires_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stadium`
--

CREATE TABLE `stadium` (
  `stadium_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `contact_info` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `image_path` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `discount_type` enum('percentage','amount','none') DEFAULT 'none',
  `status` enum('active','inactive') DEFAULT 'active',
  `door_street` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stadium`
--

INSERT INTO `stadium` (`stadium_id`, `name`, `location`, `contact_info`, `address`, `email_id`, `username`, `password`, `created_at`, `image_path`, `description`, `discount`, `discount_type`, `status`, `door_street`) VALUES
(1, 'Testing', 'Dambulla', '0777533734', 'C85, Hurihela, Dambulla, Matale District, Central Province', 'adabookinglk@gmail.com', 'adabookinglk', 'Test@123', '2025-06-14 09:54:33', NULL, NULL, NULL, 'none', 'active', NULL),
(2, 'Evergreen', 'Ulapana', '0714177336', '33, Main Road, Ulapana, Kandy District, Central Province', 'adabookinglk@gmail.com', 'evergreen', '$2y$10$0prcnTiTqv9W.AqzomZgeeZ7nGOMgCsbbXc5F5w3n9R/Jp8M0dXhy', '2025-06-14 10:34:37', 'uploads\\1745003281_Dp.jpg', NULL, NULL, 'none', 'active', 'uploads\\1745003281_Dp.jpg'),
(3, 'Areo indoor', 'Nawalapitiya', '0777533734', 'jayasundara, Nawalapitiya, Kandy District, Central Province', 'mifasmsgr@yahoo.com', 'aroeIndoor', '$2y$10$/w4vRrw2HhXr93L.7dhEvODo3NY.vxAuzcmi6zh2WfrCd8HQ09ERe', '2025-06-14 11:06:06', NULL, NULL, NULL, 'none', 'inactive', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stadium_images`
--

CREATE TABLE `stadium_images` (
  `image_id` int(11) NOT NULL,
  `stadium_id` int(11) NOT NULL,
  `image_url` varchar(500) NOT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_images`
--

CREATE TABLE `user_images` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `image_name` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `label` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `cus_id` (`cus_id`),
  ADD KEY `pitch_id` (`pitch_id`);

--
-- Indexes for table `court`
--
ALTER TABLE `court`
  ADD PRIMARY KEY (`court_id`),
  ADD KEY `stadium_id` (`stadium_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cus_id`),
  ADD UNIQUE KEY `phone_number` (`phone_number`),
  ADD UNIQUE KEY `NIC` (`NIC`);

--
-- Indexes for table `gametype`
--
ALTER TABLE `gametype`
  ADD PRIMARY KEY (`gameid`);

--
-- Indexes for table `holiday`
--
ALTER TABLE `holiday`
  ADD PRIMARY KEY (`holiday_id`),
  ADD UNIQUE KEY `date` (`date`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pitch`
--
ALTER TABLE `pitch`
  ADD PRIMARY KEY (`pitch_id`),
  ADD KEY `court_id` (`court_id`),
  ADD KEY `fk_stadium_id` (`stadium_id`),
  ADD KEY `fk_gametype_id` (`gametype_id`);

--
-- Indexes for table `pitch_images`
--
ALTER TABLE `pitch_images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `pitch_id` (`pitch_id`);

--
-- Indexes for table `pricing`
--
ALTER TABLE `pricing`
  ADD PRIMARY KEY (`pricing_id`),
  ADD KEY `pitch_id` (`pitch_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `stadium_id` (`pitch_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `slot_locks`
--
ALTER TABLE `slot_locks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slot_id` (`slot_id`);

--
-- Indexes for table `stadium`
--
ALTER TABLE `stadium`
  ADD PRIMARY KEY (`stadium_id`);

--
-- Indexes for table `stadium_images`
--
ALTER TABLE `stadium_images`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `user_images`
--
ALTER TABLE `user_images`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `court`
--
ALTER TABLE `court`
  MODIFY `court_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cus_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gametype`
--
ALTER TABLE `gametype`
  MODIFY `gameid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `holiday`
--
ALTER TABLE `holiday`
  MODIFY `holiday_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pitch`
--
ALTER TABLE `pitch`
  MODIFY `pitch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pitch_images`
--
ALTER TABLE `pitch_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pricing`
--
ALTER TABLE `pricing`
  MODIFY `pricing_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stadium`
--
ALTER TABLE `stadium`
  MODIFY `stadium_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stadium_images`
--
ALTER TABLE `stadium_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `court`
--
ALTER TABLE `court`
  ADD CONSTRAINT `fk_court_stadium` FOREIGN KEY (`stadium_id`) REFERENCES `stadium` (`stadium_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pitch`
--
ALTER TABLE `pitch`
  ADD CONSTRAINT `fk_gametype_id` FOREIGN KEY (`gametype_id`) REFERENCES `gametype` (`gameid`),
  ADD CONSTRAINT `fk_stadium_id` FOREIGN KEY (`stadium_id`) REFERENCES `stadium` (`stadium_id`);

--
-- Constraints for table `pitch_images`
--
ALTER TABLE `pitch_images`
  ADD CONSTRAINT `pitch_images_ibfk_1` FOREIGN KEY (`pitch_id`) REFERENCES `pitch` (`pitch_id`) ON DELETE CASCADE;

--
-- Constraints for table `pricing`
--
ALTER TABLE `pricing`
  ADD CONSTRAINT `fk_pricing_pitch` FOREIGN KEY (`pitch_id`) REFERENCES `pitch` (`pitch_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
