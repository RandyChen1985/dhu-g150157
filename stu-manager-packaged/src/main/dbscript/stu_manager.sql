/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50160
 Source Host           : localhost
 Source Database       : stu_manager

 Target Server Type    : MySQL
 Target Server Version : 50160
 File Encoding         : utf-8

 Date: 12/21/2016 21:00:56 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `t_course`
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course` (
  `courseId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '课程编号',
  `courseName` varchar(50) DEFAULT NULL COMMENT '课程名称',
  `courseNotes` varchar(200) DEFAULT NULL COMMENT '备注',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `createUser` varchar(20) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`courseId`),
  KEY `idx_course_id` (`courseId`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='课程管理';

-- ----------------------------
--  Records of `t_course`
-- ----------------------------
BEGIN;
INSERT INTO `t_course` VALUES ('1', '软件工程', '软件工程', '2016-12-19 18:05:04', 'admin(默认管理员)'), ('3', '项目管理', '项目管理', '2016-12-20 10:34:40', 'admin(默认管理员)'), ('4', '面对对象技术', '面对对象技术', '2016-12-20 10:35:50', 'admin(默认管理员)'), ('5', '数值分析', '数值分析', '2016-12-20 10:36:03', 'admin(默认管理员)'), ('6', '政治', '政治', '2016-12-20 10:36:16', 'admin(默认管理员)'), ('7', '研究生英语', '研究生英语', '2016-12-20 10:36:28', 'admin(默认管理员)'), ('8', '数理统计', '数理统计', '2016-12-21 20:37:31', 'admin(默认管理员)'), ('9', '数据库与数据仓库', '数据库与数据仓库', '2016-12-21 20:38:47', 'admin(默认管理员)'), ('10', '计算机网络安全和信息加密', '计算机网络安全和信息加密', '2016-12-21 20:39:01', 'admin(默认管理员)'), ('11', '电子商务技术概论', '电子商务技术概论', '2016-12-21 20:43:00', 'admin(默认管理员)');
COMMIT;

-- ----------------------------
--  Table structure for `t_logs`
-- ----------------------------
DROP TABLE IF EXISTS `t_logs`;
CREATE TABLE `t_logs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL COMMENT '账号名',
  `logtype` varchar(255) DEFAULT NULL COMMENT '日志类别',
  `logstatus` tinyint(4) DEFAULT NULL COMMENT '状态,0:成功,1:失败',
  `logip` varchar(255) DEFAULT NULL COMMENT '登录IP',
  `logtime` datetime DEFAULT NULL COMMENT '登录时间',
  `notes` text COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='日志表';

-- ----------------------------
--  Records of `t_logs`
-- ----------------------------
BEGIN;
INSERT INTO `t_logs` VALUES ('1', 'admin', '登录系统', '0', '127.0.0.1', '2016-12-21 20:39:08', '登录成功!!'), ('2', 'admin', '登录系统', '0', '127.0.0.1', '2016-12-21 20:42:43', '登录成功!!'), ('3', 'admin', '登出系统', '0', '127.0.0.1', '2016-12-21 21:00:38', 'admin退出系统成功!!');
COMMIT;

-- ----------------------------
--  Table structure for `t_rel_term_course`
-- ----------------------------
DROP TABLE IF EXISTS `t_rel_term_course`;
CREATE TABLE `t_rel_term_course` (
  `term_id` varchar(50) NOT NULL DEFAULT '',
  `course_id` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`term_id`,`course_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='学年&课程-关系表';

-- ----------------------------
--  Records of `t_rel_term_course`
-- ----------------------------
BEGIN;
INSERT INTO `t_rel_term_course` VALUES ('T00001', '1'), ('T00001', '3'), ('T00002', '5'), ('T00002', '6'), ('T00002', '8'), ('T00003', '10'), ('T00003', '7');
COMMIT;

-- ----------------------------
--  Table structure for `t_scores`
-- ----------------------------
DROP TABLE IF EXISTS `t_scores`;
CREATE TABLE `t_scores` (
  `studentId` varchar(20) NOT NULL DEFAULT '' COMMENT '学生编号',
  `termId` varchar(20) NOT NULL DEFAULT '' COMMENT '学年编号',
  `courseId` varchar(20) NOT NULL DEFAULT '' COMMENT '课程编号',
  `score` bigint(20) DEFAULT NULL COMMENT '学生成绩',
  `createTime` datetime DEFAULT NULL COMMENT '添加时间',
  `createUser` varchar(20) DEFAULT NULL COMMENT '添加人',
  PRIMARY KEY (`studentId`,`termId`,`courseId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='学生成绩表';

-- ----------------------------
--  Records of `t_scores`
-- ----------------------------
BEGIN;
INSERT INTO `t_scores` VALUES ('G150100', 'T00001', '1', '60', '2016-12-21 20:55:17', 'admin(默认管理员)'), ('G150101', 'T00001', '1', '88', '2016-12-21 20:56:40', 'admin(默认管理员)'), ('G150102', 'T00001', '1', '95', '2016-12-21 20:55:38', 'admin(默认管理员)'), ('G150103', 'T00001', '1', '55', '2016-12-21 20:55:49', 'admin(默认管理员)'), ('G150104', 'T00001', '1', '88', '2016-12-21 20:56:03', 'admin(默认管理员)'), ('G150100', 'T00001', '3', '69', '2016-12-21 20:57:47', 'admin(默认管理员)'), ('G150102', 'T00001', '4', '33', '2016-12-21 20:58:04', 'admin(默认管理员)'), ('G150103', 'T00002', '10', '66', '2016-12-21 20:58:44', 'admin(默认管理员)');
COMMIT;

-- ----------------------------
--  Table structure for `t_student`
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student` (
  `studentId` varchar(20) NOT NULL DEFAULT '' COMMENT '学生编号',
  `stuName` varchar(20) DEFAULT NULL COMMENT '学生姓名',
  `stuGendar` tinyint(4) DEFAULT '0' COMMENT '性别 0:未知, 1:男 , 2:女',
  `stuBirth` date DEFAULT NULL COMMENT '出生年月',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `idcard` varchar(22) DEFAULT NULL COMMENT '身份证',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`studentId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='学生信息表';

-- ----------------------------
--  Records of `t_student`
-- ----------------------------
BEGIN;
INSERT INTO `t_student` VALUES ('G150100', '陈小明', '1', '1985-12-13', '13500000000', '430422000000000000', '2016-12-21 20:49:29', '2016-12-21 20:49:29'), ('G150101', '刘云', '1', '1980-12-13', '13500040000', '430422005000000000', '2016-12-21 20:49:29', '2016-12-21 20:49:29'), ('G150102', '彭春生', '1', '1983-10-13', '13530040000', '330422005003000000', '2016-12-21 20:49:29', '2016-12-21 20:52:15'), ('G150103', '刘芳', '2', '1988-09-13', '13530040000', '330422005003000000', '2016-12-21 20:49:29', '2016-12-21 20:52:42'), ('G150104', '李萍', '2', '1978-08-02', '17012349876', '31010210000000000X', '2016-12-21 20:54:03', '2016-12-21 20:54:11');
COMMIT;

-- ----------------------------
--  Table structure for `t_term`
-- ----------------------------
DROP TABLE IF EXISTS `t_term`;
CREATE TABLE `t_term` (
  `termId` varchar(20) NOT NULL DEFAULT '' COMMENT '学年编号',
  `termName` varchar(50) DEFAULT NULL COMMENT '学年名称',
  `termNotes` varchar(200) DEFAULT NULL COMMENT '备注',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `createUser` varchar(20) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`termId`),
  KEY `idx_term_id` (`termId`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='学年管理';

-- ----------------------------
--  Records of `t_term`
-- ----------------------------
BEGIN;
INSERT INTO `t_term` VALUES ('T00001', '2015-2016第一学期', '2015-2016第一学期', '2016-12-21 20:45:09', 'admin(默认管理员)'), ('T00002', '2015-2016第二学期', '2015-2016第二学期', '2016-12-21 20:45:30', 'admin(默认管理员)'), ('T00003', '2016-2017第一学期', '2016-2017第一学期', '2016-12-21 20:45:53', 'admin(默认管理员)'), ('T00004', '2016-2017第二学期', '2016-2017第二学期', '2016-12-21 20:46:07', 'admin(默认管理员)');
COMMIT;

-- ----------------------------
--  Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '账号ID',
  `username` varchar(255) NOT NULL DEFAULT '' COMMENT '账号名',
  `realname` varchar(50) NOT NULL COMMENT '真实姓名',
  `password` varchar(255) NOT NULL,
  `user_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户类型,0:普通用户,1:管理员',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `lastloginip` varchar(20) DEFAULT NULL COMMENT '最后登录IP',
  `lastlogin_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`,`username`),
  KEY `idx_ username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='账号表';

-- ----------------------------
--  Records of `t_user`
-- ----------------------------
BEGIN;
INSERT INTO `t_user` VALUES ('1', 'admin', '默认管理员', 'c3284d0f94606de1fd2af172aba15bf3', '1', '2016-11-26 21:47:26', '127.0.0.1', '2016-12-21 20:42:43');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
