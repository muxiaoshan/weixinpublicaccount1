/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50612
Source Host           : localhost:3306
Source Database       : thinksns_3_1

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2013-11-02 23:05:26
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `ts_ad`
-- ----------------------------
DROP TABLE IF EXISTS `ts_ad`;
CREATE TABLE `ts_ad` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '广告ID，主键',
  `title` varchar(255) DEFAULT NULL COMMENT '广告标题',
  `place` tinyint(1) NOT NULL DEFAULT '0' COMMENT '广告位置：0-中部；1-头部；2-左下；3-右下；4-底部；5-右上；',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效；0-无效；1-有效；',
  `is_closable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否关闭，目前没有使用。',
  `ctime` int(11) DEFAULT NULL COMMENT '创建时间',
  `mtime` int(11) DEFAULT NULL COMMENT '更新时间',
  `display_order` smallint(2) NOT NULL DEFAULT '0' COMMENT '排序值',
  `display_type` tinyint(1) unsigned DEFAULT '1' COMMENT '广告类型：1 - HTML；2 - 代码；3 - 轮播',
  `content` text COMMENT '广告位内容',
  PRIMARY KEY (`ad_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_ad
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_addons`
-- ----------------------------
DROP TABLE IF EXISTS `ts_addons`;
CREATE TABLE `ts_addons` (
  `addonId` int(4) unsigned NOT NULL AUTO_INCREMENT COMMENT '插件id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '插件文件夹名',
  `pluginName` varchar(255) NOT NULL DEFAULT '' COMMENT '插件在后台显示的名字',
  `author` varchar(255) NOT NULL DEFAULT '' COMMENT '插件作者',
  `info` tinytext COMMENT '插件信息',
  `version` varchar(50) DEFAULT NULL COMMENT '插件版本',
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '插件状态。0为未启用，1为启用',
  `lastupdate` varchar(255) DEFAULT '' COMMENT '最后更新时间',
  `site` varchar(255) DEFAULT NULL COMMENT '插件作者的网站',
  `tsVersion` varchar(11) NOT NULL DEFAULT '2.5' COMMENT '依赖ts的版本。预留。必填',
  PRIMARY KEY (`addonId`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_addons
-- ----------------------------
INSERT INTO `ts_addons` VALUES ('1', 'SpaceStyle', '空间换肤 - 官方优化版', '智士软件', '用户自定义风格官方优化版', '2.0', '1', '', '', '3.0');
INSERT INTO `ts_addons` VALUES ('2', 'RelatedUser', '可能感兴趣的人', 't3', '根据当前用户推荐可能感兴趣的人', '3.0', '0', '', '', '3.0');

-- ----------------------------
-- Table structure for `ts_app`
-- ----------------------------
DROP TABLE IF EXISTS `ts_app`;
CREATE TABLE `ts_app` (
  `app_id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL COMMENT 'app名称',
  `app_alias` varchar(255) NOT NULL COMMENT 'app别名',
  `description` text COMMENT '描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0:''关闭'',1:开启',
  `host_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0，1',
  `app_entry` varchar(255) DEFAULT NULL COMMENT '前台入口，例：''Index/index''',
  `icon_url` varchar(255) DEFAULT NULL COMMENT '图标',
  `large_icon_url` varchar(255) DEFAULT NULL COMMENT '图标地址',
  `admin_entry` varchar(255) DEFAULT NULL COMMENT '后台管理地址',
  `statistics_entry` varchar(255) DEFAULT NULL COMMENT '接口地址',
  `display_order` smallint(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `ctime` int(11) DEFAULT NULL COMMENT '安装时间戳',
  `version` varchar(255) DEFAULT NULL COMMENT '版本号',
  `api_key` varchar(255) DEFAULT NULL COMMENT '用户api_key',
  `secure_key` varchar(255) DEFAULT NULL COMMENT 'API密钥',
  `company_name` varchar(255) NOT NULL COMMENT '公司名称',
  `has_mobile` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否有移动客户端.0:无，1有',
  `child_menu` text NOT NULL COMMENT '子导航数据',
  `add_front_top` tinyint(1) DEFAULT '1',
  `add_front_applist` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`app_id`),
  KEY `app_name` (`app_name`),
  KEY `status_id` (`app_id`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_app
-- ----------------------------
INSERT INTO `ts_app` VALUES ('5', 'channel', '频道', '频道', '1', '0', 'Index/index', '', '', 'channel/Admin/index', 'Statistics/statistics', '5', '1352520034', '', '', '', '智士软件', '1', 'a:1:{s:7:\"channel\";a:2:{s:3:\"url\";s:19:\"channel/Index/index\";s:6:\"public\";i:0;}}', '1', '1');
INSERT INTO `ts_app` VALUES ('3', 'weiba', '微吧', '微吧', '1', '0', 'Index/index', '', '', 'weiba/Admin/index', 'Statistics/statistics', '3', '1352256442', '1.0', '', '', '智士软件', '1', 'a:1:{s:5:\"weiba\";a:2:{s:3:\"url\";s:19:\"weiba/Index/myWeiba\";s:6:\"public\";i:0;}}', '1', '1');
INSERT INTO `ts_app` VALUES ('6', 'people', '找人', '按各种维度展示用户', '1', '0', 'Index/index', '', '', '', '', '6', '1363096393', '', '', '', '智士软件', '0', 'a:0:{}', '1', '1');

-- ----------------------------
-- Table structure for `ts_app_tag`
-- ----------------------------
DROP TABLE IF EXISTS `ts_app_tag`;
CREATE TABLE `ts_app_tag` (
  `app` char(15) NOT NULL COMMENT '所属应用',
  `table` char(15) NOT NULL COMMENT '所属表名',
  `row_id` int(11) DEFAULT '0' COMMENT '所属应用的内容的编号或者用户编号',
  `tag_id` int(11) NOT NULL COMMENT 'Tag 编号',
  UNIQUE KEY `app` (`table`,`row_id`,`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_app_tag
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_area`
-- ----------------------------
DROP TABLE IF EXISTS `ts_area`;
CREATE TABLE `ts_area` (
  `area_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '地区id',
  `title` varchar(255) NOT NULL COMMENT '地区名称',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父级地区ID',
  `sort` int(11) NOT NULL COMMENT '排序值',
  PRIMARY KEY (`area_id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=910011 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `ts_atme`
-- ----------------------------
DROP TABLE IF EXISTS `ts_atme`;
CREATE TABLE `ts_atme` (
  `atme_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，@我的编号',
  `app` char(15) NOT NULL COMMENT '所属应用',
  `table` char(15) NOT NULL COMMENT '存储应用内容的表名',
  `row_id` int(11) NOT NULL COMMENT '应用含有@的内容的编号',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '被@的用户的编号',
  PRIMARY KEY (`atme_id`),
  KEY `app_2` (`uid`,`table`),
  KEY `app_3` (`table`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_atme
-- ----------------------------
INSERT INTO `ts_atme` VALUES ('1', 'Public', 'feed', '3', '2');
INSERT INTO `ts_atme` VALUES ('2', 'Public', 'feed', '5', '2');

-- ----------------------------
-- Table structure for `ts_attach`
-- ----------------------------
DROP TABLE IF EXISTS `ts_attach`;
CREATE TABLE `ts_attach` (
  `attach_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '附件ID',
  `app_name` char(15) DEFAULT 'attach' COMMENT '应用名称',
  `table` char(15) DEFAULT NULL COMMENT '表名',
  `row_id` int(11) DEFAULT NULL COMMENT '管理的内容ID',
  `attach_type` varchar(20) NOT NULL COMMENT '附件所属类型',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户UID',
  `ctime` int(11) NOT NULL COMMENT '上传时间',
  `name` varchar(255) DEFAULT NULL COMMENT '附件名称',
  `type` varchar(255) DEFAULT NULL COMMENT '附件格式',
  `size` varchar(20) DEFAULT NULL COMMENT '附件大小',
  `extension` varchar(20) DEFAULT NULL COMMENT '附件扩展名',
  `hash` varchar(32) DEFAULT NULL COMMENT '附件哈希值',
  `private` tinyint(1) DEFAULT '0' COMMENT '是否私有（即对其他人不可见）',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '统一的is_del',
  `save_path` varchar(255) DEFAULT NULL COMMENT '保存路径',
  `save_name` varchar(255) DEFAULT NULL COMMENT '保存名称',
  `save_domain` tinyint(3) DEFAULT '0' COMMENT '附件保存的域ID（用于拆分附件存储到不同的服务器）',
  `from` tinyint(3) NOT NULL COMMENT '来源类型，0：网站；1：手机网页版；2：android；3：iphone',
  `width` int(11) DEFAULT '0' COMMENT '图片宽度',
  `height` int(11) DEFAULT '0' COMMENT '图片高度',
  PRIMARY KEY (`attach_id`),
  KEY `userId` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `ts_channel`
-- ----------------------------
DROP TABLE IF EXISTS `ts_channel`;
CREATE TABLE `ts_channel` (
  `feed_channel_link_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `feed_id` int(11) NOT NULL COMMENT '微博ID',
  `channel_category_id` int(11) NOT NULL COMMENT '频道分类ID',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '审核状态 1审核 0未审核',
  `width` int(11) NOT NULL DEFAULT '0' COMMENT '图片宽度',
  `height` int(11) NOT NULL DEFAULT '0' COMMENT '图片高度',
  `uid` int(11) NOT NULL COMMENT '用户UID',
  PRIMARY KEY (`feed_channel_link_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_channel
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_channel_category`
-- ----------------------------
DROP TABLE IF EXISTS `ts_channel_category`;
CREATE TABLE `ts_channel_category` (
  `channel_category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '频道分类ID',
  `title` varchar(225) NOT NULL COMMENT '频道分类名称',
  `pid` int(11) NOT NULL COMMENT '父分类ID',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序字段',
  `ext` text COMMENT '分类配置相关信息序列化',
  PRIMARY KEY (`channel_category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_channel_category
-- ----------------------------
INSERT INTO `ts_channel_category` VALUES ('1', '频道1', '0', '1', null);
INSERT INTO `ts_channel_category` VALUES ('2', '频道2', '0', '2', null);
INSERT INTO `ts_channel_category` VALUES ('3', '频道3', '0', '3', null);

-- ----------------------------
-- Table structure for `ts_channel_follow`
-- ----------------------------
DROP TABLE IF EXISTS `ts_channel_follow`;
CREATE TABLE `ts_channel_follow` (
  `channel_follow_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '频道关注主键',
  `uid` int(11) NOT NULL COMMENT '关注用户ID',
  `channel_category_id` int(11) NOT NULL COMMENT '频道分类ID',
  PRIMARY KEY (`channel_follow_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_channel_follow
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_check_info`
-- ----------------------------
DROP TABLE IF EXISTS `ts_check_info`;
CREATE TABLE `ts_check_info` (
  `uid` int(11) DEFAULT NULL COMMENT '用户UID',
  `con_num` int(11) DEFAULT '1' COMMENT '连续签到次数',
  `total_num` int(11) DEFAULT '1' COMMENT '总签到次数',
  `ctime` int(11) DEFAULT '0' COMMENT '签到时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_check_info
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_collection`
-- ----------------------------
DROP TABLE IF EXISTS `ts_collection`;
CREATE TABLE `ts_collection` (
  `collection_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(5) NOT NULL COMMENT '用户ID',
  `source_id` int(11) NOT NULL COMMENT '资源ID\r\n',
  `source_table_name` varchar(255) NOT NULL COMMENT '资源所在表',
  `source_app` varchar(255) NOT NULL COMMENT '资源所在应用',
  `ctime` int(11) NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (`collection_id`),
  UNIQUE KEY `cacheId` (`uid`,`source_id`,`source_table_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_collection
-- ----------------------------
INSERT INTO `ts_collection` VALUES ('1', '3', '2', 'feed', 'public', '1383394325');

-- ----------------------------
-- Table structure for `ts_comment`
-- ----------------------------
DROP TABLE IF EXISTS `ts_comment`;
CREATE TABLE `ts_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，评论编号',
  `app` char(15) NOT NULL COMMENT '所属应用',
  `table` char(15) NOT NULL COMMENT '被评论的内容所存储的表',
  `row_id` int(11) NOT NULL COMMENT '应用进行评论的内容的编号',
  `app_uid` int(11) NOT NULL DEFAULT '0' COMMENT '应用内进行评论的内容的作者的编号',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '评论者编号',
  `content` text NOT NULL COMMENT '评论内容',
  `to_comment_id` int(11) NOT NULL DEFAULT '0' COMMENT '被回复的评论的编号',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被回复的评论的作者的编号',
  `data` text NOT NULL COMMENT '所评论的内容的相关参数（序列化存储）',
  `ctime` int(11) NOT NULL COMMENT '评论发布的时间',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '标记删除（0：没删除，1：已删除）',
  `client_type` tinyint(2) NOT NULL COMMENT '客户端类型，0：网站；1：手机网页版；2：android；3：iphone',
  `is_audit` tinyint(1) DEFAULT '1' COMMENT '是否已审核 0-未审核 1-已审核',
  `storey` int(11) DEFAULT '0' COMMENT '评论绝对楼层',
  `app_detail_url` varchar(255) DEFAULT NULL,
  `app_detail_summary` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `app` (`table`,`is_del`,`row_id`),
  KEY `app_3` (`app_uid`,`to_uid`,`is_del`,`table`),
  KEY `app_2` (`uid`,`is_del`,`table`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_comment
-- ----------------------------
INSERT INTO `ts_comment` VALUES ('1', 'public', 'feed', '2', '2', '3', 'nice.[se]', '0', '0', 'N;', '1383394336', '0', '0', '1', '0', 'http://localhost/ThinkSNS/index.php?app=public&mod=Profile&act=feed&feed_id=2&uid=2', '867765846@qq.com/123456');
INSERT INTO `ts_comment` VALUES ('2', 'public', 'feed', '2', '2', '2', '回复@山的那边 ：hehehe', '1', '3', 'N;', '1383396406', '0', '0', '1', '0', 'http://localhost/ThinkSNS/index.php?app=public&mod=Profile&act=feed&feed_id=2&uid=2', '867765846@qq.com/123456');

-- ----------------------------
-- Table structure for `ts_credit_setting`
-- ----------------------------
DROP TABLE IF EXISTS `ts_credit_setting`;
CREATE TABLE `ts_credit_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '积分动作',
  `alias` varchar(255) NOT NULL COMMENT '积分名称',
  `type` varchar(30) NOT NULL DEFAULT 'user' COMMENT '积分类型',
  `info` text NOT NULL COMMENT '积分说明',
  `score` int(11) DEFAULT NULL COMMENT '积分值',
  `experience` int(11) DEFAULT NULL COMMENT '经验值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=262 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_credit_setting
-- ----------------------------
INSERT INTO `ts_credit_setting` VALUES ('37', 'invite_friend', '邀请好友', 'register', '{action}{sign}了{score}{typecn}', '8', '2');
INSERT INTO `ts_credit_setting` VALUES ('39', 'add_weibo', '发布微博', 'weibo', '{action}{sign}了{score}{typecn}', '5', '5');
INSERT INTO `ts_credit_setting` VALUES ('40', 'user_login', '用户登录', 'user', '{action}{sign}了{score}{typecn}', '2', '1');
INSERT INTO `ts_credit_setting` VALUES ('42', 'space_visited', '空间被访问', 'user', '{action}{sign}了{score}{typecn}', '2', '1');
INSERT INTO `ts_credit_setting` VALUES ('92', 'init_default', '注册积分', 'register', '{action}{sign}了{score}{typecn}', '200', '0');
INSERT INTO `ts_credit_setting` VALUES ('59', 'add_comment', '评论别人', 'comment', '{action}{sign}了{score}{typecn}', '6', '4');
INSERT INTO `ts_credit_setting` VALUES ('60', 'reply_comment', '回复别人的评论', 'comment', '{action}{sign}了{score}{typecn}', '2', '1');
INSERT INTO `ts_credit_setting` VALUES ('61', 'replied_comment', '评论被回复', 'comment', '{action}{sign}了{score}{typecn}', '3', '1');
INSERT INTO `ts_credit_setting` VALUES ('63', 'reply_weibo', '回复微博', 'weibo', '{action}{sign}了{score}{typecn}', '3', '2');
INSERT INTO `ts_credit_setting` VALUES ('64', 'commented_weibo', '微博被评论', 'weibo', '{action}{sign}了{score}{typecn}', '2', '3');
INSERT INTO `ts_credit_setting` VALUES ('81', 'is_commented', '被别人评论', 'comment', '{action}{sign}了{score}{typecn}', '2', '1');
INSERT INTO `ts_credit_setting` VALUES ('83', 'share_to_weibo', '分享到微博', 'weibo', '{action}{sign}了{score}{typecn}', '4', '1');
INSERT INTO `ts_credit_setting` VALUES ('88', 'delete_comment', '删除评论', 'comment', '{action}{sign}了{score}{typecn}', '-3', '1');
INSERT INTO `ts_credit_setting` VALUES ('89', 'delete_weibo', '删除微博', 'weibo', '{action}{sign}了{score}{typecn}', '-1', '1');
INSERT INTO `ts_credit_setting` VALUES ('90', 'forward_weibo', '转发微博', 'weibo', '{action}{sign}了{score}{typecn}', '1', '2');
INSERT INTO `ts_credit_setting` VALUES ('91', 'forwarded_weibo', '微博被转发', 'weibo', '{action}{sign}了{score}{typecn}', '3', '2');
INSERT INTO `ts_credit_setting` VALUES ('93', 'delete_weibo_comment', '删除微博评论', 'weibo', '{action}{sign}了{score}{typecn}', '-2', '1');
INSERT INTO `ts_credit_setting` VALUES ('94', 'add_medal', '获得勋章', 'medal', '', '6', '2');
INSERT INTO `ts_credit_setting` VALUES ('103', 'delete_medal', '丢失勋章', 'medal', '{action}{sign}了{score}{typecn}', '-5', '0');
INSERT INTO `ts_credit_setting` VALUES ('179', 'core_code', '申请邀请码', 'register', '', '-1', '-2');
INSERT INTO `ts_credit_setting` VALUES ('185', 'user_login', '用户登录', 'core', '', '1', '1');
INSERT INTO `ts_credit_setting` VALUES ('186', 'space_access', '空间被访问', 'core', '', '2', '1');
INSERT INTO `ts_credit_setting` VALUES ('187', 'comment_weibo', '评论微博', 'weibo', '', '3', '2');
INSERT INTO `ts_credit_setting` VALUES ('188', 'collect_weibo', '收藏微博', 'weibo', '', '1', '1');
INSERT INTO `ts_credit_setting` VALUES ('189', 'report_weibo', '举报微博', 'weibo', '', '1', '1');
INSERT INTO `ts_credit_setting` VALUES ('190', 'collected_weibo', '微博被收藏', 'weibo', '', '1', '1');
INSERT INTO `ts_credit_setting` VALUES ('191', 'reported_weibo', '微博被举报', 'weibo', '', '0', '0');
INSERT INTO `ts_credit_setting` VALUES ('192', 'recommend_to_channel', '推荐至频道', 'channel', '', '1', '1');
INSERT INTO `ts_credit_setting` VALUES ('193', 'unrecommend_to_channel', '取消推荐至频道', 'channel', '', '1', '1');
INSERT INTO `ts_credit_setting` VALUES ('194', 'publish_topic', '发表帖子', 'weiba', '', '10', '10');
INSERT INTO `ts_credit_setting` VALUES ('195', 'forward_topic', '转发帖子', 'weiba', '', '0', '0');
INSERT INTO `ts_credit_setting` VALUES ('196', 'comment_topic', '评论帖子', 'weiba', '', '0', '0');
INSERT INTO `ts_credit_setting` VALUES ('197', 'collect_topic', '收藏帖子', 'weiba', '', '0', '0');
INSERT INTO `ts_credit_setting` VALUES ('198', 'top_topic_all', '帖子被设置全局置顶', 'weiba', '', '0', '0');
INSERT INTO `ts_credit_setting` VALUES ('199', 'top_topic_weiba', '帖子被设置吧内置顶', 'weiba', '', '0', '0');
INSERT INTO `ts_credit_setting` VALUES ('200', 'dist_topic', '帖子被设置精华', 'weiba', '', '0', '0');
INSERT INTO `ts_credit_setting` VALUES ('201', 'undist_topic', '帖子被取消精华', 'weiba', '', '0', '0');
INSERT INTO `ts_credit_setting` VALUES ('202', 'untop_topic_all', '帖子被取消全局置顶', 'weiba', '', '0', '0');
INSERT INTO `ts_credit_setting` VALUES ('203', 'untop_topic_weiba', '帖子被取消吧内置顶', 'weiba', '', '0', '0');
INSERT INTO `ts_credit_setting` VALUES ('204', 'forwarded_topic', '帖子被转发', 'weiba', '', '0', '0');
INSERT INTO `ts_credit_setting` VALUES ('205', 'commented_topic', '帖子被评论', 'weiba', '', '0', '0');
INSERT INTO `ts_credit_setting` VALUES ('206', 'collected_topic', '帖子被收藏', 'weiba', '', '0', '0');
INSERT INTO `ts_credit_setting` VALUES ('207', 'recommend_topic', '帖子被推荐', 'weiba', '', '0', '0');
INSERT INTO `ts_credit_setting` VALUES ('208', 'delete_topic', '删除帖子', 'weiba', '', '0', '0');
INSERT INTO `ts_credit_setting` VALUES ('209', 'delete_topic_comment', '删除帖子回复', 'weiba', '', '0', '0');
INSERT INTO `ts_credit_setting` VALUES ('210', 'follow_weiba', '关注微吧', 'weiba', '', '0', '0');
INSERT INTO `ts_credit_setting` VALUES ('211', 'unfollow_weiba', '取消关注微吧', 'weiba', '', '0', '0');
INSERT INTO `ts_credit_setting` VALUES ('212', 'out_weiba', '踢出微吧', 'weiba', '', '0', '0');
INSERT INTO `ts_credit_setting` VALUES ('213', 'appointed_weiba', '被任命为吧主', 'weiba', '', '0', '0');
INSERT INTO `ts_credit_setting` VALUES ('214', 'unappointed_weiba', '取消任命吧主', 'weiba', '', '0', '0');
INSERT INTO `ts_credit_setting` VALUES ('215', 'recommended_weiba', '微吧被推荐', 'weiba', '', '0', '0');
INSERT INTO `ts_credit_setting` VALUES ('260', 'digg_weibo', '顶微博', 'weibo', '', '1', '1');
INSERT INTO `ts_credit_setting` VALUES ('261', 'digged_weibo', '微博被顶', 'weibo', '', '6', '5');

-- ----------------------------
-- Table structure for `ts_credit_type`
-- ----------------------------
DROP TABLE IF EXISTS `ts_credit_type`;
CREATE TABLE `ts_credit_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '积分名',
  `alias` varchar(50) NOT NULL COMMENT '积分中文名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_credit_type
-- ----------------------------
INSERT INTO `ts_credit_type` VALUES ('1', 'experience', '经验');
INSERT INTO `ts_credit_type` VALUES ('6', 'score', '财富');

-- ----------------------------
-- Table structure for `ts_credit_user`
-- ----------------------------
DROP TABLE IF EXISTS `ts_credit_user`;
CREATE TABLE `ts_credit_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户UID',
  `score` int(11) DEFAULT NULL COMMENT '积分总值',
  `experience` int(11) DEFAULT NULL COMMENT '经验总值',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_credit_user
-- ----------------------------
INSERT INTO `ts_credit_user` VALUES ('1', '1', '13', '9');
INSERT INTO `ts_credit_user` VALUES ('2', '2', '259', '49');
INSERT INTO `ts_credit_user` VALUES ('3', '3', '214', '12');
INSERT INTO `ts_credit_user` VALUES ('4', '4', '203', '2');

-- ----------------------------
-- Table structure for `ts_denounce`
-- ----------------------------
DROP TABLE IF EXISTS `ts_denounce`;
CREATE TABLE `ts_denounce` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `from` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '资源来源位置',
  `aid` int(10) NOT NULL COMMENT '资源ID',
  `state` tinyint(3) NOT NULL COMMENT '状态',
  `uid` int(10) NOT NULL COMMENT '举报人',
  `fuid` int(10) NOT NULL COMMENT '被举报人',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '举报原因',
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '举报内容',
  `ctime` int(10) NOT NULL COMMENT '举报时间',
  `source_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '资源来源页面',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_denounce
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_department`
-- ----------------------------
DROP TABLE IF EXISTS `ts_department`;
CREATE TABLE `ts_department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '部门名',
  `parent_dept_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级部门的ID',
  `display_order` int(11) NOT NULL DEFAULT '0' COMMENT '在同级部门中的排序',
  `ctime` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`department_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_department
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_diy_canvas`
-- ----------------------------
DROP TABLE IF EXISTS `ts_diy_canvas`;
CREATE TABLE `ts_diy_canvas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT 'DIY画布标题',
  `canvas_name` varchar(255) DEFAULT NULL COMMENT 'DIY画布名称--对应模板文件名',
  `data` text COMMENT '模板数据',
  `description` varchar(500) DEFAULT NULL COMMENT '画布说明',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_diy_canvas
-- ----------------------------
INSERT INTO `ts_diy_canvas` VALUES ('1', '首页', 'index.html', 'PGluY2x1ZGUgZmlsZT0iX19USEVNRV9fL3B1YmxpY19oZWFkZXIiIC8+DQo8ZGl2IHN0eWxlPSJoZWlnaHQ6NjBweCI+PC9kaXY+DQo8aW5jbHVkZSBmaWxlPSJfX1RIRU1FX18vZGl5X2hlYWRlciIgLz4NCjxsaW5rIGhyZWY9Il9fQVBQX18vUHVibGljL2Nzcy9kaXlfYWRhcHRhYmxlLmNzcyIgcmVsPSJzdHlsZXNoZWV0IiB0eXBlPSJ0ZXh0L2NzcyIgLz4NCjxsaW5rIGhyZWY9Il9fQVBQX18vUHVibGljL2Nzcy9pbmRleC5jc3MiIHJlbD0ic3R5bGVzaGVldCIgdHlwZT0idGV4dC9jc3MiIC8+DQo8bGluayBocmVmPSJfX0FQUF9fL1B1YmxpYy9jc3MvcG9wX3VwLmNzcyIgcmVsPSJzdHlsZXNoZWV0IiB0eXBlPSJ0ZXh0L2NzcyIgLz4NCjxkaXYgY2xhc3M9ImRpeV9jb250ZW50IGJnX2RpeSBib3hTaGFkb3ciIHN0eWxlPSJ3aWR0aDo5NjBweCI+DQp7JGRhdGF9DQogICAgPGRpdiBjbGFzcz0iQyI+DQogICAgPC9kaXY+DQoNCg0KPC9kaXY+DQoNCjxpbmNsdWRlIGZpbGU9Il9fVEhFTUVfXy9wdWJsaWNfZm9vdGVyIiAvPg==', '首页');

-- ----------------------------
-- Table structure for `ts_diy_page`
-- ----------------------------
DROP TABLE IF EXISTS `ts_diy_page`;
CREATE TABLE `ts_diy_page` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL COMMENT '页面域名',
  `page_name` varchar(30) NOT NULL COMMENT '页面名称',
  `layout_data` text COMMENT '页面布局数据',
  `widget_data` text COMMENT '页面里面模块数据',
  `canvas` varchar(255) DEFAULT NULL COMMENT '应用画布',
  `lock` tinyint(1) DEFAULT '0' COMMENT '是否锁定不可以删除',
  `status` tinyint(1) DEFAULT '1' COMMENT '是否开放用户访问',
  `guest` tinyint(1) DEFAULT '1' COMMENT '游客是否可以访问',
  `visit_count` int(11) unsigned DEFAULT '0' COMMENT '浏览次数',
  `uid` int(11) DEFAULT NULL COMMENT '用户UID',
  `manager` varchar(255) DEFAULT '' COMMENT '管理员',
  `ctime` int(11) DEFAULT NULL COMMENT '创建时间',
  `seo_title` varchar(255) DEFAULT NULL COMMENT '页面seo标题',
  `seo_keywords` varchar(255) DEFAULT NULL COMMENT '页面seo关键字',
  `seo_description` varchar(500) DEFAULT NULL COMMENT '页面seo简介',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_diy_page
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_diy_widget`
-- ----------------------------
DROP TABLE IF EXISTS `ts_diy_widget`;
CREATE TABLE `ts_diy_widget` (
  `widgetId` int(11) NOT NULL AUTO_INCREMENT COMMENT '模块ID',
  `uid` int(11) NOT NULL COMMENT '用户UID',
  `pluginId` varchar(255) NOT NULL COMMENT 'DIY中关联的ID',
  `pageId` int(11) NOT NULL COMMENT '页面ID',
  `channelId` int(11) NOT NULL COMMENT '频道ID',
  `taglib` text COMMENT '标签栏内容',
  `content` text COMMENT '模块内容',
  `ext` text COMMENT '模块参数',
  `cache` text COMMENT '缓存内容',
  `cacheTime` int(11) NOT NULL DEFAULT '0' COMMENT '缓存时间',
  `cTime` int(11) DEFAULT NULL COMMENT '创建时间',
  `mTime` int(11) DEFAULT NULL COMMENT '修改时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`widgetId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_diy_widget
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_expression`
-- ----------------------------
DROP TABLE IF EXISTS `ts_expression`;
CREATE TABLE `ts_expression` (
  `expression_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `type` varchar(255) NOT NULL DEFAULT 'miniblog',
  `emotion` varchar(255) NOT NULL COMMENT '文本编码，格式：[文本]，如[拥抱]、[示爱]、[呲牙]等',
  `filename` varchar(255) NOT NULL COMMENT '表情图片文件名',
  PRIMARY KEY (`expression_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_expression
-- ----------------------------
INSERT INTO `ts_expression` VALUES ('1', '拥抱', 'miniblog', '[拥抱]', 'hug.gif');
INSERT INTO `ts_expression` VALUES ('2', '示爱', 'miniblog', '[示爱]', 'kiss.gif');
INSERT INTO `ts_expression` VALUES ('3', '呲牙', 'miniblog', '[呲牙]', 'lol.gif');
INSERT INTO `ts_expression` VALUES ('4', '可爱', 'miniblog', '[可爱]', 'loveliness.gif');
INSERT INTO `ts_expression` VALUES ('5', '折磨', 'miniblog', '[折磨]', 'mad.gif');
INSERT INTO `ts_expression` VALUES ('6', '难过', 'miniblog', '[难过]', 'sad.gif');
INSERT INTO `ts_expression` VALUES ('7', '流汗', 'miniblog', '[流汗]', 'sweat.gif');
INSERT INTO `ts_expression` VALUES ('8', '憨笑', 'miniblog', '[憨笑]', 'biggrin.gif');
INSERT INTO `ts_expression` VALUES ('9', '大哭', 'miniblog', '[大哭]', 'cry.gif');
INSERT INTO `ts_expression` VALUES ('11', '握手', 'miniblog', '[握手]', 'handshake.gif');
INSERT INTO `ts_expression` VALUES ('12', '发怒', 'miniblog', '[发怒]', 'huffy.gif');
INSERT INTO `ts_expression` VALUES ('13', '惊讶', 'miniblog', '[惊讶]', 'shocked.gif');
INSERT INTO `ts_expression` VALUES ('14', '害羞', 'miniblog', '[害羞]', 'shy.gif');
INSERT INTO `ts_expression` VALUES ('15', '微笑', 'miniblog', '[微笑]', 'smile.gif');
INSERT INTO `ts_expression` VALUES ('16', '偷笑', 'miniblog', '[偷笑]', 'titter.gif');
INSERT INTO `ts_expression` VALUES ('17', '调皮', 'miniblog', '[调皮]', 'tongue.gif');
INSERT INTO `ts_expression` VALUES ('19', '啤酒', 'miniblog', '[啤酒]', 'beer.gif');
INSERT INTO `ts_expression` VALUES ('20', '蛋糕', 'miniblog', '[蛋糕]', 'cake.gif');
INSERT INTO `ts_expression` VALUES ('21', '奋斗', 'miniblog', '[奋斗]', 'fendou.gif');
INSERT INTO `ts_expression` VALUES ('22', '出错了', 'miniblog', '[出错了]', 'funk.gif');
INSERT INTO `ts_expression` VALUES ('23', '哈欠', 'miniblog', '[哈欠]', 'ha.gif');
INSERT INTO `ts_expression` VALUES ('24', '晚安', 'miniblog', '[晚安]', 'moon.gif');
INSERT INTO `ts_expression` VALUES ('25', '欧克', 'miniblog', '[欧克]', 'ok.gif');
INSERT INTO `ts_expression` VALUES ('26', '猪头', 'miniblog', '[猪头]', 'pig.gif');
INSERT INTO `ts_expression` VALUES ('31', '晕', 'miniblog', '[晕]', 'yun.gif');
INSERT INTO `ts_expression` VALUES ('32', '偶也 ', 'miniblog', '[偶也]', 'victory.gif');

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

-- ----------------------------
-- Table structure for `ts_feed_node`
-- ----------------------------
DROP TABLE IF EXISTS `ts_feed_node`;
CREATE TABLE `ts_feed_node` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `appname` varchar(50) NOT NULL COMMENT '应用名称',
  `nodetype` varchar(50) NOT NULL COMMENT '动态类型',
  `nodeinfo` varchar(50) NOT NULL COMMENT '动态名称',
  `xml` text NOT NULL COMMENT '模板内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_feed_node
-- ----------------------------
INSERT INTO `ts_feed_node` VALUES ('1', 'public', 'post', '原创微博', '&lt;title comment=&quot;feed标题&quot;&gt; \r\n			&lt;![CDATA[ {$actor}  ]]&gt;\r\n		&lt;/title&gt;\r\n		&lt;body comment=&quot;feed详细内容/引用的内容&quot;&gt;&lt;a href=&quot;&quot;&gt;详情&lt;/a&gt;\r\n			&lt;![CDATA[{$body} ]]&gt;&lt;a href=&quot;&quot;&gt;详情&lt;/a&gt;\r\n		&lt;/body&gt;\r\n		&lt;feedAttr  comment=&quot;true&quot; repost=&quot;true&quot; favor=&quot;true&quot;  delete=&quot;true&quot; /&gt;');
INSERT INTO `ts_feed_node` VALUES ('2', 'public', 'repost', '转发微博', '&lt;title&gt;&lt;![CDATA[{$actor} ]]&gt;&lt;/title&gt;\r\n&lt;body&gt;\r\n	&lt;![CDATA[\r\n	&lt;eq name=\'body\' value=\'\'&gt; 微博分享 &lt;/eq&gt; \r\n	{$body}\r\n	&lt;dl class=&quot;comment&quot;&gt;\r\n		&lt;dt class=&quot;arrow bgcolor_arrow&quot;&gt;&lt;em class=&quot;arrline&quot;&gt;◆&lt;/em&gt;&lt;span class=&quot;downline&quot;&gt;◆&lt;/span&gt;&lt;/dt&gt;\r\n		&lt;php&gt;if($sourceInfo[\'is_del\'] == 0):&lt;/php&gt;\r\n		&lt;dd class=&quot;name&quot;&gt;\r\n			@{$sourceInfo.source_user_info.uname}\r\n			&lt;volist name=&quot;sourceInfo[\'groupData\'][$sourceInfo[\'source_user_info\'][\'uid\']]&quot; id=&quot;v2&quot;&gt;\r\n				&lt;img style=&quot;width:auto;height:auto;display:inline;cursor:pointer&quot; src=&quot;{$v2[\'user_group_icon_url\']}&quot; title=&quot;{$v2[\'user_group_name\']}&quot; /&gt; \r\n			&lt;/volist&gt;\r\n		&lt;/dd&gt;\r\n		&lt;dd&gt;\r\n			{$sourceInfo.source_content}\r\n			&lt;php&gt;if(!empty($sourceInfo[\'attach\'])):&lt;/php&gt;\r\n			&lt;eq name=\'sourceInfo.feedType\' value=\'postfile\'&gt;\r\n			&lt;ul class=&quot;feed_file_list&quot;&gt;\r\n				&lt;volist name=\'sourceInfo.attach\' id=\'vo\'&gt;\r\n				&lt;li&gt;\r\n					&lt;a href=&quot;{:U(\'widget/Upload/down\',array(\'attach_id\'=&gt;$vo[\'attach_id\']))}&quot; class=&quot;current right&quot; target=&quot;_blank&quot;&gt;&lt;i class=&quot;ico-down&quot;&gt;&lt;/i&gt;&lt;/a&gt;\r\n					&lt;i class=&quot;ico-{$vo.extension}-small&quot;&gt;&lt;/i&gt;\r\n					&lt;a href=&quot;{:U(\'widget/Upload/down\',array(\'attach_id\'=&gt;$vo[\'attach_id\']))}&quot;&gt;{$vo.attach_name}&lt;/a&gt;\r\n					&lt;span class=&quot;tips&quot;&gt;({$vo.size|byte_format})&lt;/span&gt;\r\n				&lt;/li&gt;\r\n				&lt;/volist&gt;			\r\n			&lt;/ul&gt;		\r\n			&lt;/eq&gt;\r\n\r\n			&lt;eq name=\'sourceInfo.feedType\' value=\'postimage\'&gt;\r\n			&lt;div class=&quot;feed_img_lists&quot; rel=\'small\' &gt;\r\n				&lt;ul class=&quot;small&quot;&gt;\r\n					&lt;volist name=\'sourceInfo.attach\' id=\'vo\'&gt;\r\n					&lt;li&gt;&lt;a href=&quot;javascript:void(0)&quot; event-node=\'img_small\'&gt;&lt;img class=&quot;imgicon&quot; src=\'{$vo.attach_small}\' title=\'点击放大\'&gt;&lt;/a&gt;&lt;/li&gt;\r\n					&lt;/volist&gt;\r\n				&lt;/ul&gt;\r\n			&lt;/div&gt;\r\n			&lt;div class=&quot;feed_img_lists&quot; rel=\'big\' style=\'display:none\'&gt;\r\n				&lt;ul class=&quot;feed_img_list big&quot;&gt;\r\n					&lt;p class=\'tools\'&gt;&lt;a href=&quot;javascript:void(0);&quot; event-node=\'img_big\' class=&quot;ico-pack-up&quot;&gt;收起&lt;/a&gt;&lt;/p&gt;\r\n					&lt;volist name=\'sourceInfo.attach\' id=\'vo\'&gt;\r\n					&lt;php&gt;$imgInfo = getThumbImage($vo[\'attach_url\'],425);&lt;/php&gt;\r\n					&lt;li style=&quot;width:{$imgInfo.width}px;&quot; title=\'{$vo[\'attach_url\']}\'&gt;\r\n						&lt;i class=&quot;check-big&quot;&gt;&lt;a href=\'{$vo[\'attach_url\']}\' target=&quot;_blank&quot; class=&quot;ico-show-big&quot; title=&quot;查看大图&quot; &gt;&lt;/a&gt;&lt;/i&gt;\r\n						&lt;a href=&quot;javascript:void(0)&quot; event-node=\'img_big\'&gt;&lt;img class=&quot;imgsmall&quot; src=\'{$imgInfo.src}\' title=\'点击缩小\' /&gt;&lt;/a&gt;\r\n					&lt;/li&gt;\r\n					&lt;/volist&gt;\r\n				&lt;/ul&gt;\r\n			&lt;/div&gt;\r\n			&lt;/eq&gt;	\r\n			&lt;php&gt;endif;&lt;/php&gt;	\r\n		&lt;/dd&gt;\r\n&lt;!--\r\n		&lt;p class=&quot;info&quot;&gt;\r\n			&lt;span class=&quot;right&quot;&gt;\r\n				&lt;a href=&quot;{:U(\'public/Profile/feed\',array(\'uid\'=&gt;$sourceInfo[\'uid\'],\'feed_id\'=&gt;$sourceInfo[\'feed_id\']))}&quot;&gt;原文转发&lt;neq name=&quot;sourceInfo.repost_count&quot; value=&quot;0&quot;&gt;({$sourceInfo.repost_count})&lt;/neq&gt;&lt;/a&gt;&lt;i class=&quot;vline&quot;&gt;|&lt;/i&gt;\r\n				&lt;a href=&quot;{:U(\'public/Profile/feed\',array(\'uid\'=&gt;$sourceInfo[\'uid\'],\'feed_id\'=&gt;$sourceInfo[\'feed_id\']))}&quot;&gt;原文收藏&lt;/a&gt;&lt;i class=&quot;vline&quot;&gt;|&lt;/i&gt;\r\n				&lt;a href=&quot;{:U(\'public/Profile/feed\',array(\'uid\'=&gt;$sourceInfo[\'uid\'],\'feed_id\'=&gt;$sourceInfo[\'feed_id\']))}&quot;&gt;原文评论&lt;neq name=&quot;sourceInfo.comment_count&quot; value=&quot;0&quot;&gt;({$sourceInfo.comment_count})&lt;/neq&gt;&lt;/a&gt;\r\n			&lt;/span&gt;\r\n			&lt;span&gt;&lt;a href=&quot;{:U(\'public/Profile/feed\',array(\'uid\'=&gt;$sourceInfo[\'uid\'],\'feed_id\'=&gt;$sourceInfo[\'feed_id\']))}&quot; class=&quot;date&quot;&gt;{$sourceInfo[\'ctime\']|friendlyDate}&lt;/a&gt;&lt;span&gt;来自网站&lt;/span&gt;&lt;/span&gt;\r\n		&lt;/p&gt;\r\n--&gt;\r\n		&lt;php&gt;else:&lt;/php&gt;\r\n		&lt;dd class=&quot;name&quot;&gt;内容已被删除&lt;/dd&gt;\r\n		&lt;php&gt;endif;&lt;/php&gt;\r\n	&lt;/dl&gt;\r\n	]]&gt;\r\n&lt;/body&gt;\r\n&lt;feedAttr  comment=&quot;true&quot; repost=&quot;true&quot; favor=&quot;true&quot;  delete=&quot;true&quot; /&gt;');
INSERT INTO `ts_feed_node` VALUES ('6', 'weiba', 'weiba_repost', '微吧转发', '	&lt;title&gt; \r\n			&lt;![CDATA[{$actor} ]]&gt;\r\n		&lt;/title&gt;\r\n		&lt;body&gt;\r\n			&lt;![CDATA[\r\n				&lt;eq name=\'body\' value=\'\'&gt; 微博分享 &lt;/eq&gt; \r\n				{$body}\r\n				&lt;dl class=&quot;comment&quot;&gt;&lt;dt class=&quot;arrow bgcolor_arrow&quot;&gt;&lt;em class=&quot;arrline&quot;&gt;◆&lt;/em&gt;&lt;span class=&quot;downline&quot;&gt;◆&lt;/span&gt;&lt;/dt&gt;\r\n				&lt;dd class=&quot;name&quot;&gt;\r\n						&lt;php&gt; if($sourceInfo[\'source_user_info\'][\'uid\'] == $GLOBALS[\'ts\'][\'mid\']){&lt;/php&gt;\r\n					@{$sourceInfo.source_user_info.uname}\r\n					&lt;php&gt; }else{&lt;/php&gt;\r\n					@{$sourceInfo.source_user_info.uname}\r\n					&lt;php&gt; }&lt;/php&gt;\r\n&lt;volist name=&quot;sourceInfo[\'groupData\'][$sourceInfo[\'source_user_info\'][\'uid\']]&quot; id=&quot;v2&quot;&gt;\r\n        				&lt;img style=&quot;width:auto;height:auto;display:inline;cursor:pointer&quot; src=&quot;{$v2[\'user_group_icon_url\']}&quot; title=&quot;{$v2[\'user_group_name\']}&quot; /&gt; \r\n    				&lt;/volist&gt;\r\n				&lt;/dd&gt;\r\n				&lt;dd&gt;\r\n					{$sourceInfo.source_content}\r\n&lt;php&gt;if(APP_NAME == \'public\' || APP_NAME == \'widget\'){&lt;/php&gt;\r\n&lt;a href=&quot;javascript:void(0)&quot; class=&quot;ico-details&quot; event-node =\'loadPost\' event-args=\'feed_id={$feedid}&amp;post_id={$app_row_id}\' id=&quot;{$app_row_id}&quot;&gt;&lt;i class=&quot;triangle-l&quot;&gt;&lt;/i&gt;查看全文&lt;/a&gt;&lt;div class=&quot;feed_img_lists&quot; style=&quot;display:none;&quot; id=&quot;post_{$feedid}_{$app_row_id}&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;php&gt;}else{&lt;/php&gt;\r\n&lt;a href=&quot;{:U(\'weiba/Index/postDetail\',array(\'post_id\'=&gt;$app_row_id))}&quot; class=&quot;ico-details&quot; target=&quot;_blank&quot;&gt;&lt;/a&gt;\r\n&lt;php&gt;}&lt;/php&gt;\r\n					&lt;php&gt;if(!empty($sourceInfo[\'attach\'])):&lt;/php&gt;\r\n					\r\n					&lt;eq name=\'sourceInfo.feedtype\' value=\'postfile\'&gt;\r\n						&lt;ul class=&quot;feed_file_list&quot;&gt;\r\n						&lt;volist name=\'sourceInfo.attach\' id=\'vo\'&gt;\r\n							&lt;li&gt;&lt;a href=&quot;{:U(\'widget/Upload/down\',array(\'attach_id\'=&gt;$vo[\'attach_id\']))}&quot; class=&quot;current right&quot; target=&quot;_blank&quot;&gt;&lt;i class=&quot;ico-down&quot;&gt;&lt;/i&gt;&lt;/a&gt;&lt;i class=&quot;ico-{$vo.extension}-small&quot;&gt;&lt;/i&gt;&lt;a href=&quot;{:U(\'widget/Upload/down\',array(\'attach_id\'=&gt;$vo[\'attach_id\']))}&quot;&gt;\r\n							{$vo.attach_name}&lt;/a&gt; &lt;span class=&quot;tips&quot;&gt;({$vo.size|byte_format})&lt;/span&gt;&lt;/li&gt;\r\n						&lt;/volist&gt;			\r\n						&lt;/ul&gt;		\r\n					&lt;/eq&gt;\r\n\r\n					&lt;eq name=\'sourceInfo.feedtype\' value=\'postimage\'&gt;\r\n					 &lt;div class=&quot;feed_img_lists&quot; rel=\'small\' &gt;\r\n						&lt;ul class=&quot;small&quot;&gt;\r\n						&lt;volist name=\'sourceInfo.attach\' id=\'vo\'&gt;\r\n							&lt;li &gt;&lt;a href=&quot;javascript:void(0)&quot; event-node=\'img_small\'&gt;&lt;img class=&quot;imgicon&quot; src=\'{$vo.attach_small}\' title=\'点击放大\'&gt;&lt;/a&gt;&lt;/li&gt;\r\n						&lt;/volist&gt;\r\n						&lt;/ul&gt;\r\n						&lt;/div&gt;\r\n						&lt;div class=&quot;feed_img_lists&quot; rel=\'big\' style=\'display:none\'&gt;\r\n						&lt;ul class=&quot;feed_img_list big&quot; &gt;\r\n						&lt;p class=\'tools\'&gt;&lt;a href=&quot;javascript:void(0);&quot; event-node=\'img_big\' class=&quot;ico-pack-up&quot;&gt;收起&lt;/a&gt;&lt;/p&gt;\r\n						&lt;volist name=\'sourceInfo.attach\' id=\'vo\'&gt;\r\n							&lt;php&gt; $imgInfo = getThumbImage($vo[\'attach_url\'],425);&lt;/php&gt;\r\n							&lt;li style=&quot;width:{$imgInfo.width}px;&quot; title=\'{$vo[\'attach_url\']}\'&gt;\r\n							&lt;i class=&quot;check-big&quot;&gt;&lt;a href=\'{$vo[\'attach_url\']}\' target=&quot;_blank&quot; class=&quot;ico-show-big&quot; title=&quot;查看大图&quot; &gt;&lt;/a&gt;&lt;/i&gt;\r\n							&lt;a href=&quot;javascript:void(0)&quot; event-node=\'img_big\'&gt;&lt;img class=&quot;imgsmall&quot; src=\'{$imgInfo.src}\' title=\'点击缩小\'&gt;&lt;/a&gt;&lt;/li&gt;\r\n						&lt;/volist&gt;\r\n						&lt;/ul&gt;\r\n						&lt;/div&gt;\r\n					&lt;/eq&gt;	\r\n					&lt;php&gt;endif;&lt;/php&gt;	\r\n				&lt;/dd&gt;&lt;/dl&gt;\r\n			]]&gt;\r\n		&lt;/body&gt;\r\n		&lt;feedAttr  comment=&quot;true&quot; repost=&quot;true&quot; favor=&quot;true&quot;  delete=&quot;true&quot; /&gt;');
INSERT INTO `ts_feed_node` VALUES ('3', 'public', 'postimage', '发图片微博', '		&lt;title&gt; \r\n			&lt;![CDATA[\r\n				{$actor}\r\n			]]&gt;\r\n		&lt;/title&gt;\r\n		&lt;body&gt;\r\n			&lt;![CDATA[ \r\n				{$body}&lt;br/&gt;\r\n				&lt;div class=&quot;feed_img_lists&quot; rel=\'small\' &gt;\r\n				&lt;ul class=&quot;small&quot;&gt;\r\n				&lt;volist name=\'attachInfo\' id=\'vo\'&gt;\r\n					&lt;li &gt;&lt;a href=&quot;javascript:void(0)&quot; event-node=\'img_small\'&gt;\r\n						&lt;img class=&quot;imgicon&quot; src=\'{$vo.attach_small}\' title=\'点击放大\' &gt;&lt;/a&gt;\r\n					&lt;/li&gt; \r\n				&lt;/volist&gt;\r\n				&lt;/ul&gt;\r\n				&lt;/div&gt;\r\n				&lt;div class=&quot;feed_img_lists&quot; rel=\'big\' style=\'display:none\'&gt;\r\n				&lt;ul class=&quot;feed_img_list big&quot; &gt;\r\n				&lt;p class=\'tools\'&gt;&lt;a href=&quot;javascript:void(0)&quot; event-node=\'img_big\' class=&quot;ico-pack-up&quot;&gt;收起&lt;/a&gt;&lt;/p&gt;\r\n				&lt;volist name=\'attachInfo\' id=\'vo\'&gt;\r\n					&lt;li title=\'{$vo.attach_url}\'&gt;\r\n					&lt;i class=&quot;check-big&quot;&gt;&lt;a href=\'{$vo.attach_url}\' target=&quot;_blank&quot; class=&quot;ico-show-big&quot; title=&quot;查看大图&quot; &gt;&lt;/a&gt;&lt;/i&gt;\r\n					&lt;a href=&quot;javascript:void(0)&quot; event-node=\'img_big\'&gt;&lt;img class=&quot;imgsmall&quot; src=\'{$vo.attach_middle}\' title=\'点击缩小\' &gt;&lt;/a&gt;&lt;/li&gt;\r\n				&lt;/volist&gt;\r\n				&lt;/ul&gt;\r\n				&lt;/div&gt;\r\n			 ]]&gt;\r\n		&lt;/body&gt;\r\n		&lt;feedAttr  comment=&quot;true&quot; repost=&quot;true&quot; favor=&quot;true&quot; delete=&quot;true&quot; /&gt;  ');
INSERT INTO `ts_feed_node` VALUES ('4', 'public', 'postfile', '发附件微博', '&lt;title&gt; \r\n			&lt;![CDATA[\r\n				{$actor}\r\n			]]&gt;\r\n		&lt;/title&gt;\r\n		&lt;body&gt;\r\n			&lt;![CDATA[ \r\n				{$body}\r\n				&lt;div&gt;\r\n					&lt;ul class=&quot;feed_file_list&quot;&gt;\r\n						&lt;volist name=\'attachInfo\' id=\'vo\'&gt;\r\n							&lt;li&gt;&lt;a href=&quot;{:U(\'widget/Upload/down\',array(\'attach_id\'=&gt;$vo[\'attach_id\']))}&quot; class=&quot;current right&quot; target=&quot;_blank&quot; title=&quot;下载&quot;&gt;&lt;i class=&quot;ico-down&quot;&gt;&lt;/i&gt;&lt;/a&gt;&lt;i class=&quot;ico-{$vo.extension}-small&quot;&gt;&lt;/i&gt;&lt;a href=&quot;{:U(\'widget/Upload/down\',array(\'attach_id\'=&gt;$vo[\'attach_id\']))}&quot;&gt;{$vo.attach_name}&lt;/a&gt; &lt;span class=&quot;tips&quot;&gt;({$vo.size|byte_format})&lt;/span&gt;&lt;/li&gt;\r\n						&lt;/volist&gt;			\r\n						&lt;/ul&gt;\r\n				&lt;/div&gt;\r\n			 ]]&gt;\r\n		&lt;/body&gt;\r\n		&lt;feedAttr  comment=&quot;true&quot; repost=&quot;true&quot; favor=&quot;true&quot;  delete=&quot;true&quot; /&gt;\r\n');
INSERT INTO `ts_feed_node` VALUES ('5', 'weiba', 'weiba_post', '微吧原创', '&lt;title comment=&quot;feed标题&quot;&gt; \r\n			&lt;![CDATA[ {$actor}  ]]&gt;\r\n		&lt;/title&gt;\r\n		&lt;body comment=&quot;feed详细内容/引用的内容&quot;&gt;\r\n			&lt;![CDATA[ {$body}\r\n&lt;php&gt;if(APP_NAME != \'channel\'){&lt;/php&gt;\r\n&lt;a href=&quot;javascript:void(0)&quot; class=&quot;ico-details&quot; event-node =\'loadPost\' event-args=\'feed_id={$feedid}&amp;post_id={$app_row_id}\' id=&quot;{$app_row_id}&quot;&gt;&lt;i class=&quot;triangle-l&quot;&gt;&lt;/i&gt;查看全文&lt;/a&gt;&lt;div class=&quot;feed_img_lists&quot; style=&quot;display:none;&quot; id=&quot;post_{$feedid}_{$app_row_id}&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;php&gt;}else{&lt;/php&gt;\r\n&lt;a href=&quot;{:U(\'weiba/Index/postDetail\',array(\'post_id\'=&gt;$app_row_id))}&quot; class=&quot;ico-details&quot; target=&quot;_blank&quot;&gt;&lt;/a&gt;\r\n&lt;php&gt;}&lt;/php&gt;\r\n ]]&gt;\r\n		&lt;/body&gt;\r\n		&lt;feedAttr  comment=&quot;true&quot; repost=&quot;true&quot; favor=&quot;true&quot;  delete=&quot;true&quot; /&gt; ');

-- ----------------------------
-- Table structure for `ts_feed_topic`
-- ----------------------------
DROP TABLE IF EXISTS `ts_feed_topic`;
CREATE TABLE `ts_feed_topic` (
  `topic_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '话题ID',
  `topic_name` varchar(150) NOT NULL COMMENT '话题标题',
  `count` int(11) NOT NULL COMMENT '关联的动态数',
  `ctime` int(11) NOT NULL COMMENT '创建时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `lock` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否锁定',
  `domain` varchar(100) NOT NULL COMMENT '个性化地址',
  `recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `recommend_time` int(11) DEFAULT '0' COMMENT '推荐时间',
  `des` text COMMENT '详细内容',
  `outlink` varchar(100) DEFAULT NULL COMMENT '关联链接',
  `pic` varchar(255) DEFAULT NULL COMMENT '关联图片',
  `essence` tinyint(1) DEFAULT '0' COMMENT '是否精华',
  `note` varchar(255) DEFAULT NULL COMMENT '摘要',
  `topic_user` varchar(255) DEFAULT NULL COMMENT '话题人物推荐',
  PRIMARY KEY (`topic_id`),
  KEY `count` (`count`),
  KEY `name` (`topic_name`,`count`),
  KEY `recommend` (`recommend`,`lock`,`count`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_feed_topic
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_feed_topic_link`
-- ----------------------------
DROP TABLE IF EXISTS `ts_feed_topic_link`;
CREATE TABLE `ts_feed_topic_link` (
  `feed_topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `feed_id` int(11) NOT NULL COMMENT '动态ID',
  `topic_id` int(11) NOT NULL COMMENT '话题ID',
  `type` varchar(255) NOT NULL DEFAULT '0' COMMENT '动态类型ID',
  PRIMARY KEY (`feed_topic_id`),
  KEY `topic_type` (`topic_id`,`type`),
  KEY `weibo` (`feed_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_feed_topic_link
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_feedback`
-- ----------------------------
DROP TABLE IF EXISTS `ts_feedback`;
CREATE TABLE `ts_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feedbacktype` int(11) DEFAULT NULL COMMENT '反馈类型',
  `feedback` varchar(255) DEFAULT NULL COMMENT '反馈内容',
  `uid` int(11) DEFAULT NULL COMMENT '用户UID',
  `cTime` int(11) DEFAULT NULL COMMENT '创建时间',
  `mTime` int(11) DEFAULT NULL COMMENT '修改时间',
  `type` int(1) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_feedback_type`
-- ----------------------------
DROP TABLE IF EXISTS `ts_feedback_type`;
CREATE TABLE `ts_feedback_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '反馈类型ID',
  `type_name` varchar(255) NOT NULL COMMENT '反馈类型名称',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_feedback_type
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_find_password`
-- ----------------------------
DROP TABLE IF EXISTS `ts_find_password`;
CREATE TABLE `ts_find_password` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `email` varchar(100) CHARACTER SET latin1 NOT NULL COMMENT '用户email',
  `code` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT '改密字符串',
  `is_used` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已使用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_find_password
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_invite_code`
-- ----------------------------
DROP TABLE IF EXISTS `ts_invite_code`;
CREATE TABLE `ts_invite_code` (
  `invite_code_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `inviter_uid` int(11) unsigned NOT NULL COMMENT '邀请人UID',
  `code` varchar(120) NOT NULL COMMENT '邀请码',
  `is_used` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已使用',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为管理员邀请',
  `type` char(40) NOT NULL COMMENT '邀请码类型',
  `is_received` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已接受邀请',
  `receiver_uid` int(11) NOT NULL DEFAULT '0' COMMENT '邀请人UID',
  `receiver_email` varchar(50) DEFAULT NULL COMMENT '邀请人注册邮箱',
  `ctime` int(11) NOT NULL COMMENT '注册时间',
  PRIMARY KEY (`invite_code_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_invite_code
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_lang`
-- ----------------------------
DROP TABLE IF EXISTS `ts_lang`;
CREATE TABLE `ts_lang` (
  `lang_id` int(10) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL COMMENT 'key',
  `appname` varchar(50) NOT NULL COMMENT '所属应用名称',
  `filetype` tinyint(2) DEFAULT '0' COMMENT '针对的文件类型，0:php,1:js',
  `zh-cn` text NOT NULL COMMENT '中文',
  `en` text NOT NULL COMMENT '英文',
  `zh-tw` text NOT NULL COMMENT '繁体',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `app` (`appname`,`key`,`filetype`)
) ENGINE=MyISAM AUTO_INCREMENT=1885 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `ts_login`
-- ----------------------------
DROP TABLE IF EXISTS `ts_login`;
CREATE TABLE `ts_login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户UID',
  `type_uid` varchar(255) NOT NULL COMMENT '授权登陆用户名',
  `type` char(80) NOT NULL COMMENT '登陆类型',
  `oauth_token` varchar(150) DEFAULT NULL COMMENT '授权账号',
  `oauth_token_secret` varchar(150) DEFAULT NULL COMMENT '授权密码',
  `is_sync` tinyint(1) NOT NULL COMMENT '是否同步动态',
  PRIMARY KEY (`login_id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_login
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_login_logs`
-- ----------------------------
DROP TABLE IF EXISTS `ts_login_logs`;
CREATE TABLE `ts_login_logs` (
  `login_logs_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '登录日志ID - 主键',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `ip` varchar(15) DEFAULT NULL COMMENT '登录IP',
  `ctime` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`login_logs_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_login_logs
-- ----------------------------
INSERT INTO `ts_login_logs` VALUES ('1', '1', '127.0.0.1', '1383393833');
INSERT INTO `ts_login_logs` VALUES ('2', '1', '127.0.0.1', '1383393834');
INSERT INTO `ts_login_logs` VALUES ('3', '1', '127.0.0.1', '1383393834');
INSERT INTO `ts_login_logs` VALUES ('4', '2', '127.0.0.1', '1383394218');
INSERT INTO `ts_login_logs` VALUES ('5', '3', '127.0.0.1', '1383394297');
INSERT INTO `ts_login_logs` VALUES ('6', '2', '127.0.0.1', '1383394687');
INSERT INTO `ts_login_logs` VALUES ('7', '4', '127.0.0.1', '1383399401');

-- ----------------------------
-- Table structure for `ts_login_record`
-- ----------------------------
DROP TABLE IF EXISTS `ts_login_record`;
CREATE TABLE `ts_login_record` (
  `login_record_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用户UID',
  `ip` varchar(15) DEFAULT NULL COMMENT 'IP',
  `place` varchar(255) DEFAULT NULL COMMENT '地点',
  `ctime` int(11) DEFAULT NULL COMMENT '时间',
  `locktime` int(11) NOT NULL COMMENT '账号锁定截至日期',
  PRIMARY KEY (`login_record_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_login_record
-- ----------------------------
INSERT INTO `ts_login_record` VALUES ('1', '1', '127.0.0.1', null, '1383393834', '0');
INSERT INTO `ts_login_record` VALUES ('2', '2', '127.0.0.1', null, '1383394687', '0');
INSERT INTO `ts_login_record` VALUES ('3', '3', '127.0.0.1', null, '1383394297', '0');
INSERT INTO `ts_login_record` VALUES ('4', '4', '127.0.0.1', null, '1383399401', '0');

-- ----------------------------
-- Table structure for `ts_medal`
-- ----------------------------
DROP TABLE IF EXISTS `ts_medal`;
CREATE TABLE `ts_medal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '勋章名称',
  `desc` varchar(255) DEFAULT NULL COMMENT '勋章描述',
  `src` varchar(255) NOT NULL COMMENT '大图地址',
  `small_src` varchar(255) DEFAULT NULL COMMENT '小图地址',
  `type` int(11) DEFAULT NULL COMMENT '勋章类型',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `ts_medal_user`
-- ----------------------------
DROP TABLE IF EXISTS `ts_medal_user`;
CREATE TABLE `ts_medal_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户UID',
  `medal_id` int(11) NOT NULL COMMENT '勋章ID',
  `desc` varchar(255) DEFAULT NULL COMMENT '勋章获得说明',
  `ctime` int(11) DEFAULT NULL COMMENT '获取勋章时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_medal_id` (`uid`,`medal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_medal_user
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_message_content`
-- ----------------------------
DROP TABLE IF EXISTS `ts_message_content`;
CREATE TABLE `ts_message_content` (
  `message_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '私信内对话ID',
  `list_id` int(11) unsigned NOT NULL COMMENT '私信ID',
  `from_uid` int(11) unsigned NOT NULL COMMENT '会话发布者UID',
  `content` text COMMENT '会话内容',
  `attach_ids` text,
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除，0：否；1：是',
  `mtime` int(11) unsigned NOT NULL COMMENT '会话发布时间',
  PRIMARY KEY (`message_id`),
  KEY `list_id` (`list_id`,`is_del`,`mtime`),
  KEY `list_id_2` (`list_id`,`mtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_message_content
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_message_list`
-- ----------------------------
DROP TABLE IF EXISTS `ts_message_list`;
CREATE TABLE `ts_message_list` (
  `list_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '私信ID',
  `from_uid` int(11) unsigned NOT NULL COMMENT '私信发起者UID',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '私信类别，1：一对一；2：多人',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `member_num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '参与者数量',
  `min_max` varchar(255) DEFAULT NULL COMMENT '参与者UID正序排列，以下划线“_”链接',
  `mtime` int(11) unsigned NOT NULL COMMENT '发起时间戳',
  `last_message` text NOT NULL COMMENT '最新的一条会话',
  PRIMARY KEY (`list_id`),
  KEY `type` (`type`),
  KEY `min_max` (`min_max`),
  KEY `from_uid` (`from_uid`,`mtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_message_list
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_message_member`
-- ----------------------------
DROP TABLE IF EXISTS `ts_message_member`;
CREATE TABLE `ts_message_member` (
  `list_id` int(11) unsigned NOT NULL COMMENT '私信ID',
  `member_uid` int(11) unsigned NOT NULL COMMENT '参与私信的用户UID',
  `new` smallint(8) unsigned NOT NULL DEFAULT '0' COMMENT '未读消息数',
  `message_num` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '消息总数',
  `ctime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '该参与者最后会话时间',
  `list_ctime` int(11) unsigned NOT NULL COMMENT '私信最后会话时间',
  `is_del` int(11) NOT NULL COMMENT '是否删除（假的删除）',
  PRIMARY KEY (`list_id`,`member_uid`),
  KEY `new` (`new`),
  KEY `ctime` (`ctime`),
  KEY `list_ctime` (`list_ctime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_message_member
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_navi`
-- ----------------------------
DROP TABLE IF EXISTS `ts_navi`;
CREATE TABLE `ts_navi` (
  `navi_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '导航ID',
  `navi_name` varchar(255) DEFAULT NULL COMMENT '导航名称',
  `app_name` varchar(255) DEFAULT NULL COMMENT '应用标志，如index、home、public等',
  `url` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `target` varchar(10) DEFAULT NULL COMMENT '打开方式',
  `status` int(1) DEFAULT NULL COMMENT '状态（0关闭，1开启）',
  `position` varchar(10) DEFAULT NULL COMMENT '导航位置',
  `guest` int(1) DEFAULT NULL COMMENT '是否游客可见（0否，1是，默认1）',
  `is_app_navi` int(1) DEFAULT NULL COMMENT '是否应用内部导航 （0否，1是，默认1）',
  `parent_id` int(11) DEFAULT NULL COMMENT '（父导航，默认为0）',
  `order_sort` int(11) DEFAULT NULL COMMENT '应用排序 默认255',
  PRIMARY KEY (`navi_id`),
  KEY `status_postion` (`status`,`position`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_navi
-- ----------------------------
INSERT INTO `ts_navi` VALUES ('1', '首页', 'public', '{website}', '_self', '1', '0', '1', '0', '0', '1');
INSERT INTO `ts_navi` VALUES ('2', '频道', 'channel', '{website}/index.php?app=channel&mod=Index&act=index', '_self', '1', '0', '1', '0', '0', '3');
INSERT INTO `ts_navi` VALUES ('3', '找人', 'people', '{website}/index.php?app=people&mod=Index&act=index', '_self', '1', '0', '1', '0', '0', '2');
INSERT INTO `ts_navi` VALUES ('4', '微吧', 'weiba', '{website}/index.php?app=weiba&mod=Index&act=index', '_self', '1', '0', '1', '0', '0', '4');

-- ----------------------------
-- Table structure for `ts_notify_email`
-- ----------------------------
DROP TABLE IF EXISTS `ts_notify_email`;
CREATE TABLE `ts_notify_email` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(10) NOT NULL COMMENT 'UiD',
  `node` varchar(50) NOT NULL COMMENT '节点名称',
  `appname` varchar(50) NOT NULL COMMENT '应用名称',
  `email` varchar(250) NOT NULL COMMENT '邮件接受地址',
  `is_send` tinyint(2) NOT NULL COMMENT '是否已经发送',
  `title` varchar(250) NOT NULL COMMENT '邮件标题',
  `body` text NOT NULL COMMENT '邮件内容',
  `ctime` int(11) NOT NULL COMMENT '添加时间',
  `sendtime` int(11) NOT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_notify_email
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_notify_message`
-- ----------------------------
DROP TABLE IF EXISTS `ts_notify_message`;
CREATE TABLE `ts_notify_message` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'UID',
  `node` varchar(50) NOT NULL COMMENT '节点名称',
  `appname` varchar(50) NOT NULL COMMENT '应用名称',
  `title` varchar(250) NOT NULL COMMENT '标题',
  `body` text NOT NULL COMMENT '内容',
  `ctime` int(11) NOT NULL COMMENT '添加时间',
  `is_read` tinyint(2) NOT NULL COMMENT '是否已读',
  PRIMARY KEY (`id`),
  KEY `uid_read` (`uid`,`is_read`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_notify_message
-- ----------------------------
INSERT INTO `ts_notify_message` VALUES ('1', '2', 'digg', 'public', '山的那边 赞了你的微博', '<a href=\"http://localhost/ThinkSNS/index.php?app=public&mod=Profile&act=index&uid=3\" >山的那边</a> 赞了你的微博:<br/>867765846@qq.com/123456 <a href=\"http://localhost/ThinkSNS/index.php?app=public&mod=Profile&act=feed&feed_id=2&uid=2&digg=1\" target=‘_blank‘>去看看>></a>', '1383394317', '0');
INSERT INTO `ts_notify_message` VALUES ('2', '2', 'digg', 'public', '山的那边 赞了你的微博', '<a href=\"http://localhost/ThinkSNS/index.php?app=public&mod=Profile&act=index&uid=3\" >山的那边</a> 赞了你的微博:<br/>赞记录在哪里？ <a href=\"http://localhost/ThinkSNS/index.php?app=public&mod=Profile&act=feed&feed_id=6&uid=2&digg=1\" target=‘_blank‘>去看看>></a>', '1383399246', '0');
INSERT INTO `ts_notify_message` VALUES ('3', '2', 'digg', 'public', 'muxiaoshan 赞了你的微博', '<a href=\"http://localhost/ThinkSNS/index.php?app=public&mod=Profile&act=index&uid=4\" >muxiaoshan</a> 赞了你的微博:<br/>赞记录在哪里？ <a href=\"http://localhost/ThinkSNS/index.php?app=public&mod=Profile&act=feed&feed_id=6&uid=2&digg=1\" target=‘_blank‘>去看看>></a>', '1383399417', '0');

-- ----------------------------
-- Table structure for `ts_notify_node`
-- ----------------------------
DROP TABLE IF EXISTS `ts_notify_node`;
CREATE TABLE `ts_notify_node` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `node` varchar(50) NOT NULL COMMENT '节点名称',
  `nodeinfo` varchar(50) NOT NULL COMMENT '节点描述',
  `appname` varchar(50) NOT NULL COMMENT '应用名称',
  `content_key` varchar(50) NOT NULL COMMENT '内容key',
  `title_key` varchar(50) NOT NULL COMMENT '标题key',
  `send_email` tinyint(2) NOT NULL COMMENT '是否发送邮件',
  `send_message` tinyint(2) NOT NULL COMMENT '是否发送消息',
  `type` tinyint(2) NOT NULL COMMENT '信息类型：1 表示用户发送的 2表示是系统发送的',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `ts_online`
-- ----------------------------
DROP TABLE IF EXISTS `ts_online`;
CREATE TABLE `ts_online` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用户UID',
  `uname` varchar(50) NOT NULL COMMENT '用户名',
  `app` char(20) DEFAULT NULL COMMENT '应用',
  `ip` varchar(20) DEFAULT NULL COMMENT 'IP地址',
  `agent` char(20) DEFAULT NULL COMMENT '访问的浏览器',
  `activeTime` int(11) DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`id`),
  KEY `active_time` (`activeTime`),
  KEY `uid_ip` (`uid`,`ip`),
  KEY `uid_activeTime` (`uid`,`activeTime`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_online
-- ----------------------------
INSERT INTO `ts_online` VALUES ('1', '0', 'guest', 'public', '127.0.0.1', 'IE10.0', '1383394671');
INSERT INTO `ts_online` VALUES ('2', '1', '管理员', 'public', '127.0.0.1', 'IE10.0', '1383394157');
INSERT INTO `ts_online` VALUES ('3', '2', 'samsky', 'public', '127.0.0.1', 'Google', '1383399224');
INSERT INTO `ts_online` VALUES ('4', '3', '山的那边', 'public', '127.0.0.1', 'IE10.0', '1383399243');

-- ----------------------------
-- Table structure for `ts_online_logs`
-- ----------------------------
DROP TABLE IF EXISTS `ts_online_logs`;
CREATE TABLE `ts_online_logs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `day` date NOT NULL COMMENT '日期',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `uname` varchar(50) NOT NULL COMMENT '用户名称',
  `action` varchar(255) NOT NULL COMMENT '访问地址',
  `refer` text NOT NULL COMMENT '来源页面',
  `isGuest` tinyint(3) NOT NULL COMMENT '是否游客',
  `isIntranet` tinyint(3) NOT NULL COMMENT '是否内部用户',
  `ip` varchar(20) NOT NULL COMMENT 'IP',
  `agent` varchar(50) NOT NULL COMMENT '浏览器',
  `ext` varchar(20) NOT NULL COMMENT '扩展字段',
  `statsed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否已经统计过',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `ts_online_stats`
-- ----------------------------
DROP TABLE IF EXISTS `ts_online_stats`;
CREATE TABLE `ts_online_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` date NOT NULL COMMENT '日期',
  `total_users` int(11) NOT NULL DEFAULT '0' COMMENT '总用户数',
  `total_guests` int(11) NOT NULL DEFAULT '0' COMMENT '总游客数',
  `total_pageviews` int(11) NOT NULL DEFAULT '0' COMMENT '页面访问次数',
  `most_online_users` int(11) NOT NULL DEFAULT '0' COMMENT '最多在线用户数',
  `most_online_guests` int(11) NOT NULL DEFAULT '0' COMMENT '最多游客在线数',
  `most_online_time` int(11) DEFAULT NULL COMMENT '最大在线时间',
  `most_online` int(11) NOT NULL COMMENT '最大在线人数',
  PRIMARY KEY (`id`),
  KEY `day` (`day`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_online_stats
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_permission_group`
-- ----------------------------
DROP TABLE IF EXISTS `ts_permission_group`;
CREATE TABLE `ts_permission_group` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `appname` varchar(50) NOT NULL COMMENT '应用名称',
  `appgroup` varchar(50) NOT NULL COMMENT '应用组名称',
  `appgroup_name` varchar(50) NOT NULL COMMENT '组别名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_permission_group
-- ----------------------------
INSERT INTO `ts_permission_group` VALUES ('1', 'admin', 'admin', '普通管理员');
INSERT INTO `ts_permission_group` VALUES ('2', 'admin', 'superadmin', '超级管理员');

-- ----------------------------
-- Table structure for `ts_permission_node`
-- ----------------------------
DROP TABLE IF EXISTS `ts_permission_node`;
CREATE TABLE `ts_permission_node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appname` varchar(50) NOT NULL COMMENT '应用名称',
  `appinfo` varchar(50) NOT NULL COMMENT '应用说明',
  `module` varchar(50) NOT NULL COMMENT '模块名称',
  `rule` varchar(50) NOT NULL COMMENT '权限类型',
  `ruleinfo` varchar(50) NOT NULL COMMENT '权限名称',
  PRIMARY KEY (`id`),
  KEY `rule` (`rule`)
) ENGINE=MyISAM AUTO_INCREMENT=433 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_permission_node
-- ----------------------------
INSERT INTO `ts_permission_node` VALUES ('2', 'core', '核心', 'normal', 'feed_post', '发表微博');
INSERT INTO `ts_permission_node` VALUES ('3', 'core', '核心', 'normal', 'feed_comment', '评论微博');
INSERT INTO `ts_permission_node` VALUES ('4', 'core', '核心', 'normal', 'feed_report', '举报微博');
INSERT INTO `ts_permission_node` VALUES ('5', 'core', '核心', 'normal', 'feed_share', '分享微博');
INSERT INTO `ts_permission_node` VALUES ('6', 'core', '核心', 'admin', 'feed_del', '删除微博');
INSERT INTO `ts_permission_node` VALUES ('7', 'core', '核心', 'admin', 'comment_del', '删除评论');
INSERT INTO `ts_permission_node` VALUES ('8', 'core', '核心', 'admin', 'message_del', '删除私信');
INSERT INTO `ts_permission_node` VALUES ('9', 'core', '核心', 'admin', 'admin_login', '登录后台');
INSERT INTO `ts_permission_node` VALUES ('415', 'core', '核心', 'normal', 'feed_del', '前台删除微博');
INSERT INTO `ts_permission_node` VALUES ('416', 'core', '核心', 'normal', 'comment_del', '删除评论');
INSERT INTO `ts_permission_node` VALUES ('417', 'core', '核心', 'normal', 'search_info', '大搜索');
INSERT INTO `ts_permission_node` VALUES ('418', 'core', '核心', 'normal', 'send_message', '发私信');
INSERT INTO `ts_permission_node` VALUES ('419', 'core', '核心', 'normal', 'read_data', '浏览资料');
INSERT INTO `ts_permission_node` VALUES ('420', 'core', '核心', 'normal', 'invite_user', '邀请用户');
INSERT INTO `ts_permission_node` VALUES ('421', 'weiba', '微吧', 'normal', 'weiba_post', '微吧发帖');
INSERT INTO `ts_permission_node` VALUES ('422', 'weiba', '微吧', 'normal', 'weiba_reply', '微吧回帖');
INSERT INTO `ts_permission_node` VALUES ('423', 'weiba', '微吧', 'normal', 'weiba_del', '微吧删帖');
INSERT INTO `ts_permission_node` VALUES ('424', 'weiba', '微吧', 'normal', 'weiba_del_reply', '微吧删除回帖');
INSERT INTO `ts_permission_node` VALUES ('425', 'weiba', '微吧', 'normal', 'weiba_edit', '微吧编辑帖子');
INSERT INTO `ts_permission_node` VALUES ('426', 'weiba', '微吧', 'normal', 'weiba_apply_manage', '申请吧主');
INSERT INTO `ts_permission_node` VALUES ('427', 'weiba', '微吧', 'admin', 'weiba_recommend', '微吧推荐帖子');
INSERT INTO `ts_permission_node` VALUES ('428', 'weiba', '微吧', 'admin', 'weiba_top', '微吧置顶');
INSERT INTO `ts_permission_node` VALUES ('429', 'weiba', '微吧', 'admin', 'weiba_marrow', '微吧精华');
INSERT INTO `ts_permission_node` VALUES ('430', 'weiba', '微吧', 'admin', 'weiba_global_top', '微吧全局置顶');
INSERT INTO `ts_permission_node` VALUES ('431', 'weiba', '微吧', 'admin', 'weiba_del', '微吧删除帖子');
INSERT INTO `ts_permission_node` VALUES ('432', 'weiba', '微吧', 'admin', 'weiba_edit', '微吧编辑帖子');
INSERT INTO `ts_permission_node` VALUES ('10', 'channel', '频道', 'admin', 'channel_recommend', '推荐频道');
INSERT INTO `ts_permission_node` VALUES ('11', 'core', '核心', 'normal', 'feed_audit', '先审后发');

-- ----------------------------
-- Table structure for `ts_pic_show`
-- ----------------------------
DROP TABLE IF EXISTS `ts_pic_show`;
CREATE TABLE `ts_pic_show` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL COMMENT '照片URL地址',
  `title` varchar(255) DEFAULT NULL COMMENT '照片标题',
  `desc` varchar(255) DEFAULT NULL COMMENT '照片摘要',
  `target` varchar(20) DEFAULT NULL COMMENT '打开方式',
  `ctime` int(11) NOT NULL COMMENT '创建时间',
  `attachId` int(10) DEFAULT NULL COMMENT '照片ID',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_pic_show
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_schedule`
-- ----------------------------
DROP TABLE IF EXISTS `ts_schedule`;
CREATE TABLE `ts_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_to_run` varchar(255) NOT NULL COMMENT '计划任务执行方法',
  `schedule_type` varchar(255) NOT NULL COMMENT '执行频率',
  `modifier` varchar(255) DEFAULT NULL COMMENT '执行频率,类型为MONTHLY时必须；ONCE时无效；其他时为可选，默认为1',
  `dirlist` varchar(255) DEFAULT NULL COMMENT '指定周或月的一天或多天。只与WEEKLY和MONTHLY共同使用时有效，其他时忽略。',
  `month` varchar(255) DEFAULT NULL COMMENT '指定一年中的一个月或多个月.只在schedule_type=MONTHLY时有效，其他时忽略。当modifier=LASTDAY时必须，其他时可选。有效值：Jan - Dec，默认为*(每个月)',
  `start_datetime` datetime NOT NULL COMMENT '开始时间',
  `end_datetime` datetime DEFAULT NULL COMMENT '结束时间',
  `last_run_time` datetime DEFAULT NULL COMMENT '最近执行时间',
  `info` varchar(255) DEFAULT NULL COMMENT '对计划任务的简要描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_schedule
-- ----------------------------
INSERT INTO `ts_schedule` VALUES ('3', 'addons/Online/checkOnline', 'MINUTE', '1', '', '', '2013-03-01 18:18:00', '0000-00-00 00:00:00', '2013-11-02 21:36:00', '自动更新统计数');
INSERT INTO `ts_schedule` VALUES ('4', 'addons/Message/doSendFeedMail', 'MINUTE', '1', '', '', '2013-07-01 11:21:00', '2015-07-01 11:21:01', '2013-11-02 21:36:00', '每分钟都检查并发送一批邮件，给最近没登录的用户');

-- ----------------------------
-- Table structure for `ts_search`
-- ----------------------------
DROP TABLE IF EXISTS `ts_search`;
CREATE TABLE `ts_search` (
  `doc_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `app` varchar(30) DEFAULT NULL COMMENT '应用名',
  `type` varchar(50) DEFAULT NULL COMMENT '搜索类型',
  `string01` varchar(255) DEFAULT NULL COMMENT '文本扩展字段',
  `string02` varchar(255) DEFAULT NULL COMMENT '文本扩展字段',
  `string03` varchar(255) DEFAULT NULL COMMENT '文本扩展字段',
  `string04` varchar(255) DEFAULT NULL COMMENT '文本扩展字段',
  `string05` varchar(255) DEFAULT NULL COMMENT '文本扩展字段',
  `int01` int(11) DEFAULT NULL COMMENT '数字扩展字段',
  `int02` int(11) DEFAULT NULL COMMENT '数字扩展字段',
  `int03` int(11) DEFAULT NULL COMMENT '数字扩展字段',
  `int04` int(11) DEFAULT NULL COMMENT '数字扩展字段',
  `int05` int(11) DEFAULT NULL COMMENT '数字扩展字段',
  `int06` int(11) NOT NULL COMMENT '数字扩展字段',
  `int07` int(11) NOT NULL COMMENT '数字扩展字段',
  `int08` int(11) NOT NULL COMMENT '数字扩展字段',
  `int09` int(11) NOT NULL COMMENT '数字扩展字段',
  `int10` int(11) NOT NULL COMMENT '数字扩展字段',
  `file_path` varchar(255) DEFAULT NULL COMMENT '附件路径',
  `content` text COMMENT '搜索内容',
  `mtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data` text NOT NULL COMMENT '序列化存储的数据',
  PRIMARY KEY (`doc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_search
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_search_key`
-- ----------------------------
DROP TABLE IF EXISTS `ts_search_key`;
CREATE TABLE `ts_search_key` (
  `kid` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL COMMENT '搜索的关键词',
  `searchCount` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '搜索次数',
  `resultCount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '结果数',
  `suggest` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否显示在建议列表中',
  `data` text COMMENT '扩展字段',
  `mtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kid`),
  UNIQUE KEY `key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_search_key
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_search_select`
-- ----------------------------
DROP TABLE IF EXISTS `ts_search_select`;
CREATE TABLE `ts_search_select` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(20) NOT NULL COMMENT '应用名称',
  `app_id` tinyint(3) NOT NULL COMMENT '应用ID',
  `type` varchar(20) NOT NULL COMMENT '类型名称',
  `type_id` tinyint(3) NOT NULL COMMENT '类型在应用内定义的ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_search_select
-- ----------------------------
INSERT INTO `ts_search_select` VALUES ('1', 'public', '0', '用户', '1');
INSERT INTO `ts_search_select` VALUES ('2', 'public', '0', '微博', '2');

-- ----------------------------
-- Table structure for `ts_system_config`
-- ----------------------------
DROP TABLE IF EXISTS `ts_system_config`;
CREATE TABLE `ts_system_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `list` char(30) DEFAULT 'default' COMMENT '列表名',
  `key` char(50) DEFAULT 'default' COMMENT '键名',
  `value` text COMMENT '键值',
  `mtime` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `list_key` (`list`,`key`)
) ENGINE=MyISAM AUTO_INCREMENT=6578 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `ts_system_data`
-- ----------------------------
DROP TABLE IF EXISTS `ts_system_data`;
CREATE TABLE `ts_system_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `list` char(30) DEFAULT 'default' COMMENT '列表名',
  `key` char(50) DEFAULT 'default' COMMENT '键名',
  `value` text COMMENT '键值',
  `mtime` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `list_key` (`list`,`key`),
  KEY `list_id` (`list`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9743 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `ts_system_update`
-- ----------------------------
DROP TABLE IF EXISTS `ts_system_update`;
CREATE TABLE `ts_system_update` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `version` varchar(100) NOT NULL,
  `package` varchar(100) NOT NULL,
  `description` text,
  `status` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_system_update
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_tag`
-- ----------------------------
DROP TABLE IF EXISTS `ts_tag`;
CREATE TABLE `ts_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，标签编号',
  `name` varchar(255) NOT NULL COMMENT '标签名',
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `tag_name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_tag
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_task`
-- ----------------------------
DROP TABLE IF EXISTS `ts_task`;
CREATE TABLE `ts_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_level` int(11) DEFAULT NULL COMMENT '任务等级',
  `task_name` varchar(255) DEFAULT NULL COMMENT '任务名称',
  `task_type` int(11) DEFAULT NULL COMMENT '任务类型',
  `step_name` varchar(255) DEFAULT NULL COMMENT '任务步骤名称',
  `step_desc` varchar(500) DEFAULT NULL COMMENT '任务步骤说明',
  `condition` varchar(255) DEFAULT NULL COMMENT '任务条件',
  `action` varchar(255) DEFAULT NULL COMMENT '动作',
  `ctime` int(11) DEFAULT NULL COMMENT '创建时间',
  `reward` varchar(255) DEFAULT NULL COMMENT '任务奖励',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `ts_task_custom`
-- ----------------------------
DROP TABLE IF EXISTS `ts_task_custom`;
CREATE TABLE `ts_task_custom` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自定义任务ID',
  `task_name` varchar(255) DEFAULT NULL COMMENT '任务名称',
  `task_desc` varchar(255) DEFAULT NULL COMMENT '任务说明',
  `num` int(11) DEFAULT NULL COMMENT '剩余领取数',
  `condition` varchar(255) DEFAULT NULL COMMENT '任务完成条件',
  `task_condition` varchar(255) DEFAULT NULL COMMENT '前置任务',
  `reward` varchar(255) DEFAULT NULL COMMENT '任务奖励',
  `medal_id` int(11) DEFAULT NULL COMMENT '勋章ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_task_custom
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_task_receive`
-- ----------------------------
DROP TABLE IF EXISTS `ts_task_receive`;
CREATE TABLE `ts_task_receive` (
  `task_level` int(11) DEFAULT NULL COMMENT '任务等级',
  `task_type` int(11) DEFAULT NULL COMMENT '任务类型：每日任务 ，新手任务等等',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `ctime` int(11) DEFAULT NULL COMMENT '创建时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_task_receive
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_task_reward`
-- ----------------------------
DROP TABLE IF EXISTS `ts_task_reward`;
CREATE TABLE `ts_task_reward` (
  `task_type` int(11) DEFAULT NULL COMMENT '任务类型',
  `task_level` int(11) DEFAULT NULL COMMENT '任务等级',
  `reward` varchar(255) DEFAULT NULL COMMENT '任务奖励',
  UNIQUE KEY `index_type_level` (`task_type`,`task_level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_task_reward
-- ----------------------------
INSERT INTO `ts_task_reward` VALUES ('2', '1', '{\"exp\":50,\"score\":50,\"medal\":{\"id\":70,\"name\":\"\\u65b0\\u624b\\u4e0a\\u8def\",\"src\":\"2013\\/0121\\/11\\/50fcb0d64a404.png\"}}');
INSERT INTO `ts_task_reward` VALUES ('1', '1', '{\"exp\":10,\"score\":10,\"medal\":null}');
INSERT INTO `ts_task_reward` VALUES ('2', '5', '{\"exp\":1000,\"score\":1000,\"medal\":{\"id\":74,\"name\":\"\\u72ec\\u5b64\\u6c42\\u8d25\",\"src\":\"2013\\/0121\\/11\\/50fcb0426d7df.png\"}}');
INSERT INTO `ts_task_reward` VALUES ('2', '2', '{\"exp\":100,\"score\":100,\"medal\":{\"id\":71,\"name\":\"\\u5c0f\\u6709\\u8fdb\\u6b65\",\"src\":\"2013\\/0121\\/11\\/50fcb0c2a4fa2.png\"}}');
INSERT INTO `ts_task_reward` VALUES ('2', '3', '{\"exp\":200,\"score\":200,\"medal\":{\"id\":72,\"name\":\"\\u5fae\\u535a\\u8fbe\\u4eba\",\"src\":\"2013\\/0121\\/11\\/50fcb08b08634.png\"}}');
INSERT INTO `ts_task_reward` VALUES ('2', '4', '{\"exp\":400,\"score\":400,\"medal\":{\"id\":73,\"name\":\"\\u6b66\\u6797\\u9ad8\\u624b\",\"src\":\"2013\\/0121\\/11\\/50fcb062ed874.png\"}}');

-- ----------------------------
-- Table structure for `ts_task_user`
-- ----------------------------
DROP TABLE IF EXISTS `ts_task_user`;
CREATE TABLE `ts_task_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用户UID',
  `tid` int(11) DEFAULT NULL COMMENT '任务ID',
  `task_level` int(11) DEFAULT NULL COMMENT '任务等级',
  `task_type` varchar(255) DEFAULT NULL COMMENT '任务类型',
  `ctime` int(11) DEFAULT NULL COMMENT '创建时间',
  `status` int(11) DEFAULT NULL COMMENT '完成状态',
  `desc` varchar(255) DEFAULT NULL COMMENT '说明',
  `receive` int(11) DEFAULT '0' COMMENT '是否领取奖励',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_task_user
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_template`
-- ----------------------------
DROP TABLE IF EXISTS `ts_template`;
CREATE TABLE `ts_template` (
  `tpl_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '模板名，使用英文，保证唯一性。格式建议：“类型_动作”，如“blog_add”或“credit_blog_add”',
  `alias` varchar(255) DEFAULT NULL COMMENT '模板别名，如“发表博客”',
  `title` text COMMENT '标题模板，使用“{”和“}”包含变量名，如“{actor}做了{action}”',
  `body` text COMMENT '内容模板，使用“{”和“}”包含变量名，如“{actor}做了{action}增加了{volume}个{credit_type}”',
  `lang` varchar(255) NOT NULL DEFAULT 'zh' COMMENT '语言，与全局语言包一致，如“en”、“zh”等，目前只支持“zh”',
  `type` varchar(255) DEFAULT NULL COMMENT '模板类型，如blog,credit等',
  `type2` varchar(255) DEFAULT NULL COMMENT '模板类型2，备用类型，可留空。如“credit_blog”等',
  `is_cache` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否使用默认的模板缓存系统进行缓存，0：否；1：是',
  `ctime` int(11) DEFAULT NULL COMMENT '模板建立时间戳',
  PRIMARY KEY (`tpl_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_template
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_template_record`
-- ----------------------------
DROP TABLE IF EXISTS `ts_template_record`;
CREATE TABLE `ts_template_record` (
  `tpl_record_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '模板使用者UID',
  `tpl_name` varchar(255) NOT NULL DEFAULT '' COMMENT '模板名',
  `tpl_alias` varchar(255) DEFAULT NULL COMMENT '模板别名',
  `type` varchar(255) DEFAULT NULL COMMENT '模板类型',
  `type2` varchar(255) DEFAULT NULL COMMENT '模板类型2',
  `data` text COMMENT '记录模板变量数据',
  `ctime` int(11) DEFAULT NULL COMMENT '模板调用时间戳',
  PRIMARY KEY (`tpl_record_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_template_record
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_tips`
-- ----------------------------
DROP TABLE IF EXISTS `ts_tips`;
CREATE TABLE `ts_tips` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `source_id` int(10) NOT NULL COMMENT '资源ID',
  `source_table` varchar(20) NOT NULL COMMENT '资源所在表',
  `uid` int(10) NOT NULL COMMENT '用户ID',
  `type` tinyint(2) NOT NULL COMMENT '类型（0表示支持。1表示反对）',
  `ctime` int(11) NOT NULL COMMENT '添加时间',
  `ip` varchar(20) NOT NULL COMMENT '操作者IP',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_tips
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_ucenter_user_link`
-- ----------------------------
DROP TABLE IF EXISTS `ts_ucenter_user_link`;
CREATE TABLE `ts_ucenter_user_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uc_uid` mediumint(8) NOT NULL,
  `uc_username` char(15) NOT NULL,
  `uc_email` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_ucenter_user_link
-- ----------------------------

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

-- ----------------------------
-- Table structure for `ts_user_app`
-- ----------------------------
DROP TABLE IF EXISTS `ts_user_app`;
CREATE TABLE `ts_user_app` (
  `user_app_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '键主ID',
  `app_id` int(11) NOT NULL COMMENT '用应ID',
  `uid` int(11) NOT NULL COMMENT '安装者UID',
  `display_order` int(5) NOT NULL DEFAULT '0' COMMENT '装安的应用排序',
  `ctime` int(11) DEFAULT NULL COMMENT '装安时间戳',
  `type` varchar(100) DEFAULT NULL COMMENT '用应分类',
  `oauth_token` varchar(255) DEFAULT NULL COMMENT 'API的口令',
  `oauth_token_secret` varchar(255) DEFAULT NULL COMMENT 'API的密钥',
  `inweb` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否网页端，1是，0不是',
  PRIMARY KEY (`user_app_id`),
  KEY `app_id` (`app_id`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_user_app
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_user_blacklist`
-- ----------------------------
DROP TABLE IF EXISTS `ts_user_blacklist`;
CREATE TABLE `ts_user_blacklist` (
  `uid` int(11) NOT NULL COMMENT '户用UID',
  `fid` int(11) NOT NULL COMMENT '被屏蔽的用户UID',
  `ctime` int(11) NOT NULL COMMENT '操作时间戳',
  UNIQUE KEY `uid` (`uid`,`fid`),
  KEY `fid` (`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_user_blacklist
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_user_category`
-- ----------------------------
DROP TABLE IF EXISTS `ts_user_category`;
CREATE TABLE `ts_user_category` (
  `user_category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户分类ID - 主键',
  `title` varchar(255) NOT NULL COMMENT '用户分类名称',
  `pid` int(11) NOT NULL COMMENT '父级ID',
  `sort` int(11) NOT NULL COMMENT '排序值',
  PRIMARY KEY (`user_category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_user_category
-- ----------------------------
INSERT INTO `ts_user_category` VALUES ('1', '测试', '0', '1');
INSERT INTO `ts_user_category` VALUES ('2', '测试用户1', '1', '1');
INSERT INTO `ts_user_category` VALUES ('3', '测试用户2', '1', '2');
INSERT INTO `ts_user_category` VALUES ('4', '测试用户3', '1', '3');

-- ----------------------------
-- Table structure for `ts_user_category_link`
-- ----------------------------
DROP TABLE IF EXISTS `ts_user_category_link`;
CREATE TABLE `ts_user_category_link` (
  `user_category_link_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户分类关联表ID - 主键',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `user_category_id` int(11) NOT NULL COMMENT '用户分类ID',
  `sort` int(11) NOT NULL COMMENT '排序值',
  PRIMARY KEY (`user_category_link_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_user_category_link
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_user_change_style`
-- ----------------------------
DROP TABLE IF EXISTS `ts_user_change_style`;
CREATE TABLE `ts_user_change_style` (
  `uid` int(11) unsigned NOT NULL COMMENT '户用UID',
  `classname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '皮肤的样式表名称',
  `background` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '肤的皮背景图片地址',
  UNIQUE KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_user_change_style
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_user_credit_history`
-- ----------------------------
DROP TABLE IF EXISTS `ts_user_credit_history`;
CREATE TABLE `ts_user_credit_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '键主ID',
  `uid` int(11) NOT NULL COMMENT '操作用户UID',
  `info` varchar(255) DEFAULT NULL COMMENT '动作描述',
  `action` char(30) DEFAULT NULL COMMENT '作动',
  `type` char(10) NOT NULL DEFAULT 'credit' COMMENT '类型:（experience:经验 gold:财富）',
  `credit` mediumint(3) NOT NULL DEFAULT '0' COMMENT '富财或者经验的曾减值',
  `mtime` int(11) NOT NULL COMMENT '操作时间戳',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_user_credit_history
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_user_data`
-- ----------------------------
DROP TABLE IF EXISTS `ts_user_data`;
CREATE TABLE `ts_user_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` int(11) NOT NULL COMMENT '户用UID',
  `key` varchar(50) NOT NULL COMMENT 'Key',
  `value` text COMMENT '对应Key的 值',
  `mtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '前当时间戳',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user-key` (`uid`,`key`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_user_data
-- ----------------------------
INSERT INTO `ts_user_data` VALUES ('1', '1', 'feed_count', '1', '2013-11-02 20:08:58');
INSERT INTO `ts_user_data` VALUES ('2', '1', 'weibo_count', '1', '2013-11-02 20:08:58');
INSERT INTO `ts_user_data` VALUES ('3', '2', 'user_recentat', 'N;', '0000-00-00 00:00:00');
INSERT INTO `ts_user_data` VALUES ('24', '2', 'feed_count', '3', '2013-11-02 21:33:58');
INSERT INTO `ts_user_data` VALUES ('25', '2', 'weibo_count', '3', '2013-11-02 21:33:58');
INSERT INTO `ts_user_data` VALUES ('6', '3', 'following_count', '1', '2013-11-02 20:11:51');
INSERT INTO `ts_user_data` VALUES ('27', '2', 'follower_count', '2', '2013-11-02 21:36:53');
INSERT INTO `ts_user_data` VALUES ('28', '2', 'new_folower_count', '1', '2013-11-02 21:36:53');
INSERT INTO `ts_user_data` VALUES ('21', '2', 'unread_atme', '2', '2013-11-02 21:24:44');
INSERT INTO `ts_user_data` VALUES ('22', '3', 'feed_count', '2', '2013-11-02 21:24:44');
INSERT INTO `ts_user_data` VALUES ('23', '3', 'weibo_count', '2', '2013-11-02 21:24:44');
INSERT INTO `ts_user_data` VALUES ('12', '3', 'favorite_count', '1', '2013-11-02 20:12:05');
INSERT INTO `ts_user_data` VALUES ('13', '2', 'unread_comment', '1', '2013-11-02 20:12:16');
INSERT INTO `ts_user_data` VALUES ('15', '2', 'following_count', '1', '2013-11-02 20:18:24');
INSERT INTO `ts_user_data` VALUES ('29', '3', 'follower_count', '2', '2013-11-02 21:36:53');
INSERT INTO `ts_user_data` VALUES ('30', '3', 'new_folower_count', '2', '2013-11-02 21:36:53');
INSERT INTO `ts_user_data` VALUES ('18', '3', 'unread_comment', '1', '2013-11-02 20:46:46');
INSERT INTO `ts_user_data` VALUES ('26', '4', 'following_count', '2', '2013-11-02 21:36:53');

-- ----------------------------
-- Table structure for `ts_user_department`
-- ----------------------------
DROP TABLE IF EXISTS `ts_user_department`;
CREATE TABLE `ts_user_department` (
  `uid` int(10) NOT NULL COMMENT '用户ID',
  `department_id` int(10) NOT NULL COMMENT '部门ID',
  KEY `department_id` (`department_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_user_department
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_user_follow`
-- ----------------------------
DROP TABLE IF EXISTS `ts_user_follow`;
CREATE TABLE `ts_user_follow` (
  `follow_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` int(11) NOT NULL COMMENT '关注者ID',
  `fid` int(11) NOT NULL COMMENT '被关注者ID',
  `remark` varchar(50) NOT NULL COMMENT '备注',
  `ctime` int(11) NOT NULL COMMENT '关注时间',
  PRIMARY KEY (`follow_id`),
  UNIQUE KEY `uid-fid` (`uid`,`fid`),
  UNIQUE KEY `fid-uid` (`fid`,`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_user_follow
-- ----------------------------
INSERT INTO `ts_user_follow` VALUES ('1', '3', '2', '', '1383394311');
INSERT INTO `ts_user_follow` VALUES ('2', '2', '3', '', '1383394704');
INSERT INTO `ts_user_follow` VALUES ('3', '4', '2', '', '1383399413');
INSERT INTO `ts_user_follow` VALUES ('4', '4', '3', '', '1383399413');

-- ----------------------------
-- Table structure for `ts_user_follow_group`
-- ----------------------------
DROP TABLE IF EXISTS `ts_user_follow_group`;
CREATE TABLE `ts_user_follow_group` (
  `follow_group_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关注组ID',
  `uid` int(11) NOT NULL COMMENT '用户UID',
  `title` varchar(255) NOT NULL COMMENT '组名称',
  `ctime` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`follow_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_user_follow_group
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_user_follow_group_link`
-- ----------------------------
DROP TABLE IF EXISTS `ts_user_follow_group_link`;
CREATE TABLE `ts_user_follow_group_link` (
  `follow_group_link_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关注组联表ID',
  `follow_group_id` int(11) NOT NULL COMMENT '关注组ID',
  `follow_id` int(11) NOT NULL COMMENT 'user_follow  表中follow_id',
  `fid` int(11) NOT NULL COMMENT '被关注人ID',
  `uid` int(11) NOT NULL COMMENT '关注人ID',
  PRIMARY KEY (`follow_group_link_id`),
  UNIQUE KEY `follow_group_id` (`uid`,`fid`,`follow_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_user_follow_group_link
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_user_group`
-- ----------------------------
DROP TABLE IF EXISTS `ts_user_group`;
CREATE TABLE `ts_user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_group_name` varchar(255) NOT NULL COMMENT '用户组名称',
  `ctime` int(11) DEFAULT NULL COMMENT '创建时间',
  `user_group_icon` varchar(120) NOT NULL COMMENT '用户组图标名称',
  `user_group_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '组类型、0：普通组，1:特殊组，',
  `app_name` varchar(20) NOT NULL DEFAULT 'public' COMMENT '应用名称',
  `is_authenticate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为认证组',
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_user_group
-- ----------------------------
INSERT INTO `ts_user_group` VALUES ('1', '管理员', '1354605105', '-1', '0', 'public', '0');
INSERT INTO `ts_user_group` VALUES ('2', '巡逻员', '1363097759', 'v_02.gif', '0', 'public', '0');
INSERT INTO `ts_user_group` VALUES ('3', '正常用户', '1354605704', '-1', '0', 'public', '0');
INSERT INTO `ts_user_group` VALUES ('4', '禁言用户', '1354605046', 'v_04.png', '0', 'public', '0');
INSERT INTO `ts_user_group` VALUES ('5', '个人认证', '1350012209', 'v_01.gif', '0', 'public', '1');
INSERT INTO `ts_user_group` VALUES ('6', '企业/组织认证', '1350012483', 'v_06.gif', '0', 'public', '1');
INSERT INTO `ts_user_group` VALUES ('7', '达人用户', '1354605062', 'v_01.png', '0', 'public', '1');

-- ----------------------------
-- Table structure for `ts_user_group_link`
-- ----------------------------
DROP TABLE IF EXISTS `ts_user_group_link`;
CREATE TABLE `ts_user_group_link` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` int(10) NOT NULL COMMENT '户用UID',
  `user_group_id` int(10) NOT NULL COMMENT '户用组ID',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `user_group_id` (`user_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_user_group_link
-- ----------------------------
INSERT INTO `ts_user_group_link` VALUES ('1', '1', '1');
INSERT INTO `ts_user_group_link` VALUES ('2', '2', '3');
INSERT INTO `ts_user_group_link` VALUES ('3', '3', '3');
INSERT INTO `ts_user_group_link` VALUES ('4', '4', '3');

-- ----------------------------
-- Table structure for `ts_user_official`
-- ----------------------------
DROP TABLE IF EXISTS `ts_user_official`;
CREATE TABLE `ts_user_official` (
  `official_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `user_official_category_id` int(11) NOT NULL COMMENT '官方分类ID',
  `info` varchar(255) DEFAULT NULL COMMENT '官方用户信息',
  PRIMARY KEY (`official_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_user_official
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_user_official_category`
-- ----------------------------
DROP TABLE IF EXISTS `ts_user_official_category`;
CREATE TABLE `ts_user_official_category` (
  `user_official_category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '官方用户分类',
  `title` varchar(255) NOT NULL COMMENT '官方用户分类名称',
  `pid` int(11) NOT NULL COMMENT '父级分类ID',
  `sort` int(11) NOT NULL COMMENT '排序值',
  PRIMARY KEY (`user_official_category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_user_official_category
-- ----------------------------
INSERT INTO `ts_user_official_category` VALUES ('1', '官方分类1', '0', '1');
INSERT INTO `ts_user_official_category` VALUES ('2', '官方分类2', '0', '2');
INSERT INTO `ts_user_official_category` VALUES ('3', '官方分类3', '0', '3');

-- ----------------------------
-- Table structure for `ts_user_online`
-- ----------------------------
DROP TABLE IF EXISTS `ts_user_online`;
CREATE TABLE `ts_user_online` (
  `uid` int(11) NOT NULL COMMENT '户用UID',
  `ctime` int(11) NOT NULL COMMENT '最后一次操作动作时间戳，与当前时间相隔五分钟之内为在线',
  UNIQUE KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_user_online
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_user_privacy`
-- ----------------------------
DROP TABLE IF EXISTS `ts_user_privacy`;
CREATE TABLE `ts_user_privacy` (
  `uid` int(11) NOT NULL COMMENT '户用UID',
  `key` varchar(120) NOT NULL COMMENT '配置键名，如weibo_comment（评论）,message（私信）',
  `value` varchar(120) NOT NULL COMMENT '配置值，0：所有人(不包括你的黑名单用户)；1：我关注的人'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_user_privacy
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_user_profile`
-- ----------------------------
DROP TABLE IF EXISTS `ts_user_profile`;
CREATE TABLE `ts_user_profile` (
  `uid` int(11) unsigned NOT NULL COMMENT '户用UID',
  `field_id` smallint(8) unsigned NOT NULL COMMENT '数据资料ID',
  `field_data` text NOT NULL COMMENT '资料数据字段名',
  `privacy` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0：所有人，1：好友， 2：互相关注，3：关注我的，4：我关注的',
  UNIQUE KEY `uid` (`uid`,`field_id`),
  KEY `uid_2` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_user_profile
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_user_profile_setting`
-- ----------------------------
DROP TABLE IF EXISTS `ts_user_profile_setting`;
CREATE TABLE `ts_user_profile_setting` (
  `field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL DEFAULT '2' COMMENT '数据类型：1、分组，2、字段',
  `field_key` varchar(120) NOT NULL COMMENT '字段键值',
  `field_name` varchar(120) NOT NULL COMMENT '字段名称',
  `field_type` int(5) NOT NULL DEFAULT '0' COMMENT '字段类型ID，值为上一级字段ID，值为0时代表根分类',
  `visiable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否空间展示：默认1=可展示',
  `editable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可修改：默认1=可修改',
  `required` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否必填项：默认0=非必填',
  `privacy` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0：所有人，1：好友， 2：互相关注，3：关注我的，4：我关注的',
  `display_order` int(11) NOT NULL DEFAULT '0' COMMENT '字段排序符号值',
  `form_type` varchar(120) DEFAULT NULL COMMENT '字段表单类型：input、textarea、select、radio、checkbox、timeinput',
  `form_default_value` text COMMENT '默认选择的数据项',
  `validation` varchar(120) DEFAULT NULL COMMENT '前台表单验证的方法名',
  `tips` varchar(255) DEFAULT NULL COMMENT '提示说明',
  `is_system` int(2) NOT NULL DEFAULT '0' COMMENT '是否系统配置0不是，1是，系统的配置项不能删除，不能改key',
  PRIMARY KEY (`field_id`),
  KEY `type` (`type`,`field_key`,`display_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_user_profile_setting
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_user_verified`
-- ----------------------------
DROP TABLE IF EXISTS `ts_user_verified`;
CREATE TABLE `ts_user_verified` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` int(11) unsigned NOT NULL COMMENT '户用UID',
  `usergroup_id` int(11) NOT NULL COMMENT '认证类型，即所申请的认证组的ID',
  `user_verified_category_id` int(11) NOT NULL DEFAULT '0' COMMENT '认证分类ID',
  `company` varchar(255) NOT NULL COMMENT '公司名称',
  `realname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '真实姓名',
  `idcard` varchar(50) NOT NULL COMMENT '证件号码',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系方式',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '证认信息',
  `verified` tinyint(2) NOT NULL DEFAULT '0' COMMENT '认证状态，0：否；1：是',
  `attach_id` varchar(255) NOT NULL COMMENT '认证资料，存储用户上传的ID',
  `reason` varchar(255) DEFAULT NULL COMMENT '证认理由',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_user_verified
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_user_verified_category`
-- ----------------------------
DROP TABLE IF EXISTS `ts_user_verified_category`;
CREATE TABLE `ts_user_verified_category` (
  `user_verified_category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '认证分类主键',
  `title` varchar(225) NOT NULL COMMENT '认证分类名称',
  `pid` int(11) NOT NULL COMMENT '父分类ID',
  `sort` int(11) NOT NULL COMMENT '排序值',
  PRIMARY KEY (`user_verified_category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_user_verified_category
-- ----------------------------
INSERT INTO `ts_user_verified_category` VALUES ('1', '认证分类1', '5', '1');
INSERT INTO `ts_user_verified_category` VALUES ('2', '认证分类2', '6', '2');
INSERT INTO `ts_user_verified_category` VALUES ('3', '认证分类3', '7', '3');

-- ----------------------------
-- Table structure for `ts_weiba`
-- ----------------------------
DROP TABLE IF EXISTS `ts_weiba`;
CREATE TABLE `ts_weiba` (
  `weiba_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '微吧ID',
  `cid` int(11) DEFAULT NULL,
  `weiba_name` varchar(255) NOT NULL DEFAULT '微吧名称',
  `uid` int(11) NOT NULL COMMENT '创建者ID',
  `ctime` int(11) NOT NULL COMMENT '创建时间',
  `logo` varchar(255) DEFAULT NULL COMMENT '微吧logo',
  `intro` text COMMENT '微吧简介',
  `who_can_post` tinyint(1) NOT NULL DEFAULT '0' COMMENT '发帖权限 0-所有人 1-仅成员',
  `who_can_reply` tinyint(1) NOT NULL DEFAULT '0' COMMENT '回帖权限 0-所有人 1-仅成员',
  `follower_count` int(10) DEFAULT '0' COMMENT '成员数',
  `thread_count` int(10) DEFAULT '0' COMMENT '帖子数',
  `admin_uid` int(11) NOT NULL COMMENT '超级吧主uid',
  `recommend` tinyint(1) DEFAULT '0' COMMENT '是否设为推荐（热门）0-否，1-是',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否通过审核：0-未通过，1-已通过',
  `is_del` int(2) DEFAULT '0' COMMENT '是否删除 默认为0',
  `notify` varchar(255) DEFAULT NULL COMMENT '微吧公告',
  PRIMARY KEY (`weiba_id`),
  KEY `recommend` (`recommend`,`is_del`),
  KEY `count` (`is_del`,`follower_count`,`thread_count`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_weiba
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_weiba_apply`
-- ----------------------------
DROP TABLE IF EXISTS `ts_weiba_apply`;
CREATE TABLE `ts_weiba_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `follower_uid` int(11) NOT NULL COMMENT '申请者UID',
  `weiba_id` int(11) NOT NULL COMMENT '微吧id',
  `type` tinyint(2) NOT NULL COMMENT '申请类型 1-吧主 2-小吧',
  `reason` varchar(255) DEFAULT NULL COMMENT '申请原因',
  `status` tinyint(2) NOT NULL COMMENT '状态 0-待审核 1-审核通过 -1-驳回',
  `manager_uid` int(11) NOT NULL COMMENT '操作者UID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_weiba_apply
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_weiba_category`
-- ----------------------------
DROP TABLE IF EXISTS `ts_weiba_category`;
CREATE TABLE `ts_weiba_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_weiba_category
-- ----------------------------
INSERT INTO `ts_weiba_category` VALUES ('1', '分类1');
INSERT INTO `ts_weiba_category` VALUES ('2', '分类2');
INSERT INTO `ts_weiba_category` VALUES ('3', '分类3');

-- ----------------------------
-- Table structure for `ts_weiba_favorite`
-- ----------------------------
DROP TABLE IF EXISTS `ts_weiba_favorite`;
CREATE TABLE `ts_weiba_favorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '收藏者UID',
  `post_id` int(11) NOT NULL COMMENT '帖子ID',
  `weiba_id` int(11) NOT NULL COMMENT '微吧ID',
  `post_uid` int(11) NOT NULL COMMENT '发布者UID',
  `favorite_time` int(11) NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_weiba_favorite
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_weiba_follow`
-- ----------------------------
DROP TABLE IF EXISTS `ts_weiba_follow`;
CREATE TABLE `ts_weiba_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `weiba_id` int(11) NOT NULL COMMENT '微吧ID',
  `follower_uid` int(11) NOT NULL COMMENT '成员ID',
  `level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '等级 1-粉丝 2-小吧 3-吧主',
  PRIMARY KEY (`id`),
  KEY `uid` (`follower_uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_weiba_follow
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_weiba_log`
-- ----------------------------
DROP TABLE IF EXISTS `ts_weiba_log`;
CREATE TABLE `ts_weiba_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weiba_id` int(11) NOT NULL COMMENT '微吧ID',
  `uid` int(11) NOT NULL COMMENT '操作者UID',
  `type` varchar(10) NOT NULL COMMENT '操作类型',
  `content` text NOT NULL COMMENT '管理内容',
  `ctime` int(11) NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_weiba_log
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_weiba_post`
-- ----------------------------
DROP TABLE IF EXISTS `ts_weiba_post`;
CREATE TABLE `ts_weiba_post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '帖子ID',
  `weiba_id` int(11) NOT NULL COMMENT '所属微吧ID',
  `post_uid` int(11) NOT NULL COMMENT '发表者uid',
  `title` varchar(255) NOT NULL COMMENT '帖子标题',
  `content` text NOT NULL COMMENT '帖子内容',
  `post_time` int(11) NOT NULL COMMENT '发表时间',
  `reply_count` int(10) DEFAULT '0' COMMENT '回复数',
  `read_count` int(10) DEFAULT '0' COMMENT '浏览数',
  `last_reply_uid` int(11) DEFAULT '0' COMMENT '最后回复人',
  `last_reply_time` int(11) DEFAULT '0' COMMENT '最后回复时间',
  `digest` tinyint(1) DEFAULT '0' COMMENT '全局精华 0-否 1-是',
  `top` tinyint(1) DEFAULT '0' COMMENT '置顶帖 0-否 1-吧内 2-全局',
  `lock` tinyint(1) DEFAULT '0' COMMENT '锁帖（不允许回复）0-否 1-是',
  `recommend` tinyint(1) DEFAULT '0' COMMENT '是否设为推荐',
  `recommend_time` int(11) DEFAULT '0' COMMENT '设为推荐的时间',
  `is_del` tinyint(2) DEFAULT '0' COMMENT '是否已删除 0-否 1-是',
  `feed_id` int(11) NOT NULL COMMENT '对应的微博ID',
  `reply_all_count` int(11) NOT NULL DEFAULT '0' COMMENT '全部评论数目',
  `attach` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `id_recommend` (`recommend_time`,`weiba_id`,`recommend`),
  KEY `post_time` (`post_time`,`weiba_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_weiba_post
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_weiba_reply`
-- ----------------------------
DROP TABLE IF EXISTS `ts_weiba_reply`;
CREATE TABLE `ts_weiba_reply` (
  `reply_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '回复ID',
  `weiba_id` int(11) NOT NULL COMMENT '所属微吧',
  `post_id` int(11) NOT NULL COMMENT '所属帖子ID',
  `post_uid` int(11) NOT NULL COMMENT '帖子作者UID',
  `uid` int(11) NOT NULL COMMENT '回复者ID',
  `to_reply_id` int(11) NOT NULL DEFAULT '0' COMMENT '回复的评论id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被回复的评论的作者的uid',
  `ctime` int(11) NOT NULL COMMENT '回复时间',
  `content` text NOT NULL COMMENT '回复内容',
  `is_del` tinyint(2) DEFAULT '0' COMMENT '是否已删除 0-否 1-是',
  `comment_id` int(11) NOT NULL COMMENT '对应的微博评论ID',
  `storey` int(11) NOT NULL DEFAULT '0' COMMENT '绝对楼层',
  PRIMARY KEY (`reply_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_weiba_reply
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_x_article`
-- ----------------------------
DROP TABLE IF EXISTS `ts_x_article`;
CREATE TABLE `ts_x_article` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标题',
  `uid` int(10) NOT NULL COMMENT '发布者ID',
  `mtime` int(11) NOT NULL COMMENT '修改时间',
  `sort` tinyint(5) NOT NULL COMMENT '排序',
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '内容',
  `attach` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '附件信息',
  `type` tinyint(3) NOT NULL COMMENT '类型:1公告，2页脚配置文章',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_x_article
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_x_logs`
-- ----------------------------
DROP TABLE IF EXISTS `ts_x_logs`;
CREATE TABLE `ts_x_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `uname` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '帐号\r\n',
  `app_name` char(80) NOT NULL COMMENT '日志所属应用',
  `group` char(80) DEFAULT NULL COMMENT '日志分组',
  `action` char(80) NOT NULL COMMENT '日志行为',
  `ip` varchar(80) DEFAULT NULL COMMENT 'IP地址',
  `data` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '序列化保存的模板变量',
  `url` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '记录日志时的URL地址',
  `ctime` int(11) NOT NULL COMMENT '创建时间',
  `isAdmin` tinyint(2) NOT NULL COMMENT '是否是管理员日志',
  `keyword` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '模板变量值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_x_logs
-- ----------------------------
