-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 06, 2020 at 01:03 PM
-- Server version: 5.7.24
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `php02_kadai`
--

-- --------------------------------------------------------

--
-- Table structure for table `text_table`
--

CREATE TABLE `text_table` (
  `id` int(12) NOT NULL,
  `title_id` int(12) NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `indate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `text_table`
--

INSERT INTO `text_table` (`id`, `title_id`, `name`, `text`, `indate`) VALUES
(4, 2, 'test', 'test文章', '2020-10-24 23:30:24'),
(5, 3, 'test3', 'test3文章', '2020-10-24 23:30:55'),
(6, 2, 'testtest', 'テスト', '2020-10-24 23:33:05'),
(7, 3, 'testtest3', 'テスト3', '2020-10-24 23:33:27'),
(8, 4, 'testtest4', 'テスト4', '2020-10-24 23:33:42'),
(9, 4, 'testtest5', 'テスト5', '2020-10-24 23:33:58'),
(10, 3, 'あいうえお', 'あかさたな', '2020-10-25 01:07:57'),
(11, 3, '書き込みテスト', '書き込み書き込み', '2020-10-25 01:14:23'),
(12, 3, '書き込みテスト書き込み', '書き込み書き込みテストテスト', '2020-10-25 01:15:09'),
(13, 7, 'テスト', 'ブラウザから書き込み登録', '2020-10-25 01:16:08'),
(14, 7, 'かきかき', 'test', '2020-10-25 01:17:21'),
(15, 4, 'aiueo', '本日は晴天', '2020-10-25 01:18:09'),
(16, 2, 'fgffd', 'teasteas', '2020-10-25 08:35:30'),
(17, 9, 'あｓｄｆｄ', 'あｆｄｆｄｆｄｇ', '2020-11-05 23:57:56');

-- --------------------------------------------------------

--
-- Table structure for table `title_table`
--

CREATE TABLE `title_table` (
  `id` int(12) NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `indate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `title_table`
--

INSERT INTO `title_table` (`id`, `title`, `indate`) VALUES
(2, 'タイトルテスト1', '2020-10-24 03:49:00'),
(3, 'タイトルテスト2', '2020-10-24 12:16:48'),
(4, 'タイトルテスト3', '2020-10-24 12:17:07'),
(5, 'タイトルテスト4', '2020-10-24 12:17:14'),
(6, 'タイトルテスト5', '2020-10-24 12:17:21'),
(7, 'タイトルテスト８', '2020-10-25 01:15:21'),
(8, 'testtitle', '2020-10-25 08:35:49'),
(9, 'テストタイトル', '2020-11-05 23:57:19');

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

CREATE TABLE `user_table` (
  `id` int(12) NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `lid` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `lpw` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `kanri_flg` int(1) NOT NULL,
  `life_flg` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_table`
--

INSERT INTO `user_table` (`id`, `name`, `lid`, `lpw`, `kanri_flg`, `life_flg`) VALUES
(1, 'テスト１管理者', 'test1', 'test1', 1, 0),
(2, 'テスト2一般', 'test2', 'test2', 0, 0),
(3, 'テスト３', 'test3', 'test3', 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `text_table`
--
ALTER TABLE `text_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `title_table`
--
ALTER TABLE `title_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_table`
--
ALTER TABLE `user_table`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `text_table`
--
ALTER TABLE `text_table`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `title_table`
--
ALTER TABLE `title_table`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_table`
--
ALTER TABLE `user_table`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
