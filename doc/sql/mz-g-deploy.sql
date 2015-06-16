-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.6.19 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 mz-g 的数据库结构
CREATE DATABASE IF NOT EXISTS `mz-g` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mz-g`;


-- 导出  表 mz-g.t_cart 结构
CREATE TABLE IF NOT EXISTS `t_cart` (
  `user_id` int(11) unsigned NOT NULL COMMENT '当前用户id',
  `cust_id` varchar(50) NOT NULL COMMENT '会员id',
  `sku_more_id` int(11) unsigned NOT NULL COMMENT 'sku_more_id',
  `count` int(11) unsigned NOT NULL COMMENT '数量'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车';

-- 正在导出表  mz-g.t_cart 的数据：~2 rows (大约)
DELETE FROM `t_cart`;
/*!40000 ALTER TABLE `t_cart` DISABLE KEYS */;
INSERT INTO `t_cart` (`user_id`, `cust_id`, `sku_more_id`, `count`) VALUES
	(1, '5', 98, 1),
	(1, '5', 113, 1);
/*!40000 ALTER TABLE `t_cart` ENABLE KEYS */;


-- 导出  表 mz-g.t_cate 结构
CREATE TABLE IF NOT EXISTS `t_cate` (
  `title` varchar(50) NOT NULL COMMENT '标题。用于在用户交互时展示。',
  `code` varchar(20) NOT NULL COMMENT '品类编码',
  `pcode` varchar(20) NOT NULL COMMENT '父品类编码',
  `ord` tinyint(4) unsigned NOT NULL DEFAULT '255' COMMENT '同级排序',
  `seq` int(11) NOT NULL COMMENT 'sid序列值',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `state` char(2) NOT NULL COMMENT '0：已删除；1：有效；',
  UNIQUE KEY `UK_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品分类表';

-- 正在导出表  mz-g.t_cate 的数据：~15 rows (大约)
DELETE FROM `t_cate`;
/*!40000 ALTER TABLE `t_cate` DISABLE KEYS */;
INSERT INTO `t_cate` (`title`, `code`, `pcode`, `ord`, `seq`, `remark`, `state`) VALUES
	('SIMPLE', 'S', '0', 0, 0, 'SIMPLE CATEGORY', '1'),
	('A上衣套装', 'S-1', 'S', 1, 6, 'A上衣套装', '1'),
	('J尿不湿', 'S-10', 'S', 10, 2, 'J尿不湿', '1'),
	('K代购', 'S-11', 'S', 11, 0, 'K代购', '1'),
	('L杯子/奶瓶', 'S-12', 'S', 12, 0, 'L杯子/奶瓶', '1'),
	('M妈妈', 'S-13', 'S', 13, 0, 'M妈妈', '1'),
	('N文具', 'S-14', 'S', 14, 0, 'N文具', '1'),
	('B裤子', 'S-2', 'S', 2, 3, 'B裤子', '1'),
	('C内衣', 'S-3', 'S', 3, 0, 'C内衣', '1'),
	('D鞋子', 'S-4', 'S', 4, 0, 'D鞋子', '1'),
	('E袜子/护袖/口水巾/罩衫', 'S-5', 'S', 5, 0, 'E袜子/护袖/口水巾/罩衫', '1'),
	('F奶粉', 'S-6', 'S', 6, 0, 'F奶粉', '1'),
	('G包包', 'S-7', 'S', 7, 0, 'G包包', '1'),
	('H帽子', 'S-8', 'S', 8, 0, 'H帽子', '1'),
	('I玩具', 'S-9', 'S', 9, 0, 'I玩具', '1');
/*!40000 ALTER TABLE `t_cate` ENABLE KEYS */;


