/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : cloudms

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 30/09/2020 10:43:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cloud_dept
-- ----------------------------
DROP TABLE IF EXISTS `cloud_dept`;
CREATE TABLE `cloud_dept`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `short_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '简称',
  `org_id` bigint(0) NULL DEFAULT NULL COMMENT '组织',
  `parent_id` bigint(0) NULL DEFAULT NULL COMMENT '父id',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话',
  `fax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '传真',
  `autocode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '层次编号',
  `extend_field1` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extend_field2` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extend_field3` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extend_field4` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extend_field5` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extend_field6` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extend_field7` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extend_field8` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sortcode` int(0) NULL DEFAULT NULL COMMENT '排序码',
  `description` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `enabled` tinyint(0) NULL DEFAULT NULL COMMENT '有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cloud_dept
-- ----------------------------
INSERT INTO `cloud_dept` VALUES (1, 'zuzhi', '组织部', '组织部', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `cloud_dept` VALUES (2, 'meigong', '美工组', '美工组', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for cloud_module
-- ----------------------------
DROP TABLE IF EXISTS `cloud_module`;
CREATE TABLE `cloud_module`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `parent_id` bigint(0) NULL DEFAULT NULL COMMENT '父id',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编号',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `hide_children_in_menu` int(0) NULL DEFAULT NULL COMMENT '是否强制隐藏子菜单',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件',
  `redirect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '重定向URL',
  `parameter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数',
  `viewable` int(0) NULL DEFAULT NULL COMMENT '是否显示',
  `org_id` bigint(0) NULL DEFAULT NULL COMMENT '组织',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问地址',
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标地址',
  `icon_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标样式',
  `extend_field1` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extend_field2` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extend_field3` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extend_field4` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extend_field5` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extend_field6` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extend_field7` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extend_field8` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sortcode` int(0) NULL DEFAULT NULL COMMENT '排序码',
  `description` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `enabled` tinyint(0) NULL DEFAULT NULL COMMENT '有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cloud_module
