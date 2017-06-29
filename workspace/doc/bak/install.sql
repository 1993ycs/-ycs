
--
-- 数据字典表
--
DROP TABLE IF EXISTS `t_consts_dictionary`;

CREATE TABLE `t_consts_dictionary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_code` int(11) NOT NULL DEFAULT 0 COMMENT '分组code',
  `group_name` varchar(32) NOT NULL DEFAULT '' COMMENT '分组名称',
  `key` varchar(32) NOT NULL DEFAULT ''  COMMENT '键',
  `value` varchar(128) NOT NULL DEFAULT ''  COMMENT '值',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ,
  `create_user` varchar(32) NOT NULL DEFAULT 'system',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_user` varchar(32) NOT NULL DEFAULT 'system',
  `del` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典：可用于可选项值的配置等';

--
-- 高校表
--
DROP TABLE IF EXISTS `t_consts_college`;

CREATE TABLE `t_consts_college` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100)  NOT NULL DEFAULT '' COMMENT '名称',
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT '编码',
  `picture` varchar(100)  NOT NULL DEFAULT '' COMMENT '图片',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ,
  `create_user` varchar(32) NOT NULL DEFAULT 'system',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_user` varchar(32) NOT NULL DEFAULT 'system',
  `del` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='高校表结构';


--
-- 课程类别，只有2级；
--
DROP TABLE IF EXISTS `t_consts_classify`;

CREATE TABLE `t_consts_classify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100)  NOT NULL DEFAULT '' COMMENT '名称',
  `code` varchar(50)  NOT NULL DEFAULT '' COMMENT '编码',
  `parent_code` varchar(50) NOT NULL DEFAULT '0' COMMENT '父类别code',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ,
  `create_user` varchar(32) NOT NULL DEFAULT 'system',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_user` varchar(32) NOT NULL DEFAULT 'system',
  `del` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程类别表';

--
-- 首页轮播表
--
DROP TABLE IF EXISTS `t_consts_site_carousel`;

CREATE TABLE `t_consts_site_carousel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100)  NOT NULL DEFAULT '' COMMENT '名称',
  `picture` varchar(100)  NOT NULL DEFAULT '' COMMENT '图片',
  `url` varchar(200)  NOT NULL DEFAULT '' COMMENT '链接',
  `weight` int(11) NOT NULL DEFAULT 0 COMMENT '权重',
  `enable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否可用',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ,
  `create_user` varchar(32) NOT NULL DEFAULT 'system',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_user` varchar(32) NOT NULL DEFAULT 'system',
  `del` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='首页轮播表';


--
-- 用户表
--
DROP TABLE IF EXISTS `t_auth_user`;

CREATE TABLE `t_auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `realname` varchar(20) NOT NULL DEFAULT '' COMMENT '登录用户名',
  `username` varchar(10) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `password` varchar(32) NOT NULL DEFAULT  '' COMMENT '密码',
  `gender` tinyint(1) NOT NULL DEFAULT 1 COMMENT '性别',
  `header` varchar(128) NOT NULL DEFAULT  '' COMMENT '头像',
  `mobile` varchar(15) NOT NULL DEFAULT  '' COMMENT '手机号码',
  `status` tinyint(1) NOT NULL DEFAULT 2 COMMENT '状态：待审核（0），有效（1），无效（3）',
  `birthday` date NOT NULL DEFAULT '1900-01-01',
  `education` varchar(20) NOT NULL DEFAULT '' COMMENT '学历：大专、本科、硕士、博士、博士后',
  `cert_no` varchar(50) NOT NULL DEFAULT '' COMMENT '资格证书编号',
  `title` varchar(100) NOT NULL DEFAULT  '' COMMENT '头衔',
  `sign` varchar(200) NOT NULL DEFAULT '' COMMENT '签名',
  `open_id` varchar(128) NOT NULL DEFAULT '' COMMENT '微信公众号openid',
  `wechat_id` varchar(100) NOT NULL DEFAULT '' COMMENT '微信号',
  `qq` varchar(20) NOT NULL DEFAULT '' COMMENT 'qq号',
  `college_code` varchar(50) NOT NULL DEFAULT '' COMMENT '大学编号',
  `college_name` varchar(50) NOT NULL DEFAULT '' COMMENT '大学名称',
  `login_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后一次登录时间',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后一次登录IP',
  `province` varchar(16) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(16) NOT NULL DEFAULT '' COMMENT '所在城市',
  `district` varchar(16) NOT NULL DEFAULT '' COMMENT '所在地区',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ,
  `create_user` varchar(32) NOT NULL DEFAULT 'system',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_user` varchar(32) NOT NULL DEFAULT 'system',
  `del` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `T_AUTH_USER_USERNAME_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- t_auth_role、t_auth_right （用户角色权限 略）
--

--
-- 用户收藏
--
DROP TABLE IF EXISTS `t_user_collections`;
CREATE TABLE `t_user_collections` (
`id`  int(11) NOT NULL  AUTO_INCREMENT,
`user_id`  int(11) NOT NULL DEFAULT 0 COMMENT '用户id',
`classify`  int(11)  NOT NULL DEFAULT 0 COMMENT '用户收藏分类',
`tips`  varchar(100) NOT NULL DEFAULT '' COMMENT '用户收藏备注' ,
`create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`create_user` varchar(32) NOT NULL DEFAULT 'system',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
`update_user` varchar(32) NOT NULL DEFAULT 'system',
`del` tinyint(1) NOT NULL DEFAULT 0,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户收藏';