-- 导出  表 mz-g.t_customer 结构
CREATE TABLE IF NOT EXISTS `t_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(20) NOT NULL COMMENT '会员卡号',
  `name` varchar(20) DEFAULT NULL COMMENT '会员姓名',
  `birth` date DEFAULT NULL COMMENT '宝宝生日',
  `msisdn` varchar(20) DEFAULT NULL COMMENT '手机号',
  `address` varchar(50) DEFAULT NULL COMMENT '地址',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `payment_clothing` int(11) DEFAULT '0' COMMENT '服装类消费总额',
  `state` char(2) NOT NULL COMMENT '0：已删除；1：有效；',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='客户表';

-- 正在导出表  mz-g.t_customer 的数据：~7 rows (大约)
DELETE FROM `t_customer`;
/*!40000 ALTER TABLE `t_customer` DISABLE KEYS */;
INSERT INTO `t_customer` (`id`, `cid`, `name`, `birth`, `msisdn`, `address`, `remark`, `payment_clothing`, `state`) VALUES
	(1, '00000004', '非会员顾客', '2014-11-16', '0', '0', NULL, 0, '1'),
	(2, '99999999999', 'Abel', '2015-04-10', '18181798763', 'sdf', '11', 3000, '1'),
	(3, '99999999998', 'Black', '2015-04-10', '18982746372', NULL, NULL, 1000, '1'),
	(4, '99999999997', 'Candy', '2015-04-10', '18238374659', NULL, NULL, 5000, '1'),
	(5, '99999999996', 'Daniel', '2015-04-10', '18928374678', NULL, NULL, 0, '1'),
	(6, '99999999995', 'Ema', '2015-04-10', '18238479906', '123123sd阿斯达', NULL, 0, '0'),
	(7, '99999999995', 'Frank', '2015-05-01', '18998773495', 'White house', 'power', 0, '1');
/*!40000 ALTER TABLE `t_customer` ENABLE KEYS */;


-- 导出  表 mz-g.t_goods 结构
CREATE TABLE IF NOT EXISTS `t_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cate_code` varchar(20) NOT NULL COMMENT '品类。ref: t_sku_cate',
  `gname` varchar(100) NOT NULL COMMENT '货名',
  `words` varchar(200) DEFAULT NULL COMMENT '商品描述',
  `img` varchar(100) DEFAULT 'goods_default.png' COMMENT '商品图片文件名。如flower.png。',
  `ctime` datetime NOT NULL,
  `utime` datetime DEFAULT NULL,
  `state` char(2) NOT NULL COMMENT '0：已删除；1：有效；',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='商品表。 TODO -OPT 以后扩展：供应商，厂家，品牌等';

-- 正在导出表  mz-g.t_goods 的数据：~2 rows (大约)
DELETE FROM `t_goods`;
/*!40000 ALTER TABLE `t_goods` DISABLE KEYS */;
INSERT INTO `t_goods` (`id`, `cate_code`, `gname`, `words`, `img`, `ctime`, `utime`, `state`) VALUES
	(15, 'S-1', '淑女连衣裙', '淑女连衣裙', '58d352e6-2a77-4bd7-ac95-d31f67462950.jpg', '2015-05-31 14:35:57', '2015-05-31 14:36:03', '1'),
	(16, 'S-2', '阿迪短裤', '阿迪短裤', '393dbbeb-fccc-4c1b-9c49-ea3ebda4d00f.png', '2015-05-31 14:36:21', NULL, '1'),
	(17, 'S-10', '花王尿不湿', '花王尿不湿', '7abe93e3-28a6-4ada-a4c0-4d62cef3f9bd.jpg', '2015-05-31 19:41:03', NULL, '1'),
	(18, 'S-1', '耐克卫衣', '耐克卫衣耐克卫衣', '75301b4e-57c6-4f89-969a-ebe051263835.png', '2015-06-07 14:54:52', '2015-06-07 14:54:59', '1');
/*!40000 ALTER TABLE `t_goods` ENABLE KEYS */;


-- 导出  表 mz-g.t_item 结构
CREATE TABLE IF NOT EXISTS `t_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT 'sku表pk',
  `sku_more_id` int(11) NOT NULL DEFAULT '0' COMMENT 'skumore表pk',
  `sprice_snapshot` int(11) NOT NULL DEFAULT '0' COMMENT '当前零售价快照',
  `dprice` int(11) NOT NULL DEFAULT '0' COMMENT '成交单价',
  `dcount` int(11) NOT NULL DEFAULT '0' COMMENT '成交数量',
  `payment` int(11) NOT NULL DEFAULT '0' COMMENT '付款金额',
  `return_time` datetime DEFAULT NULL COMMENT '退货时间',
  `return_reason` varchar(100) DEFAULT '0' COMMENT '退货原因',
  `state` char(2) NOT NULL DEFAULT '0' COMMENT '0：已删除；1：有效；2：退货',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT 'order表pk',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- 正在导出表  mz-g.t_item 的数据：~9 rows (大约)
