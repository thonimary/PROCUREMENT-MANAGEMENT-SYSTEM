-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2024 at 05:53 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `procurement1`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dept_id` int(11) NOT NULL,
  `dept_name` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) NOT NULL DEFAULT 0,
  `dept_details` varchar(255) NOT NULL,
  `added_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_id`, `dept_name`, `password`, `role`, `dept_details`, `added_at`) VALUES
(1, 'Nairobi Admin', '54321', 1, 'Main stock department in Nairobi', '2024-03-27'),
(2, 'Mombasa Logistics', '9876', 0, 'Logistics and Transport in Mombasa', '2024-04-05'),
(10, 'Kisumu Sales', '54321', 0, 'Sales Department in Kisumu', '2024-04-04'),
(16, 'Eldoret Support', '54321', 0, 'Customer Support in Eldoret', '2024-04-19');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(30) NOT NULL,
  `item_cat` varchar(30) NOT NULL,
  `item_detail` varchar(255) NOT NULL,
  `bill_no` varchar(30) DEFAULT NULL,
  `supplier_id` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL DEFAULT 1,
  `supplied_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_id`, `item_name`, `item_cat`, `item_detail`, `bill_no`, `supplier_id`, `dept_id`, `supplied_at`) VALUES
(465, 'Maize Flour', 'Food', 'Details for Maize Flour', '200', 3, 2, '2024-07-29'),
(466, 'Sorghum', 'Grain', 'Details for Sorghum', '201', 1, 10, '2024-07-29'),
(467, 'Rice', 'Grain', 'Details for Rice', '203', 9, 1, '2024-08-01'),
(468, 'Tea', 'Beverage', 'Details for Tea', '204', 3, 1, '2024-08-01'),
(469, 'Coffee', 'Beverage', 'Details for Coffee', '205', 2, 1, '2024-08-01'),
(470, 'Sugar', 'Food', 'Details for Sugar', '206', 2, 1, '2024-08-01'),
(471, 'Milk', 'Dairy', 'Details for Milk', '207', 6, 1, '2024-08-01'),
(472, 'Butter', 'Dairy', 'Details for Butter', '208', 7, 1, '2024-08-01'),
(473, 'Vegetable Oil', 'Cooking', 'Details for Vegetable Oil', '209', 3, 1, '2024-08-01'),
(474, 'Salt', 'Spice', 'Details for Salt', '210', 5, 1, '2024-08-01'),
(475, 'Pepper', 'Spice', 'Details for Pepper', '211', 4, 1, '2024-08-01'),
(476, 'Honey', 'Sweetener', 'Details for Honey', '212', 6, 1, '2024-08-01');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(30) NOT NULL,
  `supplier_details` varchar(255) NOT NULL,
  `added_at` date NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `supplier_name`, `supplier_details`, `added_at`, `password`) VALUES
(1, 'Kenyatta Supplies', '123 Moi Avenue, Nairobi', '2024-04-12', ''),
(2, 'Mombasa Wholesalers', '456 Mvita Road, Mombasa', '2024-02-01', ''),
(3, 'Kisumu Distributors', '789 Oginga Odinga Street, Kisumu', '2024-01-17', ''),
(4, 'Eldoret Electronics', '101 Kipsigis Road, Eldoret', '2024-12-06', ''),
(5, 'Nakuru Components', '202 Kenyatta Avenue, Nakuru', '2024-12-13', ''),
(6, 'Nyeri Foods', '303 Kimathi Way, Nyeri', '2024-10-18', ''),
(7, 'Thika Suppliers', '404 Juja Road, Thika', '2024-02-07', ''),
(8, 'Nanyuki Collection', '505 Mount Kenya Road, Nanyuki', '2024-03-01', ''),
(9, 'Garissa Pharma', '606 Garissa Road, Garissa', '2024-05-04', ''),
(10, 'Kariuki', ' Kilimajaro,Nairobi', '2024-08-16', ''),
(13, 'mumo', '1209nxnx4x', '2024-08-16', '$2y$10$pBO9pBGuxWhKdbzUFM9sze2BRi5VfOCorwnlNtcmGA49GbAIpWkvC'),
(15, 'wanda', '1imiinii', '2024-08-19', '$2y$10$ppbNWB0X2jgCzO3Iskm8du3CT/z/x5FLNGApWgBTKEoT4T7lDTaS6');

-- --------------------------------------------------------

--
-- Table structure for table `tenders`
--

CREATE TABLE `tenders` (
  `tender_id` int(11) NOT NULL,
  `tender_name` varchar(255) NOT NULL,
  `tender_description` text NOT NULL,
  `opening_date` date NOT NULL,
  `closing_date` date NOT NULL,
  `status` enum('open','closed') NOT NULL DEFAULT 'open',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tenders`
