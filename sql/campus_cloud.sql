/*
 Navicat Premium Data Transfer

 Source Server         : campus-cloud
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : 118.24.111.201:3306
 Source Schema         : campus_cloud

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 18/09/2018 21:27:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 93184 kB; (`SCHED_NAME` `TRIGGER_NAME` `TRIGGER_GROUP`) REFER `camp' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('MySiteForMeScheduler', 'TASK_2', 'DEFAULT', '0 0 1 * * ?', 'GMT+08:00');

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`  (
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
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`  (
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
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('MySiteForMeScheduler', 'TASK_1', 'DEFAULT', NULL, 'com.mysiteforme.admin.util.quartz.ScheduleJob', 0, 0, 0, 0, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720027636F6D2E6D7973697465666F726D652E61646D696E2E656E746974792E51756172747A5461736B00000000000000010200064C000463726F6E7400124C6A6176612F6C616E672F537472696E673B4C00046E616D6571007E00094C0006706172616D7371007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B4C000A7461726765744265616E71007E00094C000B74726765744D6574686F6471007E000978720025636F6D2E6D7973697465666F726D652E61646D696E2E626173652E44617461456E7469747900000000000000010200084C000A637265617465446174657400104C6A6176612F7574696C2F446174653B4C000863726561746549647400104C6A6176612F6C616E672F4C6F6E673B4C000A637265617465557365727400234C636F6D2F6D7973697465666F726D652F61646D696E2F656E746974792F557365723B4C000764656C466C61677400134C6A6176612F6C616E672F426F6F6C65616E3B4C000772656D61726B7371007E00094C000A7570646174654461746571007E000C4C0008757064617465496471007E000D4C000A7570646174655573657271007E000E78720025636F6D2E6D7973697465666F726D652E61646D696E2E626173652E42617365456E74697479F87065A24F9EB43D0200014C0002696471007E000D7872002B636F6D2E62616F6D69646F752E6D796261746973706C75732E6163746976657265636F72642E4D6F64656C000000000000000102000078707372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000017372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016132EF0DB7787371007E0013000000000000000170737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C7565787000707371007E001677080000016132EF0DB87871007E00187074000B3020302031202A202A203F74001BE5908CE6ADA5E69687E7ABA0E6B58FE8A788E9878FE695B0E68DAE740000737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00140000000074000A73797374656D5461736B74001A73796E6368726F6E697A6174696F6E41727469636C65566965777800);
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('MySiteForMeScheduler', 'TASK_2', 'DEFAULT', NULL, 'com.mysiteforme.admin.util.quartz.ScheduleJob', 0, 0, 0, 0, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720027636F6D2E6D7973697465666F726D652E61646D696E2E656E746974792E51756172747A5461736B00000000000000010200064C000463726F6E7400124C6A6176612F6C616E672F537472696E673B4C00046E616D6571007E00094C0006706172616D7371007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B4C000A7461726765744265616E71007E00094C000B74726765744D6574686F6471007E000978720025636F6D2E6D7973697465666F726D652E61646D696E2E626173652E44617461456E7469747900000000000000010200084C000A637265617465446174657400104C6A6176612F7574696C2F446174653B4C000863726561746549647400104C6A6176612F6C616E672F4C6F6E673B4C000A637265617465557365727400234C636F6D2F6D7973697465666F726D652F61646D696E2F656E746974792F557365723B4C000764656C466C61677400134C6A6176612F6C616E672F426F6F6C65616E3B4C000772656D61726B7371007E00094C000A7570646174654461746571007E000C4C0008757064617465496471007E000D4C000A7570646174655573657271007E000E78720025636F6D2E6D7973697465666F726D652E61646D696E2E626173652E42617365456E74697479F87065A24F9EB43D0200014C0002696471007E000D7872002B636F6D2E62616F6D69646F752E6D796261746973706C75732E6163746976657265636F72642E4D6F64656C000000000000000102000078707372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000027372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001613F9BEBCB787371007E0013000000000000000170737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C7565787000740031E7949FE68890E69687E7ABA0E6909CE7B4A2E7B4A2E5BC95EFBC8CE6AF8FE5A4A9E6999AE4B88A31E782B9E689A7E8A18C7371007E00167708000001613F9BEBCB7871007E00187074000B3020302031202A202A203F740018E7949FE68890E69687E7ABA0E6909CE7B4A2E7B4A2E5BC9574000131737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00140000000074000A73797374656D5461736B74001263726561746541727469636C65496E6465787800);

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
INSERT INTO `QRTZ_LOCKS` VALUES ('MySiteForMeScheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` VALUES ('MySiteForMeScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(19) NOT NULL,
  `CHECKIN_INTERVAL` bigint(19) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('MySiteForMeScheduler', 'MSI1537105898862', 1537116140430, 15000);

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 93184 kB; (`SCHED_NAME` `TRIGGER_NAME` `TRIGGER_GROUP`) REFER `camp' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`  (
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
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 93184 kB; (`SCHED_NAME` `JOB_NAME` `JOB_GROUP`) REFER `campus_cloud' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_TRIGGERS` VALUES ('MySiteForMeScheduler', 'TASK_2', 'DEFAULT', 'TASK_2', 'DEFAULT', NULL, 1537117200000, -1, 5, 'WAITING', 'CRON', 1517190638000, 0, NULL, 2, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720027636F6D2E6D7973697465666F726D652E61646D696E2E656E746974792E51756172747A5461736B00000000000000010200064C000463726F6E7400124C6A6176612F6C616E672F537472696E673B4C00046E616D6571007E00094C0006706172616D7371007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B4C000A7461726765744265616E71007E00094C000B74726765744D6574686F6471007E000978720025636F6D2E6D7973697465666F726D652E61646D696E2E626173652E44617461456E7469747900000000000000010200084C000A637265617465446174657400104C6A6176612F7574696C2F446174653B4C000863726561746549647400104C6A6176612F6C616E672F4C6F6E673B4C000A637265617465557365727400234C636F6D2F6D7973697465666F726D652F61646D696E2F656E746974792F557365723B4C000764656C466C61677400134C6A6176612F6C616E672F426F6F6C65616E3B4C000772656D61726B7371007E00094C000A7570646174654461746571007E000C4C0008757064617465496471007E000D4C000A7570646174655573657271007E000E78720025636F6D2E6D7973697465666F726D652E61646D696E2E626173652E42617365456E74697479F87065A24F9EB43D0200014C0002696471007E000D7872002B636F6D2E62616F6D69646F752E6D796261746973706C75732E6163746976657265636F72642E4D6F64656C000000000000000102000078707372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000027372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001613F9BED98787371007E0013000000000000000170737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C7565787000740031E7949FE68890E69687E7ABA0E6909CE7B4A2E7B4A2E5BC95EFBC8CE6AF8FE5A4A9E6999AE4B88A31E782B9E689A7E8A18C7371007E00167708000001613F9BED987871007E00187074000B3020302031202A202A203F740018E7949FE68890E69687E7ABA0E6909CE7B4A2E7B4A2E5BC9574000131737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00140000000074000A73797374656D5461736B74001263726561746541727469636C65496E6465787800);

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
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容,editor,NO,false,true,true',
  `text` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纯文字文章内容,textarea,YES,false,false,false',
  `click` int(11) NULL DEFAULT 0 COMMENT '浏览量,0,YES,false,false,false',
  `comments` int(11) NULL DEFAULT 0 COMMENT '评论数',
  `likes` int(11) NULL DEFAULT 0 COMMENT '点赞数',
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
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '博客内容,1,uploadImg-showPic-YES,timer-publistTime-YES,editor-co' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of blog_article
-- ----------------------------
INSERT INTO `blog_article` VALUES (1, '旌阳区中小学生艺术节开幕啦！快来为孩子们点赞', NULL, '旌阳区中小学生艺术节开幕啦！快来为孩子们点赞', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/tpimg.jpg', '1', NULL, NULL, '2018-09-12 08:00:00', '<p><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/tp1.jpg\' style=\'max-width:100%;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/tp2.jpg\' style=\'max-width: 100%;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/tp3.jpg\' style=\'max-width: 100%;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/tp4.jpg\' style=\'max-width: 100%;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/tp5.jpg\' style=\'max-width: 100%;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/tp6.jpg\' style=\'max-width: 100%;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/tp7.jpg\' style=\'max-width: 100%;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/tp8.jpg\' style=\'max-width: 100%;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/tp9.jpg\' style=\'max-width: 100%;\'>&nbsp;<br></p><p><br></p>', '&nbsp;', 28, 2, 4, 22, 4, b'0', b'0', NULL, '2018-09-12 23:46:09', 2, '2018-09-16 15:05:15', 2, NULL, 0);
INSERT INTO `blog_article` VALUES (2, '旌阳区德新小学：习惯养成教育常抓不懈', NULL, '四川新闻网德阳3月12日讯（邓传蓉 文/图）伟大的教育家叶圣陶先生曾说：“什么是教育？简单一点说，教育就是养成良好的习惯”。3月12日早晨，在周一的朝会上，旌阳区德新小学校长钱继光再一次对全校学生进行了习惯养成的教育。', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/jiaoyu.jpg', '1', NULL, NULL, '2018-09-12 08:00:00', '<p style=\'padding-top: 3px; padding-bottom: 3px; font-family: &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255); line-height: 30px; text-indent: 2em; font-size: 16px;\'><strong>四川新闻网德阳3月12日讯（邓传蓉 文/图）</strong>伟大的教育家叶圣陶先生曾说：“什么是教育？简单一点说，教育就是养成良好的习惯”。3月12日早晨，在周一的朝会上，旌阳区德新小学校长钱继光再一次对全校学生进行了习惯养成的教育。</p><p style=\'padding-top: 3px; padding-bottom: 3px; font-family: &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255); line-height: 30px; text-indent: 2em; font-size: 16px;\'>钱继光首先就上周行政值周的情况进行了总结，表扬同学们做得好的方面，也指出了哪些方面还存在不足，希望同学们改进。并就学习行为习惯、生活行为习惯、安全行为习惯、文明礼仪习惯分别对同学们提出了要求。特别强调了学习要主动积极，提前预习，及时复习；清洁卫生不光要打扫干净，还要注意保持，不仅要保持校园卫生，也要注意个人清洁卫生；在学雷锋月的三月里，更做个讲文明有礼仪的孩子。钱继光同时对安全行为习惯进行了重点教育：楼梯楼道安全、课间活动安全、交通安全、防意外伤害、预防春季流行疾病······要求同学们在校在家都要有安全意识和自我保护意识，不做危险的事，不到危险的地方玩耍。</p><p style=\'padding-top: 3px; padding-bottom: 3px; font-family: &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255); line-height: 30px; text-indent: 2em; font-size: 16px;\'>知先行后，希望所有的孩子通过学校常抓不懈的习惯养成教育，都能形成良好的学习、生活和安全习惯，健康、安全、快乐地成长。</p>', '四川新闻网德阳3月12日讯（邓传蓉 文/图）伟大的教育家叶圣陶先生曾说：“什么是教育？简单一点说，教育就是养成良好的习惯”。3月12日早晨，在周一的朝会上，旌阳区德新小学校长钱继光再一次对全校学生进行了习惯养成的教育。钱继光首先就上周行政值周的情况进行了总结，表扬同学们做得好的方面，也指出了哪些方面还存在不足，希望同学们改进。并就学习行为习惯、生活行为习惯、安全行为习惯、文明礼仪习惯分别对同学们提出了要求。特别强调了学习要主动积极，提前预习，及时复习；清洁卫生不光要打扫干净，还要注意保持，不仅要保持校园卫生，也要注意个人清洁卫生；在学雷锋月的三月里，更做个讲文明有礼仪的孩子。钱继光同时对安全行为习惯进行了重点教育：楼梯楼道安全、课间活动安全、交通安全、防意外伤害、预防春季流行疾病······要求同学们在校在家都要有安全意识和自我保护意识，不做危险的事，不到危险的地方玩耍。知先行后，希望所有的孩子通过学校常抓不懈的习惯养成教育，都能形成良好的学习、生活和安全习惯，健康、安全、快乐地成长。', 16, 0, 1, 22, 3, b'0', b'0', NULL, '2018-09-12 23:33:04', 2, '2018-09-16 15:00:22', 2, NULL, 1);
INSERT INTO `blog_article` VALUES (3, '旌阳区德新小学语文研讨会：以研促教 以学定教', NULL, '9月12日讯（黄敏 邓传蓉 文/图）为了提高语文课堂教学效率，进一步规范语文教学常规管理，明确本学期教学目标和教研活动安排，9月11日下午，旌阳区德新小学语文教研组召开了新学期的第一次教研活动', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/yantao.jpg', '1', NULL, NULL, '2018-09-12 08:00:00', '<p style=\'-webkit-tap-highlight-color: transparent; margin-top: 16px; margin-bottom: 16px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; font-size: 16px; background-color: rgb(255, 255, 255);\'><span style=\'-webkit-tap-highlight-color: transparent; font-weight: 700;\'>9月12日讯（黄敏 邓传蓉 文/图）</span>为了提高语文课堂教学效率，进一步规范语文教学常规管理，明确本学期教学目标和教研活动安排，9月11日下午，旌阳区德新小学语文教研组召开了新学期的第一次教研活动。此次活动的内容是学习本学期教研组工作计划和小学语文新课程标准，并对上学期的教学工作进行总结和反思。</p><p style=\'-webkit-tap-highlight-color: transparent; margin-top: 16px; margin-bottom: 16px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; font-size: 16px; background-color: rgb(255, 255, 255);\'>首先，语文教研组长黄敏组织全组老师学习了本学期的教研工作计划，对本学期的教研工作进行了详细的安排，各语文教师认真听取并了解了自己的教学教研工作任务。</p><p style=\'-webkit-tap-highlight-color: transparent; margin-top: 16px; margin-bottom: 16px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; font-size: 16px; background-color: rgb(255, 255, 255);\'>然后，全体语文教师再次进行了小学语文新课程标准的学习，对语文教学特点和教学总目标、各年段目标有了更深入的了解，以助推语文教学。</p><p style=\'-webkit-tap-highlight-color: transparent; margin-top: 16px; margin-bottom: 16px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; font-size: 16px; background-color: rgb(255, 255, 255);\'>最后，对上期教学工作进行总结和反思。从学生的实际情况出发，从教学中存在的问题出发，大家展开了激烈的发言和讨论。针对农村留守儿童缺乏家长辅导和督促，课外阅读少积累欠丰富，阅读写作能力有待提高等现状，教师们踊跃发言，各抒己见，相互支招，交流总结经验，思考补救措施。</p><p style=\'-webkit-tap-highlight-color: transparent; margin-top: 16px; margin-bottom: 16px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; font-size: 16px; background-color: rgb(255, 255, 255);\'>以研促教，以学定教，本次活动研讨氛围浓厚，立足实际，放眼学生语文素养的形成和发展。相信在学校领导的大力支持下，通过全体语文老师的努力，德新小学的孩子们会更热爱阅读，更善于阅读，遨游书海，愉悦成长。</p><p><br></p>', '9月12日讯（黄敏 邓传蓉 文/图）为了提高语文课堂教学效率，进一步规范语文教学常规管理，明确本学期教学目标和教研活动安排，9月11日下午，旌阳区德新小学语文教研组召开了新学期的第一次教研活动。此次活动的内容是学习本学期教研组工作计划和小学语文新课程标准，并对上学期的教学工作进行总结和反思。首先，语文教研组长黄敏组织全组老师学习了本学期的教研工作计划，对本学期的教研工作进行了详细的安排，各语文教师认真听取并了解了自己的教学教研工作任务。然后，全体语文教师再次进行了小学语文新课程标准的学习，对语文教学特点和教学总目标、各年段目标有了更深入的了解，以助推语文教学。最后，对上期教学工作进行总结和反思。从学生的实际情况出发，从教学中存在的问题出发，大家展开了激烈的发言和讨论。针对农村留守儿童缺乏家长辅导和督促，课外阅读少积累欠丰富，阅读写作能力有待提高等现状，教师们踊跃发言，各抒己见，相互支招，交流总结经验，思考补救措施。以研促教，以学定教，本次活动研讨氛围浓厚，立足实际，放眼学生语文素养的形成和发展。相信在学校领导的大力支持下，通过全体语文老师的努力，德新小学的孩子们会更热爱阅读，更善于阅读，遨游书海，愉悦成长。', 8, 0, 1, 22, 2, b'0', b'0', NULL, '2018-09-12 23:31:52', 2, '2018-09-16 15:05:43', 2, NULL, 1);
INSERT INTO `blog_article` VALUES (4, '旌阳区德新小学举行2018年秋期开学典礼', NULL, '四川新闻网德阳9月3日讯（邓传蓉 文/图）9月3日上午9点，旌阳区德新小学隆重举行2018年秋期开学典礼。', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/kaixue.jpg', '1', NULL, NULL, '2018-09-12 08:00:00', '<p style=\'margin-top: 26px; margin-bottom: 0px; font-size: 16px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; background-color: rgb(255, 255, 255);\'><b>四川新闻网德阳9月3日讯（邓传蓉 文/图）</b>9月3日上午9点，旌阳区德新小学隆重举行2018年秋期开学典礼。</p><p style=\'margin-top: 22px; margin-bottom: 0px; font-size: 16px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; background-color: rgb(255, 255, 255);\'>庄严的升旗仪式之后，学校校长钱继光首先做了热情洋溢的致辞。他在致辞中肯定了学校上学期所取得的各项成绩，对全体教师认真负责的敬业精神和同学们勤奋努力的学习态度给予了高度赞扬。钱继光希望全体教师一如既往做师德高尚、学生热爱、家长满意的优秀教师，希望同学们爱卫生、讲文明，树新风，勇于接受新挑战，用实际的行动实现新学期的新希望。</p><p style=\'margin-top: 22px; margin-bottom: 0px; font-size: 16px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; background-color: rgb(255, 255, 255);\'>接着，副校长王辉对全校学生进行了开学安全、健康、法制第一课。在校园活动安全、预防流行疾病、交通安全、防溺水、食品健康卫生、防校园欺凌、学法用法等方面给学生进行了生动的讲解。</p><p style=\'margin-top: 22px; margin-bottom: 0px; font-size: 16px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; background-color: rgb(255, 255, 255);\'>集会后，各班班主任对学生进行新学期的收心教育、行为习惯教育和安全健康法制教育。希望德新小学的全体学生，以更加饱满的精神和昂扬的姿态迎接新学期，在新学期安全、健康、快乐地学习和生活，取得优异的成绩。</p>', '四川新闻网德阳9月3日讯（邓传蓉 文/图）9月3日上午9点，旌阳区德新小学隆重举行2018年秋期开学典礼。庄严的升旗仪式之后，学校校长钱继光首先做了热情洋溢的致辞。他在致辞中肯定了学校上学期所取得的各项成绩，对全体教师认真负责的敬业精神和同学们勤奋努力的学习态度给予了高度赞扬。钱继光希望全体教师一如既往做师德高尚、学生热爱、家长满意的优秀教师，希望同学们爱卫生、讲文明，树新风，勇于接受新挑战，用实际的行动实现新学期的新希望。接着，副校长王辉对全校学生进行了开学安全、健康、法制第一课。在校园活动安全、预防流行疾病、交通安全、防溺水、食品健康卫生、防校园欺凌、学法用法等方面给学生进行了生动的讲解。集会后，各班班主任对学生进行新学期的收心教育、行为习惯教育和安全健康法制教育。希望德新小学的全体学生，以更加饱满的精神和昂扬的姿态迎接新学期，在新学期安全、健康、快乐地学习和生活，取得优异的成绩。', 9, 1, 1, 22, 1, b'0', b'0', NULL, '2018-09-12 23:27:34', 2, '2018-09-16 15:05:57', 2, NULL, 1);
INSERT INTO `blog_article` VALUES (5, '旌阳区美术“青蓝工程”教学研讨活动在德新小学开展', NULL, '11月6日讯（宋平 邓传蓉 文/图）11月6日上午，在旌阳区教科所美术教研员冯伟杰的带领下，市区美术教师辜小平、侯德晖、王开琴、刘进川等一行人到德新小学分部进行青蓝工程的听课活动，德新小学美术教师宋平老师上了一堂《自行车局部写生》的户外写生课', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/1509956267552.jpg', '1', NULL, NULL, '2018-09-12 08:00:00', '<p style=\'padding-top: 3px; padding-bottom: 3px; font-family: &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255); line-height: 30px; text-indent: 2em; font-size: 16px;\'><strong>11月6日讯（宋平 邓传蓉 文/图）</strong>11月6日上午，在旌阳区教科所美术教研员冯伟杰的带领下，市区美术教师辜小平、侯德晖、王开琴、刘进川等一行人到德新小学分部进行青蓝工程的听课活动，德新小学美术教师宋平老师上了一堂《自行车局部写生》的户外写生课。</p><p style=\'padding-top: 3px; padding-bottom: 3px; font-family: &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255); line-height: 30px; text-indent: 2em; font-size: 16px;\'>在绿树环绕的教学楼前，宋平老师先让学生观察现实中的自行车，再对学生们讲解自行车的结构，然后教同学们如何运用灵活多变的线条，进行自行车局部写生创作。同学们在轻松愉快的环境中完成了本堂课的任务。</p><p style=\'padding-top: 3px; padding-bottom: 3px; font-family: &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255); line-height: 30px; text-indent: 2em; font-size: 16px;\'>课后，听课的老师们都作出了高度评价，说作为农村小学能达到这种水平非常棒，肯定了学生的基本功很牢固。冯伟杰和侯德晖老师说，将课堂搬到户外这种形式非常好，学生都非常开心，课堂氛围活跃，课程结构非常完整，每个教学环节的设计有新意。美术特级教师辜小平老师除了对本堂课进行点评，还着重讲了青年美术教师应该如何规划自己的教学生涯，让美术教师拥有成就感，成就感来源于学生的作品和教师的作品，主张将小学每个角落拥有学生的作品。</p><p style=\'padding-top: 3px; padding-bottom: 3px; font-family: &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255); line-height: 30px; text-indent: 2em; font-size: 16px;\'>当然也提出了很多宝贵的意见，王开琴老师指出，在学生创作时应让学生动起来，学生自己去选择喜欢的自行车局部。辜小平老师说，学生在局部写生创作时应延伸到每个小的细节，将局部画得更精细，学生构图上应注意画面的饱满，空白地方的处理等。与会老师指出，青年美术教师应让自身的基本功变得更扎实，平时要多画，多练，多参加展览，提升自身素质。</p><p style=\'padding-top: 3px; padding-bottom: 3px; font-family: &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255); line-height: 30px; text-indent: 2em; font-size: 16px;\'>本次美术“青蓝工程”教学研讨活动，专家指导，名师引领，让与会教师受益匪浅，促进了青年教师的快速成长。</p><p><br></p>', '11月6日讯（宋平 邓传蓉 文/图）11月6日上午，在旌阳区教科所美术教研员冯伟杰的带领下，市区美术教师辜小平、侯德晖、王开琴、刘进川等一行人到德新小学分部进行青蓝工程的听课活动，德新小学美术教师宋平老师上了一堂《自行车局部写生》的户外写生课。在绿树环绕的教学楼前，宋平老师先让学生观察现实中的自行车，再对学生们讲解自行车的结构，然后教同学们如何运用灵活多变的线条，进行自行车局部写生创作。同学们在轻松愉快的环境中完成了本堂课的任务。课后，听课的老师们都作出了高度评价，说作为农村小学能达到这种水平非常棒，肯定了学生的基本功很牢固。冯伟杰和侯德晖老师说，将课堂搬到户外这种形式非常好，学生都非常开心，课堂氛围活跃，课程结构非常完整，每个教学环节的设计有新意。美术特级教师辜小平老师除了对本堂课进行点评，还着重讲了青年美术教师应该如何规划自己的教学生涯，让美术教师拥有成就感，成就感来源于学生的作品和教师的作品，主张将小学每个角落拥有学生的作品。当然也提出了很多宝贵的意见，王开琴老师指出，在学生创作时应让学生动起来，学生自己去选择喜欢的自行车局部。辜小平老师说，学生在局部写生创作时应延伸到每个小的细节，将局部画得更精细，学生构图上应注意画面的饱满，空白地方的处理等。与会老师指出，青年美术教师应让自身的基本功变得更扎实，平时要多画，多练，多参加展览，提升自身素质。本次美术“青蓝工程”教学研讨活动，专家指导，名师引领，让与会教师受益匪浅，促进了青年教师的快速成长。', 13, 0, 1, 22, 0, b'0', b'0', NULL, '2018-09-12 23:22:36', 2, '2018-09-16 15:06:04', 2, NULL, 1);
INSERT INTO `blog_article` VALUES (6, '学校简介', NULL, '旌阳区德新小学座落在距离德阳市北20公里的“西蜀泉乡”——德新镇，1916年，秀才舒尔英在新场火神庙内办起的学堂，这是德新小学的前身', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/dexin.jpg', '1', NULL, NULL, '2018-09-12 08:00:00', '<p></p><p style=\'text-align: center;\'></p><p style=\'text-align: left;\'></p><p><br></p><p></p><p style=\'text-align:center\'><video style=\'margin:0 auto;\' src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/dexinxiaoxue.mp4\' controls=\'controls\'> 不支持播放该视频 </video></p><h2>&nbsp; &nbsp; 旌阳区德新小学座落在距离德阳市北20公里的“西蜀泉乡”——德新镇1916年，秀才舒尔英在新场火神庙内办起的学堂，这是德新小学的前身。学校现有教师65名，小学生807名，幼儿生208名，是小而美、小而优的农村小学。&nbsp;</h2><h2>&nbsp; &nbsp; 学校重视学生全面发展，组建丰富多样的兴趣小组，有绘画、手工、足球、篮球、合唱、电子琴、古筝、二胡、舞蹈、跆拳道等课程，培养了一批又一批综合素质优秀的学生。</h2><p class=\'MsoNormal\' style=\'mso-pagination:widow-orphan\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/deyang_dexin_xiaoxue/top_img/13.jpg\' style=\'max-width:100%;\'><span style=\'font-size:\n14.0pt;font-family:宋体;mso-ascii-theme-font:major-fareast;mso-fareast-theme-font:\nmajor-fareast;mso-hansi-theme-font:major-fareast;mso-bidi-font-family:Calibri;\ncolor:black;mso-font-kerning:0pt\'><br></span></p><h2 style=\'mso-pagination:widow-orphan\'><span style=\'font-size:\n14.0pt;font-family:宋体;mso-ascii-theme-font:major-fareast;mso-fareast-theme-font:\nmajor-fareast;mso-hansi-theme-font:major-fareast;mso-bidi-font-family:Calibri;\ncolor:black;mso-font-kerning:0pt\'>&nbsp;&nbsp;</span><span style=\'font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif;\'>每学期的生活实践周很受学生喜爱，参加劳动、体验独自生活，集体外出游行，培养团队合作，文艺演出，学生们集思广益，各显神通，学习生活技能，个个都是能手，彰显能力，小小的年级，大大的能量。</span></h2><style>\n<!--\n /* Font Definitions */\n @font-face\n	{font-family:宋体;\n	panose-1:2 1 6 0 3 1 1 1 1 1;\n	mso-font-alt:SimSun;\n	mso-font-charset:134;\n	mso-generic-font-family:auto;\n	mso-font-pitch:variable;\n	mso-font-signature:3 680460288 22 0 262145 0;}\n@font-face\n	{font-family:\'Cambria Math\';\n	panose-1:2 4 5 3 5 4 6 3 2 4;\n	mso-font-charset:1;\n	mso-generic-font-family:roman;\n	mso-font-format:other;\n	mso-font-pitch:variable;\n	mso-font-signature:0 0 0 0 0 0;}\n@font-face\n	{font-family:Consolas;\n	panose-1:2 11 6 9 2 2 4 3 2 4;\n	mso-font-charset:0;\n	mso-generic-font-family:modern;\n	mso-font-pitch:fixed;\n	mso-font-signature:-536869121 64767 1 0 415 0;}\n@font-face\n	{font-family:\'\\@宋体\';\n	panose-1:2 1 6 0 3 1 1 1 1 1;\n	mso-font-charset:134;\n	mso-generic-font-family:auto;\n	mso-font-pitch:variable;\n	mso-font-signature:3 680460288 22 0 262145 0;}\n /* Style Definitions */\n p.MsoNormal, li.MsoNormal, div.MsoNormal\n	{mso-style-unhide:no;\n	mso-style-qformat:yes;\n	mso-style-parent:\'\';\n	margin:0cm;\n	margin-bottom:.0001pt;\n	text-align:justify;\n	text-justify:inter-ideograph;\n	mso-pagination:none;\n	font-size:10.5pt;\n	mso-bidi-font-size:11.0pt;\n	font-family:Consolas;\n	mso-fareast-font-family:宋体;\n	mso-fareast-theme-font:minor-fareast;\n	mso-bidi-font-family:\'Times New Roman\';\n	mso-bidi-theme-font:minor-bidi;\n	mso-font-kerning:1.0pt;}\n.MsoChpDefault\n	{mso-style-type:export-only;\n	mso-default-props:yes;\n	font-family:Consolas;\n	mso-ascii-font-family:Consolas;\n	mso-hansi-font-family:Consolas;\n	mso-bidi-font-family:\'Times New Roman\';\n	mso-bidi-theme-font:minor-bidi;}\n /* Page Definitions */\n @page\n	{mso-page-border-surround-header:no;\n	mso-page-border-surround-footer:no;}\n@page WordSection1\n	{size:612.0pt 792.0pt;\n	margin:72.0pt 90.0pt 72.0pt 90.0pt;\n	mso-header-margin:36.0pt;\n	mso-footer-margin:36.0pt;\n	mso-paper-source:0;}\ndiv.WordSection1\n	{page:WordSection1;}\n-->\n</style><p class=\'MsoNormal\' style=\'text-indent:21.0pt\'><span lang=\'EN-US\' style=\'font-size:14.0pt\'><o:p></o:p></span></p><style>\n<!--\n /* Font Definitions */\n @font-face\n	{font-family:宋体;\n	panose-1:2 1 6 0 3 1 1 1 1 1;\n	mso-font-alt:SimSun;\n	mso-font-charset:134;\n	mso-generic-font-family:auto;\n	mso-font-pitch:variable;\n	mso-font-signature:3 680460288 22 0 262145 0;}\n@font-face\n	{font-family:\'Cambria Math\';\n	panose-1:2 4 5 3 5 4 6 3 2 4;\n	mso-font-charset:1;\n	mso-generic-font-family:roman;\n	mso-font-format:other;\n	mso-font-pitch:variable;\n	mso-font-signature:0 0 0 0 0 0;}\n@font-face\n	{font-family:Consolas;\n	panose-1:2 11 6 9 2 2 4 3 2 4;\n	mso-font-charset:0;\n	mso-generic-font-family:modern;\n	mso-font-pitch:fixed;\n	mso-font-signature:-536869121 64767 1 0 415 0;}\n@font-face\n	{font-family:\'\\@宋体\';\n	panose-1:2 1 6 0 3 1 1 1 1 1;\n	mso-font-charset:134;\n	mso-generic-font-family:auto;\n	mso-font-pitch:variable;\n	mso-font-signature:3 680460288 22 0 262145 0;}\n /* Style Definitions */\n p.MsoNormal, li.MsoNormal, div.MsoNormal\n	{mso-style-unhide:no;\n	mso-style-qformat:yes;\n	mso-style-parent:\'\';\n	margin:0cm;\n	margin-bottom:.0001pt;\n	text-align:justify;\n	text-justify:inter-ideograph;\n	mso-pagination:none;\n	font-size:10.5pt;\n	mso-bidi-font-size:11.0pt;\n	font-family:Consolas;\n	mso-fareast-font-family:宋体;\n	mso-fareast-theme-font:minor-fareast;\n	mso-bidi-font-family:\'Times New Roman\';\n	mso-bidi-theme-font:minor-bidi;\n	mso-font-kerning:1.0pt;}\n.MsoChpDefault\n	{mso-style-type:export-only;\n	mso-default-props:yes;\n	font-family:Consolas;\n	mso-ascii-font-family:Consolas;\n	mso-hansi-font-family:Consolas;\n	mso-bidi-font-family:\'Times New Roman\';\n	mso-bidi-theme-font:minor-bidi;}\n /* Page Definitions */\n @page\n	{mso-page-border-surround-header:no;\n	mso-page-border-surround-footer:no;}\n@page WordSection1\n	{size:612.0pt 792.0pt;\n	margin:72.0pt 90.0pt 72.0pt 90.0pt;\n	mso-header-margin:36.0pt;\n	mso-footer-margin:36.0pt;\n	mso-paper-source:0;}\ndiv.WordSection1\n	{page:WordSection1;}\n-->\n</style><p class=\'MsoNormal\' style=\'text-indent:21.0pt\'><span lang=\'EN-US\' style=\'font-size:14.0pt\'><o:p></o:p></span></p><p class=\'MsoNormal\' style=\'mso-pagination:widow-orphan\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/deyang_dexin_xiaoxue/top_img/14.jpg\' style=\'max-width:100%;\'><span style=\'font-size:\n14.0pt;font-family:宋体;mso-ascii-theme-font:major-fareast;mso-fareast-theme-font:\nmajor-fareast;mso-hansi-theme-font:major-fareast;mso-bidi-font-family:Calibri;\ncolor:black;mso-font-kerning:0pt\'><br></span></p><h2 style=\'text-align: left; text-indent: 0px;\'>&nbsp; &nbsp;老师说：“严在当严处，爱在细微中。”&nbsp;</h2><h2 style=\'text-align: left; text-indent: 0px;\'>&nbsp; &nbsp;校长说：尊重每一个孩子的生命个体，努力让他们学有所成，并找到适合每一个生命个体的发展路径，为他们的终身发展奠定坚实的基础。&nbsp;&nbsp;&nbsp;</h2><p style=\'text-align: left;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/deyang_dexin_xiaoxue/top_img/2.jpg\' style=\'max-width:100%;\'><br></p><style>\n<!--\n /* Font Definitions */\n @font-face\n	{font-family:宋体;\n	panose-1:2 1 6 0 3 1 1 1 1 1;\n	mso-font-alt:SimSun;\n	mso-font-charset:134;\n	mso-generic-font-family:auto;\n	mso-font-pitch:variable;\n	mso-font-signature:3 680460288 22 0 262145 0;}\n@font-face\n	{font-family:\'Cambria Math\';\n	panose-1:2 4 5 3 5 4 6 3 2 4;\n	mso-font-charset:1;\n	mso-generic-font-family:roman;\n	mso-font-format:other;\n	mso-font-pitch:variable;\n	mso-font-signature:0 0 0 0 0 0;}\n@font-face\n	{font-family:Calibri;\n	panose-1:2 15 5 2 2 2 4 3 2 4;\n	mso-font-charset:0;\n	mso-generic-font-family:swiss;\n	mso-font-pitch:variable;\n	mso-font-signature:-536859905 -1073732485 9 0 511 0;}\n@font-face\n	{font-family:\'\\@宋体\';\n	panose-1:2 1 6 0 3 1 1 1 1 1;\n	mso-font-charset:134;\n	mso-generic-font-family:auto;\n	mso-font-pitch:variable;\n	mso-font-signature:3 680460288 22 0 262145 0;}\n /* Style Definitions */\n p.MsoNormal, li.MsoNormal, div.MsoNormal\n	{mso-style-unhide:no;\n	mso-style-qformat:yes;\n	mso-style-parent:\'\';\n	margin:0cm;\n	margin-bottom:.0001pt;\n	text-align:justify;\n	text-justify:inter-ideograph;\n	mso-pagination:none;\n	font-size:10.5pt;\n	mso-bidi-font-size:12.0pt;\n	font-family:\'Calibri\',\'sans-serif\';\n	mso-fareast-font-family:宋体;\n	mso-bidi-font-family:\'Times New Roman\';\n	mso-font-kerning:1.0pt;}\n.MsoChpDefault\n	{mso-style-type:export-only;\n	mso-default-props:yes;\n	font-size:10.0pt;\n	mso-ansi-font-size:10.0pt;\n	mso-bidi-font-size:10.0pt;\n	mso-ascii-font-family:\'Times New Roman\';\n	mso-fareast-font-family:宋体;\n	mso-hansi-font-family:\'Times New Roman\';\n	mso-font-kerning:0pt;}\n /* Page Definitions */\n @page\n	{mso-page-border-surround-header:no;\n	mso-page-border-surround-footer:no;}\n@page WordSection1\n	{size:612.0pt 792.0pt;\n	margin:72.0pt 90.0pt 72.0pt 90.0pt;\n	mso-header-margin:36.0pt;\n	mso-footer-margin:36.0pt;\n	mso-paper-source:0;}\ndiv.WordSection1\n	{page:WordSection1;}\n-->\n</style><p><br></p><style>\n<!--\n /* Font Definitions */\n @font-face\n	{font-family:宋体;\n	panose-1:2 1 6 0 3 1 1 1 1 1;\n	mso-font-alt:SimSun;\n	mso-font-charset:134;\n	mso-generic-font-family:auto;\n	mso-font-pitch:variable;\n	mso-font-signature:3 680460288 22 0 262145 0;}\n@font-face\n	{font-family:\'Cambria Math\';\n	panose-1:2 4 5 3 5 4 6 3 2 4;\n	mso-font-charset:1;\n	mso-generic-font-family:roman;\n	mso-font-format:other;\n	mso-font-pitch:variable;\n	mso-font-signature:0 0 0 0 0 0;}\n@font-face\n	{font-family:Consolas;\n	panose-1:2 11 6 9 2 2 4 3 2 4;\n	mso-font-charset:0;\n	mso-generic-font-family:modern;\n	mso-font-pitch:fixed;\n	mso-font-signature:-536869121 64767 1 0 415 0;}\n@font-face\n	{font-family:\'\\@宋体\';\n	panose-1:2 1 6 0 3 1 1 1 1 1;\n	mso-font-charset:134;\n	mso-generic-font-family:auto;\n	mso-font-pitch:variable;\n	mso-font-signature:3 680460288 22 0 262145 0;}\n /* Style Definitions */\n p.MsoNormal, li.MsoNormal, div.MsoNormal\n	{mso-style-unhide:no;\n	mso-style-qformat:yes;\n	mso-style-parent:\'\';\n	margin:0cm;\n	margin-bottom:.0001pt;\n	text-align:justify;\n	text-justify:inter-ideograph;\n	mso-pagination:none;\n	font-size:10.5pt;\n	mso-bidi-font-size:11.0pt;\n	font-family:Consolas;\n	mso-fareast-font-family:宋体;\n	mso-fareast-theme-font:minor-fareast;\n	mso-bidi-font-family:\'Times New Roman\';\n	mso-bidi-theme-font:minor-bidi;\n	mso-font-kerning:1.0pt;}\n.MsoChpDefault\n	{mso-style-type:export-only;\n	mso-default-props:yes;\n	font-family:Consolas;\n	mso-ascii-font-family:Consolas;\n	mso-hansi-font-family:Consolas;\n	mso-bidi-font-family:\'Times New Roman\';\n	mso-bidi-theme-font:minor-bidi;}\n /* Page Definitions */\n @page\n	{mso-page-border-surround-header:no;\n	mso-page-border-surround-footer:no;}\n@page WordSection1\n	{size:595.3pt 841.9pt;\n	margin:72.0pt 90.0pt 72.0pt 90.0pt;\n	mso-header-margin:42.55pt;\n	mso-footer-margin:49.6pt;\n	mso-paper-source:0;\n	layout-grid:15.6pt;}\ndiv.WordSection1\n	{page:WordSection1;}\n-->\n</style><p><br></p><style>\n<!--\n /* Font Definitions */\n @font-face\n	{font-family:宋体;\n	panose-1:2 1 6 0 3 1 1 1 1 1;\n	mso-font-alt:SimSun;\n	mso-font-charset:134;\n	mso-generic-font-family:auto;\n	mso-font-pitch:variable;\n	mso-font-signature:3 680460288 22 0 262145 0;}\n@font-face\n	{font-family:\'Cambria Math\';\n	panose-1:2 4 5 3 5 4 6 3 2 4;\n	mso-font-charset:1;\n	mso-generic-font-family:roman;\n	mso-font-format:other;\n	mso-font-pitch:variable;\n	mso-font-signature:0 0 0 0 0 0;}\n@font-face\n	{font-family:Consolas;\n	panose-1:2 11 6 9 2 2 4 3 2 4;\n	mso-font-charset:0;\n	mso-generic-font-family:modern;\n	mso-font-pitch:fixed;\n	mso-font-signature:-536869121 64767 1 0 415 0;}\n@font-face\n	{font-family:\'\\@宋体\';\n	panose-1:2 1 6 0 3 1 1 1 1 1;\n	mso-font-charset:134;\n	mso-generic-font-family:auto;\n	mso-font-pitch:variable;\n	mso-font-signature:3 680460288 22 0 262145 0;}\n /* Style Definitions */\n p.MsoNormal, li.MsoNormal, div.MsoNormal\n	{mso-style-unhide:no;\n	mso-style-qformat:yes;\n	mso-style-parent:\'\';\n	margin:0cm;\n	margin-bottom:.0001pt;\n	text-align:justify;\n	text-justify:inter-ideograph;\n	mso-pagination:none;\n	font-size:10.5pt;\n	mso-bidi-font-size:11.0pt;\n	font-family:Consolas;\n	mso-fareast-font-family:宋体;\n	mso-fareast-theme-font:minor-fareast;\n	mso-bidi-font-family:\'Times New Roman\';\n	mso-bidi-theme-font:minor-bidi;\n	mso-font-kerning:1.0pt;}\n.MsoChpDefault\n	{mso-style-type:export-only;\n	mso-default-props:yes;\n	font-family:Consolas;\n	mso-ascii-font-family:Consolas;\n	mso-hansi-font-family:Consolas;\n	mso-bidi-font-family:\'Times New Roman\';\n	mso-bidi-theme-font:minor-bidi;}\n /* Page Definitions */\n @page\n	{mso-page-border-surround-header:no;\n	mso-page-border-surround-footer:no;}\n@page WordSection1\n	{size:612.0pt 792.0pt;\n	margin:72.0pt 90.0pt 72.0pt 90.0pt;\n	mso-header-margin:36.0pt;\n	mso-footer-margin:36.0pt;\n	mso-paper-source:0;}\ndiv.WordSection1\n	{page:WordSection1;}\n-->\n</style><p><br></p><style>\n<!--\n /* Font Definitions */\n @font-face\n	{font-family:宋体;\n	panose-1:2 1 6 0 3 1 1 1 1 1;\n	mso-font-alt:SimSun;\n	mso-font-charset:134;\n	mso-generic-font-family:auto;\n	mso-font-pitch:variable;\n	mso-font-signature:3 680460288 22 0 262145 0;}\n@font-face\n	{font-family:\'Cambria Math\';\n	panose-1:2 4 5 3 5 4 6 3 2 4;\n	mso-font-charset:1;\n	mso-generic-font-family:roman;\n	mso-font-format:other;\n	mso-font-pitch:variable;\n	mso-font-signature:0 0 0 0 0 0;}\n@font-face\n	{font-family:Consolas;\n	panose-1:2 11 6 9 2 2 4 3 2 4;\n	mso-font-charset:0;\n	mso-generic-font-family:modern;\n	mso-font-pitch:fixed;\n	mso-font-signature:-536869121 64767 1 0 415 0;}\n@font-face\n	{font-family:\'\\@宋体\';\n	panose-1:2 1 6 0 3 1 1 1 1 1;\n	mso-font-charset:134;\n	mso-generic-font-family:auto;\n	mso-font-pitch:variable;\n	mso-font-signature:3 680460288 22 0 262145 0;}\n /* Style Definitions */\n p.MsoNormal, li.MsoNormal, div.MsoNormal\n	{mso-style-unhide:no;\n	mso-style-qformat:yes;\n	mso-style-parent:\'\';\n	margin:0cm;\n	margin-bottom:.0001pt;\n	text-align:justify;\n	text-justify:inter-ideograph;\n	mso-pagination:none;\n	font-size:10.5pt;\n	mso-bidi-font-size:11.0pt;\n	font-family:Consolas;\n	mso-fareast-font-family:宋体;\n	mso-fareast-theme-font:minor-fareast;\n	mso-bidi-font-family:\'Times New Roman\';\n	mso-bidi-theme-font:minor-bidi;\n	mso-font-kerning:1.0pt;}\n.MsoChpDefault\n	{mso-style-type:export-only;\n	mso-default-props:yes;\n	font-family:Consolas;\n	mso-ascii-font-family:Consolas;\n	mso-hansi-font-family:Consolas;\n	mso-bidi-font-family:\'Times New Roman\';\n	mso-bidi-theme-font:minor-bidi;}\n /* Page Definitions */\n @page\n	{mso-page-border-surround-header:no;\n	mso-page-border-surround-footer:no;}\n@page WordSection1\n	{size:612.0pt 792.0pt;\n	margin:72.0pt 90.0pt 72.0pt 90.0pt;\n	mso-header-margin:36.0pt;\n	mso-footer-margin:36.0pt;\n	mso-paper-source:0;}\ndiv.WordSection1\n	{page:WordSection1;}\n-->\n</style>', ' 不支持播放该视频 &nbsp; &nbsp; 旌阳区德新小学座落在距离德阳市北20公里的“西蜀泉乡”——德新镇1916年，秀才舒尔英在新场火神庙内办起的学堂，这是德新小学的前身。学校现有教师65名，小学生807名，幼儿生208名，是小而美、小而优的农村小学。&nbsp;&nbsp; &nbsp; 学校重视学生全面发展，组建丰富多样的兴趣小组，有绘画、手工、足球、篮球、合唱、电子琴、古筝、二胡、舞蹈、跆拳道等课程，培养了一批又一批综合素质优秀的学生。<span style=\'font-size:\n14.0pt;font-family:宋体;mso-ascii-theme-font:major-fareast;mso-fareast-theme-font:\nmajor-fareast;mso-hansi-theme-font:major-fareast;mso-bidi-font-family:Calibri;\ncolor:black;mso-font-kerning:0pt\'><span style=\'font-size:\n14.0pt;font-family:宋体;mso-ascii-theme-font:major-fareast;mso-fareast-theme-font:\nmajor-fareast;mso-hansi-theme-font:major-fareast;mso-bidi-font-family:Calibri;\ncolor:black;mso-font-kerning:0pt\'>&nbsp;&nbsp;每学期的生活实践周很受学生喜爱，参加劳动、体验独自生活，集体外出游行，培养团队合作，文艺演出，学生们集思广益，各显神通，学习生活技能，个个都是能手，彰显能力，小小的年级，大大的能量。\n<!--\n /* Font Definitions */\n @font-face\n	{font-family:宋体;\n	panose-1:2 1 6 0 3 1 1 1 1 1;\n	mso-font-alt:SimSun;\n	mso-font-charset:134;\n	mso-generic-font-family:auto;\n	mso-font-pitch:variable;\n	mso-font-signature:3 680460288 22 0 262145 0;}\n@font-face\n	{font-family:\'Cambria Math\';\n	panose-1:2 4 5 3 5 4 6 3 2 4;\n	mso-font-charset:1;\n	mso-generic-font-family:roman;\n	mso-font-format:other;\n	mso-font-pitch:variable;\n	mso-font-signature:0 0 0 0 0 0;}\n@font-face\n	{font-family:Consolas;\n	panose-1:2 11 6 9 2 2 4 3 2 4;\n	mso-font-charset:0;\n	mso-generic-font-family:modern;\n	mso-font-pitch:fixed;\n	mso-font-signature:-536869121 64767 1 0 415 0;}\n@font-face\n	{font-family:\'\\@宋体\';\n	panose-1:2 1 6 0 3 1 1 1 1 1;\n	mso-font-charset:134;\n	mso-generic-font-family:auto;\n	mso-font-pitch:variable;\n	mso-font-signature:3 680460288 22 0 262145 0;}\n /* Style Definitions */\n p.MsoNormal, li.MsoNormal, div.MsoNormal\n	{mso-style-unhide:no;\n	mso-style-qformat:yes;\n	mso-style-parent:\'\';\n	margin:0cm;\n	margin-bottom:.0001pt;\n	text-align:justify;\n	text-justify:inter-ideograph;\n	mso-pagination:none;\n	font-size:10.5pt;\n	mso-bidi-font-size:11.0pt;\n	font-family:Consolas;\n	mso-fareast-font-family:宋体;\n	mso-fareast-theme-font:minor-fareast;\n	mso-bidi-font-family:\'Times New Roman\';\n	mso-bidi-theme-font:minor-bidi;\n	mso-font-kerning:1.0pt;}\n.MsoChpDefault\n	{mso-style-type:export-only;\n	mso-default-props:yes;\n	font-family:Consolas;\n	mso-ascii-font-family:Consolas;\n	mso-hansi-font-family:Consolas;\n	mso-bidi-font-family:\'Times New Roman\';\n	mso-bidi-theme-font:minor-bidi;}\n /* Page Definitions */\n @page\n	{mso-page-border-surround-header:no;\n	mso-page-border-surround-footer:no;}\n@page WordSection1\n	{size:612.0pt 792.0pt;\n	margin:72.0pt 90.0pt 72.0pt 90.0pt;\n	mso-header-margin:36.0pt;\n	mso-footer-margin:36.0pt;\n	mso-paper-source:0;}\ndiv.WordSection1\n	{page:WordSection1;}\n-->\n\n<!--\n /* Font Definitions */\n @font-face\n	{font-family:宋体;\n	panose-1:2 1 6 0 3 1 1 1 1 1;\n	mso-font-alt:SimSun;\n	mso-font-charset:134;\n	mso-generic-font-family:auto;\n	mso-font-pitch:variable;\n	mso-font-signature:3 680460288 22 0 262145 0;}\n@font-face\n	{font-family:\'Cambria Math\';\n	panose-1:2 4 5 3 5 4 6 3 2 4;\n	mso-font-charset:1;\n	mso-generic-font-family:roman;\n	mso-font-format:other;\n	mso-font-pitch:variable;\n	mso-font-signature:0 0 0 0 0 0;}\n@font-face\n	{font-family:Consolas;\n	panose-1:2 11 6 9 2 2 4 3 2 4;\n	mso-font-charset:0;\n	mso-generic-font-family:modern;\n	mso-font-pitch:fixed;\n	mso-font-signature:-536869121 64767 1 0 415 0;}\n@font-face\n	{font-family:\'\\@宋体\';\n	panose-1:2 1 6 0 3 1 1 1 1 1;\n	mso-font-charset:134;\n	mso-generic-font-family:auto;\n	mso-font-pitch:variable;\n	mso-font-signature:3 680460288 22 0 262145 0;}\n /* Style Definitions */\n p.MsoNormal, li.MsoNormal, div.MsoNormal\n	{mso-style-unhide:no;\n	mso-style-qformat:yes;\n	mso-style-parent:\'\';\n	margin:0cm;\n	margin-bottom:.0001pt;\n	text-align:justify;\n	text-justify:inter-ideograph;\n	mso-pagination:none;\n	font-size:10.5pt;\n	mso-bidi-font-size:11.0pt;\n	font-family:Consolas;\n	mso-fareast-font-family:宋体;\n	mso-fareast-theme-font:minor-fareast;\n	mso-bidi-font-family:\'Times New Roman\';\n	mso-bidi-theme-font:minor-bidi;\n	mso-font-kerning:1.0pt;}\n.MsoChpDefault\n	{mso-style-type:export-only;\n	mso-default-props:yes;\n	font-family:Consolas;\n	mso-ascii-font-family:Consolas;\n	mso-hansi-font-family:Consolas;\n	mso-bidi-font-family:\'Times New Roman\';\n	mso-bidi-theme-font:minor-bidi;}\n /* Page Definitions */\n @page\n	{mso-page-border-surround-header:no;\n	mso-page-border-surround-footer:no;}\n@page WordSection1\n	{size:612.0pt 792.0pt;\n	margin:72.0pt 90.0pt 72.0pt 90.0pt;\n	mso-header-margin:36.0pt;\n	mso-footer-margin:36.0pt;\n	mso-paper-source:0;}\ndiv.WordSection1\n	{page:WordSection1;}\n-->\n<span style=\'font-size:\n14.0pt;font-family:宋体;mso-ascii-theme-font:major-fareast;mso-fareast-theme-font:\nmajor-fareast;mso-hansi-theme-font:major-fareast;mso-bidi-font-family:Calibri;\ncolor:black;mso-font-kerning:0pt\'>&nbsp; &nbsp;老师说：“严在当严处，爱在细微中。”&nbsp;&nbsp; &nbsp;校长说：尊重每一个孩子的生命个体，努力让他们学有所成，并找到适合每一个生命个体的发展路径，为他们的终身发展奠定坚实的基础。&nbsp;&nbsp;&nbsp;\n<!--\n /* Font Definitions */\n @font-face\n	{font-family:宋体;\n	panose-1:2 1 6 0 3 1 1 1 1 1;\n	mso-font-alt:SimSun;\n	mso-font-charset:134;\n	mso-generic-font-family:auto;\n	mso-font-pitch:variable;\n	mso-font-signature:3 680460288 22 0 262145 0;}\n@font-face\n	{font-family:\'Cambria Math\';\n	panose-1:2 4 5 3 5 4 6 3 2 4;\n	mso-font-charset:1;\n	mso-generic-font-family:roman;\n	mso-font-format:other;\n	mso-font-pitch:variable;\n	mso-font-signature:0 0 0 0 0 0;}\n@font-face\n	{font-family:Calibri;\n	panose-1:2 15 5 2 2 2 4 3 2 4;\n	mso-font-charset:0;\n	mso-generic-font-family:swiss;\n	mso-font-pitch:variable;\n	mso-font-signature:-536859905 -1073732485 9 0 511 0;}\n@font-face\n	{font-family:\'\\@宋体\';\n	panose-1:2 1 6 0 3 1 1 1 1 1;\n	mso-font-charset:134;\n	mso-generic-font-family:auto;\n	mso-font-pitch:variable;\n	mso-font-signature:3 680460288 22 0 262145 0;}\n /* Style Definitions */\n p.MsoNormal, li.MsoNormal, div.MsoNormal\n	{mso-style-unhide:no;\n	mso-style-qformat:yes;\n	mso-style-parent:\'\';\n	margin:0cm;\n	margin-bottom:.0001pt;\n	text-align:justify;\n	text-justify:inter-ideograph;\n	mso-pagination:none;\n	font-size:10.5pt;\n	mso-bidi-font-size:12.0pt;\n	font-family:\'Calibri\',\'sans-serif\';\n	mso-fareast-font-family:宋体;\n	mso-bidi-font-family:\'Times New Roman\';\n	mso-font-kerning:1.0pt;}\n.MsoChpDefault\n	{mso-style-type:export-only;\n	mso-default-props:yes;\n	font-size:10.0pt;\n	mso-ansi-font-size:10.0pt;\n	mso-bidi-font-size:10.0pt;\n	mso-ascii-font-family:\'Times New Roman\';\n	mso-fareast-font-family:宋体;\n	mso-hansi-font-family:\'Times New Roman\';\n	mso-font-kerning:0pt;}\n /* Page Definitions */\n @page\n	{mso-page-border-surround-header:no;\n	mso-page-border-surround-footer:no;}\n@page WordSection1\n	{size:612.0pt 792.0pt;\n	margin:72.0pt 90.0pt 72.0pt 90.0pt;\n	mso-header-margin:36.0pt;\n	mso-footer-margin:36.0pt;\n	mso-paper-source:0;}\ndiv.WordSection1\n	{page:WordSection1;}\n-->\n\n<!--\n /* Font Definitions */\n @font-face\n	{font-family:宋体;\n	panose-1:2 1 6 0 3 1 1 1 1 1;\n	mso-font-alt:SimSun;\n	mso-font-charset:134;\n	mso-generic-font-family:auto;\n	mso-font-pitch:variable;\n	mso-font-signature:3 680460288 22 0 262145 0;}\n@font-face\n	{font-family:\'Cambria Math\';\n	panose-1:2 4 5 3 5 4 6 3 2 4;\n	mso-font-charset:1;\n	mso-generic-font-family:roman;\n	mso-font-format:other;\n	mso-font-pitch:variable;\n	mso-font-signature:0 0 0 0 0 0;}\n@font-face\n	{font-family:Consolas;\n	panose-1:2 11 6 9 2 2 4 3 2 4;\n	mso-font-charset:0;\n	mso-generic-font-family:modern;\n	mso-font-pitch:fixed;\n	mso-font-signature:-536869121 64767 1 0 415 0;}\n@font-face\n	{font-family:\'\\@宋体\';\n	panose-1:2 1 6 0 3 1 1 1 1 1;\n	mso-font-charset:134;\n	mso-generic-font-family:auto;\n	mso-font-pitch:variable;\n	mso-font-signature:3 680460288 22 0 262145 0;}\n /* Style Definitions */\n p.MsoNormal, li.MsoNormal, div.MsoNormal\n	{mso-style-unhide:no;\n	mso-style-qformat:yes;\n	mso-style-parent:\'\';\n	margin:0cm;\n	margin-bottom:.0001pt;\n	text-align:justify;\n	text-justify:inter-ideograph;\n	mso-pagination:none;\n	font-size:10.5pt;\n	mso-bidi-font-size:11.0pt;\n	font-family:Consolas;\n	mso-fareast-font-family:宋体;\n	mso-fareast-theme-font:minor-fareast;\n	mso-bidi-font-family:\'Times New Roman\';\n	mso-bidi-theme-font:minor-bidi;\n	mso-font-kerning:1.0pt;}\n.MsoChpDefault\n	{mso-style-type:export-only;\n	mso-default-props:yes;\n	font-family:Consolas;\n	mso-ascii-font-family:Consolas;\n	mso-hansi-font-family:Consolas;\n	mso-bidi-font-family:\'Times New Roman\';\n	mso-bidi-theme-font:minor-bidi;}\n /* Page Definitions */\n @page\n	{mso-page-border-surround-header:no;\n	mso-page-border-surround-footer:no;}\n@page WordSection1\n	{size:595.3pt 841.9pt;\n	margin:72.0pt 90.0pt 72.0pt 90.0pt;\n	mso-header-margin:42.55pt;\n	mso-footer-margin:49.6pt;\n	mso-paper-source:0;\n	layout-grid:15.6pt;}\ndiv.WordSection1\n	{page:WordSection1;}\n-->\n\n<!--\n /* Font Definitions */\n @font-face\n	{font-family:宋体;\n	panose-1:2 1 6 0 3 1 1 1 1 1;\n	mso-font-alt:SimSun;\n	mso-font-charset:134;\n	mso-generic-font-family:auto;\n	mso-font-pitch:variable;\n	mso-font-signature:3 680460288 22 0 262145 0;}\n@font-face\n	{font-family:\'Cambria Math\';\n	panose-1:2 4 5 3 5 4 6 3 2 4;\n	mso-font-charset:1;\n	mso-generic-font-family:roman;\n	mso-font-format:other;\n	mso-font-pitch:variable;\n	mso-font-signature:0 0 0 0 0 0;}\n@font-face\n	{font-family:Consolas;\n	panose-1:2 11 6 9 2 2 4 3 2 4;\n	mso-font-charset:0;\n	mso-generic-font-family:modern;\n	mso-font-pitch:fixed;\n	mso-font-signature:-536869121 64767 1 0 415 0;}\n@font-face\n	{font-family:\'\\@宋体\';\n	panose-1:2 1 6 0 3 1 1 1 1 1;\n	mso-font-charset:134;\n	mso-generic-font-family:auto;\n	mso-font-pitch:variable;\n	mso-font-signature:3 680460288 22 0 262145 0;}\n /* Style Definitions */\n p.MsoNormal, li.MsoNormal, div.MsoNormal\n	{mso-style-unhide:no;\n	mso-style-qformat:yes;\n	mso-style-parent:\'\';\n	margin:0cm;\n	margin-bottom:.0001pt;\n	text-align:justify;\n	text-justify:inter-ideograph;\n	mso-pagination:none;\n	font-size:10.5pt;\n	mso-bidi-font-size:11.0pt;\n	font-family:Consolas;\n	mso-fareast-font-family:宋体;\n	mso-fareast-theme-font:minor-fareast;\n	mso-bidi-font-family:\'Times New Roman\';\n	mso-bidi-theme-font:minor-bidi;\n	mso-font-kerning:1.0pt;}\n.MsoChpDefault\n	{mso-style-type:export-only;\n	mso-default-props:yes;\n	font-family:Consolas;\n	mso-ascii-font-family:Consolas;\n	mso-hansi-font-family:Consolas;\n	mso-bidi-font-family:\'Times New Roman\';\n	mso-bidi-theme-font:minor-bidi;}\n /* Page Definitions */\n @page\n	{mso-page-border-surround-header:no;\n	mso-page-border-surround-footer:no;}\n@page WordSection1\n	{size:612.0pt 792.0pt;\n	margin:72.0pt 90.0pt 72.0pt 90.0pt;\n	mso-header-margin:36.0pt;\n	mso-footer-margin:36.0pt;\n	mso-paper-source:0;}\ndiv.WordSection1\n	{page:WordSection1;}\n-->\n\n<!--\n /* Font Definitions */\n @font-face\n	{font-family:宋体;\n	panose-1:2 1 6 0 3 1 1 1 1 1;\n	mso-font-alt:SimSun;\n	mso-font-charset:134;\n	mso-generic-font-family:auto;\n	mso-font-pitch:variable;\n	mso-font-signature:3 680460288 22 0 262145 0;}\n@font-face\n	{font-family:\'Cambria Math\';\n	panose-1:2 4 5 3 5 4 6 3 2 4;\n	mso-font-charset:1;\n	mso-generic-font-family:roman;\n	mso-font-format:other;\n	mso-font-pitch:variable;\n	mso-font-signature:0 0 0 0 0 0;}\n@font-face\n	{font-family:Consolas;\n	panose-1:2 11 6 9 2 2 4 3 2 4;\n	mso-font-charset:0;\n	mso-generic-font-family:modern;\n	mso-font-pitch:fixed;\n	mso-font-signature:-536869121 64767 1 0 415 0;}\n@font-face\n	{font-family:\'\\@宋体\';\n	panose-1:2 1 6 0 3 1 1 1 1 1;\n	mso-font-charset:134;\n	mso-generic-font-family:auto;\n	mso-font-pitch:variable;\n	mso-font-signature:3 680460288 22 0 262145 0;}\n /* Style Definitions */\n p.MsoNormal, li.MsoNormal, div.MsoNormal\n	{mso-style-unhide:no;\n	mso-style-qformat:yes;\n	mso-style-parent:\'\';\n	margin:0cm;\n	margin-bottom:.0001pt;\n	text-align:justify;\n	text-justify:inter-ideograph;\n	mso-pagination:none;\n	font-size:10.5pt;\n	mso-bidi-font-size:11.0pt;\n	font-family:Consolas;\n	mso-fareast-font-family:宋体;\n	mso-fareast-theme-font:minor-fareast;\n	mso-bidi-font-family:\'Times New Roman\';\n	mso-bidi-theme-font:minor-bidi;\n	mso-font-kerning:1.0pt;}\n.MsoChpDefault\n	{mso-style-type:export-only;\n	mso-default-props:yes;\n	font-family:Consolas;\n	mso-ascii-font-family:Consolas;\n	mso-hansi-font-family:Consolas;\n	mso-bidi-font-family:\'Times New Roman\';\n	mso-bidi-theme-font:minor-bidi;}\n /* Page Definitions */\n @page\n	{mso-page-border-surround-header:no;\n	mso-page-border-surround-footer:no;}\n@page WordSection1\n	{size:612.0pt 792.0pt;\n	margin:72.0pt 90.0pt 72.0pt 90.0pt;\n	mso-header-margin:36.0pt;\n	mso-footer-margin:36.0pt;\n	mso-paper-source:0;}\ndiv.WordSection1\n	{page:WordSection1;}\n-->\n', 115, 1, 6, 21, 0, b'1', b'1', NULL, '2018-09-12 18:08:08', 2, '2018-09-15 19:50:40', 2, NULL, 0);
INSERT INTO `blog_article` VALUES (12, '德新小学六一儿童节活动', NULL, '（邓传蓉 文/图）在六一国际儿童节来临之际，为了让孩子们过一个快乐、充实、有意义的节日，旌阳区德新小学开展了精彩纷呈的活动', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/deyang_dexin_xiaoxue/2018-6-1/4.png', '1', NULL, '邓传蓉', '2018-06-01 08:00:00', '<h2><b>（邓传蓉 文/图）</b>在六一国际儿童节来临之际，为了让孩子们过一个快乐、充实、有意义的节日，旌阳区德新小学开展了精彩纷呈的活动&nbsp;</h2><p style=\'text-align: center;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/deyang_dexin_xiaoxue/2018-6-1/1.png\' style=\'max-width:100%;\'></p><p style=\'text-align: center;\'>庄严的入队仪式<br></p><h2>&nbsp; &nbsp; 5月29日下午，在德新小学的校园里，庄严的出旗曲响起，雄壮的少年先锋队队歌响起，高昂的“为共产主义事业而奋斗，准备着----时刻准备着！”的呼号声响起。激动人心的声音中，又有  94名儿童加入了中国少年先锋队。庄严的入队仪式使全体少先队员受到了深深的教育，队员们在火红的队旗下受到了心灵的洗礼。&nbsp;</h2><p style=\'text-align: center;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/deyang_dexin_xiaoxue/2018-6-1/5.png\' style=\'max-width:100%;\'></p><p style=\'text-align: center;\'>&nbsp;引人注目的绘画艺术展<br></p><h2>&nbsp; &nbsp; 独具匠心的绘画展览活动。5月30日，准备了许久的六一绘画作品展出了。学校通道两边，脸谱、马勺、手工编织、儿童画、粘贴画……多种美术作品吸引了孩子们的目光。更让人惊叹的是六年级学生创作的“留给母校的纪念”作品：“致童年”、“我们是一家人”、“时光不老 我们不散”，笔画、线条和色彩中充满同学们对母校、对老师、同学和童年时光的眷念。</h2><p style=\'text-align: center;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/deyang_dexin_xiaoxue/2018-6-1/4.png\' style=\'max-width:100%;\'></p><p style=\'text-align: center;\'>旌阳区艺术节一等奖舞蹈：青衣梦<br></p><h2>&nbsp; &nbsp; 精彩纷呈的文艺展演。5月31日，德新小学庆六一的活动集中进行。钱继光校长致辞后，表彰优秀家长。然后进行“党耀童心 你我同行”的文艺汇演。校合唱团的《济公.又见稠梨花》和舞蹈队的《青衣梦》获得全校师生和众多家长的热烈掌声，这两个节目在旌阳区艺术节的比赛中都获得了一等奖。随后，各年级的节目、各兴趣组的节目纷纷登台亮相：舞蹈、诗歌朗诵、乐器表演、英语情景剧、相声、歌舞串烧。最后的教师创意走秀将活动推向了高潮，激情音乐中老师们闪亮登场，率性走秀，小演员们回归舞台，一起律动，台上台下挥手欢呼，师生同乐，场面壮观。</h2><p style=\'text-align: center;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/deyang_dexin_xiaoxue/2018-6-1/3.png\' style=\'max-width:100%;\'></p><p style=\'text-align: center;\'>图书漂流活动：淘书<br></p><h2>&nbsp; &nbsp; 书香弥漫的图书漂流活动。文艺展演后，进行的是同学们盼望已久的图书漂流活动。通过前期的宣传动员、收集登记，分类整理，德新小学第三届图书漂流活动如期举行。同学们拿着用自己的图书获取的图书漂流票，去对应的红、蓝、绿书屋里“淘”喜欢的书籍。淘到各自心仪的图书后，孩子们便回到教室里津津有味地读起来。图书漂流，让孩子们花一本书的钱，看更多的书，学会交流，懂得分享，与书为伴，愉悦身心。</h2><p style=\'text-align: center;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/deyang_dexin_xiaoxue/2018-6-1/2.png\' style=\'max-width:100%;\'></p><p style=\'text-align: center;\'>游园猜字谜：文字的魅力</p><h2>&nbsp; &nbsp; 有趣的游园活动。下午，是孩子们最喜欢的游戏时间。为了让孩子们在游园活动中玩得开心，学校老师挖空心思设置了尽可能多的游戏项目:夹弹珠、吹蜡烛、钓鱼、赶猪、摸鼻子、转圈圈、成语接龙、投球……同学们个个喜笑颜开地到自己喜欢的项目组去参加活动，如若游戏中胜利了得到奖票，则高兴得手舞足蹈地去领奖。\n来自多方的关爱。时值六一儿童节到来之际，除了学校开展多种活动，为孩子们喜庆节日，德新小学的同学们还感受到了来自社会和各级领导的关爱。5月30日上午，“春信”公益的阿姨们来到学校，表达对孩子们节日的祝福，并为一直资助的贫困优生送来了慰问金。5月31日上午，德新镇分管教育的副镇长张超到学校和孩子们一起观看演出，并发表了激情洋溢的讲话，为孩子们带来节日的祝福和慰问礼金！之后，旌阳区政府教育督导室主任宋德超一行也到德新小学看望慰问贫困留守儿童。\n此次德新小学“党耀童心 你我同行”六一系列庆祝活动取得圆满成功。我们希望孩子们快乐地度过自己的节日，我们期待孩子们在未来更健康地成长。</h2><p><br></p>', '（邓传蓉 文/图）在六一国际儿童节来临之际，为了让孩子们过一个快乐、充实、有意义的节日，旌阳区德新小学开展了精彩纷呈的活动&nbsp;庄严的入队仪式&nbsp; &nbsp; 5月29日下午，在德新小学的校园里，庄严的出旗曲响起，雄壮的少年先锋队队歌响起，高昂的“为共产主义事业而奋斗，准备着----时刻准备着！”的呼号声响起。激动人心的声音中，又有  94名儿童加入了中国少年先锋队。庄严的入队仪式使全体少先队员受到了深深的教育，队员们在火红的队旗下受到了心灵的洗礼。&nbsp;&nbsp;引人注目的绘画艺术展&nbsp; &nbsp; 独具匠心的绘画展览活动。5月30日，准备了许久的六一绘画作品展出了。学校通道两边，脸谱、马勺、手工编织、儿童画、粘贴画……多种美术作品吸引了孩子们的目光。更让人惊叹的是六年级学生创作的“留给母校的纪念”作品：“致童年”、“我们是一家人”、“时光不老 我们不散”，笔画、线条和色彩中充满同学们对母校、对老师、同学和童年时光的眷念。旌阳区艺术节一等奖舞蹈：青衣梦&nbsp; &nbsp; 精彩纷呈的文艺展演。5月31日，德新小学庆六一的活动集中进行。钱继光校长致辞后，表彰优秀家长。然后进行“党耀童心 你我同行”的文艺汇演。校合唱团的《济公.又见稠梨花》和舞蹈队的《青衣梦》获得全校师生和众多家长的热烈掌声，这两个节目在旌阳区艺术节的比赛中都获得了一等奖。随后，各年级的节目、各兴趣组的节目纷纷登台亮相：舞蹈、诗歌朗诵、乐器表演、英语情景剧、相声、歌舞串烧。最后的教师创意走秀将活动推向了高潮，激情音乐中老师们闪亮登场，率性走秀，小演员们回归舞台，一起律动，台上台下挥手欢呼，师生同乐，场面壮观。图书漂流活动：淘书&nbsp; &nbsp; 书香弥漫的图书漂流活动。文艺展演后，进行的是同学们盼望已久的图书漂流活动。通过前期的宣传动员、收集登记，分类整理，德新小学第三届图书漂流活动如期举行。同学们拿着用自己的图书获取的图书漂流票，去对应的红、蓝、绿书屋里“淘”喜欢的书籍。淘到各自心仪的图书后，孩子们便回到教室里津津有味地读起来。图书漂流，让孩子们花一本书的钱，看更多的书，学会交流，懂得分享，与书为伴，愉悦身心。游园猜字谜：文字的魅力&nbsp; &nbsp; 有趣的游园活动。下午，是孩子们最喜欢的游戏时间。为了让孩子们在游园活动中玩得开心，学校老师挖空心思设置了尽可能多的游戏项目:夹弹珠、吹蜡烛、钓鱼、赶猪、摸鼻子、转圈圈、成语接龙、投球……同学们个个喜笑颜开地到自己喜欢的项目组去参加活动，如若游戏中胜利了得到奖票，则高兴得手舞足蹈地去领奖。\n来自多方的关爱。时值六一儿童节到来之际，除了学校开展多种活动，为孩子们喜庆节日，德新小学的同学们还感受到了来自社会和各级领导的关爱。5月30日上午，“春信”公益的阿姨们来到学校，表达对孩子们节日的祝福，并为一直资助的贫困优生送来了慰问金。5月31日上午，德新镇分管教育的副镇长张超到学校和孩子们一起观看演出，并发表了激情洋溢的讲话，为孩子们带来节日的祝福和慰问礼金！之后，旌阳区政府教育督导室主任宋德超一行也到德新小学看望慰问贫困留守儿童。\n此次德新小学“党耀童心 你我同行”六一系列庆祝活动取得圆满成功。我们希望孩子们快乐地度过自己的节日，我们期待孩子们在未来更健康地成长。', 16, 0, 0, 22, 5, b'0', b'0', NULL, '2018-09-16 22:03:23', 2, '2018-09-16 22:06:57', 2, NULL, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '博客栏目,2,switch-baseChannel-YES-true-is_base_channel,switch-ca' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of blog_channel
-- ----------------------------
INSERT INTO `blog_channel` VALUES (20, '校园风采', 1, '/xyfc', '', b'0', b'0', b'0', b'0', NULL, NULL, NULL, NULL, '20,', 1, 10, '2018-09-11 17:11:17', 1, '2018-09-11 17:11:17', 1, NULL, 0);
INSERT INTO `blog_channel` VALUES (21, '学校简介', 1, '/xyfc/xxjj', NULL, b'1', b'0', b'0', b'0', NULL, NULL, NULL, 20, '20,21,', 2, 0, '2018-09-11 17:15:41', 1, '2018-09-11 17:15:42', 1, NULL, 0);
INSERT INTO `blog_channel` VALUES (22, '校园活动', 1, '/xyfc/xyhd', '', b'0', b'0', b'0', b'0', NULL, NULL, NULL, 20, '20,22,', 2, 10, '2018-09-12 17:43:05', 1, '2018-09-12 17:43:05', 1, NULL, 0);

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
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '博客评论,1,switch-adminReply-YES-true-is_admin_reply' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of blog_comment
-- ----------------------------
INSERT INTO `blog_comment` VALUES (2, '点赞', NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, '2018-09-13 00:37:12', 'user_id', NULL, NULL, NULL, 0);
INSERT INTO `blog_comment` VALUES (3, '小孩子们真棒', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2018-09-15 19:15:11', 'user_id', NULL, NULL, NULL, 0);
INSERT INTO `blog_comment` VALUES (4, '合唱团的孩子们是最棒的', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2018-09-16 16:04:24', 'user_id', NULL, NULL, NULL, 0);

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
-- Table structure for client_campus_top
-- ----------------------------
DROP TABLE IF EXISTS `client_campus_top`;
CREATE TABLE `client_campus_top`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `school_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_ime` datetime(0) NULL DEFAULT NULL,
  `state` int(5) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of client_campus_top
-- ----------------------------
INSERT INTO `client_campus_top` VALUES ('1', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/dexin.jpg', '100001', '2018-09-12 22:42:24', 1);
INSERT INTO `client_campus_top` VALUES ('2', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/deyang_dexin_xiaoxue/top_img/1.jpg', '100001', '2018-09-15 18:34:35', 1);
INSERT INTO `client_campus_top` VALUES ('3', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/deyang_dexin_xiaoxue/top_img/11.jpg', '100001', '2018-09-15 18:35:13', 1);
INSERT INTO `client_campus_top` VALUES ('31', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/deyang_dexin_xiaoxue/top_img/3.jpg', '100001', '2018-09-15 18:37:42', 1);
INSERT INTO `client_campus_top` VALUES ('32', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/deyang_dexin_xiaoxue/top_img/30.jpg', '100001', '2018-09-15 18:37:56', 1);
INSERT INTO `client_campus_top` VALUES ('33', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/deyang_dexin_xiaoxue/top_img/4.jpg', '100001', '2018-09-15 18:38:11', 1);
INSERT INTO `client_campus_top` VALUES ('34', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/deyang_dexin_xiaoxue/top_img/7.jpg', '100001', '2018-09-15 18:38:25', 1);
INSERT INTO `client_campus_top` VALUES ('35', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/deyang_dexin_xiaoxue/top_img/8.jpg', '100001', '2018-09-15 18:38:39', 1);
INSERT INTO `client_campus_top` VALUES ('36', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/deyang_dexin_xiaoxue/top_img/27.jpg', '100001', '2018-09-15 18:37:31', 1);
INSERT INTO `client_campus_top` VALUES ('4', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/deyang_dexin_xiaoxue/top_img/13.jpg', '100001', '2018-09-15 18:35:30', 1);
INSERT INTO `client_campus_top` VALUES ('5', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/deyang_dexin_xiaoxue/top_img/14.jpg', '100001', '2018-09-15 18:35:46', 1);
INSERT INTO `client_campus_top` VALUES ('6', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/deyang_dexin_xiaoxue/top_img/15.jpg', '100001', '2018-09-15 18:35:57', 1);
INSERT INTO `client_campus_top` VALUES ('7', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/deyang_dexin_xiaoxue/top_img/18.jpg', '100001', '2018-09-15 18:36:09', 1);
INSERT INTO `client_campus_top` VALUES ('8', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/deyang_dexin_xiaoxue/top_img/19.jpg', '100001', '2018-09-15 18:36:22', 1);
INSERT INTO `client_campus_top` VALUES ('9', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/deyang_dexin_xiaoxue/top_img/2.jpg', '100001', '2018-09-15 18:37:20', 1);

-- ----------------------------
-- Table structure for client_class_category
-- ----------------------------
DROP TABLE IF EXISTS `client_class_category`;
CREATE TABLE `client_class_category`  (
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`value`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of client_class_category
-- ----------------------------
INSERT INTO `client_class_category` VALUES ('11', '1年级1班');
INSERT INTO `client_class_category` VALUES ('12', '1年级2班');
INSERT INTO `client_class_category` VALUES ('13', '1年级3班');
INSERT INTO `client_class_category` VALUES ('14', '1年级4班');
INSERT INTO `client_class_category` VALUES ('21', '2年级1班');
INSERT INTO `client_class_category` VALUES ('22', '2年级2班');
INSERT INTO `client_class_category` VALUES ('23', '2年级3班');
INSERT INTO `client_class_category` VALUES ('31', '3年级1班');
INSERT INTO `client_class_category` VALUES ('32', '3年级2班');
INSERT INTO `client_class_category` VALUES ('33', '3年级3班');
INSERT INTO `client_class_category` VALUES ('41', '4年级1班');
INSERT INTO `client_class_category` VALUES ('42', '4年级2班');
INSERT INTO `client_class_category` VALUES ('43', '4年级3班');
INSERT INTO `client_class_category` VALUES ('51', '5年级1班');
INSERT INTO `client_class_category` VALUES ('52', '5年级2班');
INSERT INTO `client_class_category` VALUES ('53', '5年级3班');
INSERT INTO `client_class_category` VALUES ('61', '6年级1班');
INSERT INTO `client_class_category` VALUES ('62', '6年级2班');
INSERT INTO `client_class_category` VALUES ('63', '6年级3班');

-- ----------------------------
-- Table structure for client_floating_button
-- ----------------------------
DROP TABLE IF EXISTS `client_floating_button`;
CREATE TABLE `client_floating_button`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `icon` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图标',
  `button_order` int(5) NULL DEFAULT NULL COMMENT '顺序',
  `level` int(5) NULL DEFAULT NULL COMMENT '级别',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of client_floating_button
-- ----------------------------
INSERT INTO `client_floating_button` VALUES (1, '行政简讯', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADICAYAAACtWK6eAAAPUElEQVR4Xu2dTa4VRxKFI6SetNSSzQoMk+6hQeq5YQU2KzBeAXgFhhUYVgCswLACw7wlm2H3xLACg9RST1qK1kF56eur9+7LyKisjKw6Jb3Ry8jKOhHfzci/KhVeVIAKXKqAUhsqQAUuV4CAMDqowBkFCAjDgwoQEMYAFWhTgD1Im2602okCBGQnjuZjtilAQNp0o9VOFCAgO3E0H7NNAQLSphutdqIAAdmJo/mYbQoQkDbdaLUTBQjIYEeb2VelCddFBH+43pY/UdXXg5u469sTkJXdb2aA4FsRuV3+alrwSkTw91xVAQ+vlRQgICsJbWYA4r6IfBO85QsReaKqAIZXZwUISGeBS4/x1NFb1LYIgHzHHqVWrrZyBKRNtyorM/tBRB5WFW4v9FBVH7Wb0/KcAgSkQ3yY2ecigl4jmk7Vtg5pF3qT97UGLFenAAGp06m6VIHjZxG5WW20TMFfReQOIVlGzEMtBGRBPQfCcXgKQrKgP1EVAVlI0ARwfIJEVW8t9Fi7r4aALBQCZva4TOMuVGOoGkwDPwjVQOOPChCQBQKhrHFg3JHpwniEayVBjxCQoIAwN7PfjraJtNSI7SSnwYyFxcM2lJY636rqjRZD2vxfAQISjAYzu1emdL01fShrJM8um3kq4xrUj7WUz7w3KFO/zxrsaFIUICDBUGjsPZ6LyIPaKdkCCsY42MPludiLeNS6oCwBCQhoZhgI/+is4ntVRbC7LzNDT4LVec/VfD/PTbZaloA4PVv2Vh02HR62p9fWgt24SJmaLzNDyuTuSUTksMmRu4Ed6hOQSrHMDEGJHqN1hfyNqrba/qGVZoYFwS8rm35aDLaPVRVpHq8rFCAgZwQquT96C/zqe3uL05oXm3ZdaFoZPQlSPfRq3MN1SRwQkAuEOQIDPQY2Hkavd6oaBey0F0GAfxFtmIgADoCCxUWCciIoATkRxMzQY2AwvAQYh9oXHyg3ThCc4wlwYOv8kwWg20wVBKS40sywNR0zUov+0pfqry3961x6ud87RCJ6JgCNQf3ur90D0vHE3yG4Xqpql3MhZoYg/rpTFPPE4t73YnVKp07j9W6vX+PAKn4tU7tPu3bZg6zQayAAsZXkRXTd46pILusi6KFatqJcVf3h/7vtTXYHSJki/WnhQfghkD5CUcBYNYcvYyiA0gsW9CboDXe1Q3hXgHR8iQIW3dBbrArFZT//R7B4V9xrepRdvSRiF4B0eonCuzIdDDBSrh+U50aPgvWc1pX3i6DZzUsiNg9Ih6OwOLuBX9GpUo2SWmJ9J3LG5BiWXZx/3zQgZoa9Tzjpt8Si35RgnP78LwwK1kwwLgEsm7w2C8iCcCCVujdbj3FVtBZQsDM4ul0F6SX2mW0Skk0CshAcH0/8tZ7duCpAs/y/bFlpPbF4eIzNQrI5QBaCA+kUeo1dnJ0o60LoTSLjk01CsilAFoBjF73GmelhzHZFepPNQbIZQMqv4C+BAfmb0mtsMpeuTenKjwymcVvHJoDk1lZ6300AssBU7ssCR8r1jNrgXqpc0RMpV+tGyM1MAW8FEGwdad0x+0hVe3+iYKnYXbWexpdEHNqIBdS7qza4w82mByToRHwygO+NOhNYwR3D0//4TA1I2XOE3qPlIhyVqgUh6bbdv7L5oWLTAhIclBMOZ9gEIJl60D4zINhCgvfXei/C4VWslA9A8kpV7zTedqjZlIAEXlhAOILhFoBk8RdXBB+lynw6QAKp1fQDxiqPrlCocWJkylRrRkBaUqtuL05YIR5T3qLxhRHTpVpTAdLYvWOF/HbWQ00po7+iUWUxEWdivAexpkpzpwGkOARbSTzvrcLeKsCx6+0jFfHeVKRsSwEknhdGYAMotqJMsWthJkD46v+mMO5r1DhhMs14cApAGgfmHHf0ZeNT7WaGXsSzVX6aAfssgHi/iYHU6vos3fhKcdztNiX9RerkSbWm+BJvekCK+PhIpudc+VQDwW6Ru2LFDRMo6EVuZP8RmwEQ79jjtaq2rLCvGE7bvFXDh33Sj0VSA9LYeyz2oZpthnG/p2r4sE/6XiQ7IN6PZHJg3i/+q2puWEBMvQUlOyAYe3jWPZDT7uJFC1XROqBQmXGE32qv1J+qTgtIWYTCwmDtFf6CbO2NWO68Ag1f4sXCYcrF3MyAeKd2OfZIQm7DWCTtj1tmQPB5sdqpXc5cJYHj0Azn4uF7Vb2W7BE+NiclIA1Haac+1pkxMKJtalgXSenDrIB40qsPqlrb00T9TnuHAmaGadza1fWUaVZWQDyzV1NsWXDE1WaKOgfrKWez0gHSMHuVdgZkM5He+CBb8GVGQDxbS96pqmedpNHVNGtVwMywLlX7GtN0i4YZAfFsnWZ61Rq5K9k506x0s5EZATGH71LOfDjav/mi3hlJVU0Vk6ka481Zs4m5+WhveMCy4RRrWrVXqjFlNkDuicjTSiXTdceV7d5dMeeiYaqzPNkAeSwi9ysjiOOPSqFGFzOzaf2aDRDPAD3VL83oIMx8f+eqeqrMIBsgnv1XqXLVzAE6um3OsWWqfVnZAKmeweIAfXTY++5vZlP6Ng0gzl+ZN6p60+cilh6pgHPBMM3Bt0yA4EULeO9uzZUqT61p8N7LOGey0pztyQSIZ4o35c7PvUNw7vmdK+ppJmAyAeLZg5X+dTGE5Y8KOD+ZkMa/BISRvIoCBCQo86wCBh97N+az+nfWHiRNjrqbCA8+qHOxkCnWqd7OX5g0sxzBuNmNufNNJwSEgOyGjY8P6gQkzTT+rCkWe5DJ+CIgQYcxxQoKmNycgAQdRECCAiY3JyBBBxGQoIDJzQlI0EEEJChgcnMCEnQQAQkKmNycgAQdRECCAiY3JyBBBxGQoIDJzQlI0EEEJChgcnMCEnQQAQkKmNycgAQdRECCAiY3JyBBBxGQoIDJzQlI0EEEJChgcnMCEnQQAQkKmNycgAQdRECCAiY3JyBBBxGQoIDJzQlI0EEEJChgcnMCEnQQAQkKmNycgAQdRECCAiY3JyBBBxGQoIDJzQlI0EEEJChgcnMCEnQQAQkKmNycgAQdRECCAiY3JyBBBxGQoIDJzQlI0EEEJChgcnMCEnQQAQkKmNycgAQdRECCAiY3JyBBBxGQoIDJzQlI0EEEJChgcnMCEnQQAQkKmNycgAQdRECCAiY3JyBBBxGQoIDJzQlI0EEEJChgcnMCEnQQAQkKmNycgAQdRECCAiY3JyBBBxGQoIDJzQlI0EEEJChgcnMCEnQQAQkKmNycgAQdRECCAiY3JyBBBxGQoIDJzQlI0EEEJChgcnMCEnQQAQkKmNycgAQdZGaPReR+ZTV3VPVVZVkWS6AAAQk4wcyui8gvIvJ5ZTUEpFKoLMWcgLwXkVuq+nZ0+3V0A3B/M/tZRG472kJAHGJlKOoEBE1+pap3Rrd9OCBm9kBEfnQKQUCcgo0u3gAImvy9qiL1HnYNBaQhtYJQH0TkZobud5jXJrxx8fWvIvKZo/nDU63RgHhTqxS/Kg4Hs+iRAo3ZwtBUaxggjWK9VlXPWIUBmkwBM8Ps41fOZg1LtYYAwtTKGR4bKj5bqjUKEKZWGwp676M0Zg9DUq3VAWkUh6mVNwqTl58l1VoVEKZWyaN2xebNkmqtDQhTqxWDMPutGrOJVVOt1QBpFIOpVfYoD7Yve6q1CiBMrYJRtGHz7KnWWoAwtdpwkEcfrTG7WCXV6g5I48MztYpG3WT2WVOtroAwtZosSgc2N2uq1RuQn0TkG6fuw7YVONvJ4gsr0JhtvFDVuws35VN13QApvwi/ORvO1Mop2NaKN6ZaN3rt7u4JiOcILfzMbexbi/aG52lMtZ6oKs4VLX71BARHaG86WszUyiHWlos2pFrdMo+egJjDid0e0NEGFk2kgDfVUtUusdylUuhsZh5A7onI8AP6IvI3EflzRZy8qSiTsciXFY36j4j8s6Jc7yJ4kcez2ptsHZBaHViOClyowIyA4PxxzS8WXU4Fogq8UVXPeLf6fj1TLHSP31a3hAWpQLsCz1UVafriV09AsECIhUJeVKC3AndV9UWPm3QDpAzUMfD+okfDWScVKAq8U1UM6LtcvQFhL9LFbaz0SIFuvQfu0RWQ0otwLMJ47qVAt7HHocHdASEkvWJj9/V2h2OVHuTgRuf3P3bvfQpwVoFHqvpwDY1W6UGOIMFcNR7s6zUejvfYnAIvET+qijW2Va5VATkCBd8BwStED4s7WV4n+tey1eQvIvInhwf+ISL/dpRfoyie4e+OG/23PAO2mvzLYdez6OEjSQACR2zxMutVryGArPqEDTdr2E26yvloz6M0fHOFu6kvEJiAXCCKmaGH+90TkBm+ZXHUQ7d8c+XaiF9op8arFycgl0huZi3T0/hs2Gr58UVNNzOkrTiL47lWmRHyNChLWQJyOSBYnfUeGUaOjK9fDYGkwIFXLNV+6/Hw9N2OrGYJ9NZ2EJAzyjX2IkMgCcDR7bhqa1BmsiMg5wHBLzH2k3k+G4YaAQm2QKzyqery/T9sDPX2HHgPwHWOPS4PAgJyxc9Vw4zWcY0PVPVJz19EM8O35Vs/dMmZqyucQ0Aqotd7PvqkSoxHEIiL9ial18DXgVsPCr1UVe87yyrU2lYRAlLhzzLt25JqHdeOWTHMFoVAKWDgIFrkgBBTqwq/owgBqRSqcfr0otoBGlIivMmlarar3BsfvsT6xhJnH4ZPR1fKPrwYAXG4wMzwq/3UYVJTFD0KoDl9qwtAwN/S23C+U9Xqt4XUPMCWyxAQp3c7QeJsRXNxwuGUjoA4BUPxSSEhHA2+JiANok0ICeFo9DMBaRSuQIIpVowhvAuJgbu6TDFbdbt2MsBV804KE5Cgo8sUMAa92Q6B4XDRPa6SxxxMQGL6fbI2Myy6AZTRvQl6DYDR5T1RC8k1TTUEZEFXld4EaxU/LFitp6pHWGNhr+GR7HxZArKclse9CdYvsGYCWHr3KOgxsPD4rNdXljpINE2VBKSjq0qPgtQLsGAlfMnrdUnp8I2+1c9qL/kgmesiICt55wiWw8sqvG++xzdJPr68QEQIxUp+IyArCX3RbcoeK5zhwHTx6VkO9AoA4j2nacc5iYCM0553nkABAjKBk9jEcQoQkHHa884TKEBAJnASmzhOAQIyTnveeQIFCMgETmITxylAQMZpzztPoAABmcBJbOI4BQjIOO155wkUICATOIlNHKcAARmnPe88gQIEZAInsYnjFPgftsyTI0mkgoEAAAAASUVORK5CYII=', 0, 1);
INSERT INTO `client_floating_button` VALUES (2, '公告新闻', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIAAAACACAYAAADDPmHLAAAHgElEQVR4Xu2d/ZEUNxDF1REYR+C7CLAjMERgE4EhAkMEcBGYiwAcAUcEhgjAEfgcgSGCdj2sxVtbt6PWaEZ6knr+uSqYGUn9ftvSdOtDgl9TW0Cmbr03PjgAk0PgADgAk1tg8ua7B3AAJrfA5M2f2gOo6j0R+TQzA1MBoKoXIYTnIQT8fRCFBwAfQwg3InI9GwzTAKCqv4YQXoQQ7i2IDBCeiAj+TnFNAYCqvgohPM5Q9JGI3GTc3+2twwOgqj+HEN5kKoRu4XKG8cHQAGCQF0L4K+H2z7GBMcGjTHC6u310AOD24f7XXt+O7gVGB+BlCAGDv7XXQxF5t/bhHp4bHQCI92OBEFcigi+HYa/RAcDn3P0C9YYfBwwLgKqW9v8Hbl6LyJMCiKgfHRKAGPRB/7/VNSwEwwGwIuhjhQSBIUQJh8odDAXAjuIfIMGYAl8Gw0AwDAAVxB8Sgu4BiNE+hHoP2b1zLv294ZPwM7KCIQSEj79Z6BvgCZAvuLX2H6z3dQ1AFP+PEML3CQOj736tqoAE3/WnsYGD8C8gqqrifYghLEGAbgDdQdeZw24ByBX/GJD47Fdo7or2zQJBlwBEcRDjX/rl41f9uCStOwME3QEQRYHbX5rYAfEfbOGe4ywijAuWIoroDp6hm2Ht68/VqysAaot/MFrsMjAmSIWVv4w1eoKgGwBaiT86BF0AYIzr/xnd/m5BmgxPgK+Jqx48AT0ALOKffEXAzf+SELiL/AE1AIziH3UJQ0BAC4Cq/hZCeJr4lb2Nn3q7uf2l8lW1ewgoATDG9X8XkZyp3rt0yaqKyCIWmyxdtEkkOgB6Ev+oO7BMPqGEgAaAOMKG20/9qil++ac/d+N4hQ4CCgAy4vqItm0502fTbiEDAprlZ80ByBC/iyhbb/mDpgCMJv7RmKCbdHIzADJCu097i68DhAxPgIklzRafNAEgQ/xNMnqbdvQZL4vtRKyANolUHYBZxO8liVQVgLhUGxM5quTyM36su96akUSqPtCtBoDxEwkhXYR/u59seQdRgB7dwRL8eOyliDzblcijl1cBwCh+rTb3UE61TGIxALFPx+zZc9OyQXwqqdODKLXriGlo52Yc498/iQimuhddqwA4Ctti/nzKpRVV0B9etAC6THxCIkK6qtvMBiC6c8TsXXguOleNHbIAMGbquMwyV23gDRBYMs+PMAOgqujH8cv3i9sCWQNIEwBxoPeBu91euyMLmOMJVgCwECO1+BLlF49KXcakBZBoWlqziBfcishl8k0hpE8MiStjsNfe0oUp0BiEmPseS+X8nrstEAfimBexBIJpt9OkBzD0/WZ344JuZwFDttE0c8oCwNKkx/ciYukatmu5v+mrBRITUk3aWABY2muPeorW6KwkBuemcUApAMPvpMkOkarquTqKSFLf5A2quuQBHIDGhDgAjQVoXbwD0FqBxuU7AI0FaF28A9BagcblOwCNBWhdvAPQWoHG5dMDEGcPYTcNn0ByNyzInyBsuyqPQg2AcQ1A498QRfGrt5ljBwATG3+iMHEflfghd29DdgD+cdefRV52boUdgNIze7KsN8DNphz+cTvZAbDsnzOAbps0AdvbXuQOBqkBgFlUtfTsvk2sS/6Sv+NuZ9nLxOkBIDd899VzALqXsKwBDkCZ/bp/2gHoXsKyBjgAZfbr/mkHoHsJyxrgAJTZr/unHYDuJSxrgANQZr/un6YHIJ7kjZ1EfAXR3bgh+vdu7REz1AD45lBZDgYQPMx64r9QO+/CkMSikty2znB/9kIbdgAw0yW1ln0GYa1tvBIRZFDNFzsAS8vKzI2c6MbhPAAGfthdxK+0BUzLuU9fQ+0BUNk4MRTHwKSOeE+baMw7vuz1t/YkFHoAxtSMp1UOAI8WTWriADQxO0+hDgCPFk1q4gA0MTtPoQ4AjxZNauIANDE7T6EOAI8WTWpCD4DxGPgmxksUivN9sFZv1bLtWg2iBsB4tHotW60p51pEqI+7YQcAW8z3HAI27ba5hqytnmEHoPd08GcRod7ZhB2A3jeIeCsimM5Ge7EDYDlFm9W4WK5Nf3YxNQAxHQwXinQwtSs9oRBdF87eof4CiPblnRPI+tMeqV70HmAkYzO2xQFgVKVinRyAisZmLMoBYFSlYp0cgIrGZizKAWBUpVKdUmc61jgzKHslSyXbTFGMqiJK+eZMY01hbMuhUUubPdInS0YmQVWXjvQ1LTSxAJA6NTx7f9uRRanVNsPKa1MewwIA4vmpk8PhJZA7pw+d1hJor3Jiv/88hteXijH9MJMAxHjzbQjhO0Ojsrc6NbzTb/nfAvgxWnMqlyIC3RYvKwBI5rxKvcz/n8YCpoOjUVsTANEL9J7bp1Fn54pk7TqeAwBcD1z8/Z0b4K9fb4HsOQxmAKIXcAjWi7P3k9niZ3UBx7VXVXwaYuTv27/sLavt/dfQY81XWJYHOK1LjEQhGnVhq6fftaEF8MmNcdnNGuEP9SgCYMPG+KsaWcABaGR4lmIdABYlGtXDAWhkeJZiHQAWJRrVwwFoZHiWYh0AFiUa1cMBaGR4lmL/Ba22Rr0FkvpiAAAAAElFTkSuQmCC', 1, 1);
INSERT INTO `client_floating_button` VALUES (3, '班级作业', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADICAYAAACtWK6eAAANkklEQVR4Xu2dW8wdVR3F14o8IBBLAwoWEVEfMATbJoRolBS1D0KDECtJTYXW+KKJpi0abxFKAybeQLBRn+RitaYGBLEgxlSKqQ8GgoiElEQMcitE0rRRQB7gb/7JtH58PTOzzzl77+/sPWsSUpJvz/+yZv3O3nvOOXMIHVJACrQqQGkjBaRAuwICRO6QAh0KCBDZQwoIEHlACkymgGaQyXTTWQNRQIAM5EKrzckUGDwgZnYygHMA+L9vAXDUZFIWfdbRAM4AcFKjw6w0818AzwPYC+C5gKJeasY9RfLegPG9QwYLiJmtBPB5ABf1qqQBJSrwLwC3ANhK8slJGxgcIGZ2JoAfAlgxqWg6rygFXgFwA4BrSP573MoHBYiZrQawA8AbxhVK44tX4O8APkjSl2zBx2AAERzBnqh5oEPyfpIvhDY5CEDMbCmABwa6AQ/1wlDG/RnAB0i+GtJwUkDMzNf6HwOwGMCDAD5L8tGQwmKNMbNjADwM4F2xYipO8Qr4fuSKkC6SAWJmvwfgd4rmHr5JWkbyHyHFxRhjZj8A8IWAWC8C+BsA39TVehwPwGfTWo4DAP46pxl/IX5vYHNLSfoLZ+eRBBAzu6y5xTYq+W9JXtBXWIy/m9kSAM/0xNoCYBvJx2PknOUYZnYxgNs7anSzrSf50EL3YWYOs9d7U0ctB0g6FK87zOx9AK4e8QI9d9ytJC/p6zMVIN7U+rbkJJPkHSHU9wFsbKnDZ7PzSf6pT6Ra/m5mVwHY3NHPFpI+ZmYOM9vddUu+y0tmdj2ADR3NvIekvwnZeiQxqpnd7ebryHsKyWdTXwUz8zeLTmzJcxHJO1PXMEvxhwaIa9/jxStJ+kyTHZC7AHQto5aQ3JfSPGa2DMBfWnLcRvITKfPPYuyBAnIKgKdbrscekucuBCALPoOY2eUArm1p/iySj8yiiVPWNERAmlnkx34HtUXbY0i+3KZ7tUssM7sOwKYRjT9N8tSURpzV2AMGxFczvqoZdZxB8rEhAvJTAJeOaPxOkoP8gOKAAfFParct6VeS3DVEQHwDfuGIxn9O8lOz+iqfsq6hAtIss6xF28tIbhsiIDsBrBrR+HaSa1MacVZjDxwQ32f4917mH58heaMA+b8CAqSd4KreB5nbppkJkHmCaAaZB4JmEM0ghy1hZgJEgMz1g2YQzSDdux/NIJpBNIN0MCJABIgAESAjFdAm/cj1tvYg2oNoD9L2gqlN+pHK5FpiNR8UfYKkf6FpqmOaj7vrNm/3ckIzSOYZxMzWNd+/8U9SOxx3APD3Vp6YlBIBMqlyPedpBskzgzTf/PMvJfkX5N7Rcln8S08Oiv871iFAxpIrfLAASQtIs4w6BEbohfGZxL+x+OvQ5ZcACZV2zHECJA0gZuafhPavMZ835iWZO9yXXzf7Ew/7ll8CZAqVu04VIPEAaZZRh/YXbcuoSa+k71MclJHLLwEyqazag4yt3Lh3sczMYfCHPPjTRfwpIykPf5LK9ST9gdOHDwGSSHLNICNnkL7H/vir+af92WXN00B8fO7Dl1/+NBIHxaH0nzFohTP0CTl6o3DeZRQgIwHxfUOU383ITU1LvvtIBu2FBIgA6fVss5fwO0mLegdPPuC+ZgbwWchv/Z42eajeM33v0vbcs9edLEAESK+bfICZ+d0j33DHPA42bwpeNf+ulJk5JP5fit9jWR76FEgBIkCCDN9svH1DHGMW+Wdzu9Y3150fKzEzXwo5KLHgvIVk69M754shQARIECDNLOLG6nrmbV8sX0bdTNJno7GOBlDP70ujSSH1Zwif1wfl3MIEiAAZ16huUr9bNI5J/c6SzxZRHm7dLL8clHGeOD82HM2Lgr5ROO8VQx9W7EGm+biIQ9K1PwheRo1F6JzBzfLLQel6XpnvcxzOiR6urRlEM8ik/vSNu99x8vc8fJ9w6DdE/JXaDTn2MmrSQprll4NyaG/hM5XfdfN32e8YZ0mlPUj/q6NmkEmdWuF5mkE0g1Ro63gtCRABEs9NFUYSIAKkQlvHa0mACJB4bqowkgARIBXaOl5LAkSAxHNThZEEiACp0NbxWhIgAiSemyqMJEAESIW2jteSABEg8dxUYSQBIkAqtHW8lgSIAInnpgojCRABUqGt47UkQARIPDdVGEmACJAKbR2vJQEiQOK5qcJIAkSAVGjreC0JEAESz00VRhIgAqRCW8drSYAIkHhuqjCSABEgFdo6XksCRIDEc1OFkQSIAKnQ1vFaEiACJJ6bKowkQARIhbaO15IAESDx3FRhJAEiQCq0dbyWBIgAieemCiMJEAFSoa3jtSRABEg8N1UYSYAIkAptHa8lASJA4rmpwkgCRIBUaOt4LQkQARLPTRVGEiACpEJbx2tJgAiQeG6qMJIAESAV2jpeSwJEgMRzU4WRBIgAqdDW8VoSIAIknpsqjCRABEiFto7XkgARIPHcVGEkASJAKrR1vJYEyAIAYmabAawDcHq8S6lIAA4CuAfABpLPx1BEgGQGxMyuA7ApxsVTjFYF9gI4k+Rr02okQDICYmaLAeyf9qLp/CAF1pDcETSyY5AAyQvICgC7p71oOj9IgRtIbgwaKUDCZTKznQBWjThjO8m14ZGOHGlmZwO4f5oYOjdYgW+R/Frw6JaBmkEyziCeyswOAFg07YXT+b0KrCS5q3dUzwABkh+Q9QBumvbC6fxOBX5FcnUMjQRIZkCaWeRDAL4OYGWMi6gYhxV4HIDvPbbG0kSALAAgsS6e4qRXQIAIkPQuKziDABEgBds3fekCRICkd1nBGQSIACnYvulLFyACJL3LCs4gQARIwfZNX7oAESDpXVZwBgEiQAq2b/rSBYgASe+ygjMIEAFSsH3Tly5ABEh6lxWcQYAIkILtm750ASJA0rus4AwCRIAUbN/0pQsQAZLeZQVnECACpGD7pi9dgAiQ9C4rOIMAESAF2zd96QJEgKR3WcEZBIgAKdi+6UsXIAIkvcsKziBABEjB9k1fugARIOldVnAGASJACrZv+tIFiABJ77KCMwgQAVKwfdOXLkAESHqXFZxBgAiQgu2bvnQBIkDSu6zgDAJEgBRs3/SlCxABkt5lBWcQIAKkYPumL12ACJD0Lis4gwARIAXbN33pAkSApHdZwRkEiAAp2L7pSxcgAiS9ywrOIEAESMH2TV+6ABEg6V1WcAYBIkAKtm/60gXIAgBiZpsBrANwevpLPKgMBwHcA2ADyedjdC5AMgNiZtcB2BTj4ilGqwJ7AZxJ8rVpNRIgGQExs8UA9k970XR+kAJrSO4IGtkxSIDkBWQFgN3TXjSdH6TADSQ3Bo0UIOEymdlOAKtGnLGd5NrwSEeONLNzAfxxmhg6N1gBARIs1RgDEwPyJgC+kdSRXoG1JLdPm0ZLrIxLLE9lZt8D8MVpL5zO71TgsWaT/uq0OgmQzIA0kGwBcKlu805r3yPO99n5dwA2ktwXI7oAWQBAYlw4xcijgAARIHmcVmgWASJACrVunrIFiADJ47RCswgQAVKodfOULUAESB6nFZpFgAiQQq2bp2wBIkDyOK3QLAJEgBRq3TxlCxABksdphWYRIAKkUOvmKVuACJA8Tis0iwARIIVaN0/ZAkSA5HFaoVkEiAAp1Lp5yhYgAiSP0wrNIkAESKHWzVO2ABEgeZxWaBYBIkAKtW6esgWIAMnjtEKzCBABUqh185QtQARIHqcVmkWACJBCrZunbAEiQPI4rdAsAkSAFGrdPGULEAGSx2mFZhEgAqRQ6+Ype9YAuQvABR2tL4n1zNW2HGZ2G4CPj/j7rSQvyXNZlGVWFDAza6ml8+nxTNGAmc0CID8C8LkR/e0h6b/voWMgCpjZWwE829LuSpK72qRIBcjdAM7v0P8Ukm0FR7lsZuZPXr9yRLBXABxLcupH6kcpVEGSK2BmvmL4ZUuis0g+khuQWZhB/FekftbS+IUk/ReodAxAATP7BYA1La0eR/LFIQJyEoDnWhr/A8mPDMAbg2/RzE4F8OSkPki1xFrwGcQFMbMHASxvEeerJL89eAdVLICZHQdgD4ClLW1+meR3uySoHZDLAVzbIYAgqRQQMzsRgL9Qn9PRYu/d1FSALPgmvZlBFgHwn/B6Y4dI9wL4ZtedjEo9VGVbZnY8gPUANgPw/287gn7tOBUgM7HEaiDxGcRnEh1SYK4Cy0k+1CdJKkBuB3BxR/ITSO7vKy7G383sWAAPA3hnjHiKUYUC3yH5lZBOUgFyNYBvtBTwDMm3hRQXa4yZLQNwP4CjYsVUnGIV8Fnj7ND3wVIB8nYAe1vW/l8i2bVxTqK8mX0UgM9sRydJoKAlKPCAv4FN8oXQYpMA0qz9PwzgRgCnzSnmGpJXhBYXe5yZ+R0Nf4PwzbFjK97MK/Abf7OQ5EvjVJoMkENFmNm7AfjdpEdJvjxOcSnGmtkJALYC+GSK+Io5cwr8B8BGkj+ZpLLkgExSVI5zzGwFAP+MzmoAJ+fIqRxZFfA3CH3W2DbNJ8cHC8jcS2VmPsM5JL700kY+q4+jJvPl0z6ST8WKKkBiKak4VSogQKq8rGoqlgICJJaSilOlAgKkysuqpmIpIEBiKak4VSogQKq8rGoqlgICJJaSilOlAgKkysuqpmIpIEBiKak4VSrwP4pCJn0eoPleAAAAAElFTkSuQmCC', 2, 2);
INSERT INTO `client_floating_button` VALUES (4, '班级消息', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADICAYAAACtWK6eAAAMPElEQVR4Xu2dW+gtZRnGnyfyKlArIzItSsQMIiqFKCu9KGvr1k1EWwSzA5Sd7HhhkBAVdmFQ7iwjoshUUANF26hZGZRBFISCh3RT0OFCUiqsdnbRG5/+le3W/zwzs9b65pt3noF9td+Z7/1+z/z+c1izZhFeTMAEtiVAszEBE9iegAXx3mECHQQsiHcPE7Ag3gdMYBwBH0HGcfNaCyFgQRYStKc5joAFGcfNay2EgAVZSNCe5jgCFmQcN6+1EAIWZCFBe5rjCFiQcdy81kIIVBUkIl4IoPy7j+TfF8LY05wxgSqCRMRhAK4GcOoBrC4GcAHJ/82Yn1tPTqCWILcDeN3TsPwiyQuTM/b0Zkxg44JExJkAru9g9DySD86YoVtPTKCGIF8A8NkOhjtJ/jAxY09txgRqCLIHwEc7GL2L5PdnzNCtJyZgQRKH66mtTsCCrM7QW0hMwIIkDtdTW52ABVmdobeQmIAFSRyup7Y6AQuyOkNvITEBC5I4XE9tdQIWZHWG3kJiAhYkcbie2uoELMjqDL2FxARqCHIJgPM7GF4E4NbEjKee2sMAysOgD5L819TNzG38GoKoZ7HmxmzO/d4N4BoAV5G8f84TqdW7BalFur1x9gL4JMn72mutnY4sSDtZTNXJpSS7nraeqq8mxrUgTcQweRO/AFC+l+P3BBwUhQWZfN9spoE/AHgjyT8301EDjViQBkJoqIV7AJxA8t8N9TRpKzUEUbd5JwXgwZ9C4GaSbzOXxwi0IMh1AO50IBsjcDSA4wC8AsChPUfZTbLcDl780oIg55C8YvFJVAAQEbsBfAXAC8Rw+0geW6Gl5oewIM1HtN4GI+L5AG4B8EqxZb9Mo9Iplvok3UGs1wG5tYg4cuu09rkdxXtJni43lrygxhHEgjS4E0XE2QCu7GjtvwAOJ7m/wfartVRDEHUXy9cg1eJ+8kARUR4z6brWOJ1keSRlsYsFWWz0QER8GcCnOhB8guRXF4yoym1en2I1uodFxHsAfKejvT0kP9Zo+1XaqnEEUYL4FKtK1E8dJCLeDOBHHcPfQLK8fHyxSwuC+C7WRLtfRJwC4Kcdw/+W5Ksnaq+JYS1IEzFM00QPQRZ/J6sFQXyKNY0f5SL9ZAC3ieHfSfLaiVqcfNgWBPEp1kS7QY8jSOnsNyRPnKjFyYe1IJNHMF0DPQUpDS72p/IsyHT75+QjDxCk9Po1AB9f2o+u1hDEn6RPrsLTN9DzGuTAle8A8BmSNzU6pbW3VUOQ8kls14dNvkhfe6z9NjhCkMc3/ACA8svFvwNQ7nS1ujwC4F6S5TtHo5YagvgIMiqaza+0giCbb269I/wawI4xv6ZcQxD1SbrvYq13Z+i9tYHXIL2322jhTSR3DO3Nggwllqh+YYKU5I4luW9IhC0I4muQIYmtsXZBp1iPUxv8XfsagpTbgx/pyNWnWGvc6YdsaoFHkHNJXj6EUQ1BfJE+JJGKtT2OIOXi9i8AdlVsa5NDDf5jbEE2GUfj2+4hyKOPu0dEedRkJ4A3lbcvNj6trvYsyIzDq956X0EObiwi3gDgpQCOAnBI9ca3H/C08mbIdZ7O1ziC+BqkoT3owFZ6XIPcSPKMRtt/SlsRcRmA8zr6bfIaxII0uodZEB2MjyCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjrSHIpQA+3NHK4B9319NyRR8CFkRTsiCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjtSCaUdoKC6KjbUGQiwDcqlt1xUgCfwXwe5L7D14/Ik4GcFvHdm8geebIcauvFhFfB/ChjoEH/9xfC4JUB7nQAf8GYB+AnwH4Fsl9FkTvCRZEM8pa8QMA1wG4MtER5DIA53XM51ySlw8J1IIMobW82htJnjGXaUeEBZlLWEn6tCCbDjIi1O+kb7oFb388AQsynl2/NS1IP06NVlmQTQfT49bbplvw9scTsCDj2fVbs8cR5F4AD/TbmqtGEDgKwDEj1iur+HOQkeB6r9ZDkMEf3vQe3IVPEIiIVwF4v7gNejAxC7LpfajHKda7SX5v0314+48RiIjXA9gL4LAeTHyK1QPSSiUWZCV8G1k5Il4L4OcAnikGsCAbSeCAjfoUa9OEx20/Ii4E8Hmxtk+xxuHtv1YPQQZ//N9/dFd2EYiI8iDjER01czuCfAPABzvmM3hfq/GoiXrC0tcgE3kcEd8G8L5EgszyURMLMpEAatiI+ACAb1qQ7QnUOIKoR018m1ftyRv6/4g4FcDNiQRRf4wH72s1BFFN+xRrQwKozUbEywHc1VH3S5LltvAslqxP8w62ehZpzaDJiDgUwD86Wn2IZNdFfFOz7PGRwuB9rcYRxKdYTe1GT24mIv4J4FkdLZ5E8vaGp/BEa3MVxKdYDe9dEVG+k16+m77dcg3J3Q1P4UBBZnkXy0eQhveuiDgfwCWixR0kb2p4Go+2NtcjiAVpeM+KiPK0759Ei/8BcDbJ8h32ZhcL0mw0824sIq4F8I4es9gD4HMkyxtSmluyCjL44//mkpl5QxFxNIA/DpjGVQDuH1Bfq/Q0ACd0DDZ4X2vhLtbgpmvRXtI4EXEBgC8ln/Pgfa2GIL6LNZO9LiJuAfCWmbQ7pk0LMoaa13mMQESUL1HdAeDFSZk0KYi6izW46aThNTGtiHgRgHIkeVkTDa23ibNIXj1kkz7FGkJrIbVbj6BcD+CUZFM+nmR5SUjvxYL0RrWswoh4BoC3AygX769JMPtbSL516DxqCKJOsQY/QDZ0kq5fjcDWW+DL4yZnATh8ta1NsvavAOwkWb5BOWixIINwuTgiTgJw5NZXdZ/T48UPU0J7BMA9JMvp4qilhiC+zTsqGq/UAgEL0kIK7qFZAhak2WjcWAsELEgLKbiHZglYkGajcWMtELAgLaTgHpolYEGajcaNtUDAgrSQgntoloAFaTYaN9YCAQvSQgruoVkCFqTZaNxYCwRGC7L15ZodW79/1/VDLKXmxI7Jludkypd0tlvKGzXuInljC8Dcw7IIjBIkIo4DUN6T9JKKuH4CYBfJ8iZALyZQhcBgQSLiEAB3TvSNs++SfG8VMh7EBACMEWQXgClfIHYoyYedngnUIDBGkE8DuLhGc9uMMZuXKU/IyEOvicAYQXaWH5hf0/hjNnMEyYfGrOh1TGAogTGClGuQctfp+KGDraH+CpLnrGE73oQJ9CIwWJCy1YgocpSf7iqviKm1/Li8RMDXH7Vwe5xCYJQgW5I8G0B5S8QxG/5e8n4Ad/tzEO+wUxAYLcgUzXpME6hNwILUJu7xZkXAgswqLjdbm4AFqU3c482KgAWZVVxutjYBC1KbuMebFQELMqu43GxtAhakNnGPNysCFmRWcbnZ2gQsSG3iHm9WBCzIrOJys7UJWJDaxD3erAj8H30xAEFIYg+lAAAAAElFTkSuQmCC', 3, 2);

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
INSERT INTO `client_homework_inform_class` VALUES ('25782035104661522', '108d6be0-b986-11e8-becc-b75b40691af3', '61');
INSERT INTO `client_homework_inform_class` VALUES ('25782035104661523', '108d6be0-b986-11e8-becc-b75b40691af3', '62');
INSERT INTO `client_homework_inform_class` VALUES ('25782035104661524', '5d4db4d0-b986-11e8-becc-b75b40691af3', '41');
INSERT INTO `client_homework_inform_class` VALUES ('25782035104661525', '5d4db4d0-b986-11e8-becc-b75b40691af3', '42');
INSERT INTO `client_homework_inform_class` VALUES ('25782035104661526', '5d4db4d0-b986-11e8-becc-b75b40691af3', '43');

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
  `school_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `publisher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `publisher_avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `publish_type` int(20) NOT NULL DEFAULT 3 COMMENT '发布类型 2-班级作业 3-班级消息',
  `homework_type_value` int(32) NOT NULL DEFAULT 0 COMMENT '作业类型 0-班级消息',
  `publish_time` datetime(0) NULL DEFAULT NULL,
  `pictures` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of client_homework_information
-- ----------------------------
INSERT INTO `client_homework_information` VALUES ('108d6be0-b986-11e8-becc-b75b40691af3', '美术作业', '   请家长提醒学生，本班美术作业图形的魔术组合将在本周五进行班级展览，请家长督促学生按时的完成美术作品。', '   请家长提醒学生，本班美术作业图形的魔术组合将在本周五进行班级展览，请家长督促学生按时的完成美术', 3, '100001', '宋平', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/1537199340416-VsHZeje8k.jpg', 2, 4, '2018-09-16 15:56:48', '');
INSERT INTO `client_homework_information` VALUES ('5d4db4d0-b986-11e8-becc-b75b40691af3', '美术课堂', '请本班学生按时完成美术课机器人作品。本周五要进行作品展览。', '请本班学生按时完成美术课机器人作品。本周五要进行作品展览。', 3, '100001', '宋平', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/1537199340416-VsHZeje8k.jpg', 3, 0, '2018-09-16 15:58:57', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/1537084649987-S8IKC5JB-.jpg');

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
INSERT INTO `client_navigation` VALUES ('25719710465130510', 'administrative', '行政简讯', '/pages/core/notice/notice?notice_type=0', 2, 'on', 1, '/images/core/administrative/administrative.png', '/images/core/administrative/administrative@active.png');
INSERT INTO `client_navigation` VALUES ('25719710465130511', 'notice', '公告新闻', '/pages/core/notice/notice?notice_type=1', 4, 'on', 2, '/images/core/notice/notice.png', '/images/core/notice/notice@active.png');
INSERT INTO `client_navigation` VALUES ('25719710465130513', 'homework', '班级作业', '/pages/core/homework_information/homework_information?hi_type=2', 3, 'on', 3, '/images/core/homework/homework.png', '/images/core/homework/homework@active.png');
INSERT INTO `client_navigation` VALUES ('25719710465130514', 'class_inform', '班级消息', '/pages/core/homework_information/homework_information?hi_type=3', 3, 'on', 4, '/images/core/class_inform/class_inform.png', '/images/core/class_inform/class_inform@active.png');
INSERT INTO `client_navigation` VALUES ('25719710465130516', 'student_score', '学生成绩', '/pages/core/student_score/student_score', 3, 'on', 5, '/images/core/student_score/score.png', '/images/core/student_score/score@active.png');

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
  `publisher_avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `school_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` int(5) NOT NULL,
  `publish_time` datetime(0) NULL DEFAULT NULL,
  `pictures` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `notice_type` int(5) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of client_notice
-- ----------------------------
INSERT INTO `client_notice` VALUES ('25782035104661518', '数学组教研活动', '通知：明天下午将开展数学教研活动，时间2：30，地点：三楼会议室。本次活动主题是：1、学习本期数学教研组工作计划   2、学习《小学数学新课程标准》 3、请各位数学老师对上期数学工作进行总结和反思。（请各位数学老师提前做好准备，准时参加，谢谢！）', '通知：明天下午将开展数学教研活动，时间2：30，地点：三楼会议室。本次活动主题是：1、学习本期数学教', '宋平', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/1537199340416-VsHZeje8k.jpg', '100001', 2, '2018-09-16 15:50:18', '', 0);
INSERT INTO `client_notice` VALUES ('25782035104661519', '综合组教研活动', '通知：明天上午将开展综合组教研活动，时间8:40，地点：三楼会议室。本次活动主题是：1、学习本期综合教研组工作计划   2、学习综合组各科小学新课程标准 3、请各位综合组老师对上期工作进行总结和反思。4、请上周参加学习的音乐教师交流学习感悟，并写好学习心得。（请各位综合组各科老师提前做好准备，准时参加，谢谢！）', '通知：明天上午将开展综合组教研活动，时间8:40，地点：三楼会议室。本次活动主题是：1、学习本期综合', '宋平', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/1537199340416-VsHZeje8k.jpg', '100001', 2, '2018-09-16 15:51:15', '', 0);
INSERT INTO `client_notice` VALUES ('25782035104661520', '语文组教研活动', '通知：明天下午将开展语文教研活动，时间2：30，地点：三楼会议室。本次活动主题是：1、学习本期语文教研组工作计划   2、学习《小学语文新课程标准》 3、请各位语文老师对上期语文工作进行总结和反思。（请各位语文老师提前做好准备，准时参加，谢谢！）', '通知：明天下午将开展语文教研活动，时间2：30，地点：三楼会议室。本次活动主题是：1、学习本期语文教', '宋平', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/1537199340416-VsHZeje8k.jpg', '100001', 2, '2018-09-16 15:52:06', '', 0);
INSERT INTO `client_notice` VALUES ('25782035104661521', '平安校园', '旌阳区德新小学:创建平安校园 喜迎师生返校\r\n·\r\n\r\n9月3日讯（张学德 文/图）为给师生创建平安、和谐的学习工作环境，在2018年秋期开学到来之前，旌阳区德新小学校利用暑假时间对“7.11”特大暴雨造成的屋面漏雨进行了维修粉刷。对室外体育设施、幼儿玩具、教室门窗进行检修维护。\r\n\r\n8月31日安排专人用包腾片和“84”消毒液对教室、功能室、楼梯、楼道、厕所、体育设施、幼儿玩具及学校周边进行全方位消毒，有效地预防流行疾病的发生。并对花草树木进行修枝，补植，给师生一个安全整洁优美的学习生活环境。', '·旌阳区德新小学：创建平安校园 喜迎师生返校\r\n·\r\n\r\n9月3日讯（张学德 文/图）为给师生创建平', '宋平', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/1537199340416-VsHZeje8k.jpg', '100001', 5, '2018-09-16 15:55:12', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/1537084506879-t8ZMHsziY.jpg,https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/1537084508529-xfQ9TV6IM.jpg', 1);
INSERT INTO `client_notice` VALUES ('25782035104661527', '综合组教研会', '旌阳区德新小学综合学科研讨会\r\n\r\n9月14日讯。9月14日上午，旌阳区德新小学综合组召开了2018秋新学期第一次教研会，此次教研会主要对本学期教研组工作计划和综合组各科新课程标准进行学习，并对上学期的教学工作进行总结和反思。\r\n会议开始后，首先综合教研组长宋平组织全组老师学习了本学期的教研工作计划，并对本学期的教研工作进行了详细的安排，各科教师都了解了本学期的教研计划并明确了自己本学期教学教研工作任务。\r\n接着综合组各科教师进行了新课程标准的学习，明确了教学总目标，深入了解了学科特点，为教师在今后的教学当中助力。\r\n会议最后，各科教师对上期教学工作进行总结和反思，并对新学期教育教学做好了详细的计划。老师们提出了工作中的教学问题，并展开了交流和讨论，特别是在学生兴趣培养这个问题上，老师们都积极的去分析其中的原因，并都发表了自己的看法和解决方法。\r\n本次教研会研讨氛围浓厚，老师们收获颇多。相信在今后的教育教学中学生的综合素质能力会在老师们的辛勤努力下逐步提高，为新时代培养优秀人才。', '旌阳区德新小学综合学科研讨会\r\n\r\n9月14日讯。9月14日上午，旌阳区德新小学综合组召开了2018', '宋平', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/1537199340416-VsHZeje8k.jpg', '100001', 5, '2018-09-16 16:01:08', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/1537084829835-aF-XeRAg1.jpg', 1);
INSERT INTO `client_notice` VALUES ('25782035104661539', '德新小学教师节', ' 9月10日讯（向晟杰 文/图）\n \"老师，您辛苦啦\"\n \"老师，我爱您 ! \"……\n  9月10日清晨，旌阳区德新小学的校园里到处都是孩子们的祝福声。\n  在教师节这个特殊的日子里，一张张手制的卡片，一段段真挚的语言，孩子们简单而质朴的祝福温暖着老师们的心田。\n  孩子们说，在以后的学习中，会认真上好每一堂课，认真完成好每一次作业，以实际行动尊重老师的劳动，以优异的成绩良好的学风作为送给老师最好的礼物。\n  德新小学地处乡镇，老师们长期坚守乡村教育，坚持以德立身，时刻牢记自己肩负的神圣职责，做新时代立德树人的模范实践者；严谨治学，发扬优良学风，改革教学方法，提升教学能力，做新时代学生成长成才的引路人；以学促教，紧跟时代步伐，促进科研提升教学的能力，真正做新时代传播和创新知识的引领者。新入职的老师们在节日庆典上纷纷表示：将继承德新小学教师队伍的优良传统，以自己的青春，为孩子们书写出更炫丽的童年。\n', ' 9月10日讯（向晟杰 文/图）\n \"老师，您辛苦啦\"\n \"老师，我爱您 ! \"……\n  9月10日', '宋平', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/1537199340416-VsHZeje8k.jpg', '100001', 5, '2018-09-17 23:07:35', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/1537196853116-D0zgLTlFA.png', 1);
INSERT INTO `client_notice` VALUES ('25782035104661546', '应急救护培训', '9月18日讯（向晟杰 邓传蓉 文/图）\n为进一步普及应急救护常识，提高教职工基本救护能力，9月17日下午，旌阳区德新小学邀请旌阳区红十字会专家对全校教职工进行紧急救护培训。\n旌阳区红十字会专家，德新镇卫生院王医生告诉大家，在紧急救护时刻，每一个环节都关系到患者的生命，丝毫不能马虎。王医生就心肺复苏的具体操作方法进行了讲解和示范。查看“患者”意识、触摸颈动脉、清除呼吸道异物、打开气道、胸外心脏按压、施行人工呼吸等。还为教职工们介绍了快速止血、包扎固定、伤员搬运等常用的创伤救护方法，并现场示范了头部包扎和三角巾使用技巧。\n老师们听得十分认真，在操作练习环节争相上台体验，纷纷表示受益匪浅，要把此次培训中学习到的急救知识带回班级和家里，让身边更多人掌握急救技能。\n通过这次培训，不仅提高了德新小学教职工面对突发事件和意外伤害的应急意识和自救互救能力，还提升了大家对生命的敬畏感和主动施与援手的社会责任感，取得了良好的培训效果。', '四川新闻网德阳9月18日讯（向晟杰 邓传蓉 文/图）\n为进一步普及应急救护常识，提高教职工基本救护能', '宋平', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/1537203027796-E39pWft5C.jpg', '100001', 5, '2018-09-18 19:14:09', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/1537269248212-1OfOzFcGT.jpg', 1);
INSERT INTO `client_notice` VALUES ('25782035104661547', '青年教师演讲比赛', '9月18日讯（张大双 文/图）为激发青年教师奉献精神，爱岗敬业，能挖掘自己在教育教学中的优秀事迹或闪光点，提高业务水平，规范教师教育行为，不忘初心跟党走，做好新时代有担当的好老师。9月18日下午，旌阳区德新小学校举行了以“做新时代有担当的好老师”主题的青年教师演讲比赛。\n\n\n比赛在庄严的团歌中拉开帷幕，学校全体青年教师参与了此次比赛。30多位参赛青年教师准备充分，激情昂扬，演讲紧紧围绕“做新时代有担当的好老师”这一主题展开，以亲身经历和优秀教师、先进集体的典型事例为题材，突出青年教师的蓬勃朝气和创新精神，展现教师在工作中的爱岗敬业、无私奉献的师德风范。\n\n\n比赛结束后，钱继光校长对优秀选手的演讲进行了精彩的点评，并鼓励青年老师们多读书、多学习、多写文章，做孩子生命中的燃灯者。有多大担当才能干多大事业，尽多大责任才会有多大成就，一定要站在红旗下，活在新时代，要立足岗位、主动担当 ，争做新时代优秀教师。\n\n本次比赛，青年教师们不仅展示了个人风采，更展现了教师爱岗敬业、用梦想和激情演绎的精彩人生。', '9月18日讯（张大双 文/图）为激发青年教师奉献精神，爱岗敬业，能挖掘自己在教育教学中的优秀事迹或闪', '宋平', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/1537203027796-E39pWft5C.jpg', '100001', 5, '2018-09-18 20:22:33', 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/1537273352154-pgWM-tf8Y.jpg', 1);

-- ----------------------------
-- Table structure for client_school
-- ----------------------------
DROP TABLE IF EXISTS `client_school`;
CREATE TABLE `client_school`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `school_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学校代码',
  `school_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学校名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of client_school
-- ----------------------------
INSERT INTO `client_school` VALUES (1, '100001', '德阳旌阳区德新小学');

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
INSERT INTO `client_subject` VALUES (1, '语文');
INSERT INTO `client_subject` VALUES (2, '数学');
INSERT INTO `client_subject` VALUES (3, '英语');
INSERT INTO `client_subject` VALUES (4, '美术');
INSERT INTO `client_subject` VALUES (5, '信息技术');
INSERT INTO `client_subject` VALUES (6, '科学');
INSERT INTO `client_subject` VALUES (7, '书法');
INSERT INTO `client_subject` VALUES (8, '音乐');
INSERT INTO `client_subject` VALUES (9, '体育');
INSERT INTO `client_subject` VALUES (10, '思想品德');

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
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `school_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学校编码',
  `user_type` int(5) NULL DEFAULT NULL COMMENT '0-管理员 1-教师 2-家长',
  `level` int(5) NULL DEFAULT 4 COMMENT '用户级别 0-管理员 1-行政老师 2-普通教师 3-家长 4-普通职工 5-游客',
  `avatar` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png',
  PRIMARY KEY (`id`, `phone`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of client_user
-- ----------------------------
INSERT INTO `client_user` VALUES ('100000', '001', '管理员', '111111', '', '100001', 1, 0, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95db49dc-b8bb-11e8-924a-4ccc6add7806', '15390141516', '王彦哲家长', '111111', '许红', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dbbebb-b8bb-11e8-93ef-4ccc6add7806', '13881079757', '钱峻杰家长', '111111', '钱伟', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dbbebd-b8bb-11e8-aea8-4ccc6add7806', '15196327510', '王子轩家长', '111111', '王剑', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dbe5b4-b8bb-11e8-b1d2-4ccc6add7806', '18161311279', '高隐家长', '111111', '高安斌', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dbe5b6-b8bb-11e8-b1ac-4ccc6add7806', '15008245818', '黄可家长', '111111', '黄先波', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dbe5b8-b8bb-11e8-bf50-4ccc6add7806', '15984920611', '左嘉瑞家长', '111111', '左匀久', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dc0ca4-b8bb-11e8-9303-4ccc6add7806', '15282868806', '谢余涔家长', '111111', '余凤华', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dc0ca6-b8bb-11e8-848c-4ccc6add7806', '13698189126', '高博瑞家长', '111111', '高勇', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dc339e-b8bb-11e8-a128-4ccc6add7806', '15984913901', '李从屹家长', '111111', '刘小丽', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dc33a0-b8bb-11e8-8385-4ccc6add7806', '18084935498', '雍森予家长', '111111', '雍维', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dc33a2-b8bb-11e8-83ba-4ccc6add7806', '15008366410', '李永杰家长', '111111', '李本华', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dc5a90-b8bb-11e8-a27d-4ccc6add7806', '15282824839', '高亮家长', '111111', '高建平', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dc5a92-b8bb-11e8-9232-4ccc6add7806', '15884294121', '黄加骏家长', '111111', '黄伟', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dc5a94-b8bb-11e8-b052-4ccc6add7806', '18090750130', '黄俊轩家长', '111111', '何婷', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dc8186-b8bb-11e8-b9ac-4ccc6add7806', '13990276247', '黄泽宇家长', '111111', '黄仁东', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dc8188-b8bb-11e8-b42b-4ccc6add7806', '15283869151', '江俊熙家长', '111111', '江涛', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dc818a-b8bb-11e8-9e91-4ccc6add7806', '15982937037', '蒋睿哲家长', '111111', '蒋力', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dca87a-b8bb-11e8-9ac6-4ccc6add7806', '13550637007', '赖礼鑫家长', '111111', '赖孝光', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dca87c-b8bb-11e8-9037-4ccc6add7806', '13778407077', '李懿轩家长', '111111', '李波', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dccf70-b8bb-11e8-8f2b-4ccc6add7806', '13308104279', '刘吉星家长', '111111', '刘健', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dccf72-b8bb-11e8-aa5f-4ccc6add7806', '13419000391', '柳小雨家长', '111111', '柳吉', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dccf74-b8bb-11e8-9a6d-4ccc6add7806', '15282854129', '邱宇涵家长', '111111', '王光秀', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dcf666-b8bb-11e8-a021-4ccc6add7806', '13183991052', '唐凯家长', '111111', '唐先火', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dcf668-b8bb-11e8-8470-4ccc6add7806', '13419016740', '王文银家长', '111111', '王雨豪', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dcf66a-b8bb-11e8-ac7a-4ccc6add7806', '13438452789', '袁枭林家长', '111111', '袁岗', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dd1d5c-b8bb-11e8-be9a-4ccc6add7806', '18283889147', '黄小露家长', '111111', '黄仁强', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dd1d5e-b8bb-11e8-bb2f-4ccc6add7806', '18090758613', '黄周俊熙家长', '111111', '黄小冬', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dd4452-b8bb-11e8-8cd5-4ccc6add7806', '17828155872', '卿洪家长', '111111', '卿春红', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dd4454-b8bb-11e8-9d63-4ccc6add7806', '13320864163', '杜娜家长', '111111', '王德', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dd4456-b8bb-11e8-857f-4ccc6add7806', '18281089072', '王金满家长', '111111', '王展展', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dd6b46-b8bb-11e8-9689-4ccc6add7806', '18280538677', '唐思琦家长', '111111', '唐亮', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dd6b48-b8bb-11e8-a793-4ccc6add7806', '18016108968', '张可芯家长', '111111', '张学春', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dd6b4a-b8bb-11e8-8d9f-4ccc6add7806', '15892487431', '张语微家长', '111111', '张旭伟', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dd923a-b8bb-11e8-9c79-4ccc6add7806', '15884297266', '李星怡家长', '111111', '李凯', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dd923c-b8bb-11e8-b3b5-4ccc6add7806', '15984945063', '柯雨苗家长', '111111', '廖明月', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dd923e-b8bb-11e8-a88d-4ccc6add7806', '13330853110', '严耀羚家长', '111111', '严明明', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ddb930-b8bb-11e8-9a02-4ccc6add7806', '13547049770', '卿羽家长', '111111', '卿山平', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ddb932-b8bb-11e8-90fb-4ccc6add7806', '18283804511', '唐羽煕家长', '111111', '唐斌斌', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dde026-b8bb-11e8-a7a9-4ccc6add7806', '15883676745', '铁相然家长', '111111', '王凤娟', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dde028-b8bb-11e8-9a3c-4ccc6add7806', '13458495156', '仝雨琪家长', '111111', '张玲', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dde02a-b8bb-11e8-bbeb-4ccc6add7806', '13628072649', '易璐家长', '111111', '易光明', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95de071c-b8bb-11e8-8a53-4ccc6add7806', '13618105416', '易溪家长', '111111', '易小刚', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95de071e-b8bb-11e8-9f4a-4ccc6add7806', '18048626078', '袁子涵家长', '111111', '袁建', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95de0720-b8bb-11e8-b2a3-4ccc6add7806', '13541712770', '钟心怡家长', '111111', '钟加智', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95de2e12-b8bb-11e8-b184-4ccc6add7806', '18227135157', '周欣怡家长', '111111', '周玉根', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95de2e14-b8bb-11e8-9b48-4ccc6add7806', '13096286683', '朱天意家长', '111111', '王诗建', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95de2e16-b8bb-11e8-b5ed-4ccc6add7806', '13981085862', '刘馨萌家长', '111111', '刘辉', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95de5508-b8bb-11e8-83d1-4ccc6add7806', '15680008020', '陈茜家长', '111111', '陈少华', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95de550a-b8bb-11e8-8684-4ccc6add7806', '15282827800', '薛钰涵家长', '111111', '刘佳', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95de7bfe-b8bb-11e8-90d3-4ccc6add7806', '13458498341', '曾婉琳家长', '111111', '曾佳冰', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95de7c00-b8bb-11e8-8197-4ccc6add7806', '18280552697', '蔡歆茹家长', '111111', '蔡冬', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95de7c02-b8bb-11e8-967c-4ccc6add7806', '15196344694', '王雨棋家长', '111111', '左希坤', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dea2ee-b8bb-11e8-b36e-4ccc6add7806', '13990237498', '王琪瑶家长', '111111', '王忠刚', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dea2f0-b8bb-11e8-b6e5-4ccc6add7806', '13568200466', '肖雨欣家长', '111111', '肖顺军', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dea2f2-b8bb-11e8-9e64-4ccc6add7806', '13550654188', '刘恩圻家长', '111111', '刘明军', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dec9e4-b8bb-11e8-8cbd-4ccc6add7806', '17785128898', '柳承志家长', '111111', '柳小平', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dec9e6-b8bb-11e8-9542-4ccc6add7806', '13880086799', '杨馨然家长', '111111', '杨云泉', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95def0dc-b8bb-11e8-9f6f-4ccc6add7806', '18608100676', '罗依然家长', '111111', '罗建', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95def0de-b8bb-11e8-977b-4ccc6add7806', '15183836907', '黄语馨家长', '111111', '黄伟', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95def0e0-b8bb-11e8-8169-4ccc6add7806', '13668301908', '刘思语家长', '111111', '刘金龙', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95df17d2-b8bb-11e8-beac-4ccc6add7806', '13350042383', '应佳灏家长', '111111', '应强', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95df17d4-b8bb-11e8-9fd9-4ccc6add7806', '13281354727', '戴博文家长', '111111', '戴瑞国', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95df17d6-b8bb-11e8-8c2e-4ccc6add7806', '13981081347', '唐华巧家长', '111111', '唐万国', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95df3ec6-b8bb-11e8-a4e7-4ccc6add7806', '13508015122', '万子轩家长', '111111', '万佳', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95df3ec8-b8bb-11e8-888b-4ccc6add7806', '15982902750', '闫佳玲家长', '111111', '闫志勇', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95df3eca-b8bb-11e8-9ea3-4ccc6add7806', '15883834826', '周恩旭家长', '111111', '周伟', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95df65ba-b8bb-11e8-970f-4ccc6add7806', '18683639587', '曹洺睿家长', '111111', '曹龙', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95df65bc-b8bb-11e8-98c7-4ccc6add7806', '18683838859', '钱书壕家长', '111111', '钱诗祥', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95df8cb4-b8bb-11e8-82de-4ccc6add7806', '15892867203', '闫思琦家长', '111111', '闫志杰', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95df8cb6-b8bb-11e8-a240-4ccc6add7806', '13808102605', '何玉坤家长', '111111', '何林', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95df8cb8-b8bb-11e8-a2d0-4ccc6add7806', '13550606246', '李明龙家长', '111111', '李开均', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dfb3a4-b8bb-11e8-9038-4ccc6add7806', '13648105573', '龚廷钦家长', '111111', '龚文武', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dfb3a6-b8bb-11e8-9798-4ccc6add7806', '15328108662', '兰可欣家长', '111111', '兰波', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dfb3a8-b8bb-11e8-aff4-4ccc6add7806', '15183688522', '王柏凯家长', '111111', '王永', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dfda9c-b8bb-11e8-b9be-4ccc6add7806', '13778267188', '杨钦家长', '111111', '杨林', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95dfda9e-b8bb-11e8-abc7-4ccc6add7806', '15308262672', '罗程驯家长', '111111', '罗伟', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e00190-b8bb-11e8-ac66-4ccc6add7806', '13198151998', '李馨莲家长', '111111', '李成龙', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e00192-b8bb-11e8-b645-4ccc6add7806', '18981053543', '杜佳琪家长', '111111', '杜志光', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e00194-b8bb-11e8-a9f9-4ccc6add7806', '18683877119', '闫嘉星家长', '111111', '闫志恩', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e02886-b8bb-11e8-b299-4ccc6add7806', '13458988116', '罗嘉奕家长', '111111', '罗丰', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e02888-b8bb-11e8-a21f-4ccc6add7806', '13330867432', '王魏琪家长', '111111', '王红波', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e0288a-b8bb-11e8-9ca8-4ccc6add7806', '13976106807', '袁利文家长', '111111', '袁晓辉', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e04f7a-b8bb-11e8-a11c-4ccc6add7806', '15883662782', '张子妍家长', '111111', '彭静', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e04f7c-b8bb-11e8-b699-4ccc6add7806', '13550625071', '周宇航家长', '111111', '周录勇', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e04f7e-b8bb-11e8-98da-4ccc6add7806', '18683777120', '彭润蒙家长', '111111', '彭元果', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e07670-b8bb-11e8-92fe-4ccc6add7806', '15883811136', '袁梓涵家长', '111111', '袁磊', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e07672-b8bb-11e8-a972-4ccc6add7806', '15196397900', '梁钰彬家长', '111111', '梁波', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e09d66-b8bb-11e8-8c3f-4ccc6add7806', '15883827068', '廖思琦家长', '111111', '廖述凯', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e09d68-b8bb-11e8-a35a-4ccc6add7806', '18280502610', '曾馨兰家长', '111111', '曾小满', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e09d6a-b8bb-11e8-a921-4ccc6add7806', '13281367876', '吉庆阳家长', '111111', '吉昌安', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e0c45c-b8bb-11e8-8de2-4ccc6add7806', '13419017365', '林馨玥家长', '111111', '林山明', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e0c45e-b8bb-11e8-b232-4ccc6add7806', '18016155887', '黄锐家长', '111111', '黄冬', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e0c460-b8bb-11e8-8724-4ccc6add7806', '15183820739', '卿振轩家长', '111111', '卿三勇', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e0eb50-b8bb-11e8-8e4a-4ccc6add7806', '18283816854', '江晓希家长', '111111', '江代军', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e0eb52-b8bb-11e8-ad80-4ccc6add7806', '13568209226', '胡桔涔家长', '111111', '胡卫东', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e0eb54-b8bb-11e8-b126-4ccc6add7806', '13698197835', '邹年汐家长', '111111', '邹永勇', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e11247-b8bb-11e8-b1c8-4ccc6add7806', '15883863287', '杨涵宇家长', '111111', '杨燕', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e11249-b8bb-11e8-9c06-4ccc6add7806', '15183845315', '刘鑫家长', '111111', '刘培勇', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e1393a-b8bb-11e8-a695-4ccc6add7806', '13350597709', '刘文静家长', '111111', '刘永康', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e1393c-b8bb-11e8-93c3-4ccc6add7806', '13778205295', '李梓阳家长', '111111', '李辉宝', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e1393e-b8bb-11e8-9713-4ccc6add7806', '18161360512', '徐佳芮家长', '111111', '徐书伟', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e16030-b8bb-11e8-ad5e-4ccc6add7806', '18942899970', '胡运航家长', '111111', '胡华彬', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e16032-b8bb-11e8-adc6-4ccc6add7806', '13548265919', '黄雅馨家长', '111111', '黄勇', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e16034-b8bb-11e8-88d1-4ccc6add7806', '18281098660', '柳诗涵家长', '111111', '柳吉东', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e18726-b8bb-11e8-a1ea-4ccc6add7806', '15283857561', '肖正一家长', '111111', '肖辉', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e18728-b8bb-11e8-ba53-4ccc6add7806', '13778437931', '李杨希家长', '111111', '李东林', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e1ae1c-b8bb-11e8-9dcb-4ccc6add7806', '13778201203', '伍涵菱家长', '111111', '伍磊', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e1ae1e-b8bb-11e8-8fee-4ccc6add7806', '15892899282', '黄雨晴家长', '111111', '肖冬冬', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e1ae20-b8bb-11e8-a609-4ccc6add7806', '13118102237', '丁雯靖家长', '111111', '丁强', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e1d512-b8bb-11e8-b6fb-4ccc6add7806', '15196397781', '张铁文家长', '111111', '张家伟', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e1d514-b8bb-11e8-bae5-4ccc6add7806', '13183995019', '符长容家长', '111111', '符美东', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e1d516-b8bb-11e8-93f3-4ccc6add7806', '15196332825', '吉阳灿家长', '111111', '吉庆东', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e1fc08-b8bb-11e8-ab9e-4ccc6add7806', '13088206818', '廖海洋家长', '111111', '廖洪君', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e1fc0a-b8bb-11e8-a597-4ccc6add7806', '13778431879', '吴梓婷家长', '111111', '吴连', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e1fc0c-b8bb-11e8-8562-4ccc6add7806', '13890266374', '罗纪洺家长', '111111', '罗刚涛', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e222f9-b8bb-11e8-89d6-4ccc6add7806', '15283868862', '吴明广家长', '111111', '廖万玉', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e222fb-b8bb-11e8-bfc4-4ccc6add7806', '13018196468', '代林家长', '111111', '代显贵', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e249ee-b8bb-11e8-9308-4ccc6add7806', '18783820835', '王紫薇家长', '111111', '刘德春', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e249f0-b8bb-11e8-bccf-4ccc6add7806', '18281069751', '赖玉宸家长', '111111', '赖金刚', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e249f2-b8bb-11e8-b710-4ccc6add7806', '13198279786', '米艾雪家长', '111111', '米春', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e270e4-b8bb-11e8-a5f2-4ccc6add7806', '13419037081', '杨佳琪家长', '111111', '杨建国', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e270e6-b8bb-11e8-bd85-4ccc6add7806', '13088346621', '周昊天家长', '111111', '周建', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e270e8-b8bb-11e8-bc10-4ccc6add7806', '15883632832', '周焓家长', '111111', '周顺国', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e297dc-b8bb-11e8-9c29-4ccc6add7806', '18990227370', '吉思清家长', '111111', '吉昌林', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e297de-b8bb-11e8-a5f8-4ccc6add7806', '15892864691', '杨峻羽家长', '111111', '杨昌红', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e2bed0-b8bb-11e8-b0a8-4ccc6add7806', '13198279786', '唐小燕家长', '111111', '唐成兴', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e2bed2-b8bb-11e8-88dc-4ccc6add7806', '13725881598', '吴欣语家长', '111111', '吴世清', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e2bed4-b8bb-11e8-a94c-4ccc6add7806', '13668316710', '郑嘉懿家长', '111111', '郑小龙', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e2e5c6-b8bb-11e8-9fae-4ccc6add7806', '18283816841', '谢鑫程家长', '111111', '谢天文', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e2e5c8-b8bb-11e8-9cd8-4ccc6add7806', '18094811267', '袁左涵家长', '111111', '左仁喜', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e2e5ca-b8bb-11e8-854f-4ccc6add7806', '15681026169', '吉阳家长', '111111', '吉庆华', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e30cba-b8bb-11e8-8879-4ccc6add7806', '15883436718', '陈欣兰家长', '111111', '陈洪', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e30cbc-b8bb-11e8-be7c-4ccc6add7806', '18181145939', '闫婉华家长', '111111', '闫治明', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e30cbe-b8bb-11e8-970e-4ccc6add7806', '15283823157', '安心蕊家长', '111111', '安亮亮', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e333b4-b8bb-11e8-885d-4ccc6add7806', '18096216003', '李依依家长', '111111', '李超', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e333b6-b8bb-11e8-8259-4ccc6add7806', '15183883270', '刘虹余家长', '111111', '刘代华', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e35aa6-b8bb-11e8-981e-4ccc6add7806', '18016156142', '丁子轩家长', '111111', '丁国露', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e35aa8-b8bb-11e8-93a6-4ccc6add7806', '15390141819', '王子涵家长', '111111', '王仁伙', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e35aaa-b8bb-11e8-a06d-4ccc6add7806', '18283880066', '王若曦家长', '111111', '王飞', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e3819a-b8bb-11e8-bc47-4ccc6add7806', '13908211407', '张胜杰家长', '111111', '张旭斌', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e3819c-b8bb-11e8-beba-4ccc6add7806', '15282895921', '陈辛娜拉家长', '111111', '陈华杨', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e3819e-b8bb-11e8-9677-4ccc6add7806', '15883849587', '蒋语晗家长', '111111', '蒋寿君', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e3a890-b8bb-11e8-b3c8-4ccc6add7806', '15692972187', '侯希蓓家长', '111111', '侯光祥', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e3a892-b8bb-11e8-b395-4ccc6add7806', '18781072832', '王屹林家长', '111111', '王德兴', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e3cf86-b8bb-11e8-b2db-4ccc6add7806', '18683831989', '陈君蕊家长', '111111', '王丽君', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e3cf88-b8bb-11e8-958c-4ccc6add7806', '15982127116', '陈浩轩家长', '111111', '陈宏玖', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e3cf8a-b8bb-11e8-be14-4ccc6add7806', '13778242688', '杨予涵家长', '111111', '邹建', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e3f67a-b8bb-11e8-88e8-4ccc6add7806', '13658160267', '黄胡浩越家长', '111111', '黄胡江', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e3f67c-b8bb-11e8-8216-4ccc6add7806', '18980100675', '罗宇森家长', '111111', '罗红平', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e3f67e-b8bb-11e8-b405-4ccc6add7806', '18780149002', '周金贤家长', '111111', '周太春', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e41d70-b8bb-11e8-8783-4ccc6add7806', '18990227370', '林语馨家长', '111111', '廖玲', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e41d72-b8bb-11e8-97f9-4ccc6add7806', '13320855746', '薛子涵家长', '111111', '薛玉全', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e41d74-b8bb-11e8-b789-4ccc6add7806', '13658160732', '刘舟家长', '111111', '刘春林', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e44466-b8bb-11e8-8b4e-4ccc6add7806', '18683828760', '陈博家长', '111111', '陈军', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e44468-b8bb-11e8-bd76-4ccc6add7806', '17313341979', '张翼博家长', '111111', '张继友', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e46b5c-b8bb-11e8-9504-4ccc6add7806', '13309026169', '钟涛家长', '111111', '钟青竹', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e46b5e-b8bb-11e8-9cde-4ccc6add7806', '15386670019', '阳羽恒家长', '111111', '阳建刚', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e46b60-b8bb-11e8-9172-4ccc6add7806', '15121612474', '肖可馨家长', '111111', '肖文君', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e49252-b8bb-11e8-84e1-4ccc6add7806', '13890282323', '苏哲浩家长', '111111', '苏中伟', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e49254-b8bb-11e8-8505-4ccc6add7806', '15181059641', '张紫涵家长', '111111', '张东海', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e49256-b8bb-11e8-91a4-4ccc6add7806', '18048071727', '黄泓淩家长', '111111', '黄金勇', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e4b948-b8bb-11e8-a4bc-4ccc6add7806', '18281061812', '万如亿家长', '111111', '万军', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e4b94a-b8bb-11e8-a355-4ccc6add7806', '1598381776', '胡雨馨家长', '111111', '吴雪菊', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e4e03e-b8bb-11e8-aff8-4ccc6add7806', '13658179407', '刘志山家长', '111111', '刘定平', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e4e040-b8bb-11e8-b076-4ccc6add7806', '13778232642', '钟薇瑶家长', '111111', '钟薇瑶家长', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e4e042-b8bb-11e8-adde-4ccc6add7806', '15183824502', '黄蕊家长', '111111', '黄蕊家长', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e50730-b8bb-11e8-b94a-4ccc6add7806', '13550638839', '卿瑾萱家长', '111111', '卿瑾萱家长', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e50732-b8bb-11e8-a312-4ccc6add7806', '18283898209', '赵甍家长', '111111', '赵甍家长', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e50734-b8bb-11e8-bbee-4ccc6add7806', '13508015016', '张家豪家长', '111111', '张家豪家长', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e52e28-b8bb-11e8-a3cd-4ccc6add7806', '13881062932', '彭帅家长', '111111', '彭帅家长', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e52e2a-b8bb-11e8-a3a8-4ccc6add7806', '15883427107', '丁雨欣家长', '111111', '丁雨欣家长', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e52e2c-b8bb-11e8-a310-4ccc6add7806', '18781011904', '廖宸熙家长', '111111', '廖宸熙家长', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e5551c-b8bb-11e8-b3b5-4ccc6add7806', '18011053110', '柳昀浩家长', '111111', '柳昀浩家长', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e5551e-b8bb-11e8-b988-4ccc6add7806', '15282816615', '雷子轩家长', '111111', '雷子轩家长', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e57c12-b8bb-11e8-96ea-4ccc6add7806', '13548268079', '龚懿轩家长', '111111', '龚懿轩家长', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e57c14-b8bb-11e8-9e1c-4ccc6add7806', '15983824353', '高清云家长', '111111', '高清云家长', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e57c16-b8bb-11e8-8e74-4ccc6add7806', '13568239851', '秦涵洋家长', '111111', '秦涵洋家长', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e5a308-b8bb-11e8-b2da-4ccc6add7806', '18283803381', '欧翔家长', '111111', '欧翔家长', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e5a30a-b8bb-11e8-882c-4ccc6add7806', '18781067077', '林伟杰家长', '111111', '林伟杰家长', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e5a30c-b8bb-11e8-a564-4ccc6add7806', '15883421062', '肖震阳家长', '111111', '肖震阳家长', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e5c9fe-b8bb-11e8-8abc-4ccc6add7806', '18280514522', '陈诗婧家长', '111111', '陈诗婧家长', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e5ca00-b8bb-11e8-bd08-4ccc6add7806', '13881093779', '赖馨怡家长', '111111', '赖馨怡家长', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e5f0ee-b8bb-11e8-ba84-4ccc6add7806', '18683751006', '邹伟宸家长', '111111', '邹伟宸家长', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e5f0f0-b8bb-11e8-aeef-4ccc6add7806', '18728060768', '卿悦家长', '111111', '卿悦家长', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e5f0f2-b8bb-11e8-a688-4ccc6add7806', '13547078552', '刘雨嘉家长', '111111', '刘雨嘉家长', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e617e8-b8bb-11e8-ba80-4ccc6add7806', '15892873608', '周楚玮家长', '111111', '周楚玮家长', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e617ea-b8bb-11e8-8ce6-4ccc6add7806', '15884250676', '李婉莹家长', '111111', '李婉莹家长', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e617ec-b8bb-11e8-8f4f-4ccc6add7806', '13518260812', '刘珺瑶家长', '111111', '刘珺瑶家长', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e63eda-b8bb-11e8-8749-4ccc6add7806', '13550604379', '宋尚昊淋家长', '111111', '宋尚昊淋家长', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e63edc-b8bb-11e8-8c0b-4ccc6add7806', '18281045616', '肖志强家长', '111111', '肖志强家长', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e63ede-b8bb-11e8-8a99-4ccc6add7806', '13628105760', '罗晨希家长', '111111', '罗晨希家长', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e665d0-b8bb-11e8-a531-4ccc6add7806', '15282841430', '张文悦家长', '111111', '张文悦家长', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e665d2-b8bb-11e8-834c-4ccc6add7806', '15883874092', '方晨阳家长', '111111', '方晨阳家长', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e68cc6-b8bb-11e8-8a50-4ccc6add7806', '18608387444', '李子昂家长', '111111', '李子昂家长', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e68cc8-b8bb-11e8-b654-4ccc6add7806', '15892481127', '唐华巧家长', '111111', '唐华巧家长', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e68cca-b8bb-11e8-ba4c-4ccc6add7806', '15984935252', '曹馨蕊家长', '111111', '曹馨蕊家长', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e6b3ba-b8bb-11e8-9d87-4ccc6add7806', '13808101659', '高桢贤家长', '111111', '高桢贤家长', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e6b3bc-b8bb-11e8-b53b-4ccc6add7806', '15283874139', '高嫒熙家长', '111111', '高嫒熙家长', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e6b3be-b8bb-11e8-a176-4ccc6add7806', '15884589707', '黄星成家长', '111111', '黄星成家长', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e6dab0-b8bb-11e8-bf4a-4ccc6add7806', '15892476976', '田杨家长', '111111', '田明勇', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e6dab2-b8bb-11e8-9b3d-4ccc6add7806', '13980106958', '谢浩宇家长', '111111', '余定治', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e6dab4-b8bb-11e8-865f-4ccc6add7806', '13548250353', '田晨希家长', '111111', '田育敏', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e701a4-b8bb-11e8-909c-4ccc6add7806', '13378144174', '梁森艺家长', '111111', '梁平', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e701a6-b8bb-11e8-bbbf-4ccc6add7806', '15282897156', '黄紫涵家长', '111111', '黄仁丹', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e7289a-b8bb-11e8-878f-4ccc6add7806', '18227102955', '雷静怡家长', '111111', '雷志华', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e7289c-b8bb-11e8-8ed3-4ccc6add7806', '15892864691', '杨佳霖家长', '111111', '杨昌红', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e7289e-b8bb-11e8-a24b-4ccc6add7806', '15283875191', '何莉家长', '111111', '何延强', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e74f90-b8bb-11e8-b248-4ccc6add7806', '13084381733', '杨紫阳家长', '111111', '杨进波', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e74f92-b8bb-11e8-a771-4ccc6add7806', '13890240520', '钟雯婷家长', '111111', '钟剑侠', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e74f94-b8bb-11e8-995d-4ccc6add7806', '15681010434', '袁唐程家长', '111111', '袁兴洪', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e77686-b8bb-11e8-ae21-4ccc6add7806', '13038295387', '刘玉杉家长', '111111', '刘小川', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e77688-b8bb-11e8-be92-4ccc6add7806', '13689641920', '彭浩燃家长', '111111', '彭航', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e79d7a-b8bb-11e8-a0c7-4ccc6add7806', '15283887719', '袁静怡家长', '111111', '袁邦洪', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e79d7c-b8bb-11e8-bfa1-4ccc6add7806', '15883838895', '赖罗乐家长', '111111', '赖孝华', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e79d7e-b8bb-11e8-a2ee-4ccc6add7806', '3861296', '龙佳鑫家长', '111111', '龙礼枨', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e7c470-b8bb-11e8-ac0f-4ccc6add7806', '15196335578', '范睿岩家长', '111111', '范涛', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e7c472-b8bb-11e8-b677-4ccc6add7806', '15984912127', '王心悦家长', '111111', '王国春', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e7c474-b8bb-11e8-b13d-4ccc6add7806', '13778400801', '黄博家长', '111111', '黄正波', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e7eb66-b8bb-11e8-9579-4ccc6add7806', '13550612654', '徐槿家长', '111111', '徐述强', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e7eb68-b8bb-11e8-aa7a-4ccc6add7806', '13608109449', '刘俊文家长', '111111', '刘靖', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e7eb6a-b8bb-11e8-994c-4ccc6add7806', '13320857706', '张芯茹家长', '111111', '张林', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e8125c-b8bb-11e8-9831-4ccc6add7806', '13547009288', '彭志刚家长', '111111', '彭小兵', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e8125e-b8bb-11e8-a642-4ccc6add7806', '18148126078', '阳彩恩家长', '111111', '阳小龙', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e83952-b8bb-11e8-8a07-4ccc6add7806', '13547040551', '吴文俊家长', '111111', '吴代录', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e83954-b8bb-11e8-9b02-4ccc6add7806', '18781018318', '刘晨阳家长', '111111', '刘德静', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e83956-b8bb-11e8-9b2b-4ccc6add7806', '13890263941', '李凌旭家长', '111111', '李强', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e86048-b8bb-11e8-84bd-4ccc6add7806', '15892883657', '罗雅琪家长', '111111', '罗世文', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e8604a-b8bb-11e8-8a03-4ccc6add7806', '13778207259', '刘辰雨家长', '111111', '刘相兵', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e8604c-b8bb-11e8-bfaa-4ccc6add7806', '13508013940', '王子璇家长', '111111', '王吉', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e8873a-b8bb-11e8-bb9c-4ccc6add7806', '15183689697', '刘婧雯家长', '111111', '胡昌芝', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e8873c-b8bb-11e8-8345-4ccc6add7806', '13541718202', '常爱琳家长', '111111', '刘雪燕', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e8ae2e-b8bb-11e8-a42e-4ccc6add7806', '13981066617', '周天佑家长', '111111', '周绿安', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e8ae30-b8bb-11e8-a260-4ccc6add7806', '13084385215', '廖子萱家长', '111111', '廖明', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e8ae32-b8bb-11e8-98f5-4ccc6add7806', '18728023253', '穆诗怡家长', '111111', '穆宝', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e8d524-b8bb-11e8-bcb7-4ccc6add7806', '13408387394', '伍子怡家长', '111111', '伍维松', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e8d526-b8bb-11e8-9d30-4ccc6add7806', '18283831857', '苏志轩家长', '111111', '苏忠富', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e8d528-b8bb-11e8-a755-4ccc6add7806', '18981040237', '廖诗韵家长', '111111', '廖红波', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e8fc1c-b8bb-11e8-800b-4ccc6add7806', '13541717950', '孟志雨家长', '111111', '孟礼强', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e8fc1e-b8bb-11e8-ab58-4ccc6add7806', '15984905659', '杨双榕家长', '111111', '杨正波', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e8fc20-b8bb-11e8-9e6a-4ccc6add7806', '18084935394', '刘雨萱家长', '111111', '刘昌全', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e92313-b8bb-11e8-b995-4ccc6add7806', '18783867733', '胡家琪家长', '111111', '胡建国', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e92315-b8bb-11e8-832d-4ccc6add7806', '13778219178', '欧阳建鑫家长', '111111', '阳小辉', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e94a08-b8bb-11e8-b840-4ccc6add7806', '15283807631', '张晋轩家长', '111111', '张应琼', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e94a0a-b8bb-11e8-9daa-4ccc6add7806', '13320866976', '李君昊家长', '111111', '李兴培', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e94a0c-b8bb-11e8-a229-4ccc6add7806', '13668300825', '曾梦琳家长', '111111', '钟玉琼', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e971be-b8bb-11e8-bd28-4ccc6add7806', '15282885855', '高皓轩家长', '111111', '聂金秀', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e971c0-b8bb-11e8-9b86-4ccc6add7806', '15982937153', '卢文韬家长', '111111', '钟玲', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e971c2-b8bb-11e8-828b-4ccc6add7806', '15984902160', '李棚家长', '111111', '陈琳', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e997ee-b8bb-11e8-b79f-4ccc6add7806', '15283804739', '张希婷家长', '111111', '周杰', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e997f0-b8bb-11e8-94c9-4ccc6add7806', '13183989107', '谢梦桐家长', '111111', '李丽', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e9bee4-b8bb-11e8-a62d-4ccc6add7806', '15881464695', '黄海涛家长', '111111', '王碧蓉', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e9bee6-b8bb-11e8-81d7-4ccc6add7806', '18016141926', '徐彩馨家长', '111111', '牛文霞', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e9bee8-b8bb-11e8-bbc4-4ccc6add7806', '15183892827', '易欣蕊家长', '111111', '张春蓉', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e9e5da-b8bb-11e8-aabe-4ccc6add7806', '13881046145', '吴鑫蕾家长', '111111', '刘卿', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e9e5dc-b8bb-11e8-a08f-4ccc6add7806', '18016141926', '杨宇航家长', '111111', '胡小燕', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95e9e5de-b8bb-11e8-8638-4ccc6add7806', '13508016064', '陈予佳家长', '111111', '杨春燕', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ea0cd0-b8bb-11e8-97f1-4ccc6add7806', '15308272560', '肖可欣家长', '111111', '杨波', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ea0cd2-b8bb-11e8-a441-4ccc6add7806', '15883819112', '刘佳鑫家长', '111111', '周婷', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ea33c6-b8bb-11e8-9c31-4ccc6add7806', '13778436107', '卢何豪家长', '111111', '何成成', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ea33c8-b8bb-11e8-b707-4ccc6add7806', '13689622735', '尹思妍家长', '111111', '廖洪兰', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ea33ca-b8bb-11e8-bc32-4ccc6add7806', '15982940148', '杨竣文家长', '111111', '王丝丝', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ea5aba-b8bb-11e8-a33a-4ccc6add7806', '13881037880', '黄鑫瑞家长', '111111', '周娟', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ea5abc-b8bb-11e8-a437-4ccc6add7806', '13320867617', '严振轩家长', '111111', '周华均', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ea5abe-b8bb-11e8-b4d0-4ccc6add7806', '13990221764', '严品家长', '111111', '龙义萍', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ea81b0-b8bb-11e8-a691-4ccc6add7806', '13388121635', '唐馨桐家长', '111111', '周金翠', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ea81b2-b8bb-11e8-b54a-4ccc6add7806', '15983831989', '徐雅欣家长', '111111', '徐书均', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ea81b4-b8bb-11e8-a2d7-4ccc6add7806', '15283820245', '易洪洋家长', '111111', '聂中碧', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95eaa8a6-b8bb-11e8-9296-4ccc6add7806', '18090033671', '黄思源家长', '111111', '周小燕', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95eaa8a8-b8bb-11e8-95d0-4ccc6add7806', '15892858924', '李文博家长', '111111', '邱述雪', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95eacf9a-b8bb-11e8-82cb-4ccc6add7806', '15883654576', '曾东阳家长', '111111', '刘光红', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95eacf9c-b8bb-11e8-8c87-4ccc6add7806', '13084384440', '田钰妍家长', '111111', '李永芳', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95eacf9e-b8bb-11e8-8b09-4ccc6add7806', '18990288267', '谭静茹家长', '111111', '吴春华', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95eaf690-b8bb-11e8-a9cf-4ccc6add7806', '18608111345', '赖宇函家长', '111111', '任兰', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95eaf692-b8bb-11e8-a1ef-4ccc6add7806', '15884279859', '杨鑫宇家长', '111111', '温芳', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95eaf694-b8bb-11e8-b17f-4ccc6add7806', '15181051735', '胡春雪家长', '111111', '胡近秋', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95eb1d86-b8bb-11e8-9e83-4ccc6add7806', '15892865853', '陈菀柔家长', '111111', '刘莉', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95eb1d88-b8bb-11e8-bb2f-4ccc6add7806', '15328693823', '胡嘉佳家长', '111111', '冯敏', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95eb447a-b8bb-11e8-a1f3-4ccc6add7806', '15902396142', '薛诗银家长', '111111', '郭群', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95eb447c-b8bb-11e8-9988-4ccc6add7806', '15283835595', '陈思圆家长', '111111', '王宗坤', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95eb447e-b8bb-11e8-8231-4ccc6add7806', '18283875430', '杨诗雨家长', '111111', '杨晓燕', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95eb6b70-b8bb-11e8-afaf-4ccc6add7806', '15883882749', '朱俊豪家长', '111111', '翟琴琴', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95eb6b72-b8bb-11e8-afb9-4ccc6add7806', '18783882570', '唐海山家长', '111111', '张云', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95eb6b74-b8bb-11e8-ba2f-4ccc6add7806', '18121850170', '张傲雪家长', '111111', '李华坤', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95eb9266-b8bb-11e8-ba75-4ccc6add7806', '13419030673', '黄轶笙家长', '111111', '万华蓉', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95eb9268-b8bb-11e8-8c55-4ccc6add7806', '13990233846', '何梓梦家长', '111111', '曾春梅', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95eb926a-b8bb-11e8-af39-4ccc6add7806', '15283855308', '徐宇浩家长', '111111', '徐刚', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ebb95c-b8bb-11e8-b501-4ccc6add7806', '13330862751', '王馨悦家长', '111111', '周春华', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ebb95e-b8bb-11e8-b499-4ccc6add7806', '15283855308', '黄素涵家长', '111111', '黄建', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ebe052-b8bb-11e8-bb31-4ccc6add7806', '15883608012', '陈妍羽家长', '111111', '母乐红', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ebe054-b8bb-11e8-a0a1-4ccc6add7806', '18090022203', '彭彦兢家长', '111111', '吴晓燕', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ebe056-b8bb-11e8-a982-4ccc6add7806', '17602113032', '邓阳家长', '111111', '欧阳波', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ec0746-b8bb-11e8-b38b-4ccc6add7806', '15984925241', '魏琳家长', '111111', '魏伯亮', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ec0748-b8bb-11e8-83cd-4ccc6add7806', '15390141772', '钱峰家长', '111111', '钱强', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ec074a-b8bb-11e8-bb5a-4ccc6add7806', '13038273439', '罗妍家长', '111111', '罗前刚', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ec2e3e-b8bb-11e8-a9e2-4ccc6add7806', '15983810524', '孟欣宇家长', '111111', '彭善英', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ec2e40-b8bb-11e8-a420-4ccc6add7806', '18227175327', '张艾妍家长', '111111', '张红华', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ec552e-b8bb-11e8-9ea5-4ccc6add7806', '18683821293', '王宇航家长', '111111', '王先保', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ec5530-b8bb-11e8-b994-4ccc6add7806', '13618103977', '梁羽馨家长', '111111', '梁全华', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ec5532-b8bb-11e8-bc2b-4ccc6add7806', '18280544538', '谭佳宝家长', '111111', '谭世金', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ec7c28-b8bb-11e8-a172-4ccc6add7806', '18781077908', '邱政哲家长', '111111', '郭松', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ec7c2a-b8bb-11e8-9496-4ccc6add7806', '18084937725', '阳青霞家长', '111111', '阳建明', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ec7c2c-b8bb-11e8-88f9-4ccc6add7806', '18990209952', '田旭阳家长', '111111', '田小平', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95eca31c-b8bb-11e8-897f-4ccc6add7806', '13666172132', '黄力衡家长', '111111', '黄仁建', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95eca31e-b8bb-11e8-9ad8-4ccc6add7806', '13778237851', '陈佳欣家长', '111111', '陈晓华', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95eca320-b8bb-11e8-8a75-4ccc6add7806', '13689611523', '付旭阳家长', '111111', '付航行', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ecca12-b8bb-11e8-aa54-4ccc6add7806', '15982941399', '付子倪家长', '111111', '付薛烊', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ecca14-b8bb-11e8-9570-4ccc6add7806', '3861527', '谢鑫家长', '111111', '谢孝洪', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ecf106-b8bb-11e8-9a96-4ccc6add7806', '15983811497', '卿宴阳家长', '111111', '卿烈洪', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ecf108-b8bb-11e8-93ae-4ccc6add7806', '15883804056', '唐雨薇家长', '111111', '唐明亮', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ecf10a-b8bb-11e8-84eb-4ccc6add7806', '13568238860', '梁恒瑞家长', '111111', '梁科', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ed17fa-b8bb-11e8-a94e-4ccc6add7806', '15883631786', '赵雯菲家长', '111111', '赵显碧', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ed17fc-b8bb-11e8-a9f7-4ccc6add7806', '15308267118', '周秋艺家长', '111111', '周建', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ed17fe-b8bb-11e8-b057-4ccc6add7806', '15583834572', '李睿家长', '111111', '魏莉华', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ed3ef4-b8bb-11e8-80a0-4ccc6add7806', '15386687731', '邓湛家长', '111111', '邓光成', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ed3ef6-b8bb-11e8-a81f-4ccc6add7806', '15884269236', '黄加丽家长', '111111', '黄小燕', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ed65e4-b8bb-11e8-99a9-4ccc6add7806', '18016102182', '钟佳怡家长', '111111', '钟才虎', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ed65e6-b8bb-11e8-932c-4ccc6add7806', '13778294685', '邵锐家长', '111111', '绍伟', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ed65e8-b8bb-11e8-944d-4ccc6add7806', '13990235860', '郭家蕊家长', '111111', '郭刚', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ed8cda-b8bb-11e8-a4cf-4ccc6add7806', '13018199482', '易磊家长', '111111', '易望来', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ed8cdc-b8bb-11e8-a632-4ccc6add7806', '18628296110', '李宇轩家长', '111111', '李堂华', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ed8cde-b8bb-11e8-b5c3-4ccc6add7806', '15883697615', '万子麟家长', '111111', '万伟', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95edb3d0-b8bb-11e8-8999-4ccc6add7806', '15883673383', '刘宇航家长', '111111', '刘庆', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95edb3d2-b8bb-11e8-8949-4ccc6add7806', '15984901160', '卿钰彤家长', '111111', '卿洪林', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95edb3d4-b8bb-11e8-95b7-4ccc6add7806', '15883824520', '萧福雨家长', '111111', '肖盛炉', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95eddac6-b8bb-11e8-b965-4ccc6add7806', '15883631986', '刘语馨家长', '111111', '刘书林', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95eddac8-b8bb-11e8-ad82-4ccc6add7806', '13881052387', '李国宗家长', '111111', '李发亮', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ee01ba-b8bb-11e8-99f9-4ccc6add7806', '18783845453', '卿皇轩家长', '111111', '卿光亮', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ee01bc-b8bb-11e8-b65b-4ccc6add7806', '18980105039', '刘欣家长', '111111', '刘丛林', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ee01be-b8bb-11e8-9c3a-4ccc6add7806', '18084922583', '周雨萌家长', '111111', '周禄超', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ee28b0-b8bb-11e8-9936-4ccc6add7806', '18090768871', '尹思雨家长', '111111', '尹显军', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ee28b2-b8bb-11e8-8649-4ccc6add7806', '187280910176', '廖正滟家长', '111111', '廖扬', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ee28b4-b8bb-11e8-a0aa-4ccc6add7806', '13550665648', '周子寓家长', '111111', '杨晓利', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ee4fa6-b8bb-11e8-b21b-4ccc6add7806', '18090049335', '周雨馨家长', '111111', '周君', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ee4fa8-b8bb-11e8-a7fd-4ccc6add7806', '13990277724', '欧阳鹏家长', '111111', '欧启君', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ee769c-b8bb-11e8-8514-4ccc6add7806', '15928319357.0', '周梦怡家长', '111111', '张琴', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ee769e-b8bb-11e8-87f3-4ccc6add7806', '15181046311', '陈俊杰家长', '111111', '陈加兵', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ee76a0-b8bb-11e8-8fe1-4ccc6add7806', '13198891014', '陈可星家长', '111111', '陈刚', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ee9d90-b8bb-11e8-a528-4ccc6add7806', '13981078472', '陈思含家长', '111111', '陈军', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ee9d92-b8bb-11e8-aa96-4ccc6add7806', '15928316904', '陈语函家长', '111111', '陈辉敏', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ee9d94-b8bb-11e8-a2c5-4ccc6add7806', '13540008831', '代晨曦家长', '111111', '蒋保地', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95eec486-b8bb-11e8-9e1c-4ccc6add7806', '15984913863', '邓涛家长', '111111', '邓迪忠', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95eec488-b8bb-11e8-81a3-4ccc6add7806', '13778230167', '邓钰霏家长', '111111', '邓先刚', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95eec48a-b8bb-11e8-a48f-4ccc6add7806', '13309020133', '黄秀婷家长', '111111', '黄泽军', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95eeeb7f-b8bb-11e8-b20e-4ccc6add7806', '15982921968', '黄宇家长', '111111', '黄潇潇', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95eeeb81-b8bb-11e8-b8ab-4ccc6add7806', '15008359353', '旷佳林家长', '111111', '钟娟', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ef1270-b8bb-11e8-afb9-4ccc6add7806', '15883641486', '兰鑫玲家长', '111111', '兰湘如', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ef1272-b8bb-11e8-a08c-4ccc6add7806', '13568239990', '李麒瑞家长', '111111', '李忠斌', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ef1274-b8bb-11e8-aadf-4ccc6add7806', '13778238644', '李仪佳家长', '111111', '李忠军', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ef3966-b8bb-11e8-8332-4ccc6add7806', '13408389180', '刘一洋家长', '111111', '刘崇豪', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ef3968-b8bb-11e8-9ed0-4ccc6add7806', '13990224154', '柳继宏家长', '111111', '柳吉勇', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ef396a-b8bb-11e8-b7b8-4ccc6add7806', '13006457938', '罗浩然家长', '111111', '罗正勇', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ef605c-b8bb-11e8-997a-4ccc6add7806', '13778249173', '米鑫家长', '111111', '米文辉', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ef605e-b8bb-11e8-ab50-4ccc6add7806', '13778402517', '聂瑞欣家长', '111111', '聂金华', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ef8752-b8bb-11e8-8086-4ccc6add7806', '13890263232', '彭宪皓家长', '111111', '彭路波', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ef8754-b8bb-11e8-b05d-4ccc6add7806', '13881040057', '彭雅睿家长', '111111', '彭元东', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ef8756-b8bb-11e8-923a-4ccc6add7806', '15283847278', '卿城家长', '111111', '卿烈刚', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95efae42-b8bb-11e8-adc4-4ccc6add7806', '15982938529', '石太龙家长', '111111', '石正建', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95efae44-b8bb-11e8-9b82-4ccc6add7806', '18826979779', '苏语轩家长', '111111', '周玉霞', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95efae46-b8bb-11e8-9afb-4ccc6add7806', '18016156175', '唐震阳家长', '111111', '严世标', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95efd538-b8bb-11e8-8642-4ccc6add7806', '13689630043', '田宇恒家长', '111111', '田育君', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95efd53a-b8bb-11e8-89ea-4ccc6add7806', '18090768854', '田子阳家长', '111111', '田少华', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95efd53c-b8bb-11e8-af09-4ccc6add7806', '13547973060', '王佳谊家长', '111111', '王义铎', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95effc2f-b8bb-11e8-be69-4ccc6add7806', '15883885973', '王苡彬家长', '111111', '王敏', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95effc31-b8bb-11e8-ac19-4ccc6add7806', '15883885973', '肖琳璨家长', '111111', '肖能兵', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f02324-b8bb-11e8-a1d2-4ccc6add7806', '18728039602', '杨安琪家长', '111111', '杨建国', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f02326-b8bb-11e8-875d-4ccc6add7806', '13778432832', '杨若馨家长', '111111', '杨超', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f02328-b8bb-11e8-adb9-4ccc6add7806', '15828096009', '姚宇轩家长', '111111', '姚勇', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f04a1c-b8bb-11e8-b2ef-4ccc6add7806', '15183829159', '张继垲家长', '111111', '张强', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f04a1e-b8bb-11e8-b0b2-4ccc6add7806', '15008393475', '张佳妮家长', '111111', '张敏', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f04a20-b8bb-11e8-998d-4ccc6add7806', '15892863661', '张淇文家长', '111111', '张学东', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f07110-b8bb-11e8-b3d8-4ccc6add7806', '15183886603', '张文涛家长', '111111', '张永常', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f07112-b8bb-11e8-9d77-4ccc6add7806', '18280552728', '张颜希家长', '111111', '张涛', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f09806-b8bb-11e8-bbf8-4ccc6add7806', '18909027937', '张宇航家长', '111111', '张绍洪', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f09808-b8bb-11e8-806a-4ccc6add7806', '13689530305', '钟爽家长', '111111', '钟孝军', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f0980a-b8bb-11e8-a1ac-4ccc6add7806', '18283816374', '周乐佳家长', '111111', '周后贵', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f0bef8-b8bb-11e8-ac2f-4ccc6add7806', '13778438055', '袁家欣家长', '111111', '袁增兵', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f0befa-b8bb-11e8-a4e6-4ccc6add7806', '18227132468', '赵霓曼家长', '111111', '李世东', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f0befc-b8bb-11e8-8dc9-4ccc6add7806', '15884589709', '黄星驰家长', '111111', '杨丽', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f0e5ee-b8bb-11e8-b0fe-4ccc6add7806', '13658171282', '徐涛家长', '111111', '徐安华', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f0e5f0-b8bb-11e8-b66b-4ccc6add7806', '15183830106', '曾灏龙家长', '111111', '曾俊', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f0e5f2-b8bb-11e8-9950-4ccc6add7806', '13541704272', '陈玉洁家长', '111111', '陈磊', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f10ce4-b8bb-11e8-b544-4ccc6add7806', '15283858085', '邓文捷家长', '111111', '苏丽', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f10ce6-b8bb-11e8-9cca-4ccc6add7806', '15609026938', '方全志家长', '111111', '方孝林', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f133da-b8bb-11e8-ac6c-4ccc6add7806', '18090767503', '冯涛家长', '111111', '冯鼎培', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f133dc-b8bb-11e8-90db-4ccc6add7806', '13981041710', '高小慧家长', '111111', '高凤明', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f133de-b8bb-11e8-9513-4ccc6add7806', '15308250135', '龚波力家长', '111111', '龚德军', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f15ad2-b8bb-11e8-b7ea-4ccc6add7806', '15883864655', '龚鑫栎家长', '111111', '龚德明', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f15ad4-b8bb-11e8-b424-4ccc6add7806', '15982940921', '胡钦怡家长', '111111', '胡昌寿', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f15ad6-b8bb-11e8-8e1a-4ccc6add7806', '13550605908', '胡天昊家长', '111111', '胡士友', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f181c6-b8bb-11e8-a060-4ccc6add7806', '13658173567', '黄柴钢家长', '111111', '黄先贵', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f181c8-b8bb-11e8-bf0a-4ccc6add7806', '13458984681', '黄芯蝶家长', '111111', '黄先勇', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f1a8ba-b8bb-11e8-ac92-4ccc6add7806', '18090768837', '吉娜家长', '111111', '吉庆江', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f1a8bc-b8bb-11e8-b37a-4ccc6add7806', '18990273683', '蒋裕博家长', '111111', '蒋启正', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f1a8be-b8bb-11e8-8c43-4ccc6add7806', '13881092978', '李静薇家长', '111111', '李代贵', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f1cfb0-b8bb-11e8-8fe6-4ccc6add7806', '18683753708', '李子林家长', '111111', '李松', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f1cfb2-b8bb-11e8-976a-4ccc6add7806', '13228333977', '刘佳祺家长', '111111', '刘俊', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f1cfb4-b8bb-11e8-85b0-4ccc6add7806', '15282849161', '刘乐家长', '111111', '刘培刚', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f1f6a6-b8bb-11e8-895d-4ccc6add7806', '13350581110', '刘思彤家长', '111111', '刘健', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f1f6a8-b8bb-11e8-b12a-4ccc6add7806', '18280564527', '刘文琛家长', '111111', '刘世贵', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f1f6aa-b8bb-11e8-bb01-4ccc6add7806', '13350598353', '刘语欣家长', '111111', '刘俊', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f21d9a-b8bb-11e8-9faf-4ccc6add7806', '13096450285', '刘张蕊家长', '111111', '刘军', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f21d9c-b8bb-11e8-9e83-4ccc6add7806', '15308267797', '柳家鑫家长', '111111', '柳小刚', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f24492-b8bb-11e8-967f-4ccc6add7806', '13096444315', '龙礼跃家长', '111111', '龙义红', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f24494-b8bb-11e8-b74f-4ccc6add7806', '13568200533', '米秋雨家长', '111111', '米应伟', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f24496-b8bb-11e8-91ee-4ccc6add7806', '18781030067', '彭湃家长', '111111', '彭小刚', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f26b86-b8bb-11e8-94f1-4ccc6add7806', '13908107106', '邱宇家长', '111111', '邱元波', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f26b88-b8bb-11e8-b939-4ccc6add7806', '15282850235', '施文杰家长', '111111', '刘晓燕', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f26b8a-b8bb-11e8-93f8-4ccc6add7806', '15984931146', '唐小雨家长', '111111', '唐明松', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f2927a-b8bb-11e8-8e92-4ccc6add7806', '15883644350', '田宇恒家长', '111111', '田木林', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f2927c-b8bb-11e8-98f5-4ccc6add7806', '15181017931', '王静雯家长', '111111', '王维冬', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f2b970-b8bb-11e8-9ea0-4ccc6add7806', '15181063822', '吴奇轩家长', '111111', '吴波', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f2b972-b8bb-11e8-9cd5-4ccc6add7806', '13398480596', '谢雨涵家长', '111111', '谢钧', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f2b974-b8bb-11e8-ade7-4ccc6add7806', '15883870234', '严瑞琦家长', '111111', '严从华', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f2e066-b8bb-11e8-9f8c-4ccc6add7806', '13698191809', '杨帆家长', '111111', '杨勇', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f2e068-b8bb-11e8-bee1-4ccc6add7806', '13198283466', '杨鑫家长', '111111', '杨勇', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f2e06a-b8bb-11e8-bf12-4ccc6add7806', '13881081737', '杨左林馨家长', '111111', '杨海林', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f3075c-b8bb-11e8-af55-4ccc6add7806', '15883808793', '叶诗晨家长', '111111', '叶林', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f3075e-b8bb-11e8-a06f-4ccc6add7806', '15008366549', '张高毅家长', '111111', '张贤波', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f30760-b8bb-11e8-bff6-4ccc6add7806', '15283852146', '张之颖家长', '111111', '张朝勇', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f32e52-b8bb-11e8-acd2-4ccc6add7806', '13990272730', '郑可语家长', '111111', '郑世旭', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f32e54-b8bb-11e8-bc3a-4ccc6add7806', '15982242225', '何思琪家长', '111111', '何梦刚', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f35542-b8bb-11e8-8cee-4ccc6add7806', '13698191709', '黄鑫家长', '111111', '黄刚', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f35544-b8bb-11e8-9529-4ccc6add7806', '13981034833', '江静冉家长', '111111', '江世波', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f35546-b8bb-11e8-8954-4ccc6add7806', '18011052237', '赵馨怡家长', '111111', '李艳', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f37c38-b8bb-11e8-b4b8-4ccc6add7806', '13550613763', '黄瑶瑶家长', '111111', '黄年森', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f37c3a-b8bb-11e8-9ff8-4ccc6add7806', '13547019618', '刘卓航家长', '111111', '刘大宁', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f37c3c-b8bb-11e8-b026-4ccc6add7806', '15283815977', '刘语熙家长', '111111', '刘新新', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f3a32e-b8bb-11e8-887e-4ccc6add7806', '18280599938', '彭博文家长', '111111', '彭小华', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f3a330-b8bb-11e8-9934-4ccc6add7806', '15984915452', '黄昌杰家长', '111111', '黄年鑫', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f3ca28-b8bb-11e8-ac7c-4ccc6add7806', '13108899690', '欧秋林家长', '111111', '欧定龙', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f3ca2a-b8bb-11e8-925a-4ccc6add7806', '15183839050', '阳韩莉家长', '111111', '阳建军', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f3ca2c-b8bb-11e8-afae-4ccc6add7806', '13518265180', '刘悦家长', '111111', '刘权', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f3f11a-b8bb-11e8-9900-4ccc6add7806', '13508400920', '张吉川家长', '111111', '龙华明', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f3f11c-b8bb-11e8-b379-4ccc6add7806', '15982948213', '周毅然家长', '111111', '周太华', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f3f11e-b8bb-11e8-bcf1-4ccc6add7806', '18084937735', '尹煜轩家长', '111111', '尹贤波', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f41810-b8bb-11e8-a223-4ccc6add7806', '18783896128', '庞雨婷家长', '111111', '庞瑞国', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f41812-b8bb-11e8-9d7e-4ccc6add7806', '13508012425', '王鑫锐家长', '111111', '徐中秀', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f41814-b8bb-11e8-a5a5-4ccc6add7806', '15008337505', '李恩祥家长', '111111', '李天明', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f43f06-b8bb-11e8-b0f6-4ccc6add7806', '18781090877', '邓超家长', '111111', '邓书东', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f43f08-b8bb-11e8-9299-4ccc6add7806', '15183827583', '邓鹏家长', '111111', '邓云才', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f465fa-b8bb-11e8-b4c5-4ccc6add7806', '15183698616', '谢舰周家长', '111111', '谢加波', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f465fc-b8bb-11e8-88d4-4ccc6add7806', '13890288796', '钱萌檬家长', '111111', '钱春林', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f465fe-b8bb-11e8-b57f-4ccc6add7806', '13398480581', '龙思颖家长', '111111', '龙华', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f48cee-b8bb-11e8-8d0c-4ccc6add7806', '13778407379', '戚紫琳家长', '111111', '戚吕彬', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f48cf0-b8bb-11e8-9647-4ccc6add7806', '13198880655', '吴宇枫家长', '111111', '万小琴', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f48cf2-b8bb-11e8-ba8c-4ccc6add7806', '13778438285', '翟志豪家长', '111111', '翟友国', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f4b3e4-b8bb-11e8-a597-4ccc6add7806', '15883633933', '袁新淏家长', '111111', '袁胜楷', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f4b3e6-b8bb-11e8-a164-4ccc6add7806', '18783832266', '龚陈俊豪家长', '111111', '龚平', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f4dada-b8bb-11e8-aa65-4ccc6add7806', '13340854993', '欧力梦家长', '111111', '欧启均', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f4dadc-b8bb-11e8-81dc-4ccc6add7806', '13981006541', '郑斯尹家长', '111111', '郑华春', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f4dade-b8bb-11e8-8c54-4ccc6add7806', '13458975739', '易亚灵家长', '111111', '易德', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f501d0-b8bb-11e8-a37f-4ccc6add7806', '15883814263', '吴西家长', '111111', '俞东芹', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f501d2-b8bb-11e8-b97b-4ccc6add7806', '13981068548', '母诗铭家长', '111111', '母志全', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f501d4-b8bb-11e8-9f47-4ccc6add7806', '15983808812', '张昕岑家长', '111111', '张建国', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f528c6-b8bb-11e8-80e5-4ccc6add7806', '13890263780', '唐星语家长', '111111', '邹志明', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f528c8-b8bb-11e8-95af-4ccc6add7806', '13548263880', '李昌宇家长', '111111', '李银川', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f528ca-b8bb-11e8-8093-4ccc6add7806', '15883804651', '李馨语家长', '111111', '李成林', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f54fba-b8bb-11e8-9dfc-4ccc6add7806', '13778437725', '赵图鑫家长', '111111', '赵鼎臣', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f54fbc-b8bb-11e8-aa6d-4ccc6add7806', '15282858876', '鲁俊威家长', '111111', '鲁刚', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f576b0-b8bb-11e8-b9e9-4ccc6add7806', '15283805394', '高诗韵家长', '111111', '高庆国', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f576b2-b8bb-11e8-abeb-4ccc6add7806', '13890267377', '谢依轩家长', '111111', '谢述春', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f576b4-b8bb-11e8-bcc5-4ccc6add7806', '13881091126', '杨文杰家长', '111111', '杨剑', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f59da6-b8bb-11e8-9cbe-4ccc6add7806', '15883826732', '张世涛家长', '111111', '张永富', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f59da8-b8bb-11e8-b318-4ccc6add7806', '13808187209', '曹思源家长', '111111', '曹国湘', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f59daa-b8bb-11e8-8a3e-4ccc6add7806', '13890217577', '尹昕怡家长', '111111', '尹林', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f5c498-b8bb-11e8-94d0-4ccc6add7806', '15281451836', '尹凡家长', '111111', '尹春华', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f5c49a-b8bb-11e8-bc36-4ccc6add7806', '15196333102', '郭佳怡家长', '111111', '郭小军', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f5eb8c-b8bb-11e8-af2e-4ccc6add7806', '15883420297', '张攀阳家长', '111111', '张恺', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f5eb8e-b8bb-11e8-8539-4ccc6add7806', '13881023387', '唐可煜欣家长', '111111', '陈大伟', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f5eb90-b8bb-11e8-b1d8-4ccc6add7806', '13568218391', '尹欣怡家长', '111111', '尹强', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f61286-b8bb-11e8-8e8d-4ccc6add7806', '18783871565', '谢紫怡家长', '111111', '谢康勤', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f61288-b8bb-11e8-846d-4ccc6add7806', '18783871567', '尹姿涵家长', '111111', '尹帮建', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f6128a-b8bb-11e8-898d-4ccc6add7806', '13881012875', '张渤雯家长', '111111', '张华斌', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f6397a-b8bb-11e8-90a5-4ccc6add7806', '13330860090', '严锡阳家长', '111111', '严德斌', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f6397c-b8bb-11e8-960c-4ccc6add7806', '13508019747', '杨雨涵家长', '111111', '杨建华', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f6397e-b8bb-11e8-b73b-4ccc6add7806', '13038273439', '罗亚运家长', '111111', '袁和玉', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f66070-b8bb-11e8-8e4f-4ccc6add7806', '18783872237', '黄馨怡家长', '111111', '黄泽保', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f66072-b8bb-11e8-8712-4ccc6add7806', '15883406503', '袁晨阳家长', '111111', '陈琳', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f68764-b8bb-11e8-b205-4ccc6add7806', '18881002925', '胡俊杰家长', '111111', '胡云兵', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f68766-b8bb-11e8-99db-4ccc6add7806', '13320851180', '肖崇岩家长', '111111', '肖兵', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f68768-b8bb-11e8-b217-4ccc6add7806', '15183871570', '唐剑家长', '111111', '唐爱民', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f6ae5c-b8bb-11e8-a75e-4ccc6add7806', '13890229479', '张宇科家长', '111111', '张军', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f6ae5e-b8bb-11e8-8d24-4ccc6add7806', '18282817905', '张妍家长', '111111', '张先第', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f6ae60-b8bb-11e8-9d1f-4ccc6add7806', '13550609788', '周陈良柯家长', '111111', '周杨', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f6d552-b8bb-11e8-9421-4ccc6add7806', '18980119292', '蒋馨家长', '111111', '蒋东', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f6d554-b8bb-11e8-97e1-4ccc6add7806', '15282828573', '赖鑫怡家长', '111111', '赖婷婷', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f6fc48-b8bb-11e8-baca-4ccc6add7806', '15281471357', '刘雨昕家长', '111111', '刘培刚', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f6fc4a-b8bb-11e8-8109-4ccc6add7806', '13881026969', '刘庸翰家长', '111111', '刘昌松', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f6fc4c-b8bb-11e8-9bf0-4ccc6add7806', '13084380108', '赵梦灵家长', '111111', '赵盛福', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f7233a-b8bb-11e8-a048-4ccc6add7806', '18608152029', '付文豪家长', '111111', '付红', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f7233c-b8bb-11e8-8521-4ccc6add7806', '15884258867', '田芯瑗家长', '111111', '王小芳', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f7233e-b8bb-11e8-a0f5-4ccc6add7806', '18280531518', '雷志鑫家长', '111111', '雷小庆', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f74a2e-b8bb-11e8-b024-4ccc6add7806', '15883428918', '张子欣家长', '111111', '卢小琴', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f74a30-b8bb-11e8-bd1d-4ccc6add7806', '18016168122', '王凤骏家长', '111111', '王明勇', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f74a32-b8bb-11e8-85f4-4ccc6add7806', '15183826844', '伍培乂家长', '111111', '伍兴华', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f77124-b8bb-11e8-a9c4-4ccc6add7806', '15883896735', '李唐梦薇家长', '111111', '李本云', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f77126-b8bb-11e8-bf77-4ccc6add7806', '13038288880', '田馨倪家长', '111111', '田勇', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f7981a-b8bb-11e8-8ebb-4ccc6add7806', '15983804981', '谭心雨家长', '111111', '黄晓丽', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f7981c-b8bb-11e8-8bba-4ccc6add7806', '15982902442', '陈誉福林家长', '111111', '胡玉兰', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f7981e-b8bb-11e8-b22c-4ccc6add7806', '15196333295', '罗超家长', '111111', '罗义', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f7bf10-b8bb-11e8-b62f-4ccc6add7806', '13408615132', '何思娴家长', '111111', '何梦刚', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f7bf12-b8bb-11e8-b5f1-4ccc6add7806', '13981039976', '刘奇家长', '111111', '刘德斌', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f7bf14-b8bb-11e8-9852-4ccc6add7806', '13698192682', '润宇扬家长', '111111', '卿山蓉', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f7e606-b8bb-11e8-b4e5-4ccc6add7806', '13096281665', '李佳乐家长', '111111', '李小强', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f7e608-b8bb-11e8-af49-4ccc6add7806', '1809000283', '卿锐家长', '111111', '卿山国', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f80cfa-b8bb-11e8-9e85-4ccc6add7806', '13547041191', '叶佳鑫家长', '111111', '叶刚', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f80cfc-b8bb-11e8-9b69-4ccc6add7806', '13778293564', '曾宇鑫家长', '111111', '曾波', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f80cfe-b8bb-11e8-86e4-4ccc6add7806', '13548255259', '周海林家长', '111111', '周勇', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f833f0-b8bb-11e8-ac94-4ccc6add7806', '18781094180', '李虹霖家长', '111111', '李建', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f833f2-b8bb-11e8-a5ab-4ccc6add7806', '18016161757', '柳文涛家长', '111111', '柳从礼', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f833f4-b8bb-11e8-98c5-4ccc6add7806', '15196352873', '邹年毅家长', '111111', '邹永超', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f85ae4-b8bb-11e8-b07a-4ccc6add7806', '13544691722', '张恩俊家长', '111111', '张发明', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f85ae6-b8bb-11e8-8b30-4ccc6add7806', '13999213111', '黄钰寅家长', '111111', '黄波', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f85ae8-b8bb-11e8-8dbe-4ccc6add7806', '13795913631', '张浩冉家长', '111111', '张恺', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f881da-b8bb-11e8-bd84-4ccc6add7806', '13981060496', '张田雨佳家长', '111111', '张纪洪', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f881dc-b8bb-11e8-a7a2-4ccc6add7806', '13309029608', '彭静雯家长', '111111', '彭凤高', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f8a8d0-b8bb-11e8-9c87-4ccc6add7806', '13689624431', '杨巧家长', '111111', '杨山华', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f8a8d2-b8bb-11e8-b6b2-4ccc6add7806', '18683878883', '张雨萌家长', '111111', '张斌', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f8a8d4-b8bb-11e8-b5e8-4ccc6add7806', '13550632854', '黄诗仪家长', '111111', '黄波', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f8cfc6-b8bb-11e8-82fb-4ccc6add7806', '15266253808', '胡琳媛家长', '111111', '胡达辉', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f8cfc8-b8bb-11e8-b28d-4ccc6add7806', '15928302208', '张鑫月家长', '111111', '张学全', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f8cfca-b8bb-11e8-81f5-4ccc6add7806', '18283812650', '肖海悦家长', '111111', '肖新元', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f8f6ba-b8bb-11e8-ad66-4ccc6add7806', '18781108719', '唐乙超家长', '111111', '唐理勇', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f8f6bc-b8bb-11e8-a259-4ccc6add7806', '13508010818', '刘孙梦阳家长', '111111', '刘兴波', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f91db0-b8bb-11e8-bf5c-4ccc6add7806', '15984900329', '白咏霜家长', '111111', '白海洪', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f91db2-b8bb-11e8-bb9b-4ccc6add7806', '15283882172', '王毅家长', '111111', '王俊', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f91db4-b8bb-11e8-848b-4ccc6add7806', '13458990971', '杨文豪家长', '111111', '杨寿臣', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f944a6-b8bb-11e8-a456-4ccc6add7806', '13778234430', '蒋童心家长', '111111', '蒋小庆', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f944a8-b8bb-11e8-90e1-4ccc6add7806', '13154488880', '佘思睿家长', '111111', '佘平', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f944aa-b8bb-11e8-bfe6-4ccc6add7806', '15183820177', '胡梦涵家长', '111111', '张翠', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f96b9c-b8bb-11e8-aed6-4ccc6add7806', '15378113750', '康琪馨家长', '111111', '康中廷', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f96b9e-b8bb-11e8-92ad-4ccc6add7806', '13981023842', '瞿欣宇家长', '111111', '瞿波', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f9928c-b8bb-11e8-a162-4ccc6add7806', '15196390875', '刘钰熙家长', '111111', '刘小东', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f9928e-b8bb-11e8-bc6d-4ccc6add7806', '18683828760', '陈诗妍家长', '111111', '陈军', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f99290-b8bb-11e8-89c0-4ccc6add7806', '13350591801', '张雪松家长', '111111', '张登林', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f9b986-b8bb-11e8-ab85-4ccc6add7806', '18608115189', '杨仪家长', '111111', '杨彬', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f9b988-b8bb-11e8-a86c-4ccc6add7806', '15983824472', '袁鹏家长', '111111', '袁邦林', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f9b98a-b8bb-11e8-a337-4ccc6add7806', '13408383683', '刘亿家长', '111111', '刘双全', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f9e07a-b8bb-11e8-9a96-4ccc6add7806', '15386687731', '程维乾家长', '111111', '程玖平', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f9e07c-b8bb-11e8-b887-4ccc6add7806', '18208563839', '张正航家长', '111111', '张生才', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95f9e07e-b8bb-11e8-8ced-4ccc6add7806', '15892463067', '刘诗雨家长', '111111', '刘光伟', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fa076e-b8bb-11e8-b402-4ccc6add7806', '18090000256', '吴立鹏家长', '111111', '吴先令', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fa0770-b8bb-11e8-b00d-4ccc6add7806', '13340855831', '刘宇恒家长', '111111', '刘建松', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fa2e64-b8bb-11e8-ba34-4ccc6add7806', '15883820020', '尹明娜家长', '111111', '尹强', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fa2e66-b8bb-11e8-a149-4ccc6add7806', '15282808147', '张国存家长', '111111', '张小军', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fa2e68-b8bb-11e8-87c9-4ccc6add7806', '13547045132', '林俊鹏家长', '111111', '林高勇', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fa555c-b8bb-11e8-9295-4ccc6add7806', '15181044362', '敬娅琪家长', '111111', '敬国碧', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fa555e-b8bb-11e8-b8d9-4ccc6add7806', '13088186515', '唐文捷家长', '111111', '唐忠明', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fa5560-b8bb-11e8-a15e-4ccc6add7806', '13419009701', '杨正涛家长', '111111', '杨学勇', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fa7c52-b8bb-11e8-b0a7-4ccc6add7806', '18090049335', '周雅馨家长', '111111', '周军', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fa7c54-b8bb-11e8-920d-4ccc6add7806', '13628104452', '黄雅丽家长', '111111', '袁胜美', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95faa346-b8bb-11e8-b97c-4ccc6add7806', '15196385167', '何玉倩家长', '111111', '叶先春', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95faa348-b8bb-11e8-adc5-4ccc6add7806', '18781067732', '雷雨涵家长', '111111', '杨丽', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95faa34a-b8bb-11e8-9fbb-4ccc6add7806', '18048073305', '李鑫琰家长', '111111', '黎元素', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95faca38-b8bb-11e8-90d2-4ccc6add7806', '18728051227', '万锐家长', '111111', '任科', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95faca3a-b8bb-11e8-b43a-4ccc6add7806', '15283859984', '刘欣宇家长', '111111', '刘强', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95faca3c-b8bb-11e8-9eaf-4ccc6add7806', '15883829670', '康思雨家长', '111111', '康正军', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95faf12e-b8bb-11e8-8e4f-4ccc6add7806', '15983811903', '唐希家长', '111111', '唐波', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95faf130-b8bb-11e8-969b-4ccc6add7806', '18783820367', '龙晓暄家长', '111111', '罗婷', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95faf132-b8bb-11e8-a52b-4ccc6add7806', '13540820715', '郑心怡家长', '111111', '郑小军', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fb1824-b8bb-11e8-a345-4ccc6add7806', '13550642267', '张晴家长', '111111', '张远贵', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fb1826-b8bb-11e8-8cb2-4ccc6add7806', '18283835731', '唐雨薇家长', '111111', '唐春荣', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fb3f1a-b8bb-11e8-8bcd-4ccc6add7806', '13547092057', '袁俊逸家长', '111111', '袁华刚', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fb3f1c-b8bb-11e8-a05b-4ccc6add7806', '13547098318', '周湘家长', '111111', '周禄军', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fb3f1e-b8bb-11e8-9600-4ccc6add7806', '13541712882', '曾志文家长', '111111', '曾军', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fb6610-b8bb-11e8-946d-4ccc6add7806', '13541718202', '常欣蕊家长', '111111', '常小军', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fb6612-b8bb-11e8-83b4-4ccc6add7806', '13378132627', '李宇航家长', '111111', '袁兴凤', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fb6614-b8bb-11e8-942e-4ccc6add7806', '13558778992', '张锦家长', '111111', '张军', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fb8d06-b8bb-11e8-a232-4ccc6add7806', '13558778992', '张鑫家长', '111111', '张军', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fb8d08-b8bb-11e8-87ad-4ccc6add7806', '18190069764', '吴纤纤家长', '111111', '张建平', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fbb3fa-b8bb-11e8-9d1d-4ccc6add7806', '13980188383', '高君豪家长', '111111', '高平', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fbb3fc-b8bb-11e8-abd9-4ccc6add7806', '15182388178', '刘宝林家长', '111111', '刘忠贵', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fbb3fe-b8bb-11e8-aa8e-4ccc6add7806', '15281480302', '龚云家长', '111111', '刘蓉', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fbdaee-b8bb-11e8-9f35-4ccc6add7806', '18281060806', '杜佳熹家长', '111111', '杜志光', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fbdaf0-b8bb-11e8-869e-4ccc6add7806', '15884295070', '曾飞扬家长', '111111', '胡蓉', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fbdaf2-b8bb-11e8-8ae4-4ccc6add7806', '18090764195', '吉阳琴家长', '111111', '吉庆刚', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fc01e4-b8bb-11e8-a126-4ccc6add7806', '13548258408', '任康家长', '111111', '任军', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fc01e6-b8bb-11e8-9998-4ccc6add7806', '15183689117', '龙斌家长', '111111', '龙小军', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fc01e8-b8bb-11e8-a6c2-4ccc6add7806', '13350586387', '杨若菲家长', '111111', '杨运华', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fc28da-b8bb-11e8-9a68-4ccc6add7806', '18683840826', '翟宇帆家长', '111111', '翟小清', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fc28dc-b8bb-11e8-891c-4ccc6add7806', '15983818634', '杨一帆家长', '111111', '杨建', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fc4fd0-b8bb-11e8-b7b6-4ccc6add7806', '15884284814', '赵美珍家长', '111111', '廖飞兰', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fc4fd2-b8bb-11e8-9e72-4ccc6add7806', '18090788412', '王万铭家长', '111111', '朱近荣', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fc4fd4-b8bb-11e8-a771-4ccc6add7806', '18281071775', '张锐家长', '111111', '窦春发', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fc76c6-b8bb-11e8-b713-4ccc6add7806', '13808108591', '黄敏家长', '111111', '翟友碧', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fc76c8-b8bb-11e8-a47a-4ccc6add7806', '15283831113', '陈妍溪家长', '111111', '许小磊', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fc76ca-b8bb-11e8-bd4d-4ccc6add7806', '13568237032', '陈以乐家长', '111111', '陈世林', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fc9dba-b8bb-11e8-8212-4ccc6add7806', '13018196469', '董若薇家长', '111111', '董伟', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fc9dbc-b8bb-11e8-974e-4ccc6add7806', '15008390832', '龚欣颜家长', '111111', '龚兵', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fcc4b0-b8bb-11e8-82e1-4ccc6add7806', '13438039585', '郭峻宏家长', '111111', '郭洪安', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fcc4b2-b8bb-11e8-94e7-4ccc6add7806', '15183821600', '何芷怡家长', '111111', '何明星', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fcc4b4-b8bb-11e8-9b90-4ccc6add7806', '13458966607', '黄嘉逸家长', '111111', '徐春梅', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fceba2-b8bb-11e8-9194-4ccc6add7806', '15008367187', '黄梦曦家长', '111111', '黄华华', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fceba4-b8bb-11e8-817e-4ccc6add7806', '15308104005', '蒋雨淇家长', '111111', '蒋禄熊', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fceba6-b8bb-11e8-ae96-4ccc6add7806', '15982923616', '李刘洛祺家长', '111111', '李成谷', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fd1298-b8bb-11e8-b2c2-4ccc6add7806', '15883441788', '廖虹竣家长', '111111', '廖飞跃', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fd129a-b8bb-11e8-860b-4ccc6add7806', '13568419606', '刘可怡家长', '111111', '谢丹', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fd129c-b8bb-11e8-a3ab-4ccc6add7806', '13388121928', '刘思菡家长', '111111', '刘建国', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fd398c-b8bb-11e8-8142-4ccc6add7806', '15181058730', '刘心月家长', '111111', '刘应平', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fd398e-b8bb-11e8-9f00-4ccc6add7806', '13735336034', '刘语竹家长', '111111', '刘勇', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fd6086-b8bb-11e8-bc20-4ccc6add7806', '13708102186', '潘蕙茹家长', '111111', '潘伟', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fd6088-b8bb-11e8-bfe2-4ccc6add7806', '13547098640', '彭芯雨家长', '111111', '彭元庆', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fd608a-b8bb-11e8-ab11-4ccc6add7806', '15883658673', '彭雨涵家长', '111111', '彭亮', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fd8778-b8bb-11e8-8be8-4ccc6add7806', '15370766682', '秦俊熙家长', '111111', '秦福林', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fd877a-b8bb-11e8-b7d5-4ccc6add7806', '18016102405', '钱乐天家长', '111111', '钱勋', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fd877c-b8bb-11e8-b250-4ccc6add7806', '15283808272', '秦茹雪家长', '111111', '秦龙', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fdae6e-b8bb-11e8-bb5a-4ccc6add7806', '18221663282', '卿研涔家长', '111111', '卿伟', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fdae70-b8bb-11e8-a73f-4ccc6add7806', '13419016740', '佘佳馨家长', '111111', '佘富强', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fdd564-b8bb-11e8-b7cd-4ccc6add7806', '1820541677', '唐齐松家长', '111111', '唐玉军', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fdd566-b8bb-11e8-9f54-4ccc6add7806', '15984931909', '唐智宸家长', '111111', '黄小波', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fdd568-b8bb-11e8-aada-4ccc6add7806', '17308187276', '王艺澄家长', '111111', '王伦强', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fdfc5c-b8bb-11e8-9594-4ccc6add7806', '18090008243', '王钰辰轩家长', '111111', '王利全', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fdfc5e-b8bb-11e8-8529-4ccc6add7806', '13309023503', '王梓豪家长', '111111', '王祥勤', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fdfc60-b8bb-11e8-b723-4ccc6add7806', '18382151094', '吴楷瑞家长', '111111', '吴世成', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fe234c-b8bb-11e8-b1e0-4ccc6add7806', '13541702307', '肖子淳佳家长', '111111', '肖红兵', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fe234e-b8bb-11e8-a1c8-4ccc6add7806', '17709085820', '谢尹朋家长', '111111', '谢启勇', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fe4a46-b8bb-11e8-92d7-4ccc6add7806', '15282826200', '徐顺薪荣家长', '111111', '徐勇', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fe4a48-b8bb-11e8-8ad5-4ccc6add7806', '13508010653', '杨梓彤家长', '111111', '杨斌', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fe4a4a-b8bb-11e8-b93e-4ccc6add7806', '15282817931', '尹君哲家长', '111111', '尹刚', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fe7138-b8bb-11e8-b7f1-4ccc6add7806', '15183812712', '余铭轩家长', '111111', '余兵', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fe713a-b8bb-11e8-a9d8-4ccc6add7806', '15283877019', '袁慧辛家长', '111111', '袁强', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fe713c-b8bb-11e8-932d-4ccc6add7806', '18048626078', '袁子涵家长', '111111', '袁建', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fe982e-b8bb-11e8-b7fa-4ccc6add7806', '13678382139', '翟佳乐家长', '111111', '翟志辉', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fe9830-b8bb-11e8-af26-4ccc6add7806', '13626650915', '张斐洁家长', '111111', '张成勇', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fe9832-b8bb-11e8-9445-4ccc6add7806', '13778238920', '张恒嘉家长', '111111', '张弟强', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95febf24-b8bb-11e8-b7d3-4ccc6add7806', '15957363665', '张鎧家长', '111111', '张志远', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95febf26-b8bb-11e8-80f4-4ccc6add7806', '13658157861', '张毅家长', '111111', '张华', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fee61a-b8bb-11e8-9bfd-4ccc6add7806', '13778406637', '张煜晨家长', '111111', '张庭波', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fee61c-b8bb-11e8-b744-4ccc6add7806', '15196346898', '张振洋家长', '111111', '张程程', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fee61e-b8bb-11e8-82c6-4ccc6add7806', '13689619668', '张钟续家长', '111111', '张大全', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ff0d10-b8bb-11e8-89cb-4ccc6add7806', '15282852508', '周建锟家长', '111111', '周华斌', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ff0d12-b8bb-11e8-9054-4ccc6add7806', '13648101836', '周子涵家长', '111111', '周俊', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ff0d14-b8bb-11e8-8b55-4ccc6add7806', '15282838022', '左峻滔家长', '111111', '张芝芝', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ff3406-b8bb-11e8-8141-4ccc6add7806', '18067155686', '尹华天家长', '111111', '尹显兵', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ff3408-b8bb-11e8-b98f-4ccc6add7806', '13398486075', '贾梦茜家长', '111111', '贾云武', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ff340a-b8bb-11e8-91cc-4ccc6add7806', '13980241866', '谢鸿宇家长', '111111', '谢多培', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ff5afa-b8bb-11e8-bbba-4ccc6add7806', '18283871293', '容文轩家长', '111111', '容桂元', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ff5afc-b8bb-11e8-a6f4-4ccc6add7806', '15282853572', '杨瑾萱家长', '111111', '杨宽', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ff81ee-b8bb-11e8-9a92-4ccc6add7806', '15181007006', '吉心怡家长', '111111', '吉庆林', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ff81f0-b8bb-11e8-9cca-4ccc6add7806', '13388133737', '王岑旭家长', '111111', '詹小庆', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ff81f2-b8bb-11e8-a2b2-4ccc6add7806', '15882865280', '吴语轩家长', '111111', '吴文强', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ffa8e4-b8bb-11e8-933b-4ccc6add7806', '13890249092', '唐若菲家长', '111111', '唐建', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ffa8e6-b8bb-11e8-9528-4ccc6add7806', '18283878635', '黄心悦家长', '111111', '黄刚', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ffa8e8-b8bb-11e8-b6f9-4ccc6add7806', '15883434750', '秦雨汐家长', '111111', '秦福敏', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ffcfda-b8bb-11e8-941b-4ccc6add7806', '13309020848', '宋雅茹家长', '111111', '宋元陆', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ffcfdc-b8bb-11e8-84ca-4ccc6add7806', '13154478669', '张芷菡家长', '111111', '张君', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95ffcfde-b8bb-11e8-a9a2-4ccc6add7806', '13548263392', '刘紫雨家长', '111111', '刘孙勇', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fff6d1-b8bb-11e8-b228-4ccc6add7806', '13778250278', '袁晗昱家长', '111111', '何梅', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('95fff6d3-b8bb-11e8-a336-4ccc6add7806', '13108386886', '杨鑫蕊家长', '111111', '杨志', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96001dc6-b8bb-11e8-833a-4ccc6add7806', '13890285074', '曹兰家长', '111111', '曹建华', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96001dc8-b8bb-11e8-8931-4ccc6add7806', '13118123561', '宋芷晗家长', '111111', '宋刚', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96001dca-b8bb-11e8-95bf-4ccc6add7806', '18111572022', '唐瑾绾月家长', '111111', '唐智辉', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('960044ba-b8bb-11e8-a176-4ccc6add7806', '13118112797', '邓嘉琪家长', '111111', '邓波', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('960044bc-b8bb-11e8-95f7-4ccc6add7806', '182280595985', '谢宇辰家长', '111111', '谢述勇', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('960044be-b8bb-11e8-b75b-4ccc6add7806', '13518261651', '张洋铭家长', '111111', '张志豪', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96006bb0-b8bb-11e8-9334-4ccc6add7806', '13689629008', '袁龙一家长', '111111', '袁邦金', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96006bb2-b8bb-11e8-a0e0-4ccc6add7806', '15884288590', '秦宇航家长', '111111', '秦德斌', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('960092a6-b8bb-11e8-9a52-4ccc6add7806', '18859265861', '刘星家长', '111111', '刘显文', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('960092a8-b8bb-11e8-9a2b-4ccc6add7806', '15681008871', '杨鹏家长', '111111', '杨仁东', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('960092aa-b8bb-11e8-9303-4ccc6add7806', '18981030818', '王子轩家长', '111111', '刘昌俊', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9600b99c-b8bb-11e8-a320-4ccc6add7806', '18016122513', '唐其熠家长', '111111', '唐新民', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9600b99e-b8bb-11e8-84e0-4ccc6add7806', '15982332108', '钟浩天家长', '111111', '钟智', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9600b9a0-b8bb-11e8-a704-4ccc6add7806', '18280552295', '吉雅辰家长', '111111', '张扬', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9600e092-b8bb-11e8-9839-4ccc6add7806', '15984943274', '陈彬家长', '111111', '陈明富', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9600e094-b8bb-11e8-bd00-4ccc6add7806', '15283811008', '郑宇哲家长', '111111', '郑生兵', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9600e096-b8bb-11e8-a49b-4ccc6add7806', '18180386891', '卓胜伟家长', '111111', '卓亮', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96010782-b8bb-11e8-88c6-4ccc6add7806', '15883680890', '张健铭家长', '111111', '高倩倩', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96010784-b8bb-11e8-9037-4ccc6add7806', '13980640436', '所日辉布家长', '111111', '所日五支', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96012e78-b8bb-11e8-8193-4ccc6add7806', '13518266932', '方博韬家长', '111111', '方孝林', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96012e7a-b8bb-11e8-8341-4ccc6add7806', '15183680897', '张鑫昊家长', '111111', '张勇', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96012e7c-b8bb-11e8-915d-4ccc6add7806', '15328109752', '何圲家长', '111111', '何绪韦', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9601556e-b8bb-11e8-bf2e-4ccc6add7806', '15008389845', '夏欣怡家长', '111111', '夏华洲', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96015570-b8bb-11e8-9098-4ccc6add7806', '13309029270', '彭缘豪家长', '111111', '彭乡礼', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96015572-b8bb-11e8-90a5-4ccc6add7806', '13183426255', '黄君池家长', '111111', '黄春', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96017c64-b8bb-11e8-992f-4ccc6add7806', '-1', '邓可馨家长', '111111', '', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96017c66-b8bb-11e8-8c90-4ccc6add7806', '-2', '王凌家长', '111111', '', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9601a35a-b8bb-11e8-86c1-4ccc6add7806', '-3', '姚志远家长', '111111', '', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9601a35c-b8bb-11e8-bc42-4ccc6add7806', '-4', '黄雨涵家长', '111111', '', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9601a35e-b8bb-11e8-a84c-4ccc6add7806', '-5', '李睿捷家长', '111111', '', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9601ca4c-b8bb-11e8-a39d-4ccc6add7806', '-6', '丰文轩家长', '111111', '', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9601ca4e-b8bb-11e8-b426-4ccc6add7806', '13388136955', '邹星语家长', '111111', '邹年敏', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9601ca50-b8bb-11e8-9154-4ccc6add7806', '18113628816', '廖芮涵家长', '111111', '廖军', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9601f142-b8bb-11e8-85df-4ccc6add7806', '15183675611', '杨羽菲家长', '111111', '杨勇', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9601f144-b8bb-11e8-ad36-4ccc6add7806', '13547010714', '周梦瑶家长', '111111', '周斌', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9601f146-b8bb-11e8-be97-4ccc6add7806', '15609024866', '田沛珊家长', '111111', '田文文', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9602183a-b8bb-11e8-9a18-4ccc6add7806', '15982905150', '赵研兮家长', '111111', '赵子强', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9602183c-b8bb-11e8-994b-4ccc6add7806', '18981010057', '李雨涵家长', '111111', '李  闯', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96023f2e-b8bb-11e8-9101-4ccc6add7806', '17311835358', '赵子华家长', '111111', '赵  刚', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96023f30-b8bb-11e8-95ca-4ccc6add7806', '13648101027', '卿婉婷家长', '111111', '卿三华', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96023f32-b8bb-11e8-b773-4ccc6add7806', '17313414337', '甘香怡家长', '111111', '甘德平', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96026624-b8bb-11e8-bdda-4ccc6add7806', '15196342159', '王雨萱家长', '111111', '王小成', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96026626-b8bb-11e8-8bc7-4ccc6add7806', '13990256107', '林鑫羽家长', '111111', '林超', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96026628-b8bb-11e8-90ca-4ccc6add7806', '15283804644', '夏可欣家长', '111111', '张艳', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96028d1a-b8bb-11e8-8f31-4ccc6add7806', '13778265270', '李浩天家长', '111111', '詹莉', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96028d1c-b8bb-11e8-81c2-4ccc6add7806', '15883664229', '李易杭家长', '111111', '李本成', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96028d1e-b8bb-11e8-a479-4ccc6add7806', '13408383701', '雷坤家长', '111111', '雷陈成', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9602b412-b8bb-11e8-9a19-4ccc6add7806', '18048070023', '刘文栋家长', '111111', '刘天林', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9602b414-b8bb-11e8-b27a-4ccc6add7806', '13778280229', '曾子鑫家长', '111111', '曾林', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9602db06-b8bb-11e8-9a25-4ccc6add7806', '13550641091', '尹宏轩家长', '111111', '尹彦华', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9602db08-b8bb-11e8-99d9-4ccc6add7806', '15378113034', '袁新洋家长', '111111', '袁安华', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9602db0a-b8bb-11e8-8c8d-4ccc6add7806', '15390151327', '龚楚源家长', '111111', '龚天燕', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('960301fa-b8bb-11e8-a711-4ccc6add7806', '15884291816', '田晨瀚家长', '111111', '田强', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('960301fc-b8bb-11e8-8afa-4ccc6add7806', '18280546494', '邱浩天家长', '111111', '邱朝荣', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('960301fe-b8bb-11e8-b78d-4ccc6add7806', '15308270255', '刘文昊家长', '111111', '刘  姣', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('960328f4-b8bb-11e8-9efc-4ccc6add7806', '18161311255', '王梓涵家长', '111111', '席森山', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('960328f6-b8bb-11e8-a503-4ccc6add7806', '18783802151', '罗郡贤家长', '111111', '罗  华', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96034fe4-b8bb-11e8-88cb-4ccc6add7806', '13198882436', '周苗棵家长', '111111', '周  成', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96034fe6-b8bb-11e8-bcc6-4ccc6add7806', '13778231510', '唐山乂家长', '111111', '唐诗文', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96034fe8-b8bb-11e8-9b35-4ccc6add7806', '15883406573', '蔡立涛家长', '111111', '黄仁秋', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('960376da-b8bb-11e8-b598-4ccc6add7806', '15983812278', '黄备家长', '111111', '黄泽彬', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('960376dc-b8bb-11e8-9b77-4ccc6add7806', '15282832617', '安增皓家长', '111111', '肖文凤', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('960376de-b8bb-11e8-a168-4ccc6add7806', '18190066817', '周浩轩家长', '111111', '周露山', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96039dcc-b8bb-11e8-bead-4ccc6add7806', '13980640436', '所日辉达家长', '111111', '所日五支', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96039dce-b8bb-11e8-961d-4ccc6add7806', '15883854573', '王子龙家长', '111111', '王浩', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96039dd0-b8bb-11e8-8a55-4ccc6add7806', '18190488357', '张宇鑫家长', '111111', '张  勇', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9603c4c6-b8bb-11e8-a89f-4ccc6add7806', '-7', '何诗诗家长', '111111', '', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9603c4c8-b8bb-11e8-b89d-4ccc6add7806', '-8', '唐齐松家长', '111111', '', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9603ebba-b8bb-11e8-8741-4ccc6add7806', '13458960662', '尹子浩家长', '111111', '尹帮旭', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9603ebbc-b8bb-11e8-a7b2-4ccc6add7806', '18728029213', '张怀义家长', '111111', '张小勇', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9603ebbe-b8bb-11e8-8a63-4ccc6add7806', '15892861865', '杨梓廷家长', '111111', '张琴', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('960412b0-b8bb-11e8-95d0-4ccc6add7806', '15883610261', '姚思雨家长', '111111', '姚晓辉', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('960412b2-b8bb-11e8-a241-4ccc6add7806', '18096217127', '周妍家长', '111111', '周禄清', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('960412b4-b8bb-11e8-bb28-4ccc6add7806', '15982946362', '巫雨涵家长', '111111', '巫应冬', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('960439a4-b8bb-11e8-87dc-4ccc6add7806', '15883430337', '苟浠媛家长', '111111', '苟伯银', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('960439a6-b8bb-11e8-a57a-4ccc6add7806', '18283887694', '刘晴汐家长', '111111', '李红梅', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9604609c-b8bb-11e8-a993-4ccc6add7806', '18090007414', '龚雅馨家长', '111111', '龚德超', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9604609e-b8bb-11e8-a0b4-4ccc6add7806', '15183877583', '李双霏家长', '111111', '黄晓英', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('960460a0-b8bb-11e8-9558-4ccc6add7806', '13158685859', '彭元蔚家长', '111111', '彭川东', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9604878c-b8bb-11e8-beb0-4ccc6add7806', '18728032903', '林雨晨家长', '111111', '林诗勇', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9604878e-b8bb-11e8-b4f5-4ccc6add7806', '18084937643', '王曦悦家长', '111111', '王梁', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96048790-b8bb-11e8-836d-4ccc6add7806', '13548257718', '黄雅涵家长', '111111', '黄仁炜', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9604ae82-b8bb-11e8-baa1-4ccc6add7806', '15283878883', '叶紫涵家长', '111111', '叶代清', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9604ae84-b8bb-11e8-8980-4ccc6add7806', '18280539377', '王俊楠家长', '111111', '王涛', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9604ae86-b8bb-11e8-9c4a-4ccc6add7806', '13330873050', '王家馨家长', '111111', '王国春', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9604d578-b8bb-11e8-8d92-4ccc6add7806', '13548267900', '彭宇轩家长', '111111', '彭林', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9604d57a-b8bb-11e8-9e77-4ccc6add7806', '13890263560', '黄泽民家长', '111111', '黄小波', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9604fc6e-b8bb-11e8-9ecf-4ccc6add7806', '17369018320', '田皓轩家长', '111111', '田兵', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9604fc70-b8bb-11e8-a0cc-4ccc6add7806', '15283899118', '钟翊鑫家长', '111111', '钟俊杰', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9604fc72-b8bb-11e8-aa30-4ccc6add7806', '13550635802', '袁顺家长', '111111', '袁邦全', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96052364-b8bb-11e8-8ccb-4ccc6add7806', '15983831409', '唐祥涵家长', '111111', '唐华元', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96052366-b8bb-11e8-b5dd-4ccc6add7806', '17369030973', '王源彬家长', '111111', '王  淋', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96052368-b8bb-11e8-810b-4ccc6add7806', '15884250157', '李子辰家长', '111111', '邓巧', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96054a5e-b8bb-11e8-b37a-4ccc6add7806', '15881462543', '钟学庆家长', '111111', '钟才民', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96054a60-b8bb-11e8-a47e-4ccc6add7806', '18111756299', '罗耀家长', '111111', '罗先勇', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96054a62-b8bb-11e8-8d80-4ccc6add7806', '18781021867', '张子涵家长', '111111', '张小龙', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96057150-b8bb-11e8-b5ad-4ccc6add7806', '15883863547', '周宇轩家长', '111111', '周寿明', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96057152-b8bb-11e8-ad49-4ccc6add7806', '15883425502', '宾辰熙家长', '111111', '唐世路', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96059842-b8bb-11e8-b103-4ccc6add7806', '15982902770', '徐嘉豪家长', '111111', '徐建', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96059844-b8bb-11e8-a34a-4ccc6add7806', '18781006348', '尹城浩家长', '111111', '尹健', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96059846-b8bb-11e8-aa3e-4ccc6add7806', '18783862994', '魏鑫余家长', '111111', '魏勇', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9605bf3a-b8bb-11e8-81cb-4ccc6add7806', '15386687525', '鲁馨瑶家长', '111111', '饶利丽', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9605bf3c-b8bb-11e8-971b-4ccc6add7806', '-9', '田文昊家长', '111111', '未知', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9605bf3e-b8bb-11e8-9958-4ccc6add7806', '-10', '刘宇轩家长', '111111', '', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9605e62e-b8bb-11e8-a111-4ccc6add7806', '15150228289', '宋思宇家长', '111111', '张红梅', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('9605e630-b8bb-11e8-a513-4ccc6add7806', '13981081347', '唐发强家长', '111111', '唐万国', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96060d24-b8bb-11e8-8b3a-4ccc6add7806', '-11', '刘紓恒家长', '111111', '', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96060d26-b8bb-11e8-bd2b-4ccc6add7806', '-12', '杨政霖家长', '111111', '', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('96060d28-b8bb-11e8-afeb-4ccc6add7806', '13990239535', '石俊鑫家长', '111111', '石从庆', '100001', 2, 3, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97ae7c80-b8ba-11e8-9972-4ccc6add7806', '13890222530', '钱继光', '111111', '校长', '100001', 1, 1, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97aed070-b8ba-11e8-a62a-4ccc6add7806', '13883692852', '叶利萍', '111111', '教务处主任', '100001', 1, 1, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97aed073-b8ba-11e8-840d-4ccc6add7806', '13990268862', '张旭德', '111111', '行政后勤', '100001', 1, 1, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97aeee68-b8ba-11e8-a32f-4ccc6add7806', '13088340316', '张铀', '111111', '教务处副主任', '100001', 1, 1, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97aeee6c-b8ba-11e8-9735-4ccc6add7806', '13550651300', '张大双', '111111', '幼儿园副园长', '100001', 1, 1, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97aeee6d-b8ba-11e8-94a5-4ccc6add7806', '13568230656', '陈曦', '111111', '行政后勤', '100001', 1, 1, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97aeee6e-b8ba-11e8-9349-4ccc6add7806', '15008396157', '王辉', '111111', '副校长', '100001', 1, 1, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97aeee6f-b8ba-11e8-8a75-4ccc6add7806', '13881026826', '刘培贵', '111111', '行政后勤', '100001', 1, 1, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97aeee75-b8ba-11e8-b569-4ccc6add7806', '13568220337', '张学军', '111111', '行政后勤', '100001', 1, 1, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97aeee7c-b8ba-11e8-866c-4ccc6add7806', '13881093978', '张翠华', '111111', '幼儿园园长', '100001', 1, 1, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97aeee7f-b8ba-11e8-84a4-4ccc6add7806', '15008369397', '刘晓丽', '111111', '校会计', '100001', 1, 1, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97aeee81-b8ba-11e8-a155-4ccc6add7806', '13547058576', '邹永沛', '111111', '行政后勤', '100001', 1, 1, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97aeee82-b8ba-11e8-8da8-4ccc6add7806', '13881080781', '张晓英★', '111111', '一年级一班', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97aeee84-b8ba-11e8-bd9d-4ccc6add7806', '15008329212', '凌宗雪★', '111111', '一年级二班', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97aeee86-b8ba-11e8-9c7a-4ccc6add7806', '18281006187', '杨晓雪★', '111111', '一年级三班', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97aeee88-b8ba-11e8-bfd8-4ccc6add7806', '15181083332', '唐德芬★', '111111', '二年级一班', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97aeee8a-b8ba-11e8-86d5-4ccc6add7806', '18016146331', '罗洁★', '111111', '二年级二班', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97aeee8c-b8ba-11e8-b0bb-4ccc6add7806', '15283813962', '武茜★', '111111', '三年级一班', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97aeee8e-b8ba-11e8-806a-4ccc6add7806', '13890201712', '黄敏★', '111111', '三年级二班(语文组组长)', '100001', 1, 1, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97aeee90-b8ba-11e8-ba65-4ccc6add7806', '13990290219', '李晨', '111111', '三年级三班', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97aeee92-b8ba-11e8-8aa2-4ccc6add7806', '15928311822', '梁晓琴★', '111111', '四年级一班', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97aeee94-b8ba-11e8-ad90-4ccc6add7806', '18090058616', '黄瑞雪★', '111111', '四年级二班', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97aeee96-b8ba-11e8-b584-4ccc6add7806', '15008394383', '朱炳琴★', '111111', '四年级三班', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af1558-b8ba-11e8-bee0-4ccc6add7806', '18283814889', '刘洛佳★', '111111', '五年级一班', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af155a-b8ba-11e8-a4a6-4ccc6add7806', '15883649015', '邓传蓉★', '111111', '五年级二班', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af155c-b8ba-11e8-9b90-4ccc6add7806', '13698193437', '高勋容★', '111111', '六年级一班', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af155e-b8ba-11e8-9415-4ccc6add7806', '13890249564', '曾婷', '111111', '六年级二班', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af1561-b8ba-11e8-9435-4ccc6add7806', '15108139686', '唐术琼★', '111111', '一年级四班', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af1563-b8ba-11e8-ab20-4ccc6add7806', '18908104160', '魏林琳★', '111111', '二年级三班', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af1565-b8ba-11e8-ab5c-4ccc6add7806', '13547058519', '廖世勇★', '111111', '五年级三班', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af1567-b8ba-11e8-a1a1-4ccc6add7806', '13990272730', '郑琪★', '111111', '六年级三班', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af156a-b8ba-11e8-bfb9-4ccc6add7806', '18981000638', '唐亮', '111111', '一年级一班', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af156e-b8ba-11e8-aec2-4ccc6add7806', '18781015916', '刘芮', '111111', '一年级三班', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af1573-b8ba-11e8-a99a-4ccc6add7806', '13568225763', '邓诗新', '111111', '二年级一班', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af1576-b8ba-11e8-b2b2-4ccc6add7806', '15228383990', '张雪梅', '111111', '三年级一班', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af1579-b8ba-11e8-a479-4ccc6add7806', '15883631982', '唐艳蓉★', '111111', '三年级三班', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af157b-b8ba-11e8-bd0b-4ccc6add7806', '13419033732', '王露英', '111111', '四年级一班', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af157e-b8ba-11e8-a0d2-4ccc6add7806', '13708100862', '向晟杰', '111111', '四年级三班', '100001', 1, 1, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af1581-b8ba-11e8-8a01-4ccc6add7806', '18398610492', '缪田', '111111', '五年级一班', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af1588-b8ba-11e8-86ba-4ccc6add7806', '18408269238', '黄思思', '111111', '五年级二班', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af158c-b8ba-11e8-9877-4ccc6add7806', '13547045790', '肖大兴', '111111', '六年级一班', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af3c80-b8ba-11e8-a9ea-4ccc6add7806', '18981040303', '万小花★', '111111', '六年级二班(数组组长)', '100001', 1, 1, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af3c83-b8ba-11e8-860f-4ccc6add7806', '18281092385', '张贞玲', '111111', '一年级四班', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af3c86-b8ba-11e8-aefd-4ccc6add7806', '13778435118', '唐文琪', '111111', '五年级三班', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af3c89-b8ba-11e8-8ec6-4ccc6add7806', '13096299013', '彭成进', '111111', '体育教师', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af3c8d-b8ba-11e8-a9a5-4ccc6add7806', '18282030093', '宋平', '111111', '美术教师(综合组组长)', '100001', 1, 1, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/1537203027796-E39pWft5C.jpg');
INSERT INTO `client_user` VALUES ('97af3c93-b8ba-11e8-9ed9-4ccc6add7806', '15982903565', '尹世富', '111111', '体育教师', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af3c98-b8ba-11e8-bd05-4ccc6add7806', '15882463429', '陈秀', '111111', '英语教师', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af3c9e-b8ba-11e8-befd-4ccc6add7806', '15883660537', '杨晶伟', '111111', '美术教师', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af3ca6-b8ba-11e8-ada3-4ccc6add7806', '15982903192', '卓训龙', '111111', '科学教师', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af3caf-b8ba-11e8-85be-4ccc6add7806', '15008438067', '万黎', '111111', '英语教师', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af3cb9-b8ba-11e8-bcc0-4ccc6add7806', '13890205226', '陈洪', '111111', '科学教师', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af3cbf-b8ba-11e8-81b6-4ccc6add7806', '18048086793', '廖雨渟', '111111', '体育教师', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af3cc5-b8ba-11e8-9b27-4ccc6add7806', '13547004205', '唐诗琪', '111111', '音乐教师', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af6348-b8ba-11e8-84e7-4ccc6add7806', '18408230756', '彭添悦', '111111', '音乐教师', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af6630-b8ba-11e8-b453-4ccc6add7806', '18280930886', '袁静', '111111', '音乐教师', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af6636-b8ba-11e8-afdf-4ccc6add7806', '13547015890', '张红', '111111', '美术教师', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af663e-b8ba-11e8-be7d-4ccc6add7806', '17738335525', '张兴颖', '111111', '英语教师', '100001', 1, 2, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af6644-b8ba-11e8-8c5e-4ccc6add7806', '13096450285', '刘友德', '111111', '保安 ', '100001', 1, 4, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af6645-b8ba-11e8-94f7-4ccc6add7806', '13698197881', '杨友军', '111111', '保安 ', '100001', 1, 4, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af6646-b8ba-11e8-8611-4ccc6add7806', '13908103749', '卿上吉', '111111', '保安 ', '100001', 1, 4, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af6647-b8ba-11e8-a67b-4ccc6add7806', '13508019468', '罗芳宣', '111111', '保洁', '100001', 1, 4, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af6648-b8ba-11e8-8ddc-4ccc6add7806', '13419041979', '陈莉', '111111', '保洁', '100001', 1, 4, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af6649-b8ba-11e8-ad9f-4ccc6add7806', '13795913629', '刘培汉', '111111', '保安 ', '100001', 1, 4, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af664a-b8ba-11e8-91d5-4ccc6add7806', '13689630125', '袁安全', '111111', '保安 ', '100001', 1, 4, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af664b-b8ba-11e8-9b68-4ccc6add7806', '13550641343', '石长伍', '111111', '保安 ', '100001', 1, 4, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af664c-b8ba-11e8-80e2-4ccc6add7806', '13547045790', '刘小莉', '111111', '保洁', '100001', 1, 4, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');
INSERT INTO `client_user` VALUES ('97af664d-b8ba-11e8-ace2-4ccc6add7806', '13700901853', '钟玉春', '111111', '资料打印', '100001', 1, 4, 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png');

-- ----------------------------
-- Table structure for client_user_class
-- ----------------------------
DROP TABLE IF EXISTS `client_user_class`;
CREATE TABLE `client_user_class`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `class_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of client_user_class
-- ----------------------------
INSERT INTO `client_user_class` VALUES ('95dbbeba-b8bb-11e8-a1ef-4ccc6add7806', '95db49dc-b8bb-11e8-924a-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dbbebc-b8bb-11e8-a18d-4ccc6add7806', '95dbbebb-b8bb-11e8-93ef-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dbbebe-b8bb-11e8-9a43-4ccc6add7806', '95dbbebd-b8bb-11e8-aea8-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dbe5b5-b8bb-11e8-a5b8-4ccc6add7806', '95dbe5b4-b8bb-11e8-b1d2-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dbe5b7-b8bb-11e8-8345-4ccc6add7806', '95dbe5b6-b8bb-11e8-b1ac-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dbe5b9-b8bb-11e8-95aa-4ccc6add7806', '95dbe5b8-b8bb-11e8-bf50-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dc0ca5-b8bb-11e8-b487-4ccc6add7806', '95dc0ca4-b8bb-11e8-9303-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dc0ca7-b8bb-11e8-ba41-4ccc6add7806', '95dc0ca6-b8bb-11e8-848c-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dc339f-b8bb-11e8-9635-4ccc6add7806', '95dc339e-b8bb-11e8-a128-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dc33a1-b8bb-11e8-a121-4ccc6add7806', '95dc33a0-b8bb-11e8-8385-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dc33a3-b8bb-11e8-8f1a-4ccc6add7806', '95dc33a2-b8bb-11e8-83ba-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dc5a91-b8bb-11e8-8908-4ccc6add7806', '95dc5a90-b8bb-11e8-a27d-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dc5a93-b8bb-11e8-91db-4ccc6add7806', '95dc5a92-b8bb-11e8-9232-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dc5a95-b8bb-11e8-9061-4ccc6add7806', '95dc5a94-b8bb-11e8-b052-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dc8187-b8bb-11e8-bf3f-4ccc6add7806', '95dc8186-b8bb-11e8-b9ac-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dc8189-b8bb-11e8-ae2d-4ccc6add7806', '95dc8188-b8bb-11e8-b42b-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dc818b-b8bb-11e8-8ab4-4ccc6add7806', '95dc818a-b8bb-11e8-9e91-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dca87b-b8bb-11e8-be83-4ccc6add7806', '95dca87a-b8bb-11e8-9ac6-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dca87d-b8bb-11e8-98f1-4ccc6add7806', '95dca87c-b8bb-11e8-9037-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dccf71-b8bb-11e8-99b9-4ccc6add7806', '95dccf70-b8bb-11e8-8f2b-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dccf73-b8bb-11e8-8a19-4ccc6add7806', '95dccf72-b8bb-11e8-aa5f-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dccf75-b8bb-11e8-87fa-4ccc6add7806', '95dccf74-b8bb-11e8-9a6d-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dcf667-b8bb-11e8-8cde-4ccc6add7806', '95dcf666-b8bb-11e8-a021-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dcf669-b8bb-11e8-8dea-4ccc6add7806', '95dcf668-b8bb-11e8-8470-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dcf66b-b8bb-11e8-bee1-4ccc6add7806', '95dcf66a-b8bb-11e8-ac7a-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dd1d5d-b8bb-11e8-a80a-4ccc6add7806', '95dd1d5c-b8bb-11e8-be9a-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dd1d5f-b8bb-11e8-8bba-4ccc6add7806', '95dd1d5e-b8bb-11e8-bb2f-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dd4453-b8bb-11e8-a131-4ccc6add7806', '95dd4452-b8bb-11e8-8cd5-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dd4455-b8bb-11e8-9a25-4ccc6add7806', '95dd4454-b8bb-11e8-9d63-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dd4457-b8bb-11e8-8930-4ccc6add7806', '95dd4456-b8bb-11e8-857f-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dd6b47-b8bb-11e8-af19-4ccc6add7806', '95dd6b46-b8bb-11e8-9689-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dd6b49-b8bb-11e8-8389-4ccc6add7806', '95dd6b48-b8bb-11e8-a793-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dd6b4b-b8bb-11e8-89ef-4ccc6add7806', '95dd6b4a-b8bb-11e8-8d9f-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dd923b-b8bb-11e8-b4fc-4ccc6add7806', '95dd923a-b8bb-11e8-9c79-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dd923d-b8bb-11e8-9727-4ccc6add7806', '95dd923c-b8bb-11e8-b3b5-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dd923f-b8bb-11e8-9f41-4ccc6add7806', '95dd923e-b8bb-11e8-a88d-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95ddb931-b8bb-11e8-a1c9-4ccc6add7806', '95ddb930-b8bb-11e8-9a02-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95ddb933-b8bb-11e8-8938-4ccc6add7806', '95ddb932-b8bb-11e8-90fb-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dde027-b8bb-11e8-870b-4ccc6add7806', '95dde026-b8bb-11e8-a7a9-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dde029-b8bb-11e8-8709-4ccc6add7806', '95dde028-b8bb-11e8-9a3c-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dde02b-b8bb-11e8-be75-4ccc6add7806', '95dde02a-b8bb-11e8-bbeb-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95de071d-b8bb-11e8-a8df-4ccc6add7806', '95de071c-b8bb-11e8-8a53-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95de071f-b8bb-11e8-9bca-4ccc6add7806', '95de071e-b8bb-11e8-9f4a-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95de0721-b8bb-11e8-9110-4ccc6add7806', '95de0720-b8bb-11e8-b2a3-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95de2e13-b8bb-11e8-8777-4ccc6add7806', '95de2e12-b8bb-11e8-b184-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95de2e15-b8bb-11e8-9359-4ccc6add7806', '95de2e14-b8bb-11e8-9b48-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95de2e17-b8bb-11e8-85b9-4ccc6add7806', '95de2e16-b8bb-11e8-b5ed-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95de5509-b8bb-11e8-93ca-4ccc6add7806', '95de5508-b8bb-11e8-83d1-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95de550b-b8bb-11e8-ab64-4ccc6add7806', '95de550a-b8bb-11e8-8684-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95de7bff-b8bb-11e8-b701-4ccc6add7806', '95de7bfe-b8bb-11e8-90d3-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95de7c01-b8bb-11e8-be6f-4ccc6add7806', '95de7c00-b8bb-11e8-8197-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95de7c03-b8bb-11e8-845b-4ccc6add7806', '95de7c02-b8bb-11e8-967c-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dea2ef-b8bb-11e8-984d-4ccc6add7806', '95dea2ee-b8bb-11e8-b36e-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dea2f1-b8bb-11e8-80df-4ccc6add7806', '95dea2f0-b8bb-11e8-b6e5-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dea2f3-b8bb-11e8-b3b0-4ccc6add7806', '95dea2f2-b8bb-11e8-9e64-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dec9e5-b8bb-11e8-8a21-4ccc6add7806', '95dec9e4-b8bb-11e8-8cbd-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95dec9e7-b8bb-11e8-97e6-4ccc6add7806', '95dec9e6-b8bb-11e8-9542-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('95def0dd-b8bb-11e8-8bee-4ccc6add7806', '95def0dc-b8bb-11e8-9f6f-4ccc6add7806', '23');
INSERT INTO `client_user_class` VALUES ('95def0df-b8bb-11e8-ad02-4ccc6add7806', '95def0de-b8bb-11e8-977b-4ccc6add7806', '23');
INSERT INTO `client_user_class` VALUES ('95def0e1-b8bb-11e8-aea4-4ccc6add7806', '95def0e0-b8bb-11e8-8169-4ccc6add7806', '23');
INSERT INTO `client_user_class` VALUES ('95df17d3-b8bb-11e8-a3d9-4ccc6add7806', '95df17d2-b8bb-11e8-beac-4ccc6add7806', '23');
INSERT INTO `client_user_class` VALUES ('95df17d5-b8bb-11e8-aac5-4ccc6add7806', '95df17d4-b8bb-11e8-9fd9-4ccc6add7806', '23');
INSERT INTO `client_user_class` VALUES ('95df17d7-b8bb-11e8-84f2-4ccc6add7806', '95df17d6-b8bb-11e8-8c2e-4ccc6add7806', '23');
INSERT INTO `client_user_class` VALUES ('95df3ec7-b8bb-11e8-b268-4ccc6add7806', '95df3ec6-b8bb-11e8-a4e7-4ccc6add7806', '23');
INSERT INTO `client_user_class` VALUES ('95df3ec9-b8bb-11e8-b5c4-4ccc6add7806', '95df3ec8-b8bb-11e8-888b-4ccc6add7806', '23');
INSERT INTO `client_user_class` VALUES ('95df3ecb-b8bb-11e8-92e2-4ccc6add7806', '95df3eca-b8bb-11e8-9ea3-4ccc6add7806', '23');
INSERT INTO `client_user_class` VALUES ('95df65bb-b8bb-11e8-b6e5-4ccc6add7806', '95df65ba-b8bb-11e8-970f-4ccc6add7806', '23');
INSERT INTO `client_user_class` VALUES ('95df65bd-b8bb-11e8-8ef8-4ccc6add7806', '95df65bc-b8bb-11e8-98c7-4ccc6add7806', '23');
INSERT INTO `client_user_class` VALUES ('95df8cb5-b8bb-11e8-a611-4ccc6add7806', '95df8cb4-b8bb-11e8-82de-4ccc6add7806', '23');
INSERT INTO `client_user_class` VALUES ('95df8cb7-b8bb-11e8-9c6b-4ccc6add7806', '95df8cb6-b8bb-11e8-a240-4ccc6add7806', '23');
INSERT INTO `client_user_class` VALUES ('95df8cb9-b8bb-11e8-9d5b-4ccc6add7806', '95df8cb8-b8bb-11e8-a2d0-4ccc6add7806', '23');
INSERT INTO `client_user_class` VALUES ('95dfb3a5-b8bb-11e8-b97c-4ccc6add7806', '95dfb3a4-b8bb-11e8-9038-4ccc6add7806', '23');
INSERT INTO `client_user_class` VALUES ('95dfb3a7-b8bb-11e8-80ac-4ccc6add7806', '95dfb3a6-b8bb-11e8-9798-4ccc6add7806', '23');
INSERT INTO `client_user_class` VALUES ('95dfb3a9-b8bb-11e8-8bce-4ccc6add7806', '95dfb3a8-b8bb-11e8-aff4-4ccc6add7806', '23');
INSERT INTO `client_user_class` VALUES ('95dfda9d-b8bb-11e8-8697-4ccc6add7806', '95dfda9c-b8bb-11e8-b9be-4ccc6add7806', '23');
INSERT INTO `client_user_class` VALUES ('95dfda9f-b8bb-11e8-a5e8-4ccc6add7806', '95dfda9e-b8bb-11e8-abc7-4ccc6add7806', '23');
INSERT INTO `client_user_class` VALUES ('95e00191-b8bb-11e8-b830-4ccc6add7806', '95e00190-b8bb-11e8-ac66-4ccc6add7806', '23');
INSERT INTO `client_user_class` VALUES ('95e00193-b8bb-11e8-bcc5-4ccc6add7806', '95e00192-b8bb-11e8-b645-4ccc6add7806', '23');
INSERT INTO `client_user_class` VALUES ('95e00195-b8bb-11e8-a086-4ccc6add7806', '95e00194-b8bb-11e8-a9f9-4ccc6add7806', '23');
INSERT INTO `client_user_class` VALUES ('95e02887-b8bb-11e8-bf43-4ccc6add7806', '95e02886-b8bb-11e8-b299-4ccc6add7806', '23');
INSERT INTO `client_user_class` VALUES ('95e02889-b8bb-11e8-af88-4ccc6add7806', '95e02888-b8bb-11e8-a21f-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e0288b-b8bb-11e8-b180-4ccc6add7806', '95e0288a-b8bb-11e8-9ca8-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e04f7b-b8bb-11e8-aab9-4ccc6add7806', '95e04f7a-b8bb-11e8-a11c-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e04f7d-b8bb-11e8-a2b1-4ccc6add7806', '95e04f7c-b8bb-11e8-b699-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e04f7f-b8bb-11e8-83b8-4ccc6add7806', '95e04f7e-b8bb-11e8-98da-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e07671-b8bb-11e8-b972-4ccc6add7806', '95e07670-b8bb-11e8-92fe-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e07673-b8bb-11e8-9037-4ccc6add7806', '95e07672-b8bb-11e8-a972-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e09d67-b8bb-11e8-a905-4ccc6add7806', '95e09d66-b8bb-11e8-8c3f-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e09d69-b8bb-11e8-8982-4ccc6add7806', '95e09d68-b8bb-11e8-a35a-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e09d6b-b8bb-11e8-8483-4ccc6add7806', '95e09d6a-b8bb-11e8-a921-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e0c45d-b8bb-11e8-8399-4ccc6add7806', '95e0c45c-b8bb-11e8-8de2-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e0c45f-b8bb-11e8-993e-4ccc6add7806', '95e0c45e-b8bb-11e8-b232-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e0c461-b8bb-11e8-830f-4ccc6add7806', '95e0c460-b8bb-11e8-8724-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e0eb51-b8bb-11e8-ab24-4ccc6add7806', '95e0eb50-b8bb-11e8-8e4a-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e0eb53-b8bb-11e8-9042-4ccc6add7806', '95e0eb52-b8bb-11e8-ad80-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e11246-b8bb-11e8-bb7d-4ccc6add7806', '95e0eb54-b8bb-11e8-b126-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e11248-b8bb-11e8-86d8-4ccc6add7806', '95e11247-b8bb-11e8-b1c8-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e1124a-b8bb-11e8-b600-4ccc6add7806', '95e11249-b8bb-11e8-9c06-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e1393b-b8bb-11e8-b5ca-4ccc6add7806', '95e1393a-b8bb-11e8-a695-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e1393d-b8bb-11e8-ad6f-4ccc6add7806', '95e1393c-b8bb-11e8-93c3-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e1393f-b8bb-11e8-b0ce-4ccc6add7806', '95e1393e-b8bb-11e8-9713-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e16031-b8bb-11e8-82bb-4ccc6add7806', '95e16030-b8bb-11e8-ad5e-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e16033-b8bb-11e8-80ce-4ccc6add7806', '95e16032-b8bb-11e8-adc6-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e16035-b8bb-11e8-959e-4ccc6add7806', '95e16034-b8bb-11e8-88d1-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e18727-b8bb-11e8-97f2-4ccc6add7806', '95e18726-b8bb-11e8-a1ea-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e18729-b8bb-11e8-a6ef-4ccc6add7806', '95e18728-b8bb-11e8-ba53-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e1ae1d-b8bb-11e8-9488-4ccc6add7806', '95e1ae1c-b8bb-11e8-9dcb-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e1ae1f-b8bb-11e8-b5ab-4ccc6add7806', '95e1ae1e-b8bb-11e8-8fee-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e1ae21-b8bb-11e8-9477-4ccc6add7806', '95e1ae20-b8bb-11e8-a609-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e1d513-b8bb-11e8-b52c-4ccc6add7806', '95e1d512-b8bb-11e8-b6fb-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e1d515-b8bb-11e8-aefe-4ccc6add7806', '95e1d514-b8bb-11e8-bae5-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e1d517-b8bb-11e8-a1d3-4ccc6add7806', '95e1d516-b8bb-11e8-93f3-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e1fc09-b8bb-11e8-913e-4ccc6add7806', '95e1fc08-b8bb-11e8-ab9e-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e1fc0b-b8bb-11e8-acd9-4ccc6add7806', '95e1fc0a-b8bb-11e8-a597-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e222f8-b8bb-11e8-8a86-4ccc6add7806', '95e1fc0c-b8bb-11e8-8562-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e222fa-b8bb-11e8-8fed-4ccc6add7806', '95e222f9-b8bb-11e8-89d6-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e222fc-b8bb-11e8-9f6d-4ccc6add7806', '95e222fb-b8bb-11e8-bfc4-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e249ef-b8bb-11e8-b86b-4ccc6add7806', '95e249ee-b8bb-11e8-9308-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('95e249f1-b8bb-11e8-82eb-4ccc6add7806', '95e249f0-b8bb-11e8-bccf-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e249f3-b8bb-11e8-8efc-4ccc6add7806', '95e249f2-b8bb-11e8-b710-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e270e5-b8bb-11e8-b49f-4ccc6add7806', '95e270e4-b8bb-11e8-a5f2-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e270e7-b8bb-11e8-b5b8-4ccc6add7806', '95e270e6-b8bb-11e8-bd85-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e270e9-b8bb-11e8-8c80-4ccc6add7806', '95e270e8-b8bb-11e8-bc10-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e297dd-b8bb-11e8-8c5b-4ccc6add7806', '95e297dc-b8bb-11e8-9c29-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e297df-b8bb-11e8-b47c-4ccc6add7806', '95e297de-b8bb-11e8-a5f8-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e2bed1-b8bb-11e8-add1-4ccc6add7806', '95e2bed0-b8bb-11e8-b0a8-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e2bed3-b8bb-11e8-95d7-4ccc6add7806', '95e2bed2-b8bb-11e8-88dc-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e2bed5-b8bb-11e8-b910-4ccc6add7806', '95e2bed4-b8bb-11e8-a94c-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e2e5c7-b8bb-11e8-8d72-4ccc6add7806', '95e2e5c6-b8bb-11e8-9fae-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e2e5c9-b8bb-11e8-84cf-4ccc6add7806', '95e2e5c8-b8bb-11e8-9cd8-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e2e5cb-b8bb-11e8-83ac-4ccc6add7806', '95e2e5ca-b8bb-11e8-854f-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e30cbb-b8bb-11e8-8a95-4ccc6add7806', '95e30cba-b8bb-11e8-8879-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e30cbd-b8bb-11e8-a901-4ccc6add7806', '95e30cbc-b8bb-11e8-be7c-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e30cbf-b8bb-11e8-a71f-4ccc6add7806', '95e30cbe-b8bb-11e8-970e-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e333b5-b8bb-11e8-9d63-4ccc6add7806', '95e333b4-b8bb-11e8-885d-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e333b7-b8bb-11e8-82ed-4ccc6add7806', '95e333b6-b8bb-11e8-8259-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e35aa7-b8bb-11e8-a983-4ccc6add7806', '95e35aa6-b8bb-11e8-981e-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e35aa9-b8bb-11e8-8cfa-4ccc6add7806', '95e35aa8-b8bb-11e8-93a6-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e35aab-b8bb-11e8-90e4-4ccc6add7806', '95e35aaa-b8bb-11e8-a06d-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e3819b-b8bb-11e8-a2fd-4ccc6add7806', '95e3819a-b8bb-11e8-bc47-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e3819d-b8bb-11e8-b52b-4ccc6add7806', '95e3819c-b8bb-11e8-beba-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e3819f-b8bb-11e8-9a64-4ccc6add7806', '95e3819e-b8bb-11e8-9677-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e3a891-b8bb-11e8-a1b5-4ccc6add7806', '95e3a890-b8bb-11e8-b3c8-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e3a893-b8bb-11e8-9c19-4ccc6add7806', '95e3a892-b8bb-11e8-b395-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e3cf87-b8bb-11e8-93c9-4ccc6add7806', '95e3cf86-b8bb-11e8-b2db-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e3cf89-b8bb-11e8-b7f2-4ccc6add7806', '95e3cf88-b8bb-11e8-958c-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e3cf8b-b8bb-11e8-ae86-4ccc6add7806', '95e3cf8a-b8bb-11e8-be14-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e3f67b-b8bb-11e8-b825-4ccc6add7806', '95e3f67a-b8bb-11e8-88e8-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e3f67d-b8bb-11e8-9bb6-4ccc6add7806', '95e3f67c-b8bb-11e8-8216-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e3f67f-b8bb-11e8-97b3-4ccc6add7806', '95e3f67e-b8bb-11e8-b405-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e41d71-b8bb-11e8-92ea-4ccc6add7806', '95e41d70-b8bb-11e8-8783-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e41d73-b8bb-11e8-8898-4ccc6add7806', '95e41d72-b8bb-11e8-97f9-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e41d75-b8bb-11e8-9755-4ccc6add7806', '95e41d74-b8bb-11e8-b789-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e44467-b8bb-11e8-97dd-4ccc6add7806', '95e44466-b8bb-11e8-8b4e-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e44469-b8bb-11e8-9b00-4ccc6add7806', '95e44468-b8bb-11e8-bd76-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e46b5d-b8bb-11e8-9792-4ccc6add7806', '95e46b5c-b8bb-11e8-9504-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e46b5f-b8bb-11e8-95cb-4ccc6add7806', '95e46b5e-b8bb-11e8-9cde-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e46b61-b8bb-11e8-964e-4ccc6add7806', '95e46b60-b8bb-11e8-9172-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e49253-b8bb-11e8-8f0d-4ccc6add7806', '95e49252-b8bb-11e8-84e1-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e49255-b8bb-11e8-a54b-4ccc6add7806', '95e49254-b8bb-11e8-8505-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e49257-b8bb-11e8-985c-4ccc6add7806', '95e49256-b8bb-11e8-91a4-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('95e4b949-b8bb-11e8-ab7d-4ccc6add7806', '95e4b948-b8bb-11e8-a4bc-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e4b94b-b8bb-11e8-994d-4ccc6add7806', '95e4b94a-b8bb-11e8-a355-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e4e03f-b8bb-11e8-9d2c-4ccc6add7806', '95e4e03e-b8bb-11e8-aff8-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e4e041-b8bb-11e8-937e-4ccc6add7806', '95e4e040-b8bb-11e8-b076-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e4e043-b8bb-11e8-ab44-4ccc6add7806', '95e4e042-b8bb-11e8-adde-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e50731-b8bb-11e8-984f-4ccc6add7806', '95e50730-b8bb-11e8-b94a-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e50733-b8bb-11e8-8dbd-4ccc6add7806', '95e50732-b8bb-11e8-a312-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e50735-b8bb-11e8-989d-4ccc6add7806', '95e50734-b8bb-11e8-bbee-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e52e29-b8bb-11e8-ab32-4ccc6add7806', '95e52e28-b8bb-11e8-a3cd-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e52e2b-b8bb-11e8-9477-4ccc6add7806', '95e52e2a-b8bb-11e8-a3a8-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e52e2d-b8bb-11e8-a3aa-4ccc6add7806', '95e52e2c-b8bb-11e8-a310-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e5551d-b8bb-11e8-9627-4ccc6add7806', '95e5551c-b8bb-11e8-b3b5-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e5551f-b8bb-11e8-bb81-4ccc6add7806', '95e5551e-b8bb-11e8-b988-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e57c13-b8bb-11e8-b042-4ccc6add7806', '95e57c12-b8bb-11e8-96ea-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e57c15-b8bb-11e8-8cc5-4ccc6add7806', '95e57c14-b8bb-11e8-9e1c-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e57c17-b8bb-11e8-a36a-4ccc6add7806', '95e57c16-b8bb-11e8-8e74-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e5a309-b8bb-11e8-96dc-4ccc6add7806', '95e5a308-b8bb-11e8-b2da-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e5a30b-b8bb-11e8-941a-4ccc6add7806', '95e5a30a-b8bb-11e8-882c-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e5a30d-b8bb-11e8-970e-4ccc6add7806', '95e5a30c-b8bb-11e8-a564-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e5c9ff-b8bb-11e8-8690-4ccc6add7806', '95e5c9fe-b8bb-11e8-8abc-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e5ca01-b8bb-11e8-8632-4ccc6add7806', '95e5ca00-b8bb-11e8-bd08-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e5f0ef-b8bb-11e8-92d2-4ccc6add7806', '95e5f0ee-b8bb-11e8-ba84-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e5f0f1-b8bb-11e8-9c1a-4ccc6add7806', '95e5f0f0-b8bb-11e8-aeef-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e5f0f3-b8bb-11e8-8fef-4ccc6add7806', '95e5f0f2-b8bb-11e8-a688-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e617e9-b8bb-11e8-87a2-4ccc6add7806', '95e617e8-b8bb-11e8-ba80-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e617eb-b8bb-11e8-998e-4ccc6add7806', '95e617ea-b8bb-11e8-8ce6-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e617ed-b8bb-11e8-a286-4ccc6add7806', '95e617ec-b8bb-11e8-8f4f-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e63edb-b8bb-11e8-970e-4ccc6add7806', '95e63eda-b8bb-11e8-8749-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e63edd-b8bb-11e8-9b4e-4ccc6add7806', '95e63edc-b8bb-11e8-8c0b-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e63edf-b8bb-11e8-97a6-4ccc6add7806', '95e63ede-b8bb-11e8-8a99-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e665d1-b8bb-11e8-be90-4ccc6add7806', '95e665d0-b8bb-11e8-a531-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e665d3-b8bb-11e8-85b9-4ccc6add7806', '95e665d2-b8bb-11e8-834c-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e68cc7-b8bb-11e8-9916-4ccc6add7806', '95e68cc6-b8bb-11e8-8a50-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e68cc9-b8bb-11e8-bcc0-4ccc6add7806', '95e68cc8-b8bb-11e8-b654-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e68ccb-b8bb-11e8-a9e7-4ccc6add7806', '95e68cca-b8bb-11e8-ba4c-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e6b3bb-b8bb-11e8-a026-4ccc6add7806', '95e6b3ba-b8bb-11e8-9d87-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e6b3bd-b8bb-11e8-9ffb-4ccc6add7806', '95e6b3bc-b8bb-11e8-b53b-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e6b3bf-b8bb-11e8-af2d-4ccc6add7806', '95e6b3be-b8bb-11e8-a176-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('95e6dab1-b8bb-11e8-8fff-4ccc6add7806', '95e6dab0-b8bb-11e8-bf4a-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e6dab3-b8bb-11e8-988a-4ccc6add7806', '95e6dab2-b8bb-11e8-9b3d-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e6dab5-b8bb-11e8-94e9-4ccc6add7806', '95e6dab4-b8bb-11e8-865f-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e701a5-b8bb-11e8-9b12-4ccc6add7806', '95e701a4-b8bb-11e8-909c-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e701a7-b8bb-11e8-8c91-4ccc6add7806', '95e701a6-b8bb-11e8-bbbf-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e7289b-b8bb-11e8-ab4f-4ccc6add7806', '95e7289a-b8bb-11e8-878f-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e7289d-b8bb-11e8-8b34-4ccc6add7806', '95e7289c-b8bb-11e8-8ed3-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e7289f-b8bb-11e8-8922-4ccc6add7806', '95e7289e-b8bb-11e8-a24b-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e74f91-b8bb-11e8-abe0-4ccc6add7806', '95e74f90-b8bb-11e8-b248-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e74f93-b8bb-11e8-b497-4ccc6add7806', '95e74f92-b8bb-11e8-a771-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e74f95-b8bb-11e8-9686-4ccc6add7806', '95e74f94-b8bb-11e8-995d-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e77687-b8bb-11e8-a608-4ccc6add7806', '95e77686-b8bb-11e8-ae21-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e77689-b8bb-11e8-b965-4ccc6add7806', '95e77688-b8bb-11e8-be92-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e79d7b-b8bb-11e8-bdb7-4ccc6add7806', '95e79d7a-b8bb-11e8-a0c7-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e79d7d-b8bb-11e8-9fb0-4ccc6add7806', '95e79d7c-b8bb-11e8-bfa1-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e79d7f-b8bb-11e8-bf77-4ccc6add7806', '95e79d7e-b8bb-11e8-a2ee-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e7c471-b8bb-11e8-a317-4ccc6add7806', '95e7c470-b8bb-11e8-ac0f-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e7c473-b8bb-11e8-9459-4ccc6add7806', '95e7c472-b8bb-11e8-b677-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e7c475-b8bb-11e8-b172-4ccc6add7806', '95e7c474-b8bb-11e8-b13d-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e7eb67-b8bb-11e8-a366-4ccc6add7806', '95e7eb66-b8bb-11e8-9579-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e7eb69-b8bb-11e8-b39f-4ccc6add7806', '95e7eb68-b8bb-11e8-aa7a-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e7eb6b-b8bb-11e8-ae58-4ccc6add7806', '95e7eb6a-b8bb-11e8-994c-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e8125d-b8bb-11e8-a989-4ccc6add7806', '95e8125c-b8bb-11e8-9831-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e8125f-b8bb-11e8-8ca0-4ccc6add7806', '95e8125e-b8bb-11e8-a642-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e83953-b8bb-11e8-beed-4ccc6add7806', '95e83952-b8bb-11e8-8a07-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e83955-b8bb-11e8-99bd-4ccc6add7806', '95e83954-b8bb-11e8-9b02-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e83957-b8bb-11e8-af58-4ccc6add7806', '95e83956-b8bb-11e8-9b2b-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e86049-b8bb-11e8-87da-4ccc6add7806', '95e86048-b8bb-11e8-84bd-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e8604b-b8bb-11e8-b284-4ccc6add7806', '95e8604a-b8bb-11e8-8a03-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e8604d-b8bb-11e8-b5e3-4ccc6add7806', '95e8604c-b8bb-11e8-bfaa-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e8873b-b8bb-11e8-b247-4ccc6add7806', '95e8873a-b8bb-11e8-bb9c-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e8873d-b8bb-11e8-b3db-4ccc6add7806', '95e8873c-b8bb-11e8-8345-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e8ae2f-b8bb-11e8-9ff3-4ccc6add7806', '95e8ae2e-b8bb-11e8-a42e-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e8ae31-b8bb-11e8-85db-4ccc6add7806', '95e8ae30-b8bb-11e8-a260-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e8ae33-b8bb-11e8-a3c4-4ccc6add7806', '95e8ae32-b8bb-11e8-98f5-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e8d525-b8bb-11e8-8337-4ccc6add7806', '95e8d524-b8bb-11e8-bcb7-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e8d527-b8bb-11e8-b646-4ccc6add7806', '95e8d526-b8bb-11e8-9d30-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e8d529-b8bb-11e8-abd5-4ccc6add7806', '95e8d528-b8bb-11e8-a755-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e8fc1d-b8bb-11e8-8682-4ccc6add7806', '95e8fc1c-b8bb-11e8-800b-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e8fc1f-b8bb-11e8-a735-4ccc6add7806', '95e8fc1e-b8bb-11e8-ab58-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e92312-b8bb-11e8-be17-4ccc6add7806', '95e8fc20-b8bb-11e8-9e6a-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e92314-b8bb-11e8-b079-4ccc6add7806', '95e92313-b8bb-11e8-b995-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e92316-b8bb-11e8-bfcd-4ccc6add7806', '95e92315-b8bb-11e8-832d-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e94a09-b8bb-11e8-888b-4ccc6add7806', '95e94a08-b8bb-11e8-b840-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e94a0b-b8bb-11e8-a8e6-4ccc6add7806', '95e94a0a-b8bb-11e8-9daa-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('95e94a0d-b8bb-11e8-aa40-4ccc6add7806', '95e94a0c-b8bb-11e8-a229-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95e971bf-b8bb-11e8-8374-4ccc6add7806', '95e971be-b8bb-11e8-bd28-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95e971c1-b8bb-11e8-ae02-4ccc6add7806', '95e971c0-b8bb-11e8-9b86-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95e971c3-b8bb-11e8-8dbd-4ccc6add7806', '95e971c2-b8bb-11e8-828b-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95e997ef-b8bb-11e8-91e9-4ccc6add7806', '95e997ee-b8bb-11e8-b79f-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95e997f1-b8bb-11e8-9f88-4ccc6add7806', '95e997f0-b8bb-11e8-94c9-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95e9bee5-b8bb-11e8-9c84-4ccc6add7806', '95e9bee4-b8bb-11e8-a62d-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95e9bee7-b8bb-11e8-ad03-4ccc6add7806', '95e9bee6-b8bb-11e8-81d7-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95e9bee9-b8bb-11e8-87c1-4ccc6add7806', '95e9bee8-b8bb-11e8-bbc4-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95e9e5db-b8bb-11e8-a80d-4ccc6add7806', '95e9e5da-b8bb-11e8-aabe-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95e9e5dd-b8bb-11e8-9b3f-4ccc6add7806', '95e9e5dc-b8bb-11e8-a08f-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95e9e5df-b8bb-11e8-9e70-4ccc6add7806', '95e9e5de-b8bb-11e8-8638-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95ea0cd1-b8bb-11e8-8d1e-4ccc6add7806', '95ea0cd0-b8bb-11e8-97f1-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95ea0cd3-b8bb-11e8-a308-4ccc6add7806', '95ea0cd2-b8bb-11e8-a441-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95ea33c7-b8bb-11e8-b258-4ccc6add7806', '95ea33c6-b8bb-11e8-9c31-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95ea33c9-b8bb-11e8-8fbf-4ccc6add7806', '95ea33c8-b8bb-11e8-b707-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95ea33cb-b8bb-11e8-8000-4ccc6add7806', '95ea33ca-b8bb-11e8-bc32-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95ea5abb-b8bb-11e8-83e7-4ccc6add7806', '95ea5aba-b8bb-11e8-a33a-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95ea5abd-b8bb-11e8-9adb-4ccc6add7806', '95ea5abc-b8bb-11e8-a437-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95ea5abf-b8bb-11e8-bef4-4ccc6add7806', '95ea5abe-b8bb-11e8-b4d0-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95ea81b1-b8bb-11e8-8b80-4ccc6add7806', '95ea81b0-b8bb-11e8-a691-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95ea81b3-b8bb-11e8-adbd-4ccc6add7806', '95ea81b2-b8bb-11e8-b54a-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95ea81b5-b8bb-11e8-a23d-4ccc6add7806', '95ea81b4-b8bb-11e8-a2d7-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95eaa8a7-b8bb-11e8-96b2-4ccc6add7806', '95eaa8a6-b8bb-11e8-9296-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95eaa8a9-b8bb-11e8-babe-4ccc6add7806', '95eaa8a8-b8bb-11e8-95d0-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95eacf9b-b8bb-11e8-86fa-4ccc6add7806', '95eacf9a-b8bb-11e8-82cb-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95eacf9d-b8bb-11e8-906e-4ccc6add7806', '95eacf9c-b8bb-11e8-8c87-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95eacf9f-b8bb-11e8-b70a-4ccc6add7806', '95eacf9e-b8bb-11e8-8b09-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95eaf691-b8bb-11e8-81d2-4ccc6add7806', '95eaf690-b8bb-11e8-a9cf-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95eaf693-b8bb-11e8-beaa-4ccc6add7806', '95eaf692-b8bb-11e8-a1ef-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95eaf695-b8bb-11e8-9f47-4ccc6add7806', '95eaf694-b8bb-11e8-b17f-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95eb1d87-b8bb-11e8-9e47-4ccc6add7806', '95eb1d86-b8bb-11e8-9e83-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95eb1d89-b8bb-11e8-9a61-4ccc6add7806', '95eb1d88-b8bb-11e8-bb2f-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95eb447b-b8bb-11e8-b6d3-4ccc6add7806', '95eb447a-b8bb-11e8-a1f3-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95eb447d-b8bb-11e8-8a1e-4ccc6add7806', '95eb447c-b8bb-11e8-9988-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95eb447f-b8bb-11e8-a7a8-4ccc6add7806', '95eb447e-b8bb-11e8-8231-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95eb6b71-b8bb-11e8-8b6a-4ccc6add7806', '95eb6b70-b8bb-11e8-afaf-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95eb6b73-b8bb-11e8-86e9-4ccc6add7806', '95eb6b72-b8bb-11e8-afb9-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95eb6b75-b8bb-11e8-80a9-4ccc6add7806', '95eb6b74-b8bb-11e8-ba2f-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95eb9267-b8bb-11e8-af4b-4ccc6add7806', '95eb9266-b8bb-11e8-ba75-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95eb9269-b8bb-11e8-8727-4ccc6add7806', '95eb9268-b8bb-11e8-8c55-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95eb926b-b8bb-11e8-bf11-4ccc6add7806', '95eb926a-b8bb-11e8-af39-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95ebb95d-b8bb-11e8-9fe3-4ccc6add7806', '95ebb95c-b8bb-11e8-b501-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95ebb95f-b8bb-11e8-aec4-4ccc6add7806', '95ebb95e-b8bb-11e8-b499-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95ebe053-b8bb-11e8-8ece-4ccc6add7806', '95ebe052-b8bb-11e8-bb31-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95ebe055-b8bb-11e8-8bb1-4ccc6add7806', '95ebe054-b8bb-11e8-a0a1-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95ebe057-b8bb-11e8-bda2-4ccc6add7806', '95ebe056-b8bb-11e8-a982-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('95ec0747-b8bb-11e8-9cea-4ccc6add7806', '95ec0746-b8bb-11e8-b38b-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95ec0749-b8bb-11e8-ab43-4ccc6add7806', '95ec0748-b8bb-11e8-83cd-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95ec074b-b8bb-11e8-8a2a-4ccc6add7806', '95ec074a-b8bb-11e8-bb5a-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95ec2e3f-b8bb-11e8-8fdd-4ccc6add7806', '95ec2e3e-b8bb-11e8-a9e2-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95ec2e41-b8bb-11e8-9bc4-4ccc6add7806', '95ec2e40-b8bb-11e8-a420-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95ec552f-b8bb-11e8-8f58-4ccc6add7806', '95ec552e-b8bb-11e8-9ea5-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95ec5531-b8bb-11e8-99de-4ccc6add7806', '95ec5530-b8bb-11e8-b994-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95ec5533-b8bb-11e8-98b3-4ccc6add7806', '95ec5532-b8bb-11e8-bc2b-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95ec7c29-b8bb-11e8-87a3-4ccc6add7806', '95ec7c28-b8bb-11e8-a172-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95ec7c2b-b8bb-11e8-b349-4ccc6add7806', '95ec7c2a-b8bb-11e8-9496-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95ec7c2d-b8bb-11e8-81f5-4ccc6add7806', '95ec7c2c-b8bb-11e8-88f9-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95eca31d-b8bb-11e8-8849-4ccc6add7806', '95eca31c-b8bb-11e8-897f-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95eca31f-b8bb-11e8-b0bb-4ccc6add7806', '95eca31e-b8bb-11e8-9ad8-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95eca321-b8bb-11e8-a05e-4ccc6add7806', '95eca320-b8bb-11e8-8a75-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95ecca13-b8bb-11e8-afd9-4ccc6add7806', '95ecca12-b8bb-11e8-aa54-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95ecca15-b8bb-11e8-9974-4ccc6add7806', '95ecca14-b8bb-11e8-9570-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95ecf107-b8bb-11e8-814a-4ccc6add7806', '95ecf106-b8bb-11e8-9a96-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95ecf109-b8bb-11e8-b477-4ccc6add7806', '95ecf108-b8bb-11e8-93ae-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95ecf10b-b8bb-11e8-a51d-4ccc6add7806', '95ecf10a-b8bb-11e8-84eb-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95ed17fb-b8bb-11e8-bae3-4ccc6add7806', '95ed17fa-b8bb-11e8-a94e-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95ed17fd-b8bb-11e8-84ad-4ccc6add7806', '95ed17fc-b8bb-11e8-a9f7-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95ed17ff-b8bb-11e8-9ed0-4ccc6add7806', '95ed17fe-b8bb-11e8-b057-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95ed3ef5-b8bb-11e8-86e8-4ccc6add7806', '95ed3ef4-b8bb-11e8-80a0-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95ed3ef7-b8bb-11e8-bafe-4ccc6add7806', '95ed3ef6-b8bb-11e8-a81f-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95ed65e5-b8bb-11e8-884e-4ccc6add7806', '95ed65e4-b8bb-11e8-99a9-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95ed65e7-b8bb-11e8-8c43-4ccc6add7806', '95ed65e6-b8bb-11e8-932c-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95ed65e9-b8bb-11e8-ad69-4ccc6add7806', '95ed65e8-b8bb-11e8-944d-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95ed8cdb-b8bb-11e8-92c5-4ccc6add7806', '95ed8cda-b8bb-11e8-a4cf-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95ed8cdd-b8bb-11e8-a826-4ccc6add7806', '95ed8cdc-b8bb-11e8-a632-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95ed8cdf-b8bb-11e8-9c0d-4ccc6add7806', '95ed8cde-b8bb-11e8-b5c3-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95edb3d1-b8bb-11e8-a2d0-4ccc6add7806', '95edb3d0-b8bb-11e8-8999-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95edb3d3-b8bb-11e8-9430-4ccc6add7806', '95edb3d2-b8bb-11e8-8949-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95edb3d5-b8bb-11e8-9a97-4ccc6add7806', '95edb3d4-b8bb-11e8-95b7-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95eddac7-b8bb-11e8-9bae-4ccc6add7806', '95eddac6-b8bb-11e8-b965-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95eddac9-b8bb-11e8-9599-4ccc6add7806', '95eddac8-b8bb-11e8-ad82-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95ee01bb-b8bb-11e8-87a5-4ccc6add7806', '95ee01ba-b8bb-11e8-99f9-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95ee01bd-b8bb-11e8-ae98-4ccc6add7806', '95ee01bc-b8bb-11e8-b65b-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95ee01bf-b8bb-11e8-8788-4ccc6add7806', '95ee01be-b8bb-11e8-9c3a-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95ee28b1-b8bb-11e8-a4fd-4ccc6add7806', '95ee28b0-b8bb-11e8-9936-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95ee28b3-b8bb-11e8-ad6d-4ccc6add7806', '95ee28b2-b8bb-11e8-8649-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95ee28b5-b8bb-11e8-943c-4ccc6add7806', '95ee28b4-b8bb-11e8-a0aa-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95ee4fa7-b8bb-11e8-b70d-4ccc6add7806', '95ee4fa6-b8bb-11e8-b21b-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95ee4fa9-b8bb-11e8-aabc-4ccc6add7806', '95ee4fa8-b8bb-11e8-a7fd-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95ee769d-b8bb-11e8-961e-4ccc6add7806', '95ee769c-b8bb-11e8-8514-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('95ee769f-b8bb-11e8-ac21-4ccc6add7806', '95ee769e-b8bb-11e8-87f3-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95ee76a1-b8bb-11e8-8cc9-4ccc6add7806', '95ee76a0-b8bb-11e8-8fe1-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95ee9d91-b8bb-11e8-a114-4ccc6add7806', '95ee9d90-b8bb-11e8-a528-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95ee9d93-b8bb-11e8-a334-4ccc6add7806', '95ee9d92-b8bb-11e8-aa96-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95ee9d95-b8bb-11e8-ae55-4ccc6add7806', '95ee9d94-b8bb-11e8-a2c5-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95eec487-b8bb-11e8-98ef-4ccc6add7806', '95eec486-b8bb-11e8-9e1c-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95eec489-b8bb-11e8-83b7-4ccc6add7806', '95eec488-b8bb-11e8-81a3-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95eeeb7e-b8bb-11e8-a03c-4ccc6add7806', '95eec48a-b8bb-11e8-a48f-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95eeeb80-b8bb-11e8-8fc3-4ccc6add7806', '95eeeb7f-b8bb-11e8-b20e-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95eeeb82-b8bb-11e8-819c-4ccc6add7806', '95eeeb81-b8bb-11e8-b8ab-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95ef1271-b8bb-11e8-a5a1-4ccc6add7806', '95ef1270-b8bb-11e8-afb9-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95ef1273-b8bb-11e8-863d-4ccc6add7806', '95ef1272-b8bb-11e8-a08c-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95ef1275-b8bb-11e8-be8a-4ccc6add7806', '95ef1274-b8bb-11e8-aadf-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95ef3967-b8bb-11e8-b380-4ccc6add7806', '95ef3966-b8bb-11e8-8332-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95ef3969-b8bb-11e8-9e38-4ccc6add7806', '95ef3968-b8bb-11e8-9ed0-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95ef396b-b8bb-11e8-a1c9-4ccc6add7806', '95ef396a-b8bb-11e8-b7b8-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95ef605d-b8bb-11e8-a161-4ccc6add7806', '95ef605c-b8bb-11e8-997a-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95ef605f-b8bb-11e8-b22d-4ccc6add7806', '95ef605e-b8bb-11e8-ab50-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95ef8753-b8bb-11e8-8b62-4ccc6add7806', '95ef8752-b8bb-11e8-8086-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95ef8755-b8bb-11e8-87b1-4ccc6add7806', '95ef8754-b8bb-11e8-b05d-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95ef8757-b8bb-11e8-b9d4-4ccc6add7806', '95ef8756-b8bb-11e8-923a-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95efae43-b8bb-11e8-89b8-4ccc6add7806', '95efae42-b8bb-11e8-adc4-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95efae45-b8bb-11e8-85f8-4ccc6add7806', '95efae44-b8bb-11e8-9b82-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95efae47-b8bb-11e8-8456-4ccc6add7806', '95efae46-b8bb-11e8-9afb-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95efd539-b8bb-11e8-95e3-4ccc6add7806', '95efd538-b8bb-11e8-8642-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95efd53b-b8bb-11e8-b906-4ccc6add7806', '95efd53a-b8bb-11e8-89ea-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95effc2e-b8bb-11e8-9027-4ccc6add7806', '95efd53c-b8bb-11e8-af09-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95effc30-b8bb-11e8-bdf2-4ccc6add7806', '95effc2f-b8bb-11e8-be69-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95effc32-b8bb-11e8-954e-4ccc6add7806', '95effc31-b8bb-11e8-ac19-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95f02325-b8bb-11e8-a1c5-4ccc6add7806', '95f02324-b8bb-11e8-a1d2-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95f02327-b8bb-11e8-a254-4ccc6add7806', '95f02326-b8bb-11e8-875d-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95f02329-b8bb-11e8-b208-4ccc6add7806', '95f02328-b8bb-11e8-adb9-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95f04a1d-b8bb-11e8-9c2a-4ccc6add7806', '95f04a1c-b8bb-11e8-b2ef-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95f04a1f-b8bb-11e8-a8eb-4ccc6add7806', '95f04a1e-b8bb-11e8-b0b2-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95f04a21-b8bb-11e8-ac15-4ccc6add7806', '95f04a20-b8bb-11e8-998d-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95f07111-b8bb-11e8-b51b-4ccc6add7806', '95f07110-b8bb-11e8-b3d8-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95f07113-b8bb-11e8-b2b5-4ccc6add7806', '95f07112-b8bb-11e8-9d77-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95f09807-b8bb-11e8-9d6d-4ccc6add7806', '95f09806-b8bb-11e8-bbf8-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95f09809-b8bb-11e8-9896-4ccc6add7806', '95f09808-b8bb-11e8-806a-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95f0980b-b8bb-11e8-be1d-4ccc6add7806', '95f0980a-b8bb-11e8-a1ac-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95f0bef9-b8bb-11e8-92b1-4ccc6add7806', '95f0bef8-b8bb-11e8-ac2f-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95f0befb-b8bb-11e8-a337-4ccc6add7806', '95f0befa-b8bb-11e8-a4e6-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95f0befd-b8bb-11e8-8d8c-4ccc6add7806', '95f0befc-b8bb-11e8-8dc9-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95f0e5ef-b8bb-11e8-80a8-4ccc6add7806', '95f0e5ee-b8bb-11e8-b0fe-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('95f0e5f1-b8bb-11e8-b825-4ccc6add7806', '95f0e5f0-b8bb-11e8-b66b-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f0e5f3-b8bb-11e8-a2ca-4ccc6add7806', '95f0e5f2-b8bb-11e8-9950-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f10ce5-b8bb-11e8-97ca-4ccc6add7806', '95f10ce4-b8bb-11e8-b544-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f10ce7-b8bb-11e8-9a72-4ccc6add7806', '95f10ce6-b8bb-11e8-9cca-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f133db-b8bb-11e8-9fbd-4ccc6add7806', '95f133da-b8bb-11e8-ac6c-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f133dd-b8bb-11e8-b155-4ccc6add7806', '95f133dc-b8bb-11e8-90db-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f133df-b8bb-11e8-8270-4ccc6add7806', '95f133de-b8bb-11e8-9513-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f15ad3-b8bb-11e8-9bfc-4ccc6add7806', '95f15ad2-b8bb-11e8-b7ea-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f15ad5-b8bb-11e8-bbc7-4ccc6add7806', '95f15ad4-b8bb-11e8-b424-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f15ad7-b8bb-11e8-aaf3-4ccc6add7806', '95f15ad6-b8bb-11e8-8e1a-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f181c7-b8bb-11e8-a056-4ccc6add7806', '95f181c6-b8bb-11e8-a060-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f181c9-b8bb-11e8-a092-4ccc6add7806', '95f181c8-b8bb-11e8-bf0a-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f1a8bb-b8bb-11e8-b960-4ccc6add7806', '95f1a8ba-b8bb-11e8-ac92-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f1a8bd-b8bb-11e8-81b8-4ccc6add7806', '95f1a8bc-b8bb-11e8-b37a-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f1a8bf-b8bb-11e8-8a62-4ccc6add7806', '95f1a8be-b8bb-11e8-8c43-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f1cfb1-b8bb-11e8-a383-4ccc6add7806', '95f1cfb0-b8bb-11e8-8fe6-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f1cfb3-b8bb-11e8-a331-4ccc6add7806', '95f1cfb2-b8bb-11e8-976a-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f1cfb5-b8bb-11e8-9849-4ccc6add7806', '95f1cfb4-b8bb-11e8-85b0-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f1f6a7-b8bb-11e8-a5f5-4ccc6add7806', '95f1f6a6-b8bb-11e8-895d-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f1f6a9-b8bb-11e8-8aff-4ccc6add7806', '95f1f6a8-b8bb-11e8-b12a-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f1f6ab-b8bb-11e8-bb96-4ccc6add7806', '95f1f6aa-b8bb-11e8-bb01-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f21d9b-b8bb-11e8-99b1-4ccc6add7806', '95f21d9a-b8bb-11e8-9faf-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f21d9d-b8bb-11e8-a032-4ccc6add7806', '95f21d9c-b8bb-11e8-9e83-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f24493-b8bb-11e8-984d-4ccc6add7806', '95f24492-b8bb-11e8-967f-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f24495-b8bb-11e8-a7ac-4ccc6add7806', '95f24494-b8bb-11e8-b74f-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f24497-b8bb-11e8-8e65-4ccc6add7806', '95f24496-b8bb-11e8-91ee-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f26b87-b8bb-11e8-86d9-4ccc6add7806', '95f26b86-b8bb-11e8-94f1-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f26b89-b8bb-11e8-a819-4ccc6add7806', '95f26b88-b8bb-11e8-b939-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f26b8b-b8bb-11e8-87b8-4ccc6add7806', '95f26b8a-b8bb-11e8-93f8-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f2927b-b8bb-11e8-b656-4ccc6add7806', '95f2927a-b8bb-11e8-8e92-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f2927d-b8bb-11e8-8ed9-4ccc6add7806', '95f2927c-b8bb-11e8-98f5-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f2b971-b8bb-11e8-a36d-4ccc6add7806', '95f2b970-b8bb-11e8-9ea0-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f2b973-b8bb-11e8-913b-4ccc6add7806', '95f2b972-b8bb-11e8-9cd5-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f2b975-b8bb-11e8-afb5-4ccc6add7806', '95f2b974-b8bb-11e8-ade7-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f2e067-b8bb-11e8-86da-4ccc6add7806', '95f2e066-b8bb-11e8-9f8c-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f2e069-b8bb-11e8-b3dd-4ccc6add7806', '95f2e068-b8bb-11e8-bee1-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f2e06b-b8bb-11e8-8fcc-4ccc6add7806', '95f2e06a-b8bb-11e8-bf12-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f3075d-b8bb-11e8-afbc-4ccc6add7806', '95f3075c-b8bb-11e8-af55-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f3075f-b8bb-11e8-9bd9-4ccc6add7806', '95f3075e-b8bb-11e8-a06f-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f30761-b8bb-11e8-9a8a-4ccc6add7806', '95f30760-b8bb-11e8-bff6-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f32e53-b8bb-11e8-8ecd-4ccc6add7806', '95f32e52-b8bb-11e8-acd2-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f32e55-b8bb-11e8-86bb-4ccc6add7806', '95f32e54-b8bb-11e8-bc3a-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f35543-b8bb-11e8-af3c-4ccc6add7806', '95f35542-b8bb-11e8-8cee-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f35545-b8bb-11e8-931a-4ccc6add7806', '95f35544-b8bb-11e8-9529-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f35547-b8bb-11e8-83dd-4ccc6add7806', '95f35546-b8bb-11e8-8954-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('95f37c39-b8bb-11e8-b496-4ccc6add7806', '95f37c38-b8bb-11e8-b4b8-4ccc6add7806', '53');
INSERT INTO `client_user_class` VALUES ('95f37c3b-b8bb-11e8-906d-4ccc6add7806', '95f37c3a-b8bb-11e8-9ff8-4ccc6add7806', '53');
INSERT INTO `client_user_class` VALUES ('95f37c3d-b8bb-11e8-ae7b-4ccc6add7806', '95f37c3c-b8bb-11e8-b026-4ccc6add7806', '53');
INSERT INTO `client_user_class` VALUES ('95f3a32f-b8bb-11e8-bb4b-4ccc6add7806', '95f3a32e-b8bb-11e8-887e-4ccc6add7806', '53');
INSERT INTO `client_user_class` VALUES ('95f3a331-b8bb-11e8-96ad-4ccc6add7806', '95f3a330-b8bb-11e8-9934-4ccc6add7806', '53');
INSERT INTO `client_user_class` VALUES ('95f3ca29-b8bb-11e8-b3b7-4ccc6add7806', '95f3ca28-b8bb-11e8-ac7c-4ccc6add7806', '53');
INSERT INTO `client_user_class` VALUES ('95f3ca2b-b8bb-11e8-9329-4ccc6add7806', '95f3ca2a-b8bb-11e8-925a-4ccc6add7806', '53');
INSERT INTO `client_user_class` VALUES ('95f3ca2d-b8bb-11e8-8952-4ccc6add7806', '95f3ca2c-b8bb-11e8-afae-4ccc6add7806', '53');
INSERT INTO `client_user_class` VALUES ('95f3f11b-b8bb-11e8-91ed-4ccc6add7806', '95f3f11a-b8bb-11e8-9900-4ccc6add7806', '53');
INSERT INTO `client_user_class` VALUES ('95f3f11d-b8bb-11e8-9b24-4ccc6add7806', '95f3f11c-b8bb-11e8-b379-4ccc6add7806', '53');
INSERT INTO `client_user_class` VALUES ('95f3f11f-b8bb-11e8-b63f-4ccc6add7806', '95f3f11e-b8bb-11e8-bcf1-4ccc6add7806', '53');
INSERT INTO `client_user_class` VALUES ('95f41811-b8bb-11e8-a04c-4ccc6add7806', '95f41810-b8bb-11e8-a223-4ccc6add7806', '53');
INSERT INTO `client_user_class` VALUES ('95f41813-b8bb-11e8-b52b-4ccc6add7806', '95f41812-b8bb-11e8-9d7e-4ccc6add7806', '53');
INSERT INTO `client_user_class` VALUES ('95f41815-b8bb-11e8-886a-4ccc6add7806', '95f41814-b8bb-11e8-a5a5-4ccc6add7806', '53');
INSERT INTO `client_user_class` VALUES ('95f43f07-b8bb-11e8-a9a7-4ccc6add7806', '95f43f06-b8bb-11e8-b0f6-4ccc6add7806', '53');
INSERT INTO `client_user_class` VALUES ('95f43f09-b8bb-11e8-8b88-4ccc6add7806', '95f43f08-b8bb-11e8-9299-4ccc6add7806', '53');
INSERT INTO `client_user_class` VALUES ('95f465fb-b8bb-11e8-9d8a-4ccc6add7806', '95f465fa-b8bb-11e8-b4c5-4ccc6add7806', '53');
INSERT INTO `client_user_class` VALUES ('95f465fd-b8bb-11e8-b18e-4ccc6add7806', '95f465fc-b8bb-11e8-88d4-4ccc6add7806', '53');
INSERT INTO `client_user_class` VALUES ('95f465ff-b8bb-11e8-9d2d-4ccc6add7806', '95f465fe-b8bb-11e8-b57f-4ccc6add7806', '53');
INSERT INTO `client_user_class` VALUES ('95f48cef-b8bb-11e8-93e0-4ccc6add7806', '95f48cee-b8bb-11e8-8d0c-4ccc6add7806', '53');
INSERT INTO `client_user_class` VALUES ('95f48cf1-b8bb-11e8-afbd-4ccc6add7806', '95f48cf0-b8bb-11e8-9647-4ccc6add7806', '53');
INSERT INTO `client_user_class` VALUES ('95f48cf3-b8bb-11e8-8023-4ccc6add7806', '95f48cf2-b8bb-11e8-ba8c-4ccc6add7806', '53');
INSERT INTO `client_user_class` VALUES ('95f4b3e5-b8bb-11e8-ae6b-4ccc6add7806', '95f4b3e4-b8bb-11e8-a597-4ccc6add7806', '53');
INSERT INTO `client_user_class` VALUES ('95f4b3e7-b8bb-11e8-b27b-4ccc6add7806', '95f4b3e6-b8bb-11e8-a164-4ccc6add7806', '53');
INSERT INTO `client_user_class` VALUES ('95f4dadb-b8bb-11e8-9edd-4ccc6add7806', '95f4dada-b8bb-11e8-aa65-4ccc6add7806', '53');
INSERT INTO `client_user_class` VALUES ('95f4dadd-b8bb-11e8-950b-4ccc6add7806', '95f4dadc-b8bb-11e8-81dc-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f4dadf-b8bb-11e8-ad2c-4ccc6add7806', '95f4dade-b8bb-11e8-8c54-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f501d1-b8bb-11e8-b10a-4ccc6add7806', '95f501d0-b8bb-11e8-a37f-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f501d3-b8bb-11e8-94b5-4ccc6add7806', '95f501d2-b8bb-11e8-b97b-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f501d5-b8bb-11e8-b051-4ccc6add7806', '95f501d4-b8bb-11e8-9f47-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f528c7-b8bb-11e8-98e7-4ccc6add7806', '95f528c6-b8bb-11e8-80e5-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f528c9-b8bb-11e8-914f-4ccc6add7806', '95f528c8-b8bb-11e8-95af-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f528cb-b8bb-11e8-b02b-4ccc6add7806', '95f528ca-b8bb-11e8-8093-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f54fbb-b8bb-11e8-896f-4ccc6add7806', '95f54fba-b8bb-11e8-9dfc-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f54fbd-b8bb-11e8-a90d-4ccc6add7806', '95f54fbc-b8bb-11e8-aa6d-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f576b1-b8bb-11e8-8538-4ccc6add7806', '95f576b0-b8bb-11e8-b9e9-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f576b3-b8bb-11e8-be87-4ccc6add7806', '95f576b2-b8bb-11e8-abeb-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f576b5-b8bb-11e8-bb66-4ccc6add7806', '95f576b4-b8bb-11e8-bcc5-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f59da7-b8bb-11e8-a39b-4ccc6add7806', '95f59da6-b8bb-11e8-9cbe-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f59da9-b8bb-11e8-8f7e-4ccc6add7806', '95f59da8-b8bb-11e8-b318-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f59dab-b8bb-11e8-b1f9-4ccc6add7806', '95f59daa-b8bb-11e8-8a3e-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f5c499-b8bb-11e8-a0bf-4ccc6add7806', '95f5c498-b8bb-11e8-94d0-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f5c49b-b8bb-11e8-bc36-4ccc6add7806', '95f5c49a-b8bb-11e8-bc36-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f5eb8d-b8bb-11e8-9ff0-4ccc6add7806', '95f5eb8c-b8bb-11e8-af2e-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f5eb8f-b8bb-11e8-b05a-4ccc6add7806', '95f5eb8e-b8bb-11e8-8539-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f5eb91-b8bb-11e8-ac94-4ccc6add7806', '95f5eb90-b8bb-11e8-b1d8-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f61287-b8bb-11e8-a842-4ccc6add7806', '95f61286-b8bb-11e8-8e8d-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f61289-b8bb-11e8-8efe-4ccc6add7806', '95f61288-b8bb-11e8-846d-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f6128b-b8bb-11e8-a318-4ccc6add7806', '95f6128a-b8bb-11e8-898d-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f6397b-b8bb-11e8-a1bb-4ccc6add7806', '95f6397a-b8bb-11e8-90a5-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f6397d-b8bb-11e8-b7d7-4ccc6add7806', '95f6397c-b8bb-11e8-960c-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f6397f-b8bb-11e8-a647-4ccc6add7806', '95f6397e-b8bb-11e8-b73b-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f66071-b8bb-11e8-b7f1-4ccc6add7806', '95f66070-b8bb-11e8-8e4f-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f66073-b8bb-11e8-920b-4ccc6add7806', '95f66072-b8bb-11e8-8712-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f68765-b8bb-11e8-a22d-4ccc6add7806', '95f68764-b8bb-11e8-b205-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f68767-b8bb-11e8-8184-4ccc6add7806', '95f68766-b8bb-11e8-99db-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f68769-b8bb-11e8-9dd0-4ccc6add7806', '95f68768-b8bb-11e8-b217-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f6ae5d-b8bb-11e8-8319-4ccc6add7806', '95f6ae5c-b8bb-11e8-a75e-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f6ae5f-b8bb-11e8-a627-4ccc6add7806', '95f6ae5e-b8bb-11e8-8d24-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f6ae61-b8bb-11e8-a236-4ccc6add7806', '95f6ae60-b8bb-11e8-9d1f-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f6d553-b8bb-11e8-a32a-4ccc6add7806', '95f6d552-b8bb-11e8-9421-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f6d555-b8bb-11e8-94c8-4ccc6add7806', '95f6d554-b8bb-11e8-97e1-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f6fc49-b8bb-11e8-9ff5-4ccc6add7806', '95f6fc48-b8bb-11e8-baca-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f6fc4b-b8bb-11e8-be3c-4ccc6add7806', '95f6fc4a-b8bb-11e8-8109-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f6fc4d-b8bb-11e8-af23-4ccc6add7806', '95f6fc4c-b8bb-11e8-9bf0-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f7233b-b8bb-11e8-95cf-4ccc6add7806', '95f7233a-b8bb-11e8-a048-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f7233d-b8bb-11e8-8bf6-4ccc6add7806', '95f7233c-b8bb-11e8-8521-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f7233f-b8bb-11e8-b4fb-4ccc6add7806', '95f7233e-b8bb-11e8-a0f5-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f74a2f-b8bb-11e8-ad50-4ccc6add7806', '95f74a2e-b8bb-11e8-b024-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f74a31-b8bb-11e8-a0a6-4ccc6add7806', '95f74a30-b8bb-11e8-bd1d-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f74a33-b8bb-11e8-8bdf-4ccc6add7806', '95f74a32-b8bb-11e8-85f4-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f77125-b8bb-11e8-bb59-4ccc6add7806', '95f77124-b8bb-11e8-a9c4-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f77127-b8bb-11e8-9e7d-4ccc6add7806', '95f77126-b8bb-11e8-bf77-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f7981b-b8bb-11e8-a6c7-4ccc6add7806', '95f7981a-b8bb-11e8-8ebb-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f7981d-b8bb-11e8-81a5-4ccc6add7806', '95f7981c-b8bb-11e8-8bba-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f7981f-b8bb-11e8-a35f-4ccc6add7806', '95f7981e-b8bb-11e8-b22c-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f7bf11-b8bb-11e8-b688-4ccc6add7806', '95f7bf10-b8bb-11e8-b62f-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('95f7bf13-b8bb-11e8-81cc-4ccc6add7806', '95f7bf12-b8bb-11e8-b5f1-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f7bf15-b8bb-11e8-890d-4ccc6add7806', '95f7bf14-b8bb-11e8-9852-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f7e607-b8bb-11e8-b0a2-4ccc6add7806', '95f7e606-b8bb-11e8-b4e5-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f7e609-b8bb-11e8-b40f-4ccc6add7806', '95f7e608-b8bb-11e8-af49-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f80cfb-b8bb-11e8-8f92-4ccc6add7806', '95f80cfa-b8bb-11e8-9e85-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f80cfd-b8bb-11e8-8d48-4ccc6add7806', '95f80cfc-b8bb-11e8-9b69-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f80cff-b8bb-11e8-a07b-4ccc6add7806', '95f80cfe-b8bb-11e8-86e4-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f833f1-b8bb-11e8-bf9e-4ccc6add7806', '95f833f0-b8bb-11e8-ac94-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f833f3-b8bb-11e8-8442-4ccc6add7806', '95f833f2-b8bb-11e8-a5ab-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f833f5-b8bb-11e8-88da-4ccc6add7806', '95f833f4-b8bb-11e8-98c5-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f85ae5-b8bb-11e8-a276-4ccc6add7806', '95f85ae4-b8bb-11e8-b07a-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f85ae7-b8bb-11e8-86f4-4ccc6add7806', '95f85ae6-b8bb-11e8-8b30-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f85ae9-b8bb-11e8-a9f3-4ccc6add7806', '95f85ae8-b8bb-11e8-8dbe-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f881db-b8bb-11e8-8528-4ccc6add7806', '95f881da-b8bb-11e8-bd84-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f881dd-b8bb-11e8-a3f4-4ccc6add7806', '95f881dc-b8bb-11e8-a7a2-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f8a8d1-b8bb-11e8-9bf7-4ccc6add7806', '95f8a8d0-b8bb-11e8-9c87-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f8a8d3-b8bb-11e8-9699-4ccc6add7806', '95f8a8d2-b8bb-11e8-b6b2-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f8a8d5-b8bb-11e8-8af0-4ccc6add7806', '95f8a8d4-b8bb-11e8-b5e8-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f8cfc7-b8bb-11e8-a549-4ccc6add7806', '95f8cfc6-b8bb-11e8-82fb-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f8cfc9-b8bb-11e8-af72-4ccc6add7806', '95f8cfc8-b8bb-11e8-b28d-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f8cfcb-b8bb-11e8-81fb-4ccc6add7806', '95f8cfca-b8bb-11e8-81f5-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f8f6bb-b8bb-11e8-9a23-4ccc6add7806', '95f8f6ba-b8bb-11e8-ad66-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f8f6bd-b8bb-11e8-bfad-4ccc6add7806', '95f8f6bc-b8bb-11e8-a259-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f91db1-b8bb-11e8-84f3-4ccc6add7806', '95f91db0-b8bb-11e8-bf5c-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f91db3-b8bb-11e8-9ef7-4ccc6add7806', '95f91db2-b8bb-11e8-bb9b-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f91db5-b8bb-11e8-90a1-4ccc6add7806', '95f91db4-b8bb-11e8-848b-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f944a7-b8bb-11e8-a61d-4ccc6add7806', '95f944a6-b8bb-11e8-a456-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f944a9-b8bb-11e8-967b-4ccc6add7806', '95f944a8-b8bb-11e8-90e1-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f944ab-b8bb-11e8-abbf-4ccc6add7806', '95f944aa-b8bb-11e8-bfe6-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f96b9d-b8bb-11e8-99f2-4ccc6add7806', '95f96b9c-b8bb-11e8-aed6-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f96b9f-b8bb-11e8-a59a-4ccc6add7806', '95f96b9e-b8bb-11e8-92ad-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f9928d-b8bb-11e8-a2df-4ccc6add7806', '95f9928c-b8bb-11e8-a162-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f9928f-b8bb-11e8-905f-4ccc6add7806', '95f9928e-b8bb-11e8-bc6d-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f99291-b8bb-11e8-a2ba-4ccc6add7806', '95f99290-b8bb-11e8-89c0-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f9b987-b8bb-11e8-b043-4ccc6add7806', '95f9b986-b8bb-11e8-ab85-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f9b989-b8bb-11e8-9b63-4ccc6add7806', '95f9b988-b8bb-11e8-a86c-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f9b98b-b8bb-11e8-a670-4ccc6add7806', '95f9b98a-b8bb-11e8-a337-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f9e07b-b8bb-11e8-b10a-4ccc6add7806', '95f9e07a-b8bb-11e8-9a96-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f9e07d-b8bb-11e8-bf8b-4ccc6add7806', '95f9e07c-b8bb-11e8-b887-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95f9e07f-b8bb-11e8-b1d9-4ccc6add7806', '95f9e07e-b8bb-11e8-8ced-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95fa076f-b8bb-11e8-9833-4ccc6add7806', '95fa076e-b8bb-11e8-b402-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95fa0771-b8bb-11e8-8c97-4ccc6add7806', '95fa0770-b8bb-11e8-b00d-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95fa2e65-b8bb-11e8-9961-4ccc6add7806', '95fa2e64-b8bb-11e8-ba34-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95fa2e67-b8bb-11e8-9058-4ccc6add7806', '95fa2e66-b8bb-11e8-a149-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95fa2e69-b8bb-11e8-b26e-4ccc6add7806', '95fa2e68-b8bb-11e8-87c9-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95fa555d-b8bb-11e8-91ae-4ccc6add7806', '95fa555c-b8bb-11e8-9295-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95fa555f-b8bb-11e8-bbde-4ccc6add7806', '95fa555e-b8bb-11e8-b8d9-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95fa5561-b8bb-11e8-9c8e-4ccc6add7806', '95fa5560-b8bb-11e8-a15e-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95fa7c53-b8bb-11e8-830a-4ccc6add7806', '95fa7c52-b8bb-11e8-b0a7-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95fa7c55-b8bb-11e8-af69-4ccc6add7806', '95fa7c54-b8bb-11e8-920d-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95faa347-b8bb-11e8-8b4f-4ccc6add7806', '95faa346-b8bb-11e8-b97c-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95faa349-b8bb-11e8-af91-4ccc6add7806', '95faa348-b8bb-11e8-adc5-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95faa34b-b8bb-11e8-90f1-4ccc6add7806', '95faa34a-b8bb-11e8-9fbb-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95faca39-b8bb-11e8-bffb-4ccc6add7806', '95faca38-b8bb-11e8-90d2-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95faca3b-b8bb-11e8-b165-4ccc6add7806', '95faca3a-b8bb-11e8-b43a-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('95faca3d-b8bb-11e8-9cba-4ccc6add7806', '95faca3c-b8bb-11e8-9eaf-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('95faf12f-b8bb-11e8-bcf4-4ccc6add7806', '95faf12e-b8bb-11e8-8e4f-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('95faf131-b8bb-11e8-acfe-4ccc6add7806', '95faf130-b8bb-11e8-969b-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('95faf133-b8bb-11e8-b724-4ccc6add7806', '95faf132-b8bb-11e8-a52b-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('95fb1825-b8bb-11e8-be12-4ccc6add7806', '95fb1824-b8bb-11e8-a345-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('95fb1827-b8bb-11e8-83fe-4ccc6add7806', '95fb1826-b8bb-11e8-8cb2-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('95fb3f1b-b8bb-11e8-b495-4ccc6add7806', '95fb3f1a-b8bb-11e8-8bcd-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('95fb3f1d-b8bb-11e8-b131-4ccc6add7806', '95fb3f1c-b8bb-11e8-a05b-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('95fb3f1f-b8bb-11e8-a241-4ccc6add7806', '95fb3f1e-b8bb-11e8-9600-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('95fb6611-b8bb-11e8-b12f-4ccc6add7806', '95fb6610-b8bb-11e8-946d-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('95fb6613-b8bb-11e8-9b90-4ccc6add7806', '95fb6612-b8bb-11e8-83b4-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('95fb6615-b8bb-11e8-b264-4ccc6add7806', '95fb6614-b8bb-11e8-942e-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('95fb8d07-b8bb-11e8-a3a8-4ccc6add7806', '95fb8d06-b8bb-11e8-a232-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('95fb8d09-b8bb-11e8-ac7d-4ccc6add7806', '95fb8d08-b8bb-11e8-87ad-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('95fbb3fb-b8bb-11e8-8f98-4ccc6add7806', '95fbb3fa-b8bb-11e8-9d1d-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('95fbb3fd-b8bb-11e8-904d-4ccc6add7806', '95fbb3fc-b8bb-11e8-abd9-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('95fbb3ff-b8bb-11e8-80ce-4ccc6add7806', '95fbb3fe-b8bb-11e8-aa8e-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('95fbdaef-b8bb-11e8-a41c-4ccc6add7806', '95fbdaee-b8bb-11e8-9f35-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('95fbdaf1-b8bb-11e8-a252-4ccc6add7806', '95fbdaf0-b8bb-11e8-869e-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('95fbdaf3-b8bb-11e8-b3d0-4ccc6add7806', '95fbdaf2-b8bb-11e8-8ae4-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('95fc01e5-b8bb-11e8-888a-4ccc6add7806', '95fc01e4-b8bb-11e8-a126-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('95fc01e7-b8bb-11e8-89ce-4ccc6add7806', '95fc01e6-b8bb-11e8-9998-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('95fc01e9-b8bb-11e8-b98b-4ccc6add7806', '95fc01e8-b8bb-11e8-a6c2-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('95fc28db-b8bb-11e8-9705-4ccc6add7806', '95fc28da-b8bb-11e8-9a68-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('95fc28dd-b8bb-11e8-832b-4ccc6add7806', '95fc28dc-b8bb-11e8-891c-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('95fc4fd1-b8bb-11e8-9cfb-4ccc6add7806', '95fc4fd0-b8bb-11e8-b7b6-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('95fc4fd3-b8bb-11e8-ac6d-4ccc6add7806', '95fc4fd2-b8bb-11e8-9e72-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('95fc4fd5-b8bb-11e8-bbd6-4ccc6add7806', '95fc4fd4-b8bb-11e8-a771-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('95fc76c7-b8bb-11e8-a4f1-4ccc6add7806', '95fc76c6-b8bb-11e8-b713-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('95fc76c9-b8bb-11e8-a51b-4ccc6add7806', '95fc76c8-b8bb-11e8-a47a-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fc76cb-b8bb-11e8-b006-4ccc6add7806', '95fc76ca-b8bb-11e8-bd4d-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fc9dbb-b8bb-11e8-ada5-4ccc6add7806', '95fc9dba-b8bb-11e8-8212-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fc9dbd-b8bb-11e8-9e27-4ccc6add7806', '95fc9dbc-b8bb-11e8-974e-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fcc4b1-b8bb-11e8-801a-4ccc6add7806', '95fcc4b0-b8bb-11e8-82e1-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fcc4b3-b8bb-11e8-bdfb-4ccc6add7806', '95fcc4b2-b8bb-11e8-94e7-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fcc4b5-b8bb-11e8-9ba4-4ccc6add7806', '95fcc4b4-b8bb-11e8-9b90-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fceba3-b8bb-11e8-9624-4ccc6add7806', '95fceba2-b8bb-11e8-9194-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fceba5-b8bb-11e8-b1f9-4ccc6add7806', '95fceba4-b8bb-11e8-817e-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fceba7-b8bb-11e8-8dc1-4ccc6add7806', '95fceba6-b8bb-11e8-ae96-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fd1299-b8bb-11e8-97ad-4ccc6add7806', '95fd1298-b8bb-11e8-b2c2-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fd129b-b8bb-11e8-8bfb-4ccc6add7806', '95fd129a-b8bb-11e8-860b-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fd129d-b8bb-11e8-980a-4ccc6add7806', '95fd129c-b8bb-11e8-a3ab-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fd398d-b8bb-11e8-8770-4ccc6add7806', '95fd398c-b8bb-11e8-8142-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fd398f-b8bb-11e8-9780-4ccc6add7806', '95fd398e-b8bb-11e8-9f00-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fd6087-b8bb-11e8-8081-4ccc6add7806', '95fd6086-b8bb-11e8-bc20-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fd6089-b8bb-11e8-bffa-4ccc6add7806', '95fd6088-b8bb-11e8-bfe2-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fd608b-b8bb-11e8-a6d3-4ccc6add7806', '95fd608a-b8bb-11e8-ab11-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fd8779-b8bb-11e8-a4f8-4ccc6add7806', '95fd8778-b8bb-11e8-8be8-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fd877b-b8bb-11e8-b0ee-4ccc6add7806', '95fd877a-b8bb-11e8-b7d5-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fd877d-b8bb-11e8-90ff-4ccc6add7806', '95fd877c-b8bb-11e8-b250-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fdae6f-b8bb-11e8-bb9c-4ccc6add7806', '95fdae6e-b8bb-11e8-bb5a-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fdae71-b8bb-11e8-82c3-4ccc6add7806', '95fdae70-b8bb-11e8-a73f-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fdd565-b8bb-11e8-87f3-4ccc6add7806', '95fdd564-b8bb-11e8-b7cd-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fdd567-b8bb-11e8-82fc-4ccc6add7806', '95fdd566-b8bb-11e8-9f54-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fdd569-b8bb-11e8-a88a-4ccc6add7806', '95fdd568-b8bb-11e8-aada-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fdfc5d-b8bb-11e8-bf42-4ccc6add7806', '95fdfc5c-b8bb-11e8-9594-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fdfc5f-b8bb-11e8-9bb5-4ccc6add7806', '95fdfc5e-b8bb-11e8-8529-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fdfc61-b8bb-11e8-998e-4ccc6add7806', '95fdfc60-b8bb-11e8-b723-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fe234d-b8bb-11e8-b093-4ccc6add7806', '95fe234c-b8bb-11e8-b1e0-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fe234f-b8bb-11e8-8068-4ccc6add7806', '95fe234e-b8bb-11e8-a1c8-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fe4a47-b8bb-11e8-8a72-4ccc6add7806', '95fe4a46-b8bb-11e8-92d7-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fe4a49-b8bb-11e8-a759-4ccc6add7806', '95fe4a48-b8bb-11e8-8ad5-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fe4a4b-b8bb-11e8-b6ab-4ccc6add7806', '95fe4a4a-b8bb-11e8-b93e-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fe7139-b8bb-11e8-8be6-4ccc6add7806', '95fe7138-b8bb-11e8-b7f1-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fe713b-b8bb-11e8-8ddf-4ccc6add7806', '95fe713a-b8bb-11e8-a9d8-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fe713d-b8bb-11e8-b992-4ccc6add7806', '95fe713c-b8bb-11e8-932d-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fe982f-b8bb-11e8-a4e5-4ccc6add7806', '95fe982e-b8bb-11e8-b7fa-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fe9831-b8bb-11e8-8f7f-4ccc6add7806', '95fe9830-b8bb-11e8-af26-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fe9833-b8bb-11e8-9f71-4ccc6add7806', '95fe9832-b8bb-11e8-9445-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95febf25-b8bb-11e8-b944-4ccc6add7806', '95febf24-b8bb-11e8-b7d3-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95febf27-b8bb-11e8-b4f9-4ccc6add7806', '95febf26-b8bb-11e8-80f4-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fee61b-b8bb-11e8-b563-4ccc6add7806', '95fee61a-b8bb-11e8-9bfd-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fee61d-b8bb-11e8-9abd-4ccc6add7806', '95fee61c-b8bb-11e8-b744-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95fee61f-b8bb-11e8-9815-4ccc6add7806', '95fee61e-b8bb-11e8-82c6-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95ff0d11-b8bb-11e8-b612-4ccc6add7806', '95ff0d10-b8bb-11e8-89cb-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95ff0d13-b8bb-11e8-9102-4ccc6add7806', '95ff0d12-b8bb-11e8-9054-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95ff0d15-b8bb-11e8-9243-4ccc6add7806', '95ff0d14-b8bb-11e8-8b55-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95ff3407-b8bb-11e8-84a5-4ccc6add7806', '95ff3406-b8bb-11e8-8141-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95ff3409-b8bb-11e8-a82b-4ccc6add7806', '95ff3408-b8bb-11e8-b98f-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95ff340b-b8bb-11e8-8c2b-4ccc6add7806', '95ff340a-b8bb-11e8-91cc-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95ff5afb-b8bb-11e8-902c-4ccc6add7806', '95ff5afa-b8bb-11e8-bbba-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95ff5afd-b8bb-11e8-895d-4ccc6add7806', '95ff5afc-b8bb-11e8-a6f4-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95ff81ef-b8bb-11e8-bfe1-4ccc6add7806', '95ff81ee-b8bb-11e8-9a92-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95ff81f1-b8bb-11e8-b07c-4ccc6add7806', '95ff81f0-b8bb-11e8-9cca-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95ff81f3-b8bb-11e8-baec-4ccc6add7806', '95ff81f2-b8bb-11e8-a2b2-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('95ffa8e5-b8bb-11e8-8dee-4ccc6add7806', '95ffa8e4-b8bb-11e8-933b-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('95ffa8e7-b8bb-11e8-81ae-4ccc6add7806', '95ffa8e6-b8bb-11e8-9528-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('95ffa8e9-b8bb-11e8-8a49-4ccc6add7806', '95ffa8e8-b8bb-11e8-b6f9-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('95ffcfdb-b8bb-11e8-a8e6-4ccc6add7806', '95ffcfda-b8bb-11e8-941b-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('95ffcfdd-b8bb-11e8-a1f0-4ccc6add7806', '95ffcfdc-b8bb-11e8-84ca-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('95fff6d0-b8bb-11e8-af63-4ccc6add7806', '95ffcfde-b8bb-11e8-a9a2-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('95fff6d2-b8bb-11e8-8d59-4ccc6add7806', '95fff6d1-b8bb-11e8-b228-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('95fff6d4-b8bb-11e8-91bf-4ccc6add7806', '95fff6d3-b8bb-11e8-a336-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('96001dc7-b8bb-11e8-99e3-4ccc6add7806', '96001dc6-b8bb-11e8-833a-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('96001dc9-b8bb-11e8-bb4e-4ccc6add7806', '96001dc8-b8bb-11e8-8931-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('96001dcb-b8bb-11e8-a617-4ccc6add7806', '96001dca-b8bb-11e8-95bf-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('960044bb-b8bb-11e8-bc69-4ccc6add7806', '960044ba-b8bb-11e8-a176-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('960044bd-b8bb-11e8-b70e-4ccc6add7806', '960044bc-b8bb-11e8-95f7-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('960044bf-b8bb-11e8-84c7-4ccc6add7806', '960044be-b8bb-11e8-b75b-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('96006bb1-b8bb-11e8-b0bd-4ccc6add7806', '96006bb0-b8bb-11e8-9334-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('96006bb3-b8bb-11e8-b28f-4ccc6add7806', '96006bb2-b8bb-11e8-a0e0-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('960092a7-b8bb-11e8-a26a-4ccc6add7806', '960092a6-b8bb-11e8-9a52-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('960092a9-b8bb-11e8-8752-4ccc6add7806', '960092a8-b8bb-11e8-9a2b-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('960092ab-b8bb-11e8-84d4-4ccc6add7806', '960092aa-b8bb-11e8-9303-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('9600b99d-b8bb-11e8-bd67-4ccc6add7806', '9600b99c-b8bb-11e8-a320-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('9600b99f-b8bb-11e8-b757-4ccc6add7806', '9600b99e-b8bb-11e8-84e0-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('9600b9a1-b8bb-11e8-a89c-4ccc6add7806', '9600b9a0-b8bb-11e8-a704-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('9600e093-b8bb-11e8-90d4-4ccc6add7806', '9600e092-b8bb-11e8-9839-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('9600e095-b8bb-11e8-92c0-4ccc6add7806', '9600e094-b8bb-11e8-bd00-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('9600e097-b8bb-11e8-a038-4ccc6add7806', '9600e096-b8bb-11e8-a49b-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('96010783-b8bb-11e8-adb7-4ccc6add7806', '96010782-b8bb-11e8-88c6-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('96010785-b8bb-11e8-a2d4-4ccc6add7806', '96010784-b8bb-11e8-9037-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('96012e79-b8bb-11e8-b86e-4ccc6add7806', '96012e78-b8bb-11e8-8193-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('96012e7b-b8bb-11e8-9230-4ccc6add7806', '96012e7a-b8bb-11e8-8341-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('96012e7d-b8bb-11e8-94f4-4ccc6add7806', '96012e7c-b8bb-11e8-915d-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('9601556f-b8bb-11e8-8bf3-4ccc6add7806', '9601556e-b8bb-11e8-bf2e-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('96015571-b8bb-11e8-9ce1-4ccc6add7806', '96015570-b8bb-11e8-9098-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('96015573-b8bb-11e8-b295-4ccc6add7806', '96015572-b8bb-11e8-90a5-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('96017c65-b8bb-11e8-a1fe-4ccc6add7806', '96017c64-b8bb-11e8-992f-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('96017c67-b8bb-11e8-b0c4-4ccc6add7806', '96017c66-b8bb-11e8-8c90-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('9601a35b-b8bb-11e8-81fa-4ccc6add7806', '9601a35a-b8bb-11e8-86c1-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('9601a35d-b8bb-11e8-91e6-4ccc6add7806', '9601a35c-b8bb-11e8-bc42-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('9601a35f-b8bb-11e8-8fba-4ccc6add7806', '9601a35e-b8bb-11e8-a84c-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('9601ca4d-b8bb-11e8-ac44-4ccc6add7806', '9601ca4c-b8bb-11e8-a39d-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('9601ca4f-b8bb-11e8-9722-4ccc6add7806', '9601ca4e-b8bb-11e8-b426-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('9601ca51-b8bb-11e8-9a77-4ccc6add7806', '9601ca50-b8bb-11e8-9154-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('9601f143-b8bb-11e8-bcba-4ccc6add7806', '9601f142-b8bb-11e8-85df-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('9601f145-b8bb-11e8-8275-4ccc6add7806', '9601f144-b8bb-11e8-ad36-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('9601f147-b8bb-11e8-8c32-4ccc6add7806', '9601f146-b8bb-11e8-be97-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('9602183b-b8bb-11e8-a3e0-4ccc6add7806', '9602183a-b8bb-11e8-9a18-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('9602183d-b8bb-11e8-990a-4ccc6add7806', '9602183c-b8bb-11e8-994b-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('96023f2f-b8bb-11e8-9da3-4ccc6add7806', '96023f2e-b8bb-11e8-9101-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('96023f31-b8bb-11e8-996b-4ccc6add7806', '96023f30-b8bb-11e8-95ca-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('96023f33-b8bb-11e8-9238-4ccc6add7806', '96023f32-b8bb-11e8-b773-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('96026625-b8bb-11e8-b95f-4ccc6add7806', '96026624-b8bb-11e8-bdda-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('96026627-b8bb-11e8-920f-4ccc6add7806', '96026626-b8bb-11e8-8bc7-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('96026629-b8bb-11e8-8d71-4ccc6add7806', '96026628-b8bb-11e8-90ca-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('96028d1b-b8bb-11e8-b4b0-4ccc6add7806', '96028d1a-b8bb-11e8-8f31-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('96028d1d-b8bb-11e8-9e84-4ccc6add7806', '96028d1c-b8bb-11e8-81c2-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('96028d1f-b8bb-11e8-9513-4ccc6add7806', '96028d1e-b8bb-11e8-a479-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('9602b413-b8bb-11e8-a560-4ccc6add7806', '9602b412-b8bb-11e8-9a19-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('9602b415-b8bb-11e8-939d-4ccc6add7806', '9602b414-b8bb-11e8-b27a-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('9602db07-b8bb-11e8-8235-4ccc6add7806', '9602db06-b8bb-11e8-9a25-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('9602db09-b8bb-11e8-89c9-4ccc6add7806', '9602db08-b8bb-11e8-99d9-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('9602db0b-b8bb-11e8-92f8-4ccc6add7806', '9602db0a-b8bb-11e8-8c8d-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('960301fb-b8bb-11e8-a0fb-4ccc6add7806', '960301fa-b8bb-11e8-a711-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('960301fd-b8bb-11e8-a1ad-4ccc6add7806', '960301fc-b8bb-11e8-8afa-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('960301ff-b8bb-11e8-9121-4ccc6add7806', '960301fe-b8bb-11e8-b78d-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('960328f5-b8bb-11e8-ad94-4ccc6add7806', '960328f4-b8bb-11e8-9efc-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('960328f7-b8bb-11e8-aa08-4ccc6add7806', '960328f6-b8bb-11e8-a503-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('96034fe5-b8bb-11e8-9955-4ccc6add7806', '96034fe4-b8bb-11e8-88cb-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('96034fe7-b8bb-11e8-ace0-4ccc6add7806', '96034fe6-b8bb-11e8-bcc6-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('96034fe9-b8bb-11e8-9bb6-4ccc6add7806', '96034fe8-b8bb-11e8-9b35-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('960376db-b8bb-11e8-b589-4ccc6add7806', '960376da-b8bb-11e8-b598-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('960376dd-b8bb-11e8-9ae2-4ccc6add7806', '960376dc-b8bb-11e8-9b77-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('960376df-b8bb-11e8-859a-4ccc6add7806', '960376de-b8bb-11e8-a168-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('96039dcd-b8bb-11e8-8e4c-4ccc6add7806', '96039dcc-b8bb-11e8-bead-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('96039dcf-b8bb-11e8-bacf-4ccc6add7806', '96039dce-b8bb-11e8-961d-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('96039dd1-b8bb-11e8-831b-4ccc6add7806', '96039dd0-b8bb-11e8-8a55-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('9603c4c7-b8bb-11e8-9b10-4ccc6add7806', '9603c4c6-b8bb-11e8-a89f-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('9603c4c9-b8bb-11e8-8aed-4ccc6add7806', '9603c4c8-b8bb-11e8-b89d-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('9603ebbb-b8bb-11e8-9397-4ccc6add7806', '9603ebba-b8bb-11e8-8741-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('9603ebbd-b8bb-11e8-8613-4ccc6add7806', '9603ebbc-b8bb-11e8-a7b2-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('9603ebbf-b8bb-11e8-8724-4ccc6add7806', '9603ebbe-b8bb-11e8-8a63-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('960412b1-b8bb-11e8-b6d0-4ccc6add7806', '960412b0-b8bb-11e8-95d0-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('960412b3-b8bb-11e8-b6cf-4ccc6add7806', '960412b2-b8bb-11e8-a241-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('960412b5-b8bb-11e8-8481-4ccc6add7806', '960412b4-b8bb-11e8-bb28-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('960439a5-b8bb-11e8-bc91-4ccc6add7806', '960439a4-b8bb-11e8-87dc-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('960439a7-b8bb-11e8-ba47-4ccc6add7806', '960439a6-b8bb-11e8-a57a-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('9604609d-b8bb-11e8-a96c-4ccc6add7806', '9604609c-b8bb-11e8-a993-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('9604609f-b8bb-11e8-962f-4ccc6add7806', '9604609e-b8bb-11e8-a0b4-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('960460a1-b8bb-11e8-87b0-4ccc6add7806', '960460a0-b8bb-11e8-9558-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('9604878d-b8bb-11e8-849e-4ccc6add7806', '9604878c-b8bb-11e8-beb0-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('9604878f-b8bb-11e8-aba1-4ccc6add7806', '9604878e-b8bb-11e8-b4f5-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('96048791-b8bb-11e8-8a5e-4ccc6add7806', '96048790-b8bb-11e8-836d-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('9604ae83-b8bb-11e8-816d-4ccc6add7806', '9604ae82-b8bb-11e8-baa1-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('9604ae85-b8bb-11e8-927a-4ccc6add7806', '9604ae84-b8bb-11e8-8980-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('9604ae87-b8bb-11e8-b2a1-4ccc6add7806', '9604ae86-b8bb-11e8-9c4a-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('9604d579-b8bb-11e8-8796-4ccc6add7806', '9604d578-b8bb-11e8-8d92-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('9604d57b-b8bb-11e8-8ceb-4ccc6add7806', '9604d57a-b8bb-11e8-9e77-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('9604fc6f-b8bb-11e8-94b4-4ccc6add7806', '9604fc6e-b8bb-11e8-9ecf-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('9604fc71-b8bb-11e8-a30a-4ccc6add7806', '9604fc70-b8bb-11e8-a0cc-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('9604fc73-b8bb-11e8-bd1d-4ccc6add7806', '9604fc72-b8bb-11e8-aa30-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('96052365-b8bb-11e8-ab08-4ccc6add7806', '96052364-b8bb-11e8-8ccb-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('96052367-b8bb-11e8-8097-4ccc6add7806', '96052366-b8bb-11e8-b5dd-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('96052369-b8bb-11e8-b001-4ccc6add7806', '96052368-b8bb-11e8-810b-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('96054a5f-b8bb-11e8-b58c-4ccc6add7806', '96054a5e-b8bb-11e8-b37a-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('96054a61-b8bb-11e8-b56a-4ccc6add7806', '96054a60-b8bb-11e8-a47e-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('96054a63-b8bb-11e8-ad25-4ccc6add7806', '96054a62-b8bb-11e8-8d80-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('96057151-b8bb-11e8-9ae5-4ccc6add7806', '96057150-b8bb-11e8-b5ad-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('96057153-b8bb-11e8-8ef0-4ccc6add7806', '96057152-b8bb-11e8-ad49-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('96059843-b8bb-11e8-aaf3-4ccc6add7806', '96059842-b8bb-11e8-b103-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('96059845-b8bb-11e8-ac0c-4ccc6add7806', '96059844-b8bb-11e8-a34a-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('96059847-b8bb-11e8-838b-4ccc6add7806', '96059846-b8bb-11e8-aa3e-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('9605bf3b-b8bb-11e8-9cc5-4ccc6add7806', '9605bf3a-b8bb-11e8-81cb-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('9605bf3d-b8bb-11e8-924b-4ccc6add7806', '9605bf3c-b8bb-11e8-971b-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('9605bf3f-b8bb-11e8-b43a-4ccc6add7806', '9605bf3e-b8bb-11e8-9958-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('9605e62f-b8bb-11e8-8993-4ccc6add7806', '9605e62e-b8bb-11e8-a111-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('9605e631-b8bb-11e8-977a-4ccc6add7806', '9605e630-b8bb-11e8-a513-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('96060d25-b8bb-11e8-8607-4ccc6add7806', '96060d24-b8bb-11e8-8b3a-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('96060d27-b8bb-11e8-93ad-4ccc6add7806', '96060d26-b8bb-11e8-bd2b-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('96060d29-b8bb-11e8-abfb-4ccc6add7806', '96060d28-b8bb-11e8-afeb-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('97aed071-b8ba-11e8-b65c-4ccc6add7806', '97aed070-b8ba-11e8-a62a-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('97aed072-b8ba-11e8-a031-4ccc6add7806', '97aed070-b8ba-11e8-a62a-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('97aed074-b8ba-11e8-863f-4ccc6add7806', '97aed073-b8ba-11e8-840d-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('97aed075-b8ba-11e8-a447-4ccc6add7806', '97aed073-b8ba-11e8-840d-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('97aeee69-b8ba-11e8-88b4-4ccc6add7806', '97aeee68-b8ba-11e8-a32f-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('97aeee6a-b8ba-11e8-bf07-4ccc6add7806', '97aeee68-b8ba-11e8-a32f-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('97aeee6b-b8ba-11e8-b146-4ccc6add7806', '97aeee68-b8ba-11e8-a32f-4ccc6add7806', '53');
INSERT INTO `client_user_class` VALUES ('97aeee70-b8ba-11e8-a4c2-4ccc6add7806', '97aeee6f-b8ba-11e8-8a75-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('97aeee71-b8ba-11e8-a7ee-4ccc6add7806', '97aeee6f-b8ba-11e8-8a75-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('97aeee72-b8ba-11e8-b3d7-4ccc6add7806', '97aeee6f-b8ba-11e8-8a75-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('97aeee73-b8ba-11e8-8c13-4ccc6add7806', '97aeee6f-b8ba-11e8-8a75-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('97aeee74-b8ba-11e8-8bd1-4ccc6add7806', '97aeee6f-b8ba-11e8-8a75-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('97aeee76-b8ba-11e8-a547-4ccc6add7806', '97aeee75-b8ba-11e8-b569-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('97aeee77-b8ba-11e8-8c60-4ccc6add7806', '97aeee75-b8ba-11e8-b569-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('97aeee78-b8ba-11e8-8d6d-4ccc6add7806', '97aeee75-b8ba-11e8-b569-4ccc6add7806', '53');
INSERT INTO `client_user_class` VALUES ('97aeee79-b8ba-11e8-9fe6-4ccc6add7806', '97aeee75-b8ba-11e8-b569-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('97aeee7a-b8ba-11e8-8714-4ccc6add7806', '97aeee75-b8ba-11e8-b569-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('97aeee7b-b8ba-11e8-8f8a-4ccc6add7806', '97aeee75-b8ba-11e8-b569-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('97aeee7d-b8ba-11e8-8ee6-4ccc6add7806', '97aeee7c-b8ba-11e8-866c-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('97aeee7e-b8ba-11e8-9ec5-4ccc6add7806', '97aeee7c-b8ba-11e8-866c-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('97aeee80-b8ba-11e8-b265-4ccc6add7806', '97aeee7f-b8ba-11e8-84a4-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('97aeee83-b8ba-11e8-9aa7-4ccc6add7806', '97aeee82-b8ba-11e8-8da8-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('97aeee85-b8ba-11e8-892f-4ccc6add7806', '97aeee84-b8ba-11e8-bd9d-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('97aeee87-b8ba-11e8-894a-4ccc6add7806', '97aeee86-b8ba-11e8-9c7a-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('97aeee89-b8ba-11e8-97e8-4ccc6add7806', '97aeee88-b8ba-11e8-bfd8-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('97aeee8b-b8ba-11e8-88db-4ccc6add7806', '97aeee8a-b8ba-11e8-86d5-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('97aeee8d-b8ba-11e8-b544-4ccc6add7806', '97aeee8c-b8ba-11e8-b0bb-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('97aeee8f-b8ba-11e8-a686-4ccc6add7806', '97aeee8e-b8ba-11e8-806a-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('97aeee91-b8ba-11e8-aebf-4ccc6add7806', '97aeee90-b8ba-11e8-ba65-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('97aeee93-b8ba-11e8-a7a0-4ccc6add7806', '97aeee92-b8ba-11e8-8aa2-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('97aeee95-b8ba-11e8-87e8-4ccc6add7806', '97aeee94-b8ba-11e8-ad90-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('97aeee97-b8ba-11e8-bf42-4ccc6add7806', '97aeee96-b8ba-11e8-b584-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('97aeee98-b8ba-11e8-89da-4ccc6add7806', '97aeee96-b8ba-11e8-b584-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('97af1559-b8ba-11e8-bdac-4ccc6add7806', '97af1558-b8ba-11e8-bee0-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('97af155b-b8ba-11e8-8f95-4ccc6add7806', '97af155a-b8ba-11e8-a4a6-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('97af155d-b8ba-11e8-b884-4ccc6add7806', '97af155c-b8ba-11e8-9b90-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('97af155f-b8ba-11e8-91c3-4ccc6add7806', '97af155e-b8ba-11e8-9415-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('97af1560-b8ba-11e8-b80e-4ccc6add7806', '97af155e-b8ba-11e8-9415-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('97af1562-b8ba-11e8-898c-4ccc6add7806', '97af1561-b8ba-11e8-9435-4ccc6add7806', '14');
INSERT INTO `client_user_class` VALUES ('97af1564-b8ba-11e8-b37a-4ccc6add7806', '97af1563-b8ba-11e8-ab20-4ccc6add7806', '23');
INSERT INTO `client_user_class` VALUES ('97af1566-b8ba-11e8-9a1c-4ccc6add7806', '97af1565-b8ba-11e8-ab5c-4ccc6add7806', '53');
INSERT INTO `client_user_class` VALUES ('97af1568-b8ba-11e8-a07c-4ccc6add7806', '97af1567-b8ba-11e8-a1a1-4ccc6add7806', '53');
INSERT INTO `client_user_class` VALUES ('97af1569-b8ba-11e8-bb48-4ccc6add7806', '97af1567-b8ba-11e8-a1a1-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('97af156b-b8ba-11e8-a9ad-4ccc6add7806', '97af156a-b8ba-11e8-bfb9-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('97af156c-b8ba-11e8-8521-4ccc6add7806', '97af156a-b8ba-11e8-bfb9-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('97af156d-b8ba-11e8-b309-4ccc6add7806', '97af156a-b8ba-11e8-bfb9-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('97af156f-b8ba-11e8-b014-4ccc6add7806', '97af156e-b8ba-11e8-aec2-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('97af1570-b8ba-11e8-9937-4ccc6add7806', '97af156e-b8ba-11e8-aec2-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('97af1571-b8ba-11e8-a0b8-4ccc6add7806', '97af156e-b8ba-11e8-aec2-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('97af1572-b8ba-11e8-a7c0-4ccc6add7806', '97af156e-b8ba-11e8-aec2-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('97af1574-b8ba-11e8-b518-4ccc6add7806', '97af1573-b8ba-11e8-a99a-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('97af1575-b8ba-11e8-bce6-4ccc6add7806', '97af1573-b8ba-11e8-a99a-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('97af1577-b8ba-11e8-a859-4ccc6add7806', '97af1576-b8ba-11e8-b2b2-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('97af1578-b8ba-11e8-93e3-4ccc6add7806', '97af1576-b8ba-11e8-b2b2-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('97af157a-b8ba-11e8-9886-4ccc6add7806', '97af1579-b8ba-11e8-a479-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('97af157c-b8ba-11e8-b9d2-4ccc6add7806', '97af157b-b8ba-11e8-bd0b-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('97af157d-b8ba-11e8-80bf-4ccc6add7806', '97af157b-b8ba-11e8-bd0b-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('97af157f-b8ba-11e8-af81-4ccc6add7806', '97af157e-b8ba-11e8-a0d2-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('97af1580-b8ba-11e8-9b40-4ccc6add7806', '97af157e-b8ba-11e8-a0d2-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('97af1582-b8ba-11e8-aa93-4ccc6add7806', '97af1581-b8ba-11e8-8a01-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('97af1583-b8ba-11e8-b0da-4ccc6add7806', '97af1581-b8ba-11e8-8a01-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('97af1584-b8ba-11e8-b807-4ccc6add7806', '97af1581-b8ba-11e8-8a01-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('97af1585-b8ba-11e8-be80-4ccc6add7806', '97af1581-b8ba-11e8-8a01-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('97af1586-b8ba-11e8-8b1c-4ccc6add7806', '97af1581-b8ba-11e8-8a01-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('97af1587-b8ba-11e8-bd8a-4ccc6add7806', '97af1581-b8ba-11e8-8a01-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('97af1589-b8ba-11e8-9495-4ccc6add7806', '97af1588-b8ba-11e8-86ba-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('97af158a-b8ba-11e8-b0ed-4ccc6add7806', '97af1588-b8ba-11e8-86ba-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('97af158b-b8ba-11e8-bb4f-4ccc6add7806', '97af1588-b8ba-11e8-86ba-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('97af158d-b8ba-11e8-9b26-4ccc6add7806', '97af158c-b8ba-11e8-9877-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('97af158e-b8ba-11e8-8b70-4ccc6add7806', '97af158c-b8ba-11e8-9877-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('97af3c81-b8ba-11e8-88e0-4ccc6add7806', '97af3c80-b8ba-11e8-a9ea-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('97af3c82-b8ba-11e8-84d2-4ccc6add7806', '97af3c80-b8ba-11e8-a9ea-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('97af3c84-b8ba-11e8-abc0-4ccc6add7806', '97af3c83-b8ba-11e8-860f-4ccc6add7806', '14');
INSERT INTO `client_user_class` VALUES ('97af3c85-b8ba-11e8-ae6c-4ccc6add7806', '97af3c83-b8ba-11e8-860f-4ccc6add7806', '23');
INSERT INTO `client_user_class` VALUES ('97af3c87-b8ba-11e8-84b5-4ccc6add7806', '97af3c86-b8ba-11e8-aefd-4ccc6add7806', '53');
INSERT INTO `client_user_class` VALUES ('97af3c88-b8ba-11e8-a761-4ccc6add7806', '97af3c86-b8ba-11e8-aefd-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('97af3c8a-b8ba-11e8-80a4-4ccc6add7806', '97af3c89-b8ba-11e8-8ec6-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('97af3c8b-b8ba-11e8-9b84-4ccc6add7806', '97af3c89-b8ba-11e8-8ec6-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('97af3c8c-b8ba-11e8-ac87-4ccc6add7806', '97af3c89-b8ba-11e8-8ec6-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('97af3c8e-b8ba-11e8-9a4f-4ccc6add7806', '97af3c8d-b8ba-11e8-a9a5-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('97af3c8f-b8ba-11e8-afa9-4ccc6add7806', '97af3c8d-b8ba-11e8-a9a5-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('97af3c90-b8ba-11e8-9969-4ccc6add7806', '97af3c8d-b8ba-11e8-a9a5-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('97af3c91-b8ba-11e8-b2fe-4ccc6add7806', '97af3c8d-b8ba-11e8-a9a5-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('97af3c92-b8ba-11e8-b7be-4ccc6add7806', '97af3c8d-b8ba-11e8-a9a5-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('97af3c94-b8ba-11e8-9bc9-4ccc6add7806', '97af3c93-b8ba-11e8-9ed9-4ccc6add7806', '14');
INSERT INTO `client_user_class` VALUES ('97af3c95-b8ba-11e8-8854-4ccc6add7806', '97af3c93-b8ba-11e8-9ed9-4ccc6add7806', '23');
INSERT INTO `client_user_class` VALUES ('97af3c96-b8ba-11e8-b771-4ccc6add7806', '97af3c93-b8ba-11e8-9ed9-4ccc6add7806', '53');
INSERT INTO `client_user_class` VALUES ('97af3c97-b8ba-11e8-ab19-4ccc6add7806', '97af3c93-b8ba-11e8-9ed9-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('97af3c99-b8ba-11e8-8532-4ccc6add7806', '97af3c98-b8ba-11e8-bd05-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('97af3c9a-b8ba-11e8-9d94-4ccc6add7806', '97af3c98-b8ba-11e8-bd05-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('97af3c9b-b8ba-11e8-a0df-4ccc6add7806', '97af3c98-b8ba-11e8-bd05-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('97af3c9c-b8ba-11e8-aa4a-4ccc6add7806', '97af3c98-b8ba-11e8-bd05-4ccc6add7806', '14');
INSERT INTO `client_user_class` VALUES ('97af3c9d-b8ba-11e8-930a-4ccc6add7806', '97af3c98-b8ba-11e8-bd05-4ccc6add7806', '53');
INSERT INTO `client_user_class` VALUES ('97af3c9f-b8ba-11e8-b465-4ccc6add7806', '97af3c9e-b8ba-11e8-befd-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('97af3ca0-b8ba-11e8-89dc-4ccc6add7806', '97af3c9e-b8ba-11e8-befd-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('97af3ca1-b8ba-11e8-b349-4ccc6add7806', '97af3c9e-b8ba-11e8-befd-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('97af3ca2-b8ba-11e8-bdfc-4ccc6add7806', '97af3c9e-b8ba-11e8-befd-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('97af3ca3-b8ba-11e8-bf98-4ccc6add7806', '97af3c9e-b8ba-11e8-befd-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('97af3ca4-b8ba-11e8-a89d-4ccc6add7806', '97af3c9e-b8ba-11e8-befd-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('97af3ca5-b8ba-11e8-b68f-4ccc6add7806', '97af3c9e-b8ba-11e8-befd-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('97af3ca7-b8ba-11e8-a5d7-4ccc6add7806', '97af3ca6-b8ba-11e8-ada3-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('97af3ca8-b8ba-11e8-9887-4ccc6add7806', '97af3ca6-b8ba-11e8-ada3-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('97af3ca9-b8ba-11e8-846e-4ccc6add7806', '97af3ca6-b8ba-11e8-ada3-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('97af3caa-b8ba-11e8-9195-4ccc6add7806', '97af3ca6-b8ba-11e8-ada3-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('97af3cab-b8ba-11e8-adb9-4ccc6add7806', '97af3ca6-b8ba-11e8-ada3-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('97af3cac-b8ba-11e8-9b07-4ccc6add7806', '97af3ca6-b8ba-11e8-ada3-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('97af3cad-b8ba-11e8-9470-4ccc6add7806', '97af3ca6-b8ba-11e8-ada3-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('97af3cae-b8ba-11e8-b122-4ccc6add7806', '97af3ca6-b8ba-11e8-ada3-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('97af3cb0-b8ba-11e8-bd3b-4ccc6add7806', '97af3caf-b8ba-11e8-85be-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('97af3cb1-b8ba-11e8-ac3a-4ccc6add7806', '97af3caf-b8ba-11e8-85be-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('97af3cb2-b8ba-11e8-ac92-4ccc6add7806', '97af3caf-b8ba-11e8-85be-4ccc6add7806', '23');
INSERT INTO `client_user_class` VALUES ('97af3cb3-b8ba-11e8-b08b-4ccc6add7806', '97af3caf-b8ba-11e8-85be-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('97af3cb4-b8ba-11e8-9fb4-4ccc6add7806', '97af3caf-b8ba-11e8-85be-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('97af3cb5-b8ba-11e8-bfa4-4ccc6add7806', '97af3caf-b8ba-11e8-85be-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('97af3cb6-b8ba-11e8-8721-4ccc6add7806', '97af3caf-b8ba-11e8-85be-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('97af3cb7-b8ba-11e8-ab3a-4ccc6add7806', '97af3caf-b8ba-11e8-85be-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('97af3cb8-b8ba-11e8-8ec3-4ccc6add7806', '97af3caf-b8ba-11e8-85be-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('97af3cba-b8ba-11e8-9678-4ccc6add7806', '97af3cb9-b8ba-11e8-bcc0-4ccc6add7806', '14');
INSERT INTO `client_user_class` VALUES ('97af3cbb-b8ba-11e8-a5fe-4ccc6add7806', '97af3cb9-b8ba-11e8-bcc0-4ccc6add7806', '23');
INSERT INTO `client_user_class` VALUES ('97af3cbc-b8ba-11e8-bdfd-4ccc6add7806', '97af3cb9-b8ba-11e8-bcc0-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('97af3cbd-b8ba-11e8-8d4a-4ccc6add7806', '97af3cb9-b8ba-11e8-bcc0-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('97af3cbe-b8ba-11e8-a70b-4ccc6add7806', '97af3cb9-b8ba-11e8-bcc0-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('97af3cc0-b8ba-11e8-b05f-4ccc6add7806', '97af3cbf-b8ba-11e8-81b6-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('97af3cc1-b8ba-11e8-ae5c-4ccc6add7806', '97af3cbf-b8ba-11e8-81b6-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('97af3cc2-b8ba-11e8-9f2c-4ccc6add7806', '97af3cbf-b8ba-11e8-81b6-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('97af3cc3-b8ba-11e8-89b5-4ccc6add7806', '97af3cbf-b8ba-11e8-81b6-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('97af3cc4-b8ba-11e8-93cb-4ccc6add7806', '97af3cbf-b8ba-11e8-81b6-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('97af3cc6-b8ba-11e8-aa36-4ccc6add7806', '97af3cc5-b8ba-11e8-9b27-4ccc6add7806', '23');
INSERT INTO `client_user_class` VALUES ('97af3cc7-b8ba-11e8-9f7e-4ccc6add7806', '97af3cc5-b8ba-11e8-9b27-4ccc6add7806', '41');
INSERT INTO `client_user_class` VALUES ('97af3cc8-b8ba-11e8-8c31-4ccc6add7806', '97af3cc5-b8ba-11e8-9b27-4ccc6add7806', '42');
INSERT INTO `client_user_class` VALUES ('97af3cc9-b8ba-11e8-842c-4ccc6add7806', '97af3cc5-b8ba-11e8-9b27-4ccc6add7806', '43');
INSERT INTO `client_user_class` VALUES ('97af3cca-b8ba-11e8-ab48-4ccc6add7806', '97af3cc5-b8ba-11e8-9b27-4ccc6add7806', '51');
INSERT INTO `client_user_class` VALUES ('97af3ccb-b8ba-11e8-a321-4ccc6add7806', '97af3cc5-b8ba-11e8-9b27-4ccc6add7806', '52');
INSERT INTO `client_user_class` VALUES ('97af3ccc-b8ba-11e8-97be-4ccc6add7806', '97af3cc5-b8ba-11e8-9b27-4ccc6add7806', '53');
INSERT INTO `client_user_class` VALUES ('97af6349-b8ba-11e8-a622-4ccc6add7806', '97af6348-b8ba-11e8-84e7-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('97af634a-b8ba-11e8-b37a-4ccc6add7806', '97af6348-b8ba-11e8-84e7-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('97af634b-b8ba-11e8-b4fe-4ccc6add7806', '97af6348-b8ba-11e8-84e7-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('97af634c-b8ba-11e8-a68e-4ccc6add7806', '97af6348-b8ba-11e8-84e7-4ccc6add7806', '14');
INSERT INTO `client_user_class` VALUES ('97af634d-b8ba-11e8-94e2-4ccc6add7806', '97af6348-b8ba-11e8-84e7-4ccc6add7806', '61');
INSERT INTO `client_user_class` VALUES ('97af662e-b8ba-11e8-9ec8-4ccc6add7806', '97af6348-b8ba-11e8-84e7-4ccc6add7806', '62');
INSERT INTO `client_user_class` VALUES ('97af662f-b8ba-11e8-b472-4ccc6add7806', '97af6348-b8ba-11e8-84e7-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('97af6631-b8ba-11e8-8cb6-4ccc6add7806', '97af6630-b8ba-11e8-b453-4ccc6add7806', '21');
INSERT INTO `client_user_class` VALUES ('97af6632-b8ba-11e8-b30f-4ccc6add7806', '97af6630-b8ba-11e8-b453-4ccc6add7806', '22');
INSERT INTO `client_user_class` VALUES ('97af6633-b8ba-11e8-b3c7-4ccc6add7806', '97af6630-b8ba-11e8-b453-4ccc6add7806', '31');
INSERT INTO `client_user_class` VALUES ('97af6634-b8ba-11e8-8388-4ccc6add7806', '97af6630-b8ba-11e8-b453-4ccc6add7806', '32');
INSERT INTO `client_user_class` VALUES ('97af6635-b8ba-11e8-92a6-4ccc6add7806', '97af6630-b8ba-11e8-b453-4ccc6add7806', '33');
INSERT INTO `client_user_class` VALUES ('97af6637-b8ba-11e8-a23c-4ccc6add7806', '97af6636-b8ba-11e8-afdf-4ccc6add7806', '23');
INSERT INTO `client_user_class` VALUES ('97af6638-b8ba-11e8-b4b2-4ccc6add7806', '97af6636-b8ba-11e8-afdf-4ccc6add7806', '53');
INSERT INTO `client_user_class` VALUES ('97af6639-b8ba-11e8-8c90-4ccc6add7806', '97af6636-b8ba-11e8-afdf-4ccc6add7806', '63');
INSERT INTO `client_user_class` VALUES ('97af663a-b8ba-11e8-afa1-4ccc6add7806', '97af6636-b8ba-11e8-afdf-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('97af663b-b8ba-11e8-8264-4ccc6add7806', '97af6636-b8ba-11e8-afdf-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('97af663c-b8ba-11e8-b696-4ccc6add7806', '97af6636-b8ba-11e8-afdf-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('97af663d-b8ba-11e8-a2e9-4ccc6add7806', '97af6636-b8ba-11e8-afdf-4ccc6add7806', '14');
INSERT INTO `client_user_class` VALUES ('97af663f-b8ba-11e8-ac89-4ccc6add7806', '97af663e-b8ba-11e8-be7d-4ccc6add7806', '11');
INSERT INTO `client_user_class` VALUES ('97af6640-b8ba-11e8-a5d6-4ccc6add7806', '97af663e-b8ba-11e8-be7d-4ccc6add7806', '12');
INSERT INTO `client_user_class` VALUES ('97af6641-b8ba-11e8-a842-4ccc6add7806', '97af663e-b8ba-11e8-be7d-4ccc6add7806', '13');
INSERT INTO `client_user_class` VALUES ('97af6642-b8ba-11e8-aea8-4ccc6add7806', '97af663e-b8ba-11e8-be7d-4ccc6add7806', '14');
INSERT INTO `client_user_class` VALUES ('97af6643-b8ba-11e8-8c97-4ccc6add7806', '97af663e-b8ba-11e8-be7d-4ccc6add7806', '53');

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
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
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
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 93184 kB; (`SCHED_NAME` `TRIGGER_NAME` `TRIGGER_GROUP`) REFER `camp' ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务,1' ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 709 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '系统日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (433, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', 'c611ac18-532a-4ea9-a478-15c474784f41', '\"admin/system/site/show\"', 12, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-11 17:27:39', 1, '2018-09-11 17:27:39', NULL, b'0');
INSERT INTO `sys_log` VALUES (434, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', 'c611ac18-532a-4ea9-a478-15c474784f41', '\"admin/system/menu/test\"', 5, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-11 17:28:03', 1, '2018-09-11 17:28:03', NULL, b'0');
INSERT INTO `sys_log` VALUES (435, '普通请求', '跳转系统字典页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/dict/list', 'GET', 'com.mysiteforme.admin.controller.system.DictController.list', '[]', 'c611ac18-532a-4ea9-a478-15c474784f41', '\"admin/system/dict/list\"', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-11 17:28:18', 1, '2018-09-11 17:28:18', NULL, b'0');
INSERT INTO `sys_log` VALUES (436, '普通请求', '跳转博客评论列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogComment/list', 'GET', 'com.mysiteforme.admin.controller.BlogCommentController.list', '[]', 'c611ac18-532a-4ea9-a478-15c474784f41', '\"/admin/blogComment/list\"', 7, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-11 17:28:24', 1, '2018-09-11 17:28:24', NULL, b'0');
INSERT INTO `sys_log` VALUES (437, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', 'c611ac18-532a-4ea9-a478-15c474784f41', '\"admin/system/menu/test\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-11 17:30:02', 1, '2018-09-11 17:30:02', NULL, b'0');
INSERT INTO `sys_log` VALUES (438, '普通请求', '跳转定时任务列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/quartzTask/list', 'GET', 'com.mysiteforme.admin.controller.QuartzTaskController.list', '[]', 'c611ac18-532a-4ea9-a478-15c474784f41', '\"/admin/quartzTask/list\"', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-11 17:30:08', 1, '2018-09-11 17:30:08', NULL, b'0');
INSERT INTO `sys_log` VALUES (439, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.mysiteforme.admin.controller.system.RoleController.list', '[]', 'c611ac18-532a-4ea9-a478-15c474784f41', '\"admin/system/role/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-11 17:30:13', 1, '2018-09-11 17:30:13', NULL, b'0');
INSERT INTO `sys_log` VALUES (440, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'c611ac18-532a-4ea9-a478-15c474784f41', '\"admin/system/user/list\"', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-11 17:30:32', 1, '2018-09-11 17:30:32', NULL, b'0');
INSERT INTO `sys_log` VALUES (441, '普通请求', '跳转博客标签列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogTags/list', 'GET', 'com.mysiteforme.admin.controller.BlogTagsController.list', '[]', 'c611ac18-532a-4ea9-a478-15c474784f41', '\"/admin/blogTags/list\"', 5, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-11 17:30:49', 1, '2018-09-11 17:30:49', NULL, b'0');
INSERT INTO `sys_log` VALUES (442, '普通请求', '跳转博客栏目列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogChannel/list', 'GET', 'com.mysiteforme.admin.controller.BlogChannelController.list', '[]', 'c611ac18-532a-4ea9-a478-15c474784f41', '\"/admin/blogChannel/list\"', 5, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-11 17:30:57', 1, '2018-09-11 17:30:57', NULL, b'0');
INSERT INTO `sys_log` VALUES (443, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'c611ac18-532a-4ea9-a478-15c474784f41', '\"/admin/blogArticle/list\"', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-11 17:31:51', 1, '2018-09-11 17:31:51', NULL, b'0');
INSERT INTO `sys_log` VALUES (444, 'Ajax请求', '保存编辑博客内容数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/edit', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.edit', '[{\"channelId\":21,\"content\":\"<p><font color=\'#46acc8\' style=\'background-color: rgb(77, 128, 191);\'>我就是想试试</font></p><h1><b>怎么样</b></h1><blockquote>引用</blockquote><h1><b>加粗</b></h1><p><img src=\'http://pic.58pic.com/58pic/15/86/11/51Y58PICQHR_1024.jpg\' style=\'max-width:100%;\'><br></p><p><br></p>\",\"delFlag\":false,\"id\":11,\"marks\":\"由各种物质组成的巨型球状天体，叫做星球。星球有一定的形状，有自己的运行轨道。\",\"publistTime\":1535760000000,\"recommend\":false,\"resources\":\"\",\"showPic\":\"http://img.zcool.cn/community/0142885afa4dd4a801216045a2977b.jpg@1280w_1l_2o_100sh.jpg\",\"sort\":1,\"subTitle\":\"\",\"text\":\"我就是想试试怎么样引用加粗\",\"title\":\"俄媒：对华贸易战，美国为什么必败\",\"top\":false}]', 'c611ac18-532a-4ea9-a478-15c474784f41', '{\"success\":true,\"message\":\"成功\"}', 126, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-11 17:32:14', 1, '2018-09-11 17:32:14', NULL, b'0');
INSERT INTO `sys_log` VALUES (445, '普通请求', '跳转定时任务列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/quartzTask/list', 'GET', 'com.mysiteforme.admin.controller.QuartzTaskController.list', '[]', 'c611ac18-532a-4ea9-a478-15c474784f41', '\"/admin/quartzTask/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-11 17:32:42', 1, '2018-09-11 17:32:42', NULL, b'0');
INSERT INTO `sys_log` VALUES (446, '普通请求', '跳转任务执行日志列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/quartzTaskLog/list', 'GET', 'com.mysiteforme.admin.controller.QuartzTaskLogController.list', '[]', 'c611ac18-532a-4ea9-a478-15c474784f41', '\"/admin/quartzTaskLog/list\"', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-11 17:32:51', 1, '2018-09-11 17:32:51', NULL, b'0');
INSERT INTO `sys_log` VALUES (447, '普通请求', '跳转资源展示列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/rescource/list', 'GET', 'com.mysiteforme.admin.controller.system.RescourceController.list', '[]', 'c611ac18-532a-4ea9-a478-15c474784f41', '\"admin/system/rescource/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-11 17:33:05', 1, '2018-09-11 17:33:05', NULL, b'0');
INSERT INTO `sys_log` VALUES (448, '普通请求', '跳转资源展示列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/rescource/list', 'GET', 'com.mysiteforme.admin.controller.system.RescourceController.list', '[]', 'c611ac18-532a-4ea9-a478-15c474784f41', '\"admin/system/rescource/list\"', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-11 17:33:39', 1, '2018-09-11 17:33:39', NULL, b'0');
INSERT INTO `sys_log` VALUES (449, '普通请求', '跳转博客评论列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogComment/list', 'GET', 'com.mysiteforme.admin.controller.BlogCommentController.list', '[]', 'c611ac18-532a-4ea9-a478-15c474784f41', '\"/admin/blogComment/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-11 17:36:50', 1, '2018-09-11 17:36:50', NULL, b'0');
INSERT INTO `sys_log` VALUES (450, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', 'c611ac18-532a-4ea9-a478-15c474784f41', '\"admin/system/menu/test\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-11 17:37:13', 1, '2018-09-11 17:37:13', NULL, b'0');
INSERT INTO `sys_log` VALUES (451, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@69d63e90\"]', '5c931d5c-91f0-4964-b57e-b082c4322b09', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 678, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-12 17:06:48', 1, '2018-09-12 17:06:48', NULL, b'0');
INSERT INTO `sys_log` VALUES (452, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', '5c931d5c-91f0-4964-b57e-b082c4322b09', '\"admin/system/user/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-12 17:06:54', 1, '2018-09-12 17:06:54', NULL, b'0');
INSERT INTO `sys_log` VALUES (453, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.mysiteforme.admin.controller.system.RoleController.list', '[]', '5c931d5c-91f0-4964-b57e-b082c4322b09', '\"admin/system/role/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-12 17:07:36', 1, '2018-09-12 17:07:36', NULL, b'0');
INSERT INTO `sys_log` VALUES (454, 'Ajax请求', '删除角色数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/delete', 'POST', 'com.mysiteforme.admin.controller.system.RoleController.delete', '[1]', '5c931d5c-91f0-4964-b57e-b082c4322b09', '{\"success\":true,\"message\":\"成功\"}', 133, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-12 17:07:42', 1, '2018-09-12 17:07:42', NULL, b'0');
INSERT INTO `sys_log` VALUES (455, 'Ajax请求', '保存新增角色数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/add', 'POST', 'com.mysiteforme.admin.controller.system.RoleController.add', '[{\"delFlag\":false,\"menuSet\":[{\"delFlag\":false,\"id\":39,\"sort\":30},{\"delFlag\":false,\"id\":38,\"sort\":30},{\"delFlag\":false,\"id\":10,\"sort\":30},{\"delFlag\":false,\"id\":13,\"sort\":30},{\"delFlag\":false,\"id\":40,\"sort\":30}],\"name\":\"学校信息发布者\",\"remarks\":\"\"}]', '5c931d5c-91f0-4964-b57e-b082c4322b09', '{\"success\":true,\"message\":\"成功\"}', 285, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-12 17:08:35', 1, '2018-09-12 17:08:35', NULL, b'0');
INSERT INTO `sys_log` VALUES (456, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.mysiteforme.admin.controller.system.RoleController.list', '[]', '5c931d5c-91f0-4964-b57e-b082c4322b09', '\"admin/system/role/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-12 17:08:36', 1, '2018-09-12 17:08:36', NULL, b'0');
INSERT INTO `sys_log` VALUES (457, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', '5c931d5c-91f0-4964-b57e-b082c4322b09', '\"admin/system/user/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-12 17:08:47', 1, '2018-09-12 17:08:47', NULL, b'0');
INSERT INTO `sys_log` VALUES (458, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', '5c931d5c-91f0-4964-b57e-b082c4322b09', '\"admin/system/user/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-12 17:08:58', 1, '2018-09-12 17:08:58', NULL, b'0');
INSERT INTO `sys_log` VALUES (459, 'Ajax请求', '保存新增系统用户数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/add', 'POST', 'com.mysiteforme.admin.controller.system.UserConteroller.add', '[{\"delFlag\":false,\"email\":\"\",\"loginName\":\"songping\",\"menus\":[],\"nickName\":\"宋平\",\"roleLists\":[{\"delFlag\":false,\"id\":3}],\"tel\":\"\"}]', '5c931d5c-91f0-4964-b57e-b082c4322b09', '{\"success\":true,\"message\":\"成功\"}', 727, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-12 17:09:13', 1, '2018-09-12 17:09:13', NULL, b'0');
INSERT INTO `sys_log` VALUES (460, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', '5c931d5c-91f0-4964-b57e-b082c4322b09', '\"admin/system/user/list\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-12 17:09:15', 1, '2018-09-12 17:09:15', NULL, b'0');
INSERT INTO `sys_log` VALUES (461, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.mysiteforme.admin.controller.system.RoleController.list', '[]', '5c931d5c-91f0-4964-b57e-b082c4322b09', '\"admin/system/role/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-12 17:17:04', 1, '2018-09-12 17:17:04', NULL, b'0');
INSERT INTO `sys_log` VALUES (462, 'Ajax请求', '保存编辑角色数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/edit', 'POST', 'com.mysiteforme.admin.controller.system.RoleController.edit', '[{\"delFlag\":false,\"id\":3,\"menuSet\":[{\"delFlag\":false,\"id\":9,\"sort\":30},{\"delFlag\":false,\"id\":8,\"sort\":30},{\"delFlag\":false,\"id\":40,\"sort\":30},{\"delFlag\":false,\"id\":39,\"sort\":30},{\"delFlag\":false,\"id\":13,\"sort\":30},{\"delFlag\":false,\"id\":38,\"sort\":30},{\"delFlag\":false,\"id\":4,\"sort\":30},{\"delFlag\":false,\"id\":2,\"sort\":30},{\"delFlag\":false,\"id\":10,\"sort\":30},{\"delFlag\":false,\"id\":1,\"sort\":30},{\"delFlag\":false,\"id\":3,\"sort\":30},{\"delFlag\":false,\"id\":53,\"sort\":30}],\"name\":\"学校信息发布者\",\"remarks\":\"\"}]', '5c931d5c-91f0-4964-b57e-b082c4322b09', '{\"success\":true,\"message\":\"成功\"}', 166, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-12 17:17:13', 1, '2018-09-12 17:17:13', NULL, b'0');
INSERT INTO `sys_log` VALUES (463, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.mysiteforme.admin.controller.system.RoleController.list', '[]', '5c931d5c-91f0-4964-b57e-b082c4322b09', '\"admin/system/role/list\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-12 17:17:15', 1, '2018-09-12 17:17:15', NULL, b'0');
INSERT INTO `sys_log` VALUES (464, '普通请求', '退出系统', '127.0.0.1', '我是管理员', 'http://localhost:8080/systemLogout', 'GET', 'com.mysiteforme.admin.controller.LoginController.logOut', '[]', '5c931d5c-91f0-4964-b57e-b082c4322b09', '\"redirect:/login\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-12 17:17:28', NULL, '2018-09-12 17:17:28', NULL, b'0');
INSERT INTO `sys_log` VALUES (465, 'Ajax请求', '用户登录', '127.0.0.1', NULL, 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@3a579858\"]', '0cba53b1-314e-45e5-b949-0a331483c4cb', '{\"success\":false,\"message\":\"登录密码错误.\"}', 140, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-12 17:21:52', NULL, '2018-09-12 17:21:52', NULL, b'0');
INSERT INTO `sys_log` VALUES (466, 'Ajax请求', '用户登录', '127.0.0.1', NULL, 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@5116aeaa\"]', '0cba53b1-314e-45e5-b949-0a331483c4cb', '{\"success\":false,\"message\":\"登录密码错误.\"}', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-12 17:22:04', NULL, '2018-09-12 17:22:04', NULL, b'0');
INSERT INTO `sys_log` VALUES (467, 'Ajax请求', '用户登录', '127.0.0.1', NULL, 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@9c4c8c3\"]', '0cba53b1-314e-45e5-b949-0a331483c4cb', '{\"success\":false,\"message\":\"登录密码错误.\"}', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-12 17:29:16', NULL, '2018-09-12 17:29:16', NULL, b'0');
INSERT INTO `sys_log` VALUES (468, 'Ajax请求', '用户登录', '127.0.0.1', NULL, 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@30593626\"]', '0cba53b1-314e-45e5-b949-0a331483c4cb', '{\"success\":false,\"message\":\"登录密码错误.\"}', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-12 17:29:26', NULL, '2018-09-12 17:29:26', NULL, b'0');
INSERT INTO `sys_log` VALUES (469, 'Ajax请求', '用户登录', '127.0.0.1', '宋平', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@249643f7\"]', '0cba53b1-314e-45e5-b949-0a331483c4cb', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 6, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 17:35:34', 2, '2018-09-12 17:35:34', NULL, b'0');
INSERT INTO `sys_log` VALUES (470, '普通请求', '退出系统', '127.0.0.1', '宋平', 'http://localhost:8080/systemLogout', 'GET', 'com.mysiteforme.admin.controller.LoginController.logOut', '[]', '0cba53b1-314e-45e5-b949-0a331483c4cb', '\"redirect:/login\"', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-12 17:35:58', NULL, '2018-09-12 17:35:58', NULL, b'0');
INSERT INTO `sys_log` VALUES (471, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@3adb919c\"]', '38f60ba0-fd50-4872-bcbd-f732693ca482', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 165, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-12 17:36:08', 1, '2018-09-12 17:36:08', NULL, b'0');
INSERT INTO `sys_log` VALUES (472, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.mysiteforme.admin.controller.system.RoleController.list', '[]', '38f60ba0-fd50-4872-bcbd-f732693ca482', '\"admin/system/role/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-12 17:36:13', 1, '2018-09-12 17:36:13', NULL, b'0');
INSERT INTO `sys_log` VALUES (473, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.mysiteforme.admin.controller.system.RoleController.list', '[]', '38f60ba0-fd50-4872-bcbd-f732693ca482', '\"admin/system/role/list\"', 16170, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-12 17:37:10', 1, '2018-09-12 17:37:10', NULL, b'0');
INSERT INTO `sys_log` VALUES (474, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.mysiteforme.admin.controller.system.RoleController.list', '[]', '38f60ba0-fd50-4872-bcbd-f732693ca482', '\"admin/system/role/list\"', 16170, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-12 17:37:10', 1, '2018-09-12 17:37:10', NULL, b'0');
INSERT INTO `sys_log` VALUES (475, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.mysiteforme.admin.controller.system.RoleController.list', '[]', '38f60ba0-fd50-4872-bcbd-f732693ca482', '\"admin/system/role/list\"', 6, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-12 17:37:52', 1, '2018-09-12 17:37:52', NULL, b'0');
INSERT INTO `sys_log` VALUES (476, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.mysiteforme.admin.controller.system.RoleController.list', '[]', '38f60ba0-fd50-4872-bcbd-f732693ca482', '\"admin/system/role/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-12 17:38:01', 1, '2018-09-12 17:38:01', NULL, b'0');
INSERT INTO `sys_log` VALUES (477, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.mysiteforme.admin.controller.system.RoleController.list', '[]', '38f60ba0-fd50-4872-bcbd-f732693ca482', '\"admin/system/role/list\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-12 17:38:26', 1, '2018-09-12 17:38:26', NULL, b'0');
INSERT INTO `sys_log` VALUES (478, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', '38f60ba0-fd50-4872-bcbd-f732693ca482', '\"admin/system/user/list\"', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-12 17:38:43', 1, '2018-09-12 17:38:43', NULL, b'0');
INSERT INTO `sys_log` VALUES (479, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.mysiteforme.admin.controller.system.RoleController.list', '[]', '38f60ba0-fd50-4872-bcbd-f732693ca482', '\"admin/system/role/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-12 17:38:51', 1, '2018-09-12 17:38:51', NULL, b'0');
INSERT INTO `sys_log` VALUES (480, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.mysiteforme.admin.controller.system.RoleController.list', '[]', '38f60ba0-fd50-4872-bcbd-f732693ca482', '\"admin/system/role/list\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-12 17:38:55', 1, '2018-09-12 17:38:55', NULL, b'0');
INSERT INTO `sys_log` VALUES (481, 'Ajax请求', '保存编辑角色数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/edit', 'POST', 'com.mysiteforme.admin.controller.system.RoleController.edit', '[{\"delFlag\":false,\"id\":3,\"menuSet\":[{\"delFlag\":false,\"id\":39,\"sort\":30},{\"delFlag\":false,\"id\":13,\"sort\":30},{\"delFlag\":false,\"id\":38,\"sort\":30},{\"delFlag\":false,\"id\":10,\"sort\":30},{\"delFlag\":false,\"id\":40,\"sort\":30}],\"name\":\"学校信息发布者\",\"remarks\":\"\"}]', '38f60ba0-fd50-4872-bcbd-f732693ca482', '{\"success\":true,\"message\":\"成功\"}', 131, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-12 17:39:21', 1, '2018-09-12 17:39:21', NULL, b'0');
INSERT INTO `sys_log` VALUES (482, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.mysiteforme.admin.controller.system.RoleController.list', '[]', '38f60ba0-fd50-4872-bcbd-f732693ca482', '\"admin/system/role/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-12 17:39:23', 1, '2018-09-12 17:39:23', NULL, b'0');
INSERT INTO `sys_log` VALUES (483, '普通请求', '退出系统', '127.0.0.1', '我是管理员', 'http://localhost:8080/systemLogout', 'GET', 'com.mysiteforme.admin.controller.LoginController.logOut', '[]', '38f60ba0-fd50-4872-bcbd-f732693ca482', '\"redirect:/login\"', 5, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-12 17:39:24', NULL, '2018-09-12 17:39:24', NULL, b'0');
INSERT INTO `sys_log` VALUES (484, 'Ajax请求', '用户登录', '127.0.0.1', '宋平', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@772aa683\"]', '83bf0456-9a71-4720-91b4-fbca3eca062c', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 108, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 17:39:36', 2, '2018-09-12 17:39:36', NULL, b'0');
INSERT INTO `sys_log` VALUES (485, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '83bf0456-9a71-4720-91b4-fbca3eca062c', '\"/admin/blogArticle/list\"', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 17:39:47', 2, '2018-09-12 17:39:47', NULL, b'0');
INSERT INTO `sys_log` VALUES (486, '普通请求', '退出系统', '127.0.0.1', '宋平', 'http://localhost:8080/systemLogout', 'GET', 'com.mysiteforme.admin.controller.LoginController.logOut', '[]', '83bf0456-9a71-4720-91b4-fbca3eca062c', '\"redirect:/login\"', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-12 17:42:06', NULL, '2018-09-12 17:42:06', NULL, b'0');
INSERT INTO `sys_log` VALUES (487, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@d48b9\"]', '0b0cd34f-bcf7-4b2c-b1be-84960be6a47a', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 99, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-12 17:42:18', 1, '2018-09-12 17:42:18', NULL, b'0');
INSERT INTO `sys_log` VALUES (488, '普通请求', '跳转博客栏目列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogChannel/list', 'GET', 'com.mysiteforme.admin.controller.BlogChannelController.list', '[]', '0b0cd34f-bcf7-4b2c-b1be-84960be6a47a', '\"/admin/blogChannel/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-12 17:42:20', 1, '2018-09-12 17:42:20', NULL, b'0');
INSERT INTO `sys_log` VALUES (489, 'Ajax请求', '保存新增博客栏目数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogChannel/add', 'POST', 'com.mysiteforme.admin.controller.BlogChannelController.add', '[{\"baseChannel\":false,\"canAduit\":false,\"canComment\":false,\"delFlag\":false,\"href\":\"/xyfc/xyhd\",\"logo\":\"\",\"name\":\"校园活动\",\"noName\":false,\"parentId\":20,\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoTitle\":\"\",\"siteId\":1,\"sort\":30}]', '0b0cd34f-bcf7-4b2c-b1be-84960be6a47a', '{\"success\":true,\"message\":\"成功\"}', 222, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-12 17:43:05', 1, '2018-09-12 17:43:05', NULL, b'0');
INSERT INTO `sys_log` VALUES (490, '普通请求', '跳转博客栏目列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogChannel/list', 'GET', 'com.mysiteforme.admin.controller.BlogChannelController.list', '[]', '0b0cd34f-bcf7-4b2c-b1be-84960be6a47a', '\"/admin/blogChannel/list\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-12 17:43:06', 1, '2018-09-12 17:43:06', NULL, b'0');
INSERT INTO `sys_log` VALUES (491, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '0b0cd34f-bcf7-4b2c-b1be-84960be6a47a', '\"/admin/blogArticle/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-12 17:43:10', 1, '2018-09-12 17:43:10', NULL, b'0');
INSERT INTO `sys_log` VALUES (492, '普通请求', '退出系统', '127.0.0.1', '我是管理员', 'http://localhost:8080/systemLogout', 'GET', 'com.mysiteforme.admin.controller.LoginController.logOut', '[]', '0b0cd34f-bcf7-4b2c-b1be-84960be6a47a', '\"redirect:/login\"', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-12 17:43:14', NULL, '2018-09-12 17:43:14', NULL, b'0');
INSERT INTO `sys_log` VALUES (493, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@6ee73e93\"]', '6e8ec0ac-25eb-4a41-84b8-c6b6b0e25358', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 8, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-12 17:43:27', 1, '2018-09-12 17:43:27', NULL, b'0');
INSERT INTO `sys_log` VALUES (494, '普通请求', '退出系统', '127.0.0.1', '我是管理员', 'http://localhost:8080/systemLogout', 'GET', 'com.mysiteforme.admin.controller.LoginController.logOut', '[]', '6e8ec0ac-25eb-4a41-84b8-c6b6b0e25358', '\"redirect:/login\"', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-12 17:43:32', NULL, '2018-09-12 17:43:32', NULL, b'0');
INSERT INTO `sys_log` VALUES (495, 'Ajax请求', '用户登录', '127.0.0.1', '宋平', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@2bdd1a91\"]', 'b5c41e07-76c4-4993-80d9-451e44190f87', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 17:43:45', 2, '2018-09-12 17:43:45', NULL, b'0');
INSERT INTO `sys_log` VALUES (496, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'b5c41e07-76c4-4993-80d9-451e44190f87', '\"/admin/blogArticle/list\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 17:43:47', 2, '2018-09-12 17:43:47', NULL, b'0');
INSERT INTO `sys_log` VALUES (497, 'Ajax请求', '保存新增博客内容数据', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/add', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.add', '[{\"category\":\"1\",\"channelId\":21,\"content\":\"<p><p><br></p></p><p style=\'text-align:center\'><video style=\'margin:0 auto;\' src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/%E5%BE%B7%E9%98%B3%E5%B8%82%E6%97%8C%E9%98%B3%E5%8C%BA%E5%BE%B7%E6%96%B0%E5%B0%8F%E5%AD%A6.mp4\' controls=\'controls\'> 不支持播放该视频 </video></p><p>旌阳区德新小学\\n\\n座落在距离德阳市北20公里的\\n\\n“西蜀泉乡”——德新镇</p><p>1916年，秀才舒尔英在新场火神庙内办起的学堂，\\n\\n这是德新小学的前身</p><p>&nbsp;学校现有教师65名，\\n\\n小学生807名，幼儿生208名，\\n\\n是小而美、小而优的农村小学</p><p>&nbsp;老师说：“严在当严处，爱在细微中。”\\n\\n校长说：尊重每一个孩子的生命个体，\\n\\n努力让他们学有所成，&nbsp;</p><p>&nbsp;并找到适合每一个生命个体的发展路径，\\n\\n为他们的终身发展奠定坚实的基础</p><p><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/dexin.jpg\' style=\'max-width:100%;\'><br></p>\",\"delFlag\":false,\"marks\":\"旌阳区德新小学座落在距离德阳市北20公里的“西蜀泉乡”——德新镇，1916年，秀才舒尔英在新场火神庙内办起的学堂，这是德新小学的前身\",\"publistTime\":1536710400000,\"recommend\":false,\"resources\":\"\",\"showPic\":\"\",\"subTitle\":\"\",\"text\":\" 不支持播放该视频 旌阳区德新小学\\n\\n座落在距离德阳市北20公里的\\n\\n“西蜀泉乡”——德新镇1916年，秀才舒尔英在新场火神庙内办起的学堂，\\n\\n这是德新小学的前身&nbsp;学校现有教师65名，\\n\\n小学生807名，幼儿生208名，\\n\\n是小而美、小而优的农村小学&nbsp;老师说：“严在当严处，爱在细微中。”\\n\\n校长说：尊重每一个孩子的生命个体，\\n\\n努力让他们学有所成，&nbsp;&nbsp;并找到适合每一个生命个体的发展路径，\\n\\n为他们的终身发展奠定坚实的基础\",\"title\":\"学校简介\",\"top\":false}]', 'b5c41e07-76c4-4993-80d9-451e44190f87', '{\"success\":true,\"message\":\"成功\"}', 154, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 18:08:08', 2, '2018-09-12 18:08:08', NULL, b'0');
INSERT INTO `sys_log` VALUES (498, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'b5c41e07-76c4-4993-80d9-451e44190f87', '\"/admin/blogArticle/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 18:08:09', 2, '2018-09-12 18:08:09', NULL, b'0');
INSERT INTO `sys_log` VALUES (499, 'Ajax请求', '用户登录', '127.0.0.1', '宋平', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@ec35754\"]', '3f22af91-1e40-4561-9549-90b563bb7f0c', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 422, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 20:24:13', 2, '2018-09-12 20:24:13', NULL, b'0');
INSERT INTO `sys_log` VALUES (500, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '3f22af91-1e40-4561-9549-90b563bb7f0c', '\"/admin/blogArticle/list\"', 5, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 20:24:13', 2, '2018-09-12 20:24:13', NULL, b'0');
INSERT INTO `sys_log` VALUES (501, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '3f22af91-1e40-4561-9549-90b563bb7f0c', '\"/admin/blogArticle/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 20:27:44', 2, '2018-09-12 20:27:44', NULL, b'0');
INSERT INTO `sys_log` VALUES (502, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '3f22af91-1e40-4561-9549-90b563bb7f0c', '\"/admin/blogArticle/list\"', 5, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 20:33:55', 2, '2018-09-12 20:33:55', NULL, b'0');
INSERT INTO `sys_log` VALUES (503, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '3f22af91-1e40-4561-9549-90b563bb7f0c', '\"/admin/blogArticle/list\"', 7, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 20:47:02', 2, '2018-09-12 20:47:02', NULL, b'0');
INSERT INTO `sys_log` VALUES (504, 'Ajax请求', '保存编辑博客内容数据', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/edit', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.edit', '[{\"category\":\"1\",\"channelId\":21,\"content\":\"<p></p><p style=\'text-align: center;\'><p><br></p></p><p style=\'text-align:center\'><video style=\'margin:0 auto;\' src=\'http://www.w3school.com.cn//i/movie.mp4\' controls=\'controls\'> 不支持播放该视频 </video></p><p style=\'text-align: center;\'>旌阳区德新小学\\n\\n座落在距离德阳市北20公里的\\n\\n“西蜀泉乡”——德新镇<br></p><p style=\'text-align: center;\'>1916年，秀才舒尔英在新场火神庙内办起的学堂，\\n\\n这是德新小学的前身</p><p style=\'text-align: center;\'>&nbsp;学校现有教师65名，\\n\\n小学生807名，幼儿生208名，\\n\\n是小而美、小而优的农村小学</p><p style=\'text-align: center;\'>&nbsp;老师说：“严在当严处，爱在细微中。”\\n\\n校长说：尊重每一个孩子的生命个体，\\n\\n努力让他们学有所成，&nbsp;</p><p style=\'text-align: center;\'>&nbsp;并找到适合每一个生命个体的发展路径，\\n\\n为他们的终身发展奠定坚实的基础</p><p><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/dexin.jpg\' style=\'max-width:100%;\'><br></p><p><br></p>\",\"delFlag\":false,\"id\":1,\"marks\":\"旌阳区德新小学座落在距离德阳市北20公里的“西蜀泉乡”——德新镇，1916年，秀才舒尔英在新场火神庙内办起的学堂，这是德新小学的前身\",\"publistTime\":1536710400000,\"recommend\":false,\"resources\":\"\",\"showPic\":\"\",\"sort\":0,\"subTitle\":\"\",\"text\":\" 不支持播放该视频 旌阳区德新小学\\n\\n座落在距离德阳市北20公里的\\n\\n“西蜀泉乡”——德新镇1916年，秀才舒尔英在新场火神庙内办起的学堂，\\n\\n这是德新小学的前身&nbsp;学校现有教师65名，\\n\\n小学生807名，幼儿生208名，\\n\\n是小而美、小而优的农村小学&nbsp;老师说：“严在当严处，爱在细微中。”\\n\\n校长说：尊重每一个孩子的生命个体，\\n\\n努力让他们学有所成，&nbsp;&nbsp;并找到适合每一个生命个体的发展路径，\\n\\n为他们的终身发展奠定坚实的基础\",\"title\":\"学校简介\",\"top\":false}]', '3f22af91-1e40-4561-9549-90b563bb7f0c', '{\"success\":true,\"message\":\"成功\"}', 163, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 20:47:33', 2, '2018-09-12 20:47:33', NULL, b'0');
INSERT INTO `sys_log` VALUES (505, 'Ajax请求', '保存编辑博客内容数据', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/edit', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.edit', '[{\"category\":\"1\",\"channelId\":21,\"content\":\"<p></p><p style=\'text-align: center;\'></p><p style=\'text-align: center;\'>旌阳区德新小学\\n\\n座落在距离德阳市北20公里的\\n\\n“西蜀泉乡”——德新镇<br></p><p style=\'text-align: center;\'>1916年，秀才舒尔英在新场火神庙内办起的学堂，\\n\\n这是德新小学的前身</p><p style=\'text-align: center;\'>&nbsp;学校现有教师65名，\\n\\n小学生807名，幼儿生208名，\\n\\n是小而美、小而优的农村小学</p><p style=\'text-align: center;\'>&nbsp;老师说：“严在当严处，爱在细微中。”\\n\\n校长说：尊重每一个孩子的生命个体，\\n\\n努力让他们学有所成，&nbsp;</p><p style=\'text-align: center;\'>&nbsp;并找到适合每一个生命个体的发展路径，\\n\\n为他们的终身发展奠定坚实的基础</p><p><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/dexin.jpg\' style=\'max-width:100%;\'><br></p><p><p><br></p></p><p style=\'text-align:center\'><video style=\'margin:0 auto;\' src=\'http://www.w3school.com.cn//i/movie.mp4\' controls=\'controls\'> 不支持播放该视频 </video></p><p><br></p>\",\"delFlag\":false,\"id\":1,\"marks\":\"旌阳区德新小学座落在距离德阳市北20公里的“西蜀泉乡”——德新镇，1916年，秀才舒尔英在新场火神庙内办起的学堂，这是德新小学的前身\",\"publistTime\":1536710400000,\"recommend\":true,\"resources\":\"\",\"showPic\":\"\",\"sort\":0,\"subTitle\":\"\",\"text\":\"旌阳区德新小学\\n\\n座落在距离德阳市北20公里的\\n\\n“西蜀泉乡”——德新镇1916年，秀才舒尔英在新场火神庙内办起的学堂，\\n\\n这是德新小学的前身&nbsp;学校现有教师65名，\\n\\n小学生807名，幼儿生208名，\\n\\n是小而美、小而优的农村小学&nbsp;老师说：“严在当严处，爱在细微中。”\\n\\n校长说：尊重每一个孩子的生命个体，\\n\\n努力让他们学有所成，&nbsp;&nbsp;并找到适合每一个生命个体的发展路径，\\n\\n为他们的终身发展奠定坚实的基础 不支持播放该视频 \",\"title\":\"学校简介\",\"top\":true}]', '3f22af91-1e40-4561-9549-90b563bb7f0c', '{\"success\":true,\"message\":\"成功\"}', 132, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 20:48:30', 2, '2018-09-12 20:48:30', NULL, b'0');
INSERT INTO `sys_log` VALUES (506, 'Ajax请求', '保存编辑博客内容数据', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/edit', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.edit', '[{\"category\":\"1\",\"channelId\":21,\"content\":\"<p></p><p style=\'text-align: center;\'></p><p style=\'text-align: left;\'><p><br></p></p><p style=\'text-align:center\'><video style=\'margin:0 auto;\' src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/dexinxiaoxue.mp4\' controls=\'controls\'> 不支持播放该视频 </video></p><p style=\'text-align: left;\'><b>旌阳区德新小学\\n\\n座落在距离德阳市北20公里的\\n\\n“西蜀泉乡”——德新镇<br></b></p><p style=\'text-align: left;\'><b>1916年，秀才舒尔英在新场火神庙内办起的学堂，\\n\\n这是德新小学的前身</b></p><p style=\'text-align: left;\'><b>&nbsp;学校现有教师65名，\\n\\n小学生807名，幼儿生208名，\\n\\n是小而美、小而优的农村小学</b></p><p style=\'text-align: left;\'><b>&nbsp;老师说：“严在当严处，爱在细微中。”\\n\\n校长说：尊重每一个孩子的生命个体，\\n\\n努力让他们学有所成，&nbsp;</b></p><p style=\'text-align: left;\'><b>&nbsp;并找到适合每一个生命个体的发展路径，\\n\\n为他们的终身发展奠定坚实的基础</b></p><p><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/dexin.jpg\' style=\'max-width:100%;\'><br></p><p></p><p><br></p>\",\"delFlag\":false,\"id\":1,\"marks\":\"旌阳区德新小学座落在距离德阳市北20公里的“西蜀泉乡”——德新镇，1916年，秀才舒尔英在新场火神庙内办起的学堂，这是德新小学的前身\",\"publistTime\":1536710400000,\"recommend\":true,\"resources\":\"\",\"showPic\":\"\",\"sort\":0,\"subTitle\":\"\",\"text\":\" 不支持播放该视频 旌阳区德新小学\\n\\n座落在距离德阳市北20公里的\\n\\n“西蜀泉乡”——德新镇1916年，秀才舒尔英在新场火神庙内办起的学堂，\\n\\n这是德新小学的前身&nbsp;学校现有教师65名，\\n\\n小学生807名，幼儿生208名，\\n\\n是小而美、小而优的农村小学&nbsp;老师说：“严在当严处，爱在细微中。”\\n\\n校长说：尊重每一个孩子的生命个体，\\n\\n努力让他们学有所成，&nbsp;&nbsp;并找到适合每一个生命个体的发展路径，\\n\\n为他们的终身发展奠定坚实的基础\",\"title\":\"学校简介\",\"top\":true}]', '3f22af91-1e40-4561-9549-90b563bb7f0c', '{\"success\":true,\"message\":\"成功\"}', 503, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 21:18:24', 2, '2018-09-12 21:18:24', NULL, b'0');
INSERT INTO `sys_log` VALUES (507, 'Ajax请求', '保存编辑博客内容数据', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/edit', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.edit', '[{\"category\":\"1\",\"channelId\":21,\"content\":\"<p></p><p style=\'text-align: center;\'></p><p style=\'text-align: left;\'></p><p><br></p><p></p><p style=\'text-align:center\'><video style=\'margin:0 auto;\' src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/dexinxiaoxue.mp4\' controls=\'controls\'> 不支持播放该视频 </video></p><h3 style=\'text-align: left;\'>&nbsp; &nbsp; &nbsp;旌阳区德新小学\\n\\n座落在距离德阳市北20公里的\\n\\n“西蜀泉乡”</h3><h3 style=\'text-align: left;\'>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ——德新镇&nbsp;</h3><h3 style=\'text-align: left;\'>&nbsp; &nbsp; &nbsp;1916年，秀才舒尔英在新场火神庙内办起的学堂，\\n\\n这是德新小学的前身&nbsp;</h3><h3 style=\'text-align: left;\'>&nbsp; &nbsp; &nbsp;学校现有教师65名，\\n\\n小学生807名，幼儿生208名，\\n\\n是小而美、小而优的农村小学</h3><h3 style=\'text-align: left;\'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;老师说：“严在当严处，爱在细微中。”\\n\\n校长说：尊重每一个孩子的生命个体，\\n\\n努力让他们学有所成，&nbsp;</h3><h3 style=\'text-align: left;\'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;并找到适合每一个生命个体的发展路径，\\n\\n为他们的终身发展奠定坚实的基础</h3><p><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/dexin.jpg\' style=\'max-width:100%;\'><br></p><p></p><p><br></p>\",\"delFlag\":false,\"id\":1,\"marks\":\"旌阳区德新小学座落在距离德阳市北20公里的“西蜀泉乡”——德新镇，1916年，秀才舒尔英在新场火神庙内办起的学堂，这是德新小学的前身\",\"publistTime\":1536710400000,\"recommend\":true,\"resources\":\"\",\"showPic\":\"\",\"sort\":0,\"subTitle\":\"\",\"text\":\" 不支持播放该视频 &nbsp; &nbsp; &nbsp;旌阳区德新小学\\n\\n座落在距离德阳市北20公里的\\n\\n“西蜀泉乡”&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ——德新镇&nbsp;&nbsp; &nbsp; &nbsp;1916年，秀才舒尔英在新场火神庙内办起的学堂，\\n\\n这是德新小学的前身&nbsp;&nbsp; &nbsp; &nbsp;学校现有教师65名，\\n\\n小学生807名，幼儿生208名，\\n\\n是小而美、小而优的农村小学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;老师说：“严在当严处，爱在细微中。”\\n\\n校长说：尊重每一个孩子的生命个体，\\n\\n努力让他们学有所成，&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;并找到适合每一个生命个体的发展路径，\\n\\n为他们的终身发展奠定坚实的基础\",\"title\":\"学校简介\",\"top\":true}]', '3f22af91-1e40-4561-9549-90b563bb7f0c', '{\"success\":true,\"message\":\"成功\"}', 136, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 21:46:20', 2, '2018-09-12 21:46:20', NULL, b'0');
INSERT INTO `sys_log` VALUES (508, 'Ajax请求', '保存新增博客内容数据', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/add', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.add', '[{\"category\":\"1\",\"channelId\":22,\"content\":\"<p style=\'padding-top: 3px; padding-bottom: 3px; font-family: &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255); line-height: 30px; text-indent: 2em; font-size: 16px;\'><strong>四川新闻网德阳11月6日讯（宋平 邓传蓉 文/图）</strong>11月6日上午，在旌阳区教科所美术教研员冯伟杰的带领下，市区美术教师辜小平、侯德晖、王开琴、刘进川等一行人到德新小学分部进行青蓝工程的听课活动，德新小学美术教师宋平老师上了一堂《自行车局部写生》的户外写生课。</p><p style=\'padding-top: 3px; padding-bottom: 3px; font-family: &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255); line-height: 30px; text-indent: 2em; font-size: 16px;\'>在绿树环绕的教学楼前，宋平老师先让学生观察现实中的自行车，再对学生们讲解自行车的结构，然后教同学们如何运用灵活多变的线条，进行自行车局部写生创作。同学们在轻松愉快的环境中完成了本堂课的任务。</p><p style=\'padding-top: 3px; padding-bottom: 3px; font-family: &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255); line-height: 30px; text-indent: 2em; font-size: 16px;\'>课后，听课的老师们都作出了高度评价，说作为农村小学能达到这种水平非常棒，肯定了学生的基本功很牢固。冯伟杰和侯德晖老师说，将课堂搬到户外这种形式非常好，学生都非常开心，课堂氛围活跃，课程结构非常完整，每个教学环节的设计有新意。美术特级教师辜小平老师除了对本堂课进行点评，还着重讲了青年美术教师应该如何规划自己的教学生涯，让美术教师拥有成就感，成就感来源于学生的作品和教师的作品，主张将小学每个角落拥有学生的作品。</p><p style=\'padding-top: 3px; padding-bottom: 3px; font-family: &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255); line-height: 30px; text-indent: 2em; font-size: 16px;\'>当然也提出了很多宝贵的意见，王开琴老师指出，在学生创作时应让学生动起来，学生自己去选择喜欢的自行车局部。辜小平老师说，学生在局部写生创作时应延伸到每个小的细节，将局部画得更精细，学生构图上应注意画面的饱满，空白地方的处理等。与会老师指出，青年美术教师应让自身的基本功变得更扎实，平时要多画，多练，多参加展览，提升自身素质。</p><p style=\'padding-top: 3px; padding-bottom: 3px; font-family: &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255); line-height: 30px; text-indent: 2em; font-size: 16px;\'>本次美术“青蓝工程”教学研讨活动，专家指导，名师引领，让与会教师受益匪浅，促进了青年教师的快速成长</p>\",\"delFlag\":false,\"marks\":\"11月6日上午，在旌阳区教科所美术教研员冯伟杰的带领下，市区美术教师辜小平、侯德晖、王开琴、刘进川等一行人到德新小学分部进行青蓝工程的听课活动，\",\"publistTime\":1536710400000,\"recommend\":false,\"resources\":\"\",\"showPic\":\"\",\"subTitle\":\"\",\"text\":\"四川新闻网德阳11月6日讯（宋平 邓传蓉 文/图）11月6日上午，在旌阳区教科所美术教研员冯伟杰的带领下，市区美术教师辜小平、侯德晖、王开琴、刘进川等一行人到德新小学分部进行青蓝工程的听课活动，德新小学美术教师宋平老师上了一堂《自行车局部写生》的户外写生课。在绿树环绕的教学楼前，宋平老师先让学生观察现实中的自行车，再对学生们讲解自行车的结构，然后教同学们如何运用灵活多变的线条，进行自行车局部写生创作。同学们在轻松愉快的环境中完成了本堂课的任务。课后，听课的老师们都作出了高度评价，说作为农村小学能达到这种水平非常棒，肯定了学生的基本功很牢固。冯伟杰和侯德晖老师说，将课堂搬到户外这种形式非常好，学生都非常开心，课堂氛围活跃，课程结构非常完整，每个教学环节的设计有新意。美术特级教师辜小平老师除了对本堂课进行点评，还着重讲了青年美术教师应该如何规划自己的教学生涯，让美术教师拥有成就感，成就感来源于学生的作品和教师的作品，主张将小学每个角落拥有学生的作品。当然也提出了很多宝贵的意见，王开琴老师指出，在学生创作时应让学生动起来，学生自己去选择喜欢的自行车局部。辜小平老师说，学生在局部写生创作时应延伸到每个小的细节，将局部画得更精细，学生构图上应注意画面的饱满，空白地方的处理等。与会老师指出，青年美术教师应让自身的基本功变得更扎实，平时要多画，多练，多参加展览，提升自身素质。本次美术“青蓝工程”教学研讨活动，专家指导，名师引领，让与会教师受益匪浅，促进了青年教师的快速成长\",\"title\":\"旌阳区美术“青蓝工程”教学研讨活动在德新小学开展\",\"top\":false}]', '3f22af91-1e40-4561-9549-90b563bb7f0c', '{\"success\":true,\"message\":\"成功\"}', 101, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 22:03:45', 2, '2018-09-12 22:03:45', NULL, b'0');
INSERT INTO `sys_log` VALUES (509, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '3f22af91-1e40-4561-9549-90b563bb7f0c', '\"/admin/blogArticle/list\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 22:03:47', 2, '2018-09-12 22:03:47', NULL, b'0');
INSERT INTO `sys_log` VALUES (510, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '3f22af91-1e40-4561-9549-90b563bb7f0c', '\"/admin/blogArticle/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 22:06:40', 2, '2018-09-12 22:06:40', NULL, b'0');
INSERT INTO `sys_log` VALUES (511, 'Ajax请求', '删除博客内容数据', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/delete', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.delete', '[2]', '3f22af91-1e40-4561-9549-90b563bb7f0c', '{\"success\":true,\"message\":\"成功\"}', 78, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 22:06:45', 2, '2018-09-12 22:06:45', NULL, b'0');
INSERT INTO `sys_log` VALUES (512, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '3f22af91-1e40-4561-9549-90b563bb7f0c', '\"/admin/blogArticle/list\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 22:06:46', 2, '2018-09-12 22:06:46', NULL, b'0');
INSERT INTO `sys_log` VALUES (513, 'Ajax请求', '保存新增博客内容数据', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/add', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.add', '[{\"category\":\"1\",\"channelId\":22,\"content\":\"<p style=\'padding-top: 3px; padding-bottom: 3px; font-family: &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255); line-height: 30px; text-indent: 2em; font-size: 16px;\'><strong>四川新闻网德阳3月12日讯（邓传蓉 文/图）</strong>伟大的教育家叶圣陶先生曾说：“什么是教育？简单一点说，教育就是养成良好的习惯”。3月12日早晨，在周一的朝会上，旌阳区德新小学校长钱继光再一次对全校学生进行了习惯养成的教育。</p><p style=\'padding-top: 3px; padding-bottom: 3px; font-family: &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255); line-height: 30px; text-indent: 2em; font-size: 16px;\'>钱继光首先就上周行政值周的情况进行了总结，表扬同学们做得好的方面，也指出了哪些方面还存在不足，希望同学们改进。并就学习行为习惯、生活行为习惯、安全行为习惯、文明礼仪习惯分别对同学们提出了要求。特别强调了学习要主动积极，提前预习，及时复习；清洁卫生不光要打扫干净，还要注意保持，不仅要保持校园卫生，也要注意个人清洁卫生；在学雷锋月的三月里，更做个讲文明有礼仪的孩子。钱继光同时对安全行为习惯进行了重点教育：楼梯楼道安全、课间活动安全、交通安全、防意外伤害、预防春季流行疾病······要求同学们在校在家都要有安全意识和自我保护意识，不做危险的事，不到危险的地方玩耍。</p><p style=\'padding-top: 3px; padding-bottom: 3px; font-family: &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255); line-height: 30px; text-indent: 2em; font-size: 16px;\'>知先行后，希望所有的孩子通过学校常抓不懈的习惯养成教育，都能形成良好的学习、生活和安全习惯，健康、安全、快乐地成长。</p>\",\"delFlag\":false,\"marks\":\"\",\"publistTime\":1536710400000,\"recommend\":false,\"resources\":\"\",\"showPic\":\"\",\"subTitle\":\"\",\"text\":\"四川新闻网德阳3月12日讯（邓传蓉 文/图）伟大的教育家叶圣陶先生曾说：“什么是教育？简单一点说，教育就是养成良好的习惯”。3月12日早晨，在周一的朝会上，旌阳区德新小学校长钱继光再一次对全校学生进行了习惯养成的教育。钱继光首先就上周行政值周的情况进行了总结，表扬同学们做得好的方面，也指出了哪些方面还存在不足，希望同学们改进。并就学习行为习惯、生活行为习惯、安全行为习惯、文明礼仪习惯分别对同学们提出了要求。特别强调了学习要主动积极，提前预习，及时复习；清洁卫生不光要打扫干净，还要注意保持，不仅要保持校园卫生，也要注意个人清洁卫生；在学雷锋月的三月里，更做个讲文明有礼仪的孩子。钱继光同时对安全行为习惯进行了重点教育：楼梯楼道安全、课间活动安全、交通安全、防意外伤害、预防春季流行疾病······要求同学们在校在家都要有安全意识和自我保护意识，不做危险的事，不到危险的地方玩耍。知先行后，希望所有的孩子通过学校常抓不懈的习惯养成教育，都能形成良好的学习、生活和安全习惯，健康、安全、快乐地成长。\",\"title\":\"旌阳区德新小学：习惯养成教育常抓不懈\",\"top\":false}]', '3f22af91-1e40-4561-9549-90b563bb7f0c', '{\"success\":true,\"message\":\"成功\"}', 219, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 22:13:02', 2, '2018-09-12 22:13:02', NULL, b'0');
INSERT INTO `sys_log` VALUES (514, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '3f22af91-1e40-4561-9549-90b563bb7f0c', '\"/admin/blogArticle/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 22:13:03', 2, '2018-09-12 22:13:03', NULL, b'0');
INSERT INTO `sys_log` VALUES (515, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '3f22af91-1e40-4561-9549-90b563bb7f0c', '\"/admin/blogArticle/list\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 22:14:17', 2, '2018-09-12 22:14:17', NULL, b'0');
INSERT INTO `sys_log` VALUES (516, 'Ajax请求', '删除博客内容数据', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/delete', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.delete', '[3]', '3f22af91-1e40-4561-9549-90b563bb7f0c', '{\"success\":true,\"message\":\"成功\"}', 147, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 22:14:27', 2, '2018-09-12 22:14:27', NULL, b'0');
INSERT INTO `sys_log` VALUES (517, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '3f22af91-1e40-4561-9549-90b563bb7f0c', '\"/admin/blogArticle/list\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 22:14:28', 2, '2018-09-12 22:14:28', NULL, b'0');
INSERT INTO `sys_log` VALUES (518, 'Ajax请求', '用户登录', '127.0.0.1', '宋平', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@3f765aaf\"]', 'c17e4726-0d9c-4c2d-ac46-86df56e791b3', '{\"success\":false,\"message\":\"验证码错误\"}', 5, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 23:19:17', 2, '2018-09-12 23:19:17', NULL, b'0');
INSERT INTO `sys_log` VALUES (519, 'Ajax请求', '用户登录', '127.0.0.1', '宋平', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@223deb43\"]', 'c17e4726-0d9c-4c2d-ac46-86df56e791b3', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 14, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 23:19:33', 2, '2018-09-12 23:19:33', NULL, b'0');
INSERT INTO `sys_log` VALUES (520, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'c17e4726-0d9c-4c2d-ac46-86df56e791b3', '\"/admin/blogArticle/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 23:19:35', 2, '2018-09-12 23:19:35', NULL, b'0');
INSERT INTO `sys_log` VALUES (521, 'Ajax请求', '保存新增博客内容数据', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/add', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.add', '[{\"category\":\"1\",\"channelId\":22,\"content\":\"<p style=\'margin-top: 26px; margin-bottom: 0px; font-size: 16px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; background-color: rgb(255, 255, 255);\'>四川新闻网德阳9月3日讯（邓传蓉 文/图）9月3日上午9点，旌阳区德新小学隆重举行2018年秋期开学典礼。</p><p style=\'margin-top: 22px; margin-bottom: 0px; font-size: 16px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; background-color: rgb(255, 255, 255);\'>庄严的升旗仪式之后，学校校长钱继光首先做了热情洋溢的致辞。他在致辞中肯定了学校上学期所取得的各项成绩，对全体教师认真负责的敬业精神和同学们勤奋努力的学习态度给予了高度赞扬。钱继光希望全体教师一如既往做师德高尚、学生热爱、家长满意的优秀教师，希望同学们爱卫生、讲文明，树新风，勇于接受新挑战，用实际的行动实现新学期的新希望。</p><p style=\'margin-top: 22px; margin-bottom: 0px; font-size: 16px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; background-color: rgb(255, 255, 255);\'>接着，副校长王辉对全校学生进行了开学安全、健康、法制第一课。在校园活动安全、预防流行疾病、交通安全、防溺水、食品健康卫生、防校园欺凌、学法用法等方面给学生进行了生动的讲解。</p><p style=\'margin-top: 22px; margin-bottom: 0px; font-size: 16px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; background-color: rgb(255, 255, 255);\'>集会后，各班班主任对学生进行新学期的收心教育、行为习惯教育和安全健康法制教育。希望德新小学的全体学生，以更加饱满的精神和昂扬的姿态迎接新学期，在新学期安全、健康、快乐地学习和生活，取得优异的成绩。</p>\",\"delFlag\":false,\"marks\":\"四川新闻网德阳9月3日讯（邓传蓉 文/图）9月3日上午9点，旌阳区德新小学隆重举行2018年秋期开学典礼\",\"publistTime\":1536710400000,\"recommend\":false,\"resources\":\"\",\"showPic\":\"\",\"subTitle\":\"\",\"text\":\"四川新闻网德阳9月3日讯（邓传蓉 文/图）9月3日上午9点，旌阳区德新小学隆重举行2018年秋期开学典礼。庄严的升旗仪式之后，学校校长钱继光首先做了热情洋溢的致辞。他在致辞中肯定了学校上学期所取得的各项成绩，对全体教师认真负责的敬业精神和同学们勤奋努力的学习态度给予了高度赞扬。钱继光希望全体教师一如既往做师德高尚、学生热爱、家长满意的优秀教师，希望同学们爱卫生、讲文明，树新风，勇于接受新挑战，用实际的行动实现新学期的新希望。接着，副校长王辉对全校学生进行了开学安全、健康、法制第一课。在校园活动安全、预防流行疾病、交通安全、防溺水、食品健康卫生、防校园欺凌、学法用法等方面给学生进行了生动的讲解。集会后，各班班主任对学生进行新学期的收心教育、行为习惯教育和安全健康法制教育。希望德新小学的全体学生，以更加饱满的精神和昂扬的姿态迎接新学期，在新学期安全、健康、快乐地学习和生活，取得优异的成绩。\",\"title\":\"旌阳区美术“青蓝工程”教学研讨活动在德新小学开展\",\"top\":false}]', 'c17e4726-0d9c-4c2d-ac46-86df56e791b3', '{\"success\":true,\"message\":\"成功\"}', 95, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 23:20:21', 2, '2018-09-12 23:20:21', NULL, b'0');
INSERT INTO `sys_log` VALUES (522, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'c17e4726-0d9c-4c2d-ac46-86df56e791b3', '\"/admin/blogArticle/list\"', 6, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 23:20:23', 2, '2018-09-12 23:20:23', NULL, b'0');
INSERT INTO `sys_log` VALUES (523, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'c17e4726-0d9c-4c2d-ac46-86df56e791b3', '\"/admin/blogArticle/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 23:21:59', 2, '2018-09-12 23:21:59', NULL, b'0');
INSERT INTO `sys_log` VALUES (524, 'Ajax请求', '保存新增博客内容数据', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/add', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.add', '[{\"category\":\"1\",\"channelId\":22,\"content\":\"<p style=\'padding-top: 3px; padding-bottom: 3px; font-family: &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255); line-height: 30px; text-indent: 2em; font-size: 16px;\'><strong>四川新闻网德阳11月6日讯（宋平 邓传蓉 文/图）</strong>11月6日上午，在旌阳区教科所美术教研员冯伟杰的带领下，市区美术教师辜小平、侯德晖、王开琴、刘进川等一行人到德新小学分部进行青蓝工程的听课活动，德新小学美术教师宋平老师上了一堂《自行车局部写生》的户外写生课。</p><p style=\'padding-top: 3px; padding-bottom: 3px; font-family: &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255); line-height: 30px; text-indent: 2em; font-size: 16px;\'>在绿树环绕的教学楼前，宋平老师先让学生观察现实中的自行车，再对学生们讲解自行车的结构，然后教同学们如何运用灵活多变的线条，进行自行车局部写生创作。同学们在轻松愉快的环境中完成了本堂课的任务。</p><p style=\'padding-top: 3px; padding-bottom: 3px; font-family: &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255); line-height: 30px; text-indent: 2em; font-size: 16px;\'>课后，听课的老师们都作出了高度评价，说作为农村小学能达到这种水平非常棒，肯定了学生的基本功很牢固。冯伟杰和侯德晖老师说，将课堂搬到户外这种形式非常好，学生都非常开心，课堂氛围活跃，课程结构非常完整，每个教学环节的设计有新意。美术特级教师辜小平老师除了对本堂课进行点评，还着重讲了青年美术教师应该如何规划自己的教学生涯，让美术教师拥有成就感，成就感来源于学生的作品和教师的作品，主张将小学每个角落拥有学生的作品。</p><p style=\'padding-top: 3px; padding-bottom: 3px; font-family: &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255); line-height: 30px; text-indent: 2em; font-size: 16px;\'>当然也提出了很多宝贵的意见，王开琴老师指出，在学生创作时应让学生动起来，学生自己去选择喜欢的自行车局部。辜小平老师说，学生在局部写生创作时应延伸到每个小的细节，将局部画得更精细，学生构图上应注意画面的饱满，空白地方的处理等。与会老师指出，青年美术教师应让自身的基本功变得更扎实，平时要多画，多练，多参加展览，提升自身素质。</p><p style=\'padding-top: 3px; padding-bottom: 3px; font-family: &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255); line-height: 30px; text-indent: 2em; font-size: 16px;\'>本次美术“青蓝工程”教学研讨活动，专家指导，名师引领，让与会教师受益匪浅，促进了青年教师的快速成长。</p>\",\"delFlag\":false,\"marks\":\"四川新闻网德阳11月6日讯（宋平 邓传蓉 文/图）11月6日上午，在旌阳区教科所美术教研员冯伟杰的带领下，市区美术教师辜小平、侯德晖、王开琴、刘进川等一行人到德新小学分部进行青蓝工程的听课活动，德新小学美术教师宋平老师上了一堂《自行车局部写生》的户外写生课\",\"publistTime\":1536710400000,\"recommend\":false,\"resources\":\"\",\"showPic\":\"\",\"subTitle\":\"\",\"text\":\"四川新闻网德阳11月6日讯（宋平 邓传蓉 文/图）11月6日上午，在旌阳区教科所美术教研员冯伟杰的带领下，市区美术教师辜小平、侯德晖、王开琴、刘进川等一行人到德新小学分部进行青蓝工程的听课活动，德新小学美术教师宋平老师上了一堂《自行车局部写生》的户外写生课。在绿树环绕的教学楼前，宋平老师先让学生观察现实中的自行车，再对学生们讲解自行车的结构，然后教同学们如何运用灵活多变的线条，进行自行车局部写生创作。同学们在轻松愉快的环境中完成了本堂课的任务。课后，听课的老师们都作出了高度评价，说作为农村小学能达到这种水平非常棒，肯定了学生的基本功很牢固。冯伟杰和侯德晖老师说，将课堂搬到户外这种形式非常好，学生都非常开心，课堂氛围活跃，课程结构非常完整，每个教学环节的设计有新意。美术特级教师辜小平老师除了对本堂课进行点评，还着重讲了青年美术教师应该如何规划自己的教学生涯，让美术教师拥有成就感，成就感来源于学生的作品和教师的作品，主张将小学每个角落拥有学生的作品。当然也提出了很多宝贵的意见，王开琴老师指出，在学生创作时应让学生动起来，学生自己去选择喜欢的自行车局部。辜小平老师说，学生在局部写生创作时应延伸到每个小的细节，将局部画得更精细，学生构图上应注意画面的饱满，空白地方的处理等。与会老师指出，青年美术教师应让自身的基本功变得更扎实，平时要多画，多练，多参加展览，提升自身素质。本次美术“青蓝工程”教学研讨活动，专家指导，名师引领，让与会教师受益匪浅，促进了青年教师的快速成长。\",\"title\":\"旌阳区美术“青蓝工程”教学研讨活动在德新小学开展\",\"top\":false}]', 'c17e4726-0d9c-4c2d-ac46-86df56e791b3', '{\"success\":true,\"message\":\"成功\"}', 77, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 23:22:36', 2, '2018-09-12 23:22:36', NULL, b'0');
INSERT INTO `sys_log` VALUES (525, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'c17e4726-0d9c-4c2d-ac46-86df56e791b3', '\"/admin/blogArticle/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 23:22:37', 2, '2018-09-12 23:22:37', NULL, b'0');
INSERT INTO `sys_log` VALUES (526, 'Ajax请求', '保存新增博客内容数据', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/add', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.add', '[{\"category\":\"1\",\"channelId\":22,\"content\":\"<p style=\'margin-top: 26px; margin-bottom: 0px; font-size: 16px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; background-color: rgb(255, 255, 255);\'><b>四川新闻网德阳9月3日讯（邓传蓉 文/图）</b>9月3日上午9点，旌阳区德新小学隆重举行2018年秋期开学典礼。</p><p style=\'margin-top: 22px; margin-bottom: 0px; font-size: 16px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; background-color: rgb(255, 255, 255);\'>庄严的升旗仪式之后，学校校长钱继光首先做了热情洋溢的致辞。他在致辞中肯定了学校上学期所取得的各项成绩，对全体教师认真负责的敬业精神和同学们勤奋努力的学习态度给予了高度赞扬。钱继光希望全体教师一如既往做师德高尚、学生热爱、家长满意的优秀教师，希望同学们爱卫生、讲文明，树新风，勇于接受新挑战，用实际的行动实现新学期的新希望。</p><p style=\'margin-top: 22px; margin-bottom: 0px; font-size: 16px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; background-color: rgb(255, 255, 255);\'>接着，副校长王辉对全校学生进行了开学安全、健康、法制第一课。在校园活动安全、预防流行疾病、交通安全、防溺水、食品健康卫生、防校园欺凌、学法用法等方面给学生进行了生动的讲解。</p><p style=\'margin-top: 22px; margin-bottom: 0px; font-size: 16px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; background-color: rgb(255, 255, 255);\'>集会后，各班班主任对学生进行新学期的收心教育、行为习惯教育和安全健康法制教育。希望德新小学的全体学生，以更加饱满的精神和昂扬的姿态迎接新学期，在新学期安全、健康、快乐地学习和生活，取得优异的成绩。</p>\",\"delFlag\":false,\"marks\":\"四川新闻网德阳9月3日讯（邓传蓉 文/图）9月3日上午9点，旌阳区德新小学隆重举行2018年秋期开学典礼。\",\"publistTime\":1536710400000,\"recommend\":false,\"resources\":\"\",\"showPic\":\"\",\"subTitle\":\"\",\"text\":\"四川新闻网德阳9月3日讯（邓传蓉 文/图）9月3日上午9点，旌阳区德新小学隆重举行2018年秋期开学典礼。庄严的升旗仪式之后，学校校长钱继光首先做了热情洋溢的致辞。他在致辞中肯定了学校上学期所取得的各项成绩，对全体教师认真负责的敬业精神和同学们勤奋努力的学习态度给予了高度赞扬。钱继光希望全体教师一如既往做师德高尚、学生热爱、家长满意的优秀教师，希望同学们爱卫生、讲文明，树新风，勇于接受新挑战，用实际的行动实现新学期的新希望。接着，副校长王辉对全校学生进行了开学安全、健康、法制第一课。在校园活动安全、预防流行疾病、交通安全、防溺水、食品健康卫生、防校园欺凌、学法用法等方面给学生进行了生动的讲解。集会后，各班班主任对学生进行新学期的收心教育、行为习惯教育和安全健康法制教育。希望德新小学的全体学生，以更加饱满的精神和昂扬的姿态迎接新学期，在新学期安全、健康、快乐地学习和生活，取得优异的成绩。\",\"title\":\"旌阳区德新小学举行2018年秋期开学典礼\",\"top\":false}]', 'c17e4726-0d9c-4c2d-ac46-86df56e791b3', '{\"success\":true,\"message\":\"成功\"}', 81, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 23:27:34', 2, '2018-09-12 23:27:34', NULL, b'0');
INSERT INTO `sys_log` VALUES (527, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'c17e4726-0d9c-4c2d-ac46-86df56e791b3', '\"/admin/blogArticle/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 23:27:35', 2, '2018-09-12 23:27:35', NULL, b'0');
INSERT INTO `sys_log` VALUES (528, 'Ajax请求', '保存编辑博客内容数据', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/edit', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.edit', '[{\"category\":\"1\",\"channelId\":21,\"content\":\"<p></p><p style=\'text-align: center;\'></p><p style=\'text-align: left;\'></p><p><br></p><p></p><p style=\'text-align:center\'><video style=\'margin:0 auto;\' src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/dexinxiaoxue.mp4\' controls=\'controls\'> 不支持播放该视频 </video></p><h2 style=\'text-align: left;\'>&nbsp; &nbsp; &nbsp;旌阳区德新小学\\n\\n座落在距离德阳市北20公里的\\n\\n“西蜀泉乡”</h2><h2 style=\'text-align: left;\'>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ——德新镇&nbsp;</h2><h2 style=\'text-align: left;\'>&nbsp; &nbsp; &nbsp;1916年，秀才舒尔英在新场火神庙内办起的学堂，\\n\\n这是德新小学的前身&nbsp;</h2><h2 style=\'text-align: left;\'>&nbsp; &nbsp; &nbsp;学校现有教师65名，\\n\\n小学生807名，幼儿生208名，\\n\\n是小而美、小而优的农村小学</h2><h2 style=\'text-align: left;\'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;老师说：“严在当严处，爱在细微中。”\\n\\n校长说：尊重每一个孩子的生命个体，\\n\\n努力让他们学有所成，&nbsp;</h2><h2 style=\'text-align: left;\'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;并找到适合每一个生命个体的发展路径，\\n\\n为他们的终身发展奠定坚实的基础</h2><p><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/dexin.jpg\' style=\'max-width:100%;\'><br></p><p></p><p><br></p>\",\"delFlag\":false,\"id\":1,\"marks\":\"旌阳区德新小学座落在距离德阳市北20公里的“西蜀泉乡”——德新镇，1916年，秀才舒尔英在新场火神庙内办起的学堂，这是德新小学的前身\",\"publistTime\":1536710400000,\"recommend\":true,\"resources\":\"\",\"showPic\":\"https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/dexin.jpg\",\"sort\":0,\"subTitle\":\"\",\"text\":\" 不支持播放该视频 &nbsp; &nbsp; &nbsp;旌阳区德新小学\\n\\n座落在距离德阳市北20公里的\\n\\n“西蜀泉乡”&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ——德新镇&nbsp;&nbsp; &nbsp; &nbsp;1916年，秀才舒尔英在新场火神庙内办起的学堂，\\n\\n这是德新小学的前身&nbsp;&nbsp; &nbsp; &nbsp;学校现有教师65名，\\n\\n小学生807名，幼儿生208名，\\n\\n是小而美、小而优的农村小学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;老师说：“严在当严处，爱在细微中。”\\n\\n校长说：尊重每一个孩子的生命个体，\\n\\n努力让他们学有所成，&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;并找到适合每一个生命个体的发展路径，\\n\\n为他们的终身发展奠定坚实的基础\",\"title\":\"学校简介\",\"top\":true}]', 'c17e4726-0d9c-4c2d-ac46-86df56e791b3', '{\"success\":true,\"message\":\"成功\"}', 133, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 23:30:49', 2, '2018-09-12 23:30:49', NULL, b'0');
INSERT INTO `sys_log` VALUES (529, 'Ajax请求', '保存新增博客内容数据', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/add', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.add', '[{\"category\":\"1\",\"channelId\":22,\"content\":\"<p style=\'-webkit-tap-highlight-color: transparent; margin-top: 16px; margin-bottom: 16px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; font-size: 16px; background-color: rgb(255, 255, 255);\'><span style=\'-webkit-tap-highlight-color: transparent; font-weight: 700;\'>四川新闻网德阳9月12日讯（黄敏 邓传蓉 文/图）</span>为了提高语文课堂教学效率，进一步规范语文教学常规管理，明确本学期教学目标和教研活动安排，9月11日下午，旌阳区德新小学语文教研组召开了新学期的第一次教研活动。此次活动的内容是学习本学期教研组工作计划和小学语文新课程标准，并对上学期的教学工作进行总结和反思。</p><p style=\'-webkit-tap-highlight-color: transparent; margin-top: 16px; margin-bottom: 16px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; font-size: 16px; background-color: rgb(255, 255, 255);\'>首先，语文教研组长黄敏组织全组老师学习了本学期的教研工作计划，对本学期的教研工作进行了详细的安排，各语文教师认真听取并了解了自己的教学教研工作任务。</p><p style=\'-webkit-tap-highlight-color: transparent; margin-top: 16px; margin-bottom: 16px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; font-size: 16px; background-color: rgb(255, 255, 255);\'>然后，全体语文教师再次进行了小学语文新课程标准的学习，对语文教学特点和教学总目标、各年段目标有了更深入的了解，以助推语文教学。</p><p style=\'-webkit-tap-highlight-color: transparent; margin-top: 16px; margin-bottom: 16px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; font-size: 16px; background-color: rgb(255, 255, 255);\'>最后，对上期教学工作进行总结和反思。从学生的实际情况出发，从教学中存在的问题出发，大家展开了激烈的发言和讨论。针对农村留守儿童缺乏家长辅导和督促，课外阅读少积累欠丰富，阅读写作能力有待提高等现状，教师们踊跃发言，各抒己见，相互支招，交流总结经验，思考补救措施。</p><p style=\'-webkit-tap-highlight-color: transparent; margin-top: 16px; margin-bottom: 16px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; font-size: 16px; background-color: rgb(255, 255, 255);\'>以研促教，以学定教，本次活动研讨氛围浓厚，立足实际，放眼学生语文素养的形成和发展。相信在学校领导的大力支持下，通过全体语文老师的努力，德新小学的孩子们会更热爱阅读，更善于阅读，遨游书海，愉悦成长。</p>\",\"delFlag\":false,\"marks\":\"四川新闻网德阳9月12日讯（黄敏 邓传蓉 文/图）为了提高语文课堂教学效率，进一步规范语文教学常规管理，明确本学期教学目标和教研活动安排，9月11日下午，旌阳区德新小学语文教研组召开了新学期的第一次教研活动\",\"publistTime\":1536710400000,\"recommend\":false,\"resources\":\"\",\"showPic\":\"\",\"subTitle\":\"\",\"text\":\"四川新闻网德阳9月12日讯（黄敏 邓传蓉 文/图）为了提高语文课堂教学效率，进一步规范语文教学常规管理，明确本学期教学目标和教研活动安排，9月11日下午，旌阳区德新小学语文教研组召开了新学期的第一次教研活动。此次活动的内容是学习本学期教研组工作计划和小学语文新课程标准，并对上学期的教学工作进行总结和反思。首先，语文教研组长黄敏组织全组老师学习了本学期的教研工作计划，对本学期的教研工作进行了详细的安排，各语文教师认真听取并了解了自己的教学教研工作任务。然后，全体语文教师再次进行了小学语文新课程标准的学习，对语文教学特点和教学总目标、各年段目标有了更深入的了解，以助推语文教学。最后，对上期教学工作进行总结和反思。从学生的实际情况出发，从教学中存在的问题出发，大家展开了激烈的发言和讨论。针对农村留守儿童缺乏家长辅导和督促，课外阅读少积累欠丰富，阅读写作能力有待提高等现状，教师们踊跃发言，各抒己见，相互支招，交流总结经验，思考补救措施。以研促教，以学定教，本次活动研讨氛围浓厚，立足实际，放眼学生语文素养的形成和发展。相信在学校领导的大力支持下，通过全体语文老师的努力，德新小学的孩子们会更热爱阅读，更善于阅读，遨游书海，愉悦成长。\",\"title\":\"旌阳区德新小学语文研讨会：以研促教 以学定教\",\"top\":false}]', 'c17e4726-0d9c-4c2d-ac46-86df56e791b3', '{\"success\":true,\"message\":\"成功\"}', 89, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 23:31:52', 2, '2018-09-12 23:31:52', NULL, b'0');
INSERT INTO `sys_log` VALUES (530, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'c17e4726-0d9c-4c2d-ac46-86df56e791b3', '\"/admin/blogArticle/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 23:31:53', 2, '2018-09-12 23:31:53', NULL, b'0');
INSERT INTO `sys_log` VALUES (531, 'Ajax请求', '保存新增博客内容数据', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/add', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.add', '[{\"category\":\"1\",\"channelId\":22,\"content\":\"<p style=\'padding-top: 3px; padding-bottom: 3px; font-family: &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255); line-height: 30px; text-indent: 2em; font-size: 16px;\'><strong>四川新闻网德阳3月12日讯（邓传蓉 文/图）</strong>伟大的教育家叶圣陶先生曾说：“什么是教育？简单一点说，教育就是养成良好的习惯”。3月12日早晨，在周一的朝会上，旌阳区德新小学校长钱继光再一次对全校学生进行了习惯养成的教育。</p><p style=\'padding-top: 3px; padding-bottom: 3px; font-family: &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255); line-height: 30px; text-indent: 2em; font-size: 16px;\'>钱继光首先就上周行政值周的情况进行了总结，表扬同学们做得好的方面，也指出了哪些方面还存在不足，希望同学们改进。并就学习行为习惯、生活行为习惯、安全行为习惯、文明礼仪习惯分别对同学们提出了要求。特别强调了学习要主动积极，提前预习，及时复习；清洁卫生不光要打扫干净，还要注意保持，不仅要保持校园卫生，也要注意个人清洁卫生；在学雷锋月的三月里，更做个讲文明有礼仪的孩子。钱继光同时对安全行为习惯进行了重点教育：楼梯楼道安全、课间活动安全、交通安全、防意外伤害、预防春季流行疾病······要求同学们在校在家都要有安全意识和自我保护意识，不做危险的事，不到危险的地方玩耍。</p><p style=\'padding-top: 3px; padding-bottom: 3px; font-family: &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255); line-height: 30px; text-indent: 2em; font-size: 16px;\'>知先行后，希望所有的孩子通过学校常抓不懈的习惯养成教育，都能形成良好的学习、生活和安全习惯，健康、安全、快乐地成长。</p>\",\"delFlag\":false,\"marks\":\"四川新闻网德阳3月12日讯（邓传蓉 文/图）伟大的教育家叶圣陶先生曾说：“什么是教育？简单一点说，教育就是养成良好的习惯”。3月12日早晨，在周一的朝会上，旌阳区德新小学校长钱继光再一次对全校学生进行了习惯养成的教育。\",\"publistTime\":1536710400000,\"recommend\":false,\"resources\":\"\",\"showPic\":\"\",\"subTitle\":\"\",\"text\":\"四川新闻网德阳3月12日讯（邓传蓉 文/图）伟大的教育家叶圣陶先生曾说：“什么是教育？简单一点说，教育就是养成良好的习惯”。3月12日早晨，在周一的朝会上，旌阳区德新小学校长钱继光再一次对全校学生进行了习惯养成的教育。钱继光首先就上周行政值周的情况进行了总结，表扬同学们做得好的方面，也指出了哪些方面还存在不足，希望同学们改进。并就学习行为习惯、生活行为习惯、安全行为习惯、文明礼仪习惯分别对同学们提出了要求。特别强调了学习要主动积极，提前预习，及时复习；清洁卫生不光要打扫干净，还要注意保持，不仅要保持校园卫生，也要注意个人清洁卫生；在学雷锋月的三月里，更做个讲文明有礼仪的孩子。钱继光同时对安全行为习惯进行了重点教育：楼梯楼道安全、课间活动安全、交通安全、防意外伤害、预防春季流行疾病······要求同学们在校在家都要有安全意识和自我保护意识，不做危险的事，不到危险的地方玩耍。知先行后，希望所有的孩子通过学校常抓不懈的习惯养成教育，都能形成良好的学习、生活和安全习惯，健康、安全、快乐地成长。\",\"title\":\"旌阳区德新小学：习惯养成教育常抓不懈\",\"top\":false}]', 'c17e4726-0d9c-4c2d-ac46-86df56e791b3', '{\"success\":true,\"message\":\"成功\"}', 83, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 23:33:04', 2, '2018-09-12 23:33:04', NULL, b'0');
INSERT INTO `sys_log` VALUES (532, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'c17e4726-0d9c-4c2d-ac46-86df56e791b3', '\"/admin/blogArticle/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 23:33:06', 2, '2018-09-12 23:33:06', NULL, b'0');
INSERT INTO `sys_log` VALUES (533, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'c17e4726-0d9c-4c2d-ac46-86df56e791b3', '\"/admin/blogArticle/list\"', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 23:36:54', 2, '2018-09-12 23:36:54', NULL, b'0');
INSERT INTO `sys_log` VALUES (534, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'c17e4726-0d9c-4c2d-ac46-86df56e791b3', '\"/admin/blogArticle/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 23:37:41', 2, '2018-09-12 23:37:41', NULL, b'0');
INSERT INTO `sys_log` VALUES (535, 'Ajax请求', '保存新增博客内容数据', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/add', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.add', '[{\"category\":\"1\",\"channelId\":22,\"content\":\"<p><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/tp1.jpg\' style=\'max-width:100%;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/tp2.jpg\' style=\'max-width: 100%;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/tp3.jpg\' style=\'max-width: 100%;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/tp4.jpg\' style=\'max-width: 100%;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/tp5.jpg\' style=\'max-width: 100%;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/tp6.jpg\' style=\'max-width: 100%;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/tp7.jpg\' style=\'max-width: 100%;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/tp8.jpg\' style=\'max-width: 100%;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/tp9.jpg\' style=\'max-width: 100%;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/tp10.jpg\' style=\'max-width: 100%;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/tp11.jpg\' style=\'max-width: 100%;\'>&nbsp;<br></p>\",\"delFlag\":false,\"marks\":\"旌阳区中小学生艺术节开幕啦！快来为孩子们点赞\",\"publistTime\":1536710400000,\"recommend\":false,\"resources\":\"\",\"showPic\":\"\",\"subTitle\":\"\",\"text\":\"&nbsp;\",\"title\":\"旌阳区中小学生艺术节开幕啦！快来为孩子们点赞\",\"top\":false}]', 'c17e4726-0d9c-4c2d-ac46-86df56e791b3', '{\"success\":true,\"message\":\"成功\"}', 74, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 23:46:09', 2, '2018-09-12 23:46:09', NULL, b'0');
INSERT INTO `sys_log` VALUES (536, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'c17e4726-0d9c-4c2d-ac46-86df56e791b3', '\"/admin/blogArticle/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-12 23:46:10', 2, '2018-09-12 23:46:10', NULL, b'0');
INSERT INTO `sys_log` VALUES (537, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@e660306\"]', '44b21ff8-72de-4955-9008-e42ac61abe9a', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 593, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:07:20', 1, '2018-09-14 10:07:20', NULL, b'0');
INSERT INTO `sys_log` VALUES (538, '普通请求', '退出系统', '127.0.0.1', '我是管理员', 'http://localhost:8080/systemLogout', 'GET', 'com.mysiteforme.admin.controller.LoginController.logOut', '[]', '44b21ff8-72de-4955-9008-e42ac61abe9a', '\"redirect:/login\"', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-14 10:10:20', NULL, '2018-09-14 10:10:20', NULL, b'0');
INSERT INTO `sys_log` VALUES (539, 'Ajax请求', '用户登录', '127.0.0.1', NULL, 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@70b13693\"]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '{\"success\":false,\"message\":\"验证码错误\"}', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-14 10:28:42', NULL, '2018-09-14 10:28:42', NULL, b'0');
INSERT INTO `sys_log` VALUES (540, 'Ajax请求', '用户登录', '127.0.0.1', NULL, 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@47356941\"]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '{\"success\":false,\"message\":\"验证码错误\"}', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-14 10:28:51', NULL, '2018-09-14 10:28:51', NULL, b'0');
INSERT INTO `sys_log` VALUES (541, 'Ajax请求', '用户登录', '127.0.0.1', NULL, 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@38c42b85\"]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '{\"success\":false,\"message\":\"验证码错误\"}', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-14 10:29:04', NULL, '2018-09-14 10:29:04', NULL, b'0');
INSERT INTO `sys_log` VALUES (542, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@7f1dceeb\"]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 8, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:29:16', 1, '2018-09-14 10:29:16', NULL, b'0');
INSERT INTO `sys_log` VALUES (543, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '\"admin/system/site/show\"', 6, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:37:16', 1, '2018-09-14 10:37:16', NULL, b'0');
INSERT INTO `sys_log` VALUES (544, 'Ajax请求', '文件上传', '127.0.0.1', '我是管理员', 'http://localhost:8080/file/upload', 'POST', 'com.mysiteforme.admin.controller.system.FileController.uploadFile', '[\"org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@3bed6921\",\"org.springframework.web.multipart.support.StandardMultipartHttpServletRequest@6f60a598\"]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '{\"data\":{\"name\":\"favicon.ico\",\"url\":\"http://192.168.137.1:8080/static/upload/afd8c39e-2732-40a4-82f4-134d3c4f1be4.ico\"},\"success\":true,\"message\":\"成功\"}', 65, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:38:16', 1, '2018-09-14 10:38:16', NULL, b'0');
INSERT INTO `sys_log` VALUES (545, 'Ajax请求', '保存网站基本数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/edit', 'POST', 'com.mysiteforme.admin.controller.system.SiteController.edit', '[{\"address\":\"江苏-苏州\",\"author\":\"jiaopan\",\"authorIcon\":\"https://static.mysiteforme.com/3c5b69f4-2e39-4f88-b302-a6eb48e4c43a.jpg\",\"database\":\"mysql\",\"delFlag\":false,\"description\":\"网站描述\",\"email\":\"1115784675@qq.com\",\"fileUploadType\":\"local\",\"git\":\"https://gitee.com/wanglingxiao/\",\"github\":\"https://github.com/wangl1989\",\"id\":1,\"keywords\":\"\",\"logo\":\"http://192.168.137.1:8080/static/upload/afd8c39e-2732-40a4-82f4-134d3c4f1be4.ico\",\"maxUpload\":0,\"name\":\"家校零距离\",\"noName\":false,\"openMessage\":true,\"phone\":\"13776055179\",\"powerby\":\"\",\"qq\":\"1115784675\",\"record\":\"苏ICP备17063650号\",\"remarks\":\"<p><br></p><p><br></p>\",\"server\":\"windows\",\"url\":\"cloud-campus.com\",\"version\":\"1.0\",\"weibo\":\"https://weibo.com/u/2173866382\"},\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@b164e93\"]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '{\"success\":true,\"message\":\"成功\"}', 123, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:38:25', 1, '2018-09-14 10:38:25', NULL, b'0');
INSERT INTO `sys_log` VALUES (546, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '\"admin/system/site/show\"', 5, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:38:28', 1, '2018-09-14 10:38:28', NULL, b'0');
INSERT INTO `sys_log` VALUES (547, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '\"admin/system/site/show\"', 6, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:38:30', 1, '2018-09-14 10:38:30', NULL, b'0');
INSERT INTO `sys_log` VALUES (548, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '\"admin/system/site/show\"', 5, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:39:12', 1, '2018-09-14 10:39:12', NULL, b'0');
INSERT INTO `sys_log` VALUES (549, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '\"admin/system/site/show\"', 6, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:40:01', 1, '2018-09-14 10:40:01', NULL, b'0');
INSERT INTO `sys_log` VALUES (550, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '\"admin/system/menu/test\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:40:13', 1, '2018-09-14 10:40:13', NULL, b'0');
INSERT INTO `sys_log` VALUES (551, '普通请求', '跳转博客评论列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogComment/list', 'GET', 'com.mysiteforme.admin.controller.BlogCommentController.list', '[]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '\"/admin/blogComment/list\"', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:41:45', 1, '2018-09-14 10:41:45', NULL, b'0');
INSERT INTO `sys_log` VALUES (552, '普通请求', '跳转博客评论列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogComment/list', 'GET', 'com.mysiteforme.admin.controller.BlogCommentController.list', '[]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '\"/admin/blogComment/list\"', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:42:07', 1, '2018-09-14 10:42:07', NULL, b'0');
INSERT INTO `sys_log` VALUES (553, '普通请求', '跳转资源展示列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/rescource/list', 'GET', 'com.mysiteforme.admin.controller.system.RescourceController.list', '[]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '\"admin/system/rescource/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:43:04', 1, '2018-09-14 10:43:04', NULL, b'0');
INSERT INTO `sys_log` VALUES (554, '普通请求', '跳转博客栏目列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogChannel/list', 'GET', 'com.mysiteforme.admin.controller.BlogChannelController.list', '[]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '\"/admin/blogChannel/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:43:38', 1, '2018-09-14 10:43:38', NULL, b'0');
INSERT INTO `sys_log` VALUES (555, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.mysiteforme.admin.controller.system.SiteController.show', '[{}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '\"admin/system/site/show\"', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:43:53', 1, '2018-09-14 10:43:53', NULL, b'0');
INSERT INTO `sys_log` VALUES (556, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '\"admin/system/menu/test\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:46:21', 1, '2018-09-14 10:46:21', NULL, b'0');
INSERT INTO `sys_log` VALUES (557, 'Ajax请求', '保存编辑菜单数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/edit', 'POST', 'com.mysiteforme.admin.controller.system.MenuController.edit', '[{\"bgColor\":\"\",\"delFlag\":false,\"href\":\"\",\"icon\":\"\",\"id\":10,\"isShow\":true,\"name\":\"文章管理\",\"permission\":\"\",\"sort\":10}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '{\"success\":true,\"message\":\"成功\"}', 1016, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:47:04', 1, '2018-09-14 10:47:04', NULL, b'0');
INSERT INTO `sys_log` VALUES (558, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '\"admin/system/menu/test\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:47:07', 1, '2018-09-14 10:47:07', NULL, b'0');
INSERT INTO `sys_log` VALUES (559, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '\"admin/system/menu/test\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:47:27', 1, '2018-09-14 10:47:27', NULL, b'0');
INSERT INTO `sys_log` VALUES (560, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '\"/admin/blogArticle/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:47:48', 1, '2018-09-14 10:47:48', NULL, b'0');
INSERT INTO `sys_log` VALUES (561, 'Ajax请求', '保存编辑菜单数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/edit', 'POST', 'com.mysiteforme.admin.controller.system.MenuController.edit', '[{\"bgColor\":\"#1962b5\",\"delFlag\":false,\"href\":\"/admin/blogArticle/list\",\"icon\":\"\",\"id\":13,\"isShow\":true,\"name\":\"文章列表\",\"permission\":\"blog:article:list\",\"sort\":8}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '{\"success\":true,\"message\":\"成功\"}', 174, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:47:55', 1, '2018-09-14 10:47:55', NULL, b'0');
INSERT INTO `sys_log` VALUES (562, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '\"admin/system/menu/test\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:47:57', 1, '2018-09-14 10:47:57', NULL, b'0');
INSERT INTO `sys_log` VALUES (563, 'Ajax请求', '保存编辑菜单数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/edit', 'POST', 'com.mysiteforme.admin.controller.system.MenuController.edit', '[{\"bgColor\":\"\",\"delFlag\":false,\"href\":\"\",\"icon\":\"\",\"id\":40,\"isShow\":false,\"name\":\"文章删除\",\"permission\":\"blog:article:delete\",\"sort\":20}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '{\"success\":true,\"message\":\"成功\"}', 148, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:48:35', 1, '2018-09-14 10:48:35', NULL, b'0');
INSERT INTO `sys_log` VALUES (564, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '\"admin/system/menu/test\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:48:37', 1, '2018-09-14 10:48:37', NULL, b'0');
INSERT INTO `sys_log` VALUES (565, 'Ajax请求', '保存编辑菜单数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/edit', 'POST', 'com.mysiteforme.admin.controller.system.MenuController.edit', '[{\"bgColor\":\"#c8e332\",\"delFlag\":false,\"href\":\"/admin/blogComment/list\",\"icon\":\"\",\"id\":12,\"isShow\":true,\"name\":\"文章评论\",\"permission\":\"blog:comment:list\",\"sort\":7}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '{\"success\":true,\"message\":\"成功\"}', 139, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:48:48', 1, '2018-09-14 10:48:48', NULL, b'0');
INSERT INTO `sys_log` VALUES (566, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '\"admin/system/menu/test\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:48:50', 1, '2018-09-14 10:48:50', NULL, b'0');
INSERT INTO `sys_log` VALUES (567, 'Ajax请求', '保存编辑菜单数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/edit', 'POST', 'com.mysiteforme.admin.controller.system.MenuController.edit', '[{\"bgColor\":\"\",\"delFlag\":false,\"href\":\"\",\"icon\":\"\",\"id\":44,\"isShow\":false,\"name\":\"删除文章栏目\",\"permission\":\"blog:channel:delete\",\"sort\":20}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '{\"success\":true,\"message\":\"成功\"}', 148, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:49:16', 1, '2018-09-14 10:49:16', NULL, b'0');
INSERT INTO `sys_log` VALUES (568, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '\"admin/system/menu/test\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:49:18', 1, '2018-09-14 10:49:18', NULL, b'0');
INSERT INTO `sys_log` VALUES (569, 'Ajax请求', '保存编辑菜单数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/edit', 'POST', 'com.mysiteforme.admin.controller.system.MenuController.edit', '[{\"bgColor\":\"\",\"delFlag\":false,\"href\":\"\",\"icon\":\"\",\"id\":43,\"isShow\":false,\"name\":\"编辑文章栏目\",\"permission\":\"blog:channel:edit\",\"sort\":10}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '{\"success\":true,\"message\":\"成功\"}', 159, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:49:29', 1, '2018-09-14 10:49:29', NULL, b'0');
INSERT INTO `sys_log` VALUES (570, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '\"admin/system/menu/test\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:49:31', 1, '2018-09-14 10:49:31', NULL, b'0');
INSERT INTO `sys_log` VALUES (571, 'Ajax请求', '保存编辑菜单数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/edit', 'POST', 'com.mysiteforme.admin.controller.system.MenuController.edit', '[{\"bgColor\":\"\",\"delFlag\":false,\"href\":\"\",\"icon\":\"\",\"id\":42,\"isShow\":false,\"name\":\"新增文章栏目\",\"permission\":\"blog:channel:add\",\"sort\":0}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '{\"success\":true,\"message\":\"成功\"}', 194, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:49:41', 1, '2018-09-14 10:49:41', NULL, b'0');
INSERT INTO `sys_log` VALUES (572, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '\"admin/system/menu/test\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:49:43', 1, '2018-09-14 10:49:43', NULL, b'0');
INSERT INTO `sys_log` VALUES (573, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '\"admin/system/menu/test\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:51:07', 1, '2018-09-14 10:51:07', NULL, b'0');
INSERT INTO `sys_log` VALUES (574, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '\"admin/system/menu/test\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:51:26', 1, '2018-09-14 10:51:26', NULL, b'0');
INSERT INTO `sys_log` VALUES (575, 'Ajax请求', '保存编辑菜单数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/edit', 'POST', 'com.mysiteforme.admin.controller.system.MenuController.edit', '[{\"bgColor\":\"#c3e8ce\",\"delFlag\":false,\"href\":\"/admin/blogTags/list\",\"icon\":\"\",\"id\":56,\"isShow\":true,\"name\":\"文章标签\",\"permission\":\"blog:tags:list\",\"sort\":3}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '{\"success\":true,\"message\":\"成功\"}', 130, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:51:35', 1, '2018-09-14 10:51:35', NULL, b'0');
INSERT INTO `sys_log` VALUES (576, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '\"admin/system/menu/test\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:51:37', 1, '2018-09-14 10:51:37', NULL, b'0');
INSERT INTO `sys_log` VALUES (577, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '\"admin/system/menu/test\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:51:42', 1, '2018-09-14 10:51:42', NULL, b'0');
INSERT INTO `sys_log` VALUES (578, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '\"admin/system/menu/test\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:52:33', 1, '2018-09-14 10:52:33', NULL, b'0');
INSERT INTO `sys_log` VALUES (579, 'Ajax请求', '保存编辑菜单数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/edit', 'POST', 'com.mysiteforme.admin.controller.system.MenuController.edit', '[{\"bgColor\":\"#d4573b\",\"delFlag\":false,\"href\":\"/admin/system/menu/list\",\"icon\":\"\",\"id\":4,\"isShow\":true,\"name\":\"系统菜单管理\",\"permission\":\"sys:menu:list\",\"sort\":20}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '{\"success\":true,\"message\":\"成功\"}', 142, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:52:58', 1, '2018-09-14 10:52:58', NULL, b'0');
INSERT INTO `sys_log` VALUES (580, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '\"admin/system/menu/test\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:53:00', 1, '2018-09-14 10:53:00', NULL, b'0');
INSERT INTO `sys_log` VALUES (581, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '\"admin/system/menu/test\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:53:06', 1, '2018-09-14 10:53:06', NULL, b'0');
INSERT INTO `sys_log` VALUES (582, 'Ajax请求', '保存编辑菜单数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/edit', 'POST', 'com.mysiteforme.admin.controller.system.MenuController.edit', '[{\"bgColor\":\"\",\"delFlag\":false,\"href\":\"\",\"icon\":\"\",\"id\":22,\"isShow\":false,\"name\":\"删除系统菜单\",\"permission\":\"sys:menu:delete\",\"sort\":20}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '{\"success\":true,\"message\":\"成功\"}', 168, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:53:21', 1, '2018-09-14 10:53:21', NULL, b'0');
INSERT INTO `sys_log` VALUES (583, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '\"admin/system/menu/test\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:53:23', 1, '2018-09-14 10:53:23', NULL, b'0');
INSERT INTO `sys_log` VALUES (584, 'Ajax请求', '保存编辑菜单数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/edit', 'POST', 'com.mysiteforme.admin.controller.system.MenuController.edit', '[{\"bgColor\":\"\",\"delFlag\":false,\"href\":\"\",\"icon\":\"\",\"id\":21,\"isShow\":false,\"name\":\"编辑系统菜单\",\"permission\":\"sys:menu:edit\",\"sort\":10}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '{\"success\":true,\"message\":\"成功\"}', 164, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:53:33', 1, '2018-09-14 10:53:33', NULL, b'0');
INSERT INTO `sys_log` VALUES (585, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '\"admin/system/menu/test\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:53:35', 1, '2018-09-14 10:53:35', NULL, b'0');
INSERT INTO `sys_log` VALUES (586, 'Ajax请求', '保存编辑菜单数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/edit', 'POST', 'com.mysiteforme.admin.controller.system.MenuController.edit', '[{\"bgColor\":\"\",\"delFlag\":false,\"href\":\"\",\"icon\":\"\",\"id\":20,\"isShow\":false,\"name\":\"新增系统菜单\",\"permission\":\"sys:menu:add\",\"sort\":0}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '{\"success\":true,\"message\":\"成功\"}', 198, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:53:45', 1, '2018-09-14 10:53:45', NULL, b'0');
INSERT INTO `sys_log` VALUES (587, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.mysiteforme.admin.controller.system.MenuController.list', '[{}]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '\"admin/system/menu/test\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:53:47', 1, '2018-09-14 10:53:47', NULL, b'0');
INSERT INTO `sys_log` VALUES (588, '普通请求', '跳转数据表列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/table/list', 'GET', 'com.mysiteforme.admin.controller.system.TableController.list', '[]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '\"admin/system/table/list\"', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 10:53:57', 1, '2018-09-14 10:53:57', NULL, b'0');
INSERT INTO `sys_log` VALUES (589, '普通请求', '退出系统', '127.0.0.1', '我是管理员', 'http://localhost:8080/systemLogout', 'GET', 'com.mysiteforme.admin.controller.LoginController.logOut', '[]', 'd94f0f47-6678-4023-be6f-38b6f3711a1d', '\"redirect:/login\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-14 10:59:23', NULL, '2018-09-14 10:59:23', NULL, b'0');
INSERT INTO `sys_log` VALUES (590, 'Ajax请求', '用户登录', '127.0.0.1', '宋平', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@14f677af\"]', '2c9515db-6d7f-4834-a70b-92271dfe42ac', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 93, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-14 10:59:41', 2, '2018-09-14 10:59:41', NULL, b'0');
INSERT INTO `sys_log` VALUES (591, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '2c9515db-6d7f-4834-a70b-92271dfe42ac', '\"/admin/blogArticle/list\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-14 10:59:49', 2, '2018-09-14 10:59:49', NULL, b'0');
INSERT INTO `sys_log` VALUES (592, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '2c9515db-6d7f-4834-a70b-92271dfe42ac', '\"/admin/blogArticle/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-14 11:01:56', 2, '2018-09-14 11:01:56', NULL, b'0');
INSERT INTO `sys_log` VALUES (593, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '2c9515db-6d7f-4834-a70b-92271dfe42ac', '\"/admin/blogArticle/list\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-14 11:02:50', 2, '2018-09-14 11:02:50', NULL, b'0');
INSERT INTO `sys_log` VALUES (594, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '2c9515db-6d7f-4834-a70b-92271dfe42ac', '\"/admin/blogArticle/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-14 11:05:11', 2, '2018-09-14 11:05:11', NULL, b'0');
INSERT INTO `sys_log` VALUES (595, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '2c9515db-6d7f-4834-a70b-92271dfe42ac', '\"/admin/blogArticle/list\"', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-14 11:06:56', 2, '2018-09-14 11:06:56', NULL, b'0');
INSERT INTO `sys_log` VALUES (596, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '2c9515db-6d7f-4834-a70b-92271dfe42ac', '\"/admin/blogArticle/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-14 11:11:54', 2, '2018-09-14 11:11:54', NULL, b'0');
INSERT INTO `sys_log` VALUES (597, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '2c9515db-6d7f-4834-a70b-92271dfe42ac', '\"/admin/blogArticle/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-14 11:12:38', 2, '2018-09-14 11:12:38', NULL, b'0');
INSERT INTO `sys_log` VALUES (598, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '2c9515db-6d7f-4834-a70b-92271dfe42ac', '\"/admin/blogArticle/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-14 11:16:44', 2, '2018-09-14 11:16:44', NULL, b'0');
INSERT INTO `sys_log` VALUES (599, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '2c9515db-6d7f-4834-a70b-92271dfe42ac', '\"/admin/blogArticle/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-14 11:17:19', 2, '2018-09-14 11:17:19', NULL, b'0');
INSERT INTO `sys_log` VALUES (600, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '2c9515db-6d7f-4834-a70b-92271dfe42ac', '\"/admin/blogArticle/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-14 11:18:51', 2, '2018-09-14 11:18:51', NULL, b'0');
INSERT INTO `sys_log` VALUES (601, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '2c9515db-6d7f-4834-a70b-92271dfe42ac', '\"/admin/blogArticle/list\"', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-14 11:21:14', 2, '2018-09-14 11:21:14', NULL, b'0');
INSERT INTO `sys_log` VALUES (602, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '2c9515db-6d7f-4834-a70b-92271dfe42ac', '\"/admin/blogArticle/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-14 11:21:42', 2, '2018-09-14 11:21:42', NULL, b'0');
INSERT INTO `sys_log` VALUES (603, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@7e92772e\"]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 450, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 14:39:34', 1, '2018-09-14 14:39:34', NULL, b'0');
INSERT INTO `sys_log` VALUES (604, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '\"/admin/blogArticle/list\"', 7, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 14:39:34', 1, '2018-09-14 14:39:34', NULL, b'0');
INSERT INTO `sys_log` VALUES (605, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '\"admin/system/user/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 14:40:53', 1, '2018-09-14 14:40:53', NULL, b'0');
INSERT INTO `sys_log` VALUES (606, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '\"admin/system/user/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 14:42:17', 1, '2018-09-14 14:42:17', NULL, b'0');
INSERT INTO `sys_log` VALUES (607, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '\"admin/system/user/list\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 14:42:54', 1, '2018-09-14 14:42:54', NULL, b'0');
INSERT INTO `sys_log` VALUES (608, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '\"admin/system/user/list\"', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 14:47:03', 1, '2018-09-14 14:47:03', NULL, b'0');
INSERT INTO `sys_log` VALUES (609, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '\"admin/system/user/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 14:49:21', 1, '2018-09-14 14:49:21', NULL, b'0');
INSERT INTO `sys_log` VALUES (610, 'Ajax请求', '保存新增系统用户数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/add', 'POST', 'com.mysiteforme.admin.controller.system.UserConteroller.add', '[{\"delFlag\":false,\"email\":\"\",\"loginName\":\"admin\",\"menus\":[],\"nickName\":\"admin\",\"roleLists\":[{\"delFlag\":false,\"id\":3}],\"school_code\":\"100001\",\"tel\":\"\"}]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '{\"success\":true,\"message\":\"成功\"}', 307, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 14:49:45', 1, '2018-09-14 14:49:45', NULL, b'0');
INSERT INTO `sys_log` VALUES (611, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '\"admin/system/user/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 14:49:47', 1, '2018-09-14 14:49:47', NULL, b'0');
INSERT INTO `sys_log` VALUES (612, 'Ajax请求', '删除系统用户数据(单个)', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/delete', 'POST', 'com.mysiteforme.admin.controller.system.UserConteroller.delete', '[3]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '{\"success\":true,\"message\":\"成功\"}', 87, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 14:50:18', 1, '2018-09-14 14:50:18', NULL, b'0');
INSERT INTO `sys_log` VALUES (613, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '\"admin/system/user/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 14:50:24', 1, '2018-09-14 14:50:24', NULL, b'0');
INSERT INTO `sys_log` VALUES (614, 'Ajax请求', '删除系统用户数据(单个)', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/delete', 'POST', 'com.mysiteforme.admin.controller.system.UserConteroller.delete', '[3]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '{\"success\":true,\"message\":\"成功\"}', 162, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 14:50:28', 1, '2018-09-14 14:50:28', NULL, b'0');
INSERT INTO `sys_log` VALUES (615, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '\"admin/system/user/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 15:22:15', 1, '2018-09-14 15:22:15', NULL, b'0');
INSERT INTO `sys_log` VALUES (616, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '\"admin/system/user/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 15:23:47', 1, '2018-09-14 15:23:47', NULL, b'0');
INSERT INTO `sys_log` VALUES (617, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '\"admin/system/user/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 15:24:35', 1, '2018-09-14 15:24:35', NULL, b'0');
INSERT INTO `sys_log` VALUES (618, 'Ajax请求', '保存系统用户编辑数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/edit', 'POST', 'com.mysiteforme.admin.controller.system.UserConteroller.edit', '[{\"delFlag\":false,\"email\":\"\",\"id\":2,\"loginName\":\"songping\",\"menus\":[],\"nickName\":\"宋平\",\"roleLists\":[{\"delFlag\":false,\"id\":3}],\"school_code\":\"100002\",\"tel\":\"\"}]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '{\"success\":true,\"message\":\"成功\"}', 121, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 15:25:17', 1, '2018-09-14 15:25:17', NULL, b'0');
INSERT INTO `sys_log` VALUES (619, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '\"admin/system/user/list\"', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 15:25:19', 1, '2018-09-14 15:25:19', NULL, b'0');
INSERT INTO `sys_log` VALUES (620, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '\"admin/system/user/list\"', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 15:26:19', 1, '2018-09-14 15:26:19', NULL, b'0');
INSERT INTO `sys_log` VALUES (621, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '\"admin/system/user/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 15:26:56', 1, '2018-09-14 15:26:56', NULL, b'0');
INSERT INTO `sys_log` VALUES (622, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '\"admin/system/user/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 15:27:39', 1, '2018-09-14 15:27:39', NULL, b'0');
INSERT INTO `sys_log` VALUES (623, '普通请求', '跳转博客内容列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '\"/admin/blogArticle/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 15:28:00', 1, '2018-09-14 15:28:00', NULL, b'0');
INSERT INTO `sys_log` VALUES (624, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '\"admin/system/user/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 15:28:02', 1, '2018-09-14 15:28:02', NULL, b'0');
INSERT INTO `sys_log` VALUES (625, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '\"admin/system/user/list\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 15:28:15', 1, '2018-09-14 15:28:15', NULL, b'0');
INSERT INTO `sys_log` VALUES (626, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '\"admin/system/user/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 15:30:28', 1, '2018-09-14 15:30:28', NULL, b'0');
INSERT INTO `sys_log` VALUES (627, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '\"admin/system/user/list\"', 16, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 15:30:58', 1, '2018-09-14 15:30:58', NULL, b'0');
INSERT INTO `sys_log` VALUES (628, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '\"admin/system/user/list\"', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 15:31:01', 1, '2018-09-14 15:31:01', NULL, b'0');
INSERT INTO `sys_log` VALUES (629, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '\"admin/system/user/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 15:31:03', 1, '2018-09-14 15:31:03', NULL, b'0');
INSERT INTO `sys_log` VALUES (630, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '\"admin/system/user/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 15:37:00', 1, '2018-09-14 15:37:00', NULL, b'0');
INSERT INTO `sys_log` VALUES (631, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '\"admin/system/user/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 15:37:53', 1, '2018-09-14 15:37:53', NULL, b'0');
INSERT INTO `sys_log` VALUES (632, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '\"admin/system/user/list\"', 117, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 15:40:15', 1, '2018-09-14 15:40:15', NULL, b'0');
INSERT INTO `sys_log` VALUES (633, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '\"admin/system/user/list\"', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 15:45:04', 1, '2018-09-14 15:45:04', NULL, b'0');
INSERT INTO `sys_log` VALUES (634, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '\"admin/system/user/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 15:50:24', 1, '2018-09-14 15:50:24', NULL, b'0');
INSERT INTO `sys_log` VALUES (635, 'Ajax请求', '保存系统用户编辑数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/edit', 'POST', 'com.mysiteforme.admin.controller.system.UserConteroller.edit', '[{\"delFlag\":false,\"email\":\"b@qq.com\",\"id\":1,\"loginName\":\"test\",\"menus\":[],\"nickName\":\"我是管理员\",\"roleLists\":[{\"delFlag\":false,\"id\":2},{\"delFlag\":false,\"id\":3}],\"school_code\":\"\",\"tel\":\"13776055179\"}]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '{\"success\":true,\"message\":\"成功\"}', 143, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 15:50:33', 1, '2018-09-14 15:50:33', NULL, b'0');
INSERT INTO `sys_log` VALUES (636, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '\"admin/system/user/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 15:50:35', 1, '2018-09-14 15:50:35', NULL, b'0');
INSERT INTO `sys_log` VALUES (637, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '\"admin/system/user/list\"', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 16:01:40', 1, '2018-09-14 16:01:40', NULL, b'0');
INSERT INTO `sys_log` VALUES (638, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '\"admin/system/user/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 16:05:07', 1, '2018-09-14 16:05:07', NULL, b'0');
INSERT INTO `sys_log` VALUES (639, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '\"admin/system/user/list\"', 1, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 16:06:12', 1, '2018-09-14 16:06:12', NULL, b'0');
INSERT INTO `sys_log` VALUES (640, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '\"admin/system/user/list\"', 13, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 16:07:55', 1, '2018-09-14 16:07:55', NULL, b'0');
INSERT INTO `sys_log` VALUES (641, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '\"admin/system/user/list\"', 18, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 16:14:22', 1, '2018-09-14 16:14:22', NULL, b'0');
INSERT INTO `sys_log` VALUES (642, 'Ajax请求', '保存系统用户编辑数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/edit', 'POST', 'com.mysiteforme.admin.controller.system.UserConteroller.edit', '[{\"delFlag\":false,\"email\":\"b@qq.com\",\"id\":1,\"loginName\":\"test\",\"menus\":[],\"nickName\":\"我是管理员\",\"roleLists\":[{\"delFlag\":false,\"id\":2}],\"school_code\":\"\",\"tel\":\"13776055179\"}]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '{\"success\":true,\"message\":\"成功\"}', 166, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 16:14:31', 1, '2018-09-14 16:14:31', NULL, b'0');
INSERT INTO `sys_log` VALUES (643, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '\"admin/system/user/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 16:14:33', 1, '2018-09-14 16:14:33', NULL, b'0');
INSERT INTO `sys_log` VALUES (644, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.mysiteforme.admin.controller.system.UserConteroller.list', '[]', 'e7babba0-3c70-47c8-9117-bef7e81b772d', '\"admin/system/user/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-14 16:14:56', 1, '2018-09-14 16:14:56', NULL, b'0');
INSERT INTO `sys_log` VALUES (645, 'Ajax请求', '用户登录', '127.0.0.1', '宋平', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@2cdfc1ed\"]', 'b613c09c-9c0b-4b07-9e32-6111655530d2', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 608, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-15 19:16:59', 2, '2018-09-15 19:16:59', NULL, b'0');
INSERT INTO `sys_log` VALUES (646, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'b613c09c-9c0b-4b07-9e32-6111655530d2', '\"/admin/blogArticle/list\"', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-15 19:17:02', 2, '2018-09-15 19:17:02', NULL, b'0');
INSERT INTO `sys_log` VALUES (647, '普通请求', '富文本编辑器文件上传', '127.0.0.1', '宋平', 'http://localhost:8080/file/uploadWang', 'POST', 'com.mysiteforme.admin.controller.system.FileController.uploadWang', '\"请求参数数据过长不与显示\"', 'b613c09c-9c0b-4b07-9e32-6111655530d2', '{\"errno\":0,\"data\":[\"http://192.168.137.1:8080/static/upload/35979644-9706-497e-bb20-da4f67a3a900.png\"]}', 62, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-15 19:17:33', 2, '2018-09-15 19:17:33', NULL, b'0');
INSERT INTO `sys_log` VALUES (648, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'b613c09c-9c0b-4b07-9e32-6111655530d2', '\"/admin/blogArticle/list\"', 4, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-15 19:17:48', 2, '2018-09-15 19:17:48', NULL, b'0');
INSERT INTO `sys_log` VALUES (649, 'Ajax请求', '富文本编辑器内容图片上传', '127.0.0.1', '宋平', 'http://localhost:8080/file/doContent/', 'POST', 'com.mysiteforme.admin.controller.system.FileController.doContent', '[\"<html>\\r\\n<body>\\r\\n<p style=\\\"margin: 0px 0px 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\\\\\534E文细黑&quot;, SimSun, &quot;\\\\\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: 1px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\\\">十年前，中国汶川特大地震后，应俄罗斯政府邀请，996名灾区中小学生前往“海洋”全俄儿童中心疗养，受到精心照料。十年后，他们中的代表重返“海洋”，踏上感恩之旅。</p><div style=\\\"margin: 0px; padding: 0px; text-align: center; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\\\\\534E文细黑&quot;, SimSun, &quot;\\\\\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: 1px; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\\\"><img src=\\\"http://n.sinaimg.cn/news/transform/59/w550h309/20180915/7Pjs-hkahyhx2240093.jpg\\\" alt=\\\"\\\" data-mcesrc=\\\"https://img-xhpfm.zhongguowangshi.com/News/201809/UID20180914230600807196.jpg@640w_1e_1c_80Q_1x.jpg\\\" data-mceselected=\\\"1\\\" data-link=\\\"\\\" style=\\\"margin: 0px auto; padding: 0px; border: 0px none; vertical-align: top; display: block; max-width: 640px;\\\"><span style=\\\"margin: 5px auto; padding: 6px 0px; line-height: 20px; font-size: 16px; display: inline-block; zoom: 1; text-align: left; font-weight: 700;\\\"></span></div><p style=\\\"margin: 0px 0px 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\\\\\534E文细黑&quot;, SimSun, &quot;\\\\\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: 1px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\\\">　　习主席对孩子们说：“中国有句话，‘滴水之恩，当涌泉相报’，而这里是‘海洋’，你们要以无限的爱回报俄罗斯人民，回报自己的祖国。</p>\\r\\n</body>\\r\\n\",\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@35b9ec52\"]', 'b613c09c-9c0b-4b07-9e32-6111655530d2', '{\"data\":\"  \\n <p style=\\\"margin: 0px 0px 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\\\\\534E文细黑&quot;, SimSun, &quot;\\\\\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: 1px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\\\">十年前，中国汶川特大地震后，应俄罗斯政府邀请，996名灾区中小学生前往“海洋”全俄儿童中心疗养，受到精心照料。十年后，他们中的代表重返“海洋”，踏上感恩之旅。</p>\\n <div style=\\\"margin: 0px; padding: 0px; text-align: center; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\\\\\534E文细黑&quot;, SimSun, &quot;\\\\\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: 1px; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\\\">\\n  <img src=\\\"http://192.168.137.1:8080/static/upload/5478861c-9d9f-4ba8-a15e-cf94dd772013.jpg\\\" alt=\\\"\\\" data-mcesrc=\\\"https://img-xhpfm.zhongguowangshi.com/News/201809/UID20180914230600807196.jpg@640w_1e_1c_80Q_1x.jpg\\\" data-mceselected=\\\"1\\\" data-link=\\\"\\\" style=\\\"margin: 0px auto; padding: 0px; border: 0px none; vertical-align: top; display: block; max-width: 640px;\\\">\\n  <span style=\\\"margin: 5px auto; padding: 6px 0px; line-height: 20px; font-size: 16px; display: inline-block; zoom: 1; text-align: left; font-weight: 700;\\\"></span>\\n </div>\\n <p style=\\\"margin: 0px 0px 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\\\\\534E文细黑&quot;, SimSun, &quot;\\\\\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: 1px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\\\">　　习主席对孩子们说：“中国有句话，‘滴水之恩，当涌泉相报’，而这里是‘海洋’，你们要以无限的爱回报俄罗斯人民，回报自己的祖国。</p>  \\n\",\"success\":true,\"message\":\"成功\"}', 195, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-15 19:21:26', 2, '2018-09-15 19:21:26', NULL, b'0');
INSERT INTO `sys_log` VALUES (650, 'Ajax请求', '保存编辑博客内容数据', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/edit', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.edit', '\"请求参数数据过长不与显示\"', 'b613c09c-9c0b-4b07-9e32-6111655530d2', '{\"success\":true,\"message\":\"成功\"}', 181, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-15 19:23:54', 2, '2018-09-15 19:23:54', NULL, b'0');
INSERT INTO `sys_log` VALUES (651, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'b613c09c-9c0b-4b07-9e32-6111655530d2', '\"/admin/blogArticle/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-15 19:28:13', 2, '2018-09-15 19:28:13', NULL, b'0');
INSERT INTO `sys_log` VALUES (652, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'b613c09c-9c0b-4b07-9e32-6111655530d2', '\"/admin/blogArticle/list\"', 6, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-15 19:28:53', 2, '2018-09-15 19:28:53', NULL, b'0');
INSERT INTO `sys_log` VALUES (653, 'Ajax请求', '保存编辑博客内容数据', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/edit', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.edit', '\"请求参数数据过长不与显示\"', 'b613c09c-9c0b-4b07-9e32-6111655530d2', '{\"success\":true,\"message\":\"成功\"}', 173, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-15 19:30:01', 2, '2018-09-15 19:30:01', NULL, b'0');
INSERT INTO `sys_log` VALUES (654, 'Ajax请求', '保存编辑博客内容数据', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/edit', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.edit', '\"请求参数数据过长不与显示\"', 'b613c09c-9c0b-4b07-9e32-6111655530d2', '{\"success\":true,\"message\":\"成功\"}', 151, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-15 19:31:41', 2, '2018-09-15 19:31:41', NULL, b'0');
INSERT INTO `sys_log` VALUES (655, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'b613c09c-9c0b-4b07-9e32-6111655530d2', '\"/admin/blogArticle/list\"', 3, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-15 19:34:51', 2, '2018-09-15 19:34:51', NULL, b'0');
INSERT INTO `sys_log` VALUES (656, 'Ajax请求', '保存编辑博客内容数据', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/edit', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.edit', '\"请求参数数据过长不与显示\"', 'b613c09c-9c0b-4b07-9e32-6111655530d2', '{\"success\":true,\"message\":\"成功\"}', 167, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-15 19:35:52', 2, '2018-09-15 19:35:52', NULL, b'0');
INSERT INTO `sys_log` VALUES (657, 'Ajax请求', '保存编辑博客内容数据', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/edit', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.edit', '\"请求参数数据过长不与显示\"', 'b613c09c-9c0b-4b07-9e32-6111655530d2', '{\"success\":true,\"message\":\"成功\"}', 243, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-15 19:36:09', 2, '2018-09-15 19:36:09', NULL, b'0');
INSERT INTO `sys_log` VALUES (658, 'Ajax请求', '保存编辑博客内容数据', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/edit', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.edit', '\"请求参数数据过长不与显示\"', 'b613c09c-9c0b-4b07-9e32-6111655530d2', '{\"success\":true,\"message\":\"成功\"}', 472, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-15 19:37:03', 2, '2018-09-15 19:37:03', NULL, b'0');
INSERT INTO `sys_log` VALUES (659, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'b613c09c-9c0b-4b07-9e32-6111655530d2', '\"/admin/blogArticle/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-15 19:38:20', 2, '2018-09-15 19:38:20', NULL, b'0');
INSERT INTO `sys_log` VALUES (660, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'b613c09c-9c0b-4b07-9e32-6111655530d2', '\"/admin/blogArticle/list\"', 2, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-15 19:42:11', 2, '2018-09-15 19:42:11', NULL, b'0');
INSERT INTO `sys_log` VALUES (661, 'Ajax请求', '保存编辑博客内容数据', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/edit', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.edit', '\"请求参数数据过长不与显示\"', 'b613c09c-9c0b-4b07-9e32-6111655530d2', '{\"success\":true,\"message\":\"成功\"}', 213, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-15 19:43:01', 2, '2018-09-15 19:43:01', NULL, b'0');
INSERT INTO `sys_log` VALUES (662, 'Ajax请求', '保存编辑博客内容数据', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/edit', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.edit', '\"请求参数数据过长不与显示\"', 'b613c09c-9c0b-4b07-9e32-6111655530d2', '{\"success\":true,\"message\":\"成功\"}', 126, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-15 19:50:41', 2, '2018-09-15 19:50:41', NULL, b'0');
INSERT INTO `sys_log` VALUES (663, 'Ajax请求', '用户登录', '192.168.2.35', '宋平', 'http://192.168.2.214:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@41aa2ee2\"]', '62ca8dc7-c9af-4174-b631-d24e7e124fca', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 982, 'Windows-Chrome-57.0.2987.98', '未知', '未知', '未知', '未知', NULL, '2', '2018-09-16 14:37:53', 2, '2018-09-16 14:37:53', NULL, b'0');
INSERT INTO `sys_log` VALUES (664, '普通请求', '跳转博客内容列表', '192.168.2.35', '宋平', 'http://192.168.2.214:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '62ca8dc7-c9af-4174-b631-d24e7e124fca', '\"/admin/blogArticle/list\"', 278, 'Windows-Chrome-57.0.2987.98', '未知', '未知', '未知', '未知', NULL, '2', '2018-09-16 14:38:18', 2, '2018-09-16 14:38:18', NULL, b'0');
INSERT INTO `sys_log` VALUES (665, '普通请求', '跳转博客内容列表', '192.168.2.35', '宋平', 'http://192.168.2.214:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '62ca8dc7-c9af-4174-b631-d24e7e124fca', '\"/admin/blogArticle/list\"', 295, 'Windows-Chrome-57.0.2987.98', '未知', '未知', '未知', '未知', NULL, '2', '2018-09-16 14:59:12', 2, '2018-09-16 14:59:12', NULL, b'0');
INSERT INTO `sys_log` VALUES (666, '普通请求', '跳转博客内容列表', '192.168.2.35', '宋平', 'http://192.168.2.214:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '62ca8dc7-c9af-4174-b631-d24e7e124fca', '\"/admin/blogArticle/list\"', 267, 'Windows-Chrome-57.0.2987.98', '未知', '未知', '未知', '未知', NULL, '2', '2018-09-16 15:00:06', 2, '2018-09-16 15:00:06', NULL, b'0');
INSERT INTO `sys_log` VALUES (667, 'Ajax请求', '删除博客内容数据', '192.168.2.35', '宋平', 'http://192.168.2.214:8080/admin/blogArticle/delete', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.delete', '[2]', '62ca8dc7-c9af-4174-b631-d24e7e124fca', '{\"success\":true,\"message\":\"成功\"}', 502, 'Windows-Chrome-57.0.2987.98', '未知', '未知', '未知', '未知', NULL, '2', '2018-09-16 15:00:22', 2, '2018-09-16 15:00:22', NULL, b'0');
INSERT INTO `sys_log` VALUES (668, '普通请求', '跳转博客内容列表', '192.168.2.35', '宋平', 'http://192.168.2.214:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '62ca8dc7-c9af-4174-b631-d24e7e124fca', '\"/admin/blogArticle/list\"', 372, 'Windows-Chrome-57.0.2987.98', '未知', '未知', '未知', '未知', NULL, '2', '2018-09-16 15:00:24', 2, '2018-09-16 15:00:24', NULL, b'0');
INSERT INTO `sys_log` VALUES (669, 'Ajax请求', '保存编辑博客内容数据', '192.168.2.35', '宋平', 'http://192.168.2.214:8080/admin/blogArticle/edit', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.edit', '[{\"category\":\"1\",\"channelId\":22,\"content\":\"<p style=\'-webkit-tap-highlight-color: transparent; margin-top: 16px; margin-bottom: 16px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; font-size: 16px; background-color: rgb(255, 255, 255);\'><span style=\'-webkit-tap-highlight-color: transparent; font-weight: 700;\'>9月12日讯（黄敏 邓传蓉 文/图）</span>为了提高语文课堂教学效率，进一步规范语文教学常规管理，明确本学期教学目标和教研活动安排，9月11日下午，旌阳区德新小学语文教研组召开了新学期的第一次教研活动。此次活动的内容是学习本学期教研组工作计划和小学语文新课程标准，并对上学期的教学工作进行总结和反思。</p><p style=\'-webkit-tap-highlight-color: transparent; margin-top: 16px; margin-bottom: 16px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; font-size: 16px; background-color: rgb(255, 255, 255);\'>首先，语文教研组长黄敏组织全组老师学习了本学期的教研工作计划，对本学期的教研工作进行了详细的安排，各语文教师认真听取并了解了自己的教学教研工作任务。</p><p style=\'-webkit-tap-highlight-color: transparent; margin-top: 16px; margin-bottom: 16px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; font-size: 16px; background-color: rgb(255, 255, 255);\'>然后，全体语文教师再次进行了小学语文新课程标准的学习，对语文教学特点和教学总目标、各年段目标有了更深入的了解，以助推语文教学。</p><p style=\'-webkit-tap-highlight-color: transparent; margin-top: 16px; margin-bottom: 16px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; font-size: 16px; background-color: rgb(255, 255, 255);\'>最后，对上期教学工作进行总结和反思。从学生的实际情况出发，从教学中存在的问题出发，大家展开了激烈的发言和讨论。针对农村留守儿童缺乏家长辅导和督促，课外阅读少积累欠丰富，阅读写作能力有待提高等现状，教师们踊跃发言，各抒己见，相互支招，交流总结经验，思考补救措施。</p><p style=\'-webkit-tap-highlight-color: transparent; margin-top: 16px; margin-bottom: 16px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; font-size: 16px; background-color: rgb(255, 255, 255);\'>以研促教，以学定教，本次活动研讨氛围浓厚，立足实际，放眼学生语文素养的形成和发展。相信在学校领导的大力支持下，通过全体语文老师的努力，德新小学的孩子们会更热爱阅读，更善于阅读，遨游书海，愉悦成长。</p><p><br></p>\",\"delFlag\":false,\"id\":3,\"marks\":\"9月12日讯（黄敏 邓传蓉 文/图）为了提高语文课堂教学效率，进一步规范语文教学常规管理，明确本学期教学目标和教研活动安排，9月11日下午，旌阳区德新小学语文教研组召开了新学期的第一次教研活动\",\"publistTime\":1536710400000,\"recommend\":false,\"resources\":\"\",\"showPic\":\"https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/yantao.jpg\",\"sort\":2,\"subTitle\":\"\",\"text\":\"9月12日讯（黄敏 邓传蓉 文/图）为了提高语文课堂教学效率，进一步规范语文教学常规管理，明确本学期教学目标和教研活动安排，9月11日下午，旌阳区德新小学语文教研组召开了新学期的第一次教研活动。此次活动的内容是学习本学期教研组工作计划和小学语文新课程标准，并对上学期的教学工作进行总结和反思。首先，语文教研组长黄敏组织全组老师学习了本学期的教研工作计划，对本学期的教研工作进行了详细的安排，各语文教师认真听取并了解了自己的教学教研工作任务。然后，全体语文教师再次进行了小学语文新课程标准的学习，对语文教学特点和教学总目标、各年段目标有了更深入的了解，以助推语文教学。最后，对上期教学工作进行总结和反思。从学生的实际情况出发，从教学中存在的问题出发，大家展开了激烈的发言和讨论。针对农村留守儿童缺乏家长辅导和督促，课外阅读少积累欠丰富，阅读写作能力有待提高等现状，教师们踊跃发言，各抒己见，相互支招，交流总结经验，思考补救措施。以研促教，以学定教，本次活动研讨氛围浓厚，立足实际，放眼学生语文素养的形成和发展。相信在学校领导的大力支持下，通过全体语文老师的努力，德新小学的孩子们会更热爱阅读，更善于阅读，遨游书海，愉悦成长。\",\"title\":\"旌阳区德新小学语文研讨会：以研促教 以学定教\",\"top\":false}]', '62ca8dc7-c9af-4174-b631-d24e7e124fca', '{\"success\":true,\"message\":\"成功\"}', 684, 'Windows-Chrome-57.0.2987.98', '未知', '未知', '未知', '未知', NULL, '2', '2018-09-16 15:01:32', 2, '2018-09-16 15:01:32', NULL, b'0');
INSERT INTO `sys_log` VALUES (670, '普通请求', '跳转博客内容列表', '192.168.2.35', '宋平', 'http://192.168.2.214:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '62ca8dc7-c9af-4174-b631-d24e7e124fca', '\"/admin/blogArticle/list\"', 340, 'Windows-Chrome-57.0.2987.98', '未知', '未知', '未知', '未知', NULL, '2', '2018-09-16 15:01:51', 2, '2018-09-16 15:01:51', NULL, b'0');
INSERT INTO `sys_log` VALUES (671, 'Ajax请求', '保存编辑博客内容数据', '192.168.2.35', '宋平', 'http://192.168.2.214:8080/admin/blogArticle/edit', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.edit', '[{\"category\":\"1\",\"channelId\":22,\"content\":\"<p style=\'padding-top: 3px; padding-bottom: 3px; font-family: &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255); line-height: 30px; text-indent: 2em; font-size: 16px;\'><strong>11月6日讯（宋平 邓传蓉 文/图）</strong>11月6日上午，在旌阳区教科所美术教研员冯伟杰的带领下，市区美术教师辜小平、侯德晖、王开琴、刘进川等一行人到德新小学分部进行青蓝工程的听课活动，德新小学美术教师宋平老师上了一堂《自行车局部写生》的户外写生课。</p><p style=\'padding-top: 3px; padding-bottom: 3px; font-family: &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255); line-height: 30px; text-indent: 2em; font-size: 16px;\'>在绿树环绕的教学楼前，宋平老师先让学生观察现实中的自行车，再对学生们讲解自行车的结构，然后教同学们如何运用灵活多变的线条，进行自行车局部写生创作。同学们在轻松愉快的环境中完成了本堂课的任务。</p><p style=\'padding-top: 3px; padding-bottom: 3px; font-family: &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255); line-height: 30px; text-indent: 2em; font-size: 16px;\'>课后，听课的老师们都作出了高度评价，说作为农村小学能达到这种水平非常棒，肯定了学生的基本功很牢固。冯伟杰和侯德晖老师说，将课堂搬到户外这种形式非常好，学生都非常开心，课堂氛围活跃，课程结构非常完整，每个教学环节的设计有新意。美术特级教师辜小平老师除了对本堂课进行点评，还着重讲了青年美术教师应该如何规划自己的教学生涯，让美术教师拥有成就感，成就感来源于学生的作品和教师的作品，主张将小学每个角落拥有学生的作品。</p><p style=\'padding-top: 3px; padding-bottom: 3px; font-family: &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255); line-height: 30px; text-indent: 2em; font-size: 16px;\'>当然也提出了很多宝贵的意见，王开琴老师指出，在学生创作时应让学生动起来，学生自己去选择喜欢的自行车局部。辜小平老师说，学生在局部写生创作时应延伸到每个小的细节，将局部画得更精细，学生构图上应注意画面的饱满，空白地方的处理等。与会老师指出，青年美术教师应让自身的基本功变得更扎实，平时要多画，多练，多参加展览，提升自身素质。</p><p style=\'padding-top: 3px; padding-bottom: 3px; font-family: &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255); line-height: 30px; text-indent: 2em; font-size: 16px;\'>本次美术“青蓝工程”教学研讨活动，专家指导，名师引领，让与会教师受益匪浅，促进了青年教师的快速成长。</p><p><br></p>\",\"delFlag\":false,\"id\":5,\"marks\":\"11月6日讯（宋平 邓传蓉 文/图）11月6日上午，在旌阳区教科所美术教研员冯伟杰的带领下，市区美术教师辜小平、侯德晖、王开琴、刘进川等一行人到德新小学分部进行青蓝工程的听课活动，德新小学美术教师宋平老师上了一堂《自行车局部写生》的户外写生课\",\"publistTime\":1536710400000,\"recommend\":false,\"resources\":\"\",\"showPic\":\"https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/1509956267552.jpg\",\"sort\":0,\"subTitle\":\"\",\"text\":\"11月6日讯（宋平 邓传蓉 文/图）11月6日上午，在旌阳区教科所美术教研员冯伟杰的带领下，市区美术教师辜小平、侯德晖、王开琴、刘进川等一行人到德新小学分部进行青蓝工程的听课活动，德新小学美术教师宋平老师上了一堂《自行车局部写生》的户外写生课。在绿树环绕的教学楼前，宋平老师先让学生观察现实中的自行车，再对学生们讲解自行车的结构，然后教同学们如何运用灵活多变的线条，进行自行车局部写生创作。同学们在轻松愉快的环境中完成了本堂课的任务。课后，听课的老师们都作出了高度评价，说作为农村小学能达到这种水平非常棒，肯定了学生的基本功很牢固。冯伟杰和侯德晖老师说，将课堂搬到户外这种形式非常好，学生都非常开心，课堂氛围活跃，课程结构非常完整，每个教学环节的设计有新意。美术特级教师辜小平老师除了对本堂课进行点评，还着重讲了青年美术教师应该如何规划自己的教学生涯，让美术教师拥有成就感，成就感来源于学生的作品和教师的作品，主张将小学每个角落拥有学生的作品。当然也提出了很多宝贵的意见，王开琴老师指出，在学生创作时应让学生动起来，学生自己去选择喜欢的自行车局部。辜小平老师说，学生在局部写生创作时应延伸到每个小的细节，将局部画得更精细，学生构图上应注意画面的饱满，空白地方的处理等。与会老师指出，青年美术教师应让自身的基本功变得更扎实，平时要多画，多练，多参加展览，提升自身素质。本次美术“青蓝工程”教学研讨活动，专家指导，名师引领，让与会教师受益匪浅，促进了青年教师的快速成长。\",\"title\":\"旌阳区美术“青蓝工程”教学研讨活动在德新小学开展\",\"top\":false}]', '62ca8dc7-c9af-4174-b631-d24e7e124fca', '{\"success\":true,\"message\":\"成功\"}', 1046, 'Windows-Chrome-57.0.2987.98', '未知', '未知', '未知', '未知', NULL, '2', '2018-09-16 15:02:41', 2, '2018-09-16 15:02:41', NULL, b'0');
INSERT INTO `sys_log` VALUES (672, '普通请求', '跳转博客内容列表', '192.168.2.35', '宋平', 'http://192.168.2.214:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '62ca8dc7-c9af-4174-b631-d24e7e124fca', '\"/admin/blogArticle/list\"', 377, 'Windows-Chrome-57.0.2987.98', '未知', '未知', '未知', '未知', NULL, '2', '2018-09-16 15:02:50', 2, '2018-09-16 15:02:50', NULL, b'0');
INSERT INTO `sys_log` VALUES (673, '普通请求', '跳转博客内容列表', '192.168.2.35', '宋平', 'http://192.168.2.214:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '62ca8dc7-c9af-4174-b631-d24e7e124fca', '\"/admin/blogArticle/list\"', 385, 'Windows-Chrome-57.0.2987.98', '未知', '未知', '未知', '未知', NULL, '2', '2018-09-16 15:04:24', 2, '2018-09-16 15:04:24', NULL, b'0');
INSERT INTO `sys_log` VALUES (674, 'Ajax请求', '保存编辑博客内容数据', '192.168.2.35', '宋平', 'http://192.168.2.214:8080/admin/blogArticle/edit', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.edit', '[{\"category\":\"1\",\"channelId\":22,\"content\":\"<p><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/tp1.jpg\' style=\'max-width:100%;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/tp2.jpg\' style=\'max-width: 100%;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/tp3.jpg\' style=\'max-width: 100%;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/tp4.jpg\' style=\'max-width: 100%;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/tp5.jpg\' style=\'max-width: 100%;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/tp6.jpg\' style=\'max-width: 100%;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/tp7.jpg\' style=\'max-width: 100%;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/tp8.jpg\' style=\'max-width: 100%;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/tp9.jpg\' style=\'max-width: 100%;\'>&nbsp;<br></p><p><br></p>\",\"delFlag\":false,\"id\":1,\"marks\":\"旌阳区中小学生艺术节开幕啦！快来为孩子们点赞\",\"publistTime\":1536710400000,\"recommend\":false,\"resources\":\"\",\"showPic\":\"https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/tpimg.jpg\",\"sort\":4,\"subTitle\":\"\",\"text\":\"&nbsp;\",\"title\":\"旌阳区中小学生艺术节开幕啦！快来为孩子们点赞\",\"top\":false}]', '62ca8dc7-c9af-4174-b631-d24e7e124fca', '{\"success\":true,\"message\":\"成功\"}', 545, 'Windows-Chrome-57.0.2987.98', '未知', '未知', '未知', '未知', NULL, '2', '2018-09-16 15:05:15', 2, '2018-09-16 15:05:15', NULL, b'0');
INSERT INTO `sys_log` VALUES (675, '普通请求', '跳转博客内容列表', '192.168.2.35', '宋平', 'http://192.168.2.214:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '62ca8dc7-c9af-4174-b631-d24e7e124fca', '\"/admin/blogArticle/list\"', 280, 'Windows-Chrome-57.0.2987.98', '未知', '未知', '未知', '未知', NULL, '2', '2018-09-16 15:05:25', 2, '2018-09-16 15:05:25', NULL, b'0');
INSERT INTO `sys_log` VALUES (676, '普通请求', '跳转博客内容列表', '192.168.2.35', '宋平', 'http://192.168.2.214:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '62ca8dc7-c9af-4174-b631-d24e7e124fca', '\"/admin/blogArticle/list\"', 405, 'Windows-Chrome-57.0.2987.98', '未知', '未知', '未知', '未知', NULL, '2', '2018-09-16 15:05:33', 2, '2018-09-16 15:05:33', NULL, b'0');
INSERT INTO `sys_log` VALUES (677, 'Ajax请求', '删除博客内容数据', '192.168.2.35', '宋平', 'http://192.168.2.214:8080/admin/blogArticle/delete', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.delete', '[3]', '62ca8dc7-c9af-4174-b631-d24e7e124fca', '{\"success\":true,\"message\":\"成功\"}', 460, 'Windows-Chrome-57.0.2987.98', '未知', '未知', '未知', '未知', NULL, '2', '2018-09-16 15:05:43', 2, '2018-09-16 15:05:43', NULL, b'0');
INSERT INTO `sys_log` VALUES (678, '普通请求', '跳转博客内容列表', '192.168.2.35', '宋平', 'http://192.168.2.214:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '62ca8dc7-c9af-4174-b631-d24e7e124fca', '\"/admin/blogArticle/list\"', 280, 'Windows-Chrome-57.0.2987.98', '未知', '未知', '未知', '未知', NULL, '2', '2018-09-16 15:05:44', 2, '2018-09-16 15:05:44', NULL, b'0');
INSERT INTO `sys_log` VALUES (679, '普通请求', '跳转博客内容列表', '192.168.2.35', '宋平', 'http://192.168.2.214:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '62ca8dc7-c9af-4174-b631-d24e7e124fca', '\"/admin/blogArticle/list\"', 272, 'Windows-Chrome-57.0.2987.98', '未知', '未知', '未知', '未知', NULL, '2', '2018-09-16 15:05:52', 2, '2018-09-16 15:05:52', NULL, b'0');
INSERT INTO `sys_log` VALUES (680, 'Ajax请求', '删除博客内容数据', '192.168.2.35', '宋平', 'http://192.168.2.214:8080/admin/blogArticle/delete', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.delete', '[4]', '62ca8dc7-c9af-4174-b631-d24e7e124fca', '{\"success\":true,\"message\":\"成功\"}', 454, 'Windows-Chrome-57.0.2987.98', '未知', '未知', '未知', '未知', NULL, '2', '2018-09-16 15:05:57', 2, '2018-09-16 15:05:57', NULL, b'0');
INSERT INTO `sys_log` VALUES (681, '普通请求', '跳转博客内容列表', '192.168.2.35', '宋平', 'http://192.168.2.214:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '62ca8dc7-c9af-4174-b631-d24e7e124fca', '\"/admin/blogArticle/list\"', 316, 'Windows-Chrome-57.0.2987.98', '未知', '未知', '未知', '未知', NULL, '2', '2018-09-16 15:05:59', 2, '2018-09-16 15:05:59', NULL, b'0');
INSERT INTO `sys_log` VALUES (682, 'Ajax请求', '删除博客内容数据', '192.168.2.35', '宋平', 'http://192.168.2.214:8080/admin/blogArticle/delete', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.delete', '[5]', '62ca8dc7-c9af-4174-b631-d24e7e124fca', '{\"success\":true,\"message\":\"成功\"}', 445, 'Windows-Chrome-57.0.2987.98', '未知', '未知', '未知', '未知', NULL, '2', '2018-09-16 15:06:04', 2, '2018-09-16 15:06:04', NULL, b'0');
INSERT INTO `sys_log` VALUES (683, '普通请求', '跳转博客内容列表', '192.168.2.35', '宋平', 'http://192.168.2.214:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '62ca8dc7-c9af-4174-b631-d24e7e124fca', '\"/admin/blogArticle/list\"', 251, 'Windows-Chrome-57.0.2987.98', '未知', '未知', '未知', '未知', NULL, '2', '2018-09-16 15:06:05', 2, '2018-09-16 15:06:05', NULL, b'0');
INSERT INTO `sys_log` VALUES (684, 'Ajax请求', '保存新增博客内容数据', '192.168.2.35', '宋平', 'http://192.168.2.214:8080/admin/blogArticle/add', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.add', '\"请求参数数据过长不与显示\"', '62ca8dc7-c9af-4174-b631-d24e7e124fca', '{\"success\":true,\"message\":\"成功\"}', 1025, 'Windows-Chrome-57.0.2987.98', '未知', '未知', '未知', '未知', NULL, '2', '2018-09-16 15:20:33', 2, '2018-09-16 15:20:33', NULL, b'0');
INSERT INTO `sys_log` VALUES (685, '普通请求', '跳转博客内容列表', '192.168.2.35', '宋平', 'http://192.168.2.214:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '62ca8dc7-c9af-4174-b631-d24e7e124fca', '\"/admin/blogArticle/list\"', 395, 'Windows-Chrome-57.0.2987.98', '未知', '未知', '未知', '未知', NULL, '2', '2018-09-16 15:20:35', 2, '2018-09-16 15:20:35', NULL, b'0');
INSERT INTO `sys_log` VALUES (686, '普通请求', '跳转博客内容列表', '192.168.2.35', '宋平', 'http://192.168.2.214:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '62ca8dc7-c9af-4174-b631-d24e7e124fca', '\"/admin/blogArticle/list\"', 286, 'Windows-Chrome-57.0.2987.98', '未知', '未知', '未知', '未知', NULL, '2', '2018-09-16 15:22:28', 2, '2018-09-16 15:22:28', NULL, b'0');
INSERT INTO `sys_log` VALUES (687, '普通请求', '跳转博客内容列表', '192.168.2.35', '宋平', 'http://192.168.2.214:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '62ca8dc7-c9af-4174-b631-d24e7e124fca', '\"/admin/blogArticle/list\"', 248, 'Windows-Chrome-57.0.2987.98', '未知', '未知', '未知', '未知', NULL, '2', '2018-09-16 15:24:00', 2, '2018-09-16 15:24:00', NULL, b'0');
INSERT INTO `sys_log` VALUES (688, '普通请求', '跳转博客内容列表', '192.168.2.35', '宋平', 'http://192.168.2.214:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '62ca8dc7-c9af-4174-b631-d24e7e124fca', '\"/admin/blogArticle/list\"', 316, 'Windows-Chrome-57.0.2987.98', '未知', '未知', '未知', '未知', NULL, '2', '2018-09-16 15:24:07', 2, '2018-09-16 15:24:07', NULL, b'0');
INSERT INTO `sys_log` VALUES (689, 'Ajax请求', '删除博客内容数据', '192.168.2.35', '宋平', 'http://192.168.2.214:8080/admin/blogArticle/delete', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.delete', '[10]', '62ca8dc7-c9af-4174-b631-d24e7e124fca', '{\"success\":true,\"message\":\"成功\"}', 1371, 'Windows-Chrome-57.0.2987.98', '未知', '未知', '未知', '未知', NULL, '2', '2018-09-16 15:24:35', 2, '2018-09-16 15:24:35', NULL, b'0');
INSERT INTO `sys_log` VALUES (690, '普通请求', '跳转博客内容列表', '192.168.2.35', '宋平', 'http://192.168.2.214:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', '62ca8dc7-c9af-4174-b631-d24e7e124fca', '\"/admin/blogArticle/list\"', 256, 'Windows-Chrome-57.0.2987.98', '未知', '未知', '未知', '未知', NULL, '2', '2018-09-16 15:24:37', 2, '2018-09-16 15:24:37', NULL, b'0');
INSERT INTO `sys_log` VALUES (691, 'Ajax请求', '用户登录', '127.0.0.1', '宋平', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@59919737\"]', 'c9fc0266-a44a-4618-8b1b-c5c8b1324f7f', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 19, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-16 15:29:59', 2, '2018-09-16 15:29:59', NULL, b'0');
INSERT INTO `sys_log` VALUES (692, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'c9fc0266-a44a-4618-8b1b-c5c8b1324f7f', '\"/admin/blogArticle/list\"', 13, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-16 15:30:03', 2, '2018-09-16 15:30:03', NULL, b'0');
INSERT INTO `sys_log` VALUES (693, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'c9fc0266-a44a-4618-8b1b-c5c8b1324f7f', '\"/admin/blogArticle/list\"', 18, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-16 15:33:52', 2, '2018-09-16 15:33:52', NULL, b'0');
INSERT INTO `sys_log` VALUES (694, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'c9fc0266-a44a-4618-8b1b-c5c8b1324f7f', '\"/admin/blogArticle/list\"', 16, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-16 15:37:11', 2, '2018-09-16 15:37:11', NULL, b'0');
INSERT INTO `sys_log` VALUES (695, 'Ajax请求', '保存新增博客内容数据', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/add', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.add', '[{\"category\":\"1\",\"channelId\":22,\"content\":\"<p>test</p>\",\"delFlag\":false,\"marks\":\"\",\"publistTime\":1537056000000,\"recommend\":false,\"resources\":\"\",\"showPic\":\"\",\"subTitle\":\"\",\"text\":\"test\",\"title\":\"test\",\"top\":false}]', 'c9fc0266-a44a-4618-8b1b-c5c8b1324f7f', '{\"success\":true,\"message\":\"成功\"}', 420, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-16 15:37:37', 2, '2018-09-16 15:37:37', NULL, b'0');
INSERT INTO `sys_log` VALUES (696, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'c9fc0266-a44a-4618-8b1b-c5c8b1324f7f', '\"/admin/blogArticle/list\"', 12, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-16 15:37:38', 2, '2018-09-16 15:37:38', NULL, b'0');
INSERT INTO `sys_log` VALUES (697, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'c9fc0266-a44a-4618-8b1b-c5c8b1324f7f', '\"/admin/blogArticle/list\"', 9, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-16 15:37:47', 2, '2018-09-16 15:37:47', NULL, b'0');
INSERT INTO `sys_log` VALUES (698, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'c9fc0266-a44a-4618-8b1b-c5c8b1324f7f', '\"/admin/blogArticle/list\"', 15, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-16 15:37:50', 2, '2018-09-16 15:37:50', NULL, b'0');
INSERT INTO `sys_log` VALUES (699, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'c9fc0266-a44a-4618-8b1b-c5c8b1324f7f', '\"/admin/blogArticle/list\"', 17, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-16 15:38:21', 2, '2018-09-16 15:38:21', NULL, b'0');
INSERT INTO `sys_log` VALUES (700, 'Ajax请求', '删除博客内容数据', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/delete', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.delete', '[11]', 'c9fc0266-a44a-4618-8b1b-c5c8b1324f7f', '{\"success\":true,\"message\":\"成功\"}', 956, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-16 15:38:28', 2, '2018-09-16 15:38:28', NULL, b'0');
INSERT INTO `sys_log` VALUES (701, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'c9fc0266-a44a-4618-8b1b-c5c8b1324f7f', '\"/admin/blogArticle/list\"', 12, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-16 15:38:29', 2, '2018-09-16 15:38:29', NULL, b'0');
INSERT INTO `sys_log` VALUES (702, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'c9fc0266-a44a-4618-8b1b-c5c8b1324f7f', '\"/admin/blogArticle/list\"', 9, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-16 15:39:56', 2, '2018-09-16 15:39:56', NULL, b'0');
INSERT INTO `sys_log` VALUES (703, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'c9fc0266-a44a-4618-8b1b-c5c8b1324f7f', '\"/admin/blogArticle/list\"', 15, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-16 15:40:19', 2, '2018-09-16 15:40:19', NULL, b'0');
INSERT INTO `sys_log` VALUES (704, 'Ajax请求', '用户登录', '127.0.0.1', '宋平', 'http://localhost:8080/login/main', 'POST', 'com.mysiteforme.admin.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@f45d6fb\"]', 'a2201dbb-9b3f-4c3a-ad97-ac7343ce22cc', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 555, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-16 21:52:04', 2, '2018-09-16 21:52:04', NULL, b'0');
INSERT INTO `sys_log` VALUES (705, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'a2201dbb-9b3f-4c3a-ad97-ac7343ce22cc', '\"/admin/blogArticle/list\"', 9, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-16 21:52:06', 2, '2018-09-16 21:52:06', NULL, b'0');
INSERT INTO `sys_log` VALUES (706, 'Ajax请求', '保存新增博客内容数据', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/add', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.add', '[{\"category\":\"1\",\"channelId\":22,\"content\":\"<p><b>（邓传蓉 文/图）</b>在六一国际儿童节来临之际，为了让孩子们过一个快乐、充实、有意义的节日，旌阳区德新小学开展了精彩纷呈的活动&nbsp;</p><p style=\'text-align: center;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/deyang_dexin_xiaoxue/2018-6-1/1.png\' style=\'max-width:100%;\'></p><p style=\'text-align: center;\'>庄严的入队仪式<br></p><p>&nbsp; &nbsp; 5月29日下午，在德新小学的校园里，庄严的出旗曲响起，雄壮的少年先锋队队歌响起，高昂的“为共产主义事业而奋斗，准备着----时刻准备着！”的呼号声响起。激动人心的声音中，又有  94名儿童加入了中国少年先锋队。庄严的入队仪式使全体少先队员受到了深深的教育，队员们在火红的队旗下受到了心灵的洗礼。&nbsp;</p><p style=\'text-align: center;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/deyang_dexin_xiaoxue/2018-6-1/5.png\' style=\'max-width:100%;\'></p><p style=\'text-align: center;\'>&nbsp;引人注目的绘画艺术展<br></p><p>&nbsp; &nbsp; 独具匠心的绘画展览活动。5月30日，准备了许久的六一绘画作品展出了。学校通道两边，脸谱、马勺、手工编织、儿童画、粘贴画……多种美术作品吸引了孩子们的目光。更让人惊叹的是六年级学生创作的“留给母校的纪念”作品：“致童年”、“我们是一家人”、“时光不老 我们不散”，笔画、线条和色彩中充满同学们对母校、对老师、同学和童年时光的眷念。</p><p style=\'text-align: center;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/deyang_dexin_xiaoxue/2018-6-1/4.png\' style=\'max-width:100%;\'></p><p style=\'text-align: center;\'>旌阳区艺术节一等奖舞蹈：青衣梦<br></p><p>&nbsp; &nbsp; 精彩纷呈的文艺展演。5月31日，德新小学庆六一的活动集中进行。钱继光校长致辞后，表彰优秀家长。然后进行“党耀童心 你我同行”的文艺汇演。校合唱团的《济公.又见稠梨花》和舞蹈队的《青衣梦》获得全校师生和众多家长的热烈掌声，这两个节目在旌阳区艺术节的比赛中都获得了一等奖。随后，各年级的节目、各兴趣组的节目纷纷登台亮相：舞蹈、诗歌朗诵、乐器表演、英语情景剧、相声、歌舞串烧。最后的教师创意走秀将活动推向了高潮，激情音乐中老师们闪亮登场，率性走秀，小演员们回归舞台，一起律动，台上台下挥手欢呼，师生同乐，场面壮观。</p><p style=\'text-align: center;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/deyang_dexin_xiaoxue/2018-6-1/3.png\' style=\'max-width:100%;\'></p><p style=\'text-align: center;\'>图书漂流活动：淘书<br></p><p>&nbsp; &nbsp; 书香弥漫的图书漂流活动。文艺展演后，进行的是同学们盼望已久的图书漂流活动。通过前期的宣传动员、收集登记，分类整理，德新小学第三届图书漂流活动如期举行。同学们拿着用自己的图书获取的图书漂流票，去对应的红、蓝、绿书屋里“淘”喜欢的书籍。淘到各自心仪的图书后，孩子们便回到教室里津津有味地读起来。图书漂流，让孩子们花一本书的钱，看更多的书，学会交流，懂得分享，与书为伴，愉悦身心。</p><p style=\'text-align: center;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/deyang_dexin_xiaoxue/2018-6-1/2.png\' style=\'max-width:100%;\'></p><p style=\'text-align: center;\'>游园猜字谜：文字的魅力</p><p>&nbsp; &nbsp; 有趣的游园活动。下午，是孩子们最喜欢的游戏时间。为了让孩子们在游园活动中玩得开心，学校老师挖空心思设置了尽可能多的游戏项目:夹弹珠、吹蜡烛、钓鱼、赶猪、摸鼻子、转圈圈、成语接龙、投球……同学们个个喜笑颜开地到自己喜欢的项目组去参加活动，如若游戏中胜利了得到奖票，则高兴得手舞足蹈地去领奖。\\n来自多方的关爱。时值六一儿童节到来之际，除了学校开展多种活动，为孩子们喜庆节日，德新小学的同学们还感受到了来自社会和各级领导的关爱。5月30日上午，“春信”公益的阿姨们来到学校，表达对孩子们节日的祝福，并为一直资助的贫困优生送来了慰问金。5月31日上午，德新镇分管教育的副镇长张超到学校和孩子们一起观看演出，并发表了激情洋溢的讲话，为孩子们带来节日的祝福和慰问礼金！之后，旌阳区政府教育督导室主任宋德超一行也到德新小学看望慰问贫困留守儿童。\\n此次德新小学“党耀童心 你我同行”六一系列庆祝活动取得圆满成功。我们希望孩子们快乐地度过自己的节日，我们期待孩子们在未来更健康地成长。</p>\",\"delFlag\":false,\"marks\":\"（邓传蓉 文/图）在六一国际儿童节来临之际，为了让孩子们过一个快乐、充实、有意义的节日，旌阳区德新小学开展了精彩纷呈的活动\",\"publistTime\":1527811200000,\"recommend\":false,\"resources\":\"邓传蓉\",\"showPic\":\"\",\"subTitle\":\"\",\"text\":\"（邓传蓉 文/图）在六一国际儿童节来临之际，为了让孩子们过一个快乐、充实、有意义的节日，旌阳区德新小学开展了精彩纷呈的活动&nbsp;庄严的入队仪式&nbsp; &nbsp; 5月29日下午，在德新小学的校园里，庄严的出旗曲响起，雄壮的少年先锋队队歌响起，高昂的“为共产主义事业而奋斗，准备着----时刻准备着！”的呼号声响起。激动人心的声音中，又有  94名儿童加入了中国少年先锋队。庄严的入队仪式使全体少先队员受到了深深的教育，队员们在火红的队旗下受到了心灵的洗礼。&nbsp;&nbsp;引人注目的绘画艺术展&nbsp; &nbsp; 独具匠心的绘画展览活动。5月30日，准备了许久的六一绘画作品展出了。学校通道两边，脸谱、马勺、手工编织、儿童画、粘贴画……多种美术作品吸引了孩子们的目光。更让人惊叹的是六年级学生创作的“留给母校的纪念”作品：“致童年”、“我们是一家人”、“时光不老 我们不散”，笔画、线条和色彩中充满同学们对母校、对老师、同学和童年时光的眷念。旌阳区艺术节一等奖舞蹈：青衣梦&nbsp; &nbsp; 精彩纷呈的文艺展演。5月31日，德新小学庆六一的活动集中进行。钱继光校长致辞后，表彰优秀家长。然后进行“党耀童心 你我同行”的文艺汇演。校合唱团的《济公.又见稠梨花》和舞蹈队的《青衣梦》获得全校师生和众多家长的热烈掌声，这两个节目在旌阳区艺术节的比赛中都获得了一等奖。随后，各年级的节目、各兴趣组的节目纷纷登台亮相：舞蹈、诗歌朗诵、乐器表演、英语情景剧、相声、歌舞串烧。最后的教师创意走秀将活动推向了高潮，激情音乐中老师们闪亮登场，率性走秀，小演员们回归舞台，一起律动，台上台下挥手欢呼，师生同乐，场面壮观。图书漂流活动：淘书&nbsp; &nbsp; 书香弥漫的图书漂流活动。文艺展演后，进行的是同学们盼望已久的图书漂流活动。通过前期的宣传动员、收集登记，分类整理，德新小学第三届图书漂流活动如期举行。同学们拿着用自己的图书获取的图书漂流票，去对应的红、蓝、绿书屋里“淘”喜欢的书籍。淘到各自心仪的图书后，孩子们便回到教室里津津有味地读起来。图书漂流，让孩子们花一本书的钱，看更多的书，学会交流，懂得分享，与书为伴，愉悦身心。游园猜字谜：文字的魅力&nbsp; &nbsp; 有趣的游园活动。下午，是孩子们最喜欢的游戏时间。为了让孩子们在游园活动中玩得开心，学校老师挖空心思设置了尽可能多的游戏项目:夹弹珠、吹蜡烛、钓鱼、赶猪、摸鼻子、转圈圈、成语接龙、投球……同学们个个喜笑颜开地到自己喜欢的项目组去参加活动，如若游戏中胜利了得到奖票，则高兴得手舞足蹈地去领奖。\\n来自多方的关爱。时值六一儿童节到来之际，除了学校开展多种活动，为孩子们喜庆节日，德新小学的同学们还感受到了来自社会和各级领导的关爱。5月30日上午，“春信”公益的阿姨们来到学校，表达对孩子们节日的祝福，并为一直资助的贫困优生送来了慰问金。5月31日上午，德新镇分管教育的副镇长张超到学校和孩子们一起观看演出，并发表了激情洋溢的讲话，为孩子们带来节日的祝福和慰问礼金！之后，旌阳区政府教育督导室主任宋德超一行也到德新小学看望慰问贫困留守儿童。\\n此次德新小学“党耀童心 你我同行”六一系列庆祝活动取得圆满成功。我们希望孩子们快乐地度过自己的节日，我们期待孩子们在未来更健康地成长。\",\"title\":\"德新小学六一儿童节活动\",\"top\":false}]', 'a2201dbb-9b3f-4c3a-ad97-ac7343ce22cc', '{\"success\":true,\"message\":\"成功\"}', 215, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-16 22:03:24', 2, '2018-09-16 22:03:24', NULL, b'0');
INSERT INTO `sys_log` VALUES (707, '普通请求', '跳转博客内容列表', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/list', 'GET', 'com.mysiteforme.admin.controller.BlogArticleController.list', '[]', 'a2201dbb-9b3f-4c3a-ad97-ac7343ce22cc', '\"/admin/blogArticle/list\"', 14, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-16 22:03:25', 2, '2018-09-16 22:03:25', NULL, b'0');
INSERT INTO `sys_log` VALUES (708, 'Ajax请求', '保存编辑博客内容数据', '127.0.0.1', '宋平', 'http://localhost:8080/admin/blogArticle/edit', 'POST', 'com.mysiteforme.admin.controller.BlogArticleController.edit', '[{\"category\":\"1\",\"channelId\":22,\"content\":\"<h2><b>（邓传蓉 文/图）</b>在六一国际儿童节来临之际，为了让孩子们过一个快乐、充实、有意义的节日，旌阳区德新小学开展了精彩纷呈的活动&nbsp;</h2><p style=\'text-align: center;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/deyang_dexin_xiaoxue/2018-6-1/1.png\' style=\'max-width:100%;\'></p><p style=\'text-align: center;\'>庄严的入队仪式<br></p><h2>&nbsp; &nbsp; 5月29日下午，在德新小学的校园里，庄严的出旗曲响起，雄壮的少年先锋队队歌响起，高昂的“为共产主义事业而奋斗，准备着----时刻准备着！”的呼号声响起。激动人心的声音中，又有  94名儿童加入了中国少年先锋队。庄严的入队仪式使全体少先队员受到了深深的教育，队员们在火红的队旗下受到了心灵的洗礼。&nbsp;</h2><p style=\'text-align: center;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/deyang_dexin_xiaoxue/2018-6-1/5.png\' style=\'max-width:100%;\'></p><p style=\'text-align: center;\'>&nbsp;引人注目的绘画艺术展<br></p><h2>&nbsp; &nbsp; 独具匠心的绘画展览活动。5月30日，准备了许久的六一绘画作品展出了。学校通道两边，脸谱、马勺、手工编织、儿童画、粘贴画……多种美术作品吸引了孩子们的目光。更让人惊叹的是六年级学生创作的“留给母校的纪念”作品：“致童年”、“我们是一家人”、“时光不老 我们不散”，笔画、线条和色彩中充满同学们对母校、对老师、同学和童年时光的眷念。</h2><p style=\'text-align: center;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/deyang_dexin_xiaoxue/2018-6-1/4.png\' style=\'max-width:100%;\'></p><p style=\'text-align: center;\'>旌阳区艺术节一等奖舞蹈：青衣梦<br></p><h2>&nbsp; &nbsp; 精彩纷呈的文艺展演。5月31日，德新小学庆六一的活动集中进行。钱继光校长致辞后，表彰优秀家长。然后进行“党耀童心 你我同行”的文艺汇演。校合唱团的《济公.又见稠梨花》和舞蹈队的《青衣梦》获得全校师生和众多家长的热烈掌声，这两个节目在旌阳区艺术节的比赛中都获得了一等奖。随后，各年级的节目、各兴趣组的节目纷纷登台亮相：舞蹈、诗歌朗诵、乐器表演、英语情景剧、相声、歌舞串烧。最后的教师创意走秀将活动推向了高潮，激情音乐中老师们闪亮登场，率性走秀，小演员们回归舞台，一起律动，台上台下挥手欢呼，师生同乐，场面壮观。</h2><p style=\'text-align: center;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/deyang_dexin_xiaoxue/2018-6-1/3.png\' style=\'max-width:100%;\'></p><p style=\'text-align: center;\'>图书漂流活动：淘书<br></p><h2>&nbsp; &nbsp; 书香弥漫的图书漂流活动。文艺展演后，进行的是同学们盼望已久的图书漂流活动。通过前期的宣传动员、收集登记，分类整理，德新小学第三届图书漂流活动如期举行。同学们拿着用自己的图书获取的图书漂流票，去对应的红、蓝、绿书屋里“淘”喜欢的书籍。淘到各自心仪的图书后，孩子们便回到教室里津津有味地读起来。图书漂流，让孩子们花一本书的钱，看更多的书，学会交流，懂得分享，与书为伴，愉悦身心。</h2><p style=\'text-align: center;\'><img src=\'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/deyang_dexin_xiaoxue/2018-6-1/2.png\' style=\'max-width:100%;\'></p><p style=\'text-align: center;\'>游园猜字谜：文字的魅力</p><h2>&nbsp; &nbsp; 有趣的游园活动。下午，是孩子们最喜欢的游戏时间。为了让孩子们在游园活动中玩得开心，学校老师挖空心思设置了尽可能多的游戏项目:夹弹珠、吹蜡烛、钓鱼、赶猪、摸鼻子、转圈圈、成语接龙、投球……同学们个个喜笑颜开地到自己喜欢的项目组去参加活动，如若游戏中胜利了得到奖票，则高兴得手舞足蹈地去领奖。\\n来自多方的关爱。时值六一儿童节到来之际，除了学校开展多种活动，为孩子们喜庆节日，德新小学的同学们还感受到了来自社会和各级领导的关爱。5月30日上午，“春信”公益的阿姨们来到学校，表达对孩子们节日的祝福，并为一直资助的贫困优生送来了慰问金。5月31日上午，德新镇分管教育的副镇长张超到学校和孩子们一起观看演出，并发表了激情洋溢的讲话，为孩子们带来节日的祝福和慰问礼金！之后，旌阳区政府教育督导室主任宋德超一行也到德新小学看望慰问贫困留守儿童。\\n此次德新小学“党耀童心 你我同行”六一系列庆祝活动取得圆满成功。我们希望孩子们快乐地度过自己的节日，我们期待孩子们在未来更健康地成长。</h2><p><br></p>\",\"delFlag\":false,\"id\":12,\"marks\":\"（邓传蓉 文/图）在六一国际儿童节来临之际，为了让孩子们过一个快乐、充实、有意义的节日，旌阳区德新小学开展了精彩纷呈的活动\",\"publistTime\":1527811200000,\"recommend\":false,\"resources\":\"\",\"showPic\":\"https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/deyang_dexin_xiaoxue/2018-6-1/4.png\",\"sort\":5,\"subTitle\":\"\",\"text\":\"（邓传蓉 文/图）在六一国际儿童节来临之际，为了让孩子们过一个快乐、充实、有意义的节日，旌阳区德新小学开展了精彩纷呈的活动&nbsp;庄严的入队仪式&nbsp; &nbsp; 5月29日下午，在德新小学的校园里，庄严的出旗曲响起，雄壮的少年先锋队队歌响起，高昂的“为共产主义事业而奋斗，准备着----时刻准备着！”的呼号声响起。激动人心的声音中，又有  94名儿童加入了中国少年先锋队。庄严的入队仪式使全体少先队员受到了深深的教育，队员们在火红的队旗下受到了心灵的洗礼。&nbsp;&nbsp;引人注目的绘画艺术展&nbsp; &nbsp; 独具匠心的绘画展览活动。5月30日，准备了许久的六一绘画作品展出了。学校通道两边，脸谱、马勺、手工编织、儿童画、粘贴画……多种美术作品吸引了孩子们的目光。更让人惊叹的是六年级学生创作的“留给母校的纪念”作品：“致童年”、“我们是一家人”、“时光不老 我们不散”，笔画、线条和色彩中充满同学们对母校、对老师、同学和童年时光的眷念。旌阳区艺术节一等奖舞蹈：青衣梦&nbsp; &nbsp; 精彩纷呈的文艺展演。5月31日，德新小学庆六一的活动集中进行。钱继光校长致辞后，表彰优秀家长。然后进行“党耀童心 你我同行”的文艺汇演。校合唱团的《济公.又见稠梨花》和舞蹈队的《青衣梦》获得全校师生和众多家长的热烈掌声，这两个节目在旌阳区艺术节的比赛中都获得了一等奖。随后，各年级的节目、各兴趣组的节目纷纷登台亮相：舞蹈、诗歌朗诵、乐器表演、英语情景剧、相声、歌舞串烧。最后的教师创意走秀将活动推向了高潮，激情音乐中老师们闪亮登场，率性走秀，小演员们回归舞台，一起律动，台上台下挥手欢呼，师生同乐，场面壮观。图书漂流活动：淘书&nbsp; &nbsp; 书香弥漫的图书漂流活动。文艺展演后，进行的是同学们盼望已久的图书漂流活动。通过前期的宣传动员、收集登记，分类整理，德新小学第三届图书漂流活动如期举行。同学们拿着用自己的图书获取的图书漂流票，去对应的红、蓝、绿书屋里“淘”喜欢的书籍。淘到各自心仪的图书后，孩子们便回到教室里津津有味地读起来。图书漂流，让孩子们花一本书的钱，看更多的书，学会交流，懂得分享，与书为伴，愉悦身心。游园猜字谜：文字的魅力&nbsp; &nbsp; 有趣的游园活动。下午，是孩子们最喜欢的游戏时间。为了让孩子们在游园活动中玩得开心，学校老师挖空心思设置了尽可能多的游戏项目:夹弹珠、吹蜡烛、钓鱼、赶猪、摸鼻子、转圈圈、成语接龙、投球……同学们个个喜笑颜开地到自己喜欢的项目组去参加活动，如若游戏中胜利了得到奖票，则高兴得手舞足蹈地去领奖。\\n来自多方的关爱。时值六一儿童节到来之际，除了学校开展多种活动，为孩子们喜庆节日，德新小学的同学们还感受到了来自社会和各级领导的关爱。5月30日上午，“春信”公益的阿姨们来到学校，表达对孩子们节日的祝福，并为一直资助的贫困优生送来了慰问金。5月31日上午，德新镇分管教育的副镇长张超到学校和孩子们一起观看演出，并发表了激情洋溢的讲话，为孩子们带来节日的祝福和慰问礼金！之后，旌阳区政府教育督导室主任宋德超一行也到德新小学看望慰问贫困留守儿童。\\n此次德新小学“党耀童心 你我同行”六一系列庆祝活动取得圆满成功。我们希望孩子们快乐地度过自己的节日，我们期待孩子们在未来更健康地成长。\",\"title\":\"德新小学六一儿童节活动\",\"top\":false}]', 'a2201dbb-9b3f-4c3a-ad97-ac7343ce22cc', '{\"success\":true,\"message\":\"成功\"}', 223, 'Windows-Chrome-63.0.3239.132', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-16 22:06:57', 2, '2018-09-16 22:06:57', NULL, b'0');

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
INSERT INTO `sys_menu` VALUES (4, '系统菜单管理', 1, 2, '1,4,', 20, '/admin/system/menu/list', NULL, '', '#d4573b', 1, 'sys:menu:list', 1, '2018-01-16 11:33:19', 1, '2018-09-14 10:52:58', NULL, 0);
INSERT INTO `sys_menu` VALUES (5, '系统资源管理', 1, 2, '1,5,', 30, '/admin/system/rescource/list', NULL, '', '#f5e42a', 1, 'sys:rescource:list', 1, '2018-01-16 11:34:48', 1, '2018-01-20 05:56:35', NULL, 0);
INSERT INTO `sys_menu` VALUES (6, '系统日志管理', 1, 2, '1,6,', 40, '/admin/system/log/list', NULL, '', '#b56c18', 1, 'sys:log:list', 1, '2018-01-16 11:35:31', 1, '2018-01-20 05:12:17', NULL, 0);
INSERT INTO `sys_menu` VALUES (7, '网站基本信息', 1, 2, '1,7,', 50, '/admin/system/site/show', NULL, '', '#95deb9', 1, 'sys:site:list', 1, '2018-01-16 11:36:50', 1, '2018-01-20 05:55:44', NULL, 0);
INSERT INTO `sys_menu` VALUES (8, '数据库管理', 1, 2, '1,8,', 60, '/admin/system/table/list', NULL, '', '#369e16', 1, 'sys:table:list', 1, '2018-01-16 11:38:29', 1, '2018-01-20 03:14:23', NULL, 0);
INSERT INTO `sys_menu` VALUES (9, '系统字典管理', 1, 2, '1,9,', 70, '/admin/system/dict/list', NULL, '', '#1bbcc2', 1, 'sys:dict:list', 1, '2018-01-16 14:51:52', 1, '2018-01-20 03:12:27', NULL, 0);
INSERT INTO `sys_menu` VALUES (10, '文章管理', NULL, 1, '10,', 10, '', NULL, '', NULL, 1, '', 1, '2018-01-17 13:21:53', 1, '2018-09-14 10:47:03', NULL, 0);
INSERT INTO `sys_menu` VALUES (11, '栏目管理', 10, 2, '10,11,', 6, '/admin/blogChannel/list', NULL, '', NULL, 1, 'blog:channel:list', 1, '2018-01-17 13:22:57', 1, '2018-02-08 10:20:54', NULL, 0);
INSERT INTO `sys_menu` VALUES (12, '文章评论', 10, 2, '10,12,', 7, '/admin/blogComment/list', NULL, '', '#c8e332', 1, 'blog:comment:list', 1, '2018-01-17 13:23:52', 1, '2018-09-14 10:48:48', NULL, 0);
INSERT INTO `sys_menu` VALUES (13, '文章列表', 10, 2, '10,13,', 8, '/admin/blogArticle/list', NULL, '', '#1962b5', 1, 'blog:article:list', 1, '2018-01-17 16:02:07', 1, '2018-09-14 10:47:55', NULL, 0);
INSERT INTO `sys_menu` VALUES (14, '定时任务', NULL, 1, '14,', 5, '', NULL, '', NULL, 1, '', 1, '2018-01-26 22:39:35', 1, '2018-02-08 10:31:05', NULL, 0);
INSERT INTO `sys_menu` VALUES (15, '任务列表', 14, 2, '14,15,', 15, '/admin/quartzTask/list', NULL, '', '#d6d178', 1, 'quartz:task:list', 1, '2018-01-26 22:41:25', 1, '2018-02-08 10:31:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (16, '任务执行日志', 14, 2, '14,16,', 10, '/admin/quartzTaskLog/list', NULL, '', '#5158d6', 1, 'quartz:log:list', 1, '2018-01-27 01:07:11', 1, '2018-02-08 10:37:51', NULL, 0);
INSERT INTO `sys_menu` VALUES (17, '新增字典', 9, 3, '1,9,17,', 0, '', NULL, NULL, NULL, 0, 'sys:dict:add', 1, '2018-02-08 09:39:09', 1, '2018-02-08 09:39:19', NULL, 0);
INSERT INTO `sys_menu` VALUES (18, '编辑字典', 9, 3, '1,9,18,', 10, '', NULL, NULL, NULL, 0, 'sys:dict:edit', 1, '2018-02-08 09:40:37', 1, '2018-02-08 09:40:46', NULL, 0);
INSERT INTO `sys_menu` VALUES (19, '编辑字典类型', 9, 3, '1,9,19,', 20, '', NULL, NULL, NULL, 0, 'sys:dict:editType', 1, '2018-02-08 09:42:46', 1, '2018-02-08 09:54:07', NULL, 0);
INSERT INTO `sys_menu` VALUES (20, '新增系统菜单', 4, 3, '1,4,20,', 0, '', NULL, NULL, NULL, 0, 'sys:menu:add', 1, '2018-02-08 09:49:15', 1, '2018-09-14 10:53:45', NULL, 0);
INSERT INTO `sys_menu` VALUES (21, '编辑系统菜单', 4, 3, '1,4,21,', 10, '', NULL, NULL, NULL, 0, 'sys:menu:edit', 1, '2018-02-08 09:50:16', 1, '2018-09-14 10:53:33', NULL, 0);
INSERT INTO `sys_menu` VALUES (22, '删除系统菜单', 4, 3, '1,4,22,', 20, '', NULL, NULL, NULL, 0, 'sys:menu:delete', 1, '2018-02-08 09:51:53', 1, '2018-09-14 10:53:21', NULL, 0);
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
INSERT INTO `sys_menu` VALUES (38, '新增文章', 13, 3, '10,13,38,', 0, '', NULL, NULL, NULL, 0, 'blog:article:add', 1, '2018-02-08 10:16:59', 1, '2018-02-08 10:16:59', NULL, 0);
INSERT INTO `sys_menu` VALUES (39, '文章编辑', 13, 3, '10,13,39,', 10, '', NULL, NULL, NULL, 0, 'blog:article:edit', 1, '2018-02-08 10:17:16', 1, '2018-02-08 10:17:16', NULL, 0);
INSERT INTO `sys_menu` VALUES (40, '文章删除', 13, 3, '10,13,40,', 20, '', NULL, NULL, NULL, 0, 'blog:article:delete', 1, '2018-02-08 10:17:34', 1, '2018-09-14 10:48:35', NULL, 0);
INSERT INTO `sys_menu` VALUES (41, '评论回复', 12, 3, '10,12,41,', 0, '', NULL, NULL, NULL, 0, 'blog:comment:reply', 1, '2018-02-08 10:19:29', 1, '2018-02-08 10:20:33', NULL, 0);
INSERT INTO `sys_menu` VALUES (42, '新增文章栏目', 11, 3, '10,11,42,', 0, '', NULL, NULL, NULL, 0, 'blog:channel:add', 1, '2018-02-08 10:22:06', 1, '2018-09-14 10:49:41', NULL, 0);
INSERT INTO `sys_menu` VALUES (43, '编辑文章栏目', 11, 3, '10,11,43,', 10, '', NULL, NULL, NULL, 0, 'blog:channel:edit', 1, '2018-02-08 10:23:31', 1, '2018-09-14 10:49:29', NULL, 0);
INSERT INTO `sys_menu` VALUES (44, '删除文章栏目', 11, 3, '10,11,44,', 20, '', NULL, NULL, NULL, 0, 'blog:channel:delete', 1, '2018-02-08 10:23:57', 1, '2018-09-14 10:49:16', NULL, 0);
INSERT INTO `sys_menu` VALUES (45, '删除评论', 12, 3, '10,12,45,', 10, '', NULL, NULL, NULL, 0, 'blog:comment:delete', 1, '2018-02-08 10:28:48', 1, '2018-02-08 10:28:48', NULL, 0);
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
INSERT INTO `sys_menu` VALUES (56, '文章标签', 10, 2, '10,56,', 3, '/admin/blogTags/list', NULL, '', '#c3e8ce', 1, 'blog:tags:list', 1, '2018-06-16 04:42:15', 1, '2018-09-14 10:51:35', NULL, 0);
INSERT INTO `sys_menu` VALUES (57, '文章标签新增', 56, 3, '10,56,57,', 0, '', NULL, NULL, NULL, 0, 'blog:tags:add', 1, '2018-06-16 04:43:02', 1, '2018-06-16 04:43:02', NULL, 0);
INSERT INTO `sys_menu` VALUES (58, '文章标签编辑', 56, 3, '10,56,58,', 10, '', NULL, NULL, NULL, 0, 'blog:tags:edit', 1, '2018-06-16 04:43:26', 1, '2018-06-16 04:43:26', NULL, 0);
INSERT INTO `sys_menu` VALUES (59, '文章标签删除', 56, 3, '10,56,59,', 20, '', NULL, NULL, NULL, 0, 'blog:tags:delete', 1, '2018-06-16 04:43:56', 1, '2018-06-16 04:43:56', NULL, 0);
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
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统资源' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_rescource
-- ----------------------------
INSERT INTO `sys_rescource` VALUES (26, 'afd8c39e-2732-40a4-82f4-134d3c4f1be4.ico', 'local', 'http://192.168.137.1:8080/static/upload/afd8c39e-2732-40a4-82f4-134d3c4f1be4.ico', 'FjjYgcbGV-_Xp7oN4wmq7iiVxeWW', '66kb', 'image/x-icon', NULL, '2018-09-14 10:38:16', 1, '2018-09-14 10:38:16', 1, NULL, 0);
INSERT INTO `sys_rescource` VALUES (27, '35979644-9706-497e-bb20-da4f67a3a900.png', 'local', 'http://192.168.137.1:8080/static/upload/35979644-9706-497e-bb20-da4f67a3a900.png', 'FqoTL_-P1XOrF4MYbQV-Xs-DozUO', '11kb', 'image/png', NULL, '2018-09-15 19:17:33', 2, '2018-09-15 19:17:33', 2, NULL, 0);
INSERT INTO `sys_rescource` VALUES (28, '5478861c-9d9f-4ba8-a15e-cf94dd772013.jpg', 'local', 'http://192.168.137.1:8080/static/upload/5478861c-9d9f-4ba8-a15e-cf94dd772013.jpg', 'Fvv8UXjjg_7JPMS7yezHbXwxFtJg', '0kb', '.jpg', 'http://n.sinaimg.cn/news/transform/59/w550h309/20180915/7Pjs-hkahyhx2240093.jpg', '2018-09-15 19:21:26', 2, '2018-09-15 19:21:26', 2, NULL, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '老司机', '2017-11-02 14:19:07', 1, '2018-09-12 17:07:42', 1, '', 1);
INSERT INTO `sys_role` VALUES (2, '系统管理员', '2017-11-29 19:36:37', 1, '2018-07-12 18:47:20', 1, '', 0);
INSERT INTO `sys_role` VALUES (3, '学校信息发布者', '2018-09-12 17:08:35', 1, '2018-09-12 17:39:21', 1, '', 0);

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
INSERT INTO `sys_role_menu` VALUES (3, 10);
INSERT INTO `sys_role_menu` VALUES (3, 13);
INSERT INTO `sys_role_menu` VALUES (3, 38);
INSERT INTO `sys_role_menu` VALUES (3, 39);
INSERT INTO `sys_role_menu` VALUES (3, 40);

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
INSERT INTO `sys_site` VALUES (1, '家校零距离', 'cloud-campus.com', b'1', b'0', '1.0', 'jiaopan', 'https://static.mysiteforme.com/3c5b69f4-2e39-4f88-b302-a6eb48e4c43a.jpg', 'local', 'https://weibo.com/u/2173866382', '1115784675', 'https://gitee.com/wanglingxiao/', 'https://github.com/wangl1989', '13776055179', '1115784675@qq.com', '江苏-苏州', 'http://192.168.137.1:8080/static/upload/afd8c39e-2732-40a4-82f4-134d3c4f1be4.ico', 'windows', 'mysql', 0, NULL, '网站描述', NULL, '苏ICP备17063650号', 1, '2017-12-30 22:46:15', 1, '2018-09-14 10:38:24', '<p><br></p><p><br></p>', b'0');

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
  `school_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学校代码',
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `locked` tinyint(2) NULL DEFAULT NULL COMMENT '是否锁定',
  `create_date` datetime(0) NULL DEFAULT NULL,
  `create_by` bigint(20) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'test', '我是管理员', 'https://static.mysiteforme.com/3c5b69f4-2e39-4f88-b302-a6eb48e4c43a.jpg', '810339f5426fe2dcaf92c5cac718acc6471a034b', '3fb62b5aeede1bbf', '13776055179', NULL, 'b@qq.com', 0, '2017-11-27 22:19:39', 1, '2018-09-14 16:14:31', 1, NULL, 0);
INSERT INTO `sys_user` VALUES (2, 'songping', '宋平', NULL, '10b7fdefaca6a018ead08b053edd99df32426595', '01f529f07dab3462', '', '100001', '', 0, '2018-09-12 17:09:13', 1, '2018-09-14 15:25:17', 1, NULL, 0);

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
INSERT INTO `sys_user_role` VALUES (1, 2);
INSERT INTO `sys_user_role` VALUES (2, 3);

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
