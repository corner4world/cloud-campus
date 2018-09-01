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

 Date: 01/09/2018 13:05:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blog_article
-- ----------------------------
DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题,input,NO,false,true,true',
  `sub_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '副标题,input,YES,false,false,false',
  `marks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '摘要,textarea,YES,false,false,false',
  `show_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示图片,uploadImg,YES,false,false,false',
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章类型,radio,YES,false,true,true',
  `out_link_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外链地址,input,YES,false,false,false',
  `resources` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源,input,YES,false,true,false',
  `publist_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间,timer,YES,false,true,true',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容,editor,NO,false,true,true',
  `text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纯文字文章内容,textarea,YES,false,false,false',
  `click` int(11) NULL DEFAULT NULL COMMENT '浏览量,0,YES,false,false,false',
  `channel_id` bigint(20) NULL DEFAULT NULL COMMENT '栏目ID,0,YES,false,false,false',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序值,0,YES,false,false,false',
  `is_top` bit(1) NULL DEFAULT NULL COMMENT '是否置顶,switch,YES,true,true,false',
  `is_recommend` bit(1) NULL DEFAULT NULL COMMENT '是否推荐,switch,YES,true,true,false',
  `status` int(11) NULL DEFAULT NULL COMMENT '文章状态,0,YES,false,false,false',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '博客内容,1,uploadImg-showPic-YES,timer-publistTime-YES,editor-co' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of blog_article
-- ----------------------------
INSERT INTO `blog_article` VALUES (10, 'AAAAAAAA', NULL, '由各种物质组成的巨型球状天体，叫做星球。星球有一定的形状，有自己的运行轨道。', NULL, '1', NULL, NULL, '2018-08-26 08:00:00', '<p style=\'text-align: center;\'><img src=\'http://pic.58pic.com/58pic/15/86/11/51Y58PICQHR_1024.jpg\' style=\'max-width:100%;\'><br></p><p style=\'text-align: center;\'>nihao</p><p style=\'text-align: center;\'><br></p><p><video style=\'width:100%\' src=\'https://chimee.org/vod/1.mp4\' controls=\'\'>     您的浏览器不支持Video标签。 </video></p><p style=\'text-align: center;\'><br></p><p style=\'text-align: center;\'><br></p>', 'nihao     您的浏览器不支持Video标签。 ', NULL, 2, 0, b'0', b'0', NULL, '2018-08-26 14:16:03', 1, '2018-08-26 14:26:39', 1, NULL, 0);

-- ----------------------------
-- Table structure for blog_article_tags
-- ----------------------------
DROP TABLE IF EXISTS `blog_article_tags`;
CREATE TABLE `blog_article_tags`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `article_id` bigint(20) NOT NULL COMMENT '文章ID,0,NO,false,false,false',
  `tags_id` bigint(20) NOT NULL COMMENT '标签ID,0,NO,false,false,false',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标签-文章关联表,3' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for blog_channel
-- ----------------------------
DROP TABLE IF EXISTS `blog_channel`;
CREATE TABLE `blog_channel`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称,input,NO,false,true,true',
  `site_id` bigint(20) NULL DEFAULT NULL COMMENT '站点ID,0,YES,false,false,false',
  `href` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接地址,input,YES,false,true,true',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '栏目图标,input,YES,false,true,false',
  `is_base_channel` bit(1) NULL DEFAULT NULL COMMENT '是否为主栏目,switch,YES,true,true,true',
  `can_comment` bit(1) NULL DEFAULT NULL COMMENT '是否能够评论,switch,YES,true,true,true',
  `is_no_name` bit(1) NULL DEFAULT NULL COMMENT '是否匿名,switch,YES,true,true,true',
  `is_can_aduit` bit(1) NULL DEFAULT NULL COMMENT '是否开启审核,switch,YES,true,true,true',
  `seo_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网页title(seo),input,YES,false,false,false',
  `seo_keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网页关键字(seo) ,input,YES,false,false,false',
  `seo_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网页描述(seo),textarea,YES,false,false,false',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父节点ID',
  `parent_ids` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父节点联集',
  `level` bigint(2) NULL DEFAULT NULL COMMENT '层级深度',
  `sort` smallint(6) NULL DEFAULT NULL COMMENT '排序',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '博客栏目,2,switch-baseChannel-YES-true-is_base_channel,switch-ca' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of blog_channel
-- ----------------------------
INSERT INTO `blog_channel` VALUES (1, '网站首页', 1, '/index', '', b'0', b'0', b'0', b'0', NULL, NULL, NULL, NULL, '1,', 1, 60, '2018-01-22 11:55:24', 1, '2018-01-23 00:37:57', 1, NULL, 0);
INSERT INTO `blog_channel` VALUES (2, '文章专栏', 1, '/wzzl', '', b'1', b'1', b'0', b'0', NULL, NULL, NULL, NULL, '2,', 1, 50, '2018-01-22 11:55:56', 1, '2018-02-03 21:41:52', 1, NULL, 0);
INSERT INTO `blog_channel` VALUES (3, '资源分享', 1, '/share', '', b'0', b'0', b'0', b'0', NULL, NULL, NULL, NULL, '3,', 1, 10, '2018-01-22 11:56:50', 1, '2018-02-06 11:20:48', 1, NULL, 0);
INSERT INTO `blog_channel` VALUES (4, '点点滴滴', 1, '/dddd', '', b'0', b'0', b'0', b'0', NULL, NULL, NULL, NULL, '4,', 1, 30, '2018-01-22 11:57:16', 1, '2018-02-08 01:37:32', 1, NULL, 0);
INSERT INTO `blog_channel` VALUES (5, '关于本站', 1, '/about', '', b'0', b'0', b'0', b'0', NULL, NULL, NULL, NULL, '5,', 1, 20, '2018-01-22 11:57:40', 1, '2018-02-06 00:14:18', 1, NULL, 0);
INSERT INTO `blog_channel` VALUES (6, '通知', 1, '/tz', NULL, b'0', b'0', b'0', b'0', NULL, NULL, NULL, NULL, '6,', 1, 0, '2018-01-22 11:59:01', 1, '2018-01-22 23:25:40', 1, NULL, 0);
INSERT INTO `blog_channel` VALUES (7, '更新日志', 1, '/gxrz', NULL, b'0', b'0', b'0', b'0', NULL, NULL, NULL, NULL, '7,', 1, -1, '2018-01-22 23:37:25', 1, '2018-01-22 23:37:38', 1, NULL, 0);
INSERT INTO `blog_channel` VALUES (9, 'H5', 1, '/wzzl/h5', NULL, b'1', b'0', b'0', b'0', NULL, NULL, NULL, 2, '2,9,', 2, 0, '2018-01-27 01:34:24', 1, '2018-01-27 01:46:23', 1, NULL, 0);
INSERT INTO `blog_channel` VALUES (10, 'mysql', 1, '/wzzl/mysql', NULL, b'1', b'0', b'0', b'0', NULL, NULL, NULL, 2, '2,10,', 2, 10, '2018-01-27 01:34:42', 1, '2018-01-27 01:46:17', 1, NULL, 0);
INSERT INTO `blog_channel` VALUES (11, 'springboot', 1, '/wzzl/springboot', NULL, b'1', b'0', b'0', b'0', NULL, NULL, NULL, 2, '2,11,', 2, 20, '2018-01-27 01:35:05', 1, '2018-01-27 01:46:09', 1, NULL, 0);
INSERT INTO `blog_channel` VALUES (12, 'mybatis', 1, '/wzzl/mybatis', NULL, b'1', b'0', b'0', b'0', NULL, NULL, NULL, 2, '2,12,', 2, 30, '2018-01-27 01:35:18', 1, '2018-01-27 01:46:02', 1, NULL, 0);
INSERT INTO `blog_channel` VALUES (13, 'IDE', 1, '/wzzl/ide', NULL, b'1', b'1', b'0', b'0', NULL, NULL, NULL, 2, '2,13,', 2, 40, '2018-01-27 01:35:44', 1, '2018-02-04 04:00:11', 1, NULL, 0);
INSERT INTO `blog_channel` VALUES (14, 'java', 1, '/wzzl/java', NULL, b'1', b'1', b'0', b'0', NULL, NULL, NULL, 2, '2,14,', 2, 50, '2018-01-27 01:35:56', 1, '2018-02-04 02:04:20', 1, NULL, 0);
INSERT INTO `blog_channel` VALUES (15, '留言墙', 1, '/about/messages', NULL, b'0', b'1', b'0', b'0', NULL, NULL, NULL, 5, '5,15,', 2, 0, '2018-02-05 21:27:13', 1, '2018-02-06 00:07:04', 1, NULL, 0);
INSERT INTO `blog_channel` VALUES (16, '友情链接', 1, '/about/friendlink', NULL, b'0', b'0', b'0', b'0', NULL, NULL, NULL, 5, '5,16,', 2, 10, '2018-02-05 21:27:33', 1, '2018-02-06 00:06:30', 1, NULL, 0);
INSERT INTO `blog_channel` VALUES (17, '关于作者', 1, '/about/author', NULL, b'0', b'0', b'0', b'0', NULL, NULL, NULL, 5, '5,17,', 2, 20, '2018-02-05 21:27:51', 1, '2018-02-06 00:06:18', 1, NULL, 0);
INSERT INTO `blog_channel` VALUES (18, '关于博客', 1, '/about/blog', NULL, b'0', b'0', b'0', b'0', NULL, NULL, NULL, 5, '5,18,', 2, 30, '2018-02-05 21:28:09', 1, '2018-02-05 23:14:56', 1, NULL, 0);
INSERT INTO `blog_channel` VALUES (19, '首页banner图', 1, '/sybannert', NULL, b'0', b'0', b'0', b'0', NULL, NULL, NULL, NULL, '19,', 1, 1, '2018-02-07 10:31:12', 1, '2018-02-07 10:31:21', 1, NULL, 0);

-- ----------------------------
-- Table structure for blog_comment
-- ----------------------------
DROP TABLE IF EXISTS `blog_comment`;
CREATE TABLE `blog_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容,textarea,NO,false,true,true',
  `type` int(11) NULL DEFAULT NULL COMMENT 'ip,input,YES,false,true,true',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip,input,YES,false,true,true',
  `system` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作系统,input,YES,false,true,false',
  `browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览器,input,YES,false,true,false',
  `floor` int(11) NULL DEFAULT NULL COMMENT '楼层,0,YES,false,false,false',
  `channel_id` bigint(20) NULL DEFAULT NULL COMMENT '栏目ID,0,YES,false,false,false',
  `article_id` int(11) NULL DEFAULT NULL COMMENT '文章ID,0,YES,false,false,false',
  `reply_id` bigint(20) NULL DEFAULT NULL COMMENT '回复评论ID,0,YES,false,false,false',
  `is_admin_reply` bit(1) NULL DEFAULT NULL COMMENT '管理员是否回复,switch,YES,true,true,true',
  `reply_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '管理员回复内容,textarea,YES,false,true,false',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '博客评论,1,switch-adminReply-YES-true-is_admin_reply' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for blog_tags
-- ----------------------------
DROP TABLE IF EXISTS `blog_tags`;
CREATE TABLE `blog_tags`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签名字,input,YES,false,true,true',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序,0,YES,false,false,false',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '博客标签,1' ROW_FORMAT = Compact;

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

