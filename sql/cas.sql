/*
 Navicat Premium Data Transfer

 Source Server         : 10.10.111.12
 Source Server Type    : MySQL
 Source Server Version : 50621
 Source Host           : 10.10.111.12:3306
 Source Schema         : orderlinessB

 Target Server Type    : MySQL
 Target Server Version : 50621
 File Encoding         : 65001

 Date: 22/06/2018 15:49:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for uum_app
-- ----------------------------
DROP TABLE IF EXISTS `uum_app`;
CREATE TABLE `uum_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(64) NOT NULL COMMENT '执行器AppName',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_name` (`app_name`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uum_role
-- ----------------------------
DROP TABLE IF EXISTS `uum_role`;
CREATE TABLE `uum_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '角色名称',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Table structure for uum_user
-- ----------------------------
DROP TABLE IF EXISTS `uum_user`;
CREATE TABLE `uum_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `username` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `email` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username_index` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Table structure for uum_user_app
-- ----------------------------
DROP TABLE IF EXISTS `uum_user_app`;
CREATE TABLE `uum_user_app` (
  `user_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户执行器关系表';

-- ----------------------------
-- Table structure for uum_user_role
-- ----------------------------
DROP TABLE IF EXISTS `uum_user_role`;
CREATE TABLE `uum_user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色关系表';

SET FOREIGN_KEY_CHECKS = 1;
