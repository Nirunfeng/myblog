/*
 Navicat Premium Data Transfer

 Source Server         : Stephanie
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 31/12/2019 10:11:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '博客类型',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '博客题目',
  `summary` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '博客摘要',
  `releaseDate` datetime(0) NULL DEFAULT NULL COMMENT '发布日期',
  `clickHit` int(11) NULL DEFAULT NULL COMMENT '点击次数',
  `commentHit` int(11) NULL DEFAULT NULL COMMENT '评论次数',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '博客内容',
  `keyword` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `blogTypeId` int(11) NULL DEFAULT NULL COMMENT '外键关联博客类别',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type_id`(`blogTypeId`) USING BTREE,
  CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`blogTypeId`) REFERENCES `blogtype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES (29, '测试20191204', 'SUMMARY', '2019-12-04 17:04:17', 30, 3, '<p>\n	<span style=\"font-size:24px;\">CRUD</span> \n</p>\n<p>\n	<img src=\"http://localhost:8080/static/kindeditor/plugins/emoticons/images/13.gif\" border=\"0\" alt=\"\" />\n</p>\n<p>\n	<img src=\"/upload/image/20191204/20191204170409_590.jpg\" alt=\"\" />\n</p>', 'keyword', 3);
INSERT INTO `blog` VALUES (30, '一天发一篇', '测试测试', '2019-12-05 08:57:58', 25, 0, '<p>\n	今天终结所有基本模块\n</p>\n<p>\n	<img src=\"http://localhost:8080/static/kindeditor/plugins/emoticons/images/13.gif\" border=\"0\" alt=\"\" />\n</p>\n<p>\n	<img src=\"/upload/image/20191205/20191205085742_746.jpeg\" alt=\"\" />\n</p>', 'OVER', 2);
INSERT INTO `blog` VALUES (31, 'Required Integer parameter \'id\' is not present', 'Spring Boot', '2019-12-10 08:21:43', 4, 0, '<h2 style=\"font-size:24px;font-family:\" color:#4f4f4f;background-color:#ffffff;\"=\"\">\n	Required Integer parameter ‘id’ is not present\n	</h2>\n	<p>\n		<span style=\"color:rgba(0, 0, 0, 0.75);font-family:\" font-size:16px;background-color:#ffffff;\"=\"\">那是因为服务器需要从你的网址上获得id来查询，所以其实很简单，在问号后面提供参数即可</span> \n	</p>\n	<p>\n		<img src=\"https://img-blog.csdnimg.cn/20190908185625917.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1N0ZXBoYW5pZTE3Mzk1,size_16,color_FFFFFF,t_70\" alt=\"在这里插入图片描述\" /> \n	</p>', '问题解决', 2);
INSERT INTO `blog` VALUES (32, 'Spring Boot  MyBatis概念篇', 'Spring Boot 集成 MyBatis', '2019-12-19 09:32:50', 14, 1, 'ORM框架<br />\n对象关系映射：Object Relational Mapping<br />\n出现原因：解决面向对象与关系型数据库的不匹配而产生的技术<br />\n具体实现：ORM 通过使用描述对象和数据库之间映射的元数据，将程序中的对象自动持久化到关系数据库中。<br />\nMybatis<br />\nMybatis就是一款标准的ORM框架，支持普通 SQL 查询，存储过程和高级映射的优秀持久层框架。<br />\nMyBatis 消除了几乎所有的JDBC 代码和参数的手工设置以及对结果集的检索封装。<br />\nMyBatis 可以使用简单的 XML 或注解用于配置和原始映射，将接口和 Java 的实体类映射成数据库中的记录。<br />\n<br />', 'ORM框架', 2);
INSERT INTO `blog` VALUES (33, '答辩', '测试', '2019-12-10 09:44:12', 2, 0, '<img src=\"/upload/image/20191210/20191210094401_796.png\" alt=\"\" />', 'DEBUG', 3);

-- ----------------------------
-- Table structure for blogger
-- ----------------------------
DROP TABLE IF EXISTS `blogger`;
CREATE TABLE `blogger`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '博主id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '博主姓名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '博主密码',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '博主电邮',
  `hint` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '提示密码',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blogger
-- ----------------------------
INSERT INTO `blogger` VALUES (1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '820352756@qq.com', 'admin', '你的地址', '你的电话');

-- ----------------------------
-- Table structure for blogtype
-- ----------------------------
DROP TABLE IF EXISTS `blogtype`;
CREATE TABLE `blogtype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '博客id',
  `type_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '博客类别',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '博客排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blogtype
-- ----------------------------
INSERT INTO `blogtype` VALUES (2, '原创', 1);
INSERT INTO `blogtype` VALUES (3, '转载', 2);
INSERT INTO `blogtype` VALUES (5, '想法', 4);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论表id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论者',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论者email',
  `content` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `comment_date` datetime(0) NULL DEFAULT NULL COMMENT '评论日期',
  `blog_id` int(11) NULL DEFAULT NULL COMMENT '外键关联具体博客',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `t_comment_ibfk_1`(`blog_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (23, 'SSR', '1457050516@qq.com', '测试评论', '2019-12-10 09:37:25', 29);
INSERT INTO `comment` VALUES (19, 'ssr', '1457050516@qq.com', '评论一波；）', '2019-12-07 17:03:39', 29);
INSERT INTO `comment` VALUES (15, '周三的程序媛', '820352756@qq.com', '测试评论  嘿嘿嘿', '2019-12-04 17:02:48', 29);
INSERT INTO `comment` VALUES (22, 'HAHA', '603005761@qq.com', '沙发；）', '2019-12-10 08:29:08', 32);

-- ----------------------------
-- Table structure for link
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '友情链接表id',
  `link_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '友情链接名',
  `link_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '友情链接url',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '链接排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of link
-- ----------------------------
INSERT INTO `link` VALUES (1, 'CSDN', 'https://www.csdn.net/', 1);
INSERT INTO `link` VALUES (2, '博客园', 'https://www.cnblogs.com/', 2);
INSERT INTO `link` VALUES (4, 'stackoverflow', 'https://stackoverflow.com/', 3);
INSERT INTO `link` VALUES (5, '掘金', 'https://juejin.im/', 4);
INSERT INTO `link` VALUES (6, '简书', 'https://www.jianshu.com/', 5);
INSERT INTO `link` VALUES (7, '思否', 'https://segmentfault.com', 6);
INSERT INTO `link` VALUES (9, '必应', 'https://www.bing.com', 7);

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reply_date` datetime(0) NULL DEFAULT NULL,
  `comment_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES (1, 'HELLO', '2019-12-08 20:09:18', 15);
INSERT INTO `reply` VALUES (3, '欢迎浏览', '2019-12-10 08:29:40', 22);
INSERT INTO `reply` VALUES (4, '回复你了', '2019-12-10 09:45:06', 22);

SET FOREIGN_KEY_CHECKS = 1;
