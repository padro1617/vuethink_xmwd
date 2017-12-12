# Host: localhost  (Version: 5.5.53)
# Date: 2017-12-12 12:18:53
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "oa_admin_access"
#

CREATE TABLE `oa_admin_access` (
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "oa_admin_access"
#

INSERT INTO `oa_admin_access` VALUES (2,17),(4,17),(3,17),(6,17),(7,15),(8,15),(9,15),(11,15),(12,15),(13,15),(14,15),(15,15),(16,15);

#
# Structure for table "oa_admin_group"
#

CREATE TABLE `oa_admin_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `rules` varchar(4000) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

#
# Data for table "oa_admin_group"
#

INSERT INTO `oa_admin_group` VALUES (15,'注册用户','10',0,'注册用户',1),(16,'推广员','10',0,'推广员身份',1),(17,'普通管理员','10,30,31,32,33,34,35,36,37,59,62,63,38,39,40,41,42,43,44,45,28,29',0,'普通管理员',1);

#
# Structure for table "oa_admin_menu"
#

CREATE TABLE `oa_admin_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `pid` int(11) unsigned DEFAULT '0' COMMENT '上级菜单ID',
  `title` varchar(32) DEFAULT '' COMMENT '菜单名称',
  `url` varchar(127) DEFAULT '' COMMENT '链接地址',
  `icon` varchar(64) DEFAULT '' COMMENT '图标',
  `menu_type` tinyint(4) DEFAULT NULL COMMENT '菜单类型',
  `sort` tinyint(4) unsigned DEFAULT '0' COMMENT '排序（同级有效）',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态',
  `rule_id` int(11) DEFAULT NULL COMMENT '权限id',
  `module` varchar(50) DEFAULT NULL,
  `menu` varchar(50) DEFAULT NULL COMMENT '三级菜单吗',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='【配置】后台菜单表';

#
# Data for table "oa_admin_menu"
#

INSERT INTO `oa_admin_menu` VALUES (52,0,'管理','','',1,0,1,59,'Administrative',''),(53,52,'系统配置','','',1,0,1,61,'Administrative',''),(54,53,'菜单管理','/home/menu/list','',1,0,1,21,'Administrative','menu'),(55,53,'系统参数','/home/config/add','',1,0,1,38,'Administrative','structures'),(56,53,'权限规则','/home/rule/list','',1,0,1,13,'Administrative','rule'),(57,52,'数据管理','','',1,0,1,63,'Administrative',''),(58,57,'轮播图管理','/home/position/list','',1,0,1,31,'Administrative','position'),(59,57,'回收列表','/home/structures/list','',1,0,1,39,'Administrative','structures'),(60,57,'用户组管理','/home/groups/list','',1,0,1,47,'Administrative','groups'),(61,52,'成员管理','','',1,0,1,62,'Administrative',''),(62,61,'推广员管理','/home/users/list','',1,0,1,55,'Administrative','users'),(64,61,'注册用户管理','/home/users/inlist','',2,2,1,54,'Administrative','users'),(65,61,'用户统计导出','/home/users/tjlist','',1,4,1,55,'Administrative','users'),(66,57,'音频规则','/home/structures/config','',1,4,1,39,'Administrative','structures');

#
# Structure for table "oa_admin_post"
#

CREATE TABLE `oa_admin_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL COMMENT '岗位名称',
  `logo` varchar(255) DEFAULT '' COMMENT '图片链接地址',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '轮播图类型',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) DEFAULT NULL COMMENT '数据创建时间',
  `status` tinyint(5) DEFAULT '1' COMMENT '状态1启用,0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='岗位表';

#
# Data for table "oa_admin_post"
#

INSERT INTO `oa_admin_post` VALUES (33,'轮播图片1','http://vr.yunwucm.com/template/yw_default/images/index/p2.jpg','首页','',1509630485,1),(34,'轮播图片2','http://vr.yunwucm.com/template/yw_default/images/index/p1.jpg','首页',NULL,NULL,1),(35,'轮播图片3','http://vr.yunwucm.com/template/yw_default/images/index/p3.jpg','首页','',1510749973,1),(36,'手机回收大图','http://vr.yunwucm.com/template/yw_default/images/index/p4.jpg','回收页','',1513000696,1),(37,'折扣规则轮播图','http://vr.yunwucm.com/template/yw_default/images/index/p4.jpg','规则页',NULL,NULL,1);

#
# Structure for table "oa_admin_postlog"
#

CREATE TABLE `oa_admin_postlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `postid` int(11) NOT NULL DEFAULT '0' COMMENT '平台ID-外键',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `create_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '点击时间',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间点 用户匹配防刷功能',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='点击日志';

#
# Data for table "oa_admin_postlog"
#

INSERT INTO `oa_admin_postlog` VALUES (1,34,7,'2017-11-02 10:19:22',0),(2,33,7,'2017-11-02 10:37:26',1509590246),(3,34,7,'2017-11-02 10:39:07',1509590347),(4,34,7,'2017-11-02 10:39:19',1509590359),(5,33,7,'2017-11-02 10:39:37',1509590377),(6,33,7,'2017-11-02 10:43:57',1509590637),(7,34,7,'2017-11-02 10:45:33',1509590733),(8,34,7,'2017-11-02 10:49:35',1509590975),(9,34,7,'2017-11-02 10:50:20',1509591020),(10,33,7,'2017-11-02 11:01:04',1509591664),(11,33,13,'2017-11-03 13:10:21',1509685821),(12,33,15,'2017-11-03 14:05:51',1509689151);

#
# Structure for table "oa_admin_rule"
#

CREATE TABLE `oa_admin_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT '' COMMENT '名称',
  `name` varchar(100) DEFAULT '' COMMENT '定义',
  `level` tinyint(5) DEFAULT NULL COMMENT '级别。1模块,2控制器,3操作',
  `pid` int(11) DEFAULT '0' COMMENT '父id，默认0',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态，1启用，0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

#
# Data for table "oa_admin_rule"
#

INSERT INTO `oa_admin_rule` VALUES (10,'系统基础功能','admin',1,0,1),(11,'权限规则','rules',2,10,1),(13,'规则列表','index',3,11,1),(14,'权限详情','read',3,11,1),(15,'编辑权限','update',3,11,1),(16,'删除权限','delete',3,11,1),(17,'添加权限','save',3,11,1),(18,'批量删除权限','deletes',3,11,1),(19,'批量启用/禁用权限','enables',3,11,1),(20,'菜单管理','menus',2,10,1),(21,'菜单列表','index',3,20,1),(22,'添加菜单','save',3,20,1),(23,'菜单详情','read',3,20,1),(24,'编辑菜单','update',3,20,1),(25,'删除菜单','delete',3,20,1),(26,'批量删除菜单','deletes',3,20,1),(27,'批量启用/禁用菜单','enables',3,20,1),(28,'系统管理','systemConfigs',2,10,1),(29,'修改系统配置','save',3,28,1),(30,'岗位管理','posts',2,10,1),(31,'岗位列表','index',3,30,1),(32,'岗位详情','read',3,30,1),(33,'编辑岗位','update',3,30,1),(34,'删除岗位','delete',3,30,1),(35,'添加岗位','save',3,30,1),(36,'批量删除岗位','deletes',3,30,1),(37,'批量启用/禁用岗位','enables',3,30,1),(38,'部门管理','structures',2,10,1),(39,'部门列表','index',3,38,1),(40,'部门详情','read',3,38,1),(41,'编辑部门','update',3,38,1),(42,'删除部门','delete',3,38,1),(43,'添加部门','save',3,38,1),(44,'批量删除部门','deletes',3,38,1),(45,'批量启用/禁用部门','enables',3,38,1),(46,'用户组管理','groups',2,10,1),(47,'用户组列表','index',3,46,1),(48,'用户组详情','read',3,46,1),(49,'编辑用户组','update',3,46,1),(50,'删除用户组','delete',3,46,1),(51,'添加用户组','save',3,46,1),(52,'批量删除用户组','deletes',3,46,1),(53,'批量启用/禁用用户组','enables',3,46,1),(54,'成员管理','users',2,10,1),(55,'成员列表','index',3,54,1),(56,'成员详情','read',3,54,1),(57,'删除成员','delete',3,54,1),(59,'管理菜单','Adminstrative',2,10,1),(61,'系统管理二级菜单','systemConfig',1,59,1),(62,'账户管理二级菜单','personnel',3,59,1),(63,'组织架构二级菜单','structures',3,59,1),(64,'成员添加','save',3,54,1);

#
# Structure for table "oa_admin_structure"
#

CREATE TABLE `oa_admin_structure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT '' COMMENT '机型',
  `guige` varchar(200) DEFAULT '0' COMMENT '规格',
  `status` tinyint(3) DEFAULT '1',
  `prize` varchar(255) DEFAULT NULL COMMENT '回收价格',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

#
# Data for table "oa_admin_structure"
#

INSERT INTO `oa_admin_structure` VALUES (1,'红米1','1代',1,'100','红米1'),(2,'红米2','红米2',1,'100','红米2'),(3,'红米3','红米3',1,'120','红米3'),(4,'红米4','红米4',1,'242','红米4'),(5,'红米5','红米5',1,'246','红米5'),(6,'红米6','红米6',1,'344','红米6'),(7,'红米7','红米7',1,'443','红米7'),(8,'红米8','红米8',1,'444','红米8'),(9,'坚固pro','坚固pro',1,'1450','坚固pro'),(10,'坚固pro2','坚固pro2',1,'3458','坚固pro2');

#
# Structure for table "oa_admin_user"
#

CREATE TABLE `oa_admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) DEFAULT NULL COMMENT '管理后台账号',
  `password` varchar(100) DEFAULT NULL COMMENT '管理后台密码',
  `phone` varchar(25) NOT NULL DEFAULT '' COMMENT '手机号码',
  `remark` varchar(100) DEFAULT '' COMMENT '用户备注',
  `idcard` varchar(50) DEFAULT '' COMMENT '身份证号码',
  `bankcard` varchar(255) DEFAULT '' COMMENT '银行卡号',
  `bankphone` varchar(25) DEFAULT '' COMMENT '银行预留手机号码',
  `realname` varchar(100) DEFAULT '' COMMENT '真实姓名',
  `tcode` varchar(11) NOT NULL DEFAULT '' COMMENT '推广码 注册用户为空字符',
  `tuid` int(11) NOT NULL DEFAULT '0' COMMENT '所属推广员ID -1代表推广员 0代表来着网络',
  `status` tinyint(3) DEFAULT '0' COMMENT '状态,1启用0禁用',
  `create_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_phone_unique` (`phone`) COMMENT '电话号码唯一'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "oa_admin_user"