-- ----------------------------
INSERT INTO `cloud_module` VALUES (3, NULL, 'zhangsan', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for cloud_org
-- ----------------------------
DROP TABLE IF EXISTS `cloud_org`;
CREATE TABLE `cloud_org`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `short_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '简称',
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类',
  `parent_id` bigint(0) NULL DEFAULT NULL,
  `autocode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '层次编号',
  `module_org_id` bigint(0) NULL DEFAULT NULL COMMENT '模块组织',
  `parameter_org_id` bigint(0) NULL DEFAULT NULL COMMENT '参数组织',
  `items_org_id` bigint(0) NULL DEFAULT NULL COMMENT '编码组织',
  `extend_field1` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extend_field2` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extend_field3` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extend_field4` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extend_field5` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extend_field6` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extend_field7` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extend_field8` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sortcode` int(0) NULL DEFAULT NULL COMMENT '排序码',
  `description` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `enabled` tinyint(0) NULL DEFAULT NULL COMMENT '有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cloud_org
-- ----------------------------
INSERT INTO `cloud_org` VALUES (1, '001', '青岛市', '青岛', NULL, 0, '001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `cloud_org` VALUES (2, '001001', '城阳区', '城阳', NULL, 1, '001001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for cloud_permission_module
-- ----------------------------
DROP TABLE IF EXISTS `cloud_permission_module`;
CREATE TABLE `cloud_permission_module`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `user_mode` tinyint(1) NULL DEFAULT NULL COMMENT '是否是用户',
  `resource_id` bigint(0) NULL DEFAULT NULL COMMENT '角色人员ID',
  `module_id` bigint(0) NULL DEFAULT NULL COMMENT '模块ID',
  `sortcode` int(0) NULL DEFAULT NULL COMMENT '排序码',
  `description` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `enabled` tinyint(0) NULL DEFAULT NULL COMMENT '有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cloud_permission_module
-- ----------------------------
INSERT INTO `cloud_permission_module` VALUES (3, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for cloud_role
-- ----------------------------
DROP TABLE IF EXISTS `cloud_role`;
CREATE TABLE `cloud_role`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `org_id` bigint(0) NULL DEFAULT NULL COMMENT '组织',
  `parent_id` bigint(0) NULL DEFAULT NULL COMMENT '父id',
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色分类',
  `visible` tinyint(1) NULL DEFAULT NULL COMMENT '是否显示',
  `autocode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '层次编号',
  `extend_field1` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extend_field2` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extend_field3` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extend_field4` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extend_field5` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extend_field6` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extend_field7` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extend_field8` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sortcode` int(0) NULL DEFAULT NULL COMMENT '排序码',
  `description` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `enabled` tinyint(0) NULL DEFAULT NULL COMMENT '有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cloud_role
-- ----------------------------
INSERT INTO `cloud_role` VALUES (1, 'admin', '管理员', 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `cloud_role` VALUES (2, 'charge', '收费员', 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for cloud_user
-- ----------------------------
DROP TABLE IF EXISTS `cloud_user`;
CREATE TABLE `cloud_user`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `org_id` bigint(0) NULL DEFAULT NULL COMMENT '组织ID',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '部门ID',
  `work_org_id` bigint(0) NULL DEFAULT NULL COMMENT '工作组织',
  `work_dept_id` bigint(0) NULL DEFAULT NULL COMMENT '工作部门',
  `login_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `change_pwd_date` datetime(0) NULL DEFAULT NULL COMMENT '最后修改密码日期',
  `last_visit_date` datetime(0) NULL DEFAULT NULL COMMENT '最后访问时间',
  `pwd_error_count` int(0) NULL DEFAULT NULL COMMENT '密码连续错误次数',
  `duty` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '岗位',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职称',
  `office_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '办公地址',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话',
  `dimissiondate` datetime(0) NULL DEFAULT NULL COMMENT '离职日期',
  `admin_level` int(0) NULL DEFAULT NULL COMMENT '管理员级别',
  `extend_field1` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extend_field2` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extend_field3` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extend_field4` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extend_field5` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extend_field6` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extend_field7` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extend_field8` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sortcode` int(0) NULL DEFAULT NULL COMMENT '排序码',
  `description` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `enabled` tinyint(1) NULL DEFAULT NULL COMMENT '有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cloud_user
-- ----------------------------
INSERT INTO `cloud_user` VALUES (1, 'zhangsan', '张三', 1, 1, 1, 1, 'zhangsan', '123', '2020-03-25 21:41:08', '2020-03-25 21:40:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for cloud_user_role
-- ----------------------------
DROP TABLE IF EXISTS `cloud_user_role`;
CREATE TABLE `cloud_user_role`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `user_id` bigint(0) NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(0) NULL DEFAULT NULL COMMENT '角色ID',
  `sortcode` int(0) NULL DEFAULT NULL COMMENT '排序码',
  `description` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `enabled` tinyint(0) NULL DEFAULT NULL COMMENT '有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cloud_user_role
-- ----------------------------
INSERT INTO `cloud_user_role` VALUES (1, 1, 1, NULL, NULL, 0);

-- ----------------------------
-- Table structure for worker_node_entity
-- ----------------------------
DROP TABLE IF EXISTS `worker_node_entity`;
CREATE TABLE `worker_node_entity`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'auto increment id',
  `host_name` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'host name',
  `port` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'port',
  `type` int(0) NOT NULL COMMENT 'node type: ACTUAL or CONTAINER',
  `launch_date` date NOT NULL COMMENT 'launch date',
  `modified` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'modified time',
  `created` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'created time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 578 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of worker_node_entity
-- ----------------------------
INSERT INTO `worker_node_entity` VALUES (425, '172.20.191.230', '1583566276311-15204', 2, '2020-03-07', '2020-03-07 15:31:16', '2020-03-07 15:31:16');
INSERT INTO `worker_node_entity` VALUES (426, '172.20.191.230', '1583566276423-80090', 2, '2020-03-07', '2020-03-07 15:31:16', '2020-03-07 15:31:16');
INSERT INTO `worker_node_entity` VALUES (427, '172.20.191.230', '1583566306404-85236', 2, '2020-03-07', '2020-03-07 15:31:46', '2020-03-07 15:31:46');
INSERT INTO `worker_node_entity` VALUES (428, '172.20.191.230', '1583566306654-21766', 2, '2020-03-07', '2020-03-07 15:31:46', '2020-03-07 15:31:46');
INSERT INTO `worker_node_entity` VALUES (429, '172.20.191.230', '1583571120935-80949', 2, '2020-03-07', '2020-03-07 16:52:00', '2020-03-07 16:52:00');
INSERT INTO `worker_node_entity` VALUES (430, '172.20.191.230', '1583571121334-6554', 2, '2020-03-07', '2020-03-07 16:52:01', '2020-03-07 16:52:01');
INSERT INTO `worker_node_entity` VALUES (431, '172.20.191.230', '1583571430918-40002', 2, '2020-03-07', '2020-03-07 16:57:10', '2020-03-07 16:57:10');
INSERT INTO `worker_node_entity` VALUES (432, '172.20.191.230', '1583571431303-52813', 2, '2020-03-07', '2020-03-07 16:57:11', '2020-03-07 16:57:11');
INSERT INTO `worker_node_entity` VALUES (433, '172.20.191.230', '1583571576949-43168', 2, '2020-03-07', '2020-03-07 16:59:37', '2020-03-07 16:59:37');
INSERT INTO `worker_node_entity` VALUES (434, '172.20.191.230', '1583571577619-84845', 2, '2020-03-07', '2020-03-07 16:59:37', '2020-03-07 16:59:37');
INSERT INTO `worker_node_entity` VALUES (435, '172.20.191.230', '1583572065579-340', 2, '2020-03-07', '2020-03-07 17:07:45', '2020-03-07 17:07:45');
INSERT INTO `worker_node_entity` VALUES (436, '172.20.191.230', '1583572066182-26466', 2, '2020-03-07', '2020-03-07 17:07:46', '2020-03-07 17:07:46');
INSERT INTO `worker_node_entity` VALUES (437, '172.20.191.230', '1583572593381-21851', 2, '2020-03-07', '2020-03-07 17:16:33', '2020-03-07 17:16:33');
INSERT INTO `worker_node_entity` VALUES (438, '172.20.191.230', '1583572593825-15947', 2, '2020-03-07', '2020-03-07 17:16:33', '2020-03-07 17:16:33');
INSERT INTO `worker_node_entity` VALUES (439, '172.20.191.230', '1583572733582-25682', 2, '2020-03-07', '2020-03-07 17:18:53', '2020-03-07 17:18:53');
INSERT INTO `worker_node_entity` VALUES (440, '172.20.191.230', '1583572733978-86247', 2, '2020-03-07', '2020-03-07 17:18:53', '2020-03-07 17:18:53');
INSERT INTO `worker_node_entity` VALUES (441, '172.20.191.230', '1583572770867-80492', 2, '2020-03-07', '2020-03-07 17:19:30', '2020-03-07 17:19:30');
INSERT INTO `worker_node_entity` VALUES (442, '172.20.191.230', '1583572771287-45117', 2, '2020-03-07', '2020-03-07 17:19:31', '2020-03-07 17:19:31');
INSERT INTO `worker_node_entity` VALUES (443, '172.20.191.230', '1583573395282-74777', 2, '2020-03-07', '2020-03-07 17:29:55', '2020-03-07 17:29:55');
INSERT INTO `worker_node_entity` VALUES (444, '172.20.191.230', '1583573395449-64080', 2, '2020-03-07', '2020-03-07 17:29:55', '2020-03-07 17:29:55');
INSERT INTO `worker_node_entity` VALUES (445, '172.20.191.230', '1583573435614-72565', 2, '2020-03-07', '2020-03-07 17:30:35', '2020-03-07 17:30:35');
INSERT INTO `worker_node_entity` VALUES (446, '172.20.191.230', '1583573435761-19115', 2, '2020-03-07', '2020-03-07 17:30:35', '2020-03-07 17:30:35');
INSERT INTO `worker_node_entity` VALUES (447, '172.20.191.230', '1583573597072-12303', 2, '2020-03-07', '2020-03-07 17:33:17', '2020-03-07 17:33:17');
INSERT INTO `worker_node_entity` VALUES (448, '172.20.191.230', '1583573597217-83494', 2, '2020-03-07', '2020-03-07 17:33:17', '2020-03-07 17:33:17');
INSERT INTO `worker_node_entity` VALUES (449, '172.20.191.230', '1583573707486-16815', 2, '2020-03-07', '2020-03-07 17:35:07', '2020-03-07 17:35:07');
INSERT INTO `worker_node_entity` VALUES (450, '172.20.191.230', '1583573707613-41384', 2, '2020-03-07', '2020-03-07 17:35:07', '2020-03-07 17:35:07');
INSERT INTO `worker_node_entity` VALUES (451, '192.168.3.6', '1583669539040-81374', 2, '2020-03-08', '2020-03-08 20:12:19', '2020-03-08 20:12:19');
INSERT INTO `worker_node_entity` VALUES (452, '192.168.3.6', '1583669606526-30010', 2, '2020-03-08', '2020-03-08 20:13:26', '2020-03-08 20:13:26');
INSERT INTO `worker_node_entity` VALUES (453, '192.168.3.6', '1583669803363-49055', 2, '2020-03-08', '2020-03-08 20:16:43', '2020-03-08 20:16:43');
INSERT INTO `worker_node_entity` VALUES (454, '192.168.3.6', '1583670167581-10628', 2, '2020-03-08', '2020-03-08 20:22:47', '2020-03-08 20:22:47');
INSERT INTO `worker_node_entity` VALUES (455, '192.168.3.6', '1583670281153-19756', 2, '2020-03-08', '2020-03-08 20:24:41', '2020-03-08 20:24:41');
INSERT INTO `worker_node_entity` VALUES (456, '192.168.3.6', '1583670523526-76714', 2, '2020-03-08', '2020-03-08 20:28:43', '2020-03-08 20:28:43');
INSERT INTO `worker_node_entity` VALUES (457, '192.168.3.6', '1583670523612-68876', 2, '2020-03-08', '2020-03-08 20:28:43', '2020-03-08 20:28:43');
INSERT INTO `worker_node_entity` VALUES (458, '192.168.3.6', '1583670562131-90727', 2, '2020-03-08', '2020-03-08 20:29:22', '2020-03-08 20:29:22');
INSERT INTO `worker_node_entity` VALUES (459, '192.168.3.6', '1583670562342-86560', 2, '2020-03-08', '2020-03-08 20:29:22', '2020-03-08 20:29:22');
INSERT INTO `worker_node_entity` VALUES (460, '192.168.3.6', '1583670591343-12573', 2, '2020-03-08', '2020-03-08 20:29:51', '2020-03-08 20:29:51');
INSERT INTO `worker_node_entity` VALUES (461, '192.168.3.6', '1583670645027-2328', 2, '2020-03-08', '2020-03-08 20:30:45', '2020-03-08 20:30:45');
INSERT INTO `worker_node_entity` VALUES (462, '192.168.3.6', '1583670852176-65546', 2, '2020-03-08', '2020-03-08 20:34:12', '2020-03-08 20:34:12');
INSERT INTO `worker_node_entity` VALUES (463, '192.168.3.6', '1583670865078-27601', 2, '2020-03-08', '2020-03-08 20:34:25', '2020-03-08 20:34:25');
INSERT INTO `worker_node_entity` VALUES (464, '192.168.3.6', '1583670894791-33108', 2, '2020-03-08', '2020-03-08 20:34:54', '2020-03-08 20:34:54');
INSERT INTO `worker_node_entity` VALUES (465, '192.168.3.6', '1583670922557-66591', 2, '2020-03-08', '2020-03-08 20:35:22', '2020-03-08 20:35:22');
INSERT INTO `worker_node_entity` VALUES (466, '192.168.3.6', '1583672963287-2161', 2, '2020-03-08', '2020-03-08 21:09:23', '2020-03-08 21:09:23');
INSERT INTO `worker_node_entity` VALUES (467, '192.168.3.6', '1583673683023-12885', 2, '2020-03-08', '2020-03-08 21:21:23', '2020-03-08 21:21:23');
INSERT INTO `worker_node_entity` VALUES (468, '192.168.3.6', '1583674082479-58539', 2, '2020-03-08', '2020-03-08 21:28:02', '2020-03-08 21:28:02');
INSERT INTO `worker_node_entity` VALUES (469, '192.168.3.6', '1583674196696-4049', 2, '2020-03-08', '2020-03-08 21:29:56', '2020-03-08 21:29:56');
INSERT INTO `worker_node_entity` VALUES (470, '192.168.3.6', '1583674425860-86080', 2, '2020-03-08', '2020-03-08 21:33:45', '2020-03-08 21:33:45');
INSERT INTO `worker_node_entity` VALUES (471, '192.168.3.6', '1583674497804-62601', 2, '2020-03-08', '2020-03-08 21:34:57', '2020-03-08 21:34:57');
INSERT INTO `worker_node_entity` VALUES (472, '192.168.3.6', '1583674647453-44044', 2, '2020-03-08', '2020-03-08 21:37:27', '2020-03-08 21:37:27');
INSERT INTO `worker_node_entity` VALUES (473, '192.168.3.6', '1583674961440-89251', 2, '2020-03-08', '2020-03-08 21:42:41', '2020-03-08 21:42:41');
INSERT INTO `worker_node_entity` VALUES (474, '192.168.3.6', '1583713219882-96178', 2, '2020-03-08', '2020-03-09 08:20:19', '2020-03-09 08:20:19');
INSERT INTO `worker_node_entity` VALUES (475, '192.168.3.6', '1583714980658-20508', 2, '2020-03-08', '2020-03-09 08:49:40', '2020-03-09 08:49:40');
INSERT INTO `worker_node_entity` VALUES (476, '172.20.191.230', '1583717923413-35330', 2, '2020-03-08', '2020-03-09 09:38:43', '2020-03-09 09:38:43');
INSERT INTO `worker_node_entity` VALUES (477, '172.20.191.230', '1583718047447-7221', 2, '2020-03-08', '2020-03-09 09:40:47', '2020-03-09 09:40:47');
INSERT INTO `worker_node_entity` VALUES (478, '172.20.191.230', '1583718113121-13880', 2, '2020-03-08', '2020-03-09 09:41:53', '2020-03-09 09:41:53');
INSERT INTO `worker_node_entity` VALUES (479, '172.20.191.230', '1583718187546-61442', 2, '2020-03-08', '2020-03-09 09:43:07', '2020-03-09 09:43:07');
INSERT INTO `worker_node_entity` VALUES (480, '172.20.191.230', '1583718223512-96893', 2, '2020-03-08', '2020-03-09 09:43:43', '2020-03-09 09:43:43');
INSERT INTO `worker_node_entity` VALUES (481, '172.20.191.230', '1583718832973-34283', 2, '2020-03-08', '2020-03-09 09:53:52', '2020-03-09 09:53:52');
INSERT INTO `worker_node_entity` VALUES (482, '172.20.191.230', '1583718858443-64838', 2, '2020-03-08', '2020-03-09 09:54:18', '2020-03-09 09:54:18');
INSERT INTO `worker_node_entity` VALUES (483, '172.20.191.230', '1583718925935-52726', 2, '2020-03-08', '2020-03-09 09:55:26', '2020-03-09 09:55:26');
INSERT INTO `worker_node_entity` VALUES (484, '172.20.191.230', '1583719020661-42318', 2, '2020-03-08', '2020-03-09 09:57:00', '2020-03-09 09:57:00');
INSERT INTO `worker_node_entity` VALUES (485, '172.20.191.230', '1583725428367-77694', 2, '2020-03-08', '2020-03-09 11:43:48', '2020-03-09 11:43:48');
INSERT INTO `worker_node_entity` VALUES (486, '172.20.191.230', '1583725582376-26352', 2, '2020-03-08', '2020-03-09 11:46:22', '2020-03-09 11:46:22');
INSERT INTO `worker_node_entity` VALUES (487, '172.20.191.230', '1583725596069-40806', 2, '2020-03-08', '2020-03-09 11:46:36', '2020-03-09 11:46:36');
INSERT INTO `worker_node_entity` VALUES (488, '172.20.191.230', '1583732734519-34979', 2, '2020-03-09', '2020-03-09 13:45:34', '2020-03-09 13:45:34');
INSERT INTO `worker_node_entity` VALUES (489, '172.20.191.230', '1583733170317-29174', 2, '2020-03-09', '2020-03-09 13:52:50', '2020-03-09 13:52:50');
INSERT INTO `worker_node_entity` VALUES (490, '172.20.191.230', '1583734628810-60647', 2, '2020-03-09', '2020-03-09 14:17:08', '2020-03-09 14:17:08');
INSERT INTO `worker_node_entity` VALUES (491, '172.20.191.230', '1583735728311-29728', 2, '2020-03-09', '2020-03-09 14:35:28', '2020-03-09 14:35:28');
INSERT INTO `worker_node_entity` VALUES (492, '192.168.43.184', '1583737406609-37508', 2, '2020-03-09', '2020-03-09 15:03:26', '2020-03-09 15:03:26');
INSERT INTO `worker_node_entity` VALUES (493, '192.168.43.184', '1583738712598-98125', 2, '2020-03-09', '2020-03-09 15:25:12', '2020-03-09 15:25:12');
INSERT INTO `worker_node_entity` VALUES (494, '192.168.43.184', '1583738869390-61503', 2, '2020-03-09', '2020-03-09 15:27:49', '2020-03-09 15:27:49');
INSERT INTO `worker_node_entity` VALUES (495, '192.168.43.184', '1583739127558-23072', 2, '2020-03-09', '2020-03-09 15:32:07', '2020-03-09 15:32:07');
INSERT INTO `worker_node_entity` VALUES (496, '192.168.43.184', '1583739529679-21182', 2, '2020-03-09', '2020-03-09 15:38:49', '2020-03-09 15:38:49');
INSERT INTO `worker_node_entity` VALUES (497, '192.168.43.184', '1583739682891-65854', 2, '2020-03-09', '2020-03-09 15:41:22', '2020-03-09 15:41:22');
INSERT INTO `worker_node_entity` VALUES (498, '192.168.43.184', '1583739990946-56952', 2, '2020-03-09', '2020-03-09 15:46:31', '2020-03-09 15:46:31');
INSERT INTO `worker_node_entity` VALUES (499, '192.168.43.184', '1583740078763-47330', 2, '2020-03-09', '2020-03-09 15:47:58', '2020-03-09 15:47:58');
INSERT INTO `worker_node_entity` VALUES (500, '192.168.43.184', '1583740277002-13274', 2, '2020-03-09', '2020-03-09 15:51:17', '2020-03-09 15:51:17');
INSERT INTO `worker_node_entity` VALUES (501, '192.168.43.184', '1583740396869-5785', 2, '2020-03-09', '2020-03-09 15:53:17', '2020-03-09 15:53:17');
INSERT INTO `worker_node_entity` VALUES (502, '192.168.43.184', '1583745179579-93926', 2, '2020-03-09', '2020-03-09 17:12:59', '2020-03-09 17:12:59');
INSERT INTO `worker_node_entity` VALUES (503, '192.168.43.184', '1583745264543-36743', 2, '2020-03-09', '2020-03-09 17:14:24', '2020-03-09 17:14:24');
INSERT INTO `worker_node_entity` VALUES (504, '192.168.43.184', '1583746782178-47014', 2, '2020-03-09', '2020-03-09 17:39:42', '2020-03-09 17:39:42');
INSERT INTO `worker_node_entity` VALUES (505, '192.168.43.184', '1583747541756-94417', 2, '2020-03-09', '2020-03-09 17:52:21', '2020-03-09 17:52:21');
INSERT INTO `worker_node_entity` VALUES (506, '192.168.43.184', '1583747812838-61505', 2, '2020-03-09', '2020-03-09 17:56:52', '2020-03-09 17:56:52');
INSERT INTO `worker_node_entity` VALUES (507, '192.168.43.184', '1583747895361-47967', 2, '2020-03-09', '2020-03-09 17:58:15', '2020-03-09 17:58:15');
INSERT INTO `worker_node_entity` VALUES (508, '2409:893c:f50:432d:3c54:55fc:7959:727%en0', '1583818967490-29433', 2, '2020-03-10', '2020-03-10 13:42:47', '2020-03-10 13:42:47');
INSERT INTO `worker_node_entity` VALUES (509, '2409:893c:f50:432d:3c54:55fc:7959:727%en0', '1583819096180-15837', 2, '2020-03-10', '2020-03-10 13:44:56', '2020-03-10 13:44:56');
INSERT INTO `worker_node_entity` VALUES (510, '2409:893c:f50:432d:3c54:55fc:7959:727%en0', '1583819156316-33411', 2, '2020-03-10', '2020-03-10 13:45:56', '2020-03-10 13:45:56');
INSERT INTO `worker_node_entity` VALUES (511, '2409:893c:f50:432d:3c54:55fc:7959:727%en0', '1583819436580-51505', 2, '2020-03-10', '2020-03-10 13:50:36', '2020-03-10 13:50:36');
INSERT INTO `worker_node_entity` VALUES (512, '2409:893c:f50:432d:3c54:55fc:7959:727%en0', '1583819451485-91138', 2, '2020-03-10', '2020-03-10 13:50:51', '2020-03-10 13:50:51');
INSERT INTO `worker_node_entity` VALUES (513, '2409:893c:f50:432d:3c54:55fc:7959:727%en0', '1583819493279-50424', 2, '2020-03-10', '2020-03-10 13:51:33', '2020-03-10 13:51:33');
INSERT INTO `worker_node_entity` VALUES (514, '2409:893c:f50:432d:3c54:55fc:7959:727%en0', '1583819528802-64074', 2, '2020-03-10', '2020-03-10 13:52:08', '2020-03-10 13:52:08');
INSERT INTO `worker_node_entity` VALUES (515, '2409:893c:f50:432d:3c54:55fc:7959:727%en0', '1583819698031-7075', 2, '2020-03-10', '2020-03-10 13:54:58', '2020-03-10 13:54:58');
INSERT INTO `worker_node_entity` VALUES (516, '2409:893c:f50:432d:3c54:55fc:7959:727%en0', '1583820258644-6147', 2, '2020-03-10', '2020-03-10 14:04:18', '2020-03-10 14:04:18');
INSERT INTO `worker_node_entity` VALUES (517, '2409:893c:f50:432d:3c54:55fc:7959:727%en0', '1583821214504-87806', 2, '2020-03-10', '2020-03-10 14:20:14', '2020-03-10 14:20:14');
INSERT INTO `worker_node_entity` VALUES (518, '2409:893c:f50:432d:3c54:55fc:7959:727%en0', '1583821384712-30071', 2, '2020-03-10', '2020-03-10 14:23:04', '2020-03-10 14:23:04');
INSERT INTO `worker_node_entity` VALUES (519, '2409:893c:f50:432d:3c54:55fc:7959:727%en0', '1583821591127-76521', 2, '2020-03-10', '2020-03-10 14:26:31', '2020-03-10 14:26:31');
INSERT INTO `worker_node_entity` VALUES (520, '2409:893c:f50:432d:3c54:55fc:7959:727%en0', '1583821863300-72038', 2, '2020-03-10', '2020-03-10 14:31:03', '2020-03-10 14:31:03');
INSERT INTO `worker_node_entity` VALUES (521, '2409:893c:f50:432d:3c54:55fc:7959:727%en0', '1583821970132-19914', 2, '2020-03-10', '2020-03-10 14:32:50', '2020-03-10 14:32:50');
INSERT INTO `worker_node_entity` VALUES (522, '2409:893c:f50:432d:3c54:55fc:7959:727%en0', '1583822455666-72745', 2, '2020-03-10', '2020-03-10 14:40:55', '2020-03-10 14:40:55');
INSERT INTO `worker_node_entity` VALUES (523, '2409:893c:f50:432d:3c54:55fc:7959:727%en0', '1583822800941-17647', 2, '2020-03-10', '2020-03-10 14:46:40', '2020-03-10 14:46:40');
INSERT INTO `worker_node_entity` VALUES (524, '2409:893c:f50:432d:3c54:55fc:7959:727%en0', '1583822891135-19060', 2, '2020-03-10', '2020-03-10 14:48:11', '2020-03-10 14:48:11');
INSERT INTO `worker_node_entity` VALUES (525, '2409:893c:f50:432d:3c54:55fc:7959:727%en0', '1583822949291-51819', 2, '2020-03-10', '2020-03-10 14:49:09', '2020-03-10 14:49:09');
INSERT INTO `worker_node_entity` VALUES (526, '172.20.167.186', '1583846159331-91794', 2, '2020-03-10', '2020-03-10 21:15:59', '2020-03-10 21:15:59');
INSERT INTO `worker_node_entity` VALUES (527, '172.20.167.186', '1583846976611-60203', 2, '2020-03-10', '2020-03-10 21:29:36', '2020-03-10 21:29:36');
INSERT INTO `worker_node_entity` VALUES (528, '172.20.167.186', '1583850512229-18869', 2, '2020-03-10', '2020-03-10 22:28:32', '2020-03-10 22:28:32');
INSERT INTO `worker_node_entity` VALUES (529, '172.20.167.186', '1583850653954-52195', 2, '2020-03-10', '2020-03-10 22:30:53', '2020-03-10 22:30:53');
INSERT INTO `worker_node_entity` VALUES (530, '172.20.191.230', '1583972406893-80163', 2, '2020-03-11', '2020-03-12 08:20:06', '2020-03-12 08:20:06');
INSERT INTO `worker_node_entity` VALUES (531, '172.20.191.230', '1585183111439-30397', 2, '2020-03-25', '2020-03-26 08:38:31', '2020-03-26 08:38:31');
INSERT INTO `worker_node_entity` VALUES (532, '172.20.191.230', '1585183271540-20485', 2, '2020-03-25', '2020-03-26 08:41:11', '2020-03-26 08:41:11');
INSERT INTO `worker_node_entity` VALUES (533, '172.20.191.230', '1585183396453-52556', 2, '2020-03-25', '2020-03-26 08:43:16', '2020-03-26 08:43:16');
INSERT INTO `worker_node_entity` VALUES (534, '172.20.191.230', '1585183538610-10330', 2, '2020-03-25', '2020-03-26 08:45:38', '2020-03-26 08:45:38');
INSERT INTO `worker_node_entity` VALUES (535, '172.20.191.230', '1585183628734-79002', 2, '2020-03-25', '2020-03-26 08:47:08', '2020-03-26 08:47:08');
INSERT INTO `worker_node_entity` VALUES (536, '172.20.191.230', '1585184854132-24310', 2, '2020-03-25', '2020-03-26 09:07:34', '2020-03-26 09:07:34');
INSERT INTO `worker_node_entity` VALUES (537, '172.20.191.230', '1585184882261-68622', 2, '2020-03-25', '2020-03-26 09:08:02', '2020-03-26 09:08:02');
INSERT INTO `worker_node_entity` VALUES (538, '172.20.191.230', '1585185520954-36751', 2, '2020-03-25', '2020-03-26 09:18:41', '2020-03-26 09:18:41');
INSERT INTO `worker_node_entity` VALUES (539, '172.20.191.230', '1585185659627-47736', 2, '2020-03-25', '2020-03-26 09:20:59', '2020-03-26 09:20:59');
INSERT INTO `worker_node_entity` VALUES (540, '172.20.191.230', '1585185685763-66368', 2, '2020-03-25', '2020-03-26 09:21:25', '2020-03-26 09:21:25');
INSERT INTO `worker_node_entity` VALUES (541, '172.20.191.230', '1585185724139-57610', 2, '2020-03-25', '2020-03-26 09:22:04', '2020-03-26 09:22:04');
INSERT INTO `worker_node_entity` VALUES (542, '172.20.191.230', '1585185760054-72547', 2, '2020-03-25', '2020-03-26 09:22:40', '2020-03-26 09:22:40');
INSERT INTO `worker_node_entity` VALUES (543, '172.20.191.230', '1585185858440-8778', 2, '2020-03-25', '2020-03-26 09:24:18', '2020-03-26 09:24:18');
INSERT INTO `worker_node_entity` VALUES (544, '172.20.191.230', '1585185886528-95675', 2, '2020-03-25', '2020-03-26 09:24:46', '2020-03-26 09:24:46');
INSERT INTO `worker_node_entity` VALUES (545, '172.20.191.230', '1585186089846-91400', 2, '2020-03-25', '2020-03-26 09:28:09', '2020-03-26 09:28:09');
INSERT INTO `worker_node_entity` VALUES (546, '172.20.191.230', '1585186150694-79177', 2, '2020-03-25', '2020-03-26 09:29:10', '2020-03-26 09:29:10');
INSERT INTO `worker_node_entity` VALUES (547, '172.20.191.230', '1585186316158-8073', 2, '2020-03-25', '2020-03-26 09:31:56', '2020-03-26 09:31:56');
INSERT INTO `worker_node_entity` VALUES (548, '172.20.191.230', '1585186404175-35160', 2, '2020-03-25', '2020-03-26 09:33:24', '2020-03-26 09:33:24');
INSERT INTO `worker_node_entity` VALUES (549, '172.20.191.230', '1585186955914-12894', 2, '2020-03-25', '2020-03-26 09:42:35', '2020-03-26 09:42:35');
INSERT INTO `worker_node_entity` VALUES (550, '172.20.191.230', '1585188218490-75574', 2, '2020-03-25', '2020-03-26 10:03:38', '2020-03-26 10:03:38');
INSERT INTO `worker_node_entity` VALUES (551, '172.20.191.230', '1585188937422-86466', 2, '2020-03-25', '2020-03-26 10:15:37', '2020-03-26 10:15:37');
INSERT INTO `worker_node_entity` VALUES (552, '172.20.191.230', '1585188964194-61334', 2, '2020-03-25', '2020-03-26 10:16:04', '2020-03-26 10:16:04');
INSERT INTO `worker_node_entity` VALUES (553, '172.20.191.230', '1585192519162-18109', 2, '2020-03-25', '2020-03-26 11:15:19', '2020-03-26 11:15:19');
INSERT INTO `worker_node_entity` VALUES (554, '172.20.191.230', '1585192782181-25487', 2, '2020-03-25', '2020-03-26 11:19:42', '2020-03-26 11:19:42');
INSERT INTO `worker_node_entity` VALUES (555, '172.20.191.230', '1585192856068-77392', 2, '2020-03-25', '2020-03-26 11:20:56', '2020-03-26 11:20:56');
INSERT INTO `worker_node_entity` VALUES (556, '172.20.191.230', '1585192896500-27368', 2, '2020-03-25', '2020-03-26 11:21:36', '2020-03-26 11:21:36');
INSERT INTO `worker_node_entity` VALUES (557, '172.20.191.230', '1585193050786-31910', 2, '2020-03-25', '2020-03-26 11:24:10', '2020-03-26 11:24:10');
INSERT INTO `worker_node_entity` VALUES (558, '172.20.191.230', '1585193402400-75394', 2, '2020-03-25', '2020-03-26 11:30:02', '2020-03-26 11:30:02');
INSERT INTO `worker_node_entity` VALUES (559, '172.20.191.230', '1585193474342-21032', 2, '2020-03-25', '2020-03-26 11:31:14', '2020-03-26 11:31:14');
INSERT INTO `worker_node_entity` VALUES (560, '172.20.191.230', '1585193512640-8175', 2, '2020-03-25', '2020-03-26 11:31:52', '2020-03-26 11:31:52');
INSERT INTO `worker_node_entity` VALUES (561, '172.20.191.230', '1585193550131-62185', 2, '2020-03-25', '2020-03-26 11:32:30', '2020-03-26 11:32:30');
INSERT INTO `worker_node_entity` VALUES (562, '172.20.191.230', '1585193588324-35622', 2, '2020-03-25', '2020-03-26 11:33:08', '2020-03-26 11:33:08');
INSERT INTO `worker_node_entity` VALUES (563, '172.20.191.230', '1585194018010-84320', 2, '2020-03-25', '2020-03-26 11:40:18', '2020-03-26 11:40:18');
INSERT INTO `worker_node_entity` VALUES (564, '172.20.191.230', '1585194219161-89391', 2, '2020-03-25', '2020-03-26 11:43:39', '2020-03-26 11:43:39');
INSERT INTO `worker_node_entity` VALUES (565, '172.20.93.71', '1585559205158-70001', 2, '2020-03-30', '2020-03-30 17:02:34', '2020-03-30 17:02:34');
INSERT INTO `worker_node_entity` VALUES (566, '172.20.93.71', '1585559328293-28330', 2, '2020-03-30', '2020-03-30 17:04:37', '2020-03-30 17:04:37');
INSERT INTO `worker_node_entity` VALUES (567, '172.20.93.71', '1585573660129-85458', 2, '2020-03-30', '2020-03-30 21:03:29', '2020-03-30 21:03:29');
INSERT INTO `worker_node_entity` VALUES (568, '172.20.93.71', '1585573812593-35534', 2, '2020-03-30', '2020-03-30 21:06:01', '2020-03-30 21:06:01');
INSERT INTO `worker_node_entity` VALUES (569, '172.20.93.71', '1585574401121-54862', 2, '2020-03-30', '2020-03-30 21:15:50', '2020-03-30 21:15:50');
INSERT INTO `worker_node_entity` VALUES (570, '172.20.93.71', '1585574442205-13766', 2, '2020-03-30', '2020-03-30 21:16:31', '2020-03-30 21:16:31');
INSERT INTO `worker_node_entity` VALUES (571, '172.20.93.71', '1585574583816-40806', 2, '2020-03-30', '2020-03-30 21:18:53', '2020-03-30 21:18:53');
INSERT INTO `worker_node_entity` VALUES (572, '172.20.93.71', '1585574616067-40056', 2, '2020-03-30', '2020-03-30 21:19:25', '2020-03-30 21:19:25');
INSERT INTO `worker_node_entity` VALUES (573, '172.20.93.71', '1585574694438-85773', 2, '2020-03-30', '2020-03-30 21:20:43', '2020-03-30 21:20:43');
INSERT INTO `worker_node_entity` VALUES (574, '172.20.93.71', '1585574800214-53562', 2, '2020-03-30', '2020-03-30 21:22:29', '2020-03-30 21:22:29');
INSERT INTO `worker_node_entity` VALUES (575, '172.20.93.71', '1585574911164-40730', 2, '2020-03-30', '2020-03-30 21:24:20', '2020-03-30 21:24:20');
INSERT INTO `worker_node_entity` VALUES (576, '172.20.93.71', '1585575625896-85141', 2, '2020-03-30', '2020-03-30 21:36:15', '2020-03-30 21:36:15');
INSERT INTO `worker_node_entity` VALUES (577, '172.20.191.230', '1601363898173-11344', 2, '2020-09-29', '2020-09-29 15:18:18', '2020-09-29 15:18:18');
INSERT INTO `worker_node_entity` VALUES (578, '172.20.93.71', '1601432322438-56019', 2, '2020-09-30', '2020-09-30 10:18:42', '2020-09-30 10:18:42');

SET FOREIGN_KEY_CHECKS = 1;
