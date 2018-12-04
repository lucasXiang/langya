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
) ENGINE=InnoDB DEFAULT CHARSET=utf8