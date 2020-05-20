/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.1.111
 Source Server Type    : MySQL
 Source Server Version : 100408
 Source Host           : 192.168.1.111:3306
 Source Schema         : xa_111

 Target Server Type    : MySQL
 Target Server Version : 100408
 File Encoding         : 65001

 Date: 20/05/2020 18:38:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_a
-- ----------------------------
DROP TABLE IF EXISTS `account_a`;
CREATE TABLE `account_a` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of account_a
-- ----------------------------
BEGIN;
INSERT INTO `account_a` VALUES (1, '??A', 800.00);
COMMIT;

-- ----------------------------
-- Table structure for payment_msg
-- ----------------------------
DROP TABLE IF EXISTS `payment_msg`;
CREATE TABLE `payment_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT 0 COMMENT '0:未发送 1:发送成功  2:超过最大发送次数',
  `falure_cnt` int(1) DEFAULT 0 COMMENT '失败次数: 最大五次',
  `create_time` datetime DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='可靠消息最终一致性-消息表(生产端)';

-- ----------------------------
-- Records of payment_msg
-- ----------------------------
BEGIN;
INSERT INTO `payment_msg` VALUES (1, 10010, 2, 6, '2020-05-20 16:17:46', 1, '2020-05-20 16:47:30', 0);
COMMIT;

-- ----------------------------
-- Table structure for xa_111
-- ----------------------------
DROP TABLE IF EXISTS `xa_111`;
CREATE TABLE `xa_111` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;
