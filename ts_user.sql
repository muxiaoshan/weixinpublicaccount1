/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50612
Source Host           : localhost:3306
Source Database       : thinksns_3_1

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2013-11-02 22:18:26
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `ts_user`
-- ----------------------------
DROP TABLE IF EXISTS `ts_user`;
CREATE TABLE `ts_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键UID',
  `login` varchar(255) DEFAULT NULL COMMENT '登录emial',
  `password` varchar(255) DEFAULT NULL COMMENT '用户密码的md5摘要',
  `login_salt` char(5) DEFAULT NULL COMMENT '10000 到 99999之间的随机数，加密密码时使用',
  `uname` varchar(255) DEFAULT NULL COMMENT '用户名',
  `email` varchar(255) DEFAULT NULL COMMENT '用户email',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别 1：男、2：女',
  `location` varchar(255) DEFAULT NULL COMMENT '所在省市的字符串',
  `is_audit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否通过审核：0-未通过，1-已通过',
  `is_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已激活 1：激活、0：未激活',
  `is_init` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否初始化用户资料 1：初始化、0：未初始化',
  `ctime` int(11) DEFAULT NULL COMMENT '注册时间',
  `identity` tinyint(1) NOT NULL DEFAULT '1' COMMENT '身份标识（1：用户，2：组织）',
  `api_key` varchar(255) DEFAULT NULL COMMENT '用户的api_key用于移动端',
  `domain` char(80) NOT NULL COMMENT '保留字段，用于用户分表',
  `province` mediumint(6) NOT NULL DEFAULT '0' COMMENT '省ID、关联ts_area表',
  `city` int(5) NOT NULL COMMENT '城市ID，关联ts_area表',
  `area` int(5) NOT NULL COMMENT '地区ID，关联ts_area表',
  `reg_ip` varchar(64) DEFAULT '127.0.0.1' COMMENT '册注IP',
  `lang` varchar(64) DEFAULT 'zh-cn' COMMENT '言语',
  `timezone` varchar(10) DEFAULT 'PRC' COMMENT '时区',
  `is_del` tinyint(2) NOT NULL COMMENT '是否禁用，0不禁用，1：禁用',
  `first_letter` char(1) DEFAULT NULL COMMENT '用户名称的首字母',
  `intro` varchar(255) DEFAULT NULL COMMENT '户用简介',
  `last_login_time` int(11) DEFAULT '0' COMMENT '户用最后一次登录时间',
  `last_feed_id` int(11) DEFAULT '0' COMMENT '户用最后发表的微博ID',
  `last_post_time` int(11) NOT NULL DEFAULT '0' COMMENT '户用最后发表微博的时间',
  `search_key` varchar(500) DEFAULT NULL COMMENT '搜索字段',
  `invite_code` varchar(120) DEFAULT NULL COMMENT '邀请注册码',
  `feed_email_time` int(11) DEFAULT NULL,
  `send_email_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `email` (`email`),
  KEY `login` (`login`),
  KEY `uname` (`uname`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_user
-- ----------------------------
INSERT INTO `ts_user` VALUES ('1', 'admin@admin.com', 'd46b5dd007cca4ad3ee2a521dd26dcb3', '11111', '管理员', 'admin@admin.com', '1', '北京市 北京市 海淀区', '1', '1', '1', '1383393494', '1', '', '', '110000', '110100', '110108', '127.0.0.1', 'zh-cn', 'PRC', '0', 'G', '', '1383393833', '1', '1383394138', '管理员 guanliyuan', '', '1383399368', '0');
INSERT INTO `ts_user` VALUES ('2', '867765846@qq.com', 'eaa505212bc7bb2a2d94734d9152cb55', '57581', 'samsky', '867765846@qq.com', '1', '湖南省 长沙市 长沙县', '1', '1', '1', '1383394218', '1', null, '', '430000', '430100', '430121', '127.0.0.1', 'zh-cn', 'PRC', '0', 'S', null, '1383394687', '6', '1383399237', 'samsky', null, '1383399368', null);
INSERT INTO `ts_user` VALUES ('3', '294865807@qq.com', '40569a3142e6d4e9709ea318e0b6e628', '88799', '山的那边', '294865807@qq.com', '1', '湖南省 长沙市 长沙县', '1', '1', '1', '1383394297', '1', null, '', '430000', '430100', '430121', '127.0.0.1', 'zh-cn', 'PRC', '0', 'S', null, '1383394297', '0', '0', '山的那边 shandenabian', null, '1383399368', null);
INSERT INTO `ts_user` VALUES ('4', 'muxiaoshan@126.com', '4a9a3ba4b3ea29b1634fae8d2e27e3e1', '70339', 'muxiaoshan', 'muxiaoshan@126.com', '1', '湖南省 长沙市 长沙县', '1', '1', '1', '1383399401', '1', null, '', '430000', '430100', '430121', '127.0.0.1', 'zh-cn', 'PRC', '0', 'M', null, '1383399401', '0', '0', 'muxiaoshan', null, null, null);
