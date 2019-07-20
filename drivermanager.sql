/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50717
Source Host           : 127.0.0.1:3306
Source Database       : drivermanager

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2019-07-19 13:52:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for debittable
-- ----------------------------
DROP TABLE IF EXISTS `debittable`;
CREATE TABLE `debittable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL,
  `d_id` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `flageStatus` int(11) DEFAULT NULL,
  `user_message` varchar(255) DEFAULT NULL,
  `admin_message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `debittable_ibfk_1` (`u_id`),
  KEY `debittable_ibfk_2` (`d_id`),
  CONSTRAINT `debittable_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`id`),
  CONSTRAINT `debittable_ibfk_2` FOREIGN KEY (`d_id`) REFERENCES `driver` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of debittable
-- ----------------------------
INSERT INTO `debittable` VALUES ('4', '2', '1', '2', '1', 'ie', ' d dyj');

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', '物理');
INSERT INTO `dept` VALUES ('2', '化学');

-- ----------------------------
-- Table structure for driver
-- ----------------------------
DROP TABLE IF EXISTS `driver`;
CREATE TABLE `driver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `driver_name` varchar(255) DEFAULT NULL,
  `driver_number` int(11) DEFAULT NULL,
  `driver_desc` varchar(255) DEFAULT NULL,
  `driver_way` varchar(255) DEFAULT NULL,
  `d_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `d_id` (`d_id`),
  CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `dept` (`dept_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of driver
-- ----------------------------
INSERT INTO `driver` VALUES ('1', '漏斗1', '2', '节水用的!', 'no way', '1');
INSERT INTO `driver` VALUES ('2', '漏斗2', '2', '34435', '不知道', '2');
INSERT INTO `driver` VALUES ('3', '漏斗1', '2', '节水用的!', '不知道', '1');
INSERT INTO `driver` VALUES ('4', '漏斗2', '2', '节水用的!', '不知道', '2');
INSERT INTO `driver` VALUES ('5', '漏斗1', '2', '节水用的!', '不知道', '1');
INSERT INTO `driver` VALUES ('6', '漏斗2', '0', '节水用的!', '不知道', '2');
INSERT INTO `driver` VALUES ('7', '漏斗1', '1', '节水用的!', '不知道', '1');
INSERT INTO `driver` VALUES ('8', '漏斗2', '2', '节水用的!', '不知道', '2');
INSERT INTO `driver` VALUES ('9', '漏斗1', '2', '节水用的!', '不知道', '1');
INSERT INTO `driver` VALUES ('10', '漏斗2', '2', '节水用的!', '不知道', '2');
INSERT INTO `driver` VALUES ('11', '漏斗1', '2', '节水用的!', '不知道', '1');
INSERT INTO `driver` VALUES ('12', '漏斗2', '2', '节水用的!', '不知道', '2');
INSERT INTO `driver` VALUES ('13', '漏斗1', '2', '节水用的!', '不知道', '1');
INSERT INTO `driver` VALUES ('14', '漏斗2', '2', '节水用的!', '不知道', '2');
INSERT INTO `driver` VALUES ('16', '漏斗2', '2', '节水用的!', '不知道', '2');
INSERT INTO `driver` VALUES ('17', '漏斗1', '2', '节水用的!', '不知道', '1');
INSERT INTO `driver` VALUES ('18', '漏斗2', '2', '节水用的!', '不知道', '2');
INSERT INTO `driver` VALUES ('19', '漏斗1', '2', '节水用的!', '不知道', '1');
INSERT INTO `driver` VALUES ('20', '漏斗2', '2', '节水用的!', '不知道', '2');
INSERT INTO `driver` VALUES ('21', '漏斗1', '2', '节水用的!', '不知道', '1');
INSERT INTO `driver` VALUES ('22', '漏斗2', '2', '节水用的!', '不知道', '2');
INSERT INTO `driver` VALUES ('23', '漏斗1', '2', '节水用的!', '不知道', '1');
INSERT INTO `driver` VALUES ('24', '漏斗2', '2', '节水用的!', '不知道', '2');
INSERT INTO `driver` VALUES ('27', '漏斗4', '5', 'save money', 'no way', '2');
INSERT INTO `driver` VALUES ('28', '漏斗3', '4', 'save money', 'no way', '1');
INSERT INTO `driver` VALUES ('29', '漏斗4', '5', 'save money', 'no way', '2');
INSERT INTO `driver` VALUES ('30', '漏斗3', '4', 'save money', 'no way', '1');
INSERT INTO `driver` VALUES ('31', '漏斗4', '5', 'save money', 'no way', '2');
INSERT INTO `driver` VALUES ('32', '漏斗3', '4', 'save money', 'no way', '1');
INSERT INTO `driver` VALUES ('33', '漏斗4', '5', 'save money', 'no way', '2');
INSERT INTO `driver` VALUES ('34', '漏斗3', '4', 'save money', 'no way', '1');
INSERT INTO `driver` VALUES ('35', '漏斗4', '5', 'save money', 'no way', '2');
INSERT INTO `driver` VALUES ('36', '漏斗3', '4', 'save money', 'no way', '1');
INSERT INTO `driver` VALUES ('37', '漏斗4', '5', 'save money', 'no way', '2');
INSERT INTO `driver` VALUES ('38', '漏斗3', '4', 'save money', 'no way', '1');
INSERT INTO `driver` VALUES ('39', '漏斗4', '5', 'save money', 'no way', '2');
INSERT INTO `driver` VALUES ('40', '漏斗3', '4', 'save money', 'no way', '1');
INSERT INTO `driver` VALUES ('41', '漏斗4', '5', 'save money', 'no way', '2');
INSERT INTO `driver` VALUES ('42', '漏斗3', '4', 'save money', 'no way', '1');
INSERT INTO `driver` VALUES ('43', '漏斗4', '5', 'save money', 'no way', '2');
INSERT INTO `driver` VALUES ('44', '漏斗3', '4', 'save money', 'no way', '1');
INSERT INTO `driver` VALUES ('45', '漏斗4', '5', 'save money', 'no way', '2');
INSERT INTO `driver` VALUES ('46', '漏斗3', '4', 'save money', 'no way', '1');
INSERT INTO `driver` VALUES ('47', '漏斗4', '5', 'save money', 'no way', '2');
INSERT INTO `driver` VALUES ('48', '漏斗3', '4', 'save money', 'no way', '1');
INSERT INTO `driver` VALUES ('49', '漏斗4', '5', 'save ', 'no way', '2');
INSERT INTO `driver` VALUES ('50', '漏斗3', '4', 'save money', 'no way', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123', '111', '1');
INSERT INTO `user` VALUES ('2', '2016215191', '123', '1111', '0');