DELETE FROM `t_item`;
/*!40000 ALTER TABLE `t_item` DISABLE KEYS */;
INSERT INTO `t_item` (`id`, `sku_id`, `sku_more_id`, `sprice_snapshot`, `dprice`, `dcount`, `payment`, `return_time`, `return_reason`, `state`, `order_id`) VALUES
	(1, 13, 92, 120, 106, 1, 105, NULL, NULL, '1', 1),
	(2, 12, 113, 100, 88, 1, 88, NULL, NULL, '1', 1),
	(3, 13, 93, 120, 108, 1, 108, NULL, NULL, '1', 2),
	(4, 12, 114, 100, 90, 1, 90, NULL, NULL, '1', 2),
	(5, 13, 92, 120, 106, 1, 105, NULL, NULL, '1', 3),
	(6, 13, 92, 120, 106, 1, 105, NULL, NULL, '1', 4),
	(7, 12, 113, 100, 88, 1, 88, NULL, NULL, '1', 4),
	(8, 13, 92, 120, 120, 1, 120, NULL, NULL, '1', 5),
	(9, 12, 113, 100, 100, 2, 200, NULL, NULL, '1', 6);
/*!40000 ALTER TABLE `t_item` ENABLE KEYS */;


-- 导出  表 mz-g.t_order 结构
CREATE TABLE IF NOT EXISTS `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '营业员id',
  `cust_id` int(11) NOT NULL COMMENT '顾客id',
  `dtime` datetime NOT NULL COMMENT '成交时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- 正在导出表  mz-g.t_order 的数据：~6 rows (大约)
DELETE FROM `t_order`;
/*!40000 ALTER TABLE `t_order` DISABLE KEYS */;
INSERT INTO `t_order` (`id`, `user_id`, `cust_id`, `dtime`) VALUES
	(1, 1, 3, '2015-06-01 14:33:19'),
	(2, 1, 4, '2015-06-01 14:34:48'),
	(3, 1, 3, '2015-06-01 14:48:03'),
	(4, 1, 3, '2015-06-07 16:17:31'),
	(5, 1, 1, '2015-06-10 14:45:35'),
	(6, 1, 1, '2015-06-10 15:11:26');
/*!40000 ALTER TABLE `t_order` ENABLE KEYS */;


-- 导出  表 mz-g.t_sku 结构
CREATE TABLE IF NOT EXISTS `t_sku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` varchar(50) NOT NULL COMMENT 'sku_id。sku_xxx的唯一id，因为id可能在不同的sku_xxx表中重复',
  `model` varchar(50) NOT NULL COMMENT '(一级分类)款型/颜色',
  `type` varchar(50) NOT NULL COMMENT '(二级分类)分类。如尺码标准，对应t_sku_type表',
  `ptime` datetime NOT NULL COMMENT '入库日期',
  `pprice` int(11) NOT NULL COMMENT '入库价格',
  `sprice` int(11) NOT NULL COMMENT '零售价格',
  `img` varchar(50) DEFAULT NULL COMMENT '单品图片',
  `ctime` datetime DEFAULT NULL COMMENT '创建时间',
  `utime` datetime DEFAULT NULL COMMENT '更新时间',
  `state` char(2) NOT NULL COMMENT '0：已删除；1：上架；2：下架',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='商品SKU主表';

-- 正在导出表  mz-g.t_sku 的数据：~6 rows (大约)
DELETE FROM `t_sku`;
/*!40000 ALTER TABLE `t_sku` DISABLE KEYS */;
INSERT INTO `t_sku` (`id`, `sid`, `model`, `type`, `ptime`, `pprice`, `sprice`, `img`, `ctime`, `utime`, `state`, `goods_id`) VALUES
	(12, 'B000000C1003', '酷黑+白条', 'HEIGHT', '2015-05-31 00:00:00', 80, 100, 'B000000C1003.png', '2015-05-31 15:09:51', '2015-05-31 19:00:23', '1', 16),
	(13, 'A000000G1004', '中国红', 'HEIGHT', '2015-05-31 00:00:00', 100, 120, 'A000000G1004.jpg', '2015-05-31 15:13:52', NULL, '1', 15),
	(14, 'J000000S2001', 'NB新生儿96片装', 'SIZE', '2015-05-31 00:00:00', 200, 220, 'J000000S2001.jpg', '2015-05-31 19:44:36', '2015-05-31 19:45:11', '1', 17),
	(15, 'J000000K2002', 'M中号68片', 'SIZE', '2015-05-31 00:00:00', 200, 220, 'J000000K2002.jpg', '2015-05-31 19:46:14', NULL, '1', 17),
	(16, 'A000000B1005', '经典蓝', 'HEIGHT', '2015-06-07 00:00:00', 100, 120, 'A000000B1005.png', '2015-06-07 16:10:35', NULL, '1', 18),
	(17, 'A000000Y1006', '怀旧蓝', 'HEIGHT', '2015-06-07 00:00:00', 100, 120, 'A000000Y1006.png', '2015-06-07 16:11:04', '2015-06-07 16:12:22', '1', 18);
/*!40000 ALTER TABLE `t_sku` ENABLE KEYS */;


-- 导出  表 mz-g.t_sku_more 结构
CREATE TABLE IF NOT EXISTS `t_sku_more` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku_id` int(11) NOT NULL COMMENT 't_sku_clothing表的id',
  `size` varchar(50) DEFAULT NULL COMMENT '取值为t_sku_dict表的SIZE_STANDARD相关item',
  `count` int(11) unsigned NOT NULL COMMENT '数量',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COMMENT='商品SKU更多表';

