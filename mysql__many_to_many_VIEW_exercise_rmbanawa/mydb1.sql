-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 31, 2019 at 02:06 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb1`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int(20) NOT NULL,
  `client_fname` varchar(20) DEFAULT NULL,
  `client_lname` varchar(20) DEFAULT NULL,
  `client_address` varchar(20) DEFAULT NULL,
  `client_number` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `client_fname`, `client_lname`, `client_address`, `client_number`) VALUES
(1, 'Rovic', 'Banawa', 'Quezon City', 1232321666),
(2, 'Anzel', 'Tolentino', 'Quezon City', 1232321333),
(3, 'Patrick', 'Rosales', 'Makati City', 1232321321),
(4, 'Abdul', 'Junior', 'Paranaque City', 1232321355);

-- --------------------------------------------------------

--
-- Table structure for table `shipment`
--

CREATE TABLE `shipment` (
  `id` int(20) NOT NULL,
  `client_id` int(20) NOT NULL,
  `shipper_id` int(20) NOT NULL,
  `shipment_type` varchar(45) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shipment`
--

INSERT INTO `shipment` (`id`, `client_id`, `shipper_id`, `shipment_type`, `delivery_date`) VALUES
(1, 4, 3, 'LBC', '2019-11-15'),
(2, 2, 1, 'Pickup', '2019-11-21');

-- --------------------------------------------------------

--
-- Stand-in structure for view `shipment_view`
-- (See below for the actual view)
--
CREATE TABLE `shipment_view` (
`client_fname` varchar(20)
,`client_lname` varchar(20)
,`shipper_lname` varchar(20)
,`shipper_fname` varchar(20)
,`shipment_type` varchar(45)
,`delivery_date` date
);

-- --------------------------------------------------------

--
-- Table structure for table `shipper`
--

CREATE TABLE `shipper` (
  `id` int(20) NOT NULL,
  `shipper_lname` varchar(20) DEFAULT NULL,
  `shipper_fname` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shipper`
--

INSERT INTO `shipper` (`id`, `shipper_lname`, `shipper_fname`) VALUES
(1, 'Master', 'Sau'),
(2, 'Marvin', 'Lactaowen'),
(3, 'Wong', 'Doraemon');

-- --------------------------------------------------------

--
-- Structure for view `shipment_view`
--
DROP TABLE IF EXISTS `shipment_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `shipment_view`  AS  select `client`.`client_fname` AS `client_fname`,`client`.`client_lname` AS `client_lname`,`shipper`.`shipper_lname` AS `shipper_lname`,`shipper`.`shipper_fname` AS `shipper_fname`,`shipment`.`shipment_type` AS `shipment_type`,`shipment`.`delivery_date` AS `delivery_date` from ((`client` join `shipment` on((`client`.`id` = `shipment`.`id`))) join `shipper` on((`shipper`.`id` = `shipment`.`id`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipment`
--
ALTER TABLE `shipment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_client_has_shipper_shipper1_idx` (`shipper_id`),
  ADD KEY `fk_client_has_shipper_client_idx` (`client_id`);

--
-- Indexes for table `shipper`
--
ALTER TABLE `shipper`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `shipment`
--
ALTER TABLE `shipment`
  ADD CONSTRAINT `fk_client_has_shipper_client` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_client_has_shipper_shipper1` FOREIGN KEY (`shipper_id`) REFERENCES `shipper` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
