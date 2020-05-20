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

 Date: 20/05/2020 12:28:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_order_1
-- ----------------------------
DROP TABLE IF EXISTS `t_order_1`;
CREATE TABLE `t_order_1` (
  `id` int(11) NOT NULL,
  `order_amount` decimal(10,4) DEFAULT NULL,
  `order_status` int(2) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_order_2
-- ----------------------------
DROP TABLE IF EXISTS `t_order_2`;
CREATE TABLE `t_order_2` (
  `id` int(11) NOT NULL,
  `order_amount` decimal(10,4) DEFAULT NULL,
  `order_status` int(2) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_order_item_1
-- ----------------------------
DROP TABLE IF EXISTS `t_order_item_1`;
CREATE TABLE `t_order_item_1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_order_item_2
-- ----------------------------
DROP TABLE IF EXISTS `t_order_item_2`;
CREATE TABLE `t_order_item_2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;
