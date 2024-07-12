-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 04, 2024 at 07:38 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)   SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', '25f9e794323b453885f5181f1b624d0b');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'HP'),
(2, 'Samsung'),
(3, 'Apple'),
(4, 'motorolla'),
(5, 'LG'),
(6, 'Cloth Brand');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Electronics'),
(2, 'Ladies Wears'),
(3, 'Mens Wear'),
(4, 'Kids Wear'),
(5, 'Furnitures'),
(6, 'Home Appliances'),
(7, 'Electronics Gadgets');

-- --------------------------------------------------------

--
-- Table structure for table `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com'),
(4, 'pasindugunawardana01@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(1, 12, 'Pasindu', 'pasindugunawardana01@gmail.com', 'No 37/B,Elfa Estate Olugantota,Balangoda', 'Balangoda', 'Karadiyamulle', 70700, 'pasindu', '4321 2345 6788 7654', '12/25', 3, 77000, 448);

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_spec` varchar(1000) NOT NULL,
  `product_spec1` varchar(10000) NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_spec`, `product_spec1`, `product_image`, `product_keywords`) VALUES
(1, 1, 2, 'Samsung galaxy s7 edge', 30000, 'Samsung galaxy s7 edge', 'Processor: Snapdragon 820 Quad Core?MSM8996?\n\nRAM: 4GB RAM\n\nStorage: 32GB ROM\n\nDisplay: 5.5 inch 2560×1440 Quad HD Screen\n\nCamera: Rear camera: 12 MP+Front camera: 5.0MP,f/1.8\n\nOperating System: Android 6.0', 'Update (03 Feb 2017): The Android 7.0 Nougat update for the Galaxy S7 edge is here and we\'ve covered the differences in-depth in a dedicated article. Be sure to read it for a more current perspective on the Samsung flagship\'s software. We\'ve also updated some sections of this review that the jump to Nougat has affected - battery life in particular. For the complete picture it\'s best to read both articles together.\r\n\r\nPushed way out of its comfort zone and into a high-stakes flagship redesign last season, Samsung\'s back to what it does best -- making itself comfortable at the top of the heap. OK, it sounds like a bold claim but by no means incredible if you\'ve seen the Samsung Galaxy S7 edge.\r\n\r\nYet, this isn\'t exactly a galaxy far, far away. The Samsung Galaxy S7 edge looks a lot like its predecessor, and we\'ve heard a lot of people calling it the same device. Can\'t blame them really - Samsung indeed focused on refinement this time around and if you caught our regular Galaxy S7 review, you\'d know we liked what they come up with.\r\n\r\nAnyway, the real deal is on the inside. If only you look at the features it brings back, such as water protection and a microSD slot, you may conclude that the Galaxy S7 edge is what the S6 edge should\'ve been.', 'product07.png', 'samsung mobile electronics'),
(2, 1, 3, 'IPhone SE', 50000, 'Iphone SE', 'Processor: Apple A9\r\nRAM: 2GB RAM\r\nStorage: 16/32/64/128 GB\r\nDisplay: LED-backlit IPS LCD, capacitive touchscreen, 16M colors\r\nCamera: 12 MP (f/2.2, 29mm, 1/3\", 1.22 µm)\r\nBattery: 1624mAh', '', 'http___pluspng.com_img-png_iphone-hd-png-iphone-apple-png-file-550.png', 'mobile iphone apple'),
(3, 1, 3, 'iPad air 2', 30000, 'ipad apple brand', 'PROCESSOR: Processor (Clock): Six-core A10X 64-bit\r\nRAM: Memory (RAM): 4GB LPDDR4\r\nSTORAGE: Internal Storage: 64GB/256GB/512GB eMMC\r\nDISPLAY: Screen (Size & Type): 10.5 Inches IPS Display\r\nCAMERA: Camera Overview: 12 Megapixels / 7 Megapixels\r\nBATTERY: Non-Removable 30.4Wh Lithium-Polymer battery', '', 'da4371ffa192a115f922b1c0dff88193.png', 'apple ipad tablet'),
(4, 1, 3, 'iPhone 6s', 42000, 'Apple iPhone ', 'Processor: M9 motion coprocessor\r\nRAM: 2GB\r\nStorage: 16/32/64/128GB\r\nDisplay: 16M colors\r\nCamera: 12 MP\r\nBattery: Non-removable Li-Ion 1715 mAh battery (6.91 Wh)', '', 'http___pluspng.com_img-png_iphone-6s-png-iphone-6s-gold-64gb-1000.png', 'iphone apple mobile'),
(5, 1, 2, 'Apple iPad Pro 2 12.9', 30000, 'Apple iPad Pro 2 12.9', 'PROCESSOR: Processor (Clock): Six-core A10X 64-bit\r\nRAM: Memory (RAM): Unknown\r\nSTORAGE: Internal Storage: 64GB/256GB/512GB eMMC\r\nDISPLAY: Screen (Size & Type): 12.9 Inches LED-backlit IPS Display\r\nCAMERA: Camera Overview: 12 Megapixels / 7 Megapixels\r\nBATTERY: Non-Removable 41 Wh Lithium-Polymer battery', '', 'iPad-air.png', 'ipad tablet '),
(6, 1, 1, 'HP Chromebook x2', 115000, 'HP Chromebook x2', 'PROCESSOR: Intel Core m3 (7Y30) “Kaby Lake” processor\r\nRAM: 4GB or 8GB of (LPDDR3) RAM\r\nSTORAGE: 32GB\r\nDISPLAY: 12.3-inch screen\r\nCAMERA: 5MP front camera, a 13MP rear camera\r\nBATTERY: 10 hours long from the 48Whr battery', '', 'laptop_PNG5939.jpg', 'HP Chromebook x2'),
(7, 1, 1, 'HP Envy x2 4G LTE', 50000, 'HP Envy x2 4G LTE', 'PROCESSOR: Qualcomm® Snapdragon™ 835 Mobile PC Platform8\r\nRAM: 8gb RAM\r\nSTORAGE: Up to 256 GB of storage12\r\nDISPLAY: WUXGA+ (1920 X 1280) touch display for ultimate interactivity\r\nCAMERA: 13MP\r\nBATTERY: Up to 22 hours of battery life3 and up to 1,000 hours of connected standby.5', '', 'laptop_PNG5930.png', 'HP Envy x2 4G LTE'),
(8, 1, 4, 'Sony Xperia R1', 40000, 'Sony Xperia R1', 'Processor: Qualcomm Snapdragon 430 MSM8937, 64-bit Processor\r\nRAM: 2GB LPDDR3\r\nStorage: 16GB External Memory Supports Up to 128GB\r\nDisplay: Screen size 5.2 inches IPS HD Display (1280 x 720 Pixels) 24-bit\r\nCamera: 13 Megapixels with Single-LED and AF Rear Camera | 8 Megapixel Front Camera\r\nBattery: Non-Removable 2,620 mAh Lithium-Polymer', '', '530201353846AM_635_sony_xperia_z.png', 'sony mobile'),
(9, 1, 3, 'I phone 11', 120000, 'I Phone 11', 'Processor: Apple A13 Bionic (7 nm+)\r\nRAM: 4 GB\r\nStorage: 64 GB, 128 GB, 256 GB\r\nDisplay: 6.1 inches\r\nCamera: 12 MP (wide) + 12 MP (ultrawide)\r\nBattery: Non-removable Li-Ion 3110 mAh battery + Fast battery charging 18W: 50% in 30 min', '', 'iphone11.jfif', 'iphone apple mobile'),
(10, 2, 6, 'Red Ladies dress', 1800, 'red dress for girls', '', '', 'red dress.jpg', 'red dress '),
(11, 2, 6, 'Blue Heave dress', 2000, 'Blue dress', 'Brigham Young University-Idaho Special Collections,Dry Clean Only', 'Rama Blue Jaquard Indo Western is designed with button work. Comes alongwith bottom. Actual product colors & designs may slightly vary.', 'images.jpg', 'blue dress cloths'),
(12, 2, 6, 'Ladies Casual Cloths', 1500, 'ladies casual summer two colors pleted', '', '', '7475-ladies-casual-dresses-summer-two-colors-pleated.jpg', 'girl dress cloths casual'),
(13, 2, 6, 'SpringAutumnDress', 2000, 'girls dress', '', '', 'Spring-Autumn-Winter-Young-Ladies-Casual-Wool-Dress-Women-s-One-Piece-Dresse-Dating-Clothes-Medium.jpg_640x640.jpg', 'girl dress'),
(14, 2, 6, 'Casual Dress', 3000, 'girl dress', '', '', 'download.jpg', 'ladies cloths girl'),
(15, 2, 6, 'Formal Look', 1500, 'girl dress', '', '', 'shutterstock_203611819.jpg', 'ladies wears dress girl'),
(16, 3, 6, 'Sweter for men', 2600, '2012-Winter-Sweater-for-Men-for-better-outlook', '', '', '2012-Winter-Sweater-for-Men-for-better-outlook.jpg', 'black sweter cloth winter'),
(17, 3, 6, 'Gents formal', 1000, 'gents formal look', '', '', 'gents-formal-250x250.jpg', 'gents wear cloths'),
(19, 3, 6, 'Formal Coat', 3000, 'ad', '', '', 'images (1).jpg', 'coat blazer gents'),
(20, 3, 6, 'Mens Sweeter', 2600, 'jg', '', '', 'Winter-fashion-men-burst-sweater.png', 'sweeter gents '),
(21, 3, 6, 'T shirt', 2800, 'ssds', '', '', 'IN-Mens-Apparel-Voodoo-Tiles-09._V333872612_.jpg', 'formal t shirt black'),
(22, 4, 6, 'Yellow T shirt ', 3800, 'yello t shirt with pant', '', '', '1.0x0.jpg', 'kids yellow t shirt'),
(23, 4, 6, 'Girls cloths', 1900, 'sadsf', '', '', 'GirlsClothing_Widgets.jpg', 'formal kids wear dress'),
(24, 4, 6, 'Blue T shirt', 2000, 'g', '', '', 'images.jpg', 'kids dress'),
(25, 4, 6, 'Yellow girls dress', 1950, 'as', '', '', 'images (3).jpg', 'yellow kids dress'),
(27, 4, 6, 'Formal look', 1750, 'sd', '', '', 'image28.jpg', 'formal kids dress'),
(32, 5, 0, 'Book Shelf', 2500, 'book shelf', '', '', 'furniture-book-shelf-250x250.jpg', 'book shelf furniture'),
(33, 6, 2, 'Refrigerator', 35000, 'Refrigerator', '', '', 'CT_WM_BTS-BTC-AppliancesHome_20150723.jpg', 'refrigerator samsung'),
(34, 6, 4, 'Emergency Light', 2000, 'Emergency Light', '', '', 'emergency light.JPG', 'emergency light'),
(35, 6, 0, 'Vaccum Cleaner', 6000, 'Vaccum Cleaner', '', '', 'vaccum.jfif', 'Vaccum Cleaner'),
(36, 6, 5, 'Iron', 1500, 'gj', '', '', 'iron.JPG', 'iron'),
(37, 6, 5, 'LED TV', 68000, 'LED TV', '', '', 'led.jfif', 'led tv lg'),
(38, 6, 4, 'Microwave Oven', 28000, 'Microwave Oven', '', '', 'micro.jfif', 'Microwave Oven'),
(39, 6, 5, 'Mixer Grinder', 6500, 'Mixer Grinder', '', '', 'singer-mixer-grinder-mg-46-medium_4bfa018096c25dec7ba0af40662856ef.jpg', 'Mixer Grinder'),
(40, 2, 6, 'Formal girls dress', 3000, 'Formal girls dress', '', '', 'girl-walking.jpg', 'ladies'),
(45, 1, 2, 'Samsung Galaxy Note 7', 60000, 'Samsung Galaxy Note 7', 'Processor: Snapdragon 820 Quad Core?MSM8996?\r\nRAM: 4GB RAM\r\nStorage: 64GB ROM\r\nDisplay: 5.7inch, 2560×1440?Quad HD / 2K ?\r\nCamera: Front camera 5MP + Rear camera 12MP\r\nOperating System: Android 6.0', '', 'samsung_galaxy_note3_note3neo.JPG', 'Samsung Galaxy Note 7'),
(46, 1, 2, 'Samsung Galaxy Note 8', 90000, 'Samsung Galaxy Note 8', '\r\nSamsung Galaxy Note 8\r\nProcessor: Snapdragon 835 (US) & Exynos 8895 (Global)\r\nRAM: 4GB/6GB\r\nStorage: 64/128/256GB\r\nDisplay: 6.3 inch\r\nCamera: 12 MP + 12 MP (Rear) + 8 MP (Front)\r\nBattery: Android 7.1.1 (Nougat)', '', 'samsung_galaxy_note3_note3neo.JPG', 'Samsung Galaxy Note 8'),
(47, 4, 6, 'Blue And White Kids Boys Indo Western Dress', 3650, 'nbk', '', '', 'shirt1.jpg', 'Blue And White Kids Boys Indo Western Dress'),
(48, 1, 7, 'Headphones', 2000, 'Headphones', '', '', 'product05.png', 'Headphones Sony'),
(49, 1, 7, 'Headphones', 2500, 'Headphones', '', '', 'product05.png', 'Headphones Sony'),
(50, 3, 6, 'boys shirts', 1600, 'shirts', '', '', 'pm1.JPG', 'suit boys shirts'),
(51, 3, 6, 'boys shirts', 1850, 'shirts', '', '', 'pm2.JPG', 'suit boys shirts'),
(52, 3, 6, 'boys shirts', 2050, 'shirts', '', '', 'pm3.JPG', 'suit boys shirts'),
(53, 3, 6, 'boys shirts', 2240, 'shirts', '', '', 'ms1.JPG', 'suit boys shirts'),
(54, 3, 6, 'boys shirts', 2120, 'shirts', '', '', 'ms2.JPG', 'suit boys shirts'),
(55, 3, 6, 'boys shirts', 1680, 'shirts', '', '', 'ms3.JPG', 'suit boys shirts'),
(56, 3, 6, 'boys shirts', 1280, 'shirts', '', '', 'pm7.JPG', 'suit boys shirts'),
(57, 3, 6, 'boys shirts', 2750, 'shirts', '', '', 'i3.JPG', 'suit boys shirts'),
(58, 3, 6, 'boys shirts', 1850, 'shirts', '', '', 'pm9.JPG', 'suit boys shirts'),
(59, 3, 6, 'boys shirts', 1355, 'shirts', '', '', 'a2.JPG', 'suit boys shirts'),
(60, 3, 6, 'boys shirts', 1865, 'shirts', '', '', 'pm11.JPG', 'suit boys shirts'),
(61, 3, 6, 'boys shirts', 2215, 'shirts', '', '', 'pm12.JPG', 'suit boys shirts'),
(62, 3, 6, 'boys shirts', 2299, 'shirts', '', '', 'pm13.JPG', 'suit boys shirts'),
(63, 3, 6, 'boys Jeans Pant', 3550, 'Pants', '', '', 'pt1.JPG', 'boys Jeans Pant'),
(64, 3, 6, 'boys Jeans Pant', 4460, 'pants', '', '', 'pt2.JPG', 'boys Jeans Pant'),
(65, 3, 6, 'boys Jeans Pant', 2470, 'pants', '', '', 'pt3.JPG', 'boys Jeans Pant'),
(66, 3, 6, 'boys Jeans Pant', 3480, 'pants', '', '', 'pt4.JPG', 'boys Jeans Pant'),
(67, 3, 6, 'boys Jeans Pant', 3360, 'pants', '', '', 'pt5.JPG', 'boys Jeans Pant'),
(68, 3, 6, 'boys Jeans Pant', 3550, 'pants', '', '', 'pt6.JPG', 'boys Jeans Pant'),
(69, 3, 6, 'boys Jeans Pant', 3390, 'pants', '', '', 'pt7.JPG', 'boys Jeans Pant'),
(70, 3, 6, 'boys Jeans Pant', 2399, 'pants', '', '', 'pt8.JPG', 'boys Jeans Pant'),
(71, 1, 2, 'Samsung galaxy s7', 40000, 'Samsung galaxy s7', 'Processor: Quad-core Snapdragon 820\r\nRAM: 4 GB\r\nStorage: 32 GB\r\nDisplay: 5.1 inches\r\nCamera: 12 MP + 5 MP\r\nOperating System: Android 6.0 (Marshmallow), upgradable to 7.0 (Nougat)', '', 'product07.png', 'samsung mobile electronics'),
(72, 7, 2, 'sony Headphones', 10000, 'sony Headphones', '', '', 'product02.png', 'sony Headphones electronics gadgets'),
(73, 7, 2, 'samsung Headphones', 3500, 'samsung Headphones', '', '', 'product05.png', 'samsung Headphones electronics gadgets'),
(74, 1, 1, 'HP Laptop 39.6 cm 15s-fq5329TU', 250000, 'HP Laptop 39.6 cm 15s-fq5329TU', 'Processor: 10th Generation Intel Core i5-10210U\r\nRAM: HP Laptop 39.6 cm 15s-fq5329TU \r\nStorage: 512 GB SSD Solid State Drive \r\nDisplay: 39.6 cm (15.6) diagonal, FHD, 144 Hz refresh rate, 9 ms response time display NVIDIA® GeForce RTX™ 2050 \r\nCamera: Backlit keyboard with numeric keypad, True Vision 720p HD camera\r\nOperating System: Windows 10 Home Single Language, English', '', 'product01.png', 'HP Laptop 39.6 cm 15s-fq5329TU'),
(75, 1, 1, 'HP Pavilion 39.6 cm Laptop 15-eg3036TU', 300000, 'HP Pavilion 39.6 cm Laptop 15-eg3036TU', 'Processor: 13th Generation Intel® Core™ i7 processor\r\n\r\nRAM: 16 GB DDR4 RAM \r\n\r\nStorage: 1 TB SSD Solid State Drive \r\n\r\nDisplay: 39.6 cm (15.6) diagonal FHD IPS display with Intel® Iris® X? Graphics\r\n\r\nCamera: Backlit keyboard with numeric keypad, Fingerprint reader, Wide Vision 720p HD camera, B&O Speakers\r\n\r\nOperating System: Windows 11 Home', '', 'hp1.jpg', 'HP Pavilion 39.6 cm Laptop 15-eg3036TU'),
(76, 1, 5, 'sony note 6gb ram', 45000, 'sony note 6gb ram', '', '', 'product04.png', 'sony note 6gb ram mobile electronics'),
(77, 1, 4, 'MSI laptop 16gb ram NVIDEA Graphics', 260000, 'MSI laptop 16gb ram', 'Processor: Intel Core i5-11400H \r\n\r\nRAM: 16GB RAM\r\n\r\nStorage: 512GB SSD\r\n\r\nDisplay: MSI GF63 Thin Gaming Laptop - 15.6\" FHD 144Hz NVIDIA GeForce RTX 3050\r\n\r\nCamera:4 MP\r\n\r\nOperating System: Windows 11 Home', '', 'product06.png', 'MSI laptop 16gb ram NVIDEA Graphics electronics'),
(78, 1, 5, 'Dell Inspiron 14 5000 5490', 185000, 'dell laptop 8gb ram intel integerated Graphics', 'Processor: 10th Generation Intel Core i5-10210U\nRAM: 8 GB\nStorage: 512 GB\nDisplay: 14 inches\nCamera: 2.7mm webcam\nOperating System: Windows 10 Home Single Language, English', '', 'dell.jpg', 'Dell Inspiron 14 5000 5490'),
(79, 7, 2, 'camera with 3D pixels', 80000, 'camera with 3D pixels', '', '', 'product09.png', 'camera with 3D pixels camera electronics gadgets'),
(81, 4, 6, 'Kids blue dress', 1960, 'blue dress', '', '', 'bluedr.jfif', 'kids blue dress');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'Pasindu', 'Gunawardana', 'pasindugunawardana01@gmail.com', '16098', '770500218', '123456789', 'sdcjns,djc');

--
-- Triggers `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'Pasindu', 'Gunawardana', 'pasindugunawardana01@gmail.com', '123456789', '770500218', '123456789', 'sdcjns,djc');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `orders_info` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