-- ----------------------------
-- Table structure for hat_area
-- ----------------------------
DROP TABLE IF EXISTS `hat_area`;
CREATE TABLE `hat_area`  (
  `id` int(11) NOT NULL,
  `areaID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `father` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of hat_area
-- ----------------------------
INSERT INTO `hat_area` VALUES (1, '110101', '东城区', '110100');
INSERT INTO `hat_area` VALUES (2, '110102', '西城区', '110100');
INSERT INTO `hat_area` VALUES (3, '110103', '崇文区', '110100');
INSERT INTO `hat_area` VALUES (4, '110104', '宣武区', '110100');
INSERT INTO `hat_area` VALUES (5, '110105', '朝阳区', '110100');
INSERT INTO `hat_area` VALUES (6, '110106', '丰台区', '110100');
INSERT INTO `hat_area` VALUES (7, '110107', '石景山区', '110100');
INSERT INTO `hat_area` VALUES (8, '110108', '海淀区', '110100');
INSERT INTO `hat_area` VALUES (9, '110109', '门头沟区', '110100');
INSERT INTO `hat_area` VALUES (10, '110111', '房山区', '110100');
INSERT INTO `hat_area` VALUES (11, '110112', '通州区', '110100');
INSERT INTO `hat_area` VALUES (12, '110113', '顺义区', '110100');
INSERT INTO `hat_area` VALUES (13, '110114', '昌平区', '110100');
INSERT INTO `hat_area` VALUES (14, '110115', '大兴区', '110100');
INSERT INTO `hat_area` VALUES (15, '110116', '怀柔区', '110100');
INSERT INTO `hat_area` VALUES (16, '110117', '平谷区', '110100');
INSERT INTO `hat_area` VALUES (17, '110228', '密云县', '110200');
INSERT INTO `hat_area` VALUES (18, '110229', '延庆县', '110200');
INSERT INTO `hat_area` VALUES (19, '120101', '和平区', '120100');
INSERT INTO `hat_area` VALUES (20, '120102', '河东区', '120100');
INSERT INTO `hat_area` VALUES (21, '120103', '河西区', '120100');
INSERT INTO `hat_area` VALUES (22, '120104', '南开区', '120100');
INSERT INTO `hat_area` VALUES (23, '120105', '河北区', '120100');
INSERT INTO `hat_area` VALUES (24, '120106', '红桥区', '120100');
INSERT INTO `hat_area` VALUES (25, '120107', '塘沽区', '120100');
INSERT INTO `hat_area` VALUES (26, '120108', '汉沽区', '120100');
INSERT INTO `hat_area` VALUES (27, '120109', '大港区', '120100');
INSERT INTO `hat_area` VALUES (28, '120110', '东丽区', '120100');
INSERT INTO `hat_area` VALUES (29, '120111', '西青区', '120100');
INSERT INTO `hat_area` VALUES (30, '120112', '津南区', '120100');
INSERT INTO `hat_area` VALUES (31, '120113', '北辰区', '120100');
INSERT INTO `hat_area` VALUES (32, '120114', '武清区', '120100');
INSERT INTO `hat_area` VALUES (33, '120115', '宝坻区', '120100');
INSERT INTO `hat_area` VALUES (34, '120221', '宁河县', '120200');
INSERT INTO `hat_area` VALUES (35, '120223', '静海县', '120200');
INSERT INTO `hat_area` VALUES (36, '120225', '蓟　县', '120200');
INSERT INTO `hat_area` VALUES (37, '130101', '市辖区', '130100');
INSERT INTO `hat_area` VALUES (38, '130102', '长安区', '130100');
INSERT INTO `hat_area` VALUES (39, '130103', '桥东区', '130100');
INSERT INTO `hat_area` VALUES (40, '130104', '桥西区', '130100');
INSERT INTO `hat_area` VALUES (41, '130105', '新华区', '130100');
INSERT INTO `hat_area` VALUES (42, '130107', '井陉矿区', '130100');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 93184 kB; (`SCHED_NAME` `TRIGGER_NAME` `TRIGGER_GROUP`) REFER `camp' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 93184 kB; (`SCHED_NAME` `TRIGGER_NAME` `TRIGGER_GROUP`) REFER `camp' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('MySiteForMeScheduler', 'TASK_1', 'DEFAULT', '0 0 1 * * ?', 'GMT+08:00');
INSERT INTO `qrtz_cron_triggers` VALUES ('MySiteForMeScheduler', 'TASK_2', 'DEFAULT', '0 0 1 * * ?', 'GMT+08:00');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(140) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` bigint(19) NOT NULL,
  `SCHED_TIME` bigint(19) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` tinyint(1) NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` tinyint(1) NOT NULL,
  `IS_NONCONCURRENT` tinyint(1) NOT NULL,
  `IS_UPDATE_DATA` tinyint(1) NOT NULL,
  `REQUESTS_RECOVERY` tinyint(1) NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('MySiteForMeScheduler', 'TASK_1', 'DEFAULT', NULL, 'com.mysiteforme.admin.util.quartz.ScheduleJob', 0, 0, 0, 0, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720027636F6D2E6D7973697465666F726D652E61646D696E2E656E746974792E51756172747A5461736B00000000000000010200064C000463726F6E7400124C6A6176612F6C616E672F537472696E673B4C00046E616D6571007E00094C0006706172616D7371007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B4C000A7461726765744265616E71007E00094C000B74726765744D6574686F6471007E000978720025636F6D2E6D7973697465666F726D652E61646D696E2E626173652E44617461456E7469747900000000000000010200084C000A637265617465446174657400104C6A6176612F7574696C2F446174653B4C000863726561746549647400104C6A6176612F6C616E672F4C6F6E673B4C000A637265617465557365727400234C636F6D2F6D7973697465666F726D652F61646D696E2F656E746974792F557365723B4C000764656C466C61677400134C6A6176612F6C616E672F426F6F6C65616E3B4C000772656D61726B7371007E00094C000A7570646174654461746571007E000C4C0008757064617465496471007E000D4C000A7570646174655573657271007E000E78720025636F6D2E6D7973697465666F726D652E61646D696E2E626173652E42617365456E74697479F87065A24F9EB43D0200014C0002696471007E000D7872002B636F6D2E62616F6D69646F752E6D796261746973706C75732E6163746976657265636F72642E4D6F64656C000000000000000102000078707372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000017372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016132EF0DB7787371007E0013000000000000000170737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C7565787000707371007E001677080000016132EF0DB87871007E00187074000B3020302031202A202A203F74001BE5908CE6ADA5E69687E7ABA0E6B58FE8A788E9878FE695B0E68DAE740000737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00140000000074000A73797374656D5461736B74001A73796E6368726F6E697A6174696F6E41727469636C65566965777800);
INSERT INTO `qrtz_job_details` VALUES ('MySiteForMeScheduler', 'TASK_2', 'DEFAULT', NULL, 'com.mysiteforme.admin.util.quartz.ScheduleJob', 0, 0, 0, 0, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720027636F6D2E6D7973697465666F726D652E61646D696E2E656E746974792E51756172747A5461736B00000000000000010200064C000463726F6E7400124C6A6176612F6C616E672F537472696E673B4C00046E616D6571007E00094C0006706172616D7371007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B4C000A7461726765744265616E71007E00094C000B74726765744D6574686F6471007E000978720025636F6D2E6D7973697465666F726D652E61646D696E2E626173652E44617461456E7469747900000000000000010200084C000A637265617465446174657400104C6A6176612F7574696C2F446174653B4C000863726561746549647400104C6A6176612F6C616E672F4C6F6E673B4C000A637265617465557365727400234C636F6D2F6D7973697465666F726D652F61646D696E2F656E746974792F557365723B4C000764656C466C61677400134C6A6176612F6C616E672F426F6F6C65616E3B4C000772656D61726B7371007E00094C000A7570646174654461746571007E000C4C0008757064617465496471007E000D4C000A7570646174655573657271007E000E78720025636F6D2E6D7973697465666F726D652E61646D696E2E626173652E42617365456E74697479F87065A24F9EB43D0200014C0002696471007E000D7872002B636F6D2E62616F6D69646F752E6D796261746973706C75732E6163746976657265636F72642E4D6F64656C000000000000000102000078707372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000027372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001613F9BEBCB787371007E0013000000000000000170737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C7565787000740031E7949FE68890E69687E7ABA0E6909CE7B4A2E7B4A2E5BC95EFBC8CE6AF8FE5A4A9E6999AE4B88A31E782B9E689A7E8A18C7371007E00167708000001613F9BEBCB7871007E00187074000B3020302031202A202A203F740018E7949FE68890E69687E7ABA0E6909CE7B4A2E7B4A2E5BC9574000131737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00140000000074000A73797374656D5461736B74001263726561746541727469636C65496E6465787800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('MySiteForMeScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('MySiteForMeScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(19) NOT NULL,
  `CHECKIN_INTERVAL` bigint(19) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('MySiteForMeScheduler', 'MSI1535264087312', 1535281016202, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 93184 kB; (`SCHED_NAME` `TRIGGER_NAME` `TRIGGER_GROUP`) REFER `camp' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INT_PROP_1` int(11) NULL DEFAULT NULL,
  `INT_PROP_2` int(11) NULL DEFAULT NULL,
  `LONG_PROP_1` bigint(20) NULL DEFAULT NULL,
  `LONG_PROP_2` bigint(20) NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` tinyint(1) NULL DEFAULT NULL,
  `BOOL_PROP_2` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 93184 kB; (`SCHED_NAME` `TRIGGER_NAME` `TRIGGER_GROUP`) REFER `camp' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(19) NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(19) NULL DEFAULT NULL,
  `PRIORITY` int(11) NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint(19) NOT NULL,
  `END_TIME` bigint(19) NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_J`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_C`(`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_T_G`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_STATE`(`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_STATE`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 93184 kB; (`SCHED_NAME` `JOB_NAME` `JOB_GROUP`) REFER `campus_cloud' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('MySiteForMeScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', NULL, 1535302800000, -1, 5, 'WAITING', 'CRON', 1516977982000, 0, NULL, 2, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720027636F6D2E6D7973697465666F726D652E61646D696E2E656E746974792E51756172747A5461736B00000000000000010200064C000463726F6E7400124C6A6176612F6C616E672F537472696E673B4C00046E616D6571007E00094C0006706172616D7371007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B4C000A7461726765744265616E71007E00094C000B74726765744D6574686F6471007E000978720025636F6D2E6D7973697465666F726D652E61646D696E2E626173652E44617461456E7469747900000000000000010200084C000A637265617465446174657400104C6A6176612F7574696C2F446174653B4C000863726561746549647400104C6A6176612F6C616E672F4C6F6E673B4C000A637265617465557365727400234C636F6D2F6D7973697465666F726D652F61646D696E2F656E746974792F557365723B4C000764656C466C61677400134C6A6176612F6C616E672F426F6F6C65616E3B4C000772656D61726B7371007E00094C000A7570646174654461746571007E000C4C0008757064617465496471007E000D4C000A7570646174655573657271007E000E78720025636F6D2E6D7973697465666F726D652E61646D696E2E626173652E42617365456E74697479F87065A24F9EB43D0200014C0002696471007E000D7872002B636F6D2E62616F6D69646F752E6D796261746973706C75732E6163746976657265636F72642E4D6F64656C000000000000000102000078707372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000017372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016132EF0E187871007E001570737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C7565787000740022E6AF8FE5A4A9E5878CE699A831E782B9E9929FE689A7E8A18CE8AFA5E4BBBBE58AA17371007E0016770800000161336910787871007E00157074000B3020302031202A202A203F74001BE5908CE6ADA5E69687E7ABA0E6B58FE8A788E9878FE695B0E68DAE74000131737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00140000000074000A73797374656D5461736B74001A73796E6368726F6E697A6174696F6E41727469636C65566965777800);
INSERT INTO `qrtz_triggers` VALUES ('MySiteForMeScheduler', 'TASK_2', 'DEFAULT', 'TASK_2', 'DEFAULT', NULL, 1535302800000, -1, 5, 'WAITING', 'CRON', 1517190638000, 0, NULL, 2, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720027636F6D2E6D7973697465666F726D652E61646D696E2E656E746974792E51756172747A5461736B00000000000000010200064C000463726F6E7400124C6A6176612F6C616E672F537472696E673B4C00046E616D6571007E00094C0006706172616D7371007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B4C000A7461726765744265616E71007E00094C000B74726765744D6574686F6471007E000978720025636F6D2E6D7973697465666F726D652E61646D696E2E626173652E44617461456E7469747900000000000000010200084C000A637265617465446174657400104C6A6176612F7574696C2F446174653B4C000863726561746549647400104C6A6176612F6C616E672F4C6F6E673B4C000A637265617465557365727400234C636F6D2F6D7973697465666F726D652F61646D696E2F656E746974792F557365723B4C000764656C466C61677400134C6A6176612F6C616E672F426F6F6C65616E3B4C000772656D61726B7371007E00094C000A7570646174654461746571007E000C4C0008757064617465496471007E000D4C000A7570646174655573657271007E000E78720025636F6D2E6D7973697465666F726D652E61646D696E2E626173652E42617365456E74697479F87065A24F9EB43D0200014C0002696471007E000D7872002B636F6D2E62616F6D69646F752E6D796261746973706C75732E6163746976657265636F72642E4D6F64656C000000000000000102000078707372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000027372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001613F9BED98787371007E0013000000000000000170737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C7565787000740031E7949FE68890E69687E7ABA0E6909CE7B4A2E7B4A2E5BC95EFBC8CE6AF8FE5A4A9E6999AE4B88A31E782B9E689A7E8A18C7371007E00167708000001613F9BED987871007E00187074000B3020302031202A202A203F740018E7949FE68890E69687E7ABA0E6909CE7B4A2E7B4A2E5BC9574000131737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00140000000074000A73797374656D5461736B74001263726561746541727469636C65496E6465787800);

-- ----------------------------
-- Table structure for quartz_task
-- ----------------------------
DROP TABLE IF EXISTS `quartz_task`;
CREATE TABLE `quartz_task`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称,input,YES,false,true,true',
  `cron` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务表达式,input,YES,false,true,false',
  `target_bean` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行的类,input,YES,false,true,false',
  `trget_method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行方法,input,YES,false,true,false',
  `params` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行参数,textarea,YES,false,false,false',
  `status` int(11) NULL DEFAULT NULL COMMENT '任务状态,radio,YES,false,true,true',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务,1' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of quartz_task
-- ----------------------------
INSERT INTO `quartz_task` VALUES (1, '同步文章浏览量数据', '0 0 1 * * ?', 'systemTask', 'synchronizationArticleView', '1', 0, '2018-01-26 22:46:23', 1, '2018-01-27 00:59:39', 1, '每天凌晨1点钟执行该任务', 0);
INSERT INTO `quartz_task` VALUES (2, '生成文章搜索索引', '0 0 1 * * ?', 'systemTask', 'createArticleIndex', '1', 0, '2018-01-29 09:50:39', 1, '2018-01-29 09:50:39', 1, '生成文章搜索索引，每天晚上1点执行', 0);

-- ----------------------------
-- Table structure for quartz_task_log
-- ----------------------------
DROP TABLE IF EXISTS `quartz_task_log`;
CREATE TABLE `quartz_task_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `job_id` bigint(20) NULL DEFAULT NULL COMMENT '任务ID,0,YES,false,false,false',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '定时任务名称,input,YES,false,true,true',
  `target_bean` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '定制任务执行类,input,YES,false,true,false',
  `trget_method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '定时任务执行方法,input,YES,false,true,false',
  `params` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行参数,input,YES,false,true,false',
  `status` int(11) NULL DEFAULT NULL COMMENT '任务状态,0,YES,false,false,false',
  `error` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '异常消息,textarea,YES,false,false,false',
  `times` int(11) NULL DEFAULT NULL COMMENT '执行时间,input,YES,false,true,false',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务执行日志,1' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据值',
  `label` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '标签名',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '类型',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述',
  `sort` int(10) NULL DEFAULT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '父级编号',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_dict_value`(`value`) USING BTREE,
  INDEX `sys_dict_label`(`label`) USING BTREE,
  INDEX `sys_dict_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 125 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '字典表,测试表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (1, '0', '否', 'is_or_not', '系统字段', 0, '0', '1', '2018-01-05 20:38:12', '1', '2018-01-05 20:38:15', NULL, '0');
INSERT INTO `sys_dict` VALUES (2, '1', '是', 'is_or_not', '系统字段', 1, '0', '1', '2018-01-05 20:38:40', '1', '2018-01-05 20:38:44', NULL, '0');
INSERT INTO `sys_dict` VALUES (3, 'qiniu', '七牛云存储', 'sys_rescource_source', '系统字段', 0, '0', '1', '2018-01-14 06:39:57', '1', '2018-01-14 06:39:57', NULL, '0');
INSERT INTO `sys_dict` VALUES (4, 'oss', '阿里云存储', 'sys_rescource_source', '系统字段', 1, '0', '1', '2018-01-14 06:39:57', '1', '2018-01-14 06:39:57', NULL, '0');
INSERT INTO `sys_dict` VALUES (108, '2333', '我的标签2', 'you_sign', NULL, 2, '0', '1', '2018-01-16 16:03:12', '1', '2018-01-16 17:52:15', NULL, '0');
INSERT INTO `sys_dict` VALUES (110, '322', '他的标签', 'you_sign', '我', 3, '0', '1', '2018-01-16 17:52:49', '1', '2018-01-16 18:02:37', NULL, '0');
INSERT INTO `sys_dict` VALUES (121, '1', '本站文章', 'blog_article_category', '博客内容-文章类型(此数据为系统自动创建:数据表【blog_article】中的字段【category】对应的值)', 0, '0', '1', '2018-01-17 16:05:45', '1', '2018-01-17 16:05:45', NULL, '0');
INSERT INTO `sys_dict` VALUES (122, '2', '外链', 'blog_article_category', '博客内容-文章类型(此数据为系统自动创建:数据表【blog_article】中的字段【category】对应的值)', 1, '0', '1', '2018-01-17 16:05:45', '1', '2018-01-17 16:05:45', NULL, '0');
INSERT INTO `sys_dict` VALUES (123, '0', '正常', 'quartz_task_status', '定时任务-任务状态(此数据为系统自动创建:数据表【quartz_task】中的字段【status】对应的值)', 0, '0', '1', '2018-01-24 23:41:56', '1', '2018-01-24 23:41:56', NULL, '0');
INSERT INTO `sys_dict` VALUES (124, '1', '暂停', 'quartz_task_status', '定时任务-任务状态(此数据为系统自动创建:数据表【quartz_task】中的字段【status】对应的值)', 1, '0', '1', '2018-01-24 23:41:56', '1', '2018-01-24 23:41:56', NULL, '0');

-- ----------------------------
-- Table structure for sys_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_group`;
CREATE TABLE `sys_group`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分组名称',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父分组ID',
  `level` bigint(2) NULL DEFAULT NULL,
  `parent_ids` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分组序列号',
  `sort` smallint(6) NULL DEFAULT NULL COMMENT '分组排序值',
  `create_by` bigint(20) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` tinyint(2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_group_ur
-- ----------------------------
DROP TABLE IF EXISTS `sys_group_ur`;
CREATE TABLE `sys_group_ur`  (
  `group_id` bigint(20) NOT NULL COMMENT '分组ID',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '请求类型',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '日志标题',
  `remote_addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作IP地址',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作用户昵称',
  `request_uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '请求URI',
  `http_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作方式',
  `class_method` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '请求类型.方法',
  `params` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '操作提交的数据',
  `session_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'sessionId',
  `response` longtext CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '返回内容',
  `use_time` bigint(11) NULL DEFAULT NULL COMMENT '方法执行时间',
  `browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '浏览器信息',
  `area` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '地区',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '省',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '市',
  `isp` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '网络服务提供商',
  `exception` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '异常信息',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(64) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `del_flag` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_log_create_by`(`create_by`) USING BTREE,
  INDEX `sys_log_request_uri`(`request_uri`) USING BTREE,
  INDEX `sys_log_type`(`type`) USING BTREE,
  INDEX `sys_log_create_date`(`create_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 352 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '系统日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@ef1ad26\"]', '8310d5c4-f6ef-4937-8d20-e1c6c6cdb915', '{\"success\":false,\"message\":\"验证码错误\"}', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 13:52:23', 1, '2018-02-08 13:52:23', NULL, b'0');
INSERT INTO `sys_log` VALUES (2, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@62d0e7fe\"]', '8310d5c4-f6ef-4937-8d20-e1c6c6cdb915', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 23, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 13:52:31', 1, '2018-02-08 13:52:31', NULL, b'0');
INSERT INTO `sys_log` VALUES (3, '普通请求', '跳转系统字典页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/dict/list', 'GET', 'com.mysiteforme.admin.controller.system.DictController.list', '[]', '8310d5c4-f6ef-4937-8d20-e1c6c6cdb915', '\"admin/system/dict/list\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 13:52:45', 1, '2018-02-08 13:52:45', NULL, b'0');
INSERT INTO `sys_log` VALUES (4, '普通请求', '跳转数据表列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/table/list', 'GET', 'com.mysiteforme.admin.controller.system.TableController.list', '[]', '8310d5c4-f6ef-4937-8d20-e1c6c6cdb915', '\"admin/system/table/list\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 13:52:47', 1, '2018-02-08 13:52:47', NULL, b'0');
INSERT INTO `sys_log` VALUES (5, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', '8310d5c4-f6ef-4937-8d20-e1c6c6cdb915', '\"admin/system/site/show\"', 5, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 13:52:50', 1, '2018-02-08 13:52:50', NULL, b'0');
INSERT INTO `sys_log` VALUES (6, 'Ajax请求', '文件上传', '127.0.0.1', '我是管理员', 'http://localhost:8080/file/upload/', 'POST', 'com.mysiteforme.admin.controller.system.FileController.uploadFile', '[\"org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@22e5ee11\"]', '8310d5c4-f6ef-4937-8d20-e1c6c6cdb915', '{\"data\":{\"name\":\"500fd9f9d72a6059099ccd5a2334349b023bbae5.jpg\",\"url\":\"http://ow9lg82yy.bkt.clouddn.com/5c876355-a989-4bed-bc83-f7f2b49485b5.jpg\"},\"success\":true,\"message\":\"成功\"}', 1661, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 13:53:04', 1, '2018-02-08 13:53:04', NULL, b'0');
INSERT INTO `sys_log` VALUES (7, '普通请求', '跳转系统字典页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/dict/list', 'GET', 'com.mysiteforme.admin.controller.system.TableController.list', '[]', '8310d5c4-f6ef-4937-8d20-e1c6c6cdb915', '\"admin/system/dict/list\"', 12, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 13:54:41', 1, '2018-02-08 13:54:41', NULL, b'0');
INSERT INTO `sys_log` VALUES (8, '普通请求', '跳转系统字典页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/dict/list', 'GET', 'com.mysiteforme.admin.controller.system.TableController.list', '[]', '8310d5c4-f6ef-4937-8d20-e1c6c6cdb915', '\"admin/system/dict/list\"', 12, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 13:54:41', 1, '2018-02-08 13:54:41', NULL, b'0');
INSERT INTO `sys_log` VALUES (9, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', '8310d5c4-f6ef-4937-8d20-e1c6c6cdb915', '\"admin/system/site/show\"', 16, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 13:54:41', 1, '2018-02-08 13:54:41', NULL, b'0');
INSERT INTO `sys_log` VALUES (10, 'Ajax请求', '文件上传', '127.0.0.1', '我是管理员', 'http://localhost:8080/file/upload/', 'POST', 'com.mysiteforme.admin.controller.system.FileController.uploadFile', '[\"org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@5e2345af\"]', '8310d5c4-f6ef-4937-8d20-e1c6c6cdb915', '{\"data\":{\"name\":\"500fd9f9d72a6059099ccd5a2334349b023bbae5.jpg\",\"url\":\"http://ow9lg82yy.bkt.clouddn.com/5c876355-a989-4bed-bc83-f7f2b49485b5.jpg\"},\"success\":true,\"message\":\"成功\"}', 190, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 13:54:49', 1, '2018-02-08 13:54:49', NULL, b'0');
INSERT INTO `sys_log` VALUES (11, 'Ajax请求', '文件上传', '127.0.0.1', '我是管理员', 'http://localhost:8080/file/upload/', 'POST', 'com.mysiteforme.admin.controller.system.FileController.uploadFile', '[\"org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@7f6d59a4\"]', '8310d5c4-f6ef-4937-8d20-e1c6c6cdb915', '{\"data\":{\"name\":\"500fd9f9d72a6059099ccd5a2334349b023bbae5.jpg\",\"url\":\"http://ow9lg82yy.bkt.clouddn.com/5c876355-a989-4bed-bc83-f7f2b49485b5.jpg\"},\"success\":true,\"message\":\"成功\"}', 19, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 13:56:11', 1, '2018-02-08 13:56:11', NULL, b'0');
INSERT INTO `sys_log` VALUES (12, 'Ajax请求', '文件上传', '127.0.0.1', '我是管理员', 'http://localhost:8080/file/upload/', 'POST', 'com.mysiteforme.admin.controller.system.FileController.uploadFile', '[\"org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@72be943\"]', '8310d5c4-f6ef-4937-8d20-e1c6c6cdb915', '{\"data\":{\"name\":\"dongri.jpg\",\"url\":\"https://static.mysiteforme.com/77861034-25ef-4856-87ec-24da18398ecf.jpg\"},\"success\":true,\"message\":\"成功\"}', 19645, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 13:58:03', 1, '2018-02-08 13:58:03', NULL, b'0');
INSERT INTO `sys_log` VALUES (13, 'Ajax请求', '文件上传', '127.0.0.1', '我是管理员', 'http://localhost:8080/file/upload/', 'POST', 'com.mysiteforme.admin.controller.system.FileController.uploadFile', '[\"org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@4c9c00d9\"]', '8310d5c4-f6ef-4937-8d20-e1c6c6cdb915', '{\"data\":{\"name\":\"500fd9f9d72a6059099ccd5a2334349b023bbae5.jpg\",\"url\":\"http://ow9lg82yy.bkt.clouddn.com/5c876355-a989-4bed-bc83-f7f2b49485b5.jpg\"},\"success\":true,\"message\":\"成功\"}', 9975, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 13:58:46', 1, '2018-02-08 13:58:46', NULL, b'0');
INSERT INTO `sys_log` VALUES (14, 'Ajax请求', '文件上传', '127.0.0.1', '我是管理员', 'http://localhost:8080/file/upload/', 'POST', 'com.mysiteforme.admin.controller.system.FileController.uploadFile', '[\"org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@351269f6\"]', '8310d5c4-f6ef-4937-8d20-e1c6c6cdb915', '{\"data\":{\"name\":\"500fd9f9d72a6059099ccd5a2334349b023bbae5.jpg\",\"url\":\"https://static.mysiteforme.com/04ea0ce0-e53b-4eb3-b1ea-dc316063d29f.jpg\"},\"success\":true,\"message\":\"成功\"}', 6153, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 13:59:10', 1, '2018-02-08 13:59:10', NULL, b'0');
INSERT INTO `sys_log` VALUES (15, 'Ajax请求', '保存网站基本数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/edit', 'POST', 'com.mysiteforme.admin.controller.system.SiteController.edit', '[{\"address\":\"江苏-苏州\",\"author\":\"wangl\",\"authorIcon\":\"https://static.mysiteforme.com/04ea0ce0-e53b-4eb3-b1ea-dc316063d29f.jpg\",\"database\":\"mysql\",\"delFlag\":false,\"description\":\"网站描述\",\"email\":\"1115784675@qq.com\",\"git\":\"https://gitee.com/wanglingxiao/\",\"github\":\"https://github.com/wangl1989\",\"id\":1,\"keywords\":\"\",\"logo\":\"http://ow9lg82yy.bkt.clouddn.com/24f5c360-485d-4a6d-9468-2a61c353cf37.ico\",\"maxUpload\":2,\"name\":\"孤独的旅行家\",\"noName\":false,\"openMessage\":true,\"phone\":\"13776055179\",\"powerby\":\"\",\"qq\":\"1115784675\",\"record\":\"苏ICP备17063650号\",\"remarks\":\"<p>89年小码农一只,从事java后台开发</p><p><br></p>\",\"server\":\"windows\",\"url\":\"https://mysiteforme.com/\",\"version\":\"1.0\",\"weibo\":\"https://weibo.com/u/2173866382\"}]', '8310d5c4-f6ef-4937-8d20-e1c6c6cdb915', '{\"success\":true,\"message\":\"成功\"}', 37, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 13:59:22', 1, '2018-02-08 13:59:22', NULL, b'0');
INSERT INTO `sys_log` VALUES (16, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', '8310d5c4-f6ef-4937-8d20-e1c6c6cdb915', '\"admin/system/site/show\"', 9, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 13:59:25', 1, '2018-02-08 13:59:25', NULL, b'0');
INSERT INTO `sys_log` VALUES (17, '普通请求', '跳转系统字典页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/dict/list', 'GET', 'com.mysiteforme.admin.controller.system.DictController.list', '[]', '8310d5c4-f6ef-4937-8d20-e1c6c6cdb915', '\"admin/system/dict/list\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 13:59:48', 1, '2018-02-08 13:59:48', NULL, b'0');
INSERT INTO `sys_log` VALUES (18, '普通请求', '跳转数据表列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/table/list', 'GET', 'com.mysiteforme.admin.controller.system.TableController.list', '[]', '8310d5c4-f6ef-4937-8d20-e1c6c6cdb915', '\"admin/system/table/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 13:59:48', 1, '2018-02-08 13:59:48', NULL, b'0');
INSERT INTO `sys_log` VALUES (19, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', '8310d5c4-f6ef-4937-8d20-e1c6c6cdb915', '\"admin/system/site/show\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 13:59:48', 1, '2018-02-08 13:59:48', NULL, b'0');
INSERT INTO `sys_log` VALUES (20, '普通请求', '退出系统', '127.0.0.1', '我是管理员', 'http://localhost:8080/systemLogout', 'GET', 'com.mysiteforme.admin.controller.LoginController.logOut', '[]', '8310d5c4-f6ef-4937-8d20-e1c6c6cdb915', '\"redirect:/login\"', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, NULL, '2018-02-08 13:59:57', NULL, '2018-02-08 13:59:57', NULL, b'0');
INSERT INTO `sys_log` VALUES (21, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@1f02bcc0\"]', '541d6888-510d-4d3b-ad8c-5f3af16cbf4f', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 62, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 14:00:04', 1, '2018-02-08 14:00:04', NULL, b'0');
INSERT INTO `sys_log` VALUES (22, 'Ajax请求', '文件上传', '127.0.0.1', '我是管理员', 'http://localhost:8080/file/upload/', 'POST', 'com.mysiteforme.admin.controller.system.FileController.uploadFile', '[\"org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@5fcf9f57\"]', '541d6888-510d-4d3b-ad8c-5f3af16cbf4f', '{\"data\":{\"name\":\"500fd9f9d72a6059099ccd5a2334349b023bbae5.jpg\",\"url\":\"https://static.mysiteforme.com/04ea0ce0-e53b-4eb3-b1ea-dc316063d29f.jpg\"},\"success\":true,\"message\":\"成功\"}', 6785, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 14:01:00', 1, '2018-02-08 14:01:00', NULL, b'0');
INSERT INTO `sys_log` VALUES (23, 'Ajax请求', '系统用户个人信息修改', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/saveUserinfo', 'POST', 'com.mysiteforme.admin.controller.system.UserConteroller.saveUserInfo', '[{\"delFlag\":false,\"email\":\"b@qq.com\",\"icon\":\"https://static.mysiteforme.com/04ea0ce0-e53b-4eb3-b1ea-dc316063d29f.jpg\",\"id\":1,\"loginName\":\"test\",\"menus\":[],\"nickName\":\"我是管理员\",\"remarks\":\"\",\"roleLists\":[],\"tel\":\"13776055179\"}]', '541d6888-510d-4d3b-ad8c-5f3af16cbf4f', '{\"success\":true,\"message\":\"成功\"}', 34, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 14:01:07', 1, '2018-02-08 14:01:07', NULL, b'0');
INSERT INTO `sys_log` VALUES (24, '普通请求', '跳转系统字典页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/dict/list', 'GET', 'com.mysiteforme.admin.controller.system.DictController.list', '[]', '541d6888-510d-4d3b-ad8c-5f3af16cbf4f', '\"admin/system/dict/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 14:01:21', 1, '2018-02-08 14:01:21', NULL, b'0');
INSERT INTO `sys_log` VALUES (25, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', '541d6888-510d-4d3b-ad8c-5f3af16cbf4f', '\"admin/system/site/show\"', 5, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 14:01:23', 1, '2018-02-08 14:01:23', NULL, b'0');
INSERT INTO `sys_log` VALUES (26, '普通请求', '跳转系统字典页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/dict/list', 'GET', 'com.mysiteforme.admin.controller.system.DictController.list', '[]', '541d6888-510d-4d3b-ad8c-5f3af16cbf4f', '\"admin/system/dict/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 14:07:20', 1, '2018-02-08 14:07:20', NULL, b'0');
INSERT INTO `sys_log` VALUES (27, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', '541d6888-510d-4d3b-ad8c-5f3af16cbf4f', '\"admin/system/site/show\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 14:07:20', 1, '2018-02-08 14:07:20', NULL, b'0');
INSERT INTO `sys_log` VALUES (28, 'Ajax请求', '保存网站基本数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/edit', 'POST', 'com.mysiteforme.admin.controller.system.SiteController.edit', '[{\"address\":\"江苏-苏州\",\"author\":\"wangl\",\"authorIcon\":\"https://static.mysiteforme.com/04ea0ce0-e53b-4eb3-b1ea-dc316063d29f.jpg\",\"database\":\"mysql\",\"delFlag\":false,\"description\":\"网站描述\",\"email\":\"1115784675@qq.com\",\"git\":\"https://gitee.com/wanglingxiao/\",\"github\":\"https://github.com/wangl1989\",\"id\":1,\"keywords\":\"\",\"logo\":\"http://ow9lg82yy.bkt.clouddn.com/24f5c360-485d-4a6d-9468-2a61c353cf37.ico\",\"maxUpload\":2,\"name\":\"孤独的旅行家\",\"noName\":false,\"openMessage\":true,\"phone\":\"13776055179\",\"powerby\":\"\",\"qq\":\"1115784675\",\"record\":\"苏ICP备17063650号\",\"remarks\":\"23333\",\"server\":\"windows\",\"url\":\"https://mysiteforme.com/\",\"version\":\"1.0\",\"weibo\":\"https://weibo.com/u/2173866382\"}]', '541d6888-510d-4d3b-ad8c-5f3af16cbf4f', '{\"success\":true,\"message\":\"成功\"}', 16, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 14:07:28', 1, '2018-02-08 14:07:28', NULL, b'0');
INSERT INTO `sys_log` VALUES (29, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', '541d6888-510d-4d3b-ad8c-5f3af16cbf4f', '\"admin/system/site/show\"', 5, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 14:07:31', 1, '2018-02-08 14:07:31', NULL, b'0');
INSERT INTO `sys_log` VALUES (30, '普通请求', '跳转系统字典页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/dict/list', 'GET', 'com.mysiteforme.admin.controller.system.DictController.list', '[]', '541d6888-510d-4d3b-ad8c-5f3af16cbf4f', '\"admin/system/dict/list\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 14:15:50', 1, '2018-02-08 14:15:50', NULL, b'0');
INSERT INTO `sys_log` VALUES (31, '普通请求', '跳转系统字典页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/dict/list', 'GET', 'com.mysiteforme.admin.controller.system.DictController.list', '[]', '541d6888-510d-4d3b-ad8c-5f3af16cbf4f', '\"admin/system/dict/list\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 14:16:04', 1, '2018-02-08 14:16:04', NULL, b'0');
INSERT INTO `sys_log` VALUES (32, '普通请求', '跳转数据表列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/table/list', 'GET', 'com.mysiteforme.admin.controller.system.TableController.list', '[]', '541d6888-510d-4d3b-ad8c-5f3af16cbf4f', '\"admin/system/table/list\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 14:16:09', 1, '2018-02-08 14:16:09', NULL, b'0');
INSERT INTO `sys_log` VALUES (33, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', '541d6888-510d-4d3b-ad8c-5f3af16cbf4f', '\"admin/system/site/show\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 14:16:10', 1, '2018-02-08 14:16:10', NULL, b'0');
INSERT INTO `sys_log` VALUES (34, '普通请求', '跳转资源展示列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/rescource/list', 'GET', 'com.mysiteforme.admin.controller.system.RescourceController.list', '[]', '541d6888-510d-4d3b-ad8c-5f3af16cbf4f', '\"admin/system/rescource/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 14:16:13', 1, '2018-02-08 14:16:13', NULL, b'0');
INSERT INTO `sys_log` VALUES (35, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', '541d6888-510d-4d3b-ad8c-5f3af16cbf4f', '\"admin/system/menu/test\"', 5, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 14:16:15', 1, '2018-02-08 14:16:15', NULL, b'0');
INSERT INTO `sys_log` VALUES (36, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.mysiteforme.admin.controller.system.RoleController.list', '[]', '541d6888-510d-4d3b-ad8c-5f3af16cbf4f', '\"admin/system/role/list\"', 5, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 14:16:23', 1, '2018-02-08 14:16:23', NULL, b'0');
INSERT INTO `sys_log` VALUES (37, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', '541d6888-510d-4d3b-ad8c-5f3af16cbf4f', '\"admin/system/user/list\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 14:16:24', 1, '2018-02-08 14:16:24', NULL, b'0');
INSERT INTO `sys_log` VALUES (38, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '541d6888-510d-4d3b-ad8c-5f3af16cbf4f', '\"/admin/blogArticle/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 14:16:26', 1, '2018-02-08 14:16:26', NULL, b'0');
INSERT INTO `sys_log` VALUES (39, '普通请求', '跳转定时任务列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/quartzTask/list', 'GET', 'com.mysiteforme.admin.controller.QuartzTaskController.list', '[]', '541d6888-510d-4d3b-ad8c-5f3af16cbf4f', '\"/admin/quartzTask/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 14:16:58', 1, '2018-02-08 14:16:58', NULL, b'0');
INSERT INTO `sys_log` VALUES (40, '普通请求', '跳转任务执行日志列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/quartzTaskLog/list', 'GET', 'com.mysiteforme.admin.controller.QuartzTaskLogController.list', '[]', '541d6888-510d-4d3b-ad8c-5f3af16cbf4f', '\"/admin/quartzTaskLog/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-02-08 14:17:00', 1, '2018-02-08 14:17:00', NULL, b'0');
INSERT INTO `sys_log` VALUES (41, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@3a7380ec\"]', 'c903873e-e508-46cb-a975-55088516110e', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 865, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 11:58:09', 1, '2018-03-13 11:58:09', NULL, b'0');
INSERT INTO `sys_log` VALUES (42, '普通请求', '跳转系统字典页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/dict/list', 'GET', 'com.mysiteforme.admin.controller.system.DictController.list', '[]', 'c903873e-e508-46cb-a975-55088516110e', '\"admin/system/dict/list\"', 20, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 11:59:50', 1, '2018-03-13 11:59:50', NULL, b'0');
INSERT INTO `sys_log` VALUES (43, '普通请求', '跳转数据表列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/table/list', 'GET', 'com.mysiteforme.admin.controller.system.TableController.list', '[]', 'c903873e-e508-46cb-a975-55088516110e', '\"admin/system/table/list\"', 12, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 11:59:56', 1, '2018-03-13 11:59:56', NULL, b'0');
INSERT INTO `sys_log` VALUES (44, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', 'c903873e-e508-46cb-a975-55088516110e', '\"admin/system/site/show\"', 16, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 11:59:59', 1, '2018-03-13 11:59:59', NULL, b'0');
INSERT INTO `sys_log` VALUES (45, '普通请求', '跳转资源展示列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/rescource/list', 'GET', 'com.mysiteforme.admin.controller.system.RescourceController.list', '[]', 'c903873e-e508-46cb-a975-55088516110e', '\"admin/system/rescource/list\"', 11, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 12:00:02', 1, '2018-03-13 12:00:02', NULL, b'0');
INSERT INTO `sys_log` VALUES (46, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', 'c903873e-e508-46cb-a975-55088516110e', '\"admin/system/menu/test\"', 7, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 12:00:03', 1, '2018-03-13 12:00:03', NULL, b'0');
INSERT INTO `sys_log` VALUES (47, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.mysiteforme.admin.controller.system.RoleController.list', '[]', 'c903873e-e508-46cb-a975-55088516110e', '\"admin/system/role/list\"', 11, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 12:00:04', 1, '2018-03-13 12:00:04', NULL, b'0');
INSERT INTO `sys_log` VALUES (48, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'c903873e-e508-46cb-a975-55088516110e', '\"admin/system/user/list\"', 5, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 12:00:06', 1, '2018-03-13 12:00:06', NULL, b'0');
INSERT INTO `sys_log` VALUES (49, '普通请求', '跳转定时任务列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/quartzTask/list', 'GET', 'com.mysiteforme.admin.controller.QuartzTaskController.list', '[]', 'c903873e-e508-46cb-a975-55088516110e', '\"/admin/quartzTask/list\"', 8, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 12:00:15', 1, '2018-03-13 12:00:15', NULL, b'0');
INSERT INTO `sys_log` VALUES (50, '普通请求', '跳转任务执行日志列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/quartzTaskLog/list', 'GET', 'com.mysiteforme.admin.controller.QuartzTaskLogController.list', '[]', 'c903873e-e508-46cb-a975-55088516110e', '\"/admin/quartzTaskLog/list\"', 10, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 12:00:17', 1, '2018-03-13 12:00:17', NULL, b'0');
INSERT INTO `sys_log` VALUES (51, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'c903873e-e508-46cb-a975-55088516110e', '\"/admin/blogArticle/list\"', 8, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 12:00:23', 1, '2018-03-13 12:00:23', NULL, b'0');
INSERT INTO `sys_log` VALUES (52, '普通请求', '跳转博客评论列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogComment/list', 'GET', 'com.mysiteforme.admin.controller.BlogCommentController.list', '[]', 'c903873e-e508-46cb-a975-55088516110e', '\"/admin/blogComment/list\"', 8, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 12:00:25', 1, '2018-03-13 12:00:25', NULL, b'0');
INSERT INTO `sys_log` VALUES (53, '普通请求', '跳转博客栏目列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogChannel/list', 'GET', 'com.mysiteforme.admin.controller.BlogChannelController.list', '[]', 'c903873e-e508-46cb-a975-55088516110e', '\"/admin/blogChannel/list\"', 11, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 12:00:27', 1, '2018-03-13 12:00:27', NULL, b'0');
INSERT INTO `sys_log` VALUES (54, '普通请求', '跳转数据表列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/table/list', 'GET', 'com.mysiteforme.admin.controller.system.TableController.list', '[]', 'c903873e-e508-46cb-a975-55088516110e', '\"admin/system/table/list\"', 4, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 12:02:57', 1, '2018-03-13 12:02:57', NULL, b'0');
INSERT INTO `sys_log` VALUES (55, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', 'c903873e-e508-46cb-a975-55088516110e', '\"admin/system/site/show\"', 16, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 12:02:57', 1, '2018-03-13 12:02:57', NULL, b'0');
INSERT INTO `sys_log` VALUES (56, '普通请求', '跳转资源展示列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/rescource/list', 'GET', 'com.mysiteforme.admin.controller.system.RescourceController.list', '[]', 'c903873e-e508-46cb-a975-55088516110e', '\"admin/system/rescource/list\"', 7, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 12:02:57', 1, '2018-03-13 12:02:57', NULL, b'0');
INSERT INTO `sys_log` VALUES (57, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', 'c903873e-e508-46cb-a975-55088516110e', '\"admin/system/menu/test\"', 11, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 12:02:57', 1, '2018-03-13 12:02:57', NULL, b'0');
INSERT INTO `sys_log` VALUES (58, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.mysiteforme.admin.controller.system.RoleController.list', '[]', 'c903873e-e508-46cb-a975-55088516110e', '\"admin/system/role/list\"', 9, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 12:02:57', 1, '2018-03-13 12:02:57', NULL, b'0');
INSERT INTO `sys_log` VALUES (59, '普通请求', '跳转定时任务列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/quartzTask/list', 'GET', 'com.mysiteforme.admin.controller.QuartzTaskController.list', '[]', 'c903873e-e508-46cb-a975-55088516110e', '\"/admin/quartzTask/list\"', 6, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 12:02:57', 1, '2018-03-13 12:02:57', NULL, b'0');
INSERT INTO `sys_log` VALUES (60, '普通请求', '跳转定时任务列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/quartzTask/list', 'GET', 'com.mysiteforme.admin.controller.QuartzTaskController.list', '[]', 'c903873e-e508-46cb-a975-55088516110e', '\"/admin/quartzTask/list\"', 6, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 12:02:57', 1, '2018-03-13 12:02:57', NULL, b'0');
INSERT INTO `sys_log` VALUES (61, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'c903873e-e508-46cb-a975-55088516110e', '\"/admin/blogArticle/list\"', 12, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 12:02:57', 1, '2018-03-13 12:02:57', NULL, b'0');
INSERT INTO `sys_log` VALUES (62, '普通请求', '跳转博客栏目列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogChannel/list', 'GET', 'com.mysiteforme.admin.controller.BlogChannelController.list', '[]', 'c903873e-e508-46cb-a975-55088516110e', '\"/admin/blogChannel/list\"', 8, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 12:04:19', 1, '2018-03-13 12:04:19', NULL, b'0');
INSERT INTO `sys_log` VALUES (63, '普通请求', '跳转博客评论列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogComment/list', 'GET', 'com.mysiteforme.admin.controller.BlogCommentController.list', '[]', 'c903873e-e508-46cb-a975-55088516110e', '\"/admin/blogComment/list\"', 5, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 12:04:27', 1, '2018-03-13 12:04:27', NULL, b'0');
INSERT INTO `sys_log` VALUES (64, 'Ajax请求', '文件上传', '127.0.0.1', '我是管理员', 'http://localhost:8080/file/upload/', 'POST', 'com.mysiteforme.admin.controller.system.FileController.uploadFile', '[\"org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@570ce68a\"]', 'c903873e-e508-46cb-a975-55088516110e', '{\"data\":{\"name\":\"1b77ae770eedc97a5248b5d1ad88d087.jpg\",\"url\":\"https://static.mysiteforme.com/3e2baf40-f2e5-4b3c-93d1-3f97965017ec.jpg\"},\"success\":true,\"message\":\"成功\"}', 942, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 12:54:36', 1, '2018-03-13 12:54:36', NULL, b'0');
INSERT INTO `sys_log` VALUES (65, 'Ajax请求', '保存新增博客内容数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/add', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.add', '[{\"category\":\"1\",\"channelId\":19,\"content\":\"<p>图片<br></p>\",\"delFlag\":false,\"marks\":\"\",\"publistTime\":1520899200000,\"recommend\":false,\"resources\":\"\",\"showPic\":\"https://static.mysiteforme.com/3e2baf40-f2e5-4b3c-93d1-3f97965017ec.jpg\",\"subTitle\":\"banner\",\"text\":\"图片\",\"title\":\"banner\",\"top\":false}]', 'c903873e-e508-46cb-a975-55088516110e', '{\"success\":true,\"message\":\"成功\"}', 1857, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 12:55:18', 1, '2018-03-13 12:55:18', NULL, b'0');
INSERT INTO `sys_log` VALUES (66, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'c903873e-e508-46cb-a975-55088516110e', '\"/admin/blogArticle/list\"', 7, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 12:55:20', 1, '2018-03-13 12:55:20', NULL, b'0');
INSERT INTO `sys_log` VALUES (67, 'Ajax请求', '请求字段展示数据(全部显示)', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/table/showFields', 'POST', 'com.mysiteforme.admin.controller.system.TableController.showFields', '[\"quartz_task_log\",1]', 'c903873e-e508-46cb-a975-55088516110e', '{\"code\":0,\"count\":8,\"data\":[{\"comment\":\"任务ID\",\"defaultValue\":false,\"dictlist\":[],\"dofor\":\"0\",\"isNullValue\":\"YES\",\"length\":20,\"listIsSearch\":false,\"listIsShow\":false,\"name\":\"job_id\",\"type\":\"BIGINT\"},{\"comment\":\"定时任务名称\",\"defaultValue\":false,\"dictlist\":[],\"dofor\":\"input\",\"isNullValue\":\"YES\",\"length\":255,\"listIsSearch\":true,\"listIsShow\":true,\"name\":\"name\",\"type\":\"VARCHAR\"},{\"comment\":\"定制任务执行类\",\"defaultValue\":false,\"dictlist\":[],\"dofor\":\"input\",\"isNullValue\":\"YES\",\"length\":255,\"listIsSearch\":false,\"listIsShow\":true,\"name\":\"target_bean\",\"type\":\"VARCHAR\"},{\"comment\":\"定时任务执行方法\",\"defaultValue\":false,\"dictlist\":[],\"dofor\":\"input\",\"isNullValue\":\"YES\",\"length\":255,\"listIsSearch\":false,\"listIsShow\":true,\"name\":\"trget_method\",\"type\":\"VARCHAR\"},{\"comment\":\"执行参数\",\"defaultValue\":false,\"dictlist\":[],\"dofor\":\"input\",\"isNullValue\":\"YES\",\"length\":255,\"listIsSearch\":false,\"listIsShow\":true,\"name\":\"params\",\"type\":\"VARCHAR\"},{\"comment\":\"任务状态\",\"defaultValue\":false,\"dictlist\":[],\"dofor\":\"0\",\"isNullValue\":\"YES\",\"length\":11,\"listIsSearch\":false,\"listIsShow\":false,\"name\":\"status\",\"type\":\"INT\"},{\"comment\":\"异常消息\",\"defaultValue\":false,\"dictlist\":[],\"dofor\":\"textarea\",\"isNullValue\":\"YES\",\"listIsSearch\":false,\"listIsShow\":false,\"name\":\"error\",\"type\":\"TEXT\"},{\"comment\":\"执行时间\",\"defaultValue\":false,\"dictlist\":[],\"dofor\":\"input\",\"isNullValue\":\"YES\",\"length\":11,\"listIsSearch\":false,\"listIsShow\":true,\"name\":\"times\",\"type\":\"INT\"}],\"msg\":\"\"}', 36, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 12:58:07', 1, '2018-03-13 12:58:07', NULL, b'0');
INSERT INTO `sys_log` VALUES (68, '普通请求', '跳转系统字典页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/dict/list', 'GET', 'com.mysiteforme.admin.controller.system.DictController.list', '[]', 'c903873e-e508-46cb-a975-55088516110e', '\"admin/system/dict/list\"', 5, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 12:58:26', 1, '2018-03-13 12:58:26', NULL, b'0');
INSERT INTO `sys_log` VALUES (69, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', 'c903873e-e508-46cb-a975-55088516110e', '\"admin/system/table/list\"', 40, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 13:46:29', 1, '2018-03-13 13:46:29', NULL, b'0');
INSERT INTO `sys_log` VALUES (70, '普通请求', '跳转资源展示列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/rescource/list', 'GET', 'com.mysiteforme.admin.controller.system.RescourceController.list', '[]', 'c903873e-e508-46cb-a975-55088516110e', '\"admin/system/site/show\"', 59, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 13:46:29', 1, '2018-03-13 13:46:29', NULL, b'0');
INSERT INTO `sys_log` VALUES (71, '普通请求', '跳转资源展示列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/rescource/list', 'GET', 'com.mysiteforme.admin.controller.system.RescourceController.list', '[]', 'c903873e-e508-46cb-a975-55088516110e', '\"admin/system/site/show\"', 59, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 13:46:29', 1, '2018-03-13 13:46:29', NULL, b'0');
INSERT INTO `sys_log` VALUES (72, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', 'c903873e-e508-46cb-a975-55088516110e', '\"admin/system/menu/test\"', 21, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 13:46:29', 1, '2018-03-13 13:46:29', NULL, b'0');
INSERT INTO `sys_log` VALUES (73, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.mysiteforme.admin.controller.system.RoleController.list', '[]', 'c903873e-e508-46cb-a975-55088516110e', '\"admin/system/role/list\"', 13, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 13:46:29', 1, '2018-03-13 13:46:29', NULL, b'0');
INSERT INTO `sys_log` VALUES (74, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'c903873e-e508-46cb-a975-55088516110e', '\"admin/system/user/list\"', 15, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 13:46:29', 1, '2018-03-13 13:46:29', NULL, b'0');
INSERT INTO `sys_log` VALUES (75, '普通请求', '跳转定时任务列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/quartzTask/list', 'GET', 'com.mysiteforme.admin.controller.QuartzTaskController.list', '[]', 'c903873e-e508-46cb-a975-55088516110e', '\"/admin/quartzTask/list\"', 14, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 13:46:29', 1, '2018-03-13 13:46:29', NULL, b'0');
INSERT INTO `sys_log` VALUES (76, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'c903873e-e508-46cb-a975-55088516110e', '\"/admin/blogArticle/list\"', 15, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 13:46:29', 1, '2018-03-13 13:46:29', NULL, b'0');
INSERT INTO `sys_log` VALUES (77, '普通请求', '跳转系统字典页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/dict/list', 'GET', 'com.mysiteforme.admin.controller.system.DictController.list', '[]', 'c903873e-e508-46cb-a975-55088516110e', '\"admin/system/dict/list\"', 35, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 13:46:30', 1, '2018-03-13 13:46:30', NULL, b'0');
INSERT INTO `sys_log` VALUES (78, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', 'c903873e-e508-46cb-a975-55088516110e', '\"admin/system/site/show\"', 65, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 13:56:05', 1, '2018-03-13 13:56:05', NULL, b'0');
INSERT INTO `sys_log` VALUES (79, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', 'c903873e-e508-46cb-a975-55088516110e', '\"admin/system/site/show\"', 65, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 13:56:05', 1, '2018-03-13 13:56:05', NULL, b'0');
INSERT INTO `sys_log` VALUES (80, '普通请求', '跳转资源展示列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/rescource/list', 'GET', 'com.mysiteforme.admin.controller.system.RescourceController.list', '[]', 'c903873e-e508-46cb-a975-55088516110e', '\"admin/system/rescource/list\"', 22, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 13:56:05', 1, '2018-03-13 13:56:05', NULL, b'0');
INSERT INTO `sys_log` VALUES (81, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', 'c903873e-e508-46cb-a975-55088516110e', '\"admin/system/menu/test\"', 21, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 13:56:05', 1, '2018-03-13 13:56:05', NULL, b'0');
INSERT INTO `sys_log` VALUES (82, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.mysiteforme.admin.controller.system.RoleController.list', '[]', 'c903873e-e508-46cb-a975-55088516110e', '\"admin/system/role/list\"', 13, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 13:56:06', 1, '2018-03-13 13:56:06', NULL, b'0');
INSERT INTO `sys_log` VALUES (83, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'c903873e-e508-46cb-a975-55088516110e', '\"admin/system/user/list\"', 7, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 13:56:06', 1, '2018-03-13 13:56:06', NULL, b'0');
INSERT INTO `sys_log` VALUES (84, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'c903873e-e508-46cb-a975-55088516110e', '\"admin/system/user/list\"', 7, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 13:56:06', 1, '2018-03-13 13:56:06', NULL, b'0');
INSERT INTO `sys_log` VALUES (85, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'c903873e-e508-46cb-a975-55088516110e', '\"/admin/blogArticle/list\"', 61, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 13:56:07', 1, '2018-03-13 13:56:07', NULL, b'0');
INSERT INTO `sys_log` VALUES (86, '普通请求', '跳转系统字典页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/dict/list', 'GET', 'com.mysiteforme.admin.controller.system.DictController.list', '[]', 'c903873e-e508-46cb-a975-55088516110e', '\"admin/system/dict/list\"', 50, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 13:56:07', 1, '2018-03-13 13:56:07', NULL, b'0');
INSERT INTO `sys_log` VALUES (87, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@68a15a0\"]', '7289a6b4-00d5-461c-b61f-b7ebb4c9adbc', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 2478, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 15:16:08', 1, '2018-03-13 15:16:08', NULL, b'0');
INSERT INTO `sys_log` VALUES (88, '普通请求', '跳转数据表列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/table/list', 'GET', 'com.mysiteforme.admin.controller.system.TableController.list', '[]', '7289a6b4-00d5-461c-b61f-b7ebb4c9adbc', '\"admin/system/table/list\"', 26, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 15:16:09', 1, '2018-03-13 15:16:09', NULL, b'0');
INSERT INTO `sys_log` VALUES (89, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', '7289a6b4-00d5-461c-b61f-b7ebb4c9adbc', '\"admin/system/site/show\"', 21, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 15:16:09', 1, '2018-03-13 15:16:09', NULL, b'0');
INSERT INTO `sys_log` VALUES (90, '普通请求', '跳转资源展示列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/rescource/list', 'GET', 'com.mysiteforme.admin.controller.system.RescourceController.list', '[]', '7289a6b4-00d5-461c-b61f-b7ebb4c9adbc', '\"admin/system/rescource/list\"', 12, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 15:16:09', 1, '2018-03-13 15:16:09', NULL, b'0');
INSERT INTO `sys_log` VALUES (91, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', '7289a6b4-00d5-461c-b61f-b7ebb4c9adbc', '\"admin/system/menu/test\"', 9, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 15:16:09', 1, '2018-03-13 15:16:09', NULL, b'0');
INSERT INTO `sys_log` VALUES (92, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.mysiteforme.admin.controller.system.RoleController.list', '[]', '7289a6b4-00d5-461c-b61f-b7ebb4c9adbc', '\"admin/system/role/list\"', 12, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 15:16:09', 1, '2018-03-13 15:16:09', NULL, b'0');
INSERT INTO `sys_log` VALUES (93, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', '7289a6b4-00d5-461c-b61f-b7ebb4c9adbc', '\"admin/system/user/list\"', 15, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 15:16:09', 1, '2018-03-13 15:16:09', NULL, b'0');
INSERT INTO `sys_log` VALUES (94, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '7289a6b4-00d5-461c-b61f-b7ebb4c9adbc', '\"/admin/quartzTask/list\"', 18, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 15:16:09', 1, '2018-03-13 15:16:09', NULL, b'0');
INSERT INTO `sys_log` VALUES (95, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '7289a6b4-00d5-461c-b61f-b7ebb4c9adbc', '\"/admin/quartzTask/list\"', 18, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 15:16:09', 1, '2018-03-13 15:16:09', NULL, b'0');
INSERT INTO `sys_log` VALUES (96, '普通请求', '跳转系统字典页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/dict/list', 'GET', 'com.mysiteforme.admin.controller.system.DictController.list', '[]', '7289a6b4-00d5-461c-b61f-b7ebb4c9adbc', '\"admin/system/dict/list\"', 12, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 15:16:09', 1, '2018-03-13 15:16:09', NULL, b'0');
INSERT INTO `sys_log` VALUES (97, 'Ajax请求', '请求字段展示数据(全部显示)', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/table/showFields', 'POST', 'com.mysiteforme.admin.controller.system.TableController.showFields', '[\"QRTZ_SIMPLE_TRIGGERS\",0]', '7289a6b4-00d5-461c-b61f-b7ebb4c9adbc', 'null', 8, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 15:22:04', 1, '2018-03-13 15:22:04', NULL, b'0');
INSERT INTO `sys_log` VALUES (98, 'Ajax请求', '请求字段展示数据(全部显示)', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/table/showFields', 'POST', 'com.mysiteforme.admin.controller.system.TableController.showFields', '[\"quartz_task\",1]', '7289a6b4-00d5-461c-b61f-b7ebb4c9adbc', '{\"code\":0,\"count\":6,\"data\":[{\"comment\":\"任务名称\",\"defaultValue\":false,\"dictlist\":[],\"dofor\":\"input\",\"isNullValue\":\"YES\",\"length\":255,\"listIsSearch\":true,\"listIsShow\":true,\"name\":\"name\",\"type\":\"VARCHAR\"},{\"comment\":\"任务表达式\",\"defaultValue\":false,\"dictlist\":[],\"dofor\":\"input\",\"isNullValue\":\"YES\",\"length\":255,\"listIsSearch\":false,\"listIsShow\":true,\"name\":\"cron\",\"type\":\"VARCHAR\"},{\"comment\":\"执行的类\",\"defaultValue\":false,\"dictlist\":[],\"dofor\":\"input\",\"isNullValue\":\"YES\",\"length\":255,\"listIsSearch\":false,\"listIsShow\":true,\"name\":\"target_bean\",\"type\":\"VARCHAR\"},{\"comment\":\"执行方法\",\"defaultValue\":false,\"dictlist\":[],\"dofor\":\"input\",\"isNullValue\":\"YES\",\"length\":255,\"listIsSearch\":false,\"listIsShow\":true,\"name\":\"trget_method\",\"type\":\"VARCHAR\"},{\"comment\":\"执行参数\",\"defaultValue\":false,\"dictlist\":[],\"dofor\":\"textarea\",\"isNullValue\":\"YES\",\"length\":255,\"listIsSearch\":false,\"listIsShow\":false,\"name\":\"params\",\"type\":\"VARCHAR\"},{\"comment\":\"任务状态\",\"defaultValue\":false,\"dictlist\":[{\"delFlag\":false,\"id\":123,\"label\":\"正常\",\"type\":\"quartz_task_status\",\"value\":\"0\"},{\"delFlag\":false,\"id\":124,\"label\":\"暂停\",\"type\":\"quartz_task_status\",\"value\":\"1\"}],\"dofor\":\"radio\",\"isNullValue\":\"YES\",\"length\":11,\"listIsSearch\":true,\"listIsShow\":true,\"name\":\"status\",\"type\":\"INT\"}],\"msg\":\"\"}', 38, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 15:22:15', 1, '2018-03-13 15:22:15', NULL, b'0');
INSERT INTO `sys_log` VALUES (99, 'Ajax请求', '请求字段展示数据(全部显示)', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/table/showFields', 'POST', 'com.mysiteforme.admin.controller.system.TableController.showFields', '[\"QRTZ_CRON_TRIGGERS\",0]', '7289a6b4-00d5-461c-b61f-b7ebb4c9adbc', 'null', 10, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 15:22:24', 1, '2018-03-13 15:22:24', NULL, b'0');
INSERT INTO `sys_log` VALUES (100, 'Ajax请求', '请求字段展示数据(全部显示)', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/table/showFields', 'POST', 'com.mysiteforme.admin.controller.system.TableController.showFields', '[\"hat_area\",0]', '7289a6b4-00d5-461c-b61f-b7ebb4c9adbc', 'null', 9, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 15:23:23', 1, '2018-03-13 15:23:23', NULL, b'0');
INSERT INTO `sys_log` VALUES (101, 'Ajax请求', '请求字段展示数据(全部显示)', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/table/showFields', 'POST', 'com.mysiteforme.admin.controller.system.TableController.showFields', '[\"blog_tags\",1]', '7289a6b4-00d5-461c-b61f-b7ebb4c9adbc', '{\"code\":0,\"count\":2,\"data\":[{\"comment\":\"标签名字\",\"defaultValue\":false,\"dictlist\":[],\"dofor\":\"input\",\"isNullValue\":\"YES\",\"length\":255,\"listIsSearch\":true,\"listIsShow\":true,\"name\":\"name\",\"type\":\"VARCHAR\"},{\"comment\":\"排序\",\"defaultValue\":false,\"dictlist\":[],\"dofor\":\"0\",\"isNullValue\":\"YES\",\"length\":11,\"listIsSearch\":false,\"listIsShow\":false,\"name\":\"sort\",\"type\":\"INT\"}],\"msg\":\"\"}', 35, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 15:23:28', 1, '2018-03-13 15:23:28', NULL, b'0');
INSERT INTO `sys_log` VALUES (102, '普通请求', '跳转系统字典页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/dict/list', 'GET', 'com.mysiteforme.admin.controller.system.DictController.list', '[]', '7289a6b4-00d5-461c-b61f-b7ebb4c9adbc', '\"admin/system/dict/list\"', 16, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 15:33:21', 1, '2018-03-13 15:33:21', NULL, b'0');
INSERT INTO `sys_log` VALUES (103, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', '7289a6b4-00d5-461c-b61f-b7ebb4c9adbc', '\"admin/system/site/show\"', 19, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 15:33:22', 1, '2018-03-13 15:33:22', NULL, b'0');
INSERT INTO `sys_log` VALUES (104, '普通请求', '跳转资源展示列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/rescource/list', 'GET', 'com.mysiteforme.admin.controller.system.RescourceController.list', '[]', '7289a6b4-00d5-461c-b61f-b7ebb4c9adbc', '\"admin/system/rescource/list\"', 13, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 15:33:24', 1, '2018-03-13 15:33:24', NULL, b'0');
INSERT INTO `sys_log` VALUES (105, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8081/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@231f7442\"]', '4ef30035-f33f-419b-9871-0b8c20f73a5f', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 261, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 16:39:13', 1, '2018-03-13 16:39:13', NULL, b'0');
INSERT INTO `sys_log` VALUES (106, '普通请求', '跳转系统字典页面', '127.0.0.1', '我是管理员', 'http://localhost:8081/admin/system/dict/list', 'GET', 'com.mysiteforme.admin.controller.system.DictController.list', '[]', '4ef30035-f33f-419b-9871-0b8c20f73a5f', '\"admin/system/dict/list\"', 17, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 16:41:16', 1, '2018-03-13 16:41:16', NULL, b'0');
INSERT INTO `sys_log` VALUES (107, '普通请求', '跳转数据表列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8081/admin/system/table/list', 'GET', 'com.mysiteforme.admin.controller.system.TableController.list', '[]', '4ef30035-f33f-419b-9871-0b8c20f73a5f', '\"admin/system/table/list\"', 11, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 16:41:17', 1, '2018-03-13 16:41:17', NULL, b'0');
INSERT INTO `sys_log` VALUES (108, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8081/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', '4ef30035-f33f-419b-9871-0b8c20f73a5f', '\"admin/system/site/show\"', 18, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 16:41:18', 1, '2018-03-13 16:41:18', NULL, b'0');
INSERT INTO `sys_log` VALUES (109, '普通请求', '跳转资源展示列表', '127.0.0.1', '我是管理员', 'http://localhost:8081/admin/system/rescource/list', 'GET', 'com.mysiteforme.admin.controller.system.RescourceController.list', '[]', '4ef30035-f33f-419b-9871-0b8c20f73a5f', '\"admin/system/rescource/list\"', 11, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 16:41:19', 1, '2018-03-13 16:41:19', NULL, b'0');
INSERT INTO `sys_log` VALUES (110, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8081/admin/system/role/list', 'GET', 'com.mysiteforme.admin.controller.system.RoleController.list', '[]', '4ef30035-f33f-419b-9871-0b8c20f73a5f', '\"admin/system/role/list\"', 7, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 16:54:25', 1, '2018-03-13 16:54:25', NULL, b'0');
INSERT INTO `sys_log` VALUES (111, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8081/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', '4ef30035-f33f-419b-9871-0b8c20f73a5f', '\"admin/system/menu/test\"', 9, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 16:54:28', 1, '2018-03-13 16:54:28', NULL, b'0');
INSERT INTO `sys_log` VALUES (112, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8081/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', '4ef30035-f33f-419b-9871-0b8c20f73a5f', '\"admin/system/user/list\"', 5, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 16:54:30', 1, '2018-03-13 16:54:30', NULL, b'0');
INSERT INTO `sys_log` VALUES (113, '普通请求', '跳转系统字典页面', '127.0.0.1', '我是管理员', 'http://localhost:8081/admin/system/dict/list', 'GET', 'com.mysiteforme.admin.controller.system.DictController.list', '[]', '4ef30035-f33f-419b-9871-0b8c20f73a5f', '\"admin/system/dict/list\"', 12, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 17:01:36', 1, '2018-03-13 17:01:36', NULL, b'0');
INSERT INTO `sys_log` VALUES (114, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8081/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', '4ef30035-f33f-419b-9871-0b8c20f73a5f', '\"admin/system/site/show\"', 58, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 17:01:36', 1, '2018-03-13 17:01:36', NULL, b'0');
INSERT INTO `sys_log` VALUES (115, '普通请求', '跳转系统字典页面', '127.0.0.1', '我是管理员', 'http://localhost:8081/admin/system/dict/list', 'GET', 'com.mysiteforme.admin.controller.system.DictController.list', '[]', '4ef30035-f33f-419b-9871-0b8c20f73a5f', '\"admin/system/dict/list\"', 21, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 17:18:23', 1, '2018-03-13 17:18:23', NULL, b'0');
INSERT INTO `sys_log` VALUES (116, '普通请求', '跳转数据表列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8081/admin/system/table/list', 'GET', 'com.mysiteforme.admin.controller.system.TableController.list', '[]', '4ef30035-f33f-419b-9871-0b8c20f73a5f', '\"admin/system/table/list\"', 17, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 17:18:23', 1, '2018-03-13 17:18:23', NULL, b'0');
INSERT INTO `sys_log` VALUES (117, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8081/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', '4ef30035-f33f-419b-9871-0b8c20f73a5f', '\"admin/system/site/show\"', 49, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 17:18:23', 1, '2018-03-13 17:18:23', NULL, b'0');
INSERT INTO `sys_log` VALUES (118, '普通请求', '跳转系统字典页面', '127.0.0.1', '我是管理员', 'http://localhost:8081/admin/system/dict/list', 'GET', 'com.mysiteforme.admin.controller.system.DictController.list', '[]', '4ef30035-f33f-419b-9871-0b8c20f73a5f', '\"admin/system/dict/list\"', 19, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 17:27:08', 1, '2018-03-13 17:27:08', NULL, b'0');
INSERT INTO `sys_log` VALUES (119, '普通请求', '跳转数据表列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8081/admin/system/table/list', 'GET', 'com.mysiteforme.admin.controller.system.TableController.list', '[]', '4ef30035-f33f-419b-9871-0b8c20f73a5f', '\"admin/system/table/list\"', 129, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 17:27:08', 1, '2018-03-13 17:27:08', NULL, b'0');
INSERT INTO `sys_log` VALUES (120, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8081/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', '4ef30035-f33f-419b-9871-0b8c20f73a5f', '\"admin/system/site/show\"', 53, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 17:27:08', 1, '2018-03-13 17:27:08', NULL, b'0');
INSERT INTO `sys_log` VALUES (121, '普通请求', '跳转系统字典页面', '127.0.0.1', '我是管理员', 'http://localhost:8081/admin/system/dict/list', 'GET', 'com.mysiteforme.admin.controller.system.DictController.list', '[]', '4ef30035-f33f-419b-9871-0b8c20f73a5f', '\"admin/system/dict/list\"', 7, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 17:29:56', 1, '2018-03-13 17:29:56', NULL, b'0');
INSERT INTO `sys_log` VALUES (122, '普通请求', '跳转数据表列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8081/admin/system/table/list', 'GET', 'com.mysiteforme.admin.controller.system.TableController.list', '[]', '4ef30035-f33f-419b-9871-0b8c20f73a5f', '\"admin/system/table/list\"', 10, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 17:29:59', 1, '2018-03-13 17:29:59', NULL, b'0');
INSERT INTO `sys_log` VALUES (123, '普通请求', '跳转系统字典页面', '127.0.0.1', '我是管理员', 'http://localhost:8081/admin/system/dict/list', 'GET', 'com.mysiteforme.admin.controller.system.DictController.list', '[]', '4ef30035-f33f-419b-9871-0b8c20f73a5f', '\"admin/system/dict/list\"', 15, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 18:05:52', 1, '2018-03-13 18:05:52', NULL, b'0');
INSERT INTO `sys_log` VALUES (124, '普通请求', '跳转数据表列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8081/admin/system/table/list', 'GET', 'com.mysiteforme.admin.controller.system.TableController.list', '[]', '4ef30035-f33f-419b-9871-0b8c20f73a5f', '\"admin/system/table/list\"', 11, 'Windows-Firefox-58.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-13 18:05:53', 1, '2018-03-13 18:05:53', NULL, b'0');
INSERT INTO `sys_log` VALUES (125, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8083/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@7176c39b\"]', '821f3a6e-517d-495a-a153-d326a7374d52', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 990, 'Windows-Chrome-64.0.3282.186', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-14 15:20:49', 1, '2018-03-14 15:20:49', NULL, b'0');
INSERT INTO `sys_log` VALUES (126, '普通请求', '跳转系统字典页面', '127.0.0.1', '我是管理员', 'http://localhost:8083/admin/system/dict/list', 'GET', 'com.mysiteforme.admin.controller.system.DictController.list', '[]', '821f3a6e-517d-495a-a153-d326a7374d52', '\"admin/system/dict/list\"', 101, 'Windows-Chrome-64.0.3282.186', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-14 16:16:25', 1, '2018-03-14 16:16:25', NULL, b'0');
INSERT INTO `sys_log` VALUES (127, '普通请求', '跳转数据表列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8083/admin/system/table/list', 'GET', 'com.mysiteforme.admin.controller.system.TableController.list', '[]', '821f3a6e-517d-495a-a153-d326a7374d52', '\"admin/system/table/list\"', 29, 'Windows-Chrome-64.0.3282.186', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-14 16:16:27', 1, '2018-03-14 16:16:27', NULL, b'0');
INSERT INTO `sys_log` VALUES (128, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8083/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', '821f3a6e-517d-495a-a153-d326a7374d52', '\"admin/system/site/show\"', 51, 'Windows-Chrome-64.0.3282.186', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-14 16:16:29', 1, '2018-03-14 16:16:29', NULL, b'0');
INSERT INTO `sys_log` VALUES (129, '普通请求', '跳转资源展示列表', '127.0.0.1', '我是管理员', 'http://localhost:8083/admin/system/rescource/list', 'GET', 'com.mysiteforme.admin.controller.system.RescourceController.list', '[]', '821f3a6e-517d-495a-a153-d326a7374d52', '\"admin/system/rescource/list\"', 28, 'Windows-Chrome-64.0.3282.186', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-14 16:17:36', 1, '2018-03-14 16:17:36', NULL, b'0');
INSERT INTO `sys_log` VALUES (130, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8083/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', '821f3a6e-517d-495a-a153-d326a7374d52', '\"admin/system/menu/test\"', 28, 'Windows-Chrome-64.0.3282.186', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-14 16:17:38', 1, '2018-03-14 16:17:38', NULL, b'0');
INSERT INTO `sys_log` VALUES (131, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@36df7498\"]', 'd79caca2-d397-4611-ab17-e709697bb193', '{\"success\":false,\"message\":\"验证码错误\"}', 28, 'Windows-Chrome-64.0.3282.186', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-15 10:04:46', 1, '2018-03-15 10:04:46', NULL, b'0');
INSERT INTO `sys_log` VALUES (132, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@19a4f1e\"]', 'd79caca2-d397-4611-ab17-e709697bb193', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 639, 'Windows-Chrome-64.0.3282.186', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-15 10:04:53', 1, '2018-03-15 10:04:53', NULL, b'0');
INSERT INTO `sys_log` VALUES (133, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', 'd79caca2-d397-4611-ab17-e709697bb193', '\"admin/system/menu/test\"', 16, 'Windows-Chrome-64.0.3282.186', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-15 10:05:30', 1, '2018-03-15 10:05:30', NULL, b'0');
INSERT INTO `sys_log` VALUES (134, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'd79caca2-d397-4611-ab17-e709697bb193', '\"admin/system/user/list\"', 11, 'Windows-Chrome-64.0.3282.186', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-15 10:06:17', 1, '2018-03-15 10:06:17', NULL, b'0');
INSERT INTO `sys_log` VALUES (135, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.mysiteforme.admin.controller.system.RoleController.list', '[]', 'd79caca2-d397-4611-ab17-e709697bb193', '\"admin/system/role/list\"', 12, 'Windows-Chrome-64.0.3282.186', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-15 10:06:32', 1, '2018-03-15 10:06:32', NULL, b'0');
INSERT INTO `sys_log` VALUES (136, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'd79caca2-d397-4611-ab17-e709697bb193', '\"admin/system/user/list\"', 9, 'Windows-Chrome-64.0.3282.186', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-15 10:07:22', 1, '2018-03-15 10:07:22', NULL, b'0');
INSERT INTO `sys_log` VALUES (137, '普通请求', '跳转资源展示列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/rescource/list', 'GET', 'com.mysiteforme.admin.controller.system.RescourceController.list', '[]', 'd79caca2-d397-4611-ab17-e709697bb193', '\"admin/system/rescource/list\"', 13, 'Windows-Chrome-64.0.3282.186', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-15 10:07:39', 1, '2018-03-15 10:07:39', NULL, b'0');
INSERT INTO `sys_log` VALUES (138, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', 'd79caca2-d397-4611-ab17-e709697bb193', '\"admin/system/menu/test\"', 10, 'Windows-Chrome-64.0.3282.186', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-15 10:07:48', 1, '2018-03-15 10:07:48', NULL, b'0');
INSERT INTO `sys_log` VALUES (139, 'Ajax请求', '保存新增菜单数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/add', 'POST', 'com.mysiteforme.admin.controller.system.MenuController.add', '[{\"bgColor\":\"\",\"delFlag\":false,\"href\":\"\",\"icon\":\"\",\"isShow\":false,\"name\":\"修改密码\",\"parentId\":2,\"permission\":\"sys:user:changePassword\",\"sort\":30}]', 'd79caca2-d397-4611-ab17-e709697bb193', '{\"success\":true,\"message\":\"成功\"}', 218, 'Windows-Chrome-64.0.3282.186', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-15 10:14:06', 1, '2018-03-15 10:14:06', NULL, b'0');
INSERT INTO `sys_log` VALUES (140, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', 'd79caca2-d397-4611-ab17-e709697bb193', '\"admin/system/menu/test\"', 7, 'Windows-Chrome-64.0.3282.186', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-15 10:14:08', 1, '2018-03-15 10:14:08', NULL, b'0');
INSERT INTO `sys_log` VALUES (141, 'Ajax请求', '保存编辑角色数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/edit', 'POST', 'com.mysiteforme.admin.controller.system.RoleController.edit', '[{\"delFlag\":false,\"id\":2,\"menuSet\":[{\"delFlag\":false,\"id\":35,\"sort\":30},{\"delFlag\":false,\"id\":45,\"sort\":30},{\"delFlag\":false,\"id\":23,\"sort\":30},{\"delFlag\":false,\"id\":24,\"sort\":30},{\"delFlag\":false,\"id\":21,\"sort\":30},{\"delFlag\":false,\"id\":52,\"sort\":30},{\"delFlag\":false,\"id\":31,\"sort\":30},{\"delFlag\":false,\"id\":38,\"sort\":30},{\"delFlag\":false,\"id\":25,\"sort\":30},{\"delFlag\":false,\"id\":5,\"sort\":30},{\"delFlag\":false,\"id\":33,\"sort\":30},{\"delFlag\":false,\"id\":26,\"sort\":30},{\"delFlag\":false,\"id\":36,\"sort\":30},{\"delFlag\":false,\"id\":48,\"sort\":30},{\"delFlag\":false,\"id\":13,\"sort\":30},{\"delFlag\":false,\"id\":3,\"sort\":30},{\"delFlag\":false,\"id\":15,\"sort\":30},{\"delFlag\":false,\"id\":29,\"sort\":30},{\"delFlag\":false,\"id\":11,\"sort\":30},{\"delFlag\":false,\"id\":6,\"sort\":30},{\"delFlag\":false,\"id\":8,\"sort\":30},{\"delFlag\":false,\"id\":27,\"sort\":30},{\"delFlag\":false,\"id\":50,\"sort\":30},{\"delFlag\":false,\"id\":28,\"sort\":30},{\"delFlag\":false,\"id\":10,\"sort\":30},{\"delFlag\":false,\"id\":18,\"sort\":30},{\"delFlag\":false,\"id\":53,\"sort\":30},{\"delFlag\":false,\"id\":42,\"sort\":30},{\"delFlag\":false,\"id\":16,\"sort\":30},{\"delFlag\":false,\"id\":46,\"sort\":30},{\"delFlag\":false,\"id\":39,\"sort\":30},{\"delFlag\":false,\"id\":32,\"sort\":30},{\"delFlag\":false,\"id\":9,\"sort\":30},{\"delFlag\":false,\"id\":30,\"sort\":30},{\"delFlag\":false,\"id\":41,\"sort\":30},{\"delFlag\":false,\"id\":47,\"sort\":30},{\"delFlag\":false,\"id\":4,\"sort\":30},{\"delFlag\":false,\"id\":1,\"sort\":30},{\"delFlag\":false,\"id\":44,\"sort\":30},{\"delFlag\":false,\"id\":22,\"sort\":30},{\"delFlag\":false,\"id\":43,\"sort\":30},{\"delFlag\":false,\"id\":2,\"sort\":30},{\"delFlag\":false,\"id\":17,\"sort\":30},{\"delFlag\":false,\"id\":20,\"sort\":30},{\"delFlag\":false,\"id\":37,\"sort\":30},{\"delFlag\":false,\"id\":51,\"sort\":30},{\"delFlag\":false,\"id\":40,\"sort\":30},{\"delFlag\":false,\"id\":49,\"sort\":30},{\"delFlag\":false,\"id\":14,\"sort\":30},{\"delFlag\":false,\"id\":7,\"sort\":30},{\"delFlag\":false,\"id\":12,\"sort\":30},{\"delFlag\":false,\"id\":34,\"sort\":30},{\"delFlag\":false,\"id\":19,\"sort\":30}],\"name\":\"系统管理员\",\"remarks\":\"\"}]', 'd79caca2-d397-4611-ab17-e709697bb193', '{\"success\":true,\"message\":\"成功\"}', 121, 'Windows-Chrome-64.0.3282.186', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-15 10:14:25', 1, '2018-03-15 10:14:25', NULL, b'0');
INSERT INTO `sys_log` VALUES (142, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.mysiteforme.admin.controller.system.RoleController.list', '[]', 'd79caca2-d397-4611-ab17-e709697bb193', '\"admin/system/role/list\"', 6, 'Windows-Chrome-64.0.3282.186', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-15 10:14:27', 1, '2018-03-15 10:14:27', NULL, b'0');
INSERT INTO `sys_log` VALUES (143, 'Ajax请求', '保存新增菜单数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/add', 'POST', 'com.mysiteforme.admin.controller.system.MenuController.add', '[{\"bgColor\":\"\",\"delFlag\":false,\"href\":\"\",\"icon\":\"\",\"isShow\":false,\"name\":\"删除字典\",\"parentId\":9,\"permission\":\"sys:dict:delete\",\"sort\":30}]', 'd79caca2-d397-4611-ab17-e709697bb193', '{\"success\":true,\"message\":\"成功\"}', 275, 'Windows-Chrome-64.0.3282.186', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-15 10:16:55', 1, '2018-03-15 10:16:55', NULL, b'0');
INSERT INTO `sys_log` VALUES (144, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', 'd79caca2-d397-4611-ab17-e709697bb193', '\"admin/system/menu/test\"', 10, 'Windows-Chrome-64.0.3282.186', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-15 10:16:59', 1, '2018-03-15 10:16:59', NULL, b'0');
INSERT INTO `sys_log` VALUES (145, 'Ajax请求', '保存编辑角色数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/edit', 'POST', 'com.mysiteforme.admin.controller.system.RoleController.edit', '[{\"delFlag\":false,\"id\":2,\"menuSet\":[{\"delFlag\":false,\"id\":14,\"sort\":30},{\"delFlag\":false,\"id\":15,\"sort\":30},{\"delFlag\":false,\"id\":51,\"sort\":30},{\"delFlag\":false,\"id\":2,\"sort\":30},{\"delFlag\":false,\"id\":5,\"sort\":30},{\"delFlag\":false,\"id\":6,\"sort\":30},{\"delFlag\":false,\"id\":23,\"sort\":30},{\"delFlag\":false,\"id\":54,\"sort\":30},{\"delFlag\":false,\"id\":49,\"sort\":30},{\"delFlag\":false,\"id\":37,\"sort\":30},{\"delFlag\":false,\"id\":33,\"sort\":30},{\"delFlag\":false,\"id\":28,\"sort\":30},{\"delFlag\":false,\"id\":41,\"sort\":30},{\"delFlag\":false,\"id\":9,\"sort\":30},{\"delFlag\":false,\"id\":11,\"sort\":30},{\"delFlag\":false,\"id\":42,\"sort\":30},{\"delFlag\":false,\"id\":25,\"sort\":30},{\"delFlag\":false,\"id\":22,\"sort\":30},{\"delFlag\":false,\"id\":17,\"sort\":30},{\"delFlag\":false,\"id\":40,\"sort\":30},{\"delFlag\":false,\"id\":46,\"sort\":30},{\"delFlag\":false,\"id\":18,\"sort\":30},{\"delFlag\":false,\"id\":26,\"sort\":30},{\"delFlag\":false,\"id\":53,\"sort\":30},{\"delFlag\":false,\"id\":13,\"sort\":30},{\"delFlag\":false,\"id\":39,\"sort\":30},{\"delFlag\":false,\"id\":12,\"sort\":30},{\"delFlag\":false,\"id\":27,\"sort\":30},{\"delFlag\":false,\"id\":45,\"sort\":30},{\"delFlag\":false,\"id\":29,\"sort\":30},{\"delFlag\":false,\"id\":16,\"sort\":30},{\"delFlag\":false,\"id\":19,\"sort\":30},{\"delFlag\":false,\"id\":21,\"sort\":30},{\"delFlag\":false,\"id\":38,\"sort\":30},{\"delFlag\":false,\"id\":48,\"sort\":30},{\"delFlag\":false,\"id\":7,\"sort\":30},{\"delFlag\":false,\"id\":30,\"sort\":30},{\"delFlag\":false,\"id\":1,\"sort\":30},{\"delFlag\":false,\"id\":4,\"sort\":30},{\"delFlag\":false,\"id\":3,\"sort\":30},{\"delFlag\":false,\"id\":47,\"sort\":30},{\"delFlag\":false,\"id\":24,\"sort\":30},{\"delFlag\":false,\"id\":35,\"sort\":30},{\"delFlag\":false,\"id\":43,\"sort\":30},{\"delFlag\":false,\"id\":20,\"sort\":30},{\"delFlag\":false,\"id\":44,\"sort\":30},{\"delFlag\":false,\"id\":52,\"sort\":30},{\"delFlag\":false,\"id\":50,\"sort\":30},{\"delFlag\":false,\"id\":10,\"sort\":30},{\"delFlag\":false,\"id\":34,\"sort\":30},{\"delFlag\":false,\"id\":32,\"sort\":30},{\"delFlag\":false,\"id\":31,\"sort\":30},{\"delFlag\":false,\"id\":36,\"sort\":30},{\"delFlag\":false,\"id\":8,\"sort\":30}],\"name\":\"系统管理员\",\"remarks\":\"\"}]', 'd79caca2-d397-4611-ab17-e709697bb193', '{\"success\":true,\"message\":\"成功\"}', 130, 'Windows-Chrome-64.0.3282.186', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-15 10:18:17', 1, '2018-03-15 10:18:17', NULL, b'0');
INSERT INTO `sys_log` VALUES (146, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.mysiteforme.admin.controller.system.RoleController.list', '[]', 'd79caca2-d397-4611-ab17-e709697bb193', '\"admin/system/role/list\"', 10, 'Windows-Chrome-64.0.3282.186', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-15 10:18:18', 1, '2018-03-15 10:18:18', NULL, b'0');
INSERT INTO `sys_log` VALUES (147, '普通请求', '跳转系统字典页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/dict/list', 'GET', 'com.mysiteforme.admin.controller.system.DictController.list', '[]', 'd79caca2-d397-4611-ab17-e709697bb193', '\"admin/system/dict/list\"', 13, 'Windows-Chrome-64.0.3282.186', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-15 10:18:20', 1, '2018-03-15 10:18:20', NULL, b'0');
INSERT INTO `sys_log` VALUES (148, '普通请求', '跳转系统字典页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/dict/list', 'GET', 'com.mysiteforme.admin.controller.system.DictController.list', '[]', 'd79caca2-d397-4611-ab17-e709697bb193', '\"admin/system/dict/list\"', 7, 'Windows-Chrome-64.0.3282.186', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-15 10:20:01', 1, '2018-03-15 10:20:01', NULL, b'0');
INSERT INTO `sys_log` VALUES (149, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', 'd79caca2-d397-4611-ab17-e709697bb193', '\"admin/system/menu/test\"', 9, 'Windows-Chrome-64.0.3282.186', NULL, NULL, NULL, NULL, NULL, '1', '2018-03-15 10:20:13', 1, '2018-03-15 10:20:13', NULL, b'0');
INSERT INTO `sys_log` VALUES (150, '普通请求', '退出系统', '127.0.0.1', '普通管理员', 'http://localhost:8080/systemLogout', 'GET', 'com.mysiteforme.admin.controller.LoginController.logOut', '[]', '56a10a55-c14f-450e-b5e7-adfff185a795', '\"redirect:/login\"', 17, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, NULL, '2018-06-16 04:18:57', NULL, '2018-06-16 04:18:57', NULL, b'0');
INSERT INTO `sys_log` VALUES (151, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@739b5246\"]', 'cf5cf205-26c3-4f55-8bf8-522190029a84', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 57, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 04:19:05', 1, '2018-06-16 04:19:05', NULL, b'0');
INSERT INTO `sys_log` VALUES (152, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@7933cd93\"]', '973277d3-2818-4469-b58f-138ee3a62ced', '{\"success\":false,\"message\":\"验证码错误\"}', 2, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 04:24:21', 1, '2018-06-16 04:24:21', NULL, b'0');
INSERT INTO `sys_log` VALUES (153, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@2bb68110\"]', '973277d3-2818-4469-b58f-138ee3a62ced', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 21, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 04:24:25', 1, '2018-06-16 04:24:25', NULL, b'0');
INSERT INTO `sys_log` VALUES (154, 'Ajax请求', '用户修改密码', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/changePassword', 'POST', 'com.mysiteforme.admin.controller.system.UserConteroller.changePassword', '[\"1\",\"123456\",\"123456\"]', '973277d3-2818-4469-b58f-138ee3a62ced', '{\"success\":true,\"message\":\"成功\"}', 80, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 04:25:16', 1, '2018-06-16 04:25:16', NULL, b'0');
INSERT INTO `sys_log` VALUES (155, '普通请求', '退出系统', '127.0.0.1', '我是管理员', 'http://localhost:8080/systemLogout', 'GET', 'com.mysiteforme.admin.controller.LoginController.logOut', '[]', '973277d3-2818-4469-b58f-138ee3a62ced', '\"redirect:/login\"', 3, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, NULL, '2018-06-16 04:25:18', NULL, '2018-06-16 04:25:18', NULL, b'0');
INSERT INTO `sys_log` VALUES (156, 'Ajax请求', '用户登录', '127.0.0.1', NULL, 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@50b23fa\"]', 'f36ec77b-079f-4cdf-b071-f21e76d87ad3', '{\"success\":false,\"message\":\"验证码错误\"}', 1, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, NULL, '2018-06-16 04:25:27', NULL, '2018-06-16 04:25:27', NULL, b'0');
INSERT INTO `sys_log` VALUES (157, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@2965814f\"]', 'f36ec77b-079f-4cdf-b071-f21e76d87ad3', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 15, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 04:25:32', 1, '2018-06-16 04:25:32', NULL, b'0');
INSERT INTO `sys_log` VALUES (158, 'Ajax请求', '用户修改密码', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/changePassword', 'POST', 'com.mysiteforme.admin.controller.system.UserConteroller.changePassword', '[\"123456\",\"1\",\"1\"]', 'f36ec77b-079f-4cdf-b071-f21e76d87ad3', '{\"success\":true,\"message\":\"成功\"}', 54, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 04:27:15', 1, '2018-06-16 04:27:15', NULL, b'0');
INSERT INTO `sys_log` VALUES (159, '普通请求', '退出系统', '127.0.0.1', '我是管理员', 'http://localhost:8080/systemLogout', 'GET', 'com.mysiteforme.admin.controller.LoginController.logOut', '[]', 'f36ec77b-079f-4cdf-b071-f21e76d87ad3', '\"redirect:/login\"', 4, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, NULL, '2018-06-16 04:27:16', NULL, '2018-06-16 04:27:16', NULL, b'0');
INSERT INTO `sys_log` VALUES (160, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@1143a2ec\"]', '602de14c-a4b2-4a42-b158-5d816a6ae1dd', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 14, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 04:27:26', 1, '2018-06-16 04:27:26', NULL, b'0');
INSERT INTO `sys_log` VALUES (161, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', '602de14c-a4b2-4a42-b158-5d816a6ae1dd', '\"admin/system/menu/test\"', 4, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 04:27:36', 1, '2018-06-16 04:27:36', NULL, b'0');
INSERT INTO `sys_log` VALUES (162, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.mysiteforme.admin.controller.system.RoleController.list', '[]', '602de14c-a4b2-4a42-b158-5d816a6ae1dd', '\"admin/system/role/list\"', 4, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 04:27:43', 1, '2018-06-16 04:27:43', NULL, b'0');
INSERT INTO `sys_log` VALUES (163, 'Ajax请求', '保存新增菜单数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/add', 'POST', 'com.mysiteforme.admin.controller.system.MenuController.add', '[{\"bgColor\":\"\",\"delFlag\":false,\"href\":\"\",\"icon\":\"\",\"isShow\":false,\"name\":\"系统日志删除\",\"parentId\":6,\"permission\":\"system:logs:delete\",\"sort\":30}]', '602de14c-a4b2-4a42-b158-5d816a6ae1dd', '{\"success\":true,\"message\":\"成功\"}', 111, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 04:30:32', 1, '2018-06-16 04:30:32', NULL, b'0');
INSERT INTO `sys_log` VALUES (164, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', '602de14c-a4b2-4a42-b158-5d816a6ae1dd', '\"admin/system/menu/test\"', 2, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 04:30:34', 1, '2018-06-16 04:30:34', NULL, b'0');
INSERT INTO `sys_log` VALUES (165, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', '602de14c-a4b2-4a42-b158-5d816a6ae1dd', '\"admin/system/menu/test\"', 8, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 04:40:35', 1, '2018-06-16 04:40:35', NULL, b'0');
INSERT INTO `sys_log` VALUES (166, 'Ajax请求', '保存新增菜单数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/add', 'POST', 'com.mysiteforme.admin.controller.system.MenuController.add', '[{\"bgColor\":\"#c3e8ce\",\"delFlag\":false,\"href\":\"/admin/blogTags/list\",\"icon\":\"\",\"isShow\":true,\"name\":\"博客标签\",\"parentId\":10,\"permission\":\"blog:tags:list\",\"sort\":30}]', '602de14c-a4b2-4a42-b158-5d816a6ae1dd', '{\"success\":true,\"message\":\"成功\"}', 129, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 04:42:15', 1, '2018-06-16 04:42:15', NULL, b'0');
INSERT INTO `sys_log` VALUES (167, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', '602de14c-a4b2-4a42-b158-5d816a6ae1dd', '\"admin/system/menu/test\"', 2, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 04:42:17', 1, '2018-06-16 04:42:17', NULL, b'0');
INSERT INTO `sys_log` VALUES (168, 'Ajax请求', '保存编辑菜单数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/edit', 'POST', 'com.mysiteforme.admin.controller.system.MenuController.edit', '[{\"bgColor\":\"#c3e8ce\",\"delFlag\":false,\"href\":\"/admin/blogTags/list\",\"icon\":\"\",\"id\":56,\"isShow\":true,\"name\":\"博客标签\",\"permission\":\"blog:tags:list\",\"sort\":3}]', '602de14c-a4b2-4a42-b158-5d816a6ae1dd', '{\"success\":true,\"message\":\"成功\"}', 54, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 04:42:30', 1, '2018-06-16 04:42:30', NULL, b'0');
INSERT INTO `sys_log` VALUES (169, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', '602de14c-a4b2-4a42-b158-5d816a6ae1dd', '\"admin/system/menu/test\"', 3, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 04:42:32', 1, '2018-06-16 04:42:32', NULL, b'0');
INSERT INTO `sys_log` VALUES (170, 'Ajax请求', '保存新增菜单数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/add', 'POST', 'com.mysiteforme.admin.controller.system.MenuController.add', '[{\"bgColor\":\"\",\"delFlag\":false,\"href\":\"\",\"icon\":\"\",\"isShow\":false,\"name\":\"博客标签新增\",\"parentId\":56,\"permission\":\"blog:tags:add\",\"sort\":30}]', '602de14c-a4b2-4a42-b158-5d816a6ae1dd', '{\"success\":true,\"message\":\"成功\"}', 105, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 04:43:02', 1, '2018-06-16 04:43:02', NULL, b'0');
INSERT INTO `sys_log` VALUES (171, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', '602de14c-a4b2-4a42-b158-5d816a6ae1dd', '\"admin/system/menu/test\"', 2, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 04:43:03', 1, '2018-06-16 04:43:03', NULL, b'0');
INSERT INTO `sys_log` VALUES (172, 'Ajax请求', '保存新增菜单数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/add', 'POST', 'com.mysiteforme.admin.controller.system.MenuController.add', '[{\"bgColor\":\"\",\"delFlag\":false,\"href\":\"\",\"icon\":\"\",\"isShow\":false,\"name\":\"博客标签编辑\",\"parentId\":56,\"permission\":\"blog:tags:edit\",\"sort\":30}]', '602de14c-a4b2-4a42-b158-5d816a6ae1dd', '{\"success\":true,\"message\":\"成功\"}', 96, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 04:43:26', 1, '2018-06-16 04:43:26', NULL, b'0');
INSERT INTO `sys_log` VALUES (173, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', '602de14c-a4b2-4a42-b158-5d816a6ae1dd', '\"admin/system/menu/test\"', 2, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 04:43:28', 1, '2018-06-16 04:43:28', NULL, b'0');
INSERT INTO `sys_log` VALUES (174, 'Ajax请求', '保存新增菜单数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/add', 'POST', 'com.mysiteforme.admin.controller.system.MenuController.add', '[{\"bgColor\":\"\",\"delFlag\":false,\"href\":\"\",\"icon\":\"\",\"isShow\":false,\"name\":\"博客标签删除\",\"parentId\":56,\"permission\":\"blog:tags:delete\",\"sort\":30}]', '602de14c-a4b2-4a42-b158-5d816a6ae1dd', '{\"success\":true,\"message\":\"成功\"}', 96, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 04:43:56', 1, '2018-06-16 04:43:56', NULL, b'0');
INSERT INTO `sys_log` VALUES (175, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', '602de14c-a4b2-4a42-b158-5d816a6ae1dd', '\"admin/system/menu/test\"', 1, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 04:43:58', 1, '2018-06-16 04:43:58', NULL, b'0');
INSERT INTO `sys_log` VALUES (176, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.mysiteforme.admin.controller.system.RoleController.list', '[]', '602de14c-a4b2-4a42-b158-5d816a6ae1dd', '\"admin/system/role/list\"', 4, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 04:44:12', 1, '2018-06-16 04:44:12', NULL, b'0');
INSERT INTO `sys_log` VALUES (177, 'Ajax请求', '保存编辑角色数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/edit', 'POST', 'com.mysiteforme.admin.controller.system.RoleController.edit', '[{\"delFlag\":false,\"id\":2,\"menuSet\":[{\"delFlag\":false,\"id\":20,\"sort\":30},{\"delFlag\":false,\"id\":35,\"sort\":30},{\"delFlag\":false,\"id\":2,\"sort\":30},{\"delFlag\":false,\"id\":49,\"sort\":30},{\"delFlag\":false,\"id\":39,\"sort\":30},{\"delFlag\":false,\"id\":3,\"sort\":30},{\"delFlag\":false,\"id\":52,\"sort\":30},{\"delFlag\":false,\"id\":38,\"sort\":30},{\"delFlag\":false,\"id\":14,\"sort\":30},{\"delFlag\":false,\"id\":48,\"sort\":30},{\"delFlag\":false,\"id\":10,\"sort\":30},{\"delFlag\":false,\"id\":27,\"sort\":30},{\"delFlag\":false,\"id\":23,\"sort\":30},{\"delFlag\":false,\"id\":31,\"sort\":30},{\"delFlag\":false,\"id\":18,\"sort\":30},{\"delFlag\":false,\"id\":19,\"sort\":30},{\"delFlag\":false,\"id\":46,\"sort\":30},{\"delFlag\":false,\"id\":40,\"sort\":30},{\"delFlag\":false,\"id\":44,\"sort\":30},{\"delFlag\":false,\"id\":54,\"sort\":30},{\"delFlag\":false,\"id\":30,\"sort\":30},{\"delFlag\":false,\"id\":8,\"sort\":30},{\"delFlag\":false,\"id\":28,\"sort\":30},{\"delFlag\":false,\"id\":41,\"sort\":30},{\"delFlag\":false,\"id\":16,\"sort\":30},{\"delFlag\":false,\"id\":21,\"sort\":30},{\"delFlag\":false,\"id\":56,\"sort\":30},{\"delFlag\":false,\"id\":9,\"sort\":30},{\"delFlag\":false,\"id\":17,\"sort\":30},{\"delFlag\":false,\"id\":12,\"sort\":30},{\"delFlag\":false,\"id\":5,\"sort\":30},{\"delFlag\":false,\"id\":22,\"sort\":30},{\"delFlag\":false,\"id\":43,\"sort\":30},{\"delFlag\":false,\"id\":34,\"sort\":30},{\"delFlag\":false,\"id\":7,\"sort\":30},{\"delFlag\":false,\"id\":26,\"sort\":30},{\"delFlag\":false,\"id\":32,\"sort\":30},{\"delFlag\":false,\"id\":58,\"sort\":30},{\"delFlag\":false,\"id\":4,\"sort\":30},{\"delFlag\":false,\"id\":25,\"sort\":30},{\"delFlag\":false,\"id\":37,\"sort\":30},{\"delFlag\":false,\"id\":29,\"sort\":30},{\"delFlag\":false,\"id\":1,\"sort\":30},{\"delFlag\":false,\"id\":24,\"sort\":30},{\"delFlag\":false,\"id\":45,\"sort\":30},{\"delFlag\":false,\"id\":36,\"sort\":30},{\"delFlag\":false,\"id\":50,\"sort\":30},{\"delFlag\":false,\"id\":11,\"sort\":30},{\"delFlag\":false,\"id\":53,\"sort\":30},{\"delFlag\":false,\"id\":51,\"sort\":30},{\"delFlag\":false,\"id\":47,\"sort\":30},{\"delFlag\":false,\"id\":13,\"sort\":30},{\"delFlag\":false,\"id\":15,\"sort\":30},{\"delFlag\":false,\"id\":33,\"sort\":30},{\"delFlag\":false,\"id\":42,\"sort\":30},{\"delFlag\":false,\"id\":55,\"sort\":30},{\"delFlag\":false,\"id\":57,\"sort\":30},{\"delFlag\":false,\"id\":6,\"sort\":30}],\"name\":\"系统管理员\",\"remarks\":\"\"}]', '602de14c-a4b2-4a42-b158-5d816a6ae1dd', '{\"success\":true,\"message\":\"成功\"}', 115, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 04:44:31', 1, '2018-06-16 04:44:31', NULL, b'0');
INSERT INTO `sys_log` VALUES (178, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.mysiteforme.admin.controller.system.RoleController.list', '[]', '602de14c-a4b2-4a42-b158-5d816a6ae1dd', '\"admin/system/role/list\"', 2, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 04:44:32', 1, '2018-06-16 04:44:32', NULL, b'0');
INSERT INTO `sys_log` VALUES (179, '普通请求', '退出系统', '127.0.0.1', '我是管理员', 'http://localhost:8080/systemLogout', 'GET', 'com.mysiteforme.admin.controller.LoginController.logOut', '[]', '602de14c-a4b2-4a42-b158-5d816a6ae1dd', '\"redirect:/login\"', 5, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, NULL, '2018-06-16 04:44:36', NULL, '2018-06-16 04:44:36', NULL, b'0');
INSERT INTO `sys_log` VALUES (180, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@515c9875\"]', '3fc318c7-b6e9-48c2-90ad-5fd7caa16d71', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 41, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 04:44:43', 1, '2018-06-16 04:44:43', NULL, b'0');
INSERT INTO `sys_log` VALUES (181, '普通请求', '跳转博客标签列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogTags/list', 'GET', 'com.mysiteforme.admin.controller.BlogTagsController.list', '[]', '3fc318c7-b6e9-48c2-90ad-5fd7caa16d71', '\"/admin/blogTags/list\"', 4, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 04:44:49', 1, '2018-06-16 04:44:49', NULL, b'0');
INSERT INTO `sys_log` VALUES (182, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.mysiteforme.admin.controller.system.RoleController.list', '[]', '3fc318c7-b6e9-48c2-90ad-5fd7caa16d71', '\"admin/system/role/list\"', 7, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 05:02:58', 1, '2018-06-16 05:02:58', NULL, b'0');
INSERT INTO `sys_log` VALUES (183, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', '3fc318c7-b6e9-48c2-90ad-5fd7caa16d71', '\"admin/system/menu/test\"', 5, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 05:02:59', 1, '2018-06-16 05:02:59', NULL, b'0');
INSERT INTO `sys_log` VALUES (184, 'Ajax请求', '保存新增菜单数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/add', 'POST', 'com.mysiteforme.admin.controller.system.MenuController.add', '[{\"bgColor\":\"#7e8755\",\"delFlag\":false,\"href\":\"/admin/druid/list\",\"icon\":\"\",\"isShow\":true,\"name\":\"Druid数据监控\",\"parentId\":1,\"permission\":\"sys:druid:list\",\"sort\":30}]', '3fc318c7-b6e9-48c2-90ad-5fd7caa16d71', '{\"success\":true,\"message\":\"成功\"}', 111, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 05:06:18', 1, '2018-06-16 05:06:18', NULL, b'0');
INSERT INTO `sys_log` VALUES (185, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', '3fc318c7-b6e9-48c2-90ad-5fd7caa16d71', '\"admin/system/menu/test\"', 1, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 05:06:19', 1, '2018-06-16 05:06:19', NULL, b'0');
INSERT INTO `sys_log` VALUES (186, 'Ajax请求', '保存编辑菜单数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/edit', 'POST', 'com.mysiteforme.admin.controller.system.MenuController.edit', '[{\"bgColor\":\"#7e8755\",\"delFlag\":false,\"href\":\"/admin/druid/list\",\"icon\":\"\",\"id\":60,\"isShow\":true,\"name\":\"Druid数据监控\",\"permission\":\"sys:druid:list\",\"sort\":25}]', '3fc318c7-b6e9-48c2-90ad-5fd7caa16d71', '{\"success\":true,\"message\":\"成功\"}', 51, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 05:06:26', 1, '2018-06-16 05:06:26', NULL, b'0');
INSERT INTO `sys_log` VALUES (187, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', '3fc318c7-b6e9-48c2-90ad-5fd7caa16d71', '\"admin/system/menu/test\"', 1, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 05:06:28', 1, '2018-06-16 05:06:28', NULL, b'0');
INSERT INTO `sys_log` VALUES (188, 'Ajax请求', '保存编辑角色数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/edit', 'POST', 'com.mysiteforme.admin.controller.system.RoleController.edit', '[{\"delFlag\":false,\"id\":2,\"menuSet\":[{\"delFlag\":false,\"id\":42,\"sort\":30},{\"delFlag\":false,\"id\":54,\"sort\":30},{\"delFlag\":false,\"id\":23,\"sort\":30},{\"delFlag\":false,\"id\":48,\"sort\":30},{\"delFlag\":false,\"id\":9,\"sort\":30},{\"delFlag\":false,\"id\":31,\"sort\":30},{\"delFlag\":false,\"id\":29,\"sort\":30},{\"delFlag\":false,\"id\":32,\"sort\":30},{\"delFlag\":false,\"id\":11,\"sort\":30},{\"delFlag\":false,\"id\":1,\"sort\":30},{\"delFlag\":false,\"id\":39,\"sort\":30},{\"delFlag\":false,\"id\":20,\"sort\":30},{\"delFlag\":false,\"id\":44,\"sort\":30},{\"delFlag\":false,\"id\":47,\"sort\":30},{\"delFlag\":false,\"id\":25,\"sort\":30},{\"delFlag\":false,\"id\":35,\"sort\":30},{\"delFlag\":false,\"id\":37,\"sort\":30},{\"delFlag\":false,\"id\":56,\"sort\":30},{\"delFlag\":false,\"id\":45,\"sort\":30},{\"delFlag\":false,\"id\":2,\"sort\":30},{\"delFlag\":false,\"id\":60,\"sort\":30},{\"delFlag\":false,\"id\":30,\"sort\":30},{\"delFlag\":false,\"id\":18,\"sort\":30},{\"delFlag\":false,\"id\":14,\"sort\":30},{\"delFlag\":false,\"id\":10,\"sort\":30},{\"delFlag\":false,\"id\":27,\"sort\":30},{\"delFlag\":false,\"id\":46,\"sort\":30},{\"delFlag\":false,\"id\":26,\"sort\":30},{\"delFlag\":false,\"id\":43,\"sort\":30},{\"delFlag\":false,\"id\":52,\"sort\":30},{\"delFlag\":false,\"id\":55,\"sort\":30},{\"delFlag\":false,\"id\":22,\"sort\":30},{\"delFlag\":false,\"id\":58,\"sort\":30},{\"delFlag\":false,\"id\":15,\"sort\":30},{\"delFlag\":false,\"id\":16,\"sort\":30},{\"delFlag\":false,\"id\":40,\"sort\":30},{\"delFlag\":false,\"id\":28,\"sort\":30},{\"delFlag\":false,\"id\":19,\"sort\":30},{\"delFlag\":false,\"id\":41,\"sort\":30},{\"delFlag\":false,\"id\":17,\"sort\":30},{\"delFlag\":false,\"id\":6,\"sort\":30},{\"delFlag\":false,\"id\":21,\"sort\":30},{\"delFlag\":false,\"id\":13,\"sort\":30},{\"delFlag\":false,\"id\":4,\"sort\":30},{\"delFlag\":false,\"id\":12,\"sort\":30},{\"delFlag\":false,\"id\":3,\"sort\":30},{\"delFlag\":false,\"id\":49,\"sort\":30},{\"delFlag\":false,\"id\":7,\"sort\":30},{\"delFlag\":false,\"id\":5,\"sort\":30},{\"delFlag\":false,\"id\":50,\"sort\":30},{\"delFlag\":false,\"id\":53,\"sort\":30},{\"delFlag\":false,\"id\":36,\"sort\":30},{\"delFlag\":false,\"id\":57,\"sort\":30},{\"delFlag\":false,\"id\":38,\"sort\":30},{\"delFlag\":false,\"id\":51,\"sort\":30},{\"delFlag\":false,\"id\":34,\"sort\":30},{\"delFlag\":false,\"id\":24,\"sort\":30},{\"delFlag\":false,\"id\":8,\"sort\":30},{\"delFlag\":false,\"id\":33,\"sort\":30}],\"name\":\"系统管理员\",\"remarks\":\"\"}]', '3fc318c7-b6e9-48c2-90ad-5fd7caa16d71', '{\"success\":true,\"message\":\"成功\"}', 71, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 05:06:37', 1, '2018-06-16 05:06:37', NULL, b'0');
INSERT INTO `sys_log` VALUES (189, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.mysiteforme.admin.controller.system.RoleController.list', '[]', '3fc318c7-b6e9-48c2-90ad-5fd7caa16d71', '\"admin/system/role/list\"', 2, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 05:06:38', 1, '2018-06-16 05:06:38', NULL, b'0');
INSERT INTO `sys_log` VALUES (190, 'Ajax请求', '保存编辑角色数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/edit', 'POST', 'com.mysiteforme.admin.controller.system.RoleController.edit', '[{\"delFlag\":false,\"id\":2,\"menuSet\":[{\"delFlag\":false,\"id\":6,\"sort\":30},{\"delFlag\":false,\"id\":4,\"sort\":30},{\"delFlag\":false,\"id\":20,\"sort\":30},{\"delFlag\":false,\"id\":24,\"sort\":30},{\"delFlag\":false,\"id\":31,\"sort\":30},{\"delFlag\":false,\"id\":25,\"sort\":30},{\"delFlag\":false,\"id\":60,\"sort\":30},{\"delFlag\":false,\"id\":38,\"sort\":30},{\"delFlag\":false,\"id\":58,\"sort\":30},{\"delFlag\":false,\"id\":16,\"sort\":30},{\"delFlag\":false,\"id\":18,\"sort\":30},{\"delFlag\":false,\"id\":17,\"sort\":30},{\"delFlag\":false,\"id\":26,\"sort\":30},{\"delFlag\":false,\"id\":47,\"sort\":30},{\"delFlag\":false,\"id\":9,\"sort\":30},{\"delFlag\":false,\"id\":27,\"sort\":30},{\"delFlag\":false,\"id\":3,\"sort\":30},{\"delFlag\":false,\"id\":13,\"sort\":30},{\"delFlag\":false,\"id\":14,\"sort\":30},{\"delFlag\":false,\"id\":52,\"sort\":30},{\"delFlag\":false,\"id\":35,\"sort\":30},{\"delFlag\":false,\"id\":10,\"sort\":30},{\"delFlag\":false,\"id\":42,\"sort\":30},{\"delFlag\":false,\"id\":15,\"sort\":30},{\"delFlag\":false,\"id\":55,\"sort\":30},{\"delFlag\":false,\"id\":48,\"sort\":30},{\"delFlag\":false,\"id\":19,\"sort\":30},{\"delFlag\":false,\"id\":59,\"sort\":30},{\"delFlag\":false,\"id\":1,\"sort\":30},{\"delFlag\":false,\"id\":28,\"sort\":30},{\"delFlag\":false,\"id\":39,\"sort\":30},{\"delFlag\":false,\"id\":49,\"sort\":30},{\"delFlag\":false,\"id\":56,\"sort\":30},{\"delFlag\":false,\"id\":36,\"sort\":30},{\"delFlag\":false,\"id\":33,\"sort\":30},{\"delFlag\":false,\"id\":12,\"sort\":30},{\"delFlag\":false,\"id\":8,\"sort\":30},{\"delFlag\":false,\"id\":40,\"sort\":30},{\"delFlag\":false,\"id\":50,\"sort\":30},{\"delFlag\":false,\"id\":5,\"sort\":30},{\"delFlag\":false,\"id\":7,\"sort\":30},{\"delFlag\":false,\"id\":45,\"sort\":30},{\"delFlag\":false,\"id\":23,\"sort\":30},{\"delFlag\":false,\"id\":53,\"sort\":30},{\"delFlag\":false,\"id\":32,\"sort\":30},{\"delFlag\":false,\"id\":21,\"sort\":30},{\"delFlag\":false,\"id\":29,\"sort\":30},{\"delFlag\":false,\"id\":37,\"sort\":30},{\"delFlag\":false,\"id\":2,\"sort\":30},{\"delFlag\":false,\"id\":41,\"sort\":30},{\"delFlag\":false,\"id\":34,\"sort\":30},{\"delFlag\":false,\"id\":43,\"sort\":30},{\"delFlag\":false,\"id\":57,\"sort\":30},{\"delFlag\":false,\"id\":44,\"sort\":30},{\"delFlag\":false,\"id\":30,\"sort\":30},{\"delFlag\":false,\"id\":46,\"sort\":30},{\"delFlag\":false,\"id\":54,\"sort\":30},{\"delFlag\":false,\"id\":11,\"sort\":30},{\"delFlag\":false,\"id\":22,\"sort\":30},{\"delFlag\":false,\"id\":51,\"sort\":30}],\"name\":\"系统管理员\",\"remarks\":\"\"}]', '3fc318c7-b6e9-48c2-90ad-5fd7caa16d71', '{\"success\":true,\"message\":\"成功\"}', 47, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 05:06:49', 1, '2018-06-16 05:06:49', NULL, b'0');
INSERT INTO `sys_log` VALUES (191, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.mysiteforme.admin.controller.system.RoleController.list', '[]', '3fc318c7-b6e9-48c2-90ad-5fd7caa16d71', '\"admin/system/role/list\"', 3, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 05:06:50', 1, '2018-06-16 05:06:50', NULL, b'0');
INSERT INTO `sys_log` VALUES (192, '普通请求', '退出系统', '127.0.0.1', '我是管理员', 'http://localhost:8080/systemLogout', 'GET', 'com.mysiteforme.admin.controller.LoginController.logOut', '[]', '3fc318c7-b6e9-48c2-90ad-5fd7caa16d71', '\"redirect:/login\"', 4, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, NULL, '2018-06-16 05:07:01', NULL, '2018-06-16 05:07:01', NULL, b'0');
INSERT INTO `sys_log` VALUES (193, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@3292fefe\"]', 'aa1fcc75-b5f6-403a-beb2-8c242b9e699a', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 42, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 05:07:08', 1, '2018-06-16 05:07:08', NULL, b'0');
INSERT INTO `sys_log` VALUES (194, '普通请求', '跳转博客标签列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogTags/list', 'GET', 'com.mysiteforme.admin.controller.BlogTagsController.list', '[]', 'aa1fcc75-b5f6-403a-beb2-8c242b9e699a', '\"/admin/blogTags/list\"', 4, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 05:07:31', 1, '2018-06-16 05:07:31', NULL, b'0');
INSERT INTO `sys_log` VALUES (195, '普通请求', '跳转定时任务列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/quartzTask/list', 'GET', 'com.mysiteforme.admin.controller.QuartzTaskController.list', '[]', 'aa1fcc75-b5f6-403a-beb2-8c242b9e699a', '\"/admin/quartzTask/list\"', 4, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 05:07:38', 1, '2018-06-16 05:07:38', NULL, b'0');
INSERT INTO `sys_log` VALUES (196, '普通请求', '跳转任务执行日志列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/quartzTaskLog/list', 'GET', 'com.mysiteforme.admin.controller.QuartzTaskLogController.list', '[]', 'aa1fcc75-b5f6-403a-beb2-8c242b9e699a', '\"/admin/quartzTaskLog/list\"', 3, 'Windows-Chrome-67.0.3396.87', NULL, NULL, NULL, NULL, NULL, '1', '2018-06-16 05:07:39', 1, '2018-06-16 05:07:39', NULL, b'0');
INSERT INTO `sys_log` VALUES (197, 'Ajax请求', '用户登录', '127.0.0.1', '普通管理员', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@5260a986\"]', 'b2244023-4818-48b2-ba92-c06ad58350c1', '{\"success\":false,\"message\":\"验证码错误\"}', 12, 'Windows-Chrome-68.0.3440.15', NULL, NULL, NULL, NULL, NULL, '1', '2018-07-12 18:43:44', 1, '2018-07-12 18:43:44', NULL, b'0');
INSERT INTO `sys_log` VALUES (198, 'Ajax请求', '用户登录', '127.0.0.1', '普通管理员', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@f2ea693\"]', 'b2244023-4818-48b2-ba92-c06ad58350c1', '{\"success\":false,\"message\":\"登录密码错误.\"}', 174, 'Windows-Chrome-68.0.3440.15', NULL, NULL, NULL, NULL, NULL, '1', '2018-07-12 18:43:47', 1, '2018-07-12 18:43:47', NULL, b'0');
INSERT INTO `sys_log` VALUES (199, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@58a6b1bd\"]', 'b2244023-4818-48b2-ba92-c06ad58350c1', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 83, 'Windows-Chrome-68.0.3440.15', NULL, NULL, NULL, NULL, NULL, '1', '2018-07-12 18:43:55', 1, '2018-07-12 18:43:55', NULL, b'0');
INSERT INTO `sys_log` VALUES (200, '普通请求', '跳转网站展示页面', '127.0.0.1', '普通管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', 'b2244023-4818-48b2-ba92-c06ad58350c1', '\"admin/system/site/show\"', 8, 'Windows-Chrome-68.0.3440.15', NULL, NULL, NULL, NULL, NULL, '1', '2018-07-12 18:43:55', 1, '2018-07-12 18:43:55', NULL, b'0');
INSERT INTO `sys_log` VALUES (201, '普通请求', '跳转网站展示页面', '127.0.0.1', '普通管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', 'b2244023-4818-48b2-ba92-c06ad58350c1', '\"admin/system/site/show\"', 7, 'Windows-Chrome-68.0.3440.15', NULL, NULL, NULL, NULL, NULL, '1', '2018-07-12 18:45:36', 1, '2018-07-12 18:45:36', NULL, b'0');
INSERT INTO `sys_log` VALUES (202, 'Ajax请求', '保存网站基本数据', '127.0.0.1', '普通管理员', 'http://localhost:8080/admin/system/site/edit', 'POST', 'com.mysiteforme.admin.controller.system.SiteController.edit', '[{\"address\":\"江苏-苏州\",\"author\":\"wangl\",\"authorIcon\":\"https://static.mysiteforme.com/3c5b69f4-2e39-4f88-b302-a6eb48e4c43a.jpg\",\"database\":\"mysql\",\"delFlag\":false,\"description\":\"网站描述\",\"email\":\"1115784675@qq.com\",\"git\":\"https://gitee.com/wanglingxiao/\",\"github\":\"https://github.com/wangl1989\",\"id\":1,\"keywords\":\"\",\"logo\":\"http://ow9lg82yy.bkt.clouddn.com/24f5c360-485d-4a6d-9468-2a61c353cf37.ico\",\"maxUpload\":2,\"name\":\"孤独的旅行家\",\"noName\":false,\"openMessage\":true,\"phone\":\"13776055179\",\"powerby\":\"\",\"qq\":\"1115784675\",\"record\":\"苏ICP备17063650号\",\"remarks\":\"<p>89年小码农一只,从事java后台开发</p><p><br></p>\",\"server\":\"windows\",\"url\":\"https://mysiteforme.com/\",\"version\":\"1.0\",\"weibo\":\"https://weibo.com/u/2173866382\"},\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@4e0ef957\"]', 'b2244023-4818-48b2-ba92-c06ad58350c1', '{\"success\":true,\"message\":\"成功\"}', 39, 'Windows-Chrome-68.0.3440.15', NULL, NULL, NULL, NULL, NULL, '1', '2018-07-12 18:45:42', 1, '2018-07-12 18:45:42', NULL, b'0');
INSERT INTO `sys_log` VALUES (203, '普通请求', '跳转网站展示页面', '127.0.0.1', '普通管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', 'b2244023-4818-48b2-ba92-c06ad58350c1', '\"admin/system/site/show\"', 6, 'Windows-Chrome-68.0.3440.15', NULL, NULL, NULL, NULL, NULL, '1', '2018-07-12 18:45:45', 1, '2018-07-12 18:45:45', NULL, b'0');
INSERT INTO `sys_log` VALUES (204, 'Ajax请求', '保存网站基本数据', '127.0.0.1', '普通管理员', 'http://localhost:8080/admin/system/site/edit', 'POST', 'com.mysiteforme.admin.controller.system.SiteController.edit', '[{\"address\":\"江苏-苏州\",\"author\":\"wangl\",\"authorIcon\":\"https://static.mysiteforme.com/3c5b69f4-2e39-4f88-b302-a6eb48e4c43a.jpg\",\"database\":\"mysql\",\"delFlag\":false,\"description\":\"网站描述\",\"email\":\"1115784675@qq.com\",\"fileUploadType\":\"local\",\"git\":\"https://gitee.com/wanglingxiao/\",\"github\":\"https://github.com/wangl1989\",\"id\":1,\"keywords\":\"\",\"logo\":\"http://ow9lg82yy.bkt.clouddn.com/24f5c360-485d-4a6d-9468-2a61c353cf37.ico\",\"maxUpload\":2,\"name\":\"孤独的旅行家\",\"noName\":false,\"openMessage\":true,\"phone\":\"13776055179\",\"powerby\":\"\",\"qq\":\"1115784675\",\"record\":\"苏ICP备17063650号\",\"remarks\":\"<p>89年小码农一只,从事java后台开发</p><p><br></p>\",\"server\":\"windows\",\"url\":\"https://mysiteforme.com/\",\"version\":\"1.0\",\"weibo\":\"https://weibo.com/u/2173866382\"},\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@47915de1\"]', 'b2244023-4818-48b2-ba92-c06ad58350c1', '{\"success\":true,\"message\":\"成功\"}', 17, 'Windows-Chrome-68.0.3440.15', NULL, NULL, NULL, NULL, NULL, '1', '2018-07-12 18:45:52', 1, '2018-07-12 18:45:52', NULL, b'0');
INSERT INTO `sys_log` VALUES (205, '普通请求', '跳转网站展示页面', '127.0.0.1', '普通管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', 'b2244023-4818-48b2-ba92-c06ad58350c1', '\"admin/system/site/show\"', 4, 'Windows-Chrome-68.0.3440.15', NULL, NULL, NULL, NULL, NULL, '1', '2018-07-12 18:45:55', 1, '2018-07-12 18:45:55', NULL, b'0');
INSERT INTO `sys_log` VALUES (206, '普通请求', '跳转菜单列表', '127.0.0.1', '普通管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', 'b2244023-4818-48b2-ba92-c06ad58350c1', '\"admin/system/menu/test\"', 5, 'Windows-Chrome-68.0.3440.15', NULL, NULL, NULL, NULL, NULL, '1', '2018-07-12 18:46:19', 1, '2018-07-12 18:46:19', NULL, b'0');
INSERT INTO `sys_log` VALUES (207, 'Ajax请求', '保存新增菜单数据', '127.0.0.1', '普通管理员', 'http://localhost:8080/admin/system/menu/add', 'POST', 'com.mysiteforme.admin.controller.system.MenuController.add', '[{\"bgColor\":\"\",\"delFlag\":false,\"href\":\"\",\"icon\":\"\",\"isShow\":false,\"name\":\"七牛云存储信息\",\"parentId\":7,\"permission\":\"sys:site:editQiniu\",\"sort\":30}]', 'b2244023-4818-48b2-ba92-c06ad58350c1', '{\"success\":true,\"message\":\"成功\"}', 61, 'Windows-Chrome-68.0.3440.15', NULL, NULL, NULL, NULL, NULL, '1', '2018-07-12 18:46:39', 1, '2018-07-12 18:46:39', NULL, b'0');
INSERT INTO `sys_log` VALUES (208, '普通请求', '跳转菜单列表', '127.0.0.1', '普通管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', 'b2244023-4818-48b2-ba92-c06ad58350c1', '\"admin/system/menu/test\"', 3, 'Windows-Chrome-68.0.3440.15', NULL, NULL, NULL, NULL, NULL, '1', '2018-07-12 18:46:41', 1, '2018-07-12 18:46:41', NULL, b'0');
INSERT INTO `sys_log` VALUES (209, 'Ajax请求', '保存新增菜单数据', '127.0.0.1', '普通管理员', 'http://localhost:8080/admin/system/menu/add', 'POST', 'com.mysiteforme.admin.controller.system.MenuController.add', '[{\"bgColor\":\"\",\"delFlag\":false,\"href\":\"\",\"icon\":\"\",\"isShow\":false,\"name\":\"阿里云信息存储\",\"parentId\":7,\"permission\":\"sys:site:editOss\",\"sort\":30}]', 'b2244023-4818-48b2-ba92-c06ad58350c1', '{\"success\":true,\"message\":\"成功\"}', 48, 'Windows-Chrome-68.0.3440.15', NULL, NULL, NULL, NULL, NULL, '1', '2018-07-12 18:47:05', 1, '2018-07-12 18:47:05', NULL, b'0');
INSERT INTO `sys_log` VALUES (210, '普通请求', '跳转菜单列表', '127.0.0.1', '普通管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', 'b2244023-4818-48b2-ba92-c06ad58350c1', '\"admin/system/menu/test\"', 2, 'Windows-Chrome-68.0.3440.15', NULL, NULL, NULL, NULL, NULL, '1', '2018-07-12 18:47:07', 1, '2018-07-12 18:47:07', NULL, b'0');
INSERT INTO `sys_log` VALUES (211, '普通请求', '跳转角色列表页面', '127.0.0.1', '普通管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.mysiteforme.admin.controller.system.RoleController.list', '[]', 'b2244023-4818-48b2-ba92-c06ad58350c1', '\"admin/system/role/list\"', 5, 'Windows-Chrome-68.0.3440.15', NULL, NULL, NULL, NULL, NULL, '1', '2018-07-12 18:47:08', 1, '2018-07-12 18:47:08', NULL, b'0');
INSERT INTO `sys_log` VALUES (212, 'Ajax请求', '保存编辑角色数据', '127.0.0.1', '普通管理员', 'http://localhost:8080/admin/system/role/edit', 'POST', 'com.mysiteforme.admin.controller.system.RoleController.edit', '[{\"delFlag\":false,\"id\":2,\"menuSet\":[{\"delFlag\":false,\"id\":6,\"sort\":30},{\"delFlag\":false,\"id\":50,\"sort\":30},{\"delFlag\":false,\"id\":14,\"sort\":30},{\"delFlag\":false,\"id\":5,\"sort\":30},{\"delFlag\":false,\"id\":49,\"sort\":30},{\"delFlag\":false,\"id\":42,\"sort\":30},{\"delFlag\":false,\"id\":37,\"sort\":30},{\"delFlag\":false,\"id\":38,\"sort\":30},{\"delFlag\":false,\"id\":32,\"sort\":30},{\"delFlag\":false,\"id\":16,\"sort\":30},{\"delFlag\":false,\"id\":43,\"sort\":30},{\"delFlag\":false,\"id\":3,\"sort\":30},{\"delFlag\":false,\"id\":28,\"sort\":30},{\"delFlag\":false,\"id\":52,\"sort\":30},{\"delFlag\":false,\"id\":19,\"sort\":30},{\"delFlag\":false,\"id\":22,\"sort\":30},{\"delFlag\":false,\"id\":58,\"sort\":30},{\"delFlag\":false,\"id\":47,\"sort\":30},{\"delFlag\":false,\"id\":25,\"sort\":30},{\"delFlag\":false,\"id\":34,\"sort\":30},{\"delFlag\":false,\"id\":4,\"sort\":30},{\"delFlag\":false,\"id\":8,\"sort\":30},{\"delFlag\":false,\"id\":13,\"sort\":30},{\"delFlag\":false,\"id\":31,\"sort\":30},{\"delFlag\":false,\"id\":62,\"sort\":30},{\"delFlag\":false,\"id\":15,\"sort\":30},{\"delFlag\":false,\"id\":9,\"sort\":30},{\"delFlag\":false,\"id\":10,\"sort\":30},{\"delFlag\":false,\"id\":21,\"sort\":30},{\"delFlag\":false,\"id\":20,\"sort\":30},{\"delFlag\":false,\"id\":2,\"sort\":30},{\"delFlag\":false,\"id\":44,\"sort\":30},{\"delFlag\":false,\"id\":7,\"sort\":30},{\"delFlag\":false,\"id\":36,\"sort\":30},{\"delFlag\":false,\"id\":35,\"sort\":30},{\"delFlag\":false,\"id\":56,\"sort\":30},{\"delFlag\":false,\"id\":57,\"sort\":30},{\"delFlag\":false,\"id\":59,\"sort\":30},{\"delFlag\":false,\"id\":27,\"sort\":30},{\"delFlag\":false,\"id\":39,\"sort\":30},{\"delFlag\":false,\"id\":1,\"sort\":30},{\"delFlag\":false,\"id\":40,\"sort\":30},{\"delFlag\":false,\"id\":18,\"sort\":30},{\"delFlag\":false,\"id\":46,\"sort\":30},{\"delFlag\":false,\"id\":23,\"sort\":30},{\"delFlag\":false,\"id\":60,\"sort\":30},{\"delFlag\":false,\"id\":61,\"sort\":30},{\"delFlag\":false,\"id\":30,\"sort\":30},{\"delFlag\":false,\"id\":55,\"sort\":30},{\"delFlag\":false,\"id\":53,\"sort\":30},{\"delFlag\":false,\"id\":41,\"sort\":30},{\"delFlag\":false,\"id\":48,\"sort\":30},{\"delFlag\":false,\"id\":26,\"sort\":30},{\"delFlag\":false,\"id\":11,\"sort\":30},{\"delFlag\":false,\"id\":29,\"sort\":30},{\"delFlag\":false,\"id\":12,\"sort\":30},{\"delFlag\":false,\"id\":17,\"sort\":30},{\"delFlag\":false,\"id\":54,\"sort\":30},{\"delFlag\":false,\"id\":33,\"sort\":30},{\"delFlag\":false,\"id\":24,\"sort\":30},{\"delFlag\":false,\"id\":45,\"sort\":30},{\"delFlag\":false,\"id\":51,\"sort\":30}],\"name\":\"系统管理员\",\"remarks\":\"\"}]', 'b2244023-4818-48b2-ba92-c06ad58350c1', '{\"success\":true,\"message\":\"成功\"}', 37, 'Windows-Chrome-68.0.3440.15', NULL, NULL, NULL, NULL, NULL, '1', '2018-07-12 18:47:20', 1, '2018-07-12 18:47:20', NULL, b'0');
INSERT INTO `sys_log` VALUES (213, '普通请求', '跳转角色列表页面', '127.0.0.1', '普通管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.mysiteforme.admin.controller.system.RoleController.list', '[]', 'b2244023-4818-48b2-ba92-c06ad58350c1', '\"admin/system/role/list\"', 2, 'Windows-Chrome-68.0.3440.15', NULL, NULL, NULL, NULL, NULL, '1', '2018-07-12 18:47:21', 1, '2018-07-12 18:47:21', NULL, b'0');
INSERT INTO `sys_log` VALUES (214, '普通请求', '退出系统', '127.0.0.1', '普通管理员', 'http://localhost:8080/systemLogout', 'GET', 'com.mysiteforme.admin.controller.LoginController.logOut', '[]', 'b2244023-4818-48b2-ba92-c06ad58350c1', '\"redirect:/login\"', 5, 'Windows-Chrome-68.0.3440.15', NULL, NULL, NULL, NULL, NULL, NULL, '2018-07-12 18:47:24', NULL, '2018-07-12 18:47:24', NULL, b'0');
INSERT INTO `sys_log` VALUES (215, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@305578e0\"]', '1607fb1d-0755-49e5-b842-4150028de5f0', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 16, 'Windows-Chrome-68.0.3440.15', NULL, NULL, NULL, NULL, NULL, '1', '2018-07-12 18:47:30', 1, '2018-07-12 18:47:30', NULL, b'0');
INSERT INTO `sys_log` VALUES (216, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', '1607fb1d-0755-49e5-b842-4150028de5f0', '\"admin/system/site/show\"', 3, 'Windows-Chrome-68.0.3440.15', NULL, NULL, NULL, NULL, NULL, '1', '2018-07-12 18:47:39', 1, '2018-07-12 18:47:39', NULL, b'0');
INSERT INTO `sys_log` VALUES (217, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', '1607fb1d-0755-49e5-b842-4150028de5f0', '\"admin/system/site/show\"', 4, 'Windows-Chrome-68.0.3440.15', NULL, NULL, NULL, NULL, NULL, '1', '2018-07-12 18:48:36', 1, '2018-07-12 18:48:36', NULL, b'0');
INSERT INTO `sys_log` VALUES (218, 'Ajax请求', '保存网站基本数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/edit', 'POST', 'com.mysiteforme.admin.controller.system.SiteController.edit', '[{\"address\":\"江苏-苏州\",\"author\":\"wangl\",\"authorIcon\":\"https://static.mysiteforme.com/3c5b69f4-2e39-4f88-b302-a6eb48e4c43a.jpg\",\"database\":\"mysql\",\"delFlag\":false,\"description\":\"网站描述\",\"email\":\"1115784675@qq.com\",\"fileUploadType\":\"qiniu\",\"git\":\"https://gitee.com/wanglingxiao/\",\"github\":\"https://github.com/wangl1989\",\"id\":1,\"keywords\":\"\",\"logo\":\"http://ow9lg82yy.bkt.clouddn.com/24f5c360-485d-4a6d-9468-2a61c353cf37.ico\",\"maxUpload\":2,\"name\":\"孤独的旅行家\",\"noName\":false,\"openMessage\":true,\"phone\":\"13776055179\",\"powerby\":\"\",\"qq\":\"1115784675\",\"record\":\"苏ICP备17063650号\",\"remarks\":\"<p>89年小码农一只,从事java后台开发</p><p><br></p>\",\"server\":\"windows\",\"url\":\"https://mysiteforme.com/\",\"version\":\"1.0\",\"weibo\":\"https://weibo.com/u/2173866382\"},\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@e53b02a\"]', '1607fb1d-0755-49e5-b842-4150028de5f0', '{\"success\":false,\"message\":\"七牛云存储信息不能为空\"}', 8, 'Windows-Chrome-68.0.3440.15', NULL, NULL, NULL, NULL, NULL, '1', '2018-07-12 18:48:43', 1, '2018-07-12 18:48:43', NULL, b'0');
INSERT INTO `sys_log` VALUES (219, 'Ajax请求', '保存网站基本数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/edit', 'POST', 'com.mysiteforme.admin.controller.system.SiteController.edit', '[{\"address\":\"江苏-苏州\",\"author\":\"wangl\",\"authorIcon\":\"https://static.mysiteforme.com/3c5b69f4-2e39-4f88-b302-a6eb48e4c43a.jpg\",\"database\":\"mysql\",\"delFlag\":false,\"description\":\"网站描述\",\"email\":\"1115784675@qq.com\",\"fileUploadType\":\"oss\",\"git\":\"https://gitee.com/wanglingxiao/\",\"github\":\"https://github.com/wangl1989\",\"id\":1,\"keywords\":\"\",\"logo\":\"http://ow9lg82yy.bkt.clouddn.com/24f5c360-485d-4a6d-9468-2a61c353cf37.ico\",\"maxUpload\":2,\"name\":\"孤独的旅行家\",\"noName\":false,\"openMessage\":true,\"phone\":\"13776055179\",\"powerby\":\"\",\"qq\":\"1115784675\",\"record\":\"苏ICP备17063650号\",\"remarks\":\"<p>89年小码农一只,从事java后台开发</p><p><br></p>\",\"server\":\"windows\",\"url\":\"https://mysiteforme.com/\",\"version\":\"1.0\",\"weibo\":\"https://weibo.com/u/2173866382\"},\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@47e33f6c\"]', '1607fb1d-0755-49e5-b842-4150028de5f0', '{\"success\":false,\"message\":\"阿里云存储信息不能为空\"}', 4, 'Windows-Chrome-68.0.3440.15', NULL, NULL, NULL, NULL, NULL, '1', '2018-07-12 18:48:50', 1, '2018-07-12 18:48:50', NULL, b'0');
INSERT INTO `sys_log` VALUES (220, 'Ajax请求', '保存网站基本数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/edit', 'POST', 'com.mysiteforme.admin.controller.system.SiteController.edit', '[{\"address\":\"江苏-苏州\",\"author\":\"wangl\",\"authorIcon\":\"https://static.mysiteforme.com/3c5b69f4-2e39-4f88-b302-a6eb48e4c43a.jpg\",\"database\":\"mysql\",\"delFlag\":false,\"description\":\"网站描述\",\"email\":\"1115784675@qq.com\",\"fileUploadType\":\"oss\",\"git\":\"https://gitee.com/wanglingxiao/\",\"github\":\"https://github.com/wangl1989\",\"id\":1,\"keywords\":\"\",\"logo\":\"http://ow9lg82yy.bkt.clouddn.com/24f5c360-485d-4a6d-9468-2a61c353cf37.ico\",\"maxUpload\":2,\"name\":\"孤独的旅行家\",\"noName\":false,\"openMessage\":true,\"phone\":\"13776055179\",\"powerby\":\"\",\"qq\":\"1115784675\",\"record\":\"苏ICP备17063650号\",\"remarks\":\"<p>89年小码农一只,从事java后台开发</p><p><br></p>\",\"server\":\"windows\",\"url\":\"https://mysiteforme.com/\",\"version\":\"1.0\",\"weibo\":\"https://weibo.com/u/2173866382\"},\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@2fb828b2\"]', '1607fb1d-0755-49e5-b842-4150028de5f0', '{\"success\":false,\"message\":\"阿里云存储信息不能为空\"}', 5, 'Windows-Chrome-68.0.3440.15', NULL, NULL, NULL, NULL, NULL, '1', '2018-07-12 18:48:57', 1, '2018-07-12 18:48:57', NULL, b'0');
INSERT INTO `sys_log` VALUES (221, 'Ajax请求', '保存网站基本数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/edit', 'POST', 'com.mysiteforme.admin.controller.system.SiteController.edit', '[{\"address\":\"江苏-苏州\",\"author\":\"wangl\",\"authorIcon\":\"https://static.mysiteforme.com/3c5b69f4-2e39-4f88-b302-a6eb48e4c43a.jpg\",\"database\":\"mysql\",\"delFlag\":false,\"description\":\"网站描述\",\"email\":\"1115784675@qq.com\",\"fileUploadType\":\"local\",\"git\":\"https://gitee.com/wanglingxiao/\",\"github\":\"https://github.com/wangl1989\",\"id\":1,\"keywords\":\"\",\"logo\":\"http://ow9lg82yy.bkt.clouddn.com/24f5c360-485d-4a6d-9468-2a61c353cf37.ico\",\"maxUpload\":2,\"name\":\"孤独的旅行家\",\"noName\":false,\"openMessage\":true,\"phone\":\"13776055179\",\"powerby\":\"\",\"qq\":\"1115784675\",\"record\":\"苏ICP备17063650号\",\"remarks\":\"<p>89年小码农一只,从事java后台开发</p><p><br></p>\",\"server\":\"windows\",\"url\":\"https://mysiteforme.com/\",\"version\":\"1.0\",\"weibo\":\"https://weibo.com/u/2173866382\"},\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@2d0fb588\"]', '1607fb1d-0755-49e5-b842-4150028de5f0', '{\"success\":true,\"message\":\"成功\"}', 18, 'Windows-Chrome-68.0.3440.15', NULL, NULL, NULL, NULL, NULL, '1', '2018-07-12 18:49:01', 1, '2018-07-12 18:49:01', NULL, b'0');
INSERT INTO `sys_log` VALUES (222, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', '1607fb1d-0755-49e5-b842-4150028de5f0', '\"admin/system/site/show\"', 5, 'Windows-Chrome-68.0.3440.15', NULL, NULL, NULL, NULL, NULL, '1', '2018-07-12 18:49:04', 1, '2018-07-12 18:49:04', NULL, b'0');
INSERT INTO `sys_log` VALUES (223, 'Ajax请求', '用户登录', '127.0.0.1', NULL, 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@86bc253\"]', '54e7090e-bc4a-4ec9-a60c-fcabf3c51e27', '{\"success\":false,\"message\":\"验证码错误\"}', 237, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-24 17:21:45', NULL, '2018-08-24 17:21:45', NULL, b'0');
INSERT INTO `sys_log` VALUES (224, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@773af6d5\"]', '54e7090e-bc4a-4ec9-a60c-fcabf3c51e27', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 317, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-24 17:21:55', 1, '2018-08-24 17:21:55', NULL, b'0');
INSERT INTO `sys_log` VALUES (225, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '54e7090e-bc4a-4ec9-a60c-fcabf3c51e27', '\"/admin/blogArticle/list\"', 6, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-24 17:22:06', 1, '2018-08-24 17:22:06', NULL, b'0');
INSERT INTO `sys_log` VALUES (226, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '54e7090e-bc4a-4ec9-a60c-fcabf3c51e27', '\"/admin/blogArticle/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-24 17:22:36', 1, '2018-08-24 17:22:36', NULL, b'0');
INSERT INTO `sys_log` VALUES (227, '普通请求', '跳转定时任务列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/quartzTask/list', 'GET', 'com.mysiteforme.admin.controller.QuartzTaskController.list', '[]', '54e7090e-bc4a-4ec9-a60c-fcabf3c51e27', '\"/admin/quartzTask/list\"', 6, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-24 17:23:09', 1, '2018-08-24 17:23:09', NULL, b'0');
INSERT INTO `sys_log` VALUES (228, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '54e7090e-bc4a-4ec9-a60c-fcabf3c51e27', '\"/admin/blogArticle/list\"', 5, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-24 17:23:27', 1, '2018-08-24 17:23:27', NULL, b'0');
INSERT INTO `sys_log` VALUES (229, 'Ajax请求', '文件上传', '127.0.0.1', '我是管理员', 'http://localhost:8080/file/upload/', 'POST', 'com.mysiteforme.admin.controller.system.FileController.uploadFile', '[\"org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@15991cca\",\"org.springframework.web.multipart.support.StandardMultipartHttpServletRequest@c161670\"]', '54e7090e-bc4a-4ec9-a60c-fcabf3c51e27', '{\"data\":{\"name\":\"dili1.jpg\",\"url\":\"/static/upload/c2bc254d-8524-4121-ae9e-ff2db90f0ef3.jpg\"},\"success\":true,\"message\":\"成功\"}', 64, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-24 17:23:51', 1, '2018-08-24 17:23:51', NULL, b'0');
INSERT INTO `sys_log` VALUES (230, '普通请求', '富文本编辑器文件上传', '127.0.0.1', '我是管理员', 'http://localhost:8080/file/uploadWang', 'POST', 'com.mysiteforme.admin.controller.system.FileController.uploadWang', '\"请求参数数据过长不与显示\"', '54e7090e-bc4a-4ec9-a60c-fcabf3c51e27', '{\"errno\":0,\"data\":[\"/static/upload/58987d5a-54a8-4fae-8d15-16ce6878869c.jpg\"]}', 113, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-24 17:24:40', 1, '2018-08-24 17:24:40', NULL, b'0');
INSERT INTO `sys_log` VALUES (231, 'Ajax请求', '保存新增博客内容数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/add', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.add', '[{\"category\":\"1\",\"channelId\":18,\"content\":\"<p><strike>​</strike>测试富文本<br></p><p><img src=\'/static/upload/58987d5a-54a8-4fae-8d15-16ce6878869c.jpg\' style=\'max-width:100%;\'><br></p><p>你好</p>\",\"delFlag\":false,\"marks\":\"测试富文本\",\"publistTime\":1535068800000,\"recommend\":false,\"resources\":\"\",\"showPic\":\"/static/upload/c2bc254d-8524-4121-ae9e-ff2db90f0ef3.jpg\",\"subTitle\":\"测试富文本\",\"text\":\"​测试富文本你好\",\"title\":\"测试富文本\",\"top\":false}]', '54e7090e-bc4a-4ec9-a60c-fcabf3c51e27', '{\"success\":true,\"message\":\"成功\"}', 140, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-24 17:24:56', 1, '2018-08-24 17:24:56', NULL, b'0');
INSERT INTO `sys_log` VALUES (232, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '54e7090e-bc4a-4ec9-a60c-fcabf3c51e27', '\"/admin/blogArticle/list\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-24 17:24:57', 1, '2018-08-24 17:24:57', NULL, b'0');
INSERT INTO `sys_log` VALUES (233, '普通请求', '跳转系统字典页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/dict/list', 'GET', 'com.mysiteforme.admin.controller.system.DictController.list', '[]', '54e7090e-bc4a-4ec9-a60c-fcabf3c51e27', '\"admin/system/dict/list\"', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-24 17:25:35', 1, '2018-08-24 17:25:35', NULL, b'0');
INSERT INTO `sys_log` VALUES (234, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', '54e7090e-bc4a-4ec9-a60c-fcabf3c51e27', '\"admin/system/site/show\"', 9, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-24 17:35:53', 1, '2018-08-24 17:35:53', NULL, b'0');
INSERT INTO `sys_log` VALUES (235, 'Ajax请求', '保存网站基本数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/edit', 'POST', 'com.mysiteforme.admin.controller.system.SiteController.edit', '[{\"address\":\"\",\"author\":\"jp\",\"authorIcon\":\"https://static.mysiteforme.com/3c5b69f4-2e39-4f88-b302-a6eb48e4c43a.jpg\",\"database\":\"mysql\",\"delFlag\":false,\"description\":\"\",\"email\":\"\",\"fileUploadType\":\"local\",\"git\":\"\",\"github\":\"\",\"id\":1,\"keywords\":\"\",\"logo\":\"http://ow9lg82yy.bkt.clouddn.com/24f5c360-485d-4a6d-9468-2a61c353cf37.ico\",\"maxUpload\":0,\"name\":\"云校园后台管理系统\",\"noName\":false,\"openMessage\":true,\"phone\":\"\",\"powerby\":\"\",\"qq\":\"\",\"record\":\"\",\"remarks\":\"<p><br></p><p><br></p>\",\"server\":\"windows\",\"url\":\"cloud-campus.com\",\"version\":\"1.0\",\"weibo\":\"\"},\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@1b29a9a8\"]', '54e7090e-bc4a-4ec9-a60c-fcabf3c51e27', '{\"success\":true,\"message\":\"成功\"}', 52, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-24 17:37:28', 1, '2018-08-24 17:37:28', NULL, b'0');
INSERT INTO `sys_log` VALUES (236, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', '54e7090e-bc4a-4ec9-a60c-fcabf3c51e27', '\"admin/system/site/show\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-24 17:37:31', 1, '2018-08-24 17:37:31', NULL, b'0');
INSERT INTO `sys_log` VALUES (237, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', '54e7090e-bc4a-4ec9-a60c-fcabf3c51e27', '\"admin/system/site/show\"', 6, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-24 17:37:32', 1, '2018-08-24 17:37:32', NULL, b'0');
INSERT INTO `sys_log` VALUES (238, 'Ajax请求', '保存网站基本数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/edit', 'POST', 'com.mysiteforme.admin.controller.system.SiteController.edit', '[{\"address\":\"江苏-苏州\",\"author\":\"jp\",\"authorIcon\":\"https://static.mysiteforme.com/3c5b69f4-2e39-4f88-b302-a6eb48e4c43a.jpg\",\"database\":\"mysql\",\"delFlag\":false,\"description\":\"网站描述\",\"email\":\"1115784675@qq.com\",\"fileUploadType\":\"local\",\"git\":\"https://gitee.com/wanglingxiao/\",\"github\":\"https://github.com/wangl1989\",\"id\":1,\"keywords\":\"\",\"logo\":\"http://ow9lg82yy.bkt.clouddn.com/24f5c360-485d-4a6d-9468-2a61c353cf37.ico\",\"maxUpload\":0,\"name\":\"云校园后台管理系统\",\"noName\":false,\"openMessage\":true,\"phone\":\"13776055179\",\"powerby\":\"\",\"qq\":\"1115784675\",\"record\":\"\",\"remarks\":\"<p><br></p><p><br></p>\",\"server\":\"windows\",\"url\":\"cloud-campus.com\",\"version\":\"1.0\",\"weibo\":\"https://weibo.com/u/2173866382\"},\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@25f71cdb\"]', '54e7090e-bc4a-4ec9-a60c-fcabf3c51e27', '{\"success\":true,\"message\":\"成功\"}', 127, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-24 17:37:51', 1, '2018-08-24 17:37:51', NULL, b'0');
INSERT INTO `sys_log` VALUES (239, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', '54e7090e-bc4a-4ec9-a60c-fcabf3c51e27', '\"admin/system/site/show\"', 6, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-24 17:37:53', 1, '2018-08-24 17:37:53', NULL, b'0');
INSERT INTO `sys_log` VALUES (240, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.mysiteforme.admin.controller.system.RoleController.list', '[]', '54e7090e-bc4a-4ec9-a60c-fcabf3c51e27', '\"admin/system/role/list\"', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-24 17:38:07', 1, '2018-08-24 17:38:07', NULL, b'0');
INSERT INTO `sys_log` VALUES (241, '普通请求', '跳转系统字典页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/dict/list', 'GET', 'com.mysiteforme.admin.controller.system.DictController.list', '[]', '54e7090e-bc4a-4ec9-a60c-fcabf3c51e27', '\"admin/system/dict/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-24 17:40:34', 1, '2018-08-24 17:40:34', NULL, b'0');
INSERT INTO `sys_log` VALUES (242, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '54e7090e-bc4a-4ec9-a60c-fcabf3c51e27', '\"/admin/blogArticle/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-24 17:41:03', 1, '2018-08-24 17:41:03', NULL, b'0');
INSERT INTO `sys_log` VALUES (243, '普通请求', '跳转数据表列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/table/list', 'GET', 'com.mysiteforme.admin.controller.system.TableController.list', '[]', '54e7090e-bc4a-4ec9-a60c-fcabf3c51e27', '\"admin/system/table/list\"', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-24 17:41:26', 1, '2018-08-24 17:41:26', NULL, b'0');
INSERT INTO `sys_log` VALUES (244, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', '54e7090e-bc4a-4ec9-a60c-fcabf3c51e27', '\"admin/system/site/show\"', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-24 17:41:34', 1, '2018-08-24 17:41:34', NULL, b'0');
INSERT INTO `sys_log` VALUES (245, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', '54e7090e-bc4a-4ec9-a60c-fcabf3c51e27', '\"admin/system/user/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-24 17:44:51', 1, '2018-08-24 17:44:51', NULL, b'0');
INSERT INTO `sys_log` VALUES (246, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@6b5d112c\"]', '771316d1-4b17-40bf-a01e-9d64d917aeac', '{\"success\":false,\"message\":\"帐号不存在\"}', 492, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 20:32:51', 1, '2018-08-25 20:32:51', NULL, b'0');
INSERT INTO `sys_log` VALUES (247, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@45aa2b7\"]', '771316d1-4b17-40bf-a01e-9d64d917aeac', '{\"success\":false,\"message\":\"帐号不存在\"}', 18, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 20:33:05', 1, '2018-08-25 20:33:05', NULL, b'0');
INSERT INTO `sys_log` VALUES (248, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@54ec3f59\"]', '771316d1-4b17-40bf-a01e-9d64d917aeac', '{\"success\":false,\"message\":\"验证码错误\"}', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 20:33:05', 1, '2018-08-25 20:33:05', NULL, b'0');
INSERT INTO `sys_log` VALUES (249, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@6fcaa4b2\"]', '771316d1-4b17-40bf-a01e-9d64d917aeac', '{\"success\":false,\"message\":\"帐号不存在\"}', 17, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 20:33:12', 1, '2018-08-25 20:33:12', NULL, b'0');
INSERT INTO `sys_log` VALUES (250, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@58a4b5b3\"]', '771316d1-4b17-40bf-a01e-9d64d917aeac', '{\"success\":false,\"message\":\"验证码错误\"}', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 20:33:58', 1, '2018-08-25 20:33:58', NULL, b'0');
INSERT INTO `sys_log` VALUES (251, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@f5af0ad\"]', '771316d1-4b17-40bf-a01e-9d64d917aeac', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 273, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 20:34:09', 1, '2018-08-25 20:34:09', NULL, b'0');
INSERT INTO `sys_log` VALUES (252, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '771316d1-4b17-40bf-a01e-9d64d917aeac', '\"/admin/blogArticle/list\"', 5, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 20:34:12', 1, '2018-08-25 20:34:12', NULL, b'0');
INSERT INTO `sys_log` VALUES (253, '普通请求', '富文本编辑器文件上传', '127.0.0.1', '我是管理员', 'http://localhost:8080/file/uploadWang', 'POST', 'com.mysiteforme.admin.controller.system.FileController.uploadWang', '\"请求参数数据过长不与显示\"', '771316d1-4b17-40bf-a01e-9d64d917aeac', '{\"errno\":0,\"data\":[\"/static/upload/7dc49a95-f49f-427d-a946-9457f9bdd2f5.jpg\"]}', 70, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 20:34:26', 1, '2018-08-25 20:34:26', NULL, b'0');
INSERT INTO `sys_log` VALUES (254, '普通请求', '富文本编辑器文件上传', '127.0.0.1', '我是管理员', 'http://localhost:8080/file/uploadWang', 'POST', 'com.mysiteforme.admin.controller.system.FileController.uploadWang', '\"请求参数数据过长不与显示\"', '771316d1-4b17-40bf-a01e-9d64d917aeac', '{\"errno\":0,\"data\":[\"/static/upload/27ade600-dfe2-4d43-8d5c-bef9f703160c.jpg\"]}', 51, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 20:35:11', 1, '2018-08-25 20:35:11', NULL, b'0');
INSERT INTO `sys_log` VALUES (255, 'Ajax请求', '保存新增博客内容数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/add', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.add', '[{\"category\":\"1\",\"channelId\":18,\"content\":\"<p><img src=\'/static/upload/7dc49a95-f49f-427d-a946-9457f9bdd2f5.jpg\' style=\'max-width:100%;\'><br></p><p>你想怎么样</p><p><font color=\'#1c487f\'>哈哈啊哈</font></p><p><img src=\'/static/upload/27ade600-dfe2-4d43-8d5c-bef9f703160c.jpg\' style=\'max-width:100%;\'><font color=\'#1c487f\'><br></font></p>\",\"delFlag\":false,\"marks\":\"\",\"publistTime\":1535155200000,\"recommend\":false,\"resources\":\"\",\"showPic\":\"\",\"subTitle\":\"\",\"text\":\"你想怎么样哈哈啊哈\",\"title\":\"test\",\"top\":false}]', '771316d1-4b17-40bf-a01e-9d64d917aeac', '{\"success\":true,\"message\":\"成功\"}', 90, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 20:35:26', 1, '2018-08-25 20:35:26', NULL, b'0');
INSERT INTO `sys_log` VALUES (256, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '771316d1-4b17-40bf-a01e-9d64d917aeac', '\"/admin/blogArticle/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 20:35:28', 1, '2018-08-25 20:35:28', NULL, b'0');
INSERT INTO `sys_log` VALUES (257, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@15ba7a38\"]', '10ede62c-4490-408f-9b14-680f6ddc95b5', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 7, 'Mac-Safari-9.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 20:39:01', 1, '2018-08-25 20:39:01', NULL, b'0');
INSERT INTO `sys_log` VALUES (258, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '10ede62c-4490-408f-9b14-680f6ddc95b5', '\"/admin/blogArticle/list\"', 3, 'Mac-Safari-9.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 20:39:16', 1, '2018-08-25 20:39:16', NULL, b'0');
INSERT INTO `sys_log` VALUES (259, '普通请求', '退出系统', '127.0.0.1', '我是管理员', 'http://localhost:8080/systemLogout', 'GET', 'com.mysiteforme.admin.controller.LoginController.logOut', '[]', '10ede62c-4490-408f-9b14-680f6ddc95b5', '\"redirect:/login\"', 4, 'Mac-Safari-9.0', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-25 20:39:36', NULL, '2018-08-25 20:39:36', NULL, b'0');
INSERT INTO `sys_log` VALUES (260, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@7901006\"]', '60cfcc1e-577a-48c0-a2bd-506492b066db', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 6, 'Mac-Safari-9.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 20:40:01', 1, '2018-08-25 20:40:01', NULL, b'0');
INSERT INTO `sys_log` VALUES (261, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', '60cfcc1e-577a-48c0-a2bd-506492b066db', '\"admin/system/site/show\"', 10, 'Mac-Safari-9.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 20:40:04', 1, '2018-08-25 20:40:04', NULL, b'0');
INSERT INTO `sys_log` VALUES (262, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', '60cfcc1e-577a-48c0-a2bd-506492b066db', '\"admin/system/site/show\"', 4, 'Mac-Safari-9.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 20:40:11', 1, '2018-08-25 20:40:11', NULL, b'0');
INSERT INTO `sys_log` VALUES (263, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '60cfcc1e-577a-48c0-a2bd-506492b066db', '\"/admin/blogArticle/list\"', 2, 'Mac-Safari-9.0', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 20:42:19', 1, '2018-08-25 20:42:19', NULL, b'0');
INSERT INTO `sys_log` VALUES (264, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '771316d1-4b17-40bf-a01e-9d64d917aeac', '\"/admin/blogArticle/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 20:43:59', 1, '2018-08-25 20:43:59', NULL, b'0');
INSERT INTO `sys_log` VALUES (265, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '771316d1-4b17-40bf-a01e-9d64d917aeac', '\"/admin/blogArticle/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 20:47:47', 1, '2018-08-25 20:47:47', NULL, b'0');
INSERT INTO `sys_log` VALUES (266, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@1370f262\"]', '8a963c59-1bd1-4627-83ad-994542411198', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 15, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 22:24:29', 1, '2018-08-25 22:24:29', NULL, b'0');
INSERT INTO `sys_log` VALUES (267, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '8a963c59-1bd1-4627-83ad-994542411198', '\"/admin/blogArticle/list\"', 6, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 22:24:29', 1, '2018-08-25 22:24:29', NULL, b'0');
INSERT INTO `sys_log` VALUES (268, '普通请求', '跳转资源展示列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/rescource/list', 'GET', 'com.mysiteforme.admin.controller.system.RescourceController.list', '[]', '8a963c59-1bd1-4627-83ad-994542411198', '\"admin/system/rescource/list\"', 10, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 22:24:29', 1, '2018-08-25 22:24:29', NULL, b'0');
INSERT INTO `sys_log` VALUES (269, 'Ajax请求', '删除系统资源', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/rescource/delete', 'POST', 'com.mysiteforme.admin.controller.system.RescourceController.delete', '[[2]]', '8a963c59-1bd1-4627-83ad-994542411198', '{\"success\":true,\"message\":\"成功\"}', 683, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 22:24:38', 1, '2018-08-25 22:24:38', NULL, b'0');
INSERT INTO `sys_log` VALUES (270, 'Ajax请求', '删除系统资源', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/rescource/delete', 'POST', 'com.mysiteforme.admin.controller.system.RescourceController.delete', '[[2]]', '8a963c59-1bd1-4627-83ad-994542411198', '{\"success\":false,\"message\":\"请求参数不正确\"}', 11, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 22:24:39', 1, '2018-08-25 22:24:39', NULL, b'0');
INSERT INTO `sys_log` VALUES (271, 'Ajax请求', '删除系统资源', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/rescource/delete', 'POST', 'com.mysiteforme.admin.controller.system.RescourceController.delete', '[[3]]', '8a963c59-1bd1-4627-83ad-994542411198', '{\"success\":true,\"message\":\"成功\"}', 143, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 22:24:41', 1, '2018-08-25 22:24:41', NULL, b'0');
INSERT INTO `sys_log` VALUES (272, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', '8a963c59-1bd1-4627-83ad-994542411198', '\"admin/system/user/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 22:24:50', 1, '2018-08-25 22:24:50', NULL, b'0');
INSERT INTO `sys_log` VALUES (273, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', '8a963c59-1bd1-4627-83ad-994542411198', '\"admin/system/site/show\"', 6, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 22:25:21', 1, '2018-08-25 22:25:21', NULL, b'0');
INSERT INTO `sys_log` VALUES (274, '普通请求', '跳转数据表列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/table/list', 'GET', 'com.mysiteforme.admin.controller.system.TableController.list', '[]', '8a963c59-1bd1-4627-83ad-994542411198', '\"admin/system/table/list\"', 8, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 22:25:23', 1, '2018-08-25 22:25:23', NULL, b'0');
INSERT INTO `sys_log` VALUES (275, '普通请求', '跳转系统字典页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/dict/list', 'GET', 'com.mysiteforme.admin.controller.system.DictController.list', '[]', '8a963c59-1bd1-4627-83ad-994542411198', '\"admin/system/dict/list\"', 8, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 22:25:24', 1, '2018-08-25 22:25:24', NULL, b'0');
INSERT INTO `sys_log` VALUES (276, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '8a963c59-1bd1-4627-83ad-994542411198', '\"/admin/blogArticle/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 22:39:57', 1, '2018-08-25 22:39:57', NULL, b'0');
INSERT INTO `sys_log` VALUES (277, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '8a963c59-1bd1-4627-83ad-994542411198', '\"/admin/blogArticle/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 22:40:08', 1, '2018-08-25 22:40:08', NULL, b'0');
INSERT INTO `sys_log` VALUES (278, '普通请求', '富文本编辑器文件上传', '127.0.0.1', '我是管理员', 'http://localhost:8080/file/uploadWang', 'POST', 'com.mysiteforme.admin.controller.system.FileController.uploadWang', '\"请求参数数据过长不与显示\"', '8a963c59-1bd1-4627-83ad-994542411198', '{\"errno\":0,\"data\":[\"/static/upload/84428294-eaa8-43b6-9c5e-85306e054e05.jpg\"]}', 164, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 22:43:20', 1, '2018-08-25 22:43:20', NULL, b'0');
INSERT INTO `sys_log` VALUES (279, '普通请求', '富文本编辑器文件上传', '127.0.0.1', '我是管理员', 'http://localhost:8080/file/uploadWang', 'POST', 'com.mysiteforme.admin.controller.system.FileController.uploadWang', '\"请求参数数据过长不与显示\"', '8a963c59-1bd1-4627-83ad-994542411198', '{\"errno\":0,\"data\":[\"/static/upload/7dc49a95-f49f-427d-a946-9457f9bdd2f5.jpg\"]}', 18, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 22:43:54', 1, '2018-08-25 22:43:54', NULL, b'0');
INSERT INTO `sys_log` VALUES (280, 'Ajax请求', '富文本编辑器内容图片上传', '127.0.0.1', '我是管理员', 'http://localhost:8080/file/doContent/', 'POST', 'com.mysiteforme.admin.controller.system.FileController.doContent', '[\"<html>\\r\\n<body>\\r\\n<img src=\\\"http://d.ifengimg.com/w690_h400/p2.ifengimg.com/2018_34/EA969591ECC140B9266AA38E0198DA5BF9205AC6_w1024_h683.jpg\\\" />\\r\\n</body>\\r\\n\",\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@57f27b56\"]', '8a963c59-1bd1-4627-83ad-994542411198', '{\"data\":\"  \\n <img src=\\\"/static/upload/6328f797-d737-43ee-8b58-d082c12c66c1.jpg\\\">  \\n\",\"success\":true,\"message\":\"成功\"}', 302, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 22:50:58', 1, '2018-08-25 22:50:58', NULL, b'0');
INSERT INTO `sys_log` VALUES (281, '普通请求', '富文本编辑器文件上传', '127.0.0.1', '我是管理员', 'http://localhost:8080/file/uploadWang', 'POST', 'com.mysiteforme.admin.controller.system.FileController.uploadWang', '\"请求参数数据过长不与显示\"', '8a963c59-1bd1-4627-83ad-994542411198', '{\"errno\":0,\"data\":[\"/static/upload/2e29a19f-bd77-4ec9-b0e0-22181047147a.png\"]}', 90, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 22:50:58', 1, '2018-08-25 22:50:58', NULL, b'0');
INSERT INTO `sys_log` VALUES (282, 'Ajax请求', '保存编辑博客内容数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/edit', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.edit', '[{\"category\":\"1\",\"channelId\":18,\"content\":\"<p><strike>​</strike>​远程图片测试</p><p><img src=\'/static/upload/6328f797-d737-43ee-8b58-d082c12c66c1.jpg\'></p><p><br></p>\",\"delFlag\":false,\"id\":2,\"marks\":\"测试富文本\",\"publistTime\":1535068800000,\"recommend\":false,\"resources\":\"\",\"showPic\":\"/static/upload/c2bc254d-8524-4121-ae9e-ff2db90f0ef3.jpg\",\"sort\":0,\"subTitle\":\"远程图片测试\",\"text\":\"​​远程图片测试\",\"title\":\"远程图片测试\",\"top\":false}]', '8a963c59-1bd1-4627-83ad-994542411198', '{\"success\":true,\"message\":\"成功\"}', 71, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 22:51:25', 1, '2018-08-25 22:51:25', NULL, b'0');
INSERT INTO `sys_log` VALUES (283, '普通请求', '富文本编辑器文件上传', '127.0.0.1', '我是管理员', 'http://localhost:8080/file/uploadWang', 'POST', 'com.mysiteforme.admin.controller.system.FileController.uploadWang', '\"请求参数数据过长不与显示\"', '8a963c59-1bd1-4627-83ad-994542411198', '{\"errno\":0,\"data\":[\"/static/upload/4d165096-6b54-4b6f-a709-e72b94fb94a2.jpg\"]}', 155, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 22:55:13', 1, '2018-08-25 22:55:13', NULL, b'0');
INSERT INTO `sys_log` VALUES (284, '普通请求', '富文本编辑器文件上传', '127.0.0.1', '我是管理员', 'http://localhost:8080/file/uploadWang', 'POST', 'com.mysiteforme.admin.controller.system.FileController.uploadWang', '\"请求参数数据过长不与显示\"', '8a963c59-1bd1-4627-83ad-994542411198', '{\"errno\":0,\"data\":[\"/static/upload/84428294-eaa8-43b6-9c5e-85306e054e05.jpg\"]}', 9, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-25 23:02:05', 1, '2018-08-25 23:02:05', NULL, b'0');
INSERT INTO `sys_log` VALUES (285, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@6454527f\"]', 'd74a8091-b4e3-471c-b661-5be217c8c376', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 781, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 11:39:11', 1, '2018-08-26 11:39:11', NULL, b'0');
INSERT INTO `sys_log` VALUES (286, '普通请求', '跳转系统字典页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/dict/list', 'GET', 'com.mysiteforme.admin.controller.system.DictController.list', '[]', 'd74a8091-b4e3-471c-b661-5be217c8c376', '\"admin/system/dict/list\"', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 11:39:16', 1, '2018-08-26 11:39:16', NULL, b'0');
INSERT INTO `sys_log` VALUES (287, '普通请求', '跳转数据表列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/table/list', 'GET', 'com.mysiteforme.admin.controller.system.TableController.list', '[]', 'd74a8091-b4e3-471c-b661-5be217c8c376', '\"admin/system/table/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 11:39:36', 1, '2018-08-26 11:39:36', NULL, b'0');
INSERT INTO `sys_log` VALUES (288, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', 'd74a8091-b4e3-471c-b661-5be217c8c376', '\"admin/system/site/show\"', 8, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 11:39:44', 1, '2018-08-26 11:39:44', NULL, b'0');
INSERT INTO `sys_log` VALUES (289, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'd74a8091-b4e3-471c-b661-5be217c8c376', '\"/admin/blogArticle/list\"', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 11:46:43', 1, '2018-08-26 11:46:43', NULL, b'0');
INSERT INTO `sys_log` VALUES (290, '普通请求', '富文本编辑器文件上传', '127.0.0.1', '我是管理员', 'http://localhost:8080/file/uploadWang', 'POST', 'com.mysiteforme.admin.controller.system.FileController.uploadWang', '\"请求参数数据过长不与显示\"', 'd74a8091-b4e3-471c-b661-5be217c8c376', '{\"errno\":0,\"data\":[\"/static/upload/58378498-dc52-4369-9fcf-b7e9f59e5228.png\"]}', 61, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 11:47:22', 1, '2018-08-26 11:47:22', NULL, b'0');
INSERT INTO `sys_log` VALUES (291, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'd74a8091-b4e3-471c-b661-5be217c8c376', '\"/admin/blogArticle/list\"', 14, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 12:08:26', 1, '2018-08-26 12:08:26', NULL, b'0');
INSERT INTO `sys_log` VALUES (292, '普通请求', '富文本编辑器文件上传', '127.0.0.1', '我是管理员', 'http://localhost:8080/file/uploadWang', 'POST', 'com.mysiteforme.admin.controller.system.FileController.uploadWang', '\"请求参数数据过长不与显示\"', 'd74a8091-b4e3-471c-b661-5be217c8c376', '{\"errno\":0,\"data\":[\"/static/upload/58378498-dc52-4369-9fcf-b7e9f59e5228.png\"]}', 25, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 12:08:44', 1, '2018-08-26 12:08:45', NULL, b'0');
INSERT INTO `sys_log` VALUES (293, 'Ajax请求', '保存新增博客内容数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/add', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.add', '[{\"category\":\"1\",\"channelId\":4,\"content\":\"<p><img src=\'/static/upload/58378498-dc52-4369-9fcf-b7e9f59e5228.png\' style=\'max-width:100%;\'><br></p><p>你好啊</p>\",\"delFlag\":false,\"marks\":\"\",\"publistTime\":1535241600000,\"recommend\":false,\"resources\":\"\",\"showPic\":\"\",\"subTitle\":\"aaa\",\"text\":\"你好啊\",\"title\":\"AAAAAAAA\",\"top\":false}]', 'd74a8091-b4e3-471c-b661-5be217c8c376', '{\"success\":true,\"message\":\"成功\"}', 155, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 12:08:52', 1, '2018-08-26 12:08:52', NULL, b'0');
INSERT INTO `sys_log` VALUES (294, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'd74a8091-b4e3-471c-b661-5be217c8c376', '\"/admin/blogArticle/list\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 12:08:53', 1, '2018-08-26 12:08:53', NULL, b'0');
INSERT INTO `sys_log` VALUES (295, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'd74a8091-b4e3-471c-b661-5be217c8c376', '\"/admin/blogArticle/list\"', 11, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 12:20:46', 1, '2018-08-26 12:20:46', NULL, b'0');
INSERT INTO `sys_log` VALUES (296, 'Ajax请求', '删除博客内容数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/delete', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.delete', '[4]', 'd74a8091-b4e3-471c-b661-5be217c8c376', '{\"success\":true,\"message\":\"成功\"}', 59, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 12:20:51', 1, '2018-08-26 12:20:51', NULL, b'0');
INSERT INTO `sys_log` VALUES (297, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'd74a8091-b4e3-471c-b661-5be217c8c376', '\"/admin/blogArticle/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 12:20:52', 1, '2018-08-26 12:20:52', NULL, b'0');
INSERT INTO `sys_log` VALUES (298, 'Ajax请求', '删除博客内容数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/delete', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.delete', '[3]', 'd74a8091-b4e3-471c-b661-5be217c8c376', '{\"success\":true,\"message\":\"成功\"}', 52, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 12:20:55', 1, '2018-08-26 12:20:55', NULL, b'0');
INSERT INTO `sys_log` VALUES (299, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'd74a8091-b4e3-471c-b661-5be217c8c376', '\"/admin/blogArticle/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 12:20:56', 1, '2018-08-26 12:20:56', NULL, b'0');
INSERT INTO `sys_log` VALUES (300, 'Ajax请求', '删除博客内容数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/delete', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.delete', '[2]', 'd74a8091-b4e3-471c-b661-5be217c8c376', '{\"success\":true,\"message\":\"成功\"}', 46, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 12:20:58', 1, '2018-08-26 12:20:58', NULL, b'0');
INSERT INTO `sys_log` VALUES (301, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'd74a8091-b4e3-471c-b661-5be217c8c376', '\"/admin/blogArticle/list\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 12:20:59', 1, '2018-08-26 12:20:59', NULL, b'0');
INSERT INTO `sys_log` VALUES (302, 'Ajax请求', '删除博客内容数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/delete', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.delete', '[1]', 'd74a8091-b4e3-471c-b661-5be217c8c376', '{\"success\":true,\"message\":\"成功\"}', 47, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 12:21:01', 1, '2018-08-26 12:21:01', NULL, b'0');
INSERT INTO `sys_log` VALUES (303, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'd74a8091-b4e3-471c-b661-5be217c8c376', '\"/admin/blogArticle/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 12:21:02', 1, '2018-08-26 12:21:02', NULL, b'0');
INSERT INTO `sys_log` VALUES (304, '普通请求', '富文本编辑器文件上传', '127.0.0.1', '我是管理员', 'http://localhost:8080/file/uploadWang', 'POST', 'com.mysiteforme.admin.controller.system.FileController.uploadWang', '\"请求参数数据过长不与显示\"', 'd74a8091-b4e3-471c-b661-5be217c8c376', '{\"errno\":0,\"data\":[\"/static/upload/58378498-dc52-4369-9fcf-b7e9f59e5228.png\"]}', 23, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 12:21:30', 1, '2018-08-26 12:21:30', NULL, b'0');
INSERT INTO `sys_log` VALUES (305, 'Ajax请求', '保存新增博客内容数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/add', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.add', '[{\"category\":\"1\",\"channelId\":9,\"content\":\"<p><img src=\'/static/upload/58378498-dc52-4369-9fcf-b7e9f59e5228.png\' style=\'max-width:100%;\'><br></p><p>NIH</p>\",\"delFlag\":false,\"marks\":\"AAA\",\"publistTime\":1535241600000,\"recommend\":false,\"resources\":\"\",\"showPic\":\"\",\"subTitle\":\"AAA\",\"text\":\"NIH\",\"title\":\"AAAAAAAA\",\"top\":false}]', 'd74a8091-b4e3-471c-b661-5be217c8c376', '{\"success\":true,\"message\":\"成功\"}', 148, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 12:24:12', 1, '2018-08-26 12:24:12', NULL, b'0');
INSERT INTO `sys_log` VALUES (306, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'd74a8091-b4e3-471c-b661-5be217c8c376', '\"/admin/blogArticle/list\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 12:24:13', 1, '2018-08-26 12:24:13', NULL, b'0');
INSERT INTO `sys_log` VALUES (307, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'd74a8091-b4e3-471c-b661-5be217c8c376', '\"/admin/blogArticle/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 12:25:30', 1, '2018-08-26 12:25:30', NULL, b'0');
INSERT INTO `sys_log` VALUES (308, '普通请求', '富文本编辑器文件上传', '127.0.0.1', '我是管理员', 'http://localhost:8080/file/uploadWang', 'POST', 'com.mysiteforme.admin.controller.system.FileController.uploadWang', '\"请求参数数据过长不与显示\"', 'd74a8091-b4e3-471c-b661-5be217c8c376', '{\"errno\":0,\"data\":[\"/static/upload/84428294-eaa8-43b6-9c5e-85306e054e05.jpg\"]}', 10, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 12:28:35', 1, '2018-08-26 12:28:35', NULL, b'0');
INSERT INTO `sys_log` VALUES (309, 'Ajax请求', '保存新增博客内容数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/add', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.add', '[{\"category\":\"1\",\"channelId\":11,\"content\":\"<p><img src=\'/static/upload/84428294-eaa8-43b6-9c5e-85306e054e05.jpg\' style=\'max-width:100%;\'><br></p><p>AAAAAA</p>\",\"delFlag\":false,\"marks\":\"a\",\"publistTime\":1535241600000,\"recommend\":false,\"resources\":\"\",\"showPic\":\"\",\"subTitle\":\"a\",\"text\":\"AAAAAA\",\"title\":\"AAAAAAAA\",\"top\":false}]', 'd74a8091-b4e3-471c-b661-5be217c8c376', '{\"success\":true,\"message\":\"成功\"}', 49, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 12:29:39', 1, '2018-08-26 12:29:39', NULL, b'0');
INSERT INTO `sys_log` VALUES (310, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'd74a8091-b4e3-471c-b661-5be217c8c376', '\"/admin/blogArticle/list\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 12:29:40', 1, '2018-08-26 12:29:40', NULL, b'0');
INSERT INTO `sys_log` VALUES (311, 'Ajax请求', '删除博客内容数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/delete', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.delete', '[6]', 'd74a8091-b4e3-471c-b661-5be217c8c376', '{\"success\":true,\"message\":\"成功\"}', 80, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 12:30:10', 1, '2018-08-26 12:30:10', NULL, b'0');
INSERT INTO `sys_log` VALUES (312, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'd74a8091-b4e3-471c-b661-5be217c8c376', '\"/admin/blogArticle/list\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 12:30:11', 1, '2018-08-26 12:30:11', NULL, b'0');
INSERT INTO `sys_log` VALUES (313, '普通请求', '富文本编辑器文件上传', '127.0.0.1', '我是管理员', 'http://localhost:8080/file/uploadWang', 'POST', 'com.mysiteforme.admin.controller.system.FileController.uploadWang', '\"请求参数数据过长不与显示\"', 'd74a8091-b4e3-471c-b661-5be217c8c376', '{\"errno\":0,\"data\":[\"192.168.137.1/static/upload/609db1d1-d00d-44b0-9474-3f4ad53e3a01.jpeg\"]}', 70, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 12:31:11', 1, '2018-08-26 12:31:11', NULL, b'0');
INSERT INTO `sys_log` VALUES (314, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'd74a8091-b4e3-471c-b661-5be217c8c376', '\"/admin/blogArticle/list\"', 10, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 12:52:36', 1, '2018-08-26 12:52:36', NULL, b'0');
INSERT INTO `sys_log` VALUES (315, '普通请求', '富文本编辑器文件上传', '127.0.0.1', '我是管理员', 'http://localhost:8080/file/uploadWang', 'POST', 'com.mysiteforme.admin.controller.system.FileController.uploadWang', '\"请求参数数据过长不与显示\"', 'd74a8091-b4e3-471c-b661-5be217c8c376', '{\"errno\":0,\"data\":[\"192.168.137.1:8080/static/upload/31ab6918-42c2-415a-be42-136beea42ccb.jpg\"]}', 156, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 12:52:57', 1, '2018-08-26 12:52:57', NULL, b'0');
INSERT INTO `sys_log` VALUES (316, '普通请求', '富文本编辑器文件上传', '127.0.0.1', '我是管理员', 'http://localhost:8080/file/uploadWang', 'POST', 'com.mysiteforme.admin.controller.system.FileController.uploadWang', '\"请求参数数据过长不与显示\"', 'd74a8091-b4e3-471c-b661-5be217c8c376', '{\"errno\":0,\"data\":[\"192.168.137.1:8080/static/upload/39268b07-e8e1-48cb-84d8-e3a90892caa4.jpg\"]}', 146, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 12:55:35', 1, '2018-08-26 12:55:35', NULL, b'0');
INSERT INTO `sys_log` VALUES (317, '普通请求', '退出系统', '127.0.0.1', '我是管理员', 'http://localhost:8080/systemLogout', 'GET', 'com.mysiteforme.admin.controller.LoginController.logOut', '[]', 'd74a8091-b4e3-471c-b661-5be217c8c376', '\"redirect:/login\"', 6, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-26 12:59:56', NULL, '2018-08-26 12:59:56', NULL, b'0');
INSERT INTO `sys_log` VALUES (318, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@23197a8d\"]', 'aaffcde9-72dd-4948-85fe-0b5c9a0dfd73', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 34, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 13:00:07', 1, '2018-08-26 13:00:07', NULL, b'0');
INSERT INTO `sys_log` VALUES (319, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'aaffcde9-72dd-4948-85fe-0b5c9a0dfd73', '\"/admin/blogArticle/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 13:00:09', 1, '2018-08-26 13:00:09', NULL, b'0');
INSERT INTO `sys_log` VALUES (320, '普通请求', '富文本编辑器文件上传', '127.0.0.1', '我是管理员', 'http://localhost:8080/file/uploadWang', 'POST', 'com.mysiteforme.admin.controller.system.FileController.uploadWang', '\"请求参数数据过长不与显示\"', 'aaffcde9-72dd-4948-85fe-0b5c9a0dfd73', '{\"errno\":0,\"data\":[\"192.168.137.1:8080/static/upload/a0646a16-8ec1-412d-9a12-3fe6e6482cd1.jpg\"]}', 144, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 13:00:32', 1, '2018-08-26 13:00:32', NULL, b'0');
INSERT INTO `sys_log` VALUES (321, 'Ajax请求', '保存新增博客内容数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/add', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.add', '[{\"category\":\"1\",\"channelId\":14,\"content\":\"<p><img src=\'192.168.137.1:8080/static/upload/a0646a16-8ec1-412d-9a12-3fe6e6482cd1.jpg\' style=\'max-width:100%;\'>A<br></p>\",\"delFlag\":false,\"marks\":\"A\",\"publistTime\":1535241600000,\"recommend\":false,\"resources\":\"\",\"showPic\":\"\",\"subTitle\":\"A\",\"text\":\"A\",\"title\":\"AAAAAAAA\",\"top\":false}]', 'aaffcde9-72dd-4948-85fe-0b5c9a0dfd73', '{\"success\":true,\"message\":\"成功\"}', 157, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 13:03:00', 1, '2018-08-26 13:03:00', NULL, b'0');
INSERT INTO `sys_log` VALUES (322, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'aaffcde9-72dd-4948-85fe-0b5c9a0dfd73', '\"/admin/blogArticle/list\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 13:03:02', 1, '2018-08-26 13:03:02', NULL, b'0');
INSERT INTO `sys_log` VALUES (323, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'aaffcde9-72dd-4948-85fe-0b5c9a0dfd73', '\"/admin/blogArticle/list\"', 12, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 13:13:57', 1, '2018-08-26 13:13:57', NULL, b'0');
INSERT INTO `sys_log` VALUES (324, '普通请求', '富文本编辑器文件上传', '127.0.0.1', '我是管理员', 'http://localhost:8080/file/uploadWang', 'POST', 'com.mysiteforme.admin.controller.system.FileController.uploadWang', '\"请求参数数据过长不与显示\"', 'aaffcde9-72dd-4948-85fe-0b5c9a0dfd73', '{\"errno\":0,\"data\":[\"http://192.168.137.1:8080/static/upload/1fd941c4-1c24-4b10-b107-aee0687be3df.jpg\"]}', 65, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 13:14:12', 1, '2018-08-26 13:14:12', NULL, b'0');
INSERT INTO `sys_log` VALUES (325, 'Ajax请求', '保存新增博客内容数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/add', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.add', '[{\"category\":\"1\",\"channelId\":17,\"content\":\"<p><img src=\'http://192.168.137.1:8080/static/upload/1fd941c4-1c24-4b10-b107-aee0687be3df.jpg\' style=\'max-width:100%;\'><br></p><p><iframe src=\'https://v.youku.com/v_show/id_XMzc5Nzk0MjIwMA==.html?spm=a2het.20010080.posterOnePic2239085.5~5~5~1~3!3~A\'></iframe>nihao&nbsp;</p><p><br></p><p><br></p>\",\"delFlag\":false,\"marks\":\"\",\"publistTime\":1535241600000,\"recommend\":false,\"resources\":\"\",\"showPic\":\"\",\"subTitle\":\"A\",\"text\":\"nihao&nbsp;\",\"title\":\"AAAAAAAA\",\"top\":false}]', 'aaffcde9-72dd-4948-85fe-0b5c9a0dfd73', '{\"success\":true,\"message\":\"成功\"}', 81, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 13:18:00', 1, '2018-08-26 13:18:00', NULL, b'0');
INSERT INTO `sys_log` VALUES (326, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'aaffcde9-72dd-4948-85fe-0b5c9a0dfd73', '\"/admin/blogArticle/list\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 13:18:01', 1, '2018-08-26 13:18:01', NULL, b'0');
INSERT INTO `sys_log` VALUES (327, 'Ajax请求', '保存编辑博客内容数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/edit', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.edit', '[{\"category\":\"1\",\"channelId\":17,\"content\":\"<p><img src=\'http://192.168.137.1:8080/static/upload/1fd941c4-1c24-4b10-b107-aee0687be3df.jpg\' style=\'max-width:100%;\'><br></p><p><video controls=\'controls\' type=\'video/mp4\' preload=\'auto\'>                          <source src=\'https://v.youku.com/v_show/id_XMzc5NTA1NDk3Mg==.html?spm=a2het.20010080.posterOnePic2239085.5~5~5~1~3!3~A&amp;f=51873484\' autostart=\'false\'>   </video></p><p><br></p><p><br></p><p><br></p>\",\"delFlag\":false,\"id\":8,\"marks\":\"\",\"publistTime\":1535241600000,\"recommend\":false,\"resources\":\"\",\"showPic\":\"\",\"sort\":0,\"subTitle\":\"A\",\"text\":\"                             \",\"title\":\"AAAAAAAA\",\"top\":false}]', 'aaffcde9-72dd-4948-85fe-0b5c9a0dfd73', '{\"success\":true,\"message\":\"成功\"}', 162, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 13:22:13', 1, '2018-08-26 13:22:13', NULL, b'0');
INSERT INTO `sys_log` VALUES (328, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'aaffcde9-72dd-4948-85fe-0b5c9a0dfd73', '\"/admin/blogArticle/list\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 13:22:30', 1, '2018-08-26 13:22:30', NULL, b'0');
INSERT INTO `sys_log` VALUES (329, 'Ajax请求', '保存编辑博客内容数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/edit', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.edit', '[{\"category\":\"1\",\"channelId\":17,\"content\":\"<p><img src=\'http://192.168.137.1:8080/static/upload/1fd941c4-1c24-4b10-b107-aee0687be3df.jpg\' style=\'max-width:100%;\'><br></p><p><video src=\'https://chimee.org/vod/1.mp4\' controls=\'\'>     您的浏览器不支持Video标签。 </video></p><p><br></p><p><br></p>\",\"delFlag\":false,\"id\":8,\"marks\":\"\",\"publistTime\":1535241600000,\"recommend\":false,\"resources\":\"\",\"showPic\":\"\",\"sort\":0,\"subTitle\":\"A\",\"text\":\"     您的浏览器不支持Video标签。 \",\"title\":\"AAAAAAAA\",\"top\":false}]', 'aaffcde9-72dd-4948-85fe-0b5c9a0dfd73', '{\"success\":true,\"message\":\"成功\"}', 137, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 13:28:18', 1, '2018-08-26 13:28:18', NULL, b'0');
INSERT INTO `sys_log` VALUES (330, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'aaffcde9-72dd-4948-85fe-0b5c9a0dfd73', '\"/admin/blogArticle/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 13:36:16', 1, '2018-08-26 13:36:16', NULL, b'0');
INSERT INTO `sys_log` VALUES (331, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'aaffcde9-72dd-4948-85fe-0b5c9a0dfd73', '\"/admin/blogArticle/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 13:38:38', 1, '2018-08-26 13:38:38', NULL, b'0');
INSERT INTO `sys_log` VALUES (332, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'aaffcde9-72dd-4948-85fe-0b5c9a0dfd73', '\"/admin/blogArticle/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 13:40:30', 1, '2018-08-26 13:40:30', NULL, b'0');
INSERT INTO `sys_log` VALUES (333, 'Ajax请求', '富文本编辑器内容图片上传', '127.0.0.1', '我是管理员', 'http://localhost:8080/file/doContent/', 'POST', 'com.mysiteforme.admin.controller.system.FileController.doContent', '[\"<html>\\r\\n<body>\\r\\n<img src=\\\"http://pic-bucket.nosdn.127.net/photo/0001/2018-08-26/DQ3S6UN700AP0001NOS.jpg\\\" />\\r\\n</body>\\r\\n\",\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@27450731\"]', 'aaffcde9-72dd-4948-85fe-0b5c9a0dfd73', '{\"data\":\"  \\n <img src=\\\"/static/upload/ccca0070-1e7d-44af-b5a1-eb62cfa51bac.jpg\\\">  \\n\",\"success\":true,\"message\":\"成功\"}', 332, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 13:41:00', 1, '2018-08-26 13:41:00', NULL, b'0');
INSERT INTO `sys_log` VALUES (334, 'Ajax请求', '保存编辑博客内容数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/edit', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.edit', '[{\"category\":\"1\",\"channelId\":17,\"content\":\"<p><strong style=\'color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255);\'>央视网消息</strong><span style=\'color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255);\'>（新闻联播）：习近平总书记在全国宣传思想工作会议上的重要讲话，深刻总结了党的十八大以来党的宣传思想工作的历史性成就和历史性变革，深刻阐述了新形势下党的宣传思想工作的历史方位和使命任务，深刻回答了一系列方向性、根本性、全局性、战略性重大问题，对做好新形势下党的宣传思想工作作出重大部署。广大宣传思想工作战线的同志们表示，一定自觉担负起新形势下宣传思想工作的使命任务，奋力开创宣传思想工作新局面，为党和国家事业发展提供坚强思想保证和强大精神动力。</span>&nbsp;</p><p><img src=\'/static/upload/ccca0070-1e7d-44af-b5a1-eb62cfa51bac.jpg\'>&nbsp;<br></p><p><span style=\'color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255);\'>习近平总书记在讲话中强调，完成新形势下宣传思想工作的使命任务，必须以新时代中国特色社会主义思想和党的十九大精神为指导，增强“四个意识”、坚定“四个自信”。大家表示，这为宣传思想工作提供了根本遵循和行动指南。</span>&nbsp;</p><p><span style=\'background-color: rgb(255, 255, 255); color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px;\'>习近平总书记指出，建设具有强大凝聚力和引领力的社会主义意识形态，是全党特别是宣传思想战线必须担负起的一个战略任务。必须巩固壮大主流思想舆论，加强传播手段和话语方式创新，提升中华文化影响力。</span>&nbsp;<br></p>\",\"delFlag\":false,\"id\":8,\"marks\":\"\",\"publistTime\":1535241600000,\"recommend\":false,\"resources\":\"\",\"showPic\":\"\",\"sort\":0,\"subTitle\":\"A\",\"text\":\"央视网消息（新闻联播）：习近平总书记在全国宣传思想工作会议上的重要讲话，深刻总结了党的十八大以来党的宣传思想工作的历史性成就和历史性变革，深刻阐述了新形势下党的宣传思想工作的历史方位和使命任务，深刻回答了一系列方向性、根本性、全局性、战略性重大问题，对做好新形势下党的宣传思想工作作出重大部署。广大宣传思想工作战线的同志们表示，一定自觉担负起新形势下宣传思想工作的使命任务，奋力开创宣传思想工作新局面，为党和国家事业发展提供坚强思想保证和强大精神动力。&nbsp;&nbsp;习近平总书记在讲话中强调，完成新形势下宣传思想工作的使命任务，必须以新时代中国特色社会主义思想和党的十九大精神为指导，增强“四个意识”、坚定“四个自信”。大家表示，这为宣传思想工作提供了根本遵循和行动指南。&nbsp;习近平总书记指出，建设具有强大凝聚力和引领力的社会主义意识形态，是全党特别是宣传思想战线必须担负起的一个战略任务。必须巩固壮大主流思想舆论，加强传播手段和话语方式创新，提升中华文化影响力。&nbsp;\",\"title\":\"AAAAAAAA\",\"top\":false}]', 'aaffcde9-72dd-4948-85fe-0b5c9a0dfd73', '{\"success\":true,\"message\":\"成功\"}', 57, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 13:41:25', 1, '2018-08-26 13:41:25', NULL, b'0');
INSERT INTO `sys_log` VALUES (335, '普通请求', '富文本编辑器文件上传', '127.0.0.1', '我是管理员', 'http://localhost:8080/file/uploadWang', 'POST', 'com.mysiteforme.admin.controller.system.FileController.uploadWang', '\"请求参数数据过长不与显示\"', 'aaffcde9-72dd-4948-85fe-0b5c9a0dfd73', '{\"errno\":0,\"data\":[\"http://192.168.137.1:8080/static/upload/ecc505b8-0d62-403b-870b-1b0b3852c639.jpg\"]}', 156, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 13:43:32', 1, '2018-08-26 13:43:32', NULL, b'0');
INSERT INTO `sys_log` VALUES (336, 'Ajax请求', '保存编辑博客内容数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/edit', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.edit', '[{\"category\":\"1\",\"channelId\":17,\"content\":\"<p><strong style=\'color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255);\'>央视网消息</strong><span style=\'color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255);\'>（新闻联播）：习近平总书记在全国宣传思想工作会议上的重要讲话，深刻总结了党的十八大以来党的宣传思想工作的历史性成就和历史性变革，深刻阐述了新形势下党的宣传思想工作的历史方位和使命任务，深刻回答了一系列方向性、根本性、全局性、战略性重大问题，对做好新形势下党的宣传思想工作作出重大部署。广大宣传思想工作战线的同志们表示，一定自觉担负起新形势下宣传思想工作的使命任务，奋力开创宣传思想工作新局面，为党和国家事业发展提供坚强思想保证和强大精神动力。</span>&nbsp;</p><p style=\'text-align: center;\'><img src=\'http://192.168.137.1:8080/static/upload/ecc505b8-0d62-403b-870b-1b0b3852c639.jpg\' style=\'max-width:100%;\'><br></p><p><span style=\'color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255);\'>习近平总书记在讲话中强调，完成新形势下宣传思想工作的使命任务，必须以新时代中国特色社会主义思想和党的十九大精神为指导，增强“四个意识”、坚定“四个自信”。大家表示，这为宣传思想工作提供了根本遵循和行动指南。</span>&nbsp;</p><p><span style=\'background-color: rgb(255, 255, 255); color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px;\'>习近平总书记指出，建设具有强大凝聚力和引领力的社会主义意识形态，是全党特别是宣传思想战线必须担负起的一个战略任务。必须巩固壮大主流思想舆论，加强传播手段和话语方式创新，提升中华文化影响力。</span>&nbsp;<br></p><p><br></p>\",\"delFlag\":false,\"id\":8,\"marks\":\"\",\"publistTime\":1535241600000,\"recommend\":false,\"resources\":\"\",\"showPic\":\"\",\"sort\":0,\"subTitle\":\"A\",\"text\":\"央视网消息（新闻联播）：习近平总书记在全国宣传思想工作会议上的重要讲话，深刻总结了党的十八大以来党的宣传思想工作的历史性成就和历史性变革，深刻阐述了新形势下党的宣传思想工作的历史方位和使命任务，深刻回答了一系列方向性、根本性、全局性、战略性重大问题，对做好新形势下党的宣传思想工作作出重大部署。广大宣传思想工作战线的同志们表示，一定自觉担负起新形势下宣传思想工作的使命任务，奋力开创宣传思想工作新局面，为党和国家事业发展提供坚强思想保证和强大精神动力。&nbsp;习近平总书记在讲话中强调，完成新形势下宣传思想工作的使命任务，必须以新时代中国特色社会主义思想和党的十九大精神为指导，增强“四个意识”、坚定“四个自信”。大家表示，这为宣传思想工作提供了根本遵循和行动指南。&nbsp;习近平总书记指出，建设具有强大凝聚力和引领力的社会主义意识形态，是全党特别是宣传思想战线必须担负起的一个战略任务。必须巩固壮大主流思想舆论，加强传播手段和话语方式创新，提升中华文化影响力。&nbsp;\",\"title\":\"AAAAAAAA\",\"top\":false}]', 'aaffcde9-72dd-4948-85fe-0b5c9a0dfd73', '{\"success\":true,\"message\":\"成功\"}', 104, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 13:43:40', 1, '2018-08-26 13:43:40', NULL, b'0');
INSERT INTO `sys_log` VALUES (337, 'Ajax请求', '保存编辑博客内容数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/edit', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.edit', '[{\"category\":\"1\",\"channelId\":17,\"content\":\"<p><strong style=\'color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255);\'>央视网消息</strong><span style=\'color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255);\'>（新闻联播）：习近平总书记在全国宣传思想工作会议上的重要讲话，深刻总结了党的十八大以来党的宣传思想工作</span></p><blockquote>​<span style=\'color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255);\'><strike>的</strike></span><strike>​</strike><span style=\'color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255);\'>历史性成就和历史性变革，深刻阐述了新形势下党的宣传思想工作的历史方位和使命任务，深刻回答了一系列方向性、根本性、全局性、战略性重大问题，对做</span><img src=\'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/6d/zhh_org.gif\' alt=\'[左哼哼]\' data-w-e=\'1\'></blockquote><table border=\'0\' width=\'100%\' cellpadding=\'0\' cellspacing=\'0\'><tbody><tr><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr></tbody></table><p><br></p><blockquote><span style=\'color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255);\'>好新形势下党的宣传思想工作作出重大部署。广大宣传思想工作战线的同志们表示，一定自觉担负起新形势下宣传思想工作的使命任务，奋力开创宣传思想工作新局面，为党和国家事业发展提供坚强思想保证和强大精神动力。</span>&nbsp;</blockquote><p style=\'text-align: center;\'><img src=\'http://192.168.137.1:8080/static/upload/ecc505b8-0d62-403b-870b-1b0b3852c639.jpg\' style=\'max-width:100%;\'><br></p><p><span style=\'color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255);\'>习近平总书记在讲话中强调，完成新形势下宣传思想工作的使命任务，必须以新时代中国特色社会主义思想和党的十九大精神为指导，增强“四个意识”、坚定“四个自信”。大家表示，这为宣传思想工作提供了根本遵循和行动指南。</span>&nbsp;</p><p><span style=\'background-color: rgb(255, 255, 255); color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px;\'>习近平总书记指出，建设具有强大凝聚力和引领力的社会主义意识形态，是全党特别是宣传思想战线必须担负起的一个战略任务。必须巩固壮大主流思想舆论，加强传播手段和话语方式创新，提升中华文化影响力。</span>&nbsp;<br></p><p><br></p>\",\"delFlag\":false,\"id\":8,\"marks\":\"\",\"publistTime\":1535241600000,\"recommend\":false,\"resources\":\"\",\"showPic\":\"\",\"sort\":0,\"subTitle\":\"A\",\"text\":\"央视网消息（新闻联播）：习近平总书记在全国宣传思想工作会议上的重要讲话，深刻总结了党的十八大以来党的宣传思想工作​的​历史性成就和历史性变革，深刻阐述了新形势下党的宣传思想工作的历史方位和使命任务，深刻回答了一系列方向性、根本性、全局性、战略性重大问题，对做&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;好新形势下党的宣传思想工作作出重大部署。广大宣传思想工作战线的同志们表示，一定自觉担负起新形势下宣传思想工作的使命任务，奋力开创宣传思想工作新局面，为党和国家事业发展提供坚强思想保证和强大精神动力。&nbsp;习近平总书记在讲话中强调，完成新形势下宣传思想工作的使命任务，必须以新时代中国特色社会主义思想和党的十九大精神为指导，增强“四个意识”、坚定“四个自信”。大家表示，这为宣传思想工作提供了根本遵循和行动指南。&nbsp;习近平总书记指出，建设具有强大凝聚力和引领力的社会主义意识形态，是全党特别是宣传思想战线必须担负起的一个战略任务。必须巩固壮大主流思想舆论，加强传播手段和话语方式创新，提升中华文化影响力。&nbsp;\",\"title\":\"AAAAAAAA\",\"top\":false}]', 'aaffcde9-72dd-4948-85fe-0b5c9a0dfd73', '{\"success\":true,\"message\":\"成功\"}', 137, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 13:57:58', 1, '2018-08-26 13:57:58', NULL, b'0');
INSERT INTO `sys_log` VALUES (338, 'Ajax请求', '保存编辑博客内容数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/edit', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.edit', '[{\"category\":\"1\",\"channelId\":17,\"content\":\"<p><strong style=\'color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255);\'>央视网消息</strong><span style=\'color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255);\'>（新闻联播）：习近平总书记在全国宣传思想工作会议上的重要讲话，深刻总结了党的十八大以来党的宣传思想工作</span></p><p style=\'text-align: center;\'><img src=\'http://192.168.137.1:8080/static/upload/ecc505b8-0d62-403b-870b-1b0b3852c639.jpg\' style=\'max-width:100%;\'><br></p><p><span style=\'color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255);\'>习近平总书记在讲话中强调，完成新形势下宣传思想工作的使命任务，必须以新时代中国特色社会主义思想和党的十九大精神为指导，增强“四个意识”、坚定“四个自信”。大家表示，这为宣传思想工作提供了根本遵循和行动指南。</span>&nbsp;</p><p><span style=\'background-color: rgb(255, 255, 255); color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px;\'>习近平总书记指出，建设具有强大凝聚力和引领力的社会主义意识形态，是全党特别是宣传思想战线必须担负起的一个战略任务。必须巩固壮大主流思想舆论，加强传播手段和话语方式创新，提升中华文化影响力。</span>&nbsp;<br></p><p><br></p>\",\"delFlag\":false,\"id\":8,\"marks\":\"\",\"publistTime\":1535241600000,\"recommend\":false,\"resources\":\"\",\"showPic\":\"\",\"sort\":0,\"subTitle\":\"A\",\"text\":\"央视网消息（新闻联播）：习近平总书记在全国宣传思想工作会议上的重要讲话，深刻总结了党的十八大以来党的宣传思想工作习近平总书记在讲话中强调，完成新形势下宣传思想工作的使命任务，必须以新时代中国特色社会主义思想和党的十九大精神为指导，增强“四个意识”、坚定“四个自信”。大家表示，这为宣传思想工作提供了根本遵循和行动指南。&nbsp;习近平总书记指出，建设具有强大凝聚力和引领力的社会主义意识形态，是全党特别是宣传思想战线必须担负起的一个战略任务。必须巩固壮大主流思想舆论，加强传播手段和话语方式创新，提升中华文化影响力。&nbsp;\",\"title\":\"AAAAAAAA\",\"top\":false}]', 'aaffcde9-72dd-4948-85fe-0b5c9a0dfd73', '{\"success\":true,\"message\":\"成功\"}', 67, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 14:05:51', 1, '2018-08-26 14:05:51', NULL, b'0');
INSERT INTO `sys_log` VALUES (339, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'aaffcde9-72dd-4948-85fe-0b5c9a0dfd73', '\"/admin/blogArticle/list\"', 10, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 14:09:18', 1, '2018-08-26 14:09:18', NULL, b'0');
INSERT INTO `sys_log` VALUES (340, 'Ajax请求', '保存编辑博客内容数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/edit', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.edit', '[{\"category\":\"1\",\"channelId\":17,\"content\":\"<p><strong style=\'color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255);\'>央视网消息</strong><span style=\'color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255);\'>（新闻联播）：习近平总书记在全国宣传思想工作会议上的重要讲话，深刻总结了党的十八大以来党的宣传思想工作</span></p><p style=\'text-align: center;\'><img src=\'http://192.168.137.1:8080/static/upload/ecc505b8-0d62-403b-870b-1b0b3852c639.jpg\' style=\'max-width:100%;\'><br></p><p><span style=\'color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255);\'>习近平总书记在讲话中强调，完成新形势下宣传思想工作的使命任务，必须以新时代中国特色社会主义思想和党的十九大精神为指导，增强“四个意识”、坚定“四个自信”。大家表示，这为宣传思想工作提供了根本遵循和行动指南。</span>&nbsp;</p><p><span style=\'background-color: rgb(255, 255, 255); color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px;\'>习近平总书记指出，建设具有强大凝聚力和引领力的社会主义意识形态，是全党特别是宣传思想战线必须担负起的一个战略任务。必须巩固壮大主流思想舆论，加强传播手段和话语方式创新，提升中华文化影响力。</span>&nbsp;<br></p><p><br></p>\",\"delFlag\":false,\"id\":8,\"marks\":\"\",\"publistTime\":1535241600000,\"recommend\":false,\"resources\":\"\",\"showPic\":\"\",\"sort\":0,\"subTitle\":\"A\",\"text\":\"央视网消息（新闻联播）：习近平总书记在全国宣传思想工作会议上的重要讲话，深刻总结了党的十八大以来党的宣传思想工作习近平总书记在讲话中强调，完成新形势下宣传思想工作的使命任务，必须以新时代中国特色社会主义思想和党的十九大精神为指导，增强“四个意识”、坚定“四个自信”。大家表示，这为宣传思想工作提供了根本遵循和行动指南。&nbsp;习近平总书记指出，建设具有强大凝聚力和引领力的社会主义意识形态，是全党特别是宣传思想战线必须担负起的一个战略任务。必须巩固壮大主流思想舆论，加强传播手段和话语方式创新，提升中华文化影响力。&nbsp;\",\"title\":\"AAAAAAAA\",\"top\":false}]', 'aaffcde9-72dd-4948-85fe-0b5c9a0dfd73', '{\"success\":true,\"message\":\"成功\"}', 164, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 14:09:30', 1, '2018-08-26 14:09:30', NULL, b'0');
INSERT INTO `sys_log` VALUES (341, '普通请求', '富文本编辑器文件上传', '127.0.0.1', '我是管理员', 'http://localhost:8080/file/uploadWang', 'POST', 'com.mysiteforme.admin.controller.system.FileController.uploadWang', '\"请求参数数据过长不与显示\"', 'aaffcde9-72dd-4948-85fe-0b5c9a0dfd73', '{\"errno\":0,\"data\":[\"http://192.168.137.1:8080/static/upload/1fd941c4-1c24-4b10-b107-aee0687be3df.jpg\"]}', 23, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 14:09:46', 1, '2018-08-26 14:09:46', NULL, b'0');
INSERT INTO `sys_log` VALUES (342, 'Ajax请求', '保存新增博客内容数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/add', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.add', '[{\"category\":\"1\",\"channelId\":17,\"content\":\"<p><img src=\'http://192.168.137.1:8080/static/upload/1fd941c4-1c24-4b10-b107-aee0687be3df.jpg\' style=\'max-width:100%;\'>bb<br></p>\",\"delFlag\":false,\"marks\":\"\",\"publistTime\":1535241600000,\"recommend\":false,\"resources\":\"\",\"showPic\":\"\",\"subTitle\":\"\",\"text\":\"bb\",\"title\":\"bbb\",\"top\":false}]', 'aaffcde9-72dd-4948-85fe-0b5c9a0dfd73', '{\"success\":true,\"message\":\"成功\"}', 47, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 14:09:56', 1, '2018-08-26 14:09:56', NULL, b'0');
INSERT INTO `sys_log` VALUES (343, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'aaffcde9-72dd-4948-85fe-0b5c9a0dfd73', '\"/admin/blogArticle/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 14:09:57', 1, '2018-08-26 14:09:57', NULL, b'0');
INSERT INTO `sys_log` VALUES (344, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'aaffcde9-72dd-4948-85fe-0b5c9a0dfd73', '\"/admin/blogArticle/list\"', 10, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 14:15:43', 1, '2018-08-26 14:15:43', NULL, b'0');
INSERT INTO `sys_log` VALUES (345, '普通请求', '富文本编辑器文件上传', '127.0.0.1', '我是管理员', 'http://localhost:8080/file/uploadWang', 'POST', 'com.mysiteforme.admin.controller.system.FileController.uploadWang', '\"请求参数数据过长不与显示\"', 'aaffcde9-72dd-4948-85fe-0b5c9a0dfd73', '{\"errno\":0,\"data\":[\"http://192.168.137.1:8080/static/upload/793e9ff5-6efe-441d-9f4e-0cc7a9af797e.jpg\"]}', 71, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 14:15:54', 1, '2018-08-26 14:15:54', NULL, b'0');
INSERT INTO `sys_log` VALUES (346, 'Ajax请求', '保存新增博客内容数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/add', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.add', '[{\"category\":\"1\",\"channelId\":2,\"content\":\"<p><img src=\\\"http://192.168.137.1:8080/static/upload/793e9ff5-6efe-441d-9f4e-0cc7a9af797e.jpg\\\" style=\\\"max-width:100%;\\\"><b>DDDDDD</b><br></p>\",\"delFlag\":false,\"marks\":\"\",\"publistTime\":1535241600000,\"recommend\":false,\"resources\":\"\",\"showPic\":\"\",\"subTitle\":\"\",\"text\":\"DDDDDD\",\"title\":\"AAAAAAAA\",\"top\":false}]', 'aaffcde9-72dd-4948-85fe-0b5c9a0dfd73', '{\"success\":true,\"message\":\"成功\"}', 58, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 14:16:03', 1, '2018-08-26 14:16:03', NULL, b'0');
INSERT INTO `sys_log` VALUES (347, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'aaffcde9-72dd-4948-85fe-0b5c9a0dfd73', '\"/admin/blogArticle/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 14:16:04', 1, '2018-08-26 14:16:04', NULL, b'0');
INSERT INTO `sys_log` VALUES (348, 'Ajax请求', '保存编辑博客内容数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/edit', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.edit', '[{\"category\":\"1\",\"channelId\":2,\"content\":\"<p style=\'text-align: center;\'><img src=\'http://192.168.137.1:8080/static/upload/793e9ff5-6efe-441d-9f4e-0cc7a9af797e.jpg\' style=\'max-width:100%;\'><br></p><p style=\'text-align: center;\'>nihao</p><p><br></p>\",\"delFlag\":false,\"id\":10,\"marks\":\"\",\"publistTime\":1535241600000,\"recommend\":false,\"resources\":\"\",\"showPic\":\"\",\"sort\":0,\"subTitle\":\"\",\"text\":\"nihao\",\"title\":\"AAAAAAAA\",\"top\":false}]', 'aaffcde9-72dd-4948-85fe-0b5c9a0dfd73', '{\"success\":true,\"message\":\"成功\"}', 136, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 14:20:16', 1, '2018-08-26 14:20:16', NULL, b'0');
INSERT INTO `sys_log` VALUES (349, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'aaffcde9-72dd-4948-85fe-0b5c9a0dfd73', '\"/admin/blogArticle/list\"', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 14:22:27', 1, '2018-08-26 14:22:27', NULL, b'0');
INSERT INTO `sys_log` VALUES (350, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'aaffcde9-72dd-4948-85fe-0b5c9a0dfd73', '\"/admin/blogArticle/list\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 14:24:32', 1, '2018-08-26 14:24:32', NULL, b'0');
INSERT INTO `sys_log` VALUES (351, 'Ajax请求', '保存编辑博客内容数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/edit', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.edit', '[{\"category\":\"1\",\"channelId\":2,\"content\":\"<p style=\'text-align: center;\'><img src=\'http://192.168.137.1:8080/static/upload/793e9ff5-6efe-441d-9f4e-0cc7a9af797e.jpg\' style=\'max-width:100%;\'><br></p><p style=\'text-align: center;\'>nihao</p><p style=\'text-align: center;\'><br></p><p><video src=\'https://chimee.org/vod/1.mp4\' controls=\'\'>     您的浏览器不支持Video标签。 </video></p><p style=\'text-align: center;\'><br></p><p style=\'text-align: center;\'><br></p>\",\"delFlag\":false,\"id\":10,\"marks\":\"\",\"publistTime\":1535241600000,\"recommend\":false,\"resources\":\"\",\"showPic\":\"\",\"sort\":0,\"subTitle\":\"\",\"text\":\"nihao     您的浏览器不支持Video标签。 \",\"title\":\"AAAAAAAA\",\"top\":false}]', 'aaffcde9-72dd-4948-85fe-0b5c9a0dfd73', '{\"success\":true,\"message\":\"成功\"}', 52, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-08-26 14:26:39', 1, '2018-08-26 14:26:39', NULL, b'0');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父菜单',
  `level` bigint(2) NULL DEFAULT NULL COMMENT '菜单层级',
  `parent_ids` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父菜单联集',
  `sort` smallint(6) NULL DEFAULT NULL COMMENT '排序',
  `href` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接地址',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打开方式',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `bg_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示背景色',
  `is_show` tinyint(2) NULL DEFAULT NULL COMMENT '是否显示',
  `permission` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `create_by` bigint(20) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` tinyint(2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', NULL, 1, '1,', 20, '', NULL, '', NULL, 1, '', 1, '2018-01-16 11:29:46', 1, '2018-01-20 03:09:26', NULL, 0);
INSERT INTO `sys_menu` VALUES (2, '系统用户管理', 1, 2, '1,2,', 9, '/admin/system/user/list', NULL, '', '#47e69c', 1, 'sys:user:list', 1, '2018-01-16 11:31:18', 1, '2018-01-20 05:59:20', NULL, 0);
INSERT INTO `sys_menu` VALUES (3, '系统角色管理', 1, 2, '1,3,', 10, '/admin/system/role/list', NULL, '', '#c23ab9', 1, 'sys:role:list', 1, '2018-01-16 11:32:33', 1, '2018-01-20 05:58:58', NULL, 0);
INSERT INTO `sys_menu` VALUES (4, '系统权限管理', 1, 2, '1,4,', 20, '/admin/system/menu/list', NULL, '', '#d4573b', 1, 'sys:menu:list', 1, '2018-01-16 11:33:19', 1, '2018-02-08 09:49:28', NULL, 0);
INSERT INTO `sys_menu` VALUES (5, '系统资源管理', 1, 2, '1,5,', 30, '/admin/system/rescource/list', NULL, '', '#f5e42a', 1, 'sys:rescource:list', 1, '2018-01-16 11:34:48', 1, '2018-01-20 05:56:35', NULL, 0);
INSERT INTO `sys_menu` VALUES (6, '系统日志管理', 1, 2, '1,6,', 40, '/admin/system/log/list', NULL, '', '#b56c18', 1, 'sys:log:list', 1, '2018-01-16 11:35:31', 1, '2018-01-20 05:12:17', NULL, 0);
INSERT INTO `sys_menu` VALUES (7, '网站基本信息', 1, 2, '1,7,', 50, '/admin/system/site/show', NULL, '', '#95deb9', 1, 'sys:site:list', 1, '2018-01-16 11:36:50', 1, '2018-01-20 05:55:44', NULL, 0);
INSERT INTO `sys_menu` VALUES (8, '数据库管理', 1, 2, '1,8,', 60, '/admin/system/table/list', NULL, '', '#369e16', 1, 'sys:table:list', 1, '2018-01-16 11:38:29', 1, '2018-01-20 03:14:23', NULL, 0);
INSERT INTO `sys_menu` VALUES (9, '系统字典管理', 1, 2, '1,9,', 70, '/admin/system/dict/list', NULL, '', '#1bbcc2', 1, 'sys:dict:list', 1, '2018-01-16 14:51:52', 1, '2018-01-20 03:12:27', NULL, 0);
INSERT INTO `sys_menu` VALUES (10, '博客管理', NULL, 1, '10,', 10, '', NULL, '', NULL, 1, '', 1, '2018-01-17 13:21:53', 1, '2018-01-22 00:28:28', NULL, 0);
INSERT INTO `sys_menu` VALUES (11, '栏目管理', 10, 2, '10,11,', 6, '/admin/blogChannel/list', NULL, '', NULL, 1, 'blog:channel:list', 1, '2018-01-17 13:22:57', 1, '2018-02-08 10:20:54', NULL, 0);
INSERT INTO `sys_menu` VALUES (12, '博客评论', 10, 2, '10,12,', 7, '/admin/blogComment/list', NULL, '', '#c8e332', 1, 'blog:comment:list', 1, '2018-01-17 13:23:52', 1, '2018-02-08 10:25:26', NULL, 0);
INSERT INTO `sys_menu` VALUES (13, '博客文章', 10, 2, '10,13,', 8, '/admin/blogArticle/list', NULL, '', '#1962b5', 1, 'blog:article:list', 1, '2018-01-17 16:02:07', 1, '2018-02-08 10:26:13', NULL, 0);
INSERT INTO `sys_menu` VALUES (14, '定时任务', NULL, 1, '14,', 5, '', NULL, '', NULL, 1, '', 1, '2018-01-26 22:39:35', 1, '2018-02-08 10:31:05', NULL, 0);
INSERT INTO `sys_menu` VALUES (15, '任务列表', 14, 2, '14,15,', 15, '/admin/quartzTask/list', NULL, '', '#d6d178', 1, 'quartz:task:list', 1, '2018-01-26 22:41:25', 1, '2018-02-08 10:31:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (16, '任务执行日志', 14, 2, '14,16,', 10, '/admin/quartzTaskLog/list', NULL, '', '#5158d6', 1, 'quartz:log:list', 1, '2018-01-27 01:07:11', 1, '2018-02-08 10:37:51', NULL, 0);
INSERT INTO `sys_menu` VALUES (17, '新增字典', 9, 3, '1,9,17,', 0, '', NULL, NULL, NULL, 0, 'sys:dict:add', 1, '2018-02-08 09:39:09', 1, '2018-02-08 09:39:19', NULL, 0);
INSERT INTO `sys_menu` VALUES (18, '编辑字典', 9, 3, '1,9,18,', 10, '', NULL, NULL, NULL, 0, 'sys:dict:edit', 1, '2018-02-08 09:40:37', 1, '2018-02-08 09:40:46', NULL, 0);
INSERT INTO `sys_menu` VALUES (19, '编辑字典类型', 9, 3, '1,9,19,', 20, '', NULL, NULL, NULL, 0, 'sys:dict:editType', 1, '2018-02-08 09:42:46', 1, '2018-02-08 09:54:07', NULL, 0);
INSERT INTO `sys_menu` VALUES (20, '新增系统权限', 4, 3, '1,4,20,', 0, '', NULL, NULL, NULL, 0, 'sys:menu:add', 1, '2018-02-08 09:49:15', 1, '2018-02-08 09:49:38', NULL, 0);
INSERT INTO `sys_menu` VALUES (21, '编辑系统权限', 4, 3, '1,4,21,', 10, '', NULL, NULL, NULL, 0, 'sys:menu:edit', 1, '2018-02-08 09:50:16', 1, '2018-02-08 09:50:25', NULL, 0);
INSERT INTO `sys_menu` VALUES (22, '删除系统权限', 4, 3, '1,4,22,', 20, '', NULL, NULL, NULL, 0, 'sys:menu:delete', 1, '2018-02-08 09:51:53', 1, '2018-02-08 09:53:42', NULL, 0);
INSERT INTO `sys_menu` VALUES (23, '删除系统资源', 5, 3, '1,5,23,', 0, '', NULL, NULL, NULL, 0, 'sys:rescource:delete', 1, '2018-02-08 09:56:44', 1, '2018-02-08 09:56:53', NULL, 0);
INSERT INTO `sys_menu` VALUES (24, '新增系统角色', 3, 3, '1,3,24,', 0, '', NULL, NULL, NULL, 0, 'sys:role:add', 1, '2018-02-08 09:58:11', 1, '2018-02-08 09:58:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (25, '编辑菜单权限', 3, 3, '1,3,25,', 10, '', NULL, NULL, NULL, 0, 'sys:role:edit', 1, '2018-02-08 09:59:01', 1, '2018-02-08 09:59:01', NULL, 0);
INSERT INTO `sys_menu` VALUES (26, '删除角色', 3, 3, '1,3,26,', 20, '', NULL, NULL, NULL, 0, 'sys:role:delete', 1, '2018-02-08 09:59:56', 1, '2018-02-08 09:59:56', NULL, 0);
INSERT INTO `sys_menu` VALUES (27, '编辑系统信息', 7, 3, '1,7,27,', 0, '', NULL, NULL, NULL, 0, 'sys:site:edit', 1, '2018-02-08 10:01:40', 1, '2018-02-08 10:01:40', NULL, 0);
INSERT INTO `sys_menu` VALUES (28, '数据库新增', 8, 3, '1,8,28,', 0, '', NULL, NULL, NULL, 0, 'sys:table:add', 1, '2018-02-08 10:02:51', 1, '2018-02-08 10:02:51', NULL, 0);
INSERT INTO `sys_menu` VALUES (29, '编辑数据库', 8, 3, '1,8,29,', 10, '', NULL, NULL, NULL, 0, 'sys:table:edit', 1, '2018-02-08 10:03:58', 1, '2018-02-08 10:03:58', NULL, 0);
INSERT INTO `sys_menu` VALUES (30, '新增数据库字段', 8, 3, '1,8,30,', 20, '', NULL, NULL, NULL, 0, 'sys:table:addField', 1, '2018-02-08 10:05:11', 1, '2018-02-08 10:05:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (31, '编辑数据库字段', 8, 3, '1,8,31,', 30, '', NULL, NULL, NULL, 0, 'sys:table:editField', 1, '2018-02-08 10:05:47', 1, '2018-02-08 10:05:47', NULL, 0);
INSERT INTO `sys_menu` VALUES (32, '删除数据库字段', 8, 3, '1,8,32,', 40, '', NULL, NULL, NULL, 0, 'sys:table:deleteField', 1, '2018-02-08 10:07:29', 1, '2018-02-08 10:15:39', NULL, 0);
INSERT INTO `sys_menu` VALUES (33, '删除数据库', 8, 3, '1,8,33,', 50, '', NULL, NULL, NULL, 0, 'sys:table:deleteTable', 1, '2018-02-08 10:08:16', 1, '2018-02-08 10:08:16', NULL, 0);
INSERT INTO `sys_menu` VALUES (34, '下载源码', 8, 3, '1,8,34,', 60, '', NULL, NULL, NULL, 0, 'sys:table:download', 1, '2018-02-08 10:09:28', 1, '2018-02-08 10:09:28', NULL, 0);
INSERT INTO `sys_menu` VALUES (35, '新增系统用户', 2, 3, '1,2,35,', 0, '', NULL, NULL, NULL, 0, 'sys:user:add', 1, '2018-02-08 10:10:32', 1, '2018-02-08 10:10:32', NULL, 0);
INSERT INTO `sys_menu` VALUES (36, '编辑系统用户', 2, 3, '1,2,36,', 10, '', NULL, NULL, NULL, 0, 'sys:user:edit', 1, '2018-02-08 10:11:49', 1, '2018-02-08 10:11:49', NULL, 0);
INSERT INTO `sys_menu` VALUES (37, '删除系统用户', 2, 3, '1,2,37,', 20, '', NULL, NULL, NULL, 0, 'sys:user:delete', 1, '2018-02-08 10:12:43', 1, '2018-02-08 10:12:43', NULL, 0);
INSERT INTO `sys_menu` VALUES (38, '新增博客文章', 13, 3, '10,13,38,', 0, '', NULL, NULL, NULL, 0, 'blog:article:add', 1, '2018-02-08 10:16:59', 1, '2018-02-08 10:16:59', NULL, 0);
INSERT INTO `sys_menu` VALUES (39, '博客文章编辑', 13, 3, '10,13,39,', 10, '', NULL, NULL, NULL, 0, 'blog:article:edit', 1, '2018-02-08 10:17:16', 1, '2018-02-08 10:17:16', NULL, 0);
INSERT INTO `sys_menu` VALUES (40, '博客文章删除', 13, 3, '10,13,40,', 20, '', NULL, NULL, NULL, 0, 'blog:article:delete', 1, '2018-02-08 10:17:34', 1, '2018-02-08 10:44:02', NULL, 0);
INSERT INTO `sys_menu` VALUES (41, '博客评论回复', 12, 3, '10,12,41,', 0, '', NULL, NULL, NULL, 0, 'blog:comment:reply', 1, '2018-02-08 10:19:29', 1, '2018-02-08 10:20:33', NULL, 0);
INSERT INTO `sys_menu` VALUES (42, '新增博客栏目', 11, 3, '10,11,42,', 0, '', NULL, NULL, NULL, 0, 'blog:channel:add', 1, '2018-02-08 10:22:06', 1, '2018-02-08 10:22:06', NULL, 0);
INSERT INTO `sys_menu` VALUES (43, '编辑博客栏目', 11, 3, '10,11,43,', 10, '', NULL, NULL, NULL, 0, 'blog:channel:edit', 1, '2018-02-08 10:23:31', 1, '2018-02-08 10:23:31', NULL, 0);
INSERT INTO `sys_menu` VALUES (44, '删除博客栏目', 11, 3, '10,11,44,', 20, '', NULL, NULL, NULL, 0, 'blog:channel:delete', 1, '2018-02-08 10:23:57', 1, '2018-02-08 10:23:57', NULL, 0);
INSERT INTO `sys_menu` VALUES (45, '删除博客评论', 12, 3, '10,12,45,', 10, '', NULL, NULL, NULL, 0, 'blog:comment:delete', 1, '2018-02-08 10:28:48', 1, '2018-02-08 10:28:48', NULL, 0);
INSERT INTO `sys_menu` VALUES (46, '新增定时任务', 15, 3, '14,15,46,', 0, '', NULL, NULL, NULL, 0, 'quartz:task:add', 1, '2018-02-08 10:32:46', 1, '2018-02-08 10:32:46', NULL, 0);
INSERT INTO `sys_menu` VALUES (47, '编辑定时任务', 15, 3, '14,15,47,', 10, '', NULL, NULL, NULL, 0, 'quartz:task:edit', 1, '2018-02-08 10:34:18', 1, '2018-02-08 10:34:18', NULL, 0);
INSERT INTO `sys_menu` VALUES (48, '删除定时任务', 15, 3, '14,15,48,', 20, '', NULL, NULL, NULL, 0, 'quartz:task:delete', 1, '2018-02-08 10:35:07', 1, '2018-02-08 10:35:07', NULL, 0);
INSERT INTO `sys_menu` VALUES (49, '暂停定时任务', 15, 3, '14,15,49,', 30, '', NULL, NULL, NULL, 0, 'quartz:task:paush', 1, '2018-02-08 10:35:43', 1, '2018-02-08 10:35:43', NULL, 0);
INSERT INTO `sys_menu` VALUES (50, '恢复运行任务', 15, 3, '14,15,50,', 40, '', NULL, NULL, NULL, 0, 'quartz:task:resume', 1, '2018-02-08 10:36:26', 1, '2018-02-08 10:36:26', NULL, 0);
INSERT INTO `sys_menu` VALUES (51, '立即执行运行任务', 15, 3, '14,15,51,', 50, '', NULL, NULL, NULL, 0, 'quartz:task:run', 1, '2018-02-08 10:36:55', 1, '2018-02-08 10:36:55', NULL, 0);
INSERT INTO `sys_menu` VALUES (52, '删除定时任务日志', 16, 3, '14,16,52,', 0, '', NULL, NULL, NULL, 0, 'quartz:log:delete', 1, '2018-02-08 10:39:04', 1, '2018-02-08 10:39:04', NULL, 0);
INSERT INTO `sys_menu` VALUES (53, '修改密码', 2, 3, '1,2,53,', 30, '', NULL, '', NULL, 0, 'sys:user:changePassword', 1, '2018-03-15 10:14:06', 1, '2018-03-15 10:14:06', NULL, 0);
INSERT INTO `sys_menu` VALUES (54, '删除字典', 9, 3, '1,9,54,', 30, '', NULL, NULL, NULL, 0, 'sys:dict:delete', 1, '2018-03-15 10:16:55', 1, '2018-03-15 10:16:55', NULL, 0);
INSERT INTO `sys_menu` VALUES (55, '系统日志删除', 6, 3, '1,6,55,', 0, '', NULL, NULL, NULL, 0, 'system:logs:delete', 1, '2018-06-16 04:30:32', 1, '2018-06-16 04:30:32', NULL, 0);
INSERT INTO `sys_menu` VALUES (56, '博客标签', 10, 2, '10,56,', 3, '/admin/blogTags/list', NULL, '', '#c3e8ce', 1, 'blog:tags:list', 1, '2018-06-16 04:42:15', 1, '2018-06-16 04:42:30', NULL, 0);
INSERT INTO `sys_menu` VALUES (57, '博客标签新增', 56, 3, '10,56,57,', 0, '', NULL, NULL, NULL, 0, 'blog:tags:add', 1, '2018-06-16 04:43:02', 1, '2018-06-16 04:43:02', NULL, 0);
INSERT INTO `sys_menu` VALUES (58, '博客标签编辑', 56, 3, '10,56,58,', 10, '', NULL, NULL, NULL, 0, 'blog:tags:edit', 1, '2018-06-16 04:43:26', 1, '2018-06-16 04:43:26', NULL, 0);
INSERT INTO `sys_menu` VALUES (59, '博客标签删除', 56, 3, '10,56,59,', 20, '', NULL, NULL, NULL, 0, 'blog:tags:delete', 1, '2018-06-16 04:43:56', 1, '2018-06-16 04:43:56', NULL, 0);
INSERT INTO `sys_menu` VALUES (60, 'Druid数据监控', 1, 2, '1,60,', 25, '/admin/druid/list', NULL, '', '#7e8755', 1, 'sys:druid:list', 1, '2018-06-16 05:06:17', 1, '2018-06-16 05:06:26', NULL, 0);
INSERT INTO `sys_menu` VALUES (61, '七牛云存储信息', 7, 3, '1,7,61,', 10, '', NULL, NULL, NULL, 0, 'sys:site:editQiniu', 1, '2018-07-12 18:46:39', 1, '2018-07-12 18:46:39', NULL, 0);
INSERT INTO `sys_menu` VALUES (62, '阿里云信息存储', 7, 3, '1,7,62,', 20, '', NULL, NULL, NULL, 0, 'sys:site:editOss', 1, '2018-07-12 18:47:05', 1, '2018-07-12 18:47:05', NULL, 0);

-- ----------------------------
-- Table structure for sys_rescource
-- ----------------------------
DROP TABLE IF EXISTS `sys_rescource`;
CREATE TABLE `sys_rescource`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源',
  `web_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源网络地址',
  `hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件标识',
  `file_size` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件大小',
  `file_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  `original_net_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统资源' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_rescource
-- ----------------------------
INSERT INTO `sys_rescource` VALUES (4, '3e2baf40-f2e5-4b3c-93d1-3f97965017ec.jpg', 'qiniu', 'https://static.mysiteforme.com/3e2baf40-f2e5-4b3c-93d1-3f97965017ec.jpg', 'FpgHWPFgcyMX1lqNEDk8Pdnl3lsu', '228kb', '.jpg', NULL, '2018-03-13 12:54:36', 1, '2018-03-13 12:54:36', 1, NULL, 0);
INSERT INTO `sys_rescource` VALUES (21, '793e9ff5-6efe-441d-9f4e-0cc7a9af797e.jpg', 'local', 'http://192.168.137.1:8080/static/upload/793e9ff5-6efe-441d-9f4e-0cc7a9af797e.jpg', 'FueMUjtW97Y3_V8dGxAY5HyI9G9X', '82kb', 'image/jpeg', NULL, '2018-08-26 14:15:54', 1, '2018-08-26 14:15:54', 1, NULL, 0);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `create_date` datetime(0) NULL DEFAULT NULL,
  `create_by` bigint(20) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` tinyint(2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '老司机', '2017-11-02 14:19:07', 1, '2018-02-08 13:24:35', 1, '', 0);
INSERT INTO `sys_role` VALUES (2, '系统管理员', '2017-11-29 19:36:37', 1, '2018-07-12 18:47:20', 1, '', 0);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1);
INSERT INTO `sys_role_menu` VALUES (1, 2);
INSERT INTO `sys_role_menu` VALUES (1, 3);
INSERT INTO `sys_role_menu` VALUES (1, 4);
INSERT INTO `sys_role_menu` VALUES (1, 8);
INSERT INTO `sys_role_menu` VALUES (1, 10);
INSERT INTO `sys_role_menu` VALUES (1, 13);
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 5);
INSERT INTO `sys_role_menu` VALUES (2, 6);
INSERT INTO `sys_role_menu` VALUES (2, 7);
INSERT INTO `sys_role_menu` VALUES (2, 8);
INSERT INTO `sys_role_menu` VALUES (2, 9);
INSERT INTO `sys_role_menu` VALUES (2, 10);
INSERT INTO `sys_role_menu` VALUES (2, 11);
INSERT INTO `sys_role_menu` VALUES (2, 12);
INSERT INTO `sys_role_menu` VALUES (2, 13);
INSERT INTO `sys_role_menu` VALUES (2, 14);
INSERT INTO `sys_role_menu` VALUES (2, 15);
INSERT INTO `sys_role_menu` VALUES (2, 16);
INSERT INTO `sys_role_menu` VALUES (2, 17);
INSERT INTO `sys_role_menu` VALUES (2, 18);
INSERT INTO `sys_role_menu` VALUES (2, 19);
INSERT INTO `sys_role_menu` VALUES (2, 20);
INSERT INTO `sys_role_menu` VALUES (2, 21);
INSERT INTO `sys_role_menu` VALUES (2, 22);
INSERT INTO `sys_role_menu` VALUES (2, 23);
INSERT INTO `sys_role_menu` VALUES (2, 24);
INSERT INTO `sys_role_menu` VALUES (2, 25);
INSERT INTO `sys_role_menu` VALUES (2, 26);
INSERT INTO `sys_role_menu` VALUES (2, 27);
INSERT INTO `sys_role_menu` VALUES (2, 28);
INSERT INTO `sys_role_menu` VALUES (2, 29);
INSERT INTO `sys_role_menu` VALUES (2, 30);
INSERT INTO `sys_role_menu` VALUES (2, 31);
INSERT INTO `sys_role_menu` VALUES (2, 32);
INSERT INTO `sys_role_menu` VALUES (2, 33);
INSERT INTO `sys_role_menu` VALUES (2, 34);
INSERT INTO `sys_role_menu` VALUES (2, 35);
INSERT INTO `sys_role_menu` VALUES (2, 36);
INSERT INTO `sys_role_menu` VALUES (2, 37);
INSERT INTO `sys_role_menu` VALUES (2, 38);
INSERT INTO `sys_role_menu` VALUES (2, 39);
INSERT INTO `sys_role_menu` VALUES (2, 40);
INSERT INTO `sys_role_menu` VALUES (2, 41);
INSERT INTO `sys_role_menu` VALUES (2, 42);
INSERT INTO `sys_role_menu` VALUES (2, 43);
INSERT INTO `sys_role_menu` VALUES (2, 44);
INSERT INTO `sys_role_menu` VALUES (2, 45);
INSERT INTO `sys_role_menu` VALUES (2, 46);
INSERT INTO `sys_role_menu` VALUES (2, 47);
INSERT INTO `sys_role_menu` VALUES (2, 48);
INSERT INTO `sys_role_menu` VALUES (2, 49);
INSERT INTO `sys_role_menu` VALUES (2, 50);
INSERT INTO `sys_role_menu` VALUES (2, 51);
INSERT INTO `sys_role_menu` VALUES (2, 52);
INSERT INTO `sys_role_menu` VALUES (2, 53);
INSERT INTO `sys_role_menu` VALUES (2, 54);
INSERT INTO `sys_role_menu` VALUES (2, 55);
INSERT INTO `sys_role_menu` VALUES (2, 56);
INSERT INTO `sys_role_menu` VALUES (2, 57);
INSERT INTO `sys_role_menu` VALUES (2, 58);
INSERT INTO `sys_role_menu` VALUES (2, 59);
INSERT INTO `sys_role_menu` VALUES (2, 60);
INSERT INTO `sys_role_menu` VALUES (2, 61);
INSERT INTO `sys_role_menu` VALUES (2, 62);

-- ----------------------------
-- Table structure for sys_site
-- ----------------------------
DROP TABLE IF EXISTS `sys_site`;
CREATE TABLE `sys_site`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统网址',
  `open_message` bit(1) NULL DEFAULT NULL COMMENT '是否开放评论',
  `is_no_name` bit(1) NULL DEFAULT NULL COMMENT '是否匿名评论',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_upload_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weibo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `git` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `github` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `server` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `database` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `max_upload` int(11) NULL DEFAULT NULL,
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `powerby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `record` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_by` bigint(20) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `remarks` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `del_flag` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_site
-- ----------------------------
INSERT INTO `sys_site` VALUES (1, '云校园后台管理系统', 'cloud-campus.com', b'1', b'0', '1.0', 'jp', 'https://static.mysiteforme.com/3c5b69f4-2e39-4f88-b302-a6eb48e4c43a.jpg', 'local', 'https://weibo.com/u/2173866382', '1115784675', 'https://gitee.com/wanglingxiao/', 'https://github.com/wangl1989', '13776055179', '1115784675@qq.com', '江苏-苏州', 'http://ow9lg82yy.bkt.clouddn.com/24f5c360-485d-4a6d-9468-2a61c353cf37.ico', 'windows', 'mysql', 0, NULL, '网站描述', NULL, '苏ICP备17063650号', 1, '2017-12-30 22:46:15', 1, '2018-08-24 17:37:51', '<p><br></p><p><br></p>', b'0');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `login_name` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录名',
  `nick_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `icon` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'shiro加密盐',
  `tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `locked` tinyint(2) NULL DEFAULT NULL COMMENT '是否锁定',
  `create_date` datetime(0) NULL DEFAULT NULL,
  `create_by` bigint(20) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'test', '我是管理员', 'https://static.mysiteforme.com/3c5b69f4-2e39-4f88-b302-a6eb48e4c43a.jpg', '810339f5426fe2dcaf92c5cac718acc6471a034b', '3fb62b5aeede1bbf', '13776055179', 'b@qq.com', 0, '2017-11-27 22:19:39', 1, '2018-06-16 04:27:15', 1, '', 0);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (1, 2);

-- ----------------------------
-- Table structure for upload_info
-- ----------------------------
DROP TABLE IF EXISTS `upload_info`;
CREATE TABLE `upload_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `local_window_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `local_linux_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qiniu_base_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qiniu_bucket_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qiniu_dir` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qiniu_access_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qiniu_secret_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qiniu_test_access` bit(1) NULL DEFAULT NULL,
  `oss_base_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `oss_bucket_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `oss_dir` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `oss_key_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `oss_key_secret` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `oss_endpoint` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `oss_test_access` bit(1) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of upload_info
-- ----------------------------
INSERT INTO `upload_info` VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-07-12 18:48:23', 1, '2018-07-12 18:48:25', 1, NULL, 0);

SET FOREIGN_KEY_CHECKS = 1;