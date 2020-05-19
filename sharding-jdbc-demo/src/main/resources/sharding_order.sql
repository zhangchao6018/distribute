/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.1.111
 Source Server Type    : MySQL
 Source Server Version : 100408
 Source Host           : 192.168.1.111:3306
 Source Schema         : sharding_order

 Target Server Type    : MySQL
 Target Server Version : 100408
 File Encoding         : 65001

 Date: 18/05/2020 01:04:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_order_1
-- ----------------------------
DROP TABLE IF EXISTS `t_order_1`;
CREATE TABLE `t_order_1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_amount` decimal(10,4) DEFAULT NULL,
  `order_status` int(2) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_order_2
-- ----------------------------
DROP TABLE IF EXISTS `t_order_2`;
CREATE TABLE `t_order_2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_amount` decimal(10,4) DEFAULT NULL,
  `order_status` int(2) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;