#

INSERT INTO `oa_admin_user` VALUES (1,'admin_padro','d93a5def7511da3d0f2d171d9c344e91','12527293425','','','','','超级管理员','1',0,1,NULL),(2,'admin1','d93a5def7511da3d0f2d171d9c344e91','13524262428','管理员','','','','管理员','1',0,1,1509374223),(3,'admin2','0144712dd81be0c3d9724f5e56ce6685','13527293422','管理员','','','','管理员','',0,1,1509543592);

#
# Structure for table "oa_system_config"
#

CREATE TABLE `oa_system_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(50) DEFAULT '',
  `value` text COMMENT '配置值',
  `group` tinyint(4) unsigned DEFAULT '0' COMMENT '配置分组',
  `need_auth` tinyint(4) DEFAULT '1' COMMENT '1需要登录后才能获取，0不需要登录即可获取',
  PRIMARY KEY (`id`),
  UNIQUE KEY `参数名` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='【配置】系统配置表';

#
# Data for table "oa_system_config"
#

INSERT INTO `oa_system_config` VALUES (1,'SYSTEM_NAME','网贷小猫-管理员登录',0,1),(2,'SYSTEM_LOGO','https://cn.vuejs.org/images/logo.png',0,1),(3,'LOGIN_SESSION_VALID','1644',0,1),(4,'IDENTIFYING_CODE','0',0,1),(6,'GUIZHE','简介ppp',0,1),(7,'MP3','http://qnkr.yunwucm.com/storage/upload/audio/bg_lpnnan.mp3',0,1);