--
-- 用户关注
--
DROP TABLE IF EXISTS `t_user_follows`;
CREATE TABLE `t_user_follows` (
`id`  int(11) NOT NULL  AUTO_INCREMENT,
`user_id`  int(11) NOT NULL DEFAULT 0 COMMENT '用户id',
`follow_id`  int(11) NOT NULL DEFAULT 0 COMMENT '关注的用户id',
`create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`create_user` varchar(32) NOT NULL DEFAULT 'system',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
`update_user` varchar(32) NOT NULL DEFAULT 'system',
`del` tinyint(1) NOT NULL DEFAULT 0,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户关注';

--
-- 用户消息表
--
DROP TABLE IF EXISTS `t_user_message`;
CREATE TABLE `t_user_message` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '消息接收用户id',
  `send_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '消息发起用户id',
  `send_user_name` varchar(20) NOT NULL DEFAULT '' COMMENT '消息发起用户名称',
  `ref_id` varchar(50) NOT NULL DEFAULT 0 COMMENT '引用id',
  `ref_Content` varchar(256) NOT NULL DEFAULT '' COMMENT '引用内容',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT  '通知的类型，1-评论，2-关注，3-答疑',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '未读（0）、已读（1）',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ,
  `create_user` varchar(32) NOT NULL DEFAULT 'system',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_user` varchar(32) NOT NULL DEFAULT 'system',
  `del` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 课程表
--
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '课程名称',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '课程类型',
  `classify` varchar(50) NOT NULL DEFAULT '' COMMENT '课程分类',
  `sub_classify` varchar(50) NOT NULL DEFAULT '' COMMENT '课程二级分类',
  `direction` varchar(20) NOT NULL DEFAULT '' COMMENT '课程方向',
  `username` int(11) NOT NULL  DEFAULT '' COMMENT '归属人',
  `level` tinyint(1) NOT NULL DEFAULT 1 COMMENT '课程级别：1-初级，2-中级，3-高级',
  `free` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否免费：0-否，1-是',
  `price` decimal(10,2) NOT NULL DEFAULT 0 COMMENT '课程价格',
  `time` varchar(50) NOT NULL DEFAULT '' COMMENT '时长',
  `onsale` tinyint(1) NOT NULL DEFAULT 0 COMMENT '未上架（0）、上架（1）',
  `brief` text NULL COMMENT '课程描述',
  `picture` varchar(255) NOT NULL DEFAULT '' COMMENT '课程图片',
  `recommend` tinyint(1) NOT NULL DEFAULT 0 COMMENT '未推荐（0）、推荐（1）',
  `weight` int(11) NOT NULL DEFAULT 0 COMMENT '权重',
  `study_count` int(11) NOT NULL DEFAULT 0 COMMENT '学习人数',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ,
  `create_user` varchar(32) NOT NULL DEFAULT 'system',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_user` varchar(32) NOT NULL DEFAULT 'system',
  `del` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程表';

--
-- 课程章节
--
DROP TABLE IF EXISTS `t_course_section`;
CREATE TABLE `t_course_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL DEFAULT 0 COMMENT '归属课程id',
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '父章节id，（只有2级）',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '章节名称',
  `sort` int(11) NOT NULL DEFAULT 1 COMMENT '排序',
  `time` varchar(50) NOT NULL DEFAULT '' COMMENT '时长',
  `onsale` tinyint(1) NOT NULL DEFAULT 0 COMMENT '未上架（0）、上架（1）',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ,
  `create_user` varchar(32) NOT NULL DEFAULT 'system',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_user` varchar(32) NOT NULL DEFAULT 'system',
  `del` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程章节表';

--
-- 用户学习章节表
--
DROP TABLE IF EXISTS `t_user_course_section`;
CREATE TABLE `t_user_course_section` (
`id`  int(11) NOT NULL  AUTO_INCREMENT,
`user_id`  int(11) NOT NULL DEFAULT 0 COMMENT '用户id',
`course_id`  int(11) NOT NULL DEFAULT 0 COMMENT '课程id',
`section_id`  int(11) NOT NULL DEFAULT 0 COMMENT '章节id',
`status`  int(11) NOT NULL DEFAULT 0 COMMENT '状态：0-学习中；1-学习结束',
`create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`create_user` varchar(32) NOT NULL DEFAULT 'system',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
`update_user` varchar(32) NOT NULL DEFAULT 'system',
`del` tinyint(1) NOT NULL DEFAULT 0,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户学习章节表';

--
-- 课程评论&答疑
--
DROP TABLE IF EXISTS `t_course_comment`;
CREATE TABLE `t_course_comment` (
`id`  int(11) NOT NULL  AUTO_INCREMENT,
`username`  varchar(200) NOT NULL DEFAULT '' COMMENT '用户username',
`to_username`  varchar(200) NOT NULL DEFAULT '' COMMENT '评论对象username',
`course_id`  int(11) NOT NULL DEFAULT 0 COMMENT '课程id',
`section_id`  int(11) NOT NULL DEFAULT 0 COMMENT '章节id',
`section_title`  varchar(200) NOT NULL DEFAULT 0 COMMENT '章节标题',
`content`  varchar(255) NOT NULL DEFAULT 0 COMMENT '评论内容',
`ref_id`  int(11) NOT NULL DEFAULT 0 COMMENT '引用id',
`ref_content`  varchar(255) NOT NULL DEFAULT 0 COMMENT '引用内容',
`type`  tinyint(11) NOT NULL DEFAULT 0 COMMENT '类型：0-评论；1-答疑QA',
`create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`create_user` varchar(32) NOT NULL DEFAULT 'system',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
`update_user` varchar(32) NOT NULL DEFAULT 'system',
`del` tinyint(1) NOT NULL DEFAULT 0,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程评论&答疑';