--

INSERT INTO `tenders` (`tender_id`, `tender_name`, `tender_description`, `opening_date`, `closing_date`, `status`, `created_at`) VALUES
(1, 'Supply of Laptops and Tablets', 'Supply and delivery of laptops and tablets for digital literacy programs in primary schools.', '2024-08-01', '2024-09-01', 'open', '2024-08-16 02:21:43'),
(2, 'Construction of Classrooms', 'Construction of additional classrooms in selected secondary schools across the country.', '2024-08-05', '2024-09-05', 'open', '2024-08-16 02:21:43'),
(3, 'Agricultural Fertilizers Supply', 'Supply and distribution of agricultural fertilizers to farmers in Rift Valley region.', '2024-08-10', '2024-09-10', 'open', '2024-08-16 02:21:43'),
(4, 'Solar Power Installation', 'Installation of solar power systems in off-grid areas in Turkana County.', '2024-08-15', '2024-09-15', 'open', '2024-08-16 02:21:43'),
(5, 'ICT Equipment Supply', 'Supply of ICT equipment for county offices in Kiambu County.', '2024-08-20', '2024-09-20', 'open', '2024-08-16 02:21:43'),
(6, 'Healthcare Workers Training', 'Training of healthcare workers on emergency response in Nairobi County.', '2024-08-25', '2024-09-25', 'open', '2024-08-16 02:21:43'),
(7, 'Road Maintenance in Mombasa', 'Routine maintenance of roads in Mombasa County.', '2024-08-30', '2024-09-30', 'open', '2024-08-16 02:21:43'),
(8, 'Procurement of School Buses', 'Procurement of school buses for public secondary schools in Nyeri County.', '2024-09-01', '2024-10-01', 'open', '2024-08-16 02:21:43'),
(9, 'Water Supply Project', 'Expansion of water supply systems in Kisumu County.', '2024-09-05', '2024-10-05', 'open', '2024-08-16 02:21:43'),
(10, 'Construction of Health Centres', 'Construction of health centres in rural areas of Machakos County.', '2024-09-10', '2024-10-10', 'open', '2024-08-16 02:21:43'),
(11, 'Supply of Hospital Beds', 'Supply of hospital beds and mattresses for county hospitals.', '2024-09-15', '2024-10-15', 'open', '2024-08-16 02:21:43'),
(12, 'Provision of Sanitation Services', 'Provision of sanitation services in urban areas of Nakuru County.', '2024-09-20', '2024-10-20', 'open', '2024-08-16 02:21:43'),
(13, 'Supply of Laboratory Equipment', 'Supply of laboratory equipment for public health facilities in Uasin Gishu County.', '2024-09-25', '2024-10-25', 'open', '2024-08-16 02:21:43'),
(14, 'Construction of Bridges', 'Construction of bridges in flood-prone areas in Western Kenya.', '2024-09-30', '2024-10-30', 'open', '2024-08-16 02:21:43'),
(15, 'Rehabilitation of Markets', 'Rehabilitation and modernization of open-air markets in Meru County.', '2024-10-01', '2024-11-01', 'open', '2024-08-16 02:21:43'),
(16, 'Procurement of Office Furniture', 'Supply of office furniture for new government offices in Nairobi CBD.', '2024-10-05', '2024-11-05', 'open', '2024-08-16 02:21:43'),
(17, 'Waste Management Services', 'Provision of waste management services in Kisii County.', '2024-10-10', '2024-11-10', 'open', '2024-08-16 02:21:43'),
(18, 'Supply of Irrigation Equipment', 'Supply of irrigation equipment to farmers in Eastern Kenya.', '2024-10-15', '2024-11-15', 'open', '2024-08-16 02:21:43'),
(19, 'Construction of Public Toilets', 'Construction of public toilets in urban areas of Eldoret.', '2024-10-20', '2024-11-20', 'open', '2024-08-16 02:21:43'),
(20, 'Provision of Legal Services', 'Provision of legal services for county governments in Central Kenya.', '2024-10-25', '2024-11-25', 'open', '2024-08-16 02:21:43'),
(21, 'Supply of Teaching Materials', 'Supply of teaching materials for primary schools in Garissa County.', '2024-10-30', '2024-11-30', 'open', '2024-08-16 02:21:43'),
(22, 'Street Lighting Project', 'Installation of street lights in residential areas of Kakamega County.', '2024-11-01', '2024-12-01', 'open', '2024-08-16 02:21:43'),
(23, 'Supply of Medical Drugs', 'Supply of essential medical drugs to dispensaries in Isiolo County.', '2024-11-05', '2024-12-05', 'open', '2024-08-16 02:21:43'),
(24, 'ICT Infrastructure Upgrade', 'Upgrade of ICT infrastructure for county governments in the Coast region.', '2024-11-10', '2024-12-10', 'open', '2024-08-16 02:21:43'),
(25, 'Construction of Footbridges', 'Construction of footbridges over rivers in rural areas of Nyanza.', '2024-11-15', '2024-12-15', 'open', '2024-08-16 02:21:43'),
(26, 'Provision of Security Services', 'Provision of security services for government buildings in Nairobi.', '2024-11-20', '2024-12-20', 'open', '2024-08-16 02:21:43'),
(27, 'Supply of Seeds and Seedlings', 'Supply of certified seeds and seedlings to farmers in Nyandarua County.', '2024-11-25', '2024-12-25', 'open', '2024-08-16 02:21:43'),
(28, 'Construction of Sports Facilities', 'Construction of sports facilities in secondary schools in Laikipia County.', '2024-12-01', '2025-01-01', 'open', '2024-08-16 02:21:43'),
(29, 'Provision of Catering Services', 'Provision of catering services for government meetings and events in Nairobi.', '2024-12-05', '2025-01-05', 'open', '2024-08-16 02:21:43'),
(30, 'Installation of CCTV Systems', 'Installation of CCTV surveillance systems in public spaces in Nairobi CBD.', '2024-12-10', '2025-01-10', 'open', '2024-08-16 02:21:43'),
(31, 'Supply of Office Stationery', 'Supply of office stationery for government offices in Kitui County.', '2024-12-15', '2025-01-15', 'open', '2024-08-16 02:21:43'),
(32, 'Construction of Boreholes', 'Drilling and construction of boreholes in drought-prone areas in Baringo County.', '2024-12-20', '2025-01-20', 'open', '2024-08-16 02:21:43'),
(33, 'Supply of Textbooks', 'Supply of textbooks for public schools in Kwale County.', '2025-01-01', '2025-02-01', 'open', '2024-08-16 02:21:43'),
(34, 'Road Rehabilitation in Kajiado', 'Rehabilitation of roads damaged by floods in Kajiado County.', '2025-01-05', '2025-02-05', 'open', '2024-08-16 02:21:43'),
(35, 'Construction of Drainage Systems', 'Construction of drainage systems in flood-prone areas of Kisumu County.', '2025-01-10', '2025-02-10', 'open', '2024-08-16 02:21:43'),
(36, 'Supply of Police Uniforms', 'Supply of uniforms for the National Police Service.', '2025-01-15', '2025-02-15', 'open', '2024-08-16 02:21:43'),
(37, 'Upgrading of Public Parks', 'Upgrading of public parks and recreational facilities in Nairobi.', '2025-01-20', '2025-02-20', 'open', '2024-08-16 02:21:43'),
(38, 'Supply of Firefighting Equipment', 'Supply of firefighting equipment for county governments.', '2025-01-25', '2025-02-25', 'open', '2024-08-16 02:21:43'),
(39, 'Provision of Transport Services', 'Provision of transport services for government staff in Taita Taveta County.', '2025-02-01', '2025-03-01', 'open', '2024-08-16 02:21:43'),
(40, 'Construction of Low-Cost Housing', 'Construction of low-cost housing units in urban areas of Nairobi.', '2025-02-05', '2025-03-05', 'open', '2024-08-16 02:21:43'),
(41, 'Supply of Medical Supplies', 'Supply of medical supplies for maternity hospitals in Kilifi County.', '2025-02-10', '2025-03-10', 'open', '2024-08-16 02:21:43'),
(42, 'Public Awareness Campaigns', 'Conducting public awareness campaigns on health and sanitation in Kakamega County.', '2025-02-15', '2025-03-15', 'open', '2024-08-16 02:21:43'),
(43, 'Road Expansion Project', 'Expansion of major roads in Nakuru County.', '2025-02-20', '2025-03-20', 'open', '2024-08-16 02:21:43'),
(44, 'Supply of Educational Software', 'Supply of educational software for use in public secondary schools.', '2025-02-25', '2025-03-25', 'open', '2024-08-16 02:21:43'),
(45, 'Maintenance of Government Vehicles', 'Maintenance services for government vehicles in Embu County.', '2025-03-01', '2025-04-01', 'open', '2024-08-16 02:21:43'),
(46, 'Water Treatment Plant Construction', 'Construction of water treatment plants in Nyeri County.', '2025-03-05', '2025-04-05', 'open', '2024-08-16 02:21:43'),
(47, 'Supply of Agricultural Machinery', 'Supply of agricultural machinery to cooperatives in Kirinyaga County.', '2025-03-10', '2025-04-10', 'open', '2024-08-16 02:21:43');

