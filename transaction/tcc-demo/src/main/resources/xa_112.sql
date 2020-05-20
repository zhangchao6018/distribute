/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.1.112
 Source Server Type    : MySQL
 Source Server Version : 100408
 Source Host           : 192.168.1.112:3306
 Source Schema         : xa_112

 Target Server Type    : MySQL
 Target Server Version : 100408
 File Encoding         : 65001

 Date: 20/05/2020 18:38:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_b
-- ----------------------------
DROP TABLE IF EXISTS `account_b`;
CREATE TABLE `account_b` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of account_b
-- ----------------------------
BEGIN;
INSERT INTO `account_b` VALUES (1, '用户B', 1000.00);
COMMIT;

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int(11) NOT NULL,
  `order_status` int(1) DEFAULT 0 COMMENT '0:未支付  1:已支付',
  `order_amount` decimal(10,0) DEFAULT NULL,
  `receive_user` varchar(255) DEFAULT NULL,
  `receive_mobile` varchar(255) DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='可靠消息最终一致性-消息订单表  (消费端)';

-- ----------------------------
-- Records of t_order
-- ----------------------------
BEGIN;
INSERT INTO `t_order` VALUES (10010, 1, 100, '2', '18910101010', 1, '2020-05-20 16:28:43', 0, '2020-05-20 18:38:07');
COMMIT;

-- ----------------------------
-- Table structure for xa_112
-- ----------------------------
DROP TABLE IF EXISTS `xa_112`;
CREATE TABLE `xa_112` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;
