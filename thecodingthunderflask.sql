-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2020 at 10:16 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thecodingthunderflask`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `srno` int(155) NOT NULL,
  `name` text NOT NULL,
  `phonenum` int(15) NOT NULL,
  `msg` text NOT NULL DEFAULT current_timestamp(),
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`srno`, `name`, `phonenum`, `msg`, `date`, `email`) VALUES
(1, 'yash', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'jsdfkljkl'),
(2, 'alklk', 55345645, 'kdplfjlkjlodfjfjgvlkgjlkgjkgklgsd', '2020-05-22 05:19:30', 'Ysoni7293@gmail.com'),
(3, 'akash', 4454, 'djslkfjlksdfj', '2020-05-22 05:20:08', 'hello'),
(4, 'alklk', 55345645, 'kdplfjlkjlodfjfjgvlkgjlkgjkgklgsd', '2020-05-22 05:23:22', 'Ysoni7293@gmail.com'),
(5, 'alklk', 55345645, 'kdplfjlkjlodfjfjgvlkgjlkgjkgklgsd', '2020-05-22 05:25:49', 'Ysoni7293@gmail.com'),
(6, 'mahesh', 2147483647, 'myname is mahesh', '2020-05-23 00:48:20', 'Ysoni7293@gmail.com'),
(7, 'mahesh', 2147483647, 'myname is mahesh', '2020-05-23 01:23:23', 'Ysoni7293@gmail.com'),
(8, 'mahesh', 2147483647, 'myname is mahesh', '2020-05-23 01:25:08', 'Ysoni7293@gmail.com'),
(9, 'akak', 415454, 'this is akash', '2020-05-23 01:57:59', 'hello'),
(10, 'fdhkjdsaj', 0, 'sdhakjfhksdj', '2020-05-23 02:01:40', 'dfsjkahfsakj'),
(11, 'fdhkjdsaj', 0, 'sdhakjfhksdj', '2020-05-23 02:03:02', 'dfsjkahfsakj'),
(12, 'fdhkjdsaj', 0, 'sdhakjfhksdj', '2020-05-23 02:07:56', 'dfsjkahfsakj'),
(13, ';lgdkl;sadktg', 0, 'sfdk;lg', '2020-05-23 02:08:18', 'df;lsk;lk'),
(14, ';lgdkl;sadktg', 0, 'sfdk;lg', '2020-05-23 02:09:52', 'df;lsk;lk'),
(15, 'ajay', 0, 'hello yash', '2020-05-23 02:10:32', 'Ysoni7293@gmail.com'),
(16, 'ajay', 0, 'hello yash', '2020-05-23 02:12:57', 'Ysoni7293@gmail.com'),
(17, 'kjdshkjfsha', 0, 'dsfkjhvs', '2020-05-23 02:15:28', 'hsdadkjhkj'),
(18, 'Akash ', 2147483647, 'thi s isafkj', '2020-05-23 02:16:05', 'Ysoni7293@gmail.com'),
(19, 'kalash', 2147483647, 'halo bhia', '2020-05-23 02:19:33', 'Ysoni7293@gmail.com'),
(20, 'kalash', 2147483647, 'halo bhia', '2020-05-23 02:36:35', 'Ysoni7293@gmail.com'),
(21, 'kalash', 2147483647, 'halo bhia', '2020-05-23 02:42:57', 'Ysoni7293@gmail.com'),
(22, 'fklsakljfdkl', 5254442, 'jlkxcjlkfgcjk', '2020-05-23 03:39:21', 'ahdsfkldfkl'),
(23, 'raju', 2147483647, 'this is raju', '2020-05-23 03:40:24', 'Ysoni7293@gmail.com'),
(24, 'raju', 2147483647, 'this is raju', '2020-05-23 03:49:12', 'Ysoni7293@gmail.com'),
(25, 'raju', 2147483647, 'this is raju', '2020-05-23 03:50:32', 'Ysoni7293@gmail.com'),
(26, 'hello ', 56564545, 'hello yash and akash', '2020-05-24 02:03:04', 'Ysoni7293@gmail.com'),
(27, 'hello ', 56564545, 'hello yash and akash', '2020-05-24 02:03:26', 'Ysoni7293@gmail.com'),
(28, 'hello ', 56564545, 'hello yash and akash', '2020-05-24 02:17:09', 'Ysoni7293@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(155) NOT NULL,
  `title` varchar(255) NOT NULL,
  `tagline` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(25) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `tagline`, `slug`, `content`, `img_file`, `date`) VALUES
(1, 'hello thi sis my ', 'thi s is hard coding tagleine', 'first_post', 'This is my first post and i am very ecxiter sjaskldfjtsdfkjfktsdfakgk ltsfdkfjksdajatklkfdjaksdktjdkfjsklfjkdlsjfklsdakljkfkjkhelo hoe are you and d', 'post-bg.jpg', '2020-05-23 02:25:10'),
(2, 'this is second  posts', 'i am very exited', 'this is slug', 'hello how are you ajkfjkljflksdfajkldfjsflksdjfklfjsdfkldfjsdkfjfkjs f  fk jdkfjdfkfkfnd d knkj hj hj h jk hjk hj h kjh kj hkj h kj hkj h jk h k h kj h kj h khh  ', 'post-sample-image.jpg', '2020-05-24 02:43:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`srno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `srno` int(155) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(155) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
