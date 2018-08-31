-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2018-08-29 15:03:02
-- 服务器版本： 5.7.18
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cloud_campus`
--

-- --------------------------------------------------------

--
-- 表的结构 `class_category`
--

CREATE TABLE `class_category` (
  `value` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `class_category`
--

INSERT INTO `class_category` (`value`, `title`) VALUES
('25719710465130536', '1年级1班'),
('25719710465130537', '1年级2班'),
('25719710465130538', '1年级3班'),
('25719710465130539', '2年级1班'),
('25719710465130540', '2年级2班'),
('25719710465130541', '2年级3班'),
('25719710465130542', '3年级1班'),
('25719710465130543', '3年级2班'),
('25719710465130544', '3年级3班'),
('25719710465130545', '4年级1班'),
('25719710465130546', '4年级2班'),
('25719710465130547', '4年级3班'),
('25719710465130548', '5年级1班'),
('25719710465130549', '5年级2班'),
('25719710465130550', '5年级3班'),
('25719710465130551', '6年级1班'),
('25719710465130552', '6年级2班'),
('25719710465130553', '6年级3班');

-- --------------------------------------------------------

--
-- 表的结构 `homework_information`
--

CREATE TABLE `homework_information` (
  `id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `summary` varchar(255) NOT NULL,
  `level` int(5) NOT NULL DEFAULT '1',
  `publisher` varchar(255) DEFAULT NULL,
  `class_id` varchar(255) DEFAULT NULL,
  `publish_type` int(20) NOT NULL DEFAULT '0',
  `homework_type_value` int(32) NOT NULL,
  `publish_time` datetime DEFAULT NULL,
  `pictures` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `homework_information`
--

INSERT INTO `homework_information` (`id`, `title`, `content`, `summary`, `level`, `publisher`, `class_id`, `publish_type`, `homework_type_value`, `publish_time`, `pictures`) VALUES
('00849be0-aa01-11e8-84e0-43a3500297d2', '数学作业', '数学作业哈 数学作业', '数学作业哈 数学作业', 0, '管理员', '25719710465130536', 1, 2, '2018-08-27 21:56:31', ''),
('6ab14c70-a740-11e8-8dca-318f8e7e7a3e', 'A', 'A', 'A', 0, '管理员', '25719710465130537', 2, 1, '2018-08-25 09:52:54', ''),
('72cea150-a740-11e8-8dca-318f8e7e7a3e', 'b', 'B', 'B', 0, '管理员', '25719710465130536', 2, 2, '2018-08-26 09:53:08', ''),
('77ad81a0-a880-11e8-87fb-a97be195be2a', '123465', '123465', '123465', 0, '管理员', '25719710465130536', 2, 0, '2018-08-26 00:03:55', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/1535212933112-bzrwhFqca.jpg,https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/1535212934123-Ss7QpcS8d.jpg,https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/1535212934932-hZZwKOWLA.jpg,https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/1535212935670-E7KsTdnCW.jpg,https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/1535212936374-XFKOmTmFJs.jpg,https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/1535212937028-VlUUUerLS.jpg'),
('7e3a36d0-a740-11e8-8dca-318f8e7e7a3e', 'c', 'c', 'c', 0, '管理员', '25719710465130536', 2, 3, '2018-08-23 09:53:27', ''),
('8814f320-a740-11e8-8dca-318f8e7e7a3e', 'd', 'd', 'd', 0, '管理员', '25719710465130536', 2, 4, '2018-08-23 09:53:43', ''),
('91495d50-a740-11e8-8dca-318f8e7e7a3e', 'q', 'q', 'q', 0, '管理员', '25719710465130536', 2, 5, '2018-08-16 09:53:59', ''),
('93cdee50-a6dd-11e8-a7e5-8fe7aa463428', 'AAA', '啊啊啊啊啊', '啊啊啊啊啊', 0, '管理员', '25719710465130536', 2, 0, '2018-08-23 22:05:23', ''),
('993088a0-a6e0-11e8-894d-f1bb96268349', '毕业照已发布', '请大家查看自己的毕业照', '请大家查看自己的毕业照', 0, '管理员', '25719710465130536', 2, 0, '2018-08-23 22:27:00', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/1535034393503-5UHPa7y_Z.jpg'),
('f2db89d0-a6dc-11e8-8807-2f1880f777d1', 'test', 'test', 'test', 0, '管理员', '25719710465130536', 1, 1, '2018-08-23 22:00:53', '');

-- --------------------------------------------------------

--
-- 表的结构 `homework_inform_class`
--

CREATE TABLE `homework_inform_class` (
  `id` varchar(255) NOT NULL,
  `homework_inform_id` varchar(255) NOT NULL,
  `class_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `homework_inform_class`
--

INSERT INTO `homework_inform_class` (`id`, `homework_inform_id`, `class_id`) VALUES
('25719710465130588', 'f2db89d0-a6dc-11e8-8807-2f1880f777d1', '25719710465130536'),
('25719710465130589', '93cdee50-a6dd-11e8-a7e5-8fe7aa463428', '25719710465130536'),
('25719710465130590', '993088a0-a6e0-11e8-894d-f1bb96268349', '25719710465130536'),
('25719710465130593', '6ab14c70-a740-11e8-8dca-318f8e7e7a3e', '25719710465130537'),
('25719710465130594', '72cea150-a740-11e8-8dca-318f8e7e7a3e', '25719710465130536'),
('25719710465130595', '7e3a36d0-a740-11e8-8dca-318f8e7e7a3e', '25719710465130536'),
('25719710465130596', '8814f320-a740-11e8-8dca-318f8e7e7a3e', '25719710465130536'),
('25719710465130597', '91495d50-a740-11e8-8dca-318f8e7e7a3e', '25719710465130536'),
('25719710465130598', '77ad81a0-a880-11e8-87fb-a97be195be2a', '25719710465130536'),
('25719710465130608', '00849be0-aa01-11e8-84e0-43a3500297d2', '25719710465130536');

-- --------------------------------------------------------

--
-- 表的结构 `navigation`
--

CREATE TABLE `navigation` (
  `id` varchar(255) NOT NULL,
  `key_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `level` int(5) NOT NULL,
  `state` varchar(32) NOT NULL DEFAULT 'on',
  `nav_order` int(10) NOT NULL,
  `img` varchar(255) NOT NULL,
  `img_active` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `navigation`
--

INSERT INTO `navigation` (`id`, `key_name`, `name`, `url`, `level`, `state`, `nav_order`, `img`, `img_active`) VALUES
('25719710465130510', 'administrative', '行政简讯', '/pages/core/administrative/administrative', 0, 'on', 1, '/images/core/administrative/administrative.png', '/images/core/administrative/administrative@active.png'),
('25719710465130511', 'notice', '公告新闻', '/pages/core/notice/notice', 0, 'off', 2, '/images/core/notice/notice.png', '/images/core/notice/notice@active.png'),
('25719710465130513', 'homework', '班级作业', '/pages/core/homework/homework', 0, 'on', 3, '/images/core/homework/homework.png', '/images/core/homework/homework@active.png'),
('25719710465130514', 'class_inform', '班级消息', '/pages/core/class_inform/class_inform', 0, 'on', 4, '/images/core/class_inform/class_inform.png', '/images/core/class_inform/class_inform@active.png');

-- --------------------------------------------------------

--
-- 表的结构 `notice`
--

CREATE TABLE `notice` (
  `id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `summary` varchar(255) NOT NULL,
  `publisher` varchar(255) NOT NULL,
  `level` int(5) NOT NULL,
  `publish_time` datetime NOT NULL,
  `pictures` varchar(600) NOT NULL,
  `notice_type` int(5) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `notice`
--

INSERT INTO `notice` (`id`, `title`, `content`, `summary`, `publisher`, `level`, `publish_time`, `pictures`, `notice_type`) VALUES
('25719710465130512', '关于贸易战的通知', '说一句题外话。电影《一代宗师》中，叶问准备接宫老爷子武林泰斗的班。凭什么接？宫老爷子出题，“比想法”。高手过招，先比想法。拳分南北，国能分南北吗？比的是家国观念和大局意识，是近代中国在列强环伺之下，武术界有没有凝聚人心的胸怀和能力。\r\n\r\n其实，热兵器时代，一炮轰来，遍地狼烟，再好的拳脚也都是些小打小闹。《一代宗师》讲的道理，是只要人心不散、想法不乱，国家民族就有希望。', '说一句题外话。电影《一代宗师》中，叶问准备接宫老爷子武林泰斗的班。凭什么接？', 'admin', 999, '2018-08-13 02:00:00', '', 1),
('25719710465130599', '停气通知', '明天早上八点到晚上六点停气 请各位班主任注意', '明天早上八点到晚上六点停气 请各位班主任注意', '管理员', 1, '2018-08-27 17:23:19', '', 1),
('25719710465130607', '各单位注意', '军训正式开始', '军训正式开始', '管理员', 1, '2018-08-27 21:17:51', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/1535375860116-GLxGPTeT3.jpg', 1),
('25719710465130609', '465', '456789', '456789', '管理员', 1, '2018-08-29 22:36:59', '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `parent`
--

CREATE TABLE `parent` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `class_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `parent`
--

INSERT INTO `parent` (`id`, `name`, `phone`, `description`, `class_id`) VALUES
('25719710465130500', '张华', '15388478188', '张强的家长', '25719710465130536'),
('25719710465130516', '小林', '15388478189', '李华的家长', '25719710465130538'),
('25719710465130517', '张强', '15388478185', '张思思的家长', '25719710465130538');

-- --------------------------------------------------------

--
-- 表的结构 `student`
--

CREATE TABLE `student` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `class_id` varchar(255) NOT NULL,
  `parent_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `subject`
--

CREATE TABLE `subject` (
  `value` int(32) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `subject`
--

INSERT INTO `subject` (`value`, `title`) VALUES
(0, '消息'),
(1, '语文'),
(2, '数学'),
(3, '英语'),
(4, '美术'),
(5, '计算机');

-- --------------------------------------------------------

--
-- 表的结构 `teacher`
--

CREATE TABLE `teacher` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `teacher_type` int(11) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `teacher`
--

INSERT INTO `teacher` (`id`, `name`, `phone`, `teacher_type`, `description`) VALUES
('25719710465130501', '李林', '15388478188', 1, '校长');

-- --------------------------------------------------------

--
-- 表的结构 `teacher_class`
--

CREATE TABLE `teacher_class` (
  `id` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `teacher_id` varchar(255) NOT NULL,
  `class_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `teacher_class`
--

INSERT INTO `teacher_class` (`id`, `phone`, `teacher_id`, `class_id`) VALUES
('25719710465130554', '15388478188', '25719710465130501', '25719710465130536'),
('25719710465130556', '15388478188', '25719710465130501', '25719710465130537'),
('25719710465130557', '15388478188', '25719710465130501', '25719710465130538');

-- --------------------------------------------------------

--
-- 表的结构 `type_level`
--

CREATE TABLE `type_level` (
  `id` varchar(255) NOT NULL,
  `user_type` int(5) NOT NULL,
  `level` int(5) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `type_level`
--

INSERT INTO `type_level` (`id`, `user_type`, `level`, `description`) VALUES
('25719710465130529', 0, 0, '管理员'),
('25719710465130531', 1, 2, '普通教师'),
('25719710465130532', 1, 1, '行政'),
('25719710465130533', 1, 3, '代课教师'),
('25719710465130534', 1, 4, '临时工'),
('25719710465130535', 2, 1, '家长');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` varchar(255) NOT NULL,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `user_type` int(5) NOT NULL,
  `level` int(5) DEFAULT '4'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `phone`, `user_type`, `level`) VALUES
('25719710465130502', '张华', '111111', '15388478181', 1, 0),
('25719710465130503', '李林', '222222', '15388478188', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class_category`
--
ALTER TABLE `class_category`
  ADD PRIMARY KEY (`value`);

--
-- Indexes for table `homework_information`
--
ALTER TABLE `homework_information`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `homework_inform_class`
--
ALTER TABLE `homework_inform_class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `navigation`
--
ALTER TABLE `navigation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parent`
--
ALTER TABLE `parent`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`value`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `teacher_class`
--
ALTER TABLE `teacher_class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_level`
--
ALTER TABLE `type_level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `username` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
