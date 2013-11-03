/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50612
Source Host           : localhost:3306
Source Database       : thinksns_3_1

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2013-11-02 22:05:04
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `ts_feed`
-- ----------------------------
DROP TABLE IF EXISTS `ts_feed`;
CREATE TABLE `ts_feed` (
  `feed_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '动态ID',
  `uid` int(11) NOT NULL COMMENT '产生动态的用户UID',
  `type` char(50) DEFAULT NULL COMMENT 'feed类型.由发表feed的程序控制',
  `app` char(30) DEFAULT 'public' COMMENT 'feed来源的appname',
  `app_row_table` varchar(50) NOT NULL DEFAULT 'feed' COMMENT '关联资源所在的表',
  `app_row_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联的来源ID（如博客的id）',
  `publish_time` int(11) NOT NULL COMMENT '产生时间戳',
  `is_del` int(2) NOT NULL DEFAULT '0' COMMENT '是否删除 默认为0',
  `from` tinyint(2) NOT NULL DEFAULT '0' COMMENT '客户端类型，0：网站；1：手机网页版；2：android；3：iphone',
  `comment_count` int(10) DEFAULT '0' COMMENT '评论数',
  `repost_count` int(10) DEFAULT '0' COMMENT '分享数',
  `comment_all_count` int(10) DEFAULT '0' COMMENT '全部评论数目',
  `digg_count` int(11) DEFAULT '0',
  `is_repost` int(2) DEFAULT '0' COMMENT '是否转发 0-否  1-是',
  `is_audit` int(2) DEFAULT '1' COMMENT '是否已审核 0-未审核 1-已审核',
  PRIMARY KEY (`feed_id`),
  KEY `is_del` (`is_del`,`publish_time`),
  KEY `uid` (`uid`,`is_del`,`publish_time`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_feed
-- ----------------------------
INSERT INTO `ts_feed` VALUES ('1', '1', 'post', 'public', 'feed', '0', '1383394138', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `ts_feed` VALUES ('2', '2', 'post', 'public', 'feed', '0', '1383394250', '0', '0', '2', '1', '2', '1', '0', '1');
INSERT INTO `ts_feed` VALUES ('3', '3', 'repost', 'public', 'feed', '2', '1383394321', '0', '0', '0', '0', '0', '0', '1', '1');
INSERT INTO `ts_feed` VALUES ('4', '2', 'postimage', 'public', 'feed', '0', '1383397641', '0', '0', '0', '1', '0', '0', '0', '1');
INSERT INTO `ts_feed` VALUES ('5', '3', 'repost', 'public', 'feed', '4', '1383398684', '0', '0', '0', '0', '0', '0', '1', '1');
INSERT INTO `ts_feed` VALUES ('6', '2', 'post', 'public', 'feed', '0', '1383399238', '0', '0', '0', '0', '0', '2', '0', '1');

-- ----------------------------
-- Table structure for `ts_feed_data`
-- ----------------------------
DROP TABLE IF EXISTS `ts_feed_data`;
CREATE TABLE `ts_feed_data` (
  `feed_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关联ts_feed表，feed_id',
  `feed_data` text COMMENT '关联ts_feed表，动态数据，序列化保存',
  `client_ip` char(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '客户端IP',
  `feed_content` text COMMENT '纯微博内容',
  `from_data` text COMMENT '微博来源',
  PRIMARY KEY (`feed_id`),
  KEY `feed_id` (`feed_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_feed_data
-- ----------------------------
INSERT INTO `ts_feed_data` VALUES ('1', 'a:16:{s:7:\"content\";s:5:\"adfad\";s:4:\"body\";s:5:\"adfad\";s:10:\"source_url\";s:0:\"\";s:9:\"attach_id\";s:0:\"\";s:3:\"uid\";i:1;s:3:\"app\";s:6:\"public\";s:4:\"type\";s:4:\"post\";s:10:\"app_row_id\";i:0;s:13:\"app_row_table\";s:4:\"feed\";s:12:\"publish_time\";i:1383394138;s:4:\"from\";s:1:\"0\";s:12:\"repost_count\";i:0;s:13:\"comment_count\";i:0;s:6:\"is_del\";i:0;s:9:\"is_repost\";i:0;s:8:\"is_audit\";i:1;}', '127.0.0.1', 'adfad', null);
INSERT INTO `ts_feed_data` VALUES ('2', 'a:16:{s:7:\"content\";s:23:\"867765846@qq.com/123456\";s:4:\"body\";s:23:\"867765846@qq.com/123456\";s:10:\"source_url\";s:0:\"\";s:9:\"attach_id\";s:0:\"\";s:3:\"uid\";i:2;s:3:\"app\";s:6:\"public\";s:4:\"type\";s:4:\"post\";s:10:\"app_row_id\";i:0;s:13:\"app_row_table\";s:4:\"feed\";s:12:\"publish_time\";i:1383394250;s:4:\"from\";s:1:\"0\";s:12:\"repost_count\";i:0;s:13:\"comment_count\";i:0;s:6:\"is_del\";i:0;s:9:\"is_repost\";i:0;s:8:\"is_audit\";i:1;}', '127.0.0.1', '867765846@qq.com/123456', null);
INSERT INTO `ts_feed_data` VALUES ('3', 'a:16:{s:7:\"content\";s:3:\"hao\";s:4:\"body\";s:3:\"hao\";s:10:\"sourceInfo\";a:36:{s:7:\"feed_id\";s:1:\"2\";s:3:\"uid\";s:1:\"2\";s:4:\"type\";s:4:\"post\";s:3:\"app\";s:6:\"public\";s:13:\"app_row_table\";s:4:\"feed\";s:10:\"app_row_id\";s:1:\"0\";s:12:\"publish_time\";s:10:\"1383394250\";s:6:\"is_del\";s:1:\"0\";s:4:\"from\";s:1:\"0\";s:13:\"comment_count\";s:1:\"0\";s:12:\"repost_count\";s:1:\"0\";s:17:\"comment_all_count\";s:1:\"0\";s:10:\"digg_count\";s:1:\"1\";s:9:\"is_repost\";s:1:\"0\";s:8:\"is_audit\";s:1:\"1\";s:9:\"client_ip\";s:9:\"127.0.0.1\";s:12:\"feed_content\";s:23:\"867765846@qq.com/123456\";s:9:\"from_data\";N;s:5:\"ctime\";s:10:\"1383394250\";s:5:\"uname\";s:6:\"samsky\";s:10:\"user_group\";a:0:{}s:10:\"avatar_big\";s:74:\"http://localhost/ThinkSNS/addons/theme/stv1/_static/image/noavatar/big.jpg\";s:13:\"avatar_middle\";s:77:\"http://localhost/ThinkSNS/addons/theme/stv1/_static/image/noavatar/middle.jpg\";s:12:\"avatar_small\";s:76:\"http://localhost/ThinkSNS/addons/theme/stv1/_static/image/noavatar/small.jpg\";s:10:\"has_attach\";i:0;s:8:\"feedType\";s:4:\"post\";s:11:\"source_body\";s:23:\"867765846@qq.com/123456\";s:10:\"api_source\";N;s:16:\"source_user_info\";a:43:{s:3:\"uid\";s:1:\"2\";s:5:\"login\";s:16:\"867765846@qq.com\";s:10:\"login_salt\";s:5:\"57581\";s:5:\"uname\";s:6:\"samsky\";s:5:\"email\";s:16:\"867765846@qq.com\";s:3:\"sex\";s:1:\"1\";s:8:\"location\";s:29:\"湖南省 长沙市 长沙县\";s:8:\"is_audit\";s:1:\"1\";s:9:\"is_active\";s:1:\"1\";s:7:\"is_init\";s:1:\"1\";s:5:\"ctime\";s:10:\"1383394218\";s:8:\"identity\";s:1:\"1\";s:7:\"api_key\";N;s:6:\"domain\";s:0:\"\";s:8:\"province\";s:6:\"430000\";s:4:\"city\";s:6:\"430100\";s:4:\"area\";s:6:\"430121\";s:6:\"reg_ip\";s:9:\"127.0.0.1\";s:4:\"lang\";s:5:\"zh-cn\";s:8:\"timezone\";s:3:\"PRC\";s:6:\"is_del\";s:1:\"0\";s:12:\"first_letter\";s:1:\"S\";s:5:\"intro\";N;s:15:\"last_login_time\";s:10:\"1383394218\";s:12:\"last_feed_id\";s:1:\"0\";s:14:\"last_post_time\";s:1:\"0\";s:10:\"search_key\";s:6:\"samsky\";s:11:\"invite_code\";N;s:15:\"feed_email_time\";N;s:15:\"send_email_time\";N;s:15:\"avatar_original\";s:74:\"http://localhost/ThinkSNS/addons/theme/stv1/_static/image/noavatar/big.jpg\";s:10:\"avatar_big\";s:74:\"http://localhost/ThinkSNS/addons/theme/stv1/_static/image/noavatar/big.jpg\";s:13:\"avatar_middle\";s:77:\"http://localhost/ThinkSNS/addons/theme/stv1/_static/image/noavatar/middle.jpg\";s:12:\"avatar_small\";s:76:\"http://localhost/ThinkSNS/addons/theme/stv1/_static/image/noavatar/small.jpg\";s:11:\"avatar_tiny\";s:75:\"http://localhost/ThinkSNS/addons/theme/stv1/_static/image/noavatar/tiny.jpg\";s:10:\"avatar_url\";s:74:\"http://localhost/ThinkSNS/index.php?app=public&mod=Attach&act=avatar&uid=2\";s:9:\"space_url\";s:74:\"http://localhost/ThinkSNS/index.php?app=public&mod=Profile&act=index&uid=2\";s:10:\"space_link\";s:142:\"<a href=\'http://localhost/ThinkSNS/index.php?app=public&mod=Profile&act=index&uid=2\' target=\'_blank\' uid=\'2\' event-node=\'face_card\'>samsky</a>\";s:13:\"space_link_no\";s:126:\"<a href=\'http://localhost/ThinkSNS/index.php?app=public&mod=Profile&act=index&uid=2\' title=\'samsky\' target=\'_blank\'>samsky</a>\";s:6:\"medals\";a:0:{}s:14:\"api_user_group\";a:0:{}s:10:\"user_group\";a:0:{}s:10:\"group_icon\";s:0:\"\";}s:11:\"source_user\";s:142:\"<a href=\'http://localhost/ThinkSNS/index.php?app=public&mod=Profile&act=index&uid=2\' target=\'_blank\' uid=\'2\' event-node=\'face_card\'>samsky</a>\";s:11:\"source_type\";s:6:\"微博\";s:12:\"source_title\";N;s:10:\"source_url\";s:83:\"http://localhost/ThinkSNS/index.php?app=public&mod=Profile&act=feed&feed_id=2&uid=2\";s:14:\"source_content\";s:23:\"867765846@qq.com/123456\";s:12:\"source_table\";s:4:\"feed\";s:9:\"source_id\";s:1:\"2\";}s:5:\"curid\";s:1:\"2\";s:4:\"from\";i:0;s:3:\"uid\";i:3;s:3:\"app\";s:6:\"public\";s:4:\"type\";s:6:\"repost\";s:10:\"app_row_id\";s:1:\"2\";s:13:\"app_row_table\";s:4:\"feed\";s:12:\"publish_time\";i:1383394321;s:12:\"repost_count\";i:0;s:13:\"comment_count\";i:0;s:6:\"is_del\";i:0;s:9:\"is_repost\";i:1;s:8:\"is_audit\";i:1;}', '127.0.0.1', 'hao', null);
INSERT INTO `ts_feed_data` VALUES ('4', 'a:16:{s:7:\"content\";s:12:\"试试图片\";s:4:\"body\";s:12:\"试试图片\";s:10:\"source_url\";s:0:\"\";s:9:\"attach_id\";a:1:{i:0;s:2:\"73\";}s:3:\"uid\";i:2;s:3:\"app\";s:6:\"public\";s:4:\"type\";s:9:\"postimage\";s:10:\"app_row_id\";i:0;s:13:\"app_row_table\";s:4:\"feed\";s:12:\"publish_time\";i:1383397641;s:4:\"from\";s:1:\"0\";s:12:\"repost_count\";i:0;s:13:\"comment_count\";i:0;s:6:\"is_del\";i:0;s:9:\"is_repost\";i:0;s:8:\"is_audit\";i:1;}', '127.0.0.1', '试试图片', null);
INSERT INTO `ts_feed_data` VALUES ('5', 'a:16:{s:7:\"content\";s:16:\"picture is good.\";s:4:\"body\";s:16:\"picture is good.\";s:10:\"sourceInfo\";a:37:{s:7:\"feed_id\";s:1:\"4\";s:3:\"uid\";s:1:\"2\";s:4:\"type\";s:9:\"postimage\";s:3:\"app\";s:6:\"public\";s:13:\"app_row_table\";s:4:\"feed\";s:10:\"app_row_id\";s:1:\"0\";s:12:\"publish_time\";s:10:\"1383397641\";s:6:\"is_del\";s:1:\"0\";s:4:\"from\";s:1:\"0\";s:13:\"comment_count\";s:1:\"0\";s:12:\"repost_count\";s:1:\"0\";s:17:\"comment_all_count\";s:1:\"0\";s:10:\"digg_count\";s:1:\"0\";s:9:\"is_repost\";s:1:\"0\";s:8:\"is_audit\";s:1:\"1\";s:9:\"client_ip\";s:9:\"127.0.0.1\";s:12:\"feed_content\";s:12:\"试试图片\";s:9:\"from_data\";N;s:5:\"ctime\";s:10:\"1383397641\";s:5:\"uname\";s:6:\"samsky\";s:10:\"user_group\";a:0:{}s:10:\"avatar_big\";s:74:\"http://localhost/ThinkSNS/addons/theme/stv1/_static/image/noavatar/big.jpg\";s:13:\"avatar_middle\";s:77:\"http://localhost/ThinkSNS/addons/theme/stv1/_static/image/noavatar/middle.jpg\";s:12:\"avatar_small\";s:76:\"http://localhost/ThinkSNS/addons/theme/stv1/_static/image/noavatar/small.jpg\";s:10:\"has_attach\";i:1;s:6:\"attach\";a:1:{i:0;a:7:{s:9:\"attach_id\";s:2:\"73\";s:11:\"attach_name\";s:39:\"52度洋河蓝色经典海之蓝(2).jpg\";s:10:\"attach_url\";s:68:\"http://localhost/ThinkSNS/data/upload/2013/1102/21/5274f905b907d.jpg\";s:9:\"extension\";s:3:\"jpg\";s:4:\"size\";s:5:\"48894\";s:12:\"attach_small\";s:76:\"http://localhost/ThinkSNS/data/upload/2013/1102/21/5274f905b907d_100_100.jpg\";s:13:\"attach_middle\";s:77:\"http://localhost/ThinkSNS/data/upload/2013/1102/21/5274f905b907d_550_auto.jpg\";}}s:8:\"feedType\";s:9:\"postimage\";s:11:\"source_body\";s:1353:\"试试图片			<br/>\n			<div class=\"feed_img_lists\" rel=\'small\' >\n			<ul class=\"small\">\n						<li ><a href=\"javascript:void(0)\" event-node=\'img_small\'>\n					<img class=\"imgicon\" src=\'http://localhost/ThinkSNS/data/upload/2013/1102/21/5274f905b907d_100_100.jpg\' title=\'点击放大\' width=\"100\" height=\"100\"></a>\n				</li>						</ul>\n			</div>\n			<div class=\"feed_img_lists\" rel=\'big\' style=\'display:none\'>\n			<ul class=\"feed_img_list big\" >\n			<span class=\'tools\'>\n				<a href=\"javascript:;\" event-node=\'img_big\'><i class=\"ico-pack-up\"></i>收起</a>\n				<a target=\"_blank\" href=\"http://localhost/ThinkSNS/data/upload/2013/1102/21/5274f905b907d.jpg\"><i class=\"ico-show-big\"></i>查看大图</a>\n				<a href=\"javascript:;\" onclick=\"revolving(\'left\', 4)\"><i class=\"ico-turn-l\"></i>向左转</a>\n				<a href=\"javascript:;\" onclick=\"revolving(\'right\', 4)\"><i class=\"ico-turn-r\"></i>向右转</a>\n			</span>\n			<li title=\'http://localhost/ThinkSNS/data/upload/2013/1102/21/5274f905b907d.jpg\'>\n				<!-- <a onclick=\"core.weibo.showBigImage(4);\" target=\"_blank\" class=\"ico-show-big\" title=\"查看大图\" ></a> -->\n				<a href=\"javascript:void(0)\" event-node=\'img_big\'><img maxwidth=\"557\" id=\"image_index_4\" class=\"imgsmall\" src=\'http://localhost/ThinkSNS/data/upload/2013/1102/21/5274f905b907d_550_auto.jpg\' title=\'点击缩小\' ></a>\n			</li>			</ul>\n			</div>\";s:10:\"api_source\";N;s:16:\"source_user_info\";a:43:{s:3:\"uid\";s:1:\"2\";s:5:\"login\";s:16:\"867765846@qq.com\";s:10:\"login_salt\";s:5:\"57581\";s:5:\"uname\";s:6:\"samsky\";s:5:\"email\";s:16:\"867765846@qq.com\";s:3:\"sex\";s:1:\"1\";s:8:\"location\";s:29:\"湖南省 长沙市 长沙县\";s:8:\"is_audit\";s:1:\"1\";s:9:\"is_active\";s:1:\"1\";s:7:\"is_init\";s:1:\"1\";s:5:\"ctime\";s:10:\"1383394218\";s:8:\"identity\";s:1:\"1\";s:7:\"api_key\";N;s:6:\"domain\";s:0:\"\";s:8:\"province\";s:6:\"430000\";s:4:\"city\";s:6:\"430100\";s:4:\"area\";s:6:\"430121\";s:6:\"reg_ip\";s:9:\"127.0.0.1\";s:4:\"lang\";s:5:\"zh-cn\";s:8:\"timezone\";s:3:\"PRC\";s:6:\"is_del\";s:1:\"0\";s:12:\"first_letter\";s:1:\"S\";s:5:\"intro\";N;s:15:\"last_login_time\";s:10:\"1383394218\";s:12:\"last_feed_id\";s:1:\"0\";s:14:\"last_post_time\";s:1:\"0\";s:10:\"search_key\";s:6:\"samsky\";s:11:\"invite_code\";N;s:15:\"feed_email_time\";N;s:15:\"send_email_time\";N;s:15:\"avatar_original\";s:74:\"http://localhost/ThinkSNS/addons/theme/stv1/_static/image/noavatar/big.jpg\";s:10:\"avatar_big\";s:74:\"http://localhost/ThinkSNS/addons/theme/stv1/_static/image/noavatar/big.jpg\";s:13:\"avatar_middle\";s:77:\"http://localhost/ThinkSNS/addons/theme/stv1/_static/image/noavatar/middle.jpg\";s:12:\"avatar_small\";s:76:\"http://localhost/ThinkSNS/addons/theme/stv1/_static/image/noavatar/small.jpg\";s:11:\"avatar_tiny\";s:75:\"http://localhost/ThinkSNS/addons/theme/stv1/_static/image/noavatar/tiny.jpg\";s:10:\"avatar_url\";s:74:\"http://localhost/ThinkSNS/index.php?app=public&mod=Attach&act=avatar&uid=2\";s:9:\"space_url\";s:74:\"http://localhost/ThinkSNS/index.php?app=public&mod=Profile&act=index&uid=2\";s:10:\"space_link\";s:142:\"<a href=\'http://localhost/ThinkSNS/index.php?app=public&mod=Profile&act=index&uid=2\' target=\'_blank\' uid=\'2\' event-node=\'face_card\'>samsky</a>\";s:13:\"space_link_no\";s:126:\"<a href=\'http://localhost/ThinkSNS/index.php?app=public&mod=Profile&act=index&uid=2\' title=\'samsky\' target=\'_blank\'>samsky</a>\";s:6:\"medals\";a:0:{}s:14:\"api_user_group\";a:0:{}s:10:\"user_group\";a:0:{}s:10:\"group_icon\";s:0:\"\";}s:11:\"source_user\";s:142:\"<a href=\'http://localhost/ThinkSNS/index.php?app=public&mod=Profile&act=index&uid=2\' target=\'_blank\' uid=\'2\' event-node=\'face_card\'>samsky</a>\";s:11:\"source_type\";s:6:\"微博\";s:12:\"source_title\";N;s:10:\"source_url\";s:83:\"http://localhost/ThinkSNS/index.php?app=public&mod=Profile&act=feed&feed_id=4&uid=2\";s:14:\"source_content\";s:12:\"试试图片\";s:12:\"source_table\";s:4:\"feed\";s:9:\"source_id\";s:1:\"4\";}s:5:\"curid\";s:1:\"4\";s:4:\"from\";i:0;s:3:\"uid\";i:3;s:3:\"app\";s:6:\"public\";s:4:\"type\";s:6:\"repost\";s:10:\"app_row_id\";s:1:\"4\";s:13:\"app_row_table\";s:4:\"feed\";s:12:\"publish_time\";i:1383398684;s:12:\"repost_count\";i:0;s:13:\"comment_count\";i:0;s:6:\"is_del\";i:0;s:9:\"is_repost\";i:1;s:8:\"is_audit\";i:1;}', '127.0.0.1', 'picture is good.', null);
INSERT INTO `ts_feed_data` VALUES ('6', 'a:16:{s:7:\"content\";s:21:\"赞记录在哪里？\";s:4:\"body\";s:21:\"赞记录在哪里？\";s:10:\"source_url\";s:0:\"\";s:9:\"attach_id\";s:0:\"\";s:3:\"uid\";i:2;s:3:\"app\";s:6:\"public\";s:4:\"type\";s:4:\"post\";s:10:\"app_row_id\";i:0;s:13:\"app_row_table\";s:4:\"feed\";s:12:\"publish_time\";i:1383399238;s:4:\"from\";s:1:\"0\";s:12:\"repost_count\";i:0;s:13:\"comment_count\";i:0;s:6:\"is_del\";i:0;s:9:\"is_repost\";i:0;s:8:\"is_audit\";i:1;}', '127.0.0.1', '赞记录在哪里？', null);

-- ----------------------------
-- Table structure for `ts_feed_digg`
-- ----------------------------
DROP TABLE IF EXISTS `ts_feed_digg`;
CREATE TABLE `ts_feed_digg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `feed_id` int(11) NOT NULL,
  `cTime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_feed_digg
-- ----------------------------
INSERT INTO `ts_feed_digg` VALUES ('1', '3', '2', '1383394317');
INSERT INTO `ts_feed_digg` VALUES ('2', '3', '6', '1383399246');
INSERT INTO `ts_feed_digg` VALUES ('3', '4', '6', '1383399417');
