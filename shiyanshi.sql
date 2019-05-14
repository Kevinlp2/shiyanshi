/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : shiyanshi

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2019-05-14 15:55:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for forder
-- ----------------------------
DROP TABLE IF EXISTS `forder`;
CREATE TABLE `forder` (
  `kid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `fid` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL COMMENT '申请设备的实验室id',
  `status` varchar(30) DEFAULT NULL,
  `pj` varchar(255) DEFAULT NULL,
  `stime` varchar(50) DEFAULT NULL,
  `etime` varchar(50) DEFAULT NULL,
  `ftype` varchar(20) DEFAULT NULL COMMENT '申请的类型',
  `isdel` varchar(50) DEFAULT NULL,
  `pubtime` varchar(50) DEFAULT NULL,
  `snum` int(11) DEFAULT NULL,
  PRIMARY KEY (`kid`),
  KEY `FK_keep` (`fid`),
  KEY `uid` (`uid`),
  CONSTRAINT `forder_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `sysuser` (`uid`),
  CONSTRAINT `forder_ibfk_2` FOREIGN KEY (`fid`) REFERENCES `shiyan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of forder
-- ----------------------------
INSERT INTO `forder` VALUES ('79', '19', '1', null, '审核通过', null, '2019-05-14 15:32:17', '2019-05-14 15:32:58', '实验室', '0', '2019-05-14 15:32:17', null);
INSERT INTO `forder` VALUES ('80', '19', '21', null, '审核失败', null, '2019-05-14 15:32:23', null, '实验室', '1', '2019-05-14 15:32:23', null);
INSERT INTO `forder` VALUES ('81', '17', '22', '1', '审核成功', null, '2019-05-14 15:33:56', null, '设备', '1', '2019-05-14 15:33:56', '3');
INSERT INTO `forder` VALUES ('82', '17', '23', '1', '审核成功', null, '2019-05-14 15:34:02', null, '设备', '1', '2019-05-14 15:34:03', '3');
INSERT INTO `forder` VALUES ('83', '17', '31', '1', '审核失败', null, '2019-05-14 15:34:09', null, '设备', '1', '2019-05-14 15:34:09', '1');
INSERT INTO `forder` VALUES ('84', '17', '22', '21', '审核成功', null, '2019-05-14 15:37:56', null, '设备', '1', '2019-05-14 15:37:56', '5');
INSERT INTO `forder` VALUES ('85', '17', '23', '21', '审核成功', null, '2019-05-14 15:38:04', null, '设备', '1', '2019-05-14 15:38:05', '5');
INSERT INTO `forder` VALUES ('86', '17', '34', '21', '审核成功', null, '2019-05-14 15:38:14', null, '设备', '1', '2019-05-14 15:38:14', '5');

-- ----------------------------
-- Table structure for sbbf
-- ----------------------------
DROP TABLE IF EXISTS `sbbf`;
CREATE TABLE `sbbf` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `sysid` int(11) NOT NULL,
  `sbid` int(11) DEFAULT NULL,
  `bfsnum` int(11) DEFAULT NULL COMMENT '报废数量',
  `bftime` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '报废时间',
  `bfyy` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '报废原因',
  `uid` int(11) NOT NULL,
  `status` varchar(5) COLLATE utf8_bin NOT NULL,
  `cluid` int(11) DEFAULT NULL,
  `cltime` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`bid`),
  KEY `sbid` (`sbid`),
  CONSTRAINT `sbbf_ibfk_1` FOREIGN KEY (`sbid`) REFERENCES `shiyan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sbbf
-- ----------------------------
INSERT INTO `sbbf` VALUES ('4', '1', '23', '2', '2019-05-14 15:35:33', '用不了', '17', '确认报废', '18', '2019-05-14 15:36:55');

-- ----------------------------
-- Table structure for sbbx
-- ----------------------------
DROP TABLE IF EXISTS `sbbx`;
CREATE TABLE `sbbx` (
  `wid` int(11) NOT NULL AUTO_INCREMENT,
  `sysid` int(11) NOT NULL,
  `sbid` int(11) NOT NULL,
  `bxyy` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '保修原因',
  `uid` int(11) NOT NULL COMMENT '保修人id',
  `bxtime` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '保修时间',
  `bstatus` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `bxnum` int(11) DEFAULT NULL COMMENT '保修数量',
  `cluid` int(11) DEFAULT NULL COMMENT '处理人Id',
  `cltime` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '处理时间',
  PRIMARY KEY (`wid`),
  KEY `sbid` (`sbid`),
  CONSTRAINT `sbbx_ibfk_1` FOREIGN KEY (`sbid`) REFERENCES `shiyan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sbbx
-- ----------------------------
INSERT INTO `sbbx` VALUES ('4', '1', '22', '磨损严重', '17', '2019-05-14 15:35:21', '完成维修', '1', '18', '2019-05-14 15:36:04');

-- ----------------------------
-- Table structure for shiyan
-- ----------------------------
DROP TABLE IF EXISTS `shiyan`;
CREATE TABLE `shiyan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `miaoshu` text,
  `address` varchar(50) DEFAULT NULL,
  `pubtime` varchar(100) DEFAULT NULL,
  `isdel` varchar(20) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `ftype` varchar(20) DEFAULT NULL,
  `mstatus` varchar(30) DEFAULT NULL,
  `snum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  CONSTRAINT `shiyan_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `sysuser` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shiyan
-- ----------------------------
INSERT INTO `shiyan` VALUES ('1', '实验室1', null, '实习楼401', '2018-03-05 16:51:12', '1', null, '实验室', '空闲中', null);
INSERT INTO `shiyan` VALUES ('21', '实验室2', null, '实习楼402', '2019-02-23 10:44:06', '1', null, '实验室', '空闲中', null);
INSERT INTO `shiyan` VALUES ('22', '设备1', null, null, '2019-02-23 10:51:15', '1', null, '设备', '充足', '2');
INSERT INTO `shiyan` VALUES ('23', '设备2', null, null, '2019-02-23 10:52:43', '1', null, '设备', '充足', '2');
INSERT INTO `shiyan` VALUES ('26', '实验室3', '物理实验室', '实习楼404', '2019-02-23 14:25:36', '1', null, '实验室', '空闲中', null);
INSERT INTO `shiyan` VALUES ('27', '物理实验室', '物理实验室', '实习楼501', '2019-03-12 15:11:53', '1', null, '实验室', '空闲中', null);
INSERT INTO `shiyan` VALUES ('28', '化学实验室', '化学实验室', '实习楼502', '2019-03-12 15:12:19', '1', null, '实验室', '空闲中', null);
INSERT INTO `shiyan` VALUES ('29', '生物实验室', '生物实验室', '实习楼503', '2019-03-12 15:12:39', '1', null, '实验室', '空闲中', null);
INSERT INTO `shiyan` VALUES ('30', '物理实验室2', '物理实验室', '实习楼405', '2019-03-12 15:13:03', '1', null, '实验室', '空闲中', null);
INSERT INTO `shiyan` VALUES ('31', '设备3', null, null, '2019-03-12 20:34:35', '1', null, '设备', '充足', '3');
INSERT INTO `shiyan` VALUES ('32', '设备4', null, null, '2019-03-12 20:34:44', '1', null, '设备', '充足', '5');
INSERT INTO `shiyan` VALUES ('33', '设备5', null, null, '2019-03-12 20:34:51', '1', null, '设备', '充足', '6');
INSERT INTO `shiyan` VALUES ('34', '设备6', null, null, '2019-03-12 20:35:00', '1', null, '设备', '充足', '1');
INSERT INTO `shiyan` VALUES ('35', '设备7', null, null, '2019-03-12 20:35:09', '1', null, '设备', '充足', '10');

-- ----------------------------
-- Table structure for sysuser
-- ----------------------------
DROP TABLE IF EXISTS `sysuser`;
CREATE TABLE `sysuser` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `utype` varchar(30) DEFAULT '会员' COMMENT '1 为正常使用， 0为删除',
  `tel` varchar(20) DEFAULT NULL,
  `pubtime` varchar(30) DEFAULT NULL,
  `tname` varchar(50) DEFAULT NULL,
  `isdel` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysuser
-- ----------------------------
INSERT INTO `sysuser` VALUES ('1', 'admin', null, null, '123', '管理员', '15671234789', '2018-03-04 21:39:52.66', null, '1');
INSERT INTO `sysuser` VALUES ('17', 'sysgly', '男', '重庆', '123456', '实验室管理员', '15523090298', '2019-02-23 10:21:20.363', '实验室管理员', '1');
INSERT INTO `sysuser` VALUES ('18', 'sbgly', '男', '重庆', '123456', '实验设备管理员', '15523090298', '2019-02-23 10:21:46.9', '实验室设备管理员', '1');
INSERT INTO `sysuser` VALUES ('19', 'ls1', '男', '重庆', '123456', '老师', '15523090298', '2019-02-23 10:22:12.385', '老师1', '1');
INSERT INTO `sysuser` VALUES ('23', 'coco', '男', '重庆', '123456', '实验设备管理员', '15523090298', '2019-03-13 16:14:25.29', 'coco', '1');
INSERT INTO `sysuser` VALUES ('24', 'yoyo', '男', '重庆', '123456', '实验室管理员', '15523090298', '2019-03-13 16:14:47.455', 'yoyo', '1');

-- ----------------------------
-- Table structure for sys_sb
-- ----------------------------
DROP TABLE IF EXISTS `sys_sb`;
CREATE TABLE `sys_sb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) DEFAULT NULL COMMENT '实验室id',
  `sbid` int(11) DEFAULT NULL COMMENT '设备id',
  `snum` int(11) DEFAULT NULL COMMENT '设备数量',
  `time` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '最近添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_sb
-- ----------------------------
INSERT INTO `sys_sb` VALUES ('12', '1', '22', '3', '2019-05-14 15:34:27');
INSERT INTO `sys_sb` VALUES ('13', '1', '23', '1', '2019-05-14 15:34:30');
INSERT INTO `sys_sb` VALUES ('14', '21', '22', '5', '2019-05-14 15:38:30');
INSERT INTO `sys_sb` VALUES ('15', '21', '23', '5', '2019-05-14 15:38:32');
INSERT INTO `sys_sb` VALUES ('16', '21', '34', '5', '2019-05-14 15:38:34');