-- 正在导出表  mz-g.t_sku_more 的数据：~28 rows (大约)
DELETE FROM `t_sku_more`;
/*!40000 ALTER TABLE `t_sku_more` DISABLE KEYS */;
INSERT INTO `t_sku_more` (`id`, `sku_id`, `size`, `count`, `remark`) VALUES
	(92, 13, '100', 6, '备注备注备注'),
	(93, 13, '110', 9, '备注备注备注'),
	(94, 13, '120', 10, '备注备注备注'),
	(95, 13, '130', 10, '备注备注备注'),
	(96, 13, '140', 10, '备注备注备注'),
	(97, 13, '150', 10, '备注备注备注'),
	(98, 13, '160', 10, '备注备注备注'),
	(113, 12, '100', 6, '备'),
	(114, 12, '110', 9, '备注备注备注'),
	(115, 12, '120', 10, '备注备注备注'),
	(116, 12, '130', 10, '备注'),
	(117, 12, '140', 10, '备注备注备注'),
	(118, 12, '150', 10, '备注备注备注'),
	(119, 12, '160', 10, NULL),
	(121, 14, 'NB', 30, '备注备注'),
	(122, 15, 'M', 30, '备注备注备注'),
	(123, 16, '100', 10, '备注备注备注'),
	(124, 16, '110', 10, '备注备注备注'),
	(125, 16, '120', 10, '备注备注备注'),
	(126, 16, '130', 10, '备注备注备注'),
	(127, 16, '140', 10, '备注备注备注'),
	(128, 16, '150', 10, '备注备注备注'),
	(129, 16, '160', 10, '备注备注备注'),
	(137, 17, '100', 10, '备注备注备注'),
	(138, 17, '110', 10, '备注备注备注'),
	(139, 17, '120', 10, '备注备注备注'),
	(140, 17, '130', 10, '备注备注备注'),
	(141, 17, '140', 10, NULL);
