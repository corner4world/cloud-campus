/*
 Navicat Premium Data Transfer

 Source Server         : cd-cdb-o72e6rm0.sql.tencentcdb.com
 Source Server Type    : MySQL
 Source Server Version : 50628
 Source Host           : cd-cdb-o72e6rm0.sql.tencentcdb.com:63733
 Source Schema         : campus_cloud

 Target Server Type    : MySQL
 Target Server Version : 50628
 File Encoding         : 65001

 Date: 01/09/2018 13:13:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for client_homework_inform_class
-- ----------------------------
DROP TABLE IF EXISTS `client_homework_inform_class`;
CREATE TABLE `client_homework_inform_class`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `homework_inform_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `class_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of client_homework_inform_class
-- ----------------------------
INSERT INTO `client_homework_inform_class` VALUES ('25719710465130588', 'f2db89d0-a6dc-11e8-8807-2f1880f777d1', '25719710465130536');
INSERT INTO `client_homework_inform_class` VALUES ('25719710465130589', '93cdee50-a6dd-11e8-a7e5-8fe7aa463428', '25719710465130536');
INSERT INTO `client_homework_inform_class` VALUES ('25719710465130590', '993088a0-a6e0-11e8-894d-f1bb96268349', '25719710465130536');
INSERT INTO `client_homework_inform_class` VALUES ('25719710465130593', '6ab14c70-a740-11e8-8dca-318f8e7e7a3e', '25719710465130537');
INSERT INTO `client_homework_inform_class` VALUES ('25719710465130594', '72cea150-a740-11e8-8dca-318f8e7e7a3e', '25719710465130536');
INSERT INTO `client_homework_inform_class` VALUES ('25719710465130595', '7e3a36d0-a740-11e8-8dca-318f8e7e7a3e', '25719710465130536');
INSERT INTO `client_homework_inform_class` VALUES ('25719710465130596', '8814f320-a740-11e8-8dca-318f8e7e7a3e', '25719710465130536');
INSERT INTO `client_homework_inform_class` VALUES ('25719710465130597', '91495d50-a740-11e8-8dca-318f8e7e7a3e', '25719710465130536');
INSERT INTO `client_homework_inform_class` VALUES ('25719710465130598', '77ad81a0-a880-11e8-87fb-a97be195be2a', '25719710465130536');
INSERT INTO `client_homework_inform_class` VALUES ('25719710465130608', '00849be0-aa01-11e8-84e0-43a3500297d2', '25719710465130536');

-- ----------------------------
-- Table structure for client_homework_information
-- ----------------------------
DROP TABLE IF EXISTS `client_homework_information`;
CREATE TABLE `client_homework_information`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `level` int(5) NOT NULL DEFAULT 1,
  `publisher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `class_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `publish_type` int(20) NOT NULL DEFAULT 0,
  `homework_type_value` int(32) NOT NULL,
  `publish_time` datetime(0) NULL DEFAULT NULL,
  `pictures` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of client_homework_information
-- ----------------------------
INSERT INTO `client_homework_information` VALUES ('00849be0-aa01-11e8-84e0-43a3500297d2', '数学作业', '数学作业哈 数学作业', '数学作业哈 数学作业', 0, '管理员', '25719710465130536', 1, 2, '2018-08-27 21:56:31', '');
INSERT INTO `client_homework_information` VALUES ('6ab14c70-a740-11e8-8dca-318f8e7e7a3e', 'A', 'A', 'A', 0, '管理员', '25719710465130537', 2, 1, '2018-08-25 09:52:54', '');
INSERT INTO `client_homework_information` VALUES ('72cea150-a740-11e8-8dca-318f8e7e7a3e', 'b', 'B', 'B', 0, '管理员', '25719710465130536', 2, 2, '2018-08-26 09:53:08', '');
INSERT INTO `client_homework_information` VALUES ('77ad81a0-a880-11e8-87fb-a97be195be2a', '123465', '123465', '123465', 0, '管理员', '25719710465130536', 2, 0, '2018-08-26 00:03:55', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/1535212933112-bzrwhFqca.jpg,https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/1535212934123-Ss7QpcS8d.jpg,https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/1535212934932-hZZwKOWLA.jpg,https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/1535212935670-E7KsTdnCW.jpg,https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/1535212936374-XFKOmTmFJs.jpg,https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/1535212937028-VlUUUerLS.jpg');
INSERT INTO `client_homework_information` VALUES ('7e3a36d0-a740-11e8-8dca-318f8e7e7a3e', 'c', 'c', 'c', 0, '管理员', '25719710465130536', 2, 3, '2018-08-23 09:53:27', '');
INSERT INTO `client_homework_information` VALUES ('8814f320-a740-11e8-8dca-318f8e7e7a3e', 'd', 'd', 'd', 0, '管理员', '25719710465130536', 2, 4, '2018-08-23 09:53:43', '');
INSERT INTO `client_homework_information` VALUES ('91495d50-a740-11e8-8dca-318f8e7e7a3e', 'q', 'q', 'q', 0, '管理员', '25719710465130536', 2, 5, '2018-08-16 09:53:59', '');
INSERT INTO `client_homework_information` VALUES ('93cdee50-a6dd-11e8-a7e5-8fe7aa463428', 'AAA', '啊啊啊啊啊', '啊啊啊啊啊', 0, '管理员', '25719710465130536', 2, 0, '2018-08-23 22:05:23', '');
INSERT INTO `client_homework_information` VALUES ('993088a0-a6e0-11e8-894d-f1bb96268349', '毕业照已发布', '请大家查看自己的毕业照', '请大家查看自己的毕业照', 0, '管理员', '25719710465130536', 2, 0, '2018-08-23 22:27:00', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/1535034393503-5UHPa7y_Z.jpg');
INSERT INTO `client_homework_information` VALUES ('f2db89d0-a6dc-11e8-8807-2f1880f777d1', 'test', 'test', 'test', 0, '管理员', '25719710465130536', 1, 1, '2018-08-23 22:00:53', '');

-- ----------------------------
-- Table structure for client_lass_category
-- ----------------------------
DROP TABLE IF EXISTS `client_lass_category`;
CREATE TABLE `client_lass_category`  (
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`value`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of client_lass_category
-- ----------------------------
INSERT INTO `client_lass_category` VALUES ('25719710465130536', '1年级1班');
INSERT INTO `client_lass_category` VALUES ('25719710465130537', '1年级2班');
INSERT INTO `client_lass_category` VALUES ('25719710465130538', '1年级3班');
INSERT INTO `client_lass_category` VALUES ('25719710465130539', '2年级1班');
INSERT INTO `client_lass_category` VALUES ('25719710465130540', '2年级2班');
INSERT INTO `client_lass_category` VALUES ('25719710465130541', '2年级3班');
INSERT INTO `client_lass_category` VALUES ('25719710465130542', '3年级1班');
INSERT INTO `client_lass_category` VALUES ('25719710465130543', '3年级2班');
INSERT INTO `client_lass_category` VALUES ('25719710465130544', '3年级3班');
INSERT INTO `client_lass_category` VALUES ('25719710465130545', '4年级1班');
INSERT INTO `client_lass_category` VALUES ('25719710465130546', '4年级2班');
INSERT INTO `client_lass_category` VALUES ('25719710465130547', '4年级3班');
INSERT INTO `client_lass_category` VALUES ('25719710465130548', '5年级1班');
INSERT INTO `client_lass_category` VALUES ('25719710465130549', '5年级2班');
INSERT INTO `client_lass_category` VALUES ('25719710465130550', '5年级3班');
INSERT INTO `client_lass_category` VALUES ('25719710465130551', '6年级1班');
INSERT INTO `client_lass_category` VALUES ('25719710465130552', '6年级2班');
INSERT INTO `client_lass_category` VALUES ('25719710465130553', '6年级3班');

-- ----------------------------
-- Table structure for client_navigation
-- ----------------------------
DROP TABLE IF EXISTS `client_navigation`;
CREATE TABLE `client_navigation`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `key_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `level` int(5) NOT NULL,
  `state` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'on',
  `nav_order` int(10) NOT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `img_active` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of client_navigation
-- ----------------------------
INSERT INTO `client_navigation` VALUES ('25719710465130510', 'administrative', '行政简讯', '/pages/core/administrative/administrative', 0, 'on', 1, '/images/core/administrative/administrative.png', '/images/core/administrative/administrative@active.png');
INSERT INTO `client_navigation` VALUES ('25719710465130511', 'notice', '公告新闻', '/pages/core/notice/notice', 0, 'on', 2, '/images/core/notice/notice.png', '/images/core/notice/notice@active.png');
INSERT INTO `client_navigation` VALUES ('25719710465130513', 'homework', '班级作业', '/pages/core/homework/homework', 0, 'on', 3, '/images/core/homework/homework.png', '/images/core/homework/homework@active.png');
INSERT INTO `client_navigation` VALUES ('25719710465130514', 'class_inform', '班级消息', '/pages/core/class_inform/class_inform', 0, 'on', 4, '/images/core/class_inform/class_inform.png', '/images/core/class_inform/class_inform@active.png');

-- ----------------------------
-- Table structure for client_notice
-- ----------------------------
DROP TABLE IF EXISTS `client_notice`;
CREATE TABLE `client_notice`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `publisher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `level` int(5) NOT NULL,
  `publish_time` datetime(0) NULL,
  `pictures` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `notice_type` int(5) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of client_notice
-- ----------------------------
INSERT INTO `client_notice` VALUES ('25719710465130512', '关于贸易战的通知', '说一句题外话。电影《一代宗师》中，叶问准备接宫老爷子武林泰斗的班。凭什么接？宫老爷子出题，“比想法”。高手过招，先比想法。拳分南北，国能分南北吗？比的是家国观念和大局意识，是近代中国在列强环伺之下，武术界有没有凝聚人心的胸怀和能力。\r\n\r\n其实，热兵器时代，一炮轰来，遍地狼烟，再好的拳脚也都是些小打小闹。《一代宗师》讲的道理，是只要人心不散、想法不乱，国家民族就有希望。', '说一句题外话。电影《一代宗师》中，叶问准备接宫老爷子武林泰斗的班。凭什么接？', 'admin', 999, '2018-08-13 02:00:00', '', 1);
INSERT INTO `client_notice` VALUES ('25719710465130599', '停气通知', '明天早上八点到晚上六点停气 请各位班主任注意', '明天早上八点到晚上六点停气 请各位班主任注意', '管理员', 1, '2018-08-27 17:23:19', '', 1);
INSERT INTO `client_notice` VALUES ('25719710465130607', '各单位注意', '军训正式开始', '军训正式开始', '管理员', 1, '2018-08-27 21:17:51', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/1535375860116-GLxGPTeT3.jpg', 1);

-- ----------------------------
-- Table structure for client_parent
-- ----------------------------
DROP TABLE IF EXISTS `client_parent`;
CREATE TABLE `client_parent`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `class_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of client_parent
-- ----------------------------
INSERT INTO `client_parent` VALUES ('25719710465130500', '张华', '15388478188', '张强的家长', '25719710465130536');
INSERT INTO `client_parent` VALUES ('25719710465130516', '小林', '15388478189', '李华的家长', '25719710465130538');
INSERT INTO `client_parent` VALUES ('25719710465130517', '张强', '15388478185', '张思思的家长', '25719710465130538');

-- ----------------------------
-- Table structure for client_student
-- ----------------------------
DROP TABLE IF EXISTS `client_student`;
CREATE TABLE `client_student`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `class_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for client_subject
-- ----------------------------
DROP TABLE IF EXISTS `client_subject`;
CREATE TABLE `client_subject`  (
  `value` int(32) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`value`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of client_subject
-- ----------------------------
INSERT INTO `client_subject` VALUES (0, '消息');
INSERT INTO `client_subject` VALUES (1, '语文');
INSERT INTO `client_subject` VALUES (2, '数学');
INSERT INTO `client_subject` VALUES (3, '英语');
INSERT INTO `client_subject` VALUES (4, '美术');
INSERT INTO `client_subject` VALUES (5, '计算机');

-- ----------------------------
-- Table structure for client_teacher
-- ----------------------------
DROP TABLE IF EXISTS `client_teacher`;
CREATE TABLE `client_teacher`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher_type` int(11) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of client_teacher
-- ----------------------------
INSERT INTO `client_teacher` VALUES ('25719710465130501', '李林', '15388478188', 1, '校长');

-- ----------------------------
-- Table structure for client_teacher_class
-- ----------------------------
DROP TABLE IF EXISTS `client_teacher_class`;
CREATE TABLE `client_teacher_class`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `class_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of client_teacher_class
-- ----------------------------
INSERT INTO `client_teacher_class` VALUES ('25719710465130554', '15388478188', '25719710465130501', '25719710465130536');
INSERT INTO `client_teacher_class` VALUES ('25719710465130556', '15388478188', '25719710465130501', '25719710465130537');
INSERT INTO `client_teacher_class` VALUES ('25719710465130557', '15388478188', '25719710465130501', '25719710465130538');

-- ----------------------------
-- Table structure for client_type_level
-- ----------------------------
DROP TABLE IF EXISTS `client_type_level`;
CREATE TABLE `client_type_level`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_type` int(5) NOT NULL,
  `level` int(5) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of client_type_level
-- ----------------------------
INSERT INTO `client_type_level` VALUES ('25719710465130529', 0, 0, '管理员');
INSERT INTO `client_type_level` VALUES ('25719710465130531', 1, 2, '普通教师');
INSERT INTO `client_type_level` VALUES ('25719710465130532', 1, 1, '行政');
INSERT INTO `client_type_level` VALUES ('25719710465130533', 1, 3, '代课教师');
INSERT INTO `client_type_level` VALUES ('25719710465130534', 1, 4, '临时工');
INSERT INTO `client_type_level` VALUES ('25719710465130535', 2, 1, '家长');

-- ----------------------------
-- Table structure for client_user
-- ----------------------------
DROP TABLE IF EXISTS `client_user`;
CREATE TABLE `client_user`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_type` int(5) NOT NULL,
  `level` int(5) NULL DEFAULT 4,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of client_user
-- ----------------------------
INSERT INTO `client_user` VALUES ('25719710465130502', '张华', '111111', '15388478181', 1, 0);
INSERT INTO `client_user` VALUES ('25719710465130503', '李林', '222222', '15388478188', 1, 1);

SET FOREIGN_KEY_CHECKS = 1;
