/*
 Navicat Premium Data Transfer

 Source Server         : localhost57
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3307
 Source Schema         : jiudiangguanli

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 06/04/2020 21:02:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bbs
-- ----------------------------
DROP TABLE IF EXISTS `bbs`;
CREATE TABLE `bbs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `pubtime` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hid` int(11) NULL DEFAULT NULL,
  `note2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `htime` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `btype` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bbs
-- ----------------------------
INSERT INTO `bbs` VALUES (1, '标题11', 19, '内容111', '2020-03-29 13:39:44', NULL, '回复内容11', NULL, '投诉反馈', '已回复');
INSERT INTO `bbs` VALUES (6, '订餐11', 19, '餐品要求1111', '2020-03-29 13:46:46', NULL, '好的，已送达', NULL, '订餐', '已回复');

-- ----------------------------
-- Table structure for btype
-- ----------------------------
DROP TABLE IF EXISTS `btype`;
CREATE TABLE `btype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `btype` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of btype
-- ----------------------------
INSERT INTO `btype` VALUES (1, '公寓式客房', '类别');
INSERT INTO `btype` VALUES (2, '总统套房', '类别');
INSERT INTO `btype` VALUES (3, '房间类型', '类别');
INSERT INTO `btype` VALUES (4, '单人间', '类别');
INSERT INTO `btype` VALUES (5, '双人间', '类别');
INSERT INTO `btype` VALUES (6, '套间客房', '类别');
INSERT INTO `btype` VALUES (9, '特价房', '类别');
INSERT INTO `btype` VALUES (10, '分类10', '类别');
INSERT INTO `btype` VALUES (11, '地区1', '地区');
INSERT INTO `btype` VALUES (12, '地区2', '地区');
INSERT INTO `btype` VALUES (13, '地区3', '地区');
INSERT INTO `btype` VALUES (14, '分类1', '类别');
INSERT INTO `btype` VALUES (15, '地区4', '地区');
INSERT INTO `btype` VALUES (16, '分类2', '类别');
INSERT INTO `btype` VALUES (17, '武汉', '地区');
INSERT INTO `btype` VALUES (18, '分类7', '类别');
INSERT INTO `btype` VALUES (19, '其他', '类别');
INSERT INTO `btype` VALUES (20, '地区99', '地区');
INSERT INTO `btype` VALUES (21, '菜品分类1', '菜品');
INSERT INTO `btype` VALUES (22, '菜品分类2', '菜品');
INSERT INTO `btype` VALUES (23, '菜品分类3', '菜品');
INSERT INTO `btype` VALUES (24, '川菜', '菜品');

-- ----------------------------
-- Table structure for forder
-- ----------------------------
DROP TABLE IF EXISTS `forder`;
CREATE TABLE `forder`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL,
  `qid` int(11) NULL DEFAULT NULL,
  `fid` int(11) NULL DEFAULT NULL,
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `day` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stime` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `etime` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `amount` int(11) NULL DEFAULT NULL,
  `isdel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pubtime` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zprice` double NULL DEFAULT NULL,
  `ono` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pj` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `huifu` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scope` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pjtime` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tid` int(11) NULL DEFAULT NULL,
  `btype` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_keep`(`fid`) USING BTREE,
  CONSTRAINT `FK_keep` FOREIGN KEY (`fid`) REFERENCES `house` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forder
-- ----------------------------
INSERT INTO `forder` VALUES (2, 13, 6, 9, '待支付', '1', '2020-03-31', '2020-04-01', 4, '购物车', '2020-03-29 13:17:22', 229, '20200329131722145914', NULL, NULL, NULL, NULL, 1, '1');
INSERT INTO `forder` VALUES (3, 19, 6, 9, '已取消，已退款', '2', '2020-03-31', '2020-04-02', 2, '订单', '2020-03-29 13:24:10', 458, '20200329132410196190', NULL, NULL, NULL, NULL, 1, '1');
INSERT INTO `forder` VALUES (4, 19, 6, 9, '已取消，已退款', '3', '2020-03-30', '2020-04-02', 4, '订单', '2020-03-29 13:35:43', 687, '20200329133543199096', NULL, NULL, NULL, NULL, 1, '1');
INSERT INTO `forder` VALUES (5, 19, 6, 9, '待退房', '2', '2020-03-30', '2020-04-01', 3, '订单', '2020-03-29 13:37:13', 458, '20200329133713160458', NULL, NULL, NULL, NULL, 1, '1');
INSERT INTO `forder` VALUES (6, 19, 6, 3, '已评价', '1', '2020-03-29', '2020-03-29 13:38:57', 2, '订单', '2020-03-29 13:38:26', 260, '20200329133826192989', '评价内容11', NULL, '4', '2020-03-29 13:39:16', 1, '1');
INSERT INTO `forder` VALUES (8, 7, NULL, 1, '已支付，待确认', '1', NULL, NULL, NULL, '订单', '2020-04-06 00:00:52', 29, '20200406000052135774', NULL, NULL, NULL, NULL, NULL, '2');
INSERT INTO `forder` VALUES (9, 7, NULL, 1, '已评价已回复', '1', NULL, NULL, NULL, '订单', '2020-04-06 00:03:45', 29, '20200406000345165304', '评论的的内容11', '111', '5', '2020-04-06 00:34:34', NULL, '2');
INSERT INTO `forder` VALUES (10, 7, NULL, 2, '成功订单', '1', NULL, NULL, NULL, '订单', '2020-04-06 00:57:11', 35, '20200406005711880788', NULL, NULL, NULL, NULL, NULL, '2');
INSERT INTO `forder` VALUES (11, 7, NULL, 1, '已评价已回复', '1', NULL, NULL, NULL, '订单', '2020-04-06 00:57:22', 29, '20200406005722135947', '333,我的评价内容11', '回复33', '4', '2020-04-06 00:59:29', NULL, '2');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fid` int(11) NULL DEFAULT NULL,
  `btype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `price` double NULL DEFAULT NULL,
  `pubtime` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isdel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kcnum` int(11) NULL DEFAULT NULL,
  `xnum` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_flower`(`fid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, 21, '菜品', 'c640_201506091433836351105.jpg', '菜品1', '11', 29, '2020-04-05 23:07:18', '1', '1', NULL, 2);
INSERT INTO `goods` VALUES (2, 22, '菜品', 'hongshaozhuti_7833695.jpg', '菜品2', '<p>\r\n	说明如下\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', 35, '2020-04-05 23:14:24', '1', '1', NULL, 1);
INSERT INTO `goods` VALUES (3, 23, '菜品', '20180507152566911737310673459.jpg', '菜品3', '说明如下', 68, '2020-04-05 23:14:58', '1', '1', NULL, NULL);
INSERT INTO `goods` VALUES (4, NULL, '礼品', 'u=2637103474,1268750803&fm=26&gp=0.jpg', '礼品1', '1111', NULL, '2020-04-05 23:21:49', '1', '1', 999, 0);
INSERT INTO `goods` VALUES (5, NULL, '礼品', 'u=1533956334,2882229376&fm=200&gp=0.jpg', '礼品2', '11555', NULL, '2020-04-05 23:23:28', '1', '1', 1500, NULL);
INSERT INTO `goods` VALUES (6, NULL, '礼品', 'u=3035918356,3923198577&fm=200&gp=0.jpg', '礼品3', '礼品说明22', NULL, '2020-04-06 01:01:18', '1', '1', 100, NULL);
INSERT INTO `goods` VALUES (7, 24, '菜品', 'hongshaozhuti_7833695.jpg', '川菜88', '<p>\r\n	说明3333\r\n</p>\r\n<p>\r\n	<img src=\"/jiudianyuding/attached/image/20200406/20200406010221_794.jpg\" alt=\"\" />\r\n</p>', 39, '2020-04-06 01:02:26', '1', '1', NULL, NULL);

-- ----------------------------
-- Table structure for house
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `bid` int(11) NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL,
  `cnum` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pubtime` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isdel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `unum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addr2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `area` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bprice` double NULL DEFAULT NULL,
  `jianjie` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scope` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `onum` int(11) NULL DEFAULT NULL,
  `fjnum` int(11) NULL DEFAULT NULL,
  `wsjtype` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shstatus` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_flower`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of house
-- ----------------------------
INSERT INTO `house` VALUES (1, '房间1', '这里是公司的简介', 1, 6, '', 'lv02.jpg', '2020-03-27 21:44:30', '1', '5', '12', '位置1', 146, '20', '已预订', 14.6, '这里是说明', NULL, NULL, NULL, '10.jpg', NULL, 3, 0, '公用卫生间', '已支付');
INSERT INTO `house` VALUES (2, '客房2', '<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	不同星级标准的宾馆，对各类客房应配的家具和设备都有明确的规定，但不同国家、不同标准的宾馆，家具和设备的多少和款式也会有差别，如有些客房可能增设餐桌、小酒吧或专门用于办公的桌椅，有些客房的卫生间还可能增加女士净身盆、旋涡浴缸和<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%A1%91%E6%8B%BF%E6%88%BF\">桑拿房</a>等。下面按照上述分类分别介绍。\r\n</div>\r\n<div class=\"anchor-list\" style=\"color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	<a name=\"3_1\"></a><a name=\"sub680722_3_1\"></a><a name=\"单人间\"></a><a name=\"3-1\"></a> \r\n</div>\r\n<div class=\"para-title level-3\" style=\"margin:20px 0px 12px;font-size:18px;font-family:\" color:#333333;background-color:#ffffff;\"=\"\">\r\n<h3 class=\"title-text\" style=\"font-size:18px;font-weight:400;\">\r\n	单人间\r\n</h3>\r\n	</div>\r\n	<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n		也叫单人客房，其间的主要家具和设施是一张单人床、一个床头柜、一张多用桌、一个箱包架、两张休闲椅、一个茶几以及固定设在入口处的衣橱和洗手间。\r\n		<div class=\"lemma-picture text-pic layout-right\" style=\"border:1px solid #E0E0E0;margin:0px 0px 3px;\">\r\n			<a class=\"image-link\" href=\"https://baike.baidu.com/pic/%E5%AE%A2%E6%88%BF/11012977/0/6f061d950a7b0208969438be61d9f2d3572cc814?fr=lemma&ct=single\" target=\"_blank\"><img class=\"\" src=\"https://gss1.bdstatic.com/-vo3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=b7cf966048fbfbedd859317d48f1f78e/6f061d950a7b0208969438be61d9f2d3572cc814.jpg\" alt=\"单人间\" style=\"width:220px;height:139px;\" /></a><span class=\"description\" style=\"color:#555555;font-size:12px;font-family:宋体;line-height:15px;\">单人间</span> \r\n		</div>\r\n	</div>\r\n	<div class=\"anchor-list\" style=\"color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n		<a name=\"3_2\"></a><a name=\"sub680722_3_2\"></a><a name=\"标准间\"></a><a name=\"3-2\"></a> \r\n	</div>\r\n<div class=\"para-title level-3\" style=\"margin:20px 0px 12px;font-size:18px;font-family:\" color:#333333;background-color:#ffffff;\"=\"\">\r\n	<h3 class=\"title-text\" style=\"font-size:18px;font-weight:400;\">\r\n		标准间\r\n	</h3>\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	也叫双床间，在多种客房中，这种客房数量最多，适合住两位客人和夫妻同住<a class=\"lemma-album layout-right nslog:10000206\" href=\"https://baike.baidu.com/pic/%E5%AE%A2%E6%88%BF/11012977/1083489/f636afc379310a55a4be0858b74543a983261087?fr=lemma&ct=cover\" target=\"_blank\"> \r\n	<div class=\"album-wrap\" style=\"border:1px solid #E0E0E0;\">\r\n		<img class=\"picture\" alt=\"客房\" src=\"https://gss3.bdstatic.com/7Po3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=aeb52b60c3cec3fd8f3ea077e689d4b6/f636afc379310a55a4be0858b74543a983261087.jpg\" style=\"width:220px;height:165px;\" /> \r\n	</div>\r\n	<div class=\"description\" style=\"padding:8px 7px;color:#555555;font-size:12px;font-family:simSun;\">\r\n		客房(7张)\r\n	</div>\r\n	<div class=\"albumBg\">\r\n		<div class=\"albumBgFir\" style=\"margin:0px auto;\">\r\n		</div>\r\n		<div class=\"albumBgSec\" style=\"margin:0px auto;\">\r\n		</div>\r\n	</div>\r\n</a>&nbsp;，适合旅游团体住用。设施的配备也最“标准”。其主要家具和设施是两张单人床，一个两人共用的床头柜，一对休闲椅和一个茶几，一个写字、梳妆、放电视机的多用桌和一张写字椅，一个箱包架以及分别位于小门厅两侧的衣橱和洗手间。客房的单人床常常大于家庭的单人床，常用尺寸为2000mm X 1200mm。休闲椅和茶几大都靠窗布置。箱包架与多用桌相接，是客人存取衣服时放置衣箱的，为防止箱子滑落，其表面有铜制或木制防滑条。床头柜置于两个单人床的中间，上有全部灯具的开关以及电视机的开关等。\r\n</div>\r\n<div class=\"anchor-list\" style=\"color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	<a name=\"3_3\"></a><a name=\"sub680722_3_3\"></a><a name=\"双人间\"></a><a name=\"3-3\"></a> \r\n</div>\r\n<div class=\"para-title level-3\" style=\"margin:20px 0px 12px;font-size:18px;font-family:\" color:#333333;background-color:#ffffff;\"=\"\">\r\n<h3 class=\"title-text\" style=\"font-size:18px;font-weight:400;\">\r\n	双人间\r\n</h3>\r\n	</div>\r\n	<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n		与标准间的配置相似，只是床为双人床，尺寸为1800mm X 2000mm或2000mm X 2000mm。\r\n		<div class=\"lemma-picture text-pic layout-right\" style=\"border:1px solid #E0E0E0;margin:0px 0px 3px;\">\r\n			<a class=\"image-link\" href=\"https://baike.baidu.com/pic/%E5%AE%A2%E6%88%BF/11012977/0/d043ad4bd11373f03baa68c0a70f4bfbfaed04d3?fr=lemma&ct=single\" target=\"_blank\"><img class=\"\" src=\"https://gss1.bdstatic.com/9vo3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=c6965566ca3d70cf48faad0fc8ddd1ba/d043ad4bd11373f03baa68c0a70f4bfbfaed04d3.jpg\" alt=\"双人间\" style=\"width:220px;height:179px;\" /></a><span class=\"description\" style=\"color:#555555;font-size:12px;font-family:宋体;line-height:15px;\">双人间</span> \r\n		</div>\r\n	</div>\r\n	<div class=\"anchor-list\" style=\"color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n		<a name=\"3_4\"></a><a name=\"sub680722_3_4\"></a><a name=\"套间客房\"></a><a name=\"3-4\"></a> \r\n	</div>\r\n<div class=\"para-title level-3\" style=\"margin:20px 0px 12px;font-size:18px;font-family:\" color:#333333;background-color:#ffffff;\"=\"\">\r\n	<h3 class=\"title-text\" style=\"font-size:18px;font-weight:400;\">\r\n		套间客房\r\n	</h3>\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	由两间组成。外间为客厅，主要家具为沙发组和电视柜，有时还可以增设早餐用的小餐桌。客厅是供客人休息、接待客人和洽谈生意的地方，可适当摆放盆花等陈设。套房的里间是客人睡觉的地方，其配置与双床间或双人间相同。套间客房大都配备两个洗手间，分别供住宿者、来访客人使用。供客人使用的洗手间，位于入口处。有时不设浴缸。里间的洗手间供住宿者使用，故必须有面盆、便器和浴缸等三件洁具。套间客房不限于两间相套的，也有三间或四间相套的。三件或四间相套时，可能单独设置餐厅及办公室。\r\n	<div class=\"lemma-picture text-pic layout-right\" style=\"border:1px solid #E0E0E0;margin:0px 0px 3px;\">\r\n		<a class=\"image-link\" href=\"https://baike.baidu.com/pic/%E5%AE%A2%E6%88%BF/11012977/0/a71ea8d3fd1f4134e8b90221261f95cad0c85ee6?fr=lemma&ct=single\" target=\"_blank\"><img class=\"\" src=\"https://gss3.bdstatic.com/7Po3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=509d8b5798504fc2a65fb707d5dce7f0/a71ea8d3fd1f4134e8b90221261f95cad0c85ee6.jpg\" alt=\"套间客房\" style=\"width:220px;height:146px;\" /></a><span class=\"description\" style=\"color:#555555;font-size:12px;font-family:宋体;line-height:15px;\">套间客房</span> \r\n	</div>\r\n</div>\r\n<div class=\"anchor-list\" style=\"color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	<a name=\"3_5\"></a><a name=\"sub680722_3_5\"></a><a name=\"公寓式客房\"></a><a name=\"3-5\"></a> \r\n</div>\r\n<div class=\"para-title level-3\" style=\"margin:20px 0px 12px;font-size:18px;font-family:\" color:#333333;background-color:#ffffff;\"=\"\">\r\n<h3 class=\"title-text\" style=\"font-size:18px;font-weight:400;\">\r\n	公寓式客房\r\n</h3>\r\n	</div>\r\n	<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n		的最大特点就是有厨房。这种客房主要供大公司派出人员租用，租用时间一般较长，故需要有一个偶尔做饭的厨房。这种客房集办公、会客、住宿、就餐、烹调空间为一体，所以至少要有两个以上的房间。\r\n		<div class=\"lemma-picture text-pic layout-right\" style=\"border:1px solid #E0E0E0;margin:0px 0px 3px;\">\r\n			<a class=\"image-link\" href=\"https://baike.baidu.com/pic/%E5%AE%A2%E6%88%BF/11012977/0/503d269759ee3d6daa43809440166d224e4adeec?fr=lemma&ct=single\" target=\"_blank\"><img class=\"\" src=\"https://gss3.bdstatic.com/7Po3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=753a8b6e4990f60300b09b450913b370/503d269759ee3d6daa43809440166d224e4adeec.jpg\" alt=\"公寓式客房\" style=\"width:220px;height:165px;\" /></a><span class=\"description\" style=\"color:#555555;font-size:12px;font-family:宋体;line-height:15px;\">公寓式客房</span> \r\n		</div>\r\n	</div>\r\n	<div class=\"anchor-list\" style=\"color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n		<a name=\"3_6\"></a><a name=\"sub680722_3_6\"></a><a name=\"总统套房\"></a><a name=\"3-6\"></a> \r\n	</div>\r\n<div class=\"para-title level-3\" style=\"margin:20px 0px 12px;font-size:18px;font-family:\" color:#333333;background-color:#ffffff;\"=\"\">\r\n	<h3 class=\"title-text\" style=\"font-size:18px;font-weight:400;\">\r\n		总统套房\r\n	</h3>\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	组成不尽相同，基本空间为总统卧室、夫人卧室、会客室、办公室(书房)、会议室、餐厅、文娱室和健身室。有些宾馆在总统套房的前部设置随行人员的用房，它们与总统套房相邻，但又各有各的独立性。\r\n	<div class=\"lemma-picture text-pic layout-right\" style=\"border:1px solid #E0E0E0;margin:0px 0px 3px;\">\r\n		<a class=\"image-link\" href=\"https://baike.baidu.com/pic/%E5%AE%A2%E6%88%BF/11012977/0/1ad5ad6eddc451da22350bb4b5fd5266d11632a9?fr=lemma&ct=single\" target=\"_blank\"><img class=\"\" src=\"https://gss3.bdstatic.com/-Po3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=1020aeedd258ccbf1fbcb23829d9bcd4/1ad5ad6eddc451da22350bb4b5fd5266d11632a9.jpg\" alt=\"总统套房\" style=\"width:220px;height:142px;\" /></a><span class=\"description\" style=\"color:#555555;font-size:12px;font-family:宋体;line-height:15px;\">总统套房</span> \r\n		<div>\r\n			<br />\r\n		</div>\r\n	</div>\r\n</div>\r\n<div class=\"anchor-list\" style=\"color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	<a name=\"4\"></a><a name=\"sub680722_4\"></a><a name=\"客房服务\"></a> \r\n</div>\r\n<div class=\"para-title level-2\" style=\"font-size:22px;font-family:\" margin:35px=\"\" 0px=\"\" 15px=\"\" -30px;background:url(\"color:#333333;\"=\"\">\r\n	</div>', 1, 6, NULL, 'lv10.jpg', '2020-03-27 21:44:30', '1', '4', '13', '位置2', 200, '22', '可用房间', 20, '介绍如下', NULL, '3.jpg', 'lv01.jpg', '10.jpg', NULL, 0, 2, '公用卫生间', '已支付');
INSERT INTO `house` VALUES (3, '客房3', '<img src=\"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3878100400,2793228762&fm=200&gp=0.jpg\" />', 1, 6, NULL, 'lv08.jpg', '2020-03-27 21:44:30', '1', '4', '12', '位置3', 260, '24', '可用房间', 26, '介绍如下', NULL, '8.jpg', 'lv01.jpg', '3.jpg', NULL, 5, 1, '独立卫生间', '已支付');
INSERT INTO `house` VALUES (4, '客房4', '<img src=\"https://gss3.bdstatic.com/7Po3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=509d8b5798504fc2a65fb707d5dce7f0/a71ea8d3fd1f4134e8b90221261f95cad0c85ee6.jpg\" alt=\"套间客房\" />', 1, 6, NULL, 'lv12.jpg', '2020-03-27 21:44:30', '1', '2', '11', '位置4', 280, '24', '可用房间', 28, '介绍如下', NULL, '3.jpg', 'lv01.jpg', '3.jpg', NULL, 2, 1, '公用卫生间', '已支付');
INSERT INTO `house` VALUES (5, '客房5', '<img src=\"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3202639353,3121123317&fm=27&gp=0.jpg\" />', 1, 6, NULL, 'lv04.jpg', '2020-03-27 21:44:30', '1', '2', '13', '位置5', 290, '21', '可用房间', 29, '介绍如下', NULL, '7.jpg', '3.jpg', 'lv01.jpg', NULL, 0, 2, '公用卫生间', '已支付');
INSERT INTO `house` VALUES (6, '客房6', '<img src=\"/jiudianyuding/attached/image/20190225/20190225093133_690.jpg\" alt=\"\" />', 1, 6, NULL, 'u=3010469822,1989976942&fm=27&gp=0.jpg', '2020-03-27 21:44:30', '1', '2', '12', '位置6', 360, '33', '可用房间', 36, '介绍如下', NULL, '8.jpg', '2.jpg', '3.jpg', NULL, 0, 2, '独立卫生间', '已支付');
INSERT INTO `house` VALUES (7, '客房7', '<img src=\"/jiudianyuding/attached/image/20180513/20180513220723_489.jpg\" alt=\"\" /><img src=\"/jiudianyuding/attached/image/20190128/20190128235232_773.jpg\" alt=\"\" />', 1, 6, NULL, '2.jpg', '2020-03-27 21:44:30', '1', '3', '11', '位置7', 189, '22', '可用房间', NULL, '介绍如下', '3.jpg', '2.jpg', '2.jpg', '2.jpg', NULL, 0, 1, '独立卫生间', '已支付');
INSERT INTO `house` VALUES (8, '客房666', '<p>\r\n	如下介绍：\r\n</p>\r\n<p>\r\n	<iframe src=\"http://localhost:8080/jiudianyuding/kindeditor/plugins/baidumap/index.html?center=113.285946%2C23.118054&zoom=14&width=558&height=360&markers=113.285946%2C23.118054&markerStyles=l%2CA\" frameborder=\"0\" style=\"width:560px;height:362px;\">\r\n	</iframe>\r\n</p>\r\n<p>\r\n	<img src=\"/jiudianyuding/attached/image/20180513/20180513222314_692.jpg\" alt=\"\" /> \r\n</p>', 1, 6, NULL, '3.jpg', '2020-03-27 21:44:30', '1', '3', '13', '位置666', 166, '30', '可用房间', NULL, '房间的介绍', 'lv02.jpg', '6.jpg', '3.jpg', '3.jpg', NULL, 0, 1, '独立卫生间', '已支付');
INSERT INTO `house` VALUES (9, '房间77', '介绍如下', 1, 6, NULL, 'lv02.jpg', '2020-03-27 21:44:30', '1', '4', '13', '位置7', 229, '20', '已预订', 239, '很大，很舒服', 'lv02.jpg', 'lv01.jpg', '3.jpg', 'lv01.jpg', NULL, 11, 0, '独立卫生间', '已支付');
INSERT INTO `house` VALUES (10, '房间78', '这里是介绍', 1, 6, NULL, '7.jpg', '2020-03-27 21:44:30', '1', '4', '12', '位置78', 239, '24', '可用房间', 249, '很干净', '7.jpg', '3.jpg', '2.jpg', '7.jpg', NULL, 0, 2, '独立卫生间', '已支付');
INSERT INTO `house` VALUES (11, '房间79', '介绍', 1, 8, NULL, '7.jpg', '2020-03-27 21:44:30', '1', '4', '12', '位置79', 229, '24', '可用房间', 246, '介绍', '7.jpg', NULL, '3.jpg', NULL, NULL, 0, 1, '公用卫生间', '已支付');
INSERT INTO `house` VALUES (12, '房间80', '介绍如下', 1, 8, NULL, 'lv12.jpg', '2020-03-27 21:44:30', '1', '5', '11', '位置80', 888, '30', '可用房间', 999, '非常豪华', 'lv12.jpg', 'lv01.jpg', '8.jpg', '3.jpg', NULL, 0, 2, '公用卫生间', '已支付');
INSERT INTO `house` VALUES (13, '房子88', '房子说明如下', 1, 8, NULL, 'lv14.jpg', '2020-03-27 21:44:30', '1', '5', '11', '位置88', 178, '24', '可用房间', 188, '简介如下', 'lv14.jpg', '2.jpg', '3.jpg', '4.jpg', NULL, 0, 2, '独立卫生间', '已支付');
INSERT INTO `house` VALUES (14, '特价房1', '<p>\r\n	这里是介绍\r\n</p>\r\n<p>\r\n	<img src=\"/jiudianyuding/attached/image/20181122/20181122232615_382.jpg\" alt=\"\" /> \r\n</p>', 1, 8, NULL, '3.jpg', '2020-03-27 21:44:30', '1', '2', '13', '位置99', 99, '15', '可用房间', 199, '房子很好，很舒适', '3.jpg', '7.jpg', '8.jpg', '10.jpg', NULL, 0, 1, '独立卫生间', '已支付');
INSERT INTO `house` VALUES (15, '房间888', '<iframe src=\"http://localhost:8080/jiudianyuding/kindeditor/plugins/baidumap/index.html?center=110.331706%2C20.034745&zoom=15&width=558&height=360&markers=110.331706%2C20.034745&markerStyles=l%2CA\" frameborder=\"0\" style=\"width:560px;height:362px;\">\r\n</iframe>', 1, 8, NULL, '6.jpg', '2020-03-27 21:44:30', '1', '4', '12', '位置78', 288, '30', '可用房间', 28.8, '房间很大大的', 'lv10.jpg', 'lv13.jpg', 'lv05.jpg', NULL, NULL, 0, 2, '独立卫生间', '已支付');
INSERT INTO `house` VALUES (16, '房间44', '说明', 1, 6, NULL, '7.jpg', '2020-03-27 21:44:30', '1', '5', '11', '位置2', 188, '25', '可用房间', 18.8, '', '8.jpg', '10.jpg', '11.jpg', 'zanwu.jpg', NULL, 0, 2, '独立卫生间', '已支付');
INSERT INTO `house` VALUES (17, '房间666', '介绍如下', 3, 6, NULL, '4.jpg', '2020-03-27 21:44:30', '1', '4', '13', '位置66', 199, '15', '可用房间', 19.9, '', '2.jpg', '6.jpg', '3.jpg', '5.jpg', NULL, 0, 2, '公用卫生间', '已支付');
INSERT INTO `house` VALUES (18, '房间101', '房间说明', 10, 6, NULL, '2.jpg', '2020-03-27 21:44:30', '1', '2', '12', '808', 169, '12', '可用房间', 16.9, '介绍如下', '3.jpg', '4.jpg', '5.jpg', '6.jpg', NULL, 0, 1, '公用卫生间', NULL);
INSERT INTO `house` VALUES (19, '房间1101', '介绍如下', 1, 11, NULL, 'zanwu.jpg', '2020-03-27 21:44:30', '1', '2', '11', '位置1', 180, '22', '可用房间', 18, '说明', '3.jpg', '5.jpg', NULL, NULL, NULL, 0, 1, '公用卫生间', NULL);
INSERT INTO `house` VALUES (20, '房间41', '<p>\r\n	说明如下\r\n</p>\r\n<p>\r\n	<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n		不同星级标准的宾馆，对各类客房应配的家具和设备都有明确的规定，但不同国家、不同标准的宾馆，家具和设备的多少和款式也会有差别，如有些客房可能增设餐桌、小酒吧或专门用于办公的桌椅，有些客房的卫生间还可能增加女士净身盆、旋涡浴缸和<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%A1%91%E6%8B%BF%E6%88%BF\">桑拿房</a>等。下面按照上述分类分别介绍。\r\n	</div>\r\n	<div class=\"anchor-list\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n		<a name=\"3_1\"></a><a name=\"sub680722_3_1\"></a><a name=\"单人间\"></a><a name=\"3-1\"></a>\r\n	</div>\r\n<div class=\"para-title level-3\" color:#333333;background-color:#ffffff;\"=\"\" style=\"box-sizing: border-box; color: rgb(170, 170, 170); font-family: &quot;Open Sans&quot;, sans-serif; letter-spacing: 0.2px; white-space: normal; background-color: rgb(255, 255, 255); margin: 20px 0px 12px; font-size: 18px;\">\r\n	<h3 class=\"title-text\" style=\"font-family:inherit;font-weight:400;color:inherit;font-size:18px;\">\r\n		单人间\r\n	</h3>\r\n		</div>\r\n		<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n			也叫单人客房，其间的主要家具和设施是一张单人床、一个床头柜、一张多用桌、一个箱包架、两张休闲椅、一个茶几以及固定设在入口处的衣橱和洗手间。\r\n			<div class=\"lemma-picture text-pic layout-right\" style=\"border:1px solid #E0E0E0;margin:0px 0px 3px;\">\r\n				<a class=\"image-link\" href=\"https://baike.baidu.com/pic/%E5%AE%A2%E6%88%BF/11012977/0/6f061d950a7b0208969438be61d9f2d3572cc814?fr=lemma&amp;ct=single\" target=\"_blank\"><img class=\"\" src=\"https://gss1.bdstatic.com/-vo3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=b7cf966048fbfbedd859317d48f1f78e/6f061d950a7b0208969438be61d9f2d3572cc814.jpg\" alt=\"单人间\" style=\"width:220px;height:139px;\" /></a><span class=\"description\" style=\"color:#555555;font-size:12px;font-family:宋体;line-height:15px;\">单人间</span>\r\n			</div>\r\n		</div>\r\n		<div class=\"anchor-list\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n			<a name=\"3_2\"></a><a name=\"sub680722_3_2\"></a><a name=\"标准间\"></a><a name=\"3-2\"></a>\r\n		</div>\r\n<div class=\"para-title level-3\" color:#333333;background-color:#ffffff;\"=\"\" style=\"box-sizing: border-box; color: rgb(170, 170, 170); font-family: &quot;Open Sans&quot;, sans-serif; letter-spacing: 0.2px; white-space: normal; background-color: rgb(255, 255, 255); margin: 20px 0px 12px; font-size: 18px;\">\r\n		<h3 class=\"title-text\" style=\"font-family:inherit;font-weight:400;color:inherit;font-size:18px;\">\r\n			标准间\r\n		</h3>\r\n	</div>\r\n	<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n		也叫双床间，在多种客房中，这种客房数量最多，适合住两位客人和夫妻同住<a class=\"lemma-album layout-right nslog:10000206\" href=\"https://baike.baidu.com/pic/%E5%AE%A2%E6%88%BF/11012977/1083489/f636afc379310a55a4be0858b74543a983261087?fr=lemma&amp;ct=cover\" target=\"_blank\">\r\n		<div class=\"album-wrap\" style=\"border:1px solid #E0E0E0;\">\r\n			<img class=\"picture\" alt=\"客房\" src=\"https://gss3.bdstatic.com/7Po3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=aeb52b60c3cec3fd8f3ea077e689d4b6/f636afc379310a55a4be0858b74543a983261087.jpg\" style=\"width:220px;height:165px;\" />\r\n		</div>\r\n		<div class=\"description\" style=\"padding:8px 7px;color:#555555;font-size:12px;font-family:simSun;\">\r\n			客房(7张)\r\n		</div>\r\n		<div class=\"albumBg\">\r\n			<div class=\"albumBgFir\" style=\"margin:0px auto;\">\r\n			</div>\r\n			<div class=\"albumBgSec\" style=\"margin:0px auto;\">\r\n			</div>\r\n		</div>\r\n</a>&nbsp;，适合旅游团体住用。设施的配备也最“标准”。其主要家具和设施是两张单人床，一个两人共用的床头柜，一对休闲椅和一个茶几，一个写字、梳妆、放电视机的多用桌和一张写字椅，一个箱包架以及分别位于小门厅两侧的衣橱和洗手间。客房的单人床常常大于家庭的单人床，常用尺寸为2000mm X 1200mm。休闲椅和茶几大都靠窗布置。箱包架与多用桌相接，是客人存取衣服时放置衣箱的，为防止箱子滑落，其表面有铜制或木制防滑条。床头柜置于两个单人床的中间，上有全部灯具的开关以及电视机的开关等。\r\n	</div>\r\n	<div class=\"anchor-list\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n		<a name=\"3_3\"></a><a name=\"sub680722_3_3\"></a><a name=\"双人间\"></a><a name=\"3-3\"></a>\r\n	</div>\r\n<div class=\"para-title level-3\" color:#333333;background-color:#ffffff;\"=\"\" style=\"box-sizing: border-box; color: rgb(170, 170, 170); font-family: &quot;Open Sans&quot;, sans-serif; letter-spacing: 0.2px; white-space: normal; background-color: rgb(255, 255, 255); margin: 20px 0px 12px; font-size: 18px;\">\r\n	<h3 class=\"title-text\" style=\"font-family:inherit;font-weight:400;color:inherit;font-size:18px;\">\r\n		双人间\r\n	</h3>\r\n		</div>\r\n		<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n			与标准间的配置相似，只是床为双人床，尺寸为1800mm X 2000mm或2000mm X 2000mm。\r\n			<div class=\"lemma-picture text-pic layout-right\" style=\"border:1px solid #E0E0E0;margin:0px 0px 3px;\">\r\n				<a class=\"image-link\" href=\"https://baike.baidu.com/pic/%E5%AE%A2%E6%88%BF/11012977/0/d043ad4bd11373f03baa68c0a70f4bfbfaed04d3?fr=lemma&amp;ct=single\" target=\"_blank\"><img class=\"\" src=\"https://gss1.bdstatic.com/9vo3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=c6965566ca3d70cf48faad0fc8ddd1ba/d043ad4bd11373f03baa68c0a70f4bfbfaed04d3.jpg\" alt=\"双人间\" style=\"width:220px;height:179px;\" /></a><span class=\"description\" style=\"color:#555555;font-size:12px;font-family:宋体;line-height:15px;\">双人间</span>\r\n			</div>\r\n		</div>\r\n		<div class=\"anchor-list\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n			<a name=\"3_4\"></a><a name=\"sub680722_3_4\"></a><a name=\"套间客房\"></a><a name=\"3-4\"></a>\r\n		</div>\r\n<div class=\"para-title level-3\" color:#333333;background-color:#ffffff;\"=\"\" style=\"box-sizing: border-box; color: rgb(170, 170, 170); font-family: &quot;Open Sans&quot;, sans-serif; letter-spacing: 0.2px; white-space: normal; background-color: rgb(255, 255, 255); margin: 20px 0px 12px; font-size: 18px;\">\r\n		<h3 class=\"title-text\" style=\"font-family:inherit;font-weight:400;color:inherit;font-size:18px;\">\r\n			套间客房\r\n		</h3>\r\n	</div>\r\n	<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n		由两间组成。外间为客厅，主要家具为沙发组和电视柜，有时还可以增设早餐用的小餐桌。客厅是供客人休息、接待客人和洽谈生意的地方，可适当摆放盆花等陈设。套房的里间是客人睡觉的地方，其配置与双床间或双人间相同。套间客房大都配备两个洗手间，分别供住宿者、来访客人使用。供客人使用的洗手间，位于入口处。有时不设浴缸。里间的洗手间供住宿者使用，故必须有面盆、便器和浴缸等三件洁具。套间客房不限于两间相套的，也有三间或四间相套的。三件或四间相套时，可能单独设置餐厅及办公室。\r\n		<div class=\"lemma-picture text-pic layout-right\" style=\"border:1px solid #E0E0E0;margin:0px 0px 3px;\">\r\n			<a class=\"image-link\" href=\"https://baike.baidu.com/pic/%E5%AE%A2%E6%88%BF/11012977/0/a71ea8d3fd1f4134e8b90221261f95cad0c85ee6?fr=lemma&amp;ct=single\" target=\"_blank\"><img class=\"\" src=\"https://gss3.bdstatic.com/7Po3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=509d8b5798504fc2a65fb707d5dce7f0/a71ea8d3fd1f4134e8b90221261f95cad0c85ee6.jpg\" alt=\"套间客房\" style=\"width:220px;height:146px;\" /></a><span class=\"description\" style=\"color:#555555;font-size:12px;font-family:宋体;line-height:15px;\">套间客房</span>\r\n		</div>\r\n	</div>\r\n	<div class=\"anchor-list\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n		<a name=\"3_5\"></a><a name=\"sub680722_3_5\"></a><a name=\"公寓式客房\"></a><a name=\"3-5\"></a>\r\n	</div>\r\n<div class=\"para-title level-3\" color:#333333;background-color:#ffffff;\"=\"\" style=\"box-sizing: border-box; color: rgb(170, 170, 170); font-family: &quot;Open Sans&quot;, sans-serif; letter-spacing: 0.2px; white-space: normal; background-color: rgb(255, 255, 255); margin: 20px 0px 12px; font-size: 18px;\">\r\n	<h3 class=\"title-text\" style=\"font-family:inherit;font-weight:400;color:inherit;font-size:18px;\">\r\n		公寓式客房\r\n	</h3>\r\n		</div>\r\n		<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n			的最大特点就是有厨房。这种客房主要供大公司派出人员租用，租用时间一般较长，故需要有一个偶尔做饭的厨房。这种客房集办公、会客、住宿、就餐、烹调空间为一体，所以至少要有两个以上的房间。\r\n			<div class=\"lemma-picture text-pic layout-right\" style=\"border:1px solid #E0E0E0;margin:0px 0px 3px;\">\r\n				<a class=\"image-link\" href=\"https://baike.baidu.com/pic/%E5%AE%A2%E6%88%BF/11012977/0/503d269759ee3d6daa43809440166d224e4adeec?fr=lemma&amp;ct=single\" target=\"_blank\"><img class=\"\" src=\"https://gss3.bdstatic.com/7Po3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=753a8b6e4990f60300b09b450913b370/503d269759ee3d6daa43809440166d224e4adeec.jpg\" alt=\"公寓式客房\" style=\"width:220px;height:165px;\" /></a><span class=\"description\" style=\"color:#555555;font-size:12px;font-family:宋体;line-height:15px;\">公寓式客房</span>\r\n			</div>\r\n		</div>\r\n		<div class=\"anchor-list\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n			<a name=\"3_6\"></a><a name=\"sub680722_3_6\"></a><a name=\"总统套房\"></a><a name=\"3-6\"></a>\r\n		</div>\r\n<div class=\"para-title level-3\" color:#333333;background-color:#ffffff;\"=\"\" style=\"box-sizing: border-box; color: rgb(170, 170, 170); font-family: &quot;Open Sans&quot;, sans-serif; letter-spacing: 0.2px; white-space: normal; background-color: rgb(255, 255, 255); margin: 20px 0px 12px; font-size: 18px;\">\r\n		<h3 class=\"title-text\" style=\"font-family:inherit;font-weight:400;color:inherit;font-size:18px;\">\r\n			总统套房\r\n		</h3>\r\n	</div>\r\n	<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n		组成不尽相同，基本空间为总统卧室、夫人卧室、会客室、办公室(书房)、会议室、餐厅、文娱室和健身室。有些宾馆在总统套房的前部设置随行人员的用房，它们与总统套房相邻，但又各有各的独立性。\r\n		<div class=\"lemma-picture text-pic layout-right\" style=\"border:1px solid #E0E0E0;margin:0px 0px 3px;\">\r\n			<a class=\"image-link\" href=\"https://baike.baidu.com/pic/%E5%AE%A2%E6%88%BF/11012977/0/1ad5ad6eddc451da22350bb4b5fd5266d11632a9?fr=lemma&amp;ct=single\" target=\"_blank\"><img class=\"\" src=\"https://gss3.bdstatic.com/-Po3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=1020aeedd258ccbf1fbcb23829d9bcd4/1ad5ad6eddc451da22350bb4b5fd5266d11632a9.jpg\" alt=\"总统套房\" style=\"width:220px;height:142px;\" /></a><span class=\"description\" style=\"color:#555555;font-size:12px;font-family:宋体;line-height:15px;\">总统套房</span>\r\n		</div>\r\n	</div>\r\n</p>', 14, 14, NULL, '1.jpg', '2020-03-27 21:44:30', '1', '2', '15', '位置1', 150, '10', '可用房间', 15, '房间介绍下，很干净', '2.jpg', '3.jpg', '4.jpg', '5.jpg', NULL, 0, 1, '独立卫生间', NULL);
INSERT INTO `house` VALUES (21, '房间51', '<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	不同星级标准的宾馆，对各类客房应配的家具和设备都有明确的规定，但不同国家、不同标准的宾馆，家具和设备的多少和款式也会有差别，如有些客房可能增设餐桌、小酒吧或专门用于办公的桌椅，有些客房的卫生间还可能增加女士净身盆、旋涡浴缸和<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%A1%91%E6%8B%BF%E6%88%BF\">桑拿房</a>等。下面按照上述分类分别介绍。\r\n</div>\r\n<div class=\"anchor-list\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	<a name=\"3_1\"></a><a name=\"sub680722_3_1\"></a><a name=\"单人间\"></a><a name=\"3-1\"></a>\r\n</div>\r\n<div class=\"para-title level-3\" color:#333333;background-color:#ffffff;\"=\"\" style=\"box-sizing: border-box; color: rgb(170, 170, 170); font-family: &quot;Open Sans&quot;, sans-serif; letter-spacing: 0.2px; white-space: normal; background-color: rgb(255, 255, 255); margin: 20px 0px 12px; font-size: 18px;\">\r\n<h3 class=\"title-text\" style=\"font-family:inherit;font-weight:400;color:inherit;font-size:18px;\">\r\n	单人间\r\n</h3>\r\n	</div>\r\n	<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n		也叫单人客房，其间的主要家具和设施是一张单人床、一个床头柜、一张多用桌、一个箱包架、两张休闲椅、一个茶几以及固定设在入口处的衣橱和洗手间。\r\n		<div class=\"lemma-picture text-pic layout-right\" style=\"border:1px solid #E0E0E0;margin:0px 0px 3px;\">\r\n			<a class=\"image-link\" href=\"https://baike.baidu.com/pic/%E5%AE%A2%E6%88%BF/11012977/0/6f061d950a7b0208969438be61d9f2d3572cc814?fr=lemma&amp;ct=single\" target=\"_blank\"><img class=\"\" src=\"https://gss1.bdstatic.com/-vo3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=b7cf966048fbfbedd859317d48f1f78e/6f061d950a7b0208969438be61d9f2d3572cc814.jpg\" alt=\"单人间\" style=\"width:220px;height:139px;\" /></a><span class=\"description\" style=\"color:#555555;font-size:12px;font-family:宋体;line-height:15px;\">单人间</span>\r\n		</div>\r\n	</div>\r\n	<div class=\"anchor-list\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n		<a name=\"3_2\"></a><a name=\"sub680722_3_2\"></a><a name=\"标准间\"></a><a name=\"3-2\"></a>\r\n	</div>\r\n<div class=\"para-title level-3\" color:#333333;background-color:#ffffff;\"=\"\" style=\"box-sizing: border-box; color: rgb(170, 170, 170); font-family: &quot;Open Sans&quot;, sans-serif; letter-spacing: 0.2px; white-space: normal; background-color: rgb(255, 255, 255); margin: 20px 0px 12px; font-size: 18px;\">\r\n	<h3 class=\"title-text\" style=\"font-family:inherit;font-weight:400;color:inherit;font-size:18px;\">\r\n		标准间\r\n	</h3>\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	也叫双床间，在多种客房中，这种客房数量最多，适合住两位客人和夫妻同住<a class=\"lemma-album layout-right nslog:10000206\" href=\"https://baike.baidu.com/pic/%E5%AE%A2%E6%88%BF/11012977/1083489/f636afc379310a55a4be0858b74543a983261087?fr=lemma&amp;ct=cover\" target=\"_blank\">\r\n	<div class=\"album-wrap\" style=\"border:1px solid #E0E0E0;\">\r\n		<img class=\"picture\" alt=\"客房\" src=\"https://gss3.bdstatic.com/7Po3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=aeb52b60c3cec3fd8f3ea077e689d4b6/f636afc379310a55a4be0858b74543a983261087.jpg\" style=\"width:220px;height:165px;\" />\r\n	</div>\r\n	<div class=\"description\" style=\"padding:8px 7px;color:#555555;font-size:12px;font-family:simSun;\">\r\n		客房(7张)\r\n	</div>\r\n	<div class=\"albumBg\">\r\n		<div class=\"albumBgFir\" style=\"margin:0px auto;\">\r\n		</div>\r\n		<div class=\"albumBgSec\" style=\"margin:0px auto;\">\r\n		</div>\r\n	</div>\r\n</a>&nbsp;，适合旅游团体住用。设施的配备也最“标准”。其主要家具和设施是两张单人床，一个两人共用的床头柜，一对休闲椅和一个茶几，一个写字、梳妆、放电视机的多用桌和一张写字椅，一个箱包架以及分别位于小门厅两侧的衣橱和洗手间。客房的单人床常常大于家庭的单人床，常用尺寸为2000mm X 1200mm。休闲椅和茶几大都靠窗布置。箱包架与多用桌相接，是客人存取衣服时放置衣箱的，为防止箱子滑落，其表面有铜制或木制防滑条。床头柜置于两个单人床的中间，上有全部灯具的开关以及电视机的开关等。\r\n</div>\r\n<div class=\"anchor-list\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	<a name=\"3_3\"></a><a name=\"sub680722_3_3\"></a><a name=\"双人间\"></a><a name=\"3-3\"></a>\r\n</div>\r\n<div class=\"para-title level-3\" color:#333333;background-color:#ffffff;\"=\"\" style=\"box-sizing: border-box; color: rgb(170, 170, 170); font-family: &quot;Open Sans&quot;, sans-serif; letter-spacing: 0.2px; white-space: normal; background-color: rgb(255, 255, 255); margin: 20px 0px 12px; font-size: 18px;\">\r\n<h3 class=\"title-text\" style=\"font-family:inherit;font-weight:400;color:inherit;font-size:18px;\">\r\n	双人间\r\n</h3>\r\n	</div>\r\n	<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n		与标准间的配置相似，只是床为双人床，尺寸为1800mm X 2000mm或2000mm X 2000mm。\r\n		<div class=\"lemma-picture text-pic layout-right\" style=\"border:1px solid #E0E0E0;margin:0px 0px 3px;\">\r\n			<a class=\"image-link\" href=\"https://baike.baidu.com/pic/%E5%AE%A2%E6%88%BF/11012977/0/d043ad4bd11373f03baa68c0a70f4bfbfaed04d3?fr=lemma&amp;ct=single\" target=\"_blank\"><img class=\"\" src=\"https://gss1.bdstatic.com/9vo3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=c6965566ca3d70cf48faad0fc8ddd1ba/d043ad4bd11373f03baa68c0a70f4bfbfaed04d3.jpg\" alt=\"双人间\" style=\"width:220px;height:179px;\" /></a><span class=\"description\" style=\"color:#555555;font-size:12px;font-family:宋体;line-height:15px;\">双人间</span>\r\n		</div>\r\n	</div>\r\n	<div class=\"anchor-list\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n		<a name=\"3_4\"></a><a name=\"sub680722_3_4\"></a><a name=\"套间客房\"></a><a name=\"3-4\"></a>\r\n	</div>\r\n<div class=\"para-title level-3\" color:#333333;background-color:#ffffff;\"=\"\" style=\"box-sizing: border-box; color: rgb(170, 170, 170); font-family: &quot;Open Sans&quot;, sans-serif; letter-spacing: 0.2px; white-space: normal; background-color: rgb(255, 255, 255); margin: 20px 0px 12px; font-size: 18px;\">\r\n	<h3 class=\"title-text\" style=\"font-family:inherit;font-weight:400;color:inherit;font-size:18px;\">\r\n		套间客房\r\n	</h3>\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	由两间组成。外间为客厅，主要家具为沙发组和电视柜，有时还可以增设早餐用的小餐桌。客厅是供客人休息、接待客人和洽谈生意的地方，可适当摆放盆花等陈设。套房的里间是客人睡觉的地方，其配置与双床间或双人间相同。套间客房大都配备两个洗手间，分别供住宿者、来访客人使用。供客人使用的洗手间，位于入口处。有时不设浴缸。里间的洗手间供住宿者使用，故必须有面盆、便器和浴缸等三件洁具。套间客房不限于两间相套的，也有三间或四间相套的。三件或四间相套时，可能单独设置餐厅及办公室。\r\n	<div class=\"lemma-picture text-pic layout-right\" style=\"border:1px solid #E0E0E0;margin:0px 0px 3px;\">\r\n		<a class=\"image-link\" href=\"https://baike.baidu.com/pic/%E5%AE%A2%E6%88%BF/11012977/0/a71ea8d3fd1f4134e8b90221261f95cad0c85ee6?fr=lemma&amp;ct=single\" target=\"_blank\"><img class=\"\" src=\"https://gss3.bdstatic.com/7Po3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=509d8b5798504fc2a65fb707d5dce7f0/a71ea8d3fd1f4134e8b90221261f95cad0c85ee6.jpg\" alt=\"套间客房\" style=\"width:220px;height:146px;\" /></a><span class=\"description\" style=\"color:#555555;font-size:12px;font-family:宋体;line-height:15px;\">套间客房</span>\r\n	</div>\r\n</div>\r\n<div class=\"anchor-list\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	<a name=\"3_5\"></a><a name=\"sub680722_3_5\"></a><a name=\"公寓式客房\"></a><a name=\"3-5\"></a>\r\n</div>\r\n<div class=\"para-title level-3\" color:#333333;background-color:#ffffff;\"=\"\" style=\"box-sizing: border-box; color: rgb(170, 170, 170); font-family: &quot;Open Sans&quot;, sans-serif; letter-spacing: 0.2px; white-space: normal; background-color: rgb(255, 255, 255); margin: 20px 0px 12px; font-size: 18px;\">\r\n<h3 class=\"title-text\" style=\"font-family:inherit;font-weight:400;color:inherit;font-size:18px;\">\r\n	公寓式客房\r\n</h3>\r\n	</div>\r\n	<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n		的最大特点就是有厨房。这种客房主要供大公司派出人员租用，租用时间一般较长，故需要有一个偶尔做饭的厨房。这种客房集办公、会客、住宿、就餐、烹调空间为一体，所以至少要有两个以上的房间。\r\n		<div class=\"lemma-picture text-pic layout-right\" style=\"border:1px solid #E0E0E0;margin:0px 0px 3px;\">\r\n			<a class=\"image-link\" href=\"https://baike.baidu.com/pic/%E5%AE%A2%E6%88%BF/11012977/0/503d269759ee3d6daa43809440166d224e4adeec?fr=lemma&amp;ct=single\" target=\"_blank\"><img class=\"\" src=\"https://gss3.bdstatic.com/7Po3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=753a8b6e4990f60300b09b450913b370/503d269759ee3d6daa43809440166d224e4adeec.jpg\" alt=\"公寓式客房\" style=\"width:220px;height:165px;\" /></a><span class=\"description\" style=\"color:#555555;font-size:12px;font-family:宋体;line-height:15px;\">公寓式客房</span>\r\n		</div>\r\n	</div>\r\n	<div class=\"anchor-list\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n		<a name=\"3_6\"></a><a name=\"sub680722_3_6\"></a><a name=\"总统套房\"></a><a name=\"3-6\"></a>\r\n	</div>\r\n<div class=\"para-title level-3\" color:#333333;background-color:#ffffff;\"=\"\" style=\"box-sizing: border-box; color: rgb(170, 170, 170); font-family: &quot;Open Sans&quot;, sans-serif; letter-spacing: 0.2px; white-space: normal; background-color: rgb(255, 255, 255); margin: 20px 0px 12px; font-size: 18px;\">\r\n	<h3 class=\"title-text\" style=\"font-family:inherit;font-weight:400;color:inherit;font-size:18px;\">\r\n		总统套房\r\n	</h3>\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	组成不尽相同，基本空间为总统卧室、夫人卧室、会客室、办公室(书房)、会议室、餐厅、文娱室和健身室。有些宾馆在总统套房的前部设置随行人员的用房，它们与总统套房相邻，但又各有各的独立性。\r\n	<div class=\"lemma-picture text-pic layout-right\" style=\"border:1px solid #E0E0E0;margin:0px 0px 3px;\">\r\n		<a class=\"image-link\" href=\"https://baike.baidu.com/pic/%E5%AE%A2%E6%88%BF/11012977/0/1ad5ad6eddc451da22350bb4b5fd5266d11632a9?fr=lemma&amp;ct=single\" target=\"_blank\"><img class=\"\" src=\"https://gss3.bdstatic.com/-Po3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=1020aeedd258ccbf1fbcb23829d9bcd4/1ad5ad6eddc451da22350bb4b5fd5266d11632a9.jpg\" alt=\"总统套房\" style=\"width:220px;height:142px;\" /></a><span class=\"description\" style=\"color:#555555;font-size:12px;font-family:宋体;line-height:15px;\">总统套房</span>\r\n	</div>\r\n</div>', 16, 16, NULL, '1.jpg', '2020-03-27 21:44:30', '1', '3', '17', '位置1', 159, '15', '可用房间', 15.9, '说明', '2.jpg', '3.jpg', '4.jpg', '6.jpg', NULL, 0, 1, '独立卫生间', NULL);
INSERT INTO `house` VALUES (22, '房间701', '内容说明', 18, 1, NULL, '2.jpg', '2020-03-27 21:44:30', '1', '4', '11', '七楼', 360, '22', '可用房间', 36, '介绍', '3.jpg', '1.jpg', '3.jpg', NULL, NULL, 2, 2, '独立卫生间', NULL);
INSERT INTO `house` VALUES (23, '房间201', '222', 4, 8, NULL, '3.jpg', '2020-03-27 21:44:30', '1', '2', '11', '位置1', 200, '15', '可用房间', 20, '11', '3.jpg', '4.jpg', NULL, NULL, NULL, 1, 2, '独立卫生间', NULL);
INSERT INTO `house` VALUES (24, '房间7#1505', '<p>\r\n	房间说明11\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', 2, 6, NULL, '3.jpg', '2020-03-29 13:54:05', '1', '3', '12', '地址1', 256, '25', '可用房间', NULL, '房间的介绍11', '5.jpg', '6.jpg', '7.jpg', '7.jpg', NULL, 0, 4, '公用卫生间', NULL);

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `isdel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `btype` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pubtime` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `jianjie` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (9, '', '公告2', '公告2', '1', NULL, '2020-04-06 20:51:46', '公告2', 1);
INSERT INTO `news` VALUES (10, '', '公告1', '公告1', '1', NULL, '2020-04-06 20:52:29', '公告1', 1);

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gid` int(11) NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL,
  `pubtime` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES (1, 4, 7, '2020-04-06 00:20:20');
INSERT INTO `record` VALUES (2, 6, 7, '2020-04-06 01:03:03');
INSERT INTO `record` VALUES (3, 6, 7, '2020-04-06 01:03:21');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL,
  `pubtime` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `btype` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1, 1, '2020-04-05 22:30:29', '后台登录');
INSERT INTO `sys_log` VALUES (2, 1, '2020-04-05 22:31:46', '后台登录');
INSERT INTO `sys_log` VALUES (3, 1, '2020-04-05 22:31:57', '后台登录');
INSERT INTO `sys_log` VALUES (4, 1, '2020-04-05 22:33:44', '后台登录');
INSERT INTO `sys_log` VALUES (5, 1, '2020-04-05 22:39:36', '后台登录');
INSERT INTO `sys_log` VALUES (6, 1, '2020-04-05 23:06:54', '后台登录');
INSERT INTO `sys_log` VALUES (7, 1, '2020-04-05 23:10:48', '后台登录');
INSERT INTO `sys_log` VALUES (8, 1, '2020-04-05 23:23:11', '后台登录');
INSERT INTO `sys_log` VALUES (9, 1, '2020-04-05 23:36:23', '后台登录');
INSERT INTO `sys_log` VALUES (10, 1, '2020-04-05 23:40:00', '后台登录');
INSERT INTO `sys_log` VALUES (11, 7, '2020-04-05 23:53:25', '前台登录');
INSERT INTO `sys_log` VALUES (12, 7, '2020-04-06 00:00:20', '前台登录');
INSERT INTO `sys_log` VALUES (13, 7, '2020-04-06 00:03:29', '前台登录');
INSERT INTO `sys_log` VALUES (14, 7, '2020-04-06 00:16:08', '前台登录');
INSERT INTO `sys_log` VALUES (15, 7, '2020-04-06 00:17:45', '前台登录');
INSERT INTO `sys_log` VALUES (16, 7, '2020-04-06 00:17:57', '前台登录');
INSERT INTO `sys_log` VALUES (17, 7, '2020-04-06 00:23:06', '前台登录');
INSERT INTO `sys_log` VALUES (18, 7, '2020-04-06 00:26:30', '前台登录');
INSERT INTO `sys_log` VALUES (19, 1, '2020-04-06 00:26:46', '后台登录');
INSERT INTO `sys_log` VALUES (20, 1, '2020-04-06 00:27:10', '后台登录');
INSERT INTO `sys_log` VALUES (21, 1, '2020-04-06 00:32:34', '后台登录');
INSERT INTO `sys_log` VALUES (22, 7, '2020-04-06 00:33:43', '前台登录');
INSERT INTO `sys_log` VALUES (23, 1, '2020-04-06 00:49:12', '后台登录');
INSERT INTO `sys_log` VALUES (24, 1, '2020-04-06 00:50:43', '后台登录');
INSERT INTO `sys_log` VALUES (25, 7, '2020-04-06 00:56:56', '前台登录');
INSERT INTO `sys_log` VALUES (26, 1, '2020-04-06 00:58:52', '后台登录');
INSERT INTO `sys_log` VALUES (27, 1, '2020-04-06 19:51:49', '鍚庡彴鐧诲綍');
INSERT INTO `sys_log` VALUES (28, 1, '2020-04-06 19:55:51', '后台登录');
INSERT INTO `sys_log` VALUES (29, 1, '2020-04-06 19:56:28', '后台注销');
INSERT INTO `sys_log` VALUES (30, 1, '2020-04-06 19:57:13', '后台登录');
INSERT INTO `sys_log` VALUES (31, 1, '2020-04-06 19:57:49', '后台注销');
INSERT INTO `sys_log` VALUES (32, 6, '2020-04-06 19:57:52', '后台登录');
INSERT INTO `sys_log` VALUES (33, 1, '2020-04-06 20:46:41', '后台登录');
INSERT INTO `sys_log` VALUES (34, 1, '2020-04-06 20:49:49', '后台登录');
INSERT INTO `sys_log` VALUES (35, 1, '2020-04-06 20:51:25', '后台登录');
INSERT INTO `sys_log` VALUES (36, 1, '2020-04-06 20:59:44', '后台登录');

-- ----------------------------
-- Table structure for sysuser
-- ----------------------------
DROP TABLE IF EXISTS `sysuser`;
CREATE TABLE `sysuser`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pwd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `utype` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '会员' COMMENT '1 为正常使用， 0为删除',
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mbanswer` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pubtime` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vtype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isdel` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `idnumber` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scope` double NULL DEFAULT NULL,
  `qname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` double NULL DEFAULT NULL,
  `dnum` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysuser
-- ----------------------------
INSERT INTO `sysuser` VALUES (1, 'admin', '男', NULL, '123', '高级管理员', '15671234889', NULL, '', '', NULL, '2020-03-27 21:45:04', '管理员', 'avatar.png', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sysuser` VALUES (4, 'hy01', '女', '武汉343号', '123456', '会员', '14584845215', '25', '我是谁？', 'hy01', '21521515@qq.com', '2020-03-27 21:45:04', '会员1', 'avatar.png', '普通用户', NULL, NULL, '1', '420987199405032698', NULL, NULL, 363, NULL);
INSERT INTO `sysuser` VALUES (5, 'hy02', '女', '深圳251号', '123456', '会员', '14584845215', '25', '我是谁？', 'hy02', '215215169@qq.com', '2020-03-27 21:45:04', '会员2', 'avatar.png', '普通用户', NULL, NULL, '1', '426982199406236597', NULL, NULL, 54, NULL);
INSERT INTO `sysuser` VALUES (6, 'sj01', '男', '地区1', '123456', '普通管理员', '15396232144', NULL, NULL, NULL, '61515115@qq.com', '2020-03-27 21:45:04', '酒店01', 'avatar.png', '', '通过审核', NULL, '1', NULL, 0, NULL, NULL, NULL);
INSERT INTO `sysuser` VALUES (7, 'test', '男', '地址1', '123456', '会员', '15396232144', '26', '我是谁？', 'test', '61515115@qq.com', '2020-03-27 21:45:04', '测试用户', 'avatar.png', 'VIP3', NULL, NULL, '1', '420963199605032361', 4, NULL, 103.1, 3);
INSERT INTO `sysuser` VALUES (8, 'sj02', '女', '地址1', '123456', '普通管理员', '15396232144', NULL, NULL, NULL, '61515115@qq.com', '2020-03-27 21:45:04', '酒店02', 'avatar.png', '', '通过审核', NULL, '1', NULL, 0, NULL, NULL, NULL);
INSERT INTO `sysuser` VALUES (11, 'sj03', '男', '地区1', '123456', '普通管理员', '14584845288', NULL, NULL, NULL, '21521515@qq.com', '2020-03-27 21:45:04', '酒店03', 'avatar.png', '', '通过审核', NULL, '1', NULL, 0, NULL, NULL, NULL);
INSERT INTO `sysuser` VALUES (12, 'lili', '女', '地区1', '123456', '会员', '14584845215', '1996-05-12', '我是谁？', 'lili', '21521515@qq.com', '2020-03-27 21:45:04', '李丽', 'lv05.jpg', 'VIP1', NULL, NULL, '1', '420987199605122698', NULL, NULL, 0, NULL);
INSERT INTO `sysuser` VALUES (13, 'test01', '男', '地区1', '123456', '会员', '14584845214', '1994-05-25', '我是谁？', 'test01', '21521515@qq.com', '2020-03-27 21:45:04', '测试用户01', 'avatar.png', 'VIP2', NULL, NULL, '1', '420987199405252698', NULL, NULL, 0, NULL);
INSERT INTO `sysuser` VALUES (14, 'sj04', '男', '地区4', '123456', '普通管理员', '14584845215', NULL, NULL, NULL, '21521515@qq.com', '2020-03-27 21:45:04', '酒店04', 'avatar.png', '', '通过审核', NULL, '1', NULL, 0, NULL, NULL, NULL);
INSERT INTO `sysuser` VALUES (15, 'test02', '男', '地区1', '123456', '会员', '14584845214', '1996-05-12', '我是谁？', 'test02', '21521515@qq.com', '2020-03-27 21:45:04', '测试用户02', 'avatar.png', '普通用户', NULL, NULL, '1', '420987199605122698', NULL, NULL, 0, NULL);
INSERT INTO `sysuser` VALUES (16, 'sj05', '男', '武汉', '123456', '普通管理员', '15584845215', NULL, NULL, NULL, '21521515@qq.com', '2020-03-27 21:45:04', '酒店05', 'lv08.jpg', '', '通过审核', NULL, '1', NULL, 0, NULL, NULL, NULL);
INSERT INTO `sysuser` VALUES (17, 'test03', '男', '地区1', '123456', '会员', '15584845215', '1996-05-12', '我是谁？', 'test03', '21521515@qq.com', '2020-03-27 21:45:04', '测试用户03', 'avatar.png', '普通用户', NULL, NULL, '1', '420987199605122698', NULL, NULL, 0, NULL);
INSERT INTO `sysuser` VALUES (18, 'test04', '男', '地区1', '123456', '会员', '14584845288', '1996-05-12', '我是谁？', 'test04', '21521515@qq.com', '2020-03-27 21:45:04', '测试用户04', 'lv04.jpg', '普通用户', NULL, NULL, '1', '420987199605122698', NULL, NULL, 0, NULL);
INSERT INTO `sysuser` VALUES (19, 'test08', '男', '地址1', '123456', '会员', '17556212399', '1996-05-06', '我是谁？', 'test08', '115431678@qq.com', '2020-03-29 13:18:47', '测试用户08', 'avatar.png', '普通用户', NULL, NULL, '1', '420987199605062135', 18, NULL, 174.68, 2);

SET FOREIGN_KEY_CHECKS = 1;
