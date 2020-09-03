/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : ordering

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 07/07/2020 19:48:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类别名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '热菜');
INSERT INTO `category` VALUES (2, '凉菜');
INSERT INTO `category` VALUES (3, '饮料');
INSERT INTO `category` VALUES (4, '海鲜');
INSERT INTO `category` VALUES (5, '炖菜');
INSERT INTO `category` VALUES (11, 'hah');
INSERT INTO `category` VALUES (12, 'hah');
INSERT INTO `category` VALUES (13, 'hah');
INSERT INTO `category` VALUES (14, 'hah');
INSERT INTO `category` VALUES (15, 'hah');

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(11) NOT NULL COMMENT '菜品所属分类id',
  `dishName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜名',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜品描述',
  `images` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜品图片',
  `price` int(5) UNSIGNED NOT NULL COMMENT '价钱',
  `discountPrice` int(5) NULL DEFAULT NULL COMMENT '折扣后的价钱',
  `saleable` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否上架，0正在售卖，1已售完',
  `del` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否删除，0删除，1未删除',
  `discount` tinyint(4) NOT NULL COMMENT '是否打折,0不打折，1打折',
  `discountType` float(3, 1) UNSIGNED ZEROFILL NULL DEFAULT 10.0 COMMENT '折扣类型，比如打8折',
  `count` int(11) NULL DEFAULT NULL COMMENT '菜品数量',
  `remainingCount` int(11) NULL DEFAULT NULL COMMENT '剩余数量',
  `orderCount` int(10) NULL DEFAULT 0 COMMENT '当前商品的订单数量',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `lastUpdateTime` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES (1, 1, '麻辣水煮鱼', '特别好吃', 'http://localhost:8080/img/hongshaopaigu.jpg', 50, 35, 1, 1, 1, 7.0, 50, 48, 2, '2020-07-01 23:14:15', '2020-07-07 07:54:51');
INSERT INTO `food` VALUES (2, 1, '红烧排骨1', '鲜美嫩', 'http://localhost:8080/img/hongshaopaigu.jpg', 60, 51, 1, 0, 0, 10.0, 50, 50, 0, '2020-06-06 17:22:09', '2020-07-06 10:48:56');
INSERT INTO `food` VALUES (3, 3, '奶茶', '好喝', 'http://localhost:8080/img/hongshaopaigu.jpg', 60, 51, 1, 1, 1, 8.0, 50, 49, 1, '2020-06-06 17:22:09', '2020-06-06 17:22:09');
INSERT INTO `food` VALUES (4, 3, '奶茶', '好喝', 'http://localhost:8080/img/hongshaopaigu.jpg', 60, 51, 1, 1, 1, 8.0, 50, 50, 0, '2020-06-06 17:22:09', '2020-06-06 17:22:09');
INSERT INTO `food` VALUES (5, 3, '奶茶', '好喝', 'http://localhost:8080/img/hongshaopaigu.jpg', 60, 51, 1, 1, 1, 8.0, 50, 50, 0, '2020-06-06 17:22:09', '2020-06-06 17:22:09');
INSERT INTO `food` VALUES (6, 3, '奶茶', '好喝', 'http://localhost:8080/img/hongshaopaigu.jpg', 60, 51, 1, 1, 1, 8.0, 50, 50, 0, '2020-06-07 00:43:05', '2020-06-06 17:22:09');
INSERT INTO `food` VALUES (7, 3, '奶茶', '好喝', 'http://localhost:8080/img/hongshaopaigu.jpg', 60, 51, 1, 1, 1, 8.0, 50, 50, 0, '2020-06-07 00:43:50', '2020-06-07 00:43:05');
INSERT INTO `food` VALUES (9, 3, '咖啡', '好喝', 'http://localhost:8080/img/hongshaopaigu.jpg', 60, 51, 1, 1, 1, 8.0, 20, 20, 0, '2020-06-07 01:15:21', '2020-07-06 15:21:37');
INSERT INTO `food` VALUES (11, 3, '咖啡', '好喝', 'http://localhost:8080/img/hongshaopaigu.jpg', 60, 60, 1, 1, 0, 10.0, 50, 50, 0, '2020-06-07 01:21:57', '2020-07-06 15:21:37');
INSERT INTO `food` VALUES (12, 3, '咖啡', '好喝', 'http://localhost:8080/img/hongshaopaigu.jpg', 60, 60, 1, 0, 0, 10.0, 50, 50, 0, '2020-06-07 01:49:58', '2020-07-06 15:21:37');
INSERT INTO `food` VALUES (13, 3, '咖啡', '好喝', 'http://localhost:8080/img/hongshaopaigu.jpg', 60, 60, 1, 0, 0, 10.0, 50, 50, 0, '2020-06-07 01:52:54', '2020-07-06 15:21:37');
INSERT INTO `food` VALUES (14, 3, '咖啡', '好喝', 'http://localhost:8080/img/hongshaopaigu.jpg', 60, 51, 1, 0, 1, 8.5, 50, 50, 0, '2020-06-07 07:49:40', '2020-07-06 15:21:37');
INSERT INTO `food` VALUES (15, 3, '咖啡', '好喝111', 'http://localhost:8080/img/hongshaopaigu.jpg', 60, 51, 1, 1, 1, 8.5, 50, 50, 0, '2020-06-07 07:54:56', '2020-07-06 15:21:37');
INSERT INTO `food` VALUES (16, 3, '咖啡', '好喝', 'http://localhost:8080/img/hongshaopaigu.jpg', 60, 51, 1, 1, 1, 8.5, 50, 50, 0, '2020-06-07 08:13:19', '2020-07-06 15:21:37');
INSERT INTO `food` VALUES (17, 3, '咖啡', '好喝', 'http://localhost:8080/img/lanpangtou.jpg', 60, 60, 1, 1, 0, 10.0, 50, 50, 0, '2020-06-07 08:18:19', '2020-07-06 15:21:37');
INSERT INTO `food` VALUES (18, 3, '咖啡', '好喝', 'http://localhost:8080/img/lanpangtou.jpg', 60, 51, 0, 1, 1, 8.5, 50, 50, 0, '2020-06-17 12:52:51', '2020-07-06 15:21:37');
INSERT INTO `food` VALUES (19, 1, '酸菜鱼121', '好吃', 'http://localhost:8080/img/lanpangtou.jpg', 70, 49, 1, 1, 1, 8.0, 100, 100, 0, '2020-06-17 12:52:51', '2020-07-06 15:21:37');
INSERT INTO `food` VALUES (20, 1, '青菜', '营养高', '8.0http://localhost:8080/img/lanpangtou.jpg', 80, 64, 1, 1, 1, 8.0, 10, 10, 0, '2020-07-06 15:23:23', '2020-07-06 16:27:43');
INSERT INTO `food` VALUES (21, 1, '麻辣豆腐', '鲜嫩', 'http://localhost:8080/img/lanpangtou.jpg', 30, 30, 1, 1, 0, 10.0, 40, 40, 1, '2020-07-07 05:03:17', '2020-07-07 05:04:13');
INSERT INTO `food` VALUES (22, 1, '冷吃兔', '非常辣', 'http://localhost:8080/img/lanpangtou.jpg', 60, 48, 1, 1, 1, 8.0, 40, 39, 1, '2020-07-07 06:12:50', '2020-07-07 08:18:56');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单id',
  `totalPay` bigint(10) NOT NULL COMMENT '总金额',
  `actualPay` bigint(10) NOT NULL COMMENT '实付金额',
  `paymentType` int(1) UNSIGNED ZEROFILL NOT NULL COMMENT '支付类型，1微信支付，2，支付宝支付',
  `buyerMessage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '买家备注留言',
  `consignee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收货人',
  `userId` int(20) NOT NULL COMMENT '下单人id',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收货地址',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收货人手机号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('380016e8c92944bb8d032428fc5a1f4e', 50, 35, 2, '多放辣椒', '张三', 1, '四川', '121211111');
INSERT INTO `order` VALUES ('51b199f4255a4e79846837ce5fcd92ef', 50, 35, 2, '加点辣', '张三', 1, '四川成都', '12121111');
INSERT INTO `order` VALUES ('e53a0f00ddc6417db7e14bfab185312a', 60, 51, 2, '加点冰', '张三', 1, '四川成都', '12311111');
INSERT INTO `order` VALUES ('ed2773c039954561877b9a9de3c6fa85', 60, 48, 1, '辣一点', '张三', 1, '四川', '12121111');

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单详情id',
  `orderId` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单id',
  `foodId` int(11) NOT NULL COMMENT '菜品id',
  `count` int(11) NOT NULL COMMENT '购买数量',
  `status` int(255) NOT NULL COMMENT '1已支付，2未支付',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '订单创建时间',
  `endTime` datetime(0) NULL DEFAULT NULL COMMENT '交易完成时间',
  `closeTime` datetime(0) NULL DEFAULT NULL COMMENT '交易关闭时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (9, '380016e8c92944bb8d032428fc5a1f4e', 1, 1, 1, '2020-07-07 08:17:53', '2020-07-07 08:17:53', NULL);
INSERT INTO `order_detail` VALUES (11, 'ed2773c039954561877b9a9de3c6fa85', 22, 1, 1, '2020-07-07 08:19:17', '2020-07-07 08:19:17', NULL);
INSERT INTO `order_detail` VALUES (12, '51b199f4255a4e79846837ce5fcd92ef', 1, 1, 1, '2020-07-07 11:31:32', '2020-07-07 11:31:32', NULL);
INSERT INTO `order_detail` VALUES (13, 'e53a0f00ddc6417db7e14bfab185312a', 3, 1, 1, '2020-07-07 11:34:00', '2020-07-07 11:34:00', NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
  `password` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `images` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  `admin` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否是管理员',
  `birthday` datetime(0) NULL DEFAULT NULL COMMENT '生日',
  `sex` tinyint(1) NULL DEFAULT NULL COMMENT '性别,0男，1女',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '住址',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '张三', '1234', 'http://localhost:8080/img/lanpangtou.jpg', NULL, '2020-06-06 20:12:33', 1, '12345678910', 'Jack@sina.com', NULL, NULL);
INSERT INTO `user` VALUES (2, '李四', '1234', 'http://localhost:8080/img/lanpangtou.jpg', NULL, '2020-06-06 20:12:38', 0, '12347828910', 'Jack@sina.com', '四川', NULL);

SET FOREIGN_KEY_CHECKS = 1;