-- --------------------------------------------------------

--
-- Table structure for table `tender_applications`
--

CREATE TABLE `tender_applications` (
  `application_id` int(11) NOT NULL,
  `tender_id` int(11) NOT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `supplier_email` varchar(255) NOT NULL,
  `proposal` text NOT NULL,
  `applied_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tender_applications`
--

INSERT INTO `tender_applications` (`application_id`, `tender_id`, `supplier_name`, `supplier_email`, `proposal`, `applied_at`) VALUES
(1, 2, 'Kariuki', 'testing@gmail.com', 'ufufug', '2024-08-19 03:22:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dept_id`),
  ADD UNIQUE KEY `dept_name` (`dept_name`),
  ADD KEY `dept_name_2` (`dept_name`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `item_cat` (`item_cat`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `supplier_id_2` (`supplier_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`),
  ADD UNIQUE KEY `supplier_name` (`supplier_name`);

--
-- Indexes for table `tenders`
--
ALTER TABLE `tenders`
  ADD PRIMARY KEY (`tender_id`);

--
-- Indexes for table `tender_applications`
--
ALTER TABLE `tender_applications`
  ADD PRIMARY KEY (`application_id`),
  ADD KEY `tender_id` (`tender_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `dept_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=477;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tenders`
--
ALTER TABLE `tenders`
  MODIFY `tender_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `tender_applications`
--
ALTER TABLE `tender_applications`
  MODIFY `application_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `item_ibfk_2` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`) ON UPDATE CASCADE;

--
-- Constraints for table `tender_applications`
--
ALTER TABLE `tender_applications`
  ADD CONSTRAINT `tender_applications_ibfk_1` FOREIGN KEY (`tender_id`) REFERENCES `tenders` (`tender_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
