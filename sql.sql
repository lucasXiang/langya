CREATE TABLE `ins_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户表主键，自增ID',
  `real_name` varchar(256) DEFAULT NULL COMMENT '真实姓名',
  `password` varchar(128) DEFAULT NULL COMMENT '登录固定密码',
  `business_mobile` varchar(32) DEFAULT NULL COMMENT '手机号',
  `wechat_open_id` varchar(256) DEFAULT NULL COMMENT '喂小保公众号 open id',
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `modify_time` datetime NOT NULL COMMENT '记录最近修改时间',
  `deleted_id` bigint(20) NOT NULL DEFAULT '1' COMMENT '删除id，默认为1，删除后为原id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `ins_user_ext` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户表主键id，用作该表外键',
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `modify_time` datetime NOT NULL COMMENT '记录最近修改时间',
  `deleted_id` bigint(20) NOT NULL DEFAULT '1' COMMENT '删除id，默认为1，删除后为原id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `sys_user` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(64) NOT NULL COMMENT '昵称',
  `user_name` varchar(64) NOT NULL COMMENT '用户名',
  `real_name` varchar(64) NOT NULL COMMENT '真名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `email` varchar(64) NOT NULL DEFAULT '' COMMENT '邮箱',
  `mobile` varchar(64) NOT NULL DEFAULT '' COMMENT '手机号码',
  `creator` varchar(64) NOT NULL COMMENT '创建人用户名',
  `modifier` varchar(64) NOT NULL COMMENT '最后修改人用户名',
  `add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `sys_flag` tinyint(3) NOT NULL DEFAULT '1' COMMENT '0-失效1-有效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10144 DEFAULT CHARSET=utf8 COMMENT='用户表';

CREATE TABLE `sys_role_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `valid_flag` tinyint(3) NOT NULL DEFAULT '1' COMMENT '0-失效,1-有效',
  `creator` varchar(64) NOT NULL COMMENT '创建人用户名',
  `modifier` varchar(64) NOT NULL COMMENT '最后修改人用户名',
  `add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `sys_flag` tinyint(3) NOT NULL DEFAULT '1' COMMENT '0-删除,1-有效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_user` (`role_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=387 DEFAULT CHARSET=utf8 COMMENT='角色用户关系表';

CREATE TABLE `sys_role_function` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `function_id` int(11) NOT NULL COMMENT '功能id',
  `valid_flag` tinyint(3) NOT NULL DEFAULT '1' COMMENT '0-失效,1-有效',
  `creator` varchar(64) NOT NULL COMMENT '创建人用户名',
  `modifier` varchar(64) NOT NULL COMMENT '最后修改人用户名',
  `add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `sys_flag` tinyint(3) NOT NULL DEFAULT '1' COMMENT '0-删除,1-有效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_user` (`role_id`,`function_id`)
) ENGINE=InnoDB AUTO_INCREMENT=387 DEFAULT CHARSET=utf8 COMMENT='角色功能关系表';

CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(64) NOT NULL COMMENT '角色名',
  `description` varchar(256) NOT NULL DEFAULT '' COMMENT '描述',
  `creator` varchar(64) NOT NULL COMMENT '创建人用户名',
  `modifier` varchar(64) NOT NULL COMMENT '最后修改人用户名',
  `add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `sys_flag` tinyint(3) NOT NULL DEFAULT '1' COMMENT '0-失效1-有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 COMMENT='角色表';

CREATE TABLE `sys_function_user_permisssion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `function_id` int(11) NOT NULL COMMENT '功能id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `permission_flag` tinyint(3) NOT NULL DEFAULT '1' COMMENT '是否允许：0-否，1-是',
  `creator` varchar(64) NOT NULL COMMENT '创建人用户名',
  `modifier` varchar(64) NOT NULL COMMENT '最后修改人用户名',
  `add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `sys_flag` tinyint(3) NOT NULL DEFAULT '1' COMMENT '0-失效1-有效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `function_user` (`function_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=387 DEFAULT CHARSET=utf8 COMMENT='功能用户权限表';

CREATE TABLE `sys_function` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fun_code` varchar(200) NOT NULL COMMENT '功能code',
  `fun_name` varchar(64) NOT NULL COMMENT '功能名称',
  `fun_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '功能类型:0-目录;1-页面;2-按钮',
  `action_url` varchar(256) NOT NULL DEFAULT '' COMMENT '请求地址',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级功能id',
  `icon` varchar(40) DEFAULT NULL COMMENT '页面图标',
  `order` int(11) NOT NULL DEFAULT '0' COMMENT '排序，按照order优先，id其次正序排序',
  `description` varchar(256) NOT NULL DEFAULT '' COMMENT '描述',
  `creator` varchar(64) NOT NULL COMMENT '创建人用户名',
  `modifier` varchar(64) NOT NULL COMMENT '最后修改人用户名',
  `add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `sys_flag` tinyint(3) NOT NULL DEFAULT '1' COMMENT '0-失效1-有效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fun_code` (`fun_code`)
) ENGINE=InnoDB AUTO_INCREMENT=387 DEFAULT CHARSET=utf8 COMMENT='功能表';