/*!40000 ALTER TABLE `t_sku_more` ENABLE KEYS */;


-- 导出  表 mz-g.t_sku_prop_type 结构
CREATE TABLE IF NOT EXISTS `t_sku_prop_type` (
  `cate_code` varchar(20) NOT NULL COMMENT 'cate_code&item&name联合保持唯一性',
  `item` varchar(50) DEFAULT NULL COMMENT '项目',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `title` varchar(50) DEFAULT NULL,
  `evalue` varchar(50) DEFAULT NULL COMMENT '值',
  `cvalue` varchar(50) DEFAULT NULL COMMENT '描述',
  `name_order` tinyint(4) DEFAULT NULL COMMENT 'name排序',
  `value_order` tinyint(4) DEFAULT NULL COMMENT 'value排序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SKU扩展属性-type属性表';

-- 正在导出表  mz-g.t_sku_prop_type 的数据：~35 rows (大约)
DELETE FROM `t_sku_prop_type`;
/*!40000 ALTER TABLE `t_sku_prop_type` DISABLE KEYS */;
INSERT INTO `t_sku_prop_type` (`cate_code`, `item`, `name`, `title`, `evalue`, `cvalue`, `name_order`, `value_order`) VALUES
	('S-1', 'SIZE_STANDARD', 'SIZE', '尺码', 'S', '小号', 1, 1),
	('S-1', 'SIZE_STANDARD', 'SIZE', '尺码', 'M', '中号', 1, 2),
	('S-1', 'SIZE_STANDARD', 'SIZE', '尺码', 'L', '大号', 1, 3),
	('S-1', 'SIZE_STANDARD', 'SIZE', '尺码', 'XL', '特大号', 1, 4),
	('S-1', 'SIZE_STANDARD', 'SIZE', '尺码', 'XXL', '超大号', 1, 5),
	('S-1', 'SIZE_STANDARD', 'SIZE', '尺码', 'XXXL', '超大号', 1, 6),
	('S-1', 'SIZE_STANDARD', 'HEIGHT', '身高', '100', '100cm', 2, 1),
	('S-1', 'SIZE_STANDARD', 'HEIGHT', '身高', '110', '110cm', 2, 2),
	('S-1', 'SIZE_STANDARD', 'HEIGHT', '身高', '120', '120cm', 2, 3),
	('S-1', 'SIZE_STANDARD', 'HEIGHT', '身高', '130', '130cm', 2, 4),
	('S-1', 'SIZE_STANDARD', 'HEIGHT', '身高', '140', '140cm', 2, 5),
	('S-1', 'SIZE_STANDARD', 'HEIGHT', '身高', '150', '150cm', 2, 6),
	('S-1', 'SIZE_STANDARD', 'HEIGHT', '身高', '160', '160cm', 2, 7),
	('S-1', 'SIZE_STANDARD', 'AGE', '年龄', '3M', '0-3个月', 3, 1),
	('S-1', 'SIZE_STANDARD', 'AGE', '年龄', '6M', '4-6个月', 3, 2),
	('S-1', 'SIZE_STANDARD', 'AGE', '年龄', '12M', '7-12个月', 3, 3),
	('S-1', 'SIZE_STANDARD', 'AGE', '年龄', '1+', '1岁', 3, 4),
	('S-1', 'SIZE_STANDARD', 'AGE', '年龄', '2+', '2岁', 3, 5),
	('S-1', 'SIZE_STANDARD', 'AGE', '年龄', '3+', '3岁', 3, 6),
	('S-1', 'SIZE_STANDARD', 'AGE', '年龄', '4+', '4岁', 3, 7),
	('S-1', 'SIZE_STANDARD', 'AGE', '年龄', '5+', '5岁', 3, 8),
	('S-1', 'SIZE_STANDARD', 'AGE', '年龄', '6+', '6岁', 3, 9),
	('S-2', 'SIZE_STANDARD', 'HEIGHT', '身高', '100', '100cm', 1, 1),
	('S-2', 'SIZE_STANDARD', 'HEIGHT', '身高', '110', '110cm', 1, 2),
	('S-2', 'SIZE_STANDARD', 'HEIGHT', '身高', '120', '120cm', 1, 3),
	('S-2', 'SIZE_STANDARD', 'HEIGHT', '身高', '130', '130cm', 1, 4),
	('S-2', 'SIZE_STANDARD', 'HEIGHT', '身高', '140', '140cm', 1, 5),
	('S-2', 'SIZE_STANDARD', 'HEIGHT', '身高', '150', '150cm', 1, 6),
	('S-2', 'SIZE_STANDARD', 'HEIGHT', '身高', '160', '160cm', 1, 7),
	('S-10', 'SIZE_STANDARD', 'SIZE', '尺码', 'NB', '新生儿', 1, 1),
	('S-10', 'SIZE_STANDARD', 'SIZE', '尺码', 'S', '小号', 1, 2),
	('S-10', 'SIZE_STANDARD', 'SIZE', '尺码', 'M', '中号', 1, 3),
	('S-10', 'SIZE_STANDARD', 'SIZE', '尺码', 'L', '大号', 1, 4),
	('S-10', 'SIZE_STANDARD', 'SIZE', '尺码', 'XL', '特大号', 1, 5),
	('S-10', 'SIZE_STANDARD', 'SIZE', '尺码', 'XX', '超大号', 1, 6);
/*!40000 ALTER TABLE `t_sku_prop_type` ENABLE KEYS */;


-- 导出  表 mz-g.t_user 结构
CREATE TABLE IF NOT EXISTS `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(50) NOT NULL DEFAULT '0',
  `pwd` varchar(50) NOT NULL DEFAULT '0' COMMENT '加密',
  `state` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '0：初始；1：正常；2：已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表。暂时没用到。';

-- 正在导出表  mz-g.t_user 的数据：~2 rows (大约)
DELETE FROM `t_user`;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` (`id`, `login_name`, `pwd`, `state`) VALUES
	(1, 'Yolanda', '0', 1),
	(2, 'Wukong', '0', 1);
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;


-- 导出  视图 mz-g.v_cart 结构
-- 创建临时表以解决视图依赖性错误
CREATE TABLE `v_cart` (
	`user_id` INT(11) UNSIGNED NOT NULL COMMENT '当前用户id',
	`cust_id` INT(11) NOT NULL,
	`cid` VARCHAR(20) NOT NULL COMMENT '会员卡号' COLLATE 'utf8_general_ci',
	`name` VARCHAR(20) NULL COMMENT '会员姓名' COLLATE 'utf8_general_ci',
	`msisdn` VARCHAR(20) NULL COMMENT '手机号' COLLATE 'utf8_general_ci',
	`payment_clothing` INT(11) NULL COMMENT '服装类消费总额',
	`gname` VARCHAR(100) NOT NULL COMMENT '货名' COLLATE 'utf8_general_ci',
	`cate_code` VARCHAR(20) NOT NULL COMMENT '品类。ref: t_sku_cate' COLLATE 'utf8_general_ci',
	`sid` VARCHAR(50) NOT NULL COMMENT 'sku_id。sku_xxx的唯一id，因为id可能在不同的sku_xxx表中重复' COLLATE 'utf8_general_ci',
	`img` VARCHAR(50) NULL COMMENT '单品图片' COLLATE 'utf8_general_ci',
	`model` VARCHAR(50) NOT NULL COMMENT '(一级分类)款型/颜色' COLLATE 'utf8_general_ci',
	`sprice` INT(11) NOT NULL COMMENT '零售价格',
	`sku_more_id` INT(11) NOT NULL,
	`size` VARCHAR(50) NULL COMMENT '取值为t_sku_dict表的SIZE_STANDARD相关item' COLLATE 'utf8_general_ci',
	`scount` INT(11) UNSIGNED NOT NULL COMMENT '数量',
	`count` INT(11) UNSIGNED NOT NULL COMMENT '数量'
) ENGINE=MyISAM;


-- 导出  视图 mz-g.v_sku_more 结构
-- 创建临时表以解决视图依赖性错误
CREATE TABLE `v_sku_more` (
	`skuId` INT(11) NOT NULL,
	`skumoreId` INT(11) NOT NULL,
	`goodsId` INT(11) UNSIGNED NOT NULL,
	`gname` VARCHAR(100) NOT NULL COMMENT '货名' COLLATE 'utf8_general_ci',
	`cateCode` VARCHAR(20) NOT NULL COMMENT '品类。ref: t_sku_cate' COLLATE 'utf8_general_ci',
	`sid` VARCHAR(50) NOT NULL COMMENT 'sku_id。sku_xxx的唯一id，因为id可能在不同的sku_xxx表中重复' COLLATE 'utf8_general_ci',
	`model` VARCHAR(50) NOT NULL COMMENT '(一级分类)款型/颜色' COLLATE 'utf8_general_ci',
	`ptime` DATETIME NOT NULL COMMENT '入库日期',
	`pprice` INT(11) NOT NULL COMMENT '入库价格',
	`sprice` INT(11) NOT NULL COMMENT '零售价格',
	`img` VARCHAR(50) NULL COMMENT '单品图片' COLLATE 'utf8_general_ci',
	`state` CHAR(2) NOT NULL COMMENT '0：已删除；1：上架；2：下架' COLLATE 'utf8_general_ci',
	`size` VARCHAR(50) NULL COMMENT '取值为t_sku_dict表的SIZE_STANDARD相关item' COLLATE 'utf8_general_ci',
	`count` INT(11) UNSIGNED NOT NULL COMMENT '数量',
	`remark` VARCHAR(50) NULL COMMENT '备注' COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- 导出  视图 mz-g.v_cart 结构
-- 移除临时表并创建最终视图结构
DROP TABLE IF EXISTS `v_cart`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_cart` AS select `ca`.`user_id` AS `user_id`,`cu`.`id` AS `cust_id`,`cu`.`cid` AS `cid`,`cu`.`name` AS `name`,`cu`.`msisdn` AS `msisdn`,`cu`.`payment_clothing` AS `payment_clothing`,`g`.`gname` AS `gname`,`g`.`cate_code` AS `cate_code`,`sku`.`sid` AS `sid`,`sku`.`img` AS `img`,`sku`.`model` AS `model`,`sku`.`sprice` AS `sprice`,`sm`.`id` AS `sku_more_id`,`sm`.`size` AS `size`,`sm`.`count` AS `scount`,`ca`.`count` AS `count` from ((((`t_cart` `ca` join `t_sku_more` `sm` on((`sm`.`id` = `ca`.`sku_more_id`))) join `t_sku` `sku` on((`sku`.`id` = `sm`.`sku_id`))) join `t_goods` `g` on((`g`.`id` = `sku`.`goods_id`))) join `t_customer` `cu` on((`cu`.`id` = `ca`.`cust_id`))) where ((`cu`.`state` = 1) and (`g`.`state` = 1) and (`sku`.`state` = 1));


-- 导出  视图 mz-g.v_sku_more 结构
-- 移除临时表并创建最终视图结构
DROP TABLE IF EXISTS `v_sku_more`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_sku_more` AS select `t1`.`id` AS `skuId`,`t`.`id` AS `skumoreId`,`t2`.`id` AS `goodsId`,`t2`.`gname` AS `gname`,`t2`.`cate_code` AS `cateCode`,`t1`.`sid` AS `sid`,`t1`.`model` AS `model`,`t1`.`ptime` AS `ptime`,`t1`.`pprice` AS `pprice`,`t1`.`sprice` AS `sprice`,`t1`.`img` AS `img`,`t1`.`state` AS `state`,`t`.`size` AS `size`,`t`.`count` AS `count`,`t`.`remark` AS `remark` from ((`t_sku_more` `t` join `t_sku` `t1` on((`t1`.`id` = `t`.`sku_id`))) join `t_goods` `t2` on((`t2`.`id` = `t1`.`goods_id`))) where (`t1`.`state` <> 0) order by `t2`.`id`,`t`.`id`;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
