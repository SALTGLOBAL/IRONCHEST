-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 31, 2017 at 12:33 PM
-- Server version: 10.1.20-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id1826599_admin`
--
CREATE DATABASE IF NOT EXISTS `id1826599_admin` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `id1826599_admin`;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(2) NOT NULL,
  `name` varchar(20) NOT NULL,
  `phone` int(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `admin` int(1) NOT NULL,
  `comment` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `phone`, `email`, `admin`, `comment`) VALUES
(1, 'Mr David', 412345678, 'mrdavid@gmail.com', 1, 'He is the owner of the business'),
(2, 'Saruman White', 423456789, 'sarumanwhite@gmail.com', 0, 'Senior Property Manager'),
(3, 'Radagast Brown', 434567890, 'radagastbrown@gmail.com', 0, 'Property Manager'),
(4, 'Romestamo Blue', 445678901, 'romestamoblue@gmail.com', 0, 'Property Manager'),
(5, 'Morinehtar Blue', 456789012, 'morinehtarblue@gmail.com', 0, 'Property Manager'),
(6, 'Gandalf Grey', 467890123, 'gandalfgrey', 0, 'Intern');

-- --------------------------------------------------------

--
-- Table structure for table `enquiries`
--

CREATE TABLE `enquiries` (
  `id` int(10) NOT NULL,
  `type` varchar(20) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `property_id` int(10) NOT NULL,
  `message` varchar(500) NOT NULL,
  `response` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enquiries`
--

INSERT INTO `enquiries` (`id`, `type`, `user_name`, `property_id`, `message`, `response`) VALUES
(2, 'inspection', 'Jungwoo Lee', 4, '2321321', NULL),
(3, 'enquiry', 'new', 4, 'hello', NULL),
(4, 'maintenance', 'new', 7, '', NULL),
(5, 'inspection', 'dddd', 3, 'heyf', 'sdfghgfdfg');

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` int(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `suburb` varchar(20) NOT NULL,
  `postcode` int(4) NOT NULL,
  `bedrooms` int(1) NOT NULL,
  `bathrooms` int(1) NOT NULL,
  `parking_spaces` int(1) NOT NULL,
  `property_type` varchar(10) NOT NULL,
  `pet` int(1) NOT NULL,
  `furnishing` int(1) NOT NULL,
  `owner_name` varchar(20) NOT NULL,
  `manager_name` varchar(20) NOT NULL,
  `price` int(10) NOT NULL,
  `date_available` date NOT NULL,
  `occupied` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `address`, `suburb`, `postcode`, `bedrooms`, `bathrooms`, `parking_spaces`, `property_type`, `pet`, `furnishing`, `owner_name`, `manager_name`, `price`, `date_available`, `occupied`) VALUES
(1, '19 Lake Borumba Street', 'Logan Reserve', 4133, 4, 1, 1, 'House', 1, 0, 'Frodo baggins', 'Saruman White', 345, '2017-05-24', 0),
(2, '7 Gloucester St', 'Waterford', 4133, 4, 2, 2, 'House', 1, 0, 'Samwise Gamgee', 'Gandalf Grey', 410, '2017-06-30', 1),
(3, '59 Harburg Drive', 'Beenleigh', 4207, 3, 1, 2, 'House', 1, 0, 'Meriadoc Brandybuck', 'Radagast Brown', 350, '2017-05-24', 0),
(4, '48 Utrecht St', 'Cornubia', 4130, 4, 2, 2, 'House', 0, 1, 'Peregrin Took', 'Romestamo Blue', 530, '2017-05-30', 0),
(5, '1 Justin Place', 'Crestmead', 4132, 4, 2, 2, 'House', 0, 1, 'Aragorn', 'Morinehtar Blue', 430, '2017-05-24', 0),
(6, '18 Kilby Street', 'Crestmead', 4132, 3, 1, 1, 'House', 1, 0, 'Boromir', 'Saruman White', 350, '2017-06-14', 0),
(7, '36/9 Elma St', 'Salisbury', 4107, 4, 3, 1, 'Townhouse', 0, 0, 'Legolas Greenleaf', 'Gandalf Grey', 500, '2017-05-24', 0),
(8, '61/8 Briggs Road', 'Springwood', 4127, 2, 1, 1, 'Townhouse', 0, 0, 'Gimli', 'Radagast Brown', 330, '2017-05-24', 0),
(9, '2/93 Raff Avenue', 'Holland Park', 4121, 1, 1, 1, 'Unit', 1, 0, 'Matthew Dickinson', 'Romestamo Blue', 275, '2017-05-31', 0),
(10, '22 Long Island Drive', 'Windaroo', 4207, 4, 2, 2, 'House', 1, 1, 'Kylie Salter', 'Morinehtar Blue', 560, '2017-05-24', 0);

-- --------------------------------------------------------

--
-- Table structure for table `saved_properties`
--

CREATE TABLE `saved_properties` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `property_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `saved_properties`
--

INSERT INTO `saved_properties` (`id`, `user_id`, `property_id`) VALUES
(11, 9, 1),
(15, 6, 10),
(25, 10, 4),
(26, 10, 3),
(27, 13, 4),
(30, 14, 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `address`, `type`) VALUES
(6, 'Jungwoo Lee', 'pptppt2004@naver.com', '81dc9bdb52d04dc20036dbd8313ed055', '1234', 'admin'),
(7, 'Tauroa', 'tauroalesueur@hotmail.com', 'b74012a0fbca4af4bd29f73af7c0fffb', '45 fleet drive, redcliffe', 'user'),
(8, '33333', '1234@ff.com', '81dc9bdb52d04dc20036dbd8313ed055', '1234', 'user'),
(9, 'Tauroa', 'tauroa@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'hfjfjfj', 'user'),
(10, 'Jungwoo2', 'tenant@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'ha', 'tenant'),
(11, 'Saruman White', 'saruman@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'Isengard', 'employee'),
(12, 'jungwoo3', 'user@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'sss', 'user'),
(13, 'new', 'new@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '1234', 'user'),
(14, 'dddd', '1234@sd.com', '81dc9bdb52d04dc20036dbd8313ed055', '1234', 'user'),
(15, 'wert', '1234', '81dc9bdb52d04dc20036dbd8313ed055', '1234', 'user'),
(16, 'Tee', 'Lesueur', '202cb962ac59075b964b07152d234b70', '1234', 'user'),
(17, 'Tee', 'Teelesueur@gmail.com', '202cb962ac59075b964b07152d234b70', '123', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiries`
--
ALTER TABLE `enquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `saved_properties`
--
ALTER TABLE `saved_properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `enquiries`
--
ALTER TABLE `enquiries`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `saved_properties`
--
ALTER TABLE `saved_properties`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;--
-- Database: `id1826599_admin`
--
CREATE DATABASE IF NOT EXISTS `id1826599_admin` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `id1826599_admin`;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(2) NOT NULL,
  `name` varchar(20) NOT NULL,
  `phone` int(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `admin` int(1) NOT NULL,
  `comment` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `phone`, `email`, `admin`, `comment`) VALUES
(1, 'Mr David', 412345678, 'mrdavid@gmail.com', 1, 'He is the owner of the business'),
(2, 'Saruman White', 423456789, 'sarumanwhite@gmail.com', 0, 'Senior Property Manager'),
(3, 'Radagast Brown', 434567890, 'radagastbrown@gmail.com', 0, 'Property Manager'),
(4, 'Romestamo Blue', 445678901, 'romestamoblue@gmail.com', 0, 'Property Manager'),
(5, 'Morinehtar Blue', 456789012, 'morinehtarblue@gmail.com', 0, 'Property Manager'),
(6, 'Gandalf Grey', 467890123, 'gandalfgrey', 0, 'Intern');

-- --------------------------------------------------------

--
-- Table structure for table `enquiries`
--

CREATE TABLE `enquiries` (
  `id` int(10) NOT NULL,
  `type` varchar(20) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `property_id` int(10) NOT NULL,
  `message` varchar(500) NOT NULL,
  `response` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enquiries`
--

INSERT INTO `enquiries` (`id`, `type`, `user_name`, `property_id`, `message`, `response`) VALUES
(2, 'inspection', 'Jungwoo Lee', 4, '2321321', NULL),
(3, 'enquiry', 'new', 4, 'hello', NULL),
(4, 'maintenance', 'new', 7, '', NULL),
(5, 'inspection', 'dddd', 3, 'heyf', 'sdfghgfdfg');

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` int(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `suburb` varchar(20) NOT NULL,
  `postcode` int(4) NOT NULL,
  `bedrooms` int(1) NOT NULL,
  `bathrooms` int(1) NOT NULL,
  `parking_spaces` int(1) NOT NULL,
  `property_type` varchar(10) NOT NULL,
  `pet` int(1) NOT NULL,
  `furnishing` int(1) NOT NULL,
  `owner_name` varchar(20) NOT NULL,
  `manager_name` varchar(20) NOT NULL,
  `price` int(10) NOT NULL,
  `date_available` date NOT NULL,
  `occupied` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `address`, `suburb`, `postcode`, `bedrooms`, `bathrooms`, `parking_spaces`, `property_type`, `pet`, `furnishing`, `owner_name`, `manager_name`, `price`, `date_available`, `occupied`) VALUES
(1, '19 Lake Borumba Street', 'Logan Reserve', 4133, 4, 1, 1, 'House', 1, 0, 'Frodo baggins', 'Saruman White', 345, '2017-05-24', 0),
(2, '7 Gloucester St', 'Waterford', 4133, 4, 2, 2, 'House', 1, 0, 'Samwise Gamgee', 'Gandalf Grey', 410, '2017-06-30', 1),
(3, '59 Harburg Drive', 'Beenleigh', 4207, 3, 1, 2, 'House', 1, 0, 'Meriadoc Brandybuck', 'Radagast Brown', 350, '2017-05-24', 0),
(4, '48 Utrecht St', 'Cornubia', 4130, 4, 2, 2, 'House', 0, 1, 'Peregrin Took', 'Romestamo Blue', 530, '2017-05-30', 0),
(5, '1 Justin Place', 'Crestmead', 4132, 4, 2, 2, 'House', 0, 1, 'Aragorn', 'Morinehtar Blue', 430, '2017-05-24', 0),
(6, '18 Kilby Street', 'Crestmead', 4132, 3, 1, 1, 'House', 1, 0, 'Boromir', 'Saruman White', 350, '2017-06-14', 0),
(7, '36/9 Elma St', 'Salisbury', 4107, 4, 3, 1, 'Townhouse', 0, 0, 'Legolas Greenleaf', 'Gandalf Grey', 500, '2017-05-24', 0),
(8, '61/8 Briggs Road', 'Springwood', 4127, 2, 1, 1, 'Townhouse', 0, 0, 'Gimli', 'Radagast Brown', 330, '2017-05-24', 0),
(9, '2/93 Raff Avenue', 'Holland Park', 4121, 1, 1, 1, 'Unit', 1, 0, 'Matthew Dickinson', 'Romestamo Blue', 275, '2017-05-31', 0),
(10, '22 Long Island Drive', 'Windaroo', 4207, 4, 2, 2, 'House', 1, 1, 'Kylie Salter', 'Morinehtar Blue', 560, '2017-05-24', 0);

-- --------------------------------------------------------

--
-- Table structure for table `saved_properties`
--

CREATE TABLE `saved_properties` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `property_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `saved_properties`
--

INSERT INTO `saved_properties` (`id`, `user_id`, `property_id`) VALUES
(11, 9, 1),
(15, 6, 10),
(25, 10, 4),
(26, 10, 3),
(27, 13, 4),
(30, 14, 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `address`, `type`) VALUES
(6, 'Jungwoo Lee', 'pptppt2004@naver.com', '81dc9bdb52d04dc20036dbd8313ed055', '1234', 'admin'),
(7, 'Tauroa', 'tauroalesueur@hotmail.com', 'b74012a0fbca4af4bd29f73af7c0fffb', '45 fleet drive, redcliffe', 'user'),
(8, '33333', '1234@ff.com', '81dc9bdb52d04dc20036dbd8313ed055', '1234', 'user'),
(9, 'Tauroa', 'tauroa@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'hfjfjfj', 'user'),
(10, 'Jungwoo2', 'tenant@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'ha', 'tenant'),
(11, 'Saruman White', 'saruman@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'Isengard', 'employee'),
(12, 'jungwoo3', 'user@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'sss', 'user'),
(13, 'new', 'new@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '1234', 'user'),
(14, 'dddd', '1234@sd.com', '81dc9bdb52d04dc20036dbd8313ed055', '1234', 'user'),
(15, 'wert', '1234', '81dc9bdb52d04dc20036dbd8313ed055', '1234', 'user'),
(16, 'Tee', 'Lesueur', '202cb962ac59075b964b07152d234b70', '1234', 'user'),
(17, 'Tee', 'Teelesueur@gmail.com', '202cb962ac59075b964b07152d234b70', '123', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiries`
--
ALTER TABLE `enquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `saved_properties`
--
ALTER TABLE `saved_properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `enquiries`
--
ALTER TABLE `enquiries`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `saved_properties`
--
ALTER TABLE `saved_properties`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;--
-- Database: `id1826599_admin`
--
CREATE DATABASE IF NOT EXISTS `id1826599_admin` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `id1826599_admin`;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(2) NOT NULL,
  `name` varchar(20) NOT NULL,
  `phone` int(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `admin` int(1) NOT NULL,
  `comment` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `phone`, `email`, `admin`, `comment`) VALUES
(1, 'Mr David', 412345678, 'mrdavid@gmail.com', 1, 'He is the owner of the business'),
(2, 'Saruman White', 423456789, 'sarumanwhite@gmail.com', 0, 'Senior Property Manager'),
(3, 'Radagast Brown', 434567890, 'radagastbrown@gmail.com', 0, 'Property Manager'),
(4, 'Romestamo Blue', 445678901, 'romestamoblue@gmail.com', 0, 'Property Manager'),
(5, 'Morinehtar Blue', 456789012, 'morinehtarblue@gmail.com', 0, 'Property Manager'),
(6, 'Gandalf Grey', 467890123, 'gandalfgrey', 0, 'Intern');

-- --------------------------------------------------------

--
-- Table structure for table `enquiries`
--

CREATE TABLE `enquiries` (
  `id` int(10) NOT NULL,
  `type` varchar(20) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `property_id` int(10) NOT NULL,
  `message` varchar(500) NOT NULL,
  `response` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enquiries`
--

INSERT INTO `enquiries` (`id`, `type`, `user_name`, `property_id`, `message`, `response`) VALUES
(2, 'inspection', 'Jungwoo Lee', 4, '2321321', NULL),
(3, 'enquiry', 'new', 4, 'hello', NULL),
(4, 'maintenance', 'new', 7, '', NULL),
(5, 'inspection', 'dddd', 3, 'heyf', 'sdfghgfdfg');

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` int(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `suburb` varchar(20) NOT NULL,
  `postcode` int(4) NOT NULL,
  `bedrooms` int(1) NOT NULL,
  `bathrooms` int(1) NOT NULL,
  `parking_spaces` int(1) NOT NULL,
  `property_type` varchar(10) NOT NULL,
  `pet` int(1) NOT NULL,
  `furnishing` int(1) NOT NULL,
  `owner_name` varchar(20) NOT NULL,
  `manager_name` varchar(20) NOT NULL,
  `price` int(10) NOT NULL,
  `date_available` date NOT NULL,
  `occupied` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `address`, `suburb`, `postcode`, `bedrooms`, `bathrooms`, `parking_spaces`, `property_type`, `pet`, `furnishing`, `owner_name`, `manager_name`, `price`, `date_available`, `occupied`) VALUES
(1, '19 Lake Borumba Street', 'Logan Reserve', 4133, 4, 1, 1, 'House', 1, 0, 'Frodo baggins', 'Saruman White', 345, '2017-05-24', 0),
(2, '7 Gloucester St', 'Waterford', 4133, 4, 2, 2, 'House', 1, 0, 'Samwise Gamgee', 'Gandalf Grey', 410, '2017-06-30', 1),
(3, '59 Harburg Drive', 'Beenleigh', 4207, 3, 1, 2, 'House', 1, 0, 'Meriadoc Brandybuck', 'Radagast Brown', 350, '2017-05-24', 0),
(4, '48 Utrecht St', 'Cornubia', 4130, 4, 2, 2, 'House', 0, 1, 'Peregrin Took', 'Romestamo Blue', 530, '2017-05-30', 0),
(5, '1 Justin Place', 'Crestmead', 4132, 4, 2, 2, 'House', 0, 1, 'Aragorn', 'Morinehtar Blue', 430, '2017-05-24', 0),
(6, '18 Kilby Street', 'Crestmead', 4132, 3, 1, 1, 'House', 1, 0, 'Boromir', 'Saruman White', 350, '2017-06-14', 0),
(7, '36/9 Elma St', 'Salisbury', 4107, 4, 3, 1, 'Townhouse', 0, 0, 'Legolas Greenleaf', 'Gandalf Grey', 500, '2017-05-24', 0),
(8, '61/8 Briggs Road', 'Springwood', 4127, 2, 1, 1, 'Townhouse', 0, 0, 'Gimli', 'Radagast Brown', 330, '2017-05-24', 0),
(9, '2/93 Raff Avenue', 'Holland Park', 4121, 1, 1, 1, 'Unit', 1, 0, 'Matthew Dickinson', 'Romestamo Blue', 275, '2017-05-31', 0),
(10, '22 Long Island Drive', 'Windaroo', 4207, 4, 2, 2, 'House', 1, 1, 'Kylie Salter', 'Morinehtar Blue', 560, '2017-05-24', 0);

-- --------------------------------------------------------

--
-- Table structure for table `saved_properties`
--

CREATE TABLE `saved_properties` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `property_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `saved_properties`
--

INSERT INTO `saved_properties` (`id`, `user_id`, `property_id`) VALUES
(11, 9, 1),
(15, 6, 10),
(25, 10, 4),
(26, 10, 3),
(27, 13, 4),
(30, 14, 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `address`, `type`) VALUES
(6, 'Jungwoo Lee', 'pptppt2004@naver.com', '81dc9bdb52d04dc20036dbd8313ed055', '1234', 'admin'),
(7, 'Tauroa', 'tauroalesueur@hotmail.com', 'b74012a0fbca4af4bd29f73af7c0fffb', '45 fleet drive, redcliffe', 'user'),
(8, '33333', '1234@ff.com', '81dc9bdb52d04dc20036dbd8313ed055', '1234', 'user'),
(9, 'Tauroa', 'tauroa@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'hfjfjfj', 'user'),
(10, 'Jungwoo2', 'tenant@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'ha', 'tenant'),
(11, 'Saruman White', 'saruman@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'Isengard', 'employee'),
(12, 'jungwoo3', 'user@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'sss', 'user'),
(13, 'new', 'new@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '1234', 'user'),
(14, 'dddd', '1234@sd.com', '81dc9bdb52d04dc20036dbd8313ed055', '1234', 'user'),
(15, 'wert', '1234', '81dc9bdb52d04dc20036dbd8313ed055', '1234', 'user'),
(16, 'Tee', 'Lesueur', '202cb962ac59075b964b07152d234b70', '1234', 'user'),
(17, 'Tee', 'Teelesueur@gmail.com', '202cb962ac59075b964b07152d234b70', '123', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiries`
--
ALTER TABLE `enquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `saved_properties`
--
ALTER TABLE `saved_properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `enquiries`
--
ALTER TABLE `enquiries`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `saved_properties`
--
ALTER TABLE `saved_properties`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;--
-- Database: `id1826599_admin`
--
CREATE DATABASE IF NOT EXISTS `id1826599_admin` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `id1826599_admin`;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(2) NOT NULL,
  `name` varchar(20) NOT NULL,
  `phone` int(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `admin` int(1) NOT NULL,
  `comment` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `phone`, `email`, `admin`, `comment`) VALUES
(1, 'Mr David', 412345678, 'mrdavid@gmail.com', 1, 'He is the owner of the business'),
(2, 'Saruman White', 423456789, 'sarumanwhite@gmail.com', 0, 'Senior Property Manager'),
(3, 'Radagast Brown', 434567890, 'radagastbrown@gmail.com', 0, 'Property Manager'),
(4, 'Romestamo Blue', 445678901, 'romestamoblue@gmail.com', 0, 'Property Manager'),
(5, 'Morinehtar Blue', 456789012, 'morinehtarblue@gmail.com', 0, 'Property Manager'),
(6, 'Gandalf Grey', 467890123, 'gandalfgrey', 0, 'Intern');

-- --------------------------------------------------------

--
-- Table structure for table `enquiries`
--

CREATE TABLE `enquiries` (
  `id` int(10) NOT NULL,
  `type` varchar(20) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `property_id` int(10) NOT NULL,
  `message` varchar(500) NOT NULL,
  `response` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enquiries`
--

INSERT INTO `enquiries` (`id`, `type`, `user_name`, `property_id`, `message`, `response`) VALUES
(2, 'inspection', 'Jungwoo Lee', 4, '2321321', NULL),
(3, 'enquiry', 'new', 4, 'hello', NULL),
(4, 'maintenance', 'new', 7, '', NULL),
(5, 'inspection', 'dddd', 3, 'heyf', 'sdfghgfdfg');

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` int(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `suburb` varchar(20) NOT NULL,
  `postcode` int(4) NOT NULL,
  `bedrooms` int(1) NOT NULL,
  `bathrooms` int(1) NOT NULL,
  `parking_spaces` int(1) NOT NULL,
  `property_type` varchar(10) NOT NULL,
  `pet` int(1) NOT NULL,
  `furnishing` int(1) NOT NULL,
  `owner_name` varchar(20) NOT NULL,
  `manager_name` varchar(20) NOT NULL,
  `price` int(10) NOT NULL,
  `date_available` date NOT NULL,
  `occupied` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `address`, `suburb`, `postcode`, `bedrooms`, `bathrooms`, `parking_spaces`, `property_type`, `pet`, `furnishing`, `owner_name`, `manager_name`, `price`, `date_available`, `occupied`) VALUES
(1, '19 Lake Borumba Street', 'Logan Reserve', 4133, 4, 1, 1, 'House', 1, 0, 'Frodo baggins', 'Saruman White', 345, '2017-05-24', 0),
(2, '7 Gloucester St', 'Waterford', 4133, 4, 2, 2, 'House', 1, 0, 'Samwise Gamgee', 'Gandalf Grey', 410, '2017-06-30', 1),
(3, '59 Harburg Drive', 'Beenleigh', 4207, 3, 1, 2, 'House', 1, 0, 'Meriadoc Brandybuck', 'Radagast Brown', 350, '2017-05-24', 0),
(4, '48 Utrecht St', 'Cornubia', 4130, 4, 2, 2, 'House', 0, 1, 'Peregrin Took', 'Romestamo Blue', 530, '2017-05-30', 0),
(5, '1 Justin Place', 'Crestmead', 4132, 4, 2, 2, 'House', 0, 1, 'Aragorn', 'Morinehtar Blue', 430, '2017-05-24', 0),
(6, '18 Kilby Street', 'Crestmead', 4132, 3, 1, 1, 'House', 1, 0, 'Boromir', 'Saruman White', 350, '2017-06-14', 0),
(7, '36/9 Elma St', 'Salisbury', 4107, 4, 3, 1, 'Townhouse', 0, 0, 'Legolas Greenleaf', 'Gandalf Grey', 500, '2017-05-24', 0),
(8, '61/8 Briggs Road', 'Springwood', 4127, 2, 1, 1, 'Townhouse', 0, 0, 'Gimli', 'Radagast Brown', 330, '2017-05-24', 0),
(9, '2/93 Raff Avenue', 'Holland Park', 4121, 1, 1, 1, 'Unit', 1, 0, 'Matthew Dickinson', 'Romestamo Blue', 275, '2017-05-31', 0),
(10, '22 Long Island Drive', 'Windaroo', 4207, 4, 2, 2, 'House', 1, 1, 'Kylie Salter', 'Morinehtar Blue', 560, '2017-05-24', 0);

-- --------------------------------------------------------

--
-- Table structure for table `saved_properties`
--

CREATE TABLE `saved_properties` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `property_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `saved_properties`
--

INSERT INTO `saved_properties` (`id`, `user_id`, `property_id`) VALUES
(11, 9, 1),
(15, 6, 10),
(25, 10, 4),
(26, 10, 3),
(27, 13, 4),
(30, 14, 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `address`, `type`) VALUES
(6, 'Jungwoo Lee', 'pptppt2004@naver.com', '81dc9bdb52d04dc20036dbd8313ed055', '1234', 'admin'),
(7, 'Tauroa', 'tauroalesueur@hotmail.com', 'b74012a0fbca4af4bd29f73af7c0fffb', '45 fleet drive, redcliffe', 'user'),
(8, '33333', '1234@ff.com', '81dc9bdb52d04dc20036dbd8313ed055', '1234', 'user'),
(9, 'Tauroa', 'tauroa@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'hfjfjfj', 'user'),
(10, 'Jungwoo2', 'tenant@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'ha', 'tenant'),
(11, 'Saruman White', 'saruman@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'Isengard', 'employee'),
(12, 'jungwoo3', 'user@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'sss', 'user'),
(13, 'new', 'new@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '1234', 'user'),
(14, 'dddd', '1234@sd.com', '81dc9bdb52d04dc20036dbd8313ed055', '1234', 'user'),
(15, 'wert', '1234', '81dc9bdb52d04dc20036dbd8313ed055', '1234', 'user'),
(16, 'Tee', 'Lesueur', '202cb962ac59075b964b07152d234b70', '1234', 'user'),
(17, 'Tee', 'Teelesueur@gmail.com', '202cb962ac59075b964b07152d234b70', '123', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiries`
--
ALTER TABLE `enquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `saved_properties`
--
ALTER TABLE `saved_properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `enquiries`
--
ALTER TABLE `enquiries`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `saved_properties`
--
ALTER TABLE `saved_properties`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;--
-- Database: `id1826599_admin`
--
CREATE DATABASE IF NOT EXISTS `id1826599_admin` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `id1826599_admin`;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(2) NOT NULL,
  `name` varchar(20) NOT NULL,
  `phone` int(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `admin` int(1) NOT NULL,
  `comment` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `phone`, `email`, `admin`, `comment`) VALUES
(1, 'Mr David', 412345678, 'mrdavid@gmail.com', 1, 'He is the owner of the business'),
(2, 'Saruman White', 423456789, 'sarumanwhite@gmail.com', 0, 'Senior Property Manager'),
(3, 'Radagast Brown', 434567890, 'radagastbrown@gmail.com', 0, 'Property Manager'),
(4, 'Romestamo Blue', 445678901, 'romestamoblue@gmail.com', 0, 'Property Manager'),
(5, 'Morinehtar Blue', 456789012, 'morinehtarblue@gmail.com', 0, 'Property Manager'),
(6, 'Gandalf Grey', 467890123, 'gandalfgrey', 0, 'Intern');

-- --------------------------------------------------------

--
-- Table structure for table `enquiries`
--

CREATE TABLE `enquiries` (
  `id` int(10) NOT NULL,
  `type` varchar(20) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `property_id` int(10) NOT NULL,
  `message` varchar(500) NOT NULL,
  `response` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enquiries`
--

INSERT INTO `enquiries` (`id`, `type`, `user_name`, `property_id`, `message`, `response`) VALUES
(2, 'inspection', 'Jungwoo Lee', 4, '2321321', NULL),
(3, 'enquiry', 'new', 4, 'hello', NULL),
(4, 'maintenance', 'new', 7, '', NULL),
(5, 'inspection', 'dddd', 3, 'heyf', 'sdfghgfdfg');

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` int(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `suburb` varchar(20) NOT NULL,
  `postcode` int(4) NOT NULL,
  `bedrooms` int(1) NOT NULL,
  `bathrooms` int(1) NOT NULL,
  `parking_spaces` int(1) NOT NULL,
  `property_type` varchar(10) NOT NULL,
  `pet` int(1) NOT NULL,
  `furnishing` int(1) NOT NULL,
  `owner_name` varchar(20) NOT NULL,
  `manager_name` varchar(20) NOT NULL,
  `price` int(10) NOT NULL,
  `date_available` date NOT NULL,
  `occupied` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `address`, `suburb`, `postcode`, `bedrooms`, `bathrooms`, `parking_spaces`, `property_type`, `pet`, `furnishing`, `owner_name`, `manager_name`, `price`, `date_available`, `occupied`) VALUES
(1, '19 Lake Borumba Street', 'Logan Reserve', 4133, 4, 1, 1, 'House', 1, 0, 'Frodo baggins', 'Saruman White', 345, '2017-05-24', 0),
(2, '7 Gloucester St', 'Waterford', 4133, 4, 2, 2, 'House', 1, 0, 'Samwise Gamgee', 'Gandalf Grey', 410, '2017-06-30', 1),
(3, '59 Harburg Drive', 'Beenleigh', 4207, 3, 1, 2, 'House', 1, 0, 'Meriadoc Brandybuck', 'Radagast Brown', 350, '2017-05-24', 0),
(4, '48 Utrecht St', 'Cornubia', 4130, 4, 2, 2, 'House', 0, 1, 'Peregrin Took', 'Romestamo Blue', 530, '2017-05-30', 0),
(5, '1 Justin Place', 'Crestmead', 4132, 4, 2, 2, 'House', 0, 1, 'Aragorn', 'Morinehtar Blue', 430, '2017-05-24', 0),
(6, '18 Kilby Street', 'Crestmead', 4132, 3, 1, 1, 'House', 1, 0, 'Boromir', 'Saruman White', 350, '2017-06-14', 0),
(7, '36/9 Elma St', 'Salisbury', 4107, 4, 3, 1, 'Townhouse', 0, 0, 'Legolas Greenleaf', 'Gandalf Grey', 500, '2017-05-24', 0),
(8, '61/8 Briggs Road', 'Springwood', 4127, 2, 1, 1, 'Townhouse', 0, 0, 'Gimli', 'Radagast Brown', 330, '2017-05-24', 0),
(9, '2/93 Raff Avenue', 'Holland Park', 4121, 1, 1, 1, 'Unit', 1, 0, 'Matthew Dickinson', 'Romestamo Blue', 275, '2017-05-31', 0),
(10, '22 Long Island Drive', 'Windaroo', 4207, 4, 2, 2, 'House', 1, 1, 'Kylie Salter', 'Morinehtar Blue', 560, '2017-05-24', 0);

-- --------------------------------------------------------

--
-- Table structure for table `saved_properties`
--

CREATE TABLE `saved_properties` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `property_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `saved_properties`
--

INSERT INTO `saved_properties` (`id`, `user_id`, `property_id`) VALUES
(11, 9, 1),
(15, 6, 10),
(25, 10, 4),
(26, 10, 3),
(27, 13, 4),
(30, 14, 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `address`, `type`) VALUES
(6, 'Jungwoo Lee', 'pptppt2004@naver.com', '81dc9bdb52d04dc20036dbd8313ed055', '1234', 'admin'),
(7, 'Tauroa', 'tauroalesueur@hotmail.com', 'b74012a0fbca4af4bd29f73af7c0fffb', '45 fleet drive, redcliffe', 'user'),
(8, '33333', '1234@ff.com', '81dc9bdb52d04dc20036dbd8313ed055', '1234', 'user'),
(9, 'Tauroa', 'tauroa@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'hfjfjfj', 'user'),
(10, 'Jungwoo2', 'tenant@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'ha', 'tenant'),
(11, 'Saruman White', 'saruman@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'Isengard', 'employee'),
(12, 'jungwoo3', 'user@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'sss', 'user'),
(13, 'new', 'new@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '1234', 'user'),
(14, 'dddd', '1234@sd.com', '81dc9bdb52d04dc20036dbd8313ed055', '1234', 'user'),
(15, 'wert', '1234', '81dc9bdb52d04dc20036dbd8313ed055', '1234', 'user'),
(16, 'Tee', 'Lesueur', '202cb962ac59075b964b07152d234b70', '1234', 'user'),
(17, 'Tee', 'Teelesueur@gmail.com', '202cb962ac59075b964b07152d234b70', '123', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiries`
--
ALTER TABLE `enquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `saved_properties`
--
ALTER TABLE `saved_properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `enquiries`
--
ALTER TABLE `enquiries`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `saved_properties`
--
ALTER TABLE `saved_properties`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;--
-- Database: `id1826599_admin`
--
CREATE DATABASE IF NOT EXISTS `id1826599_admin` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `id1826599_admin`;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(2) NOT NULL,
  `name` varchar(20) NOT NULL,
  `phone` int(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `admin` int(1) NOT NULL,
  `comment` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `phone`, `email`, `admin`, `comment`) VALUES
(1, 'Mr David', 412345678, 'mrdavid@gmail.com', 1, 'He is the owner of the business'),
(2, 'Saruman White', 423456789, 'sarumanwhite@gmail.com', 0, 'Senior Property Manager'),
(3, 'Radagast Brown', 434567890, 'radagastbrown@gmail.com', 0, 'Property Manager'),
(4, 'Romestamo Blue', 445678901, 'romestamoblue@gmail.com', 0, 'Property Manager'),
(5, 'Morinehtar Blue', 456789012, 'morinehtarblue@gmail.com', 0, 'Property Manager'),
(6, 'Gandalf Grey', 467890123, 'gandalfgrey', 0, 'Intern');

-- --------------------------------------------------------

--
-- Table structure for table `enquiries`
--

CREATE TABLE `enquiries` (
  `id` int(10) NOT NULL,
  `type` varchar(20) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `property_id` int(10) NOT NULL,
  `message` varchar(500) NOT NULL,
  `response` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enquiries`
--

INSERT INTO `enquiries` (`id`, `type`, `user_name`, `property_id`, `message`, `response`) VALUES
(2, 'inspection', 'Jungwoo Lee', 4, '2321321', NULL),
(3, 'enquiry', 'new', 4, 'hello', NULL),
(4, 'maintenance', 'new', 7, '', NULL),
(5, 'inspection', 'dddd', 3, 'heyf', 'sdfghgfdfg');

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` int(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `suburb` varchar(20) NOT NULL,
  `postcode` int(4) NOT NULL,
  `bedrooms` int(1) NOT NULL,
  `bathrooms` int(1) NOT NULL,
  `parking_spaces` int(1) NOT NULL,
  `property_type` varchar(10) NOT NULL,
  `pet` int(1) NOT NULL,
  `furnishing` int(1) NOT NULL,
  `owner_name` varchar(20) NOT NULL,
  `manager_name` varchar(20) NOT NULL,
  `price` int(10) NOT NULL,
  `date_available` date NOT NULL,
  `occupied` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `address`, `suburb`, `postcode`, `bedrooms`, `bathrooms`, `parking_spaces`, `property_type`, `pet`, `furnishing`, `owner_name`, `manager_name`, `price`, `date_available`, `occupied`) VALUES
(1, '19 Lake Borumba Street', 'Logan Reserve', 4133, 4, 1, 1, 'House', 1, 0, 'Frodo baggins', 'Saruman White', 345, '2017-05-24', 0),
(2, '7 Gloucester St', 'Waterford', 4133, 4, 2, 2, 'House', 1, 0, 'Samwise Gamgee', 'Gandalf Grey', 410, '2017-06-30', 1),
(3, '59 Harburg Drive', 'Beenleigh', 4207, 3, 1, 2, 'House', 1, 0, 'Meriadoc Brandybuck', 'Radagast Brown', 350, '2017-05-24', 0),
(4, '48 Utrecht St', 'Cornubia', 4130, 4, 2, 2, 'House', 0, 1, 'Peregrin Took', 'Romestamo Blue', 530, '2017-05-30', 0),
(5, '1 Justin Place', 'Crestmead', 4132, 4, 2, 2, 'House', 0, 1, 'Aragorn', 'Morinehtar Blue', 430, '2017-05-24', 0),
(6, '18 Kilby Street', 'Crestmead', 4132, 3, 1, 1, 'House', 1, 0, 'Boromir', 'Saruman White', 350, '2017-06-14', 0),
(7, '36/9 Elma St', 'Salisbury', 4107, 4, 3, 1, 'Townhouse', 0, 0, 'Legolas Greenleaf', 'Gandalf Grey', 500, '2017-05-24', 0),
(8, '61/8 Briggs Road', 'Springwood', 4127, 2, 1, 1, 'Townhouse', 0, 0, 'Gimli', 'Radagast Brown', 330, '2017-05-24', 0),
(9, '2/93 Raff Avenue', 'Holland Park', 4121, 1, 1, 1, 'Unit', 1, 0, 'Matthew Dickinson', 'Romestamo Blue', 275, '2017-05-31', 0),
(10, '22 Long Island Drive', 'Windaroo', 4207, 4, 2, 2, 'House', 1, 1, 'Kylie Salter', 'Morinehtar Blue', 560, '2017-05-24', 0);

-- --------------------------------------------------------

--
-- Table structure for table `saved_properties`
--

CREATE TABLE `saved_properties` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `property_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `saved_properties`
--

INSERT INTO `saved_properties` (`id`, `user_id`, `property_id`) VALUES
(11, 9, 1),
(15, 6, 10),
(25, 10, 4),
(26, 10, 3),
(27, 13, 4),
(30, 14, 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `address`, `type`) VALUES
(6, 'Jungwoo Lee', 'pptppt2004@naver.com', '81dc9bdb52d04dc20036dbd8313ed055', '1234', 'admin'),
(7, 'Tauroa', 'tauroalesueur@hotmail.com', 'b74012a0fbca4af4bd29f73af7c0fffb', '45 fleet drive, redcliffe', 'user'),
(8, '33333', '1234@ff.com', '81dc9bdb52d04dc20036dbd8313ed055', '1234', 'user'),
(9, 'Tauroa', 'tauroa@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'hfjfjfj', 'user'),
(10, 'Jungwoo2', 'tenant@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'ha', 'tenant'),
(11, 'Saruman White', 'saruman@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'Isengard', 'employee'),
(12, 'jungwoo3', 'user@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'sss', 'user'),
(13, 'new', 'new@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '1234', 'user'),
(14, 'dddd', '1234@sd.com', '81dc9bdb52d04dc20036dbd8313ed055', '1234', 'user'),
(15, 'wert', '1234', '81dc9bdb52d04dc20036dbd8313ed055', '1234', 'user'),
(16, 'Tee', 'Lesueur', '202cb962ac59075b964b07152d234b70', '1234', 'user'),
(17, 'Tee', 'Teelesueur@gmail.com', '202cb962ac59075b964b07152d234b70', '123', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiries`
--
ALTER TABLE `enquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `saved_properties`
--
ALTER TABLE `saved_properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `enquiries`
--
ALTER TABLE `enquiries`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `saved_properties`
--
ALTER TABLE `saved_properties`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
