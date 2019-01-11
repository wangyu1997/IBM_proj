/*
 Navicat Premium Data Transfer

 Source Server         : master
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : 10.13.119.203:3306
 Source Schema         : javaee

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 11/01/2019 08:34:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `address_id` varchar(100) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  `address_info` varchar(500) NOT NULL,
  `is_default_address` bit(1) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  UNIQUE KEY `address_address_id_uindex` (`address_id`),
  KEY `address_user_user_id_fk` (`user_id`),
  CONSTRAINT `address_user_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
BEGIN;
INSERT INTO `address` VALUES ('7498b556-437b-4898-8960-b658eb5fb2d5', 'test2@123.com', '432', '43242', b'1');
INSERT INTO `address` VALUES ('a8e99755-dd7a-48d8-9a4b-01dd2cb34741', 'test@123.com', '111', 'daf', b'1');
COMMIT;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `user_id` varchar(100) DEFAULT NULL,
  `totals` int(255) DEFAULT NULL,
  `product_id` varchar(100) DEFAULT NULL,
  KEY `user_for` (`user_id`),
  KEY `pro_for` (`product_id`),
  CONSTRAINT `pro_for` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_for` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
BEGIN;
INSERT INTO `cart` VALUES ('test@123.com', 2, 'D7gojFukZqhJfoWosEkTWRhDUdyhX67cg5PRe4NDINqJZY8Krq');
COMMIT;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` varchar(100) NOT NULL,
  `comment_content` varchar(10000) NOT NULL DEFAULT '买家长时间未评论，默认好评',
  `product_id` varchar(100) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `comment_date` date NOT NULL,
  PRIMARY KEY (`comment_id`),
  UNIQUE KEY `comment_comment_id_uindex` (`comment_id`),
  KEY `comment_product_product_id_fk` (`product_id`),
  KEY `comment_user_user_id_fk` (`user_id`),
  CONSTRAINT `comment_product_product_id_fk` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_user_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
BEGIN;
INSERT INTO `comment` VALUES ('322e1cf5-f823-4165-8dd2-1868fc98f4d9', '123', '0QZFNSuCMq1hkicfw5k80vXrK8I6mCq0oOj78zaHnQcVqfm4CO', 'test2@123.com', '2018-12-27');
INSERT INTO `comment` VALUES ('7154cd19-9945-41ed-841e-20fd5163ad6e', 'yes', '0gQ9rZ5pBvZaKrxLcuFNwJdnnvF1AW2z3g1bwYfR6qFQTb8gSb', 'test@123.com', '2018-12-27');
INSERT INTO `comment` VALUES ('d11f155d-fde7-46c9-afc7-4f96ce472327', 'good', '0gQ9rZ5pBvZaKrxLcuFNwJdnnvF1AW2z3g1bwYfR6qFQTb8gSb', 'test@123.com', '2018-12-27');
INSERT INTO `comment` VALUES ('e7e0af4f-619b-45bd-920e-b873e16d104b', 'hhahaha', '0gQ9rZ5pBvZaKrxLcuFNwJdnnvF1AW2z3g1bwYfR6qFQTb8gSb', 'test@123.com', '2018-12-27');
INSERT INTO `comment` VALUES ('f7b6e136-fb7f-4aee-9517-f1edad99d4e4', '', '0gQ9rZ5pBvZaKrxLcuFNwJdnnvF1AW2z3g1bwYfR6qFQTb8gSb', 'test@123.com', '2018-12-27');
INSERT INTO `comment` VALUES ('fcb40825-c7ec-4c46-ac34-da911c060e16', 'rtrty', '0gQ9rZ5pBvZaKrxLcuFNwJdnnvF1AW2z3g1bwYfR6qFQTb8gSb', 'test2@123.com', '2018-12-27');
COMMIT;

-- ----------------------------
-- Table structure for first_category
-- ----------------------------
DROP TABLE IF EXISTS `first_category`;
CREATE TABLE `first_category` (
  `first_category_name` varchar(100) NOT NULL,
  `first_category_id` varchar(100) NOT NULL,
  PRIMARY KEY (`first_category_id`),
  UNIQUE KEY `first_category_first_category_name_uindex` (`first_category_name`),
  UNIQUE KEY `first_category_first_category_id_uindex` (`first_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of first_category
-- ----------------------------
BEGIN;
INSERT INTO `first_category` VALUES ('图书音像', 'LfuB8VDSSiVayNEo2DiTFqAySvwXhzmyRezWDjmnpMZKb2bA4I');
INSERT INTO `first_category` VALUES ('女装男装', 'E0XiJWDSyHy9VKrIhxceTsemmFMemHPYOrQqIrrIHWFupIbKkq');
INSERT INTO `first_category` VALUES ('家用电器', 'PmdCYbUJU7rXqHoEEA4Uei08sIKdSCCaXX8rQkVABQHMTm4by0');
INSERT INTO `first_category` VALUES ('手机数码', 'ZFMRhWOW07lsuShQ1bPvefmY9YJ1RIwmJ5oauh7QpSIcfnDWdK');
INSERT INTO `first_category` VALUES ('母婴用品', 'hmL914pKeRocGXQIkPPUFuPltsBrFCqYdpcsz3vhxxWFtGoi7f');
INSERT INTO `first_category` VALUES ('食品酒类', 'QhUzQaamNO2Q4SZYSrGlfPa7Dg7GYt2ZjQK3KdXkYoWtBKfZm0');
COMMIT;

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `image_id` varchar(1000) NOT NULL,
  `product_id` varchar(100) DEFAULT NULL,
  `image_url` varchar(1000) NOT NULL,
  PRIMARY KEY (`image_id`),
  UNIQUE KEY `image_image_id_uindex` (`image_id`),
  KEY `image_product_product_id_fk` (`product_id`),
  CONSTRAINT `image_product_product_id_fk` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of image
-- ----------------------------
BEGIN;
INSERT INTO `image` VALUES ('01230ct%2B31S._SL800_.jpg', 'rAudXN3o5eMLaxxv4jk2VFji2zUFrpu7o0pJIuebc0ZEiVs6Rd', '01230ct%2B31S._SL800_.jpg');
INSERT INTO `image` VALUES ('01xJLnJS5MS._SL800_.jpg', 'ApM6KvBcna0W3S3wZP0FZfpl61EeypHWO81VGTeGHkHo5IpivP', '01xJLnJS5MS._SL800_.jpg');
INSERT INTO `image` VALUES ('11-cLM2Ff-L._SL800_.jpg', 'Hu8clX2mCoQ3muBt9gSNoKbeSOsrMNsreTtMIRKdtYQcB5Yhj3', '11-cLM2Ff-L._SL800_.jpg');
INSERT INTO `image` VALUES ('118h0dgJlEL._SL800_.jpg', 'cFMYJs9klxva9TEAXO17XEaEyDC0fSnERU1xzFuR1RMl8pBM95', '118h0dgJlEL._SL800_.jpg');
INSERT INTO `image` VALUES ('11EczK13dwL._SL800_.jpg', 'ULvD3UeNCioB6rnu9bDafzRxe8eNayUEObLtXgNrhH9C0wnWwy', '11EczK13dwL._SL800_.jpg');
INSERT INTO `image` VALUES ('11GLGx7q1ML._SL800_.jpg', 'Hu8clX2mCoQ3muBt9gSNoKbeSOsrMNsreTtMIRKdtYQcB5Yhj3', '11GLGx7q1ML._SL800_.jpg');
INSERT INTO `image` VALUES ('11HHD9rRJ3L._SL800_.jpg', 'cFMYJs9klxva9TEAXO17XEaEyDC0fSnERU1xzFuR1RMl8pBM95', '11HHD9rRJ3L._SL800_.jpg');
INSERT INTO `image` VALUES ('11tT%2BZFzcdL._SL800_.jpg', 'ULvD3UeNCioB6rnu9bDafzRxe8eNayUEObLtXgNrhH9C0wnWwy', '11tT%2BZFzcdL._SL800_.jpg');
INSERT INTO `image` VALUES ('21A5vhQiiDL._SL800_.jpg', '7S9siiiVpoO8D970BjSoDSzCHwi35FuAV3cPCueAP1FdyjAN3j', '21A5vhQiiDL._SL800_.jpg');
INSERT INTO `image` VALUES ('21Gwv9SYlKL._SL800_.jpg', 'AQT2rRThhwhAMbXRL0H5MkSm9lh5moYXoOsi6RX7eJP1WEoXZE', '21Gwv9SYlKL._SL800_.jpg');
INSERT INTO `image` VALUES ('21h%2BeulRlYL._SL800_.jpg', 'g6xuhmLgyado2dGZpKkXdYX74E2yiYQFOZsD2BAuGxPkyAinHw', '21h%2BeulRlYL._SL800_.jpg');
INSERT INTO `image` VALUES ('21KUS%2B53euL._SL800_.jpg', 'Hu8clX2mCoQ3muBt9gSNoKbeSOsrMNsreTtMIRKdtYQcB5Yhj3', '21KUS%2B53euL._SL800_.jpg');
INSERT INTO `image` VALUES ('21n82UbptML._SL800_.jpg', 'nq7m8booWhUTQ2BKz2BY7KUbjBb6Eus0WtfNwCvrJUcCYtqDgl', '21n82UbptML._SL800_.jpg');
INSERT INTO `image` VALUES ('21rajNtVKnL._SL800_.jpg', 'ULvD3UeNCioB6rnu9bDafzRxe8eNayUEObLtXgNrhH9C0wnWwy', '21rajNtVKnL._SL800_.jpg');
INSERT INTO `image` VALUES ('21T0vNkWs%2BL._SL800_.jpg', 'PyllyxxQBdNXo4lqIep3eMjz31dYGtwkDnrBSyyz6jaXlF7HHV', '21T0vNkWs%2BL._SL800_.jpg');
INSERT INTO `image` VALUES ('21t8%2Bo57OjL._SL800_.jpg', 'F2XHBkRR8aaLWHP3bL2o0PEXerLYMOAuabU1BbBKSKteb24Uja', '21t8%2Bo57OjL._SL800_.jpg');
INSERT INTO `image` VALUES ('21TO3iVonzL._SL800_.jpg', 'Hu8clX2mCoQ3muBt9gSNoKbeSOsrMNsreTtMIRKdtYQcB5Yhj3', '21TO3iVonzL._SL800_.jpg');
INSERT INTO `image` VALUES ('21uOSDrgqvL._SL800_.jpg', 'cFMYJs9klxva9TEAXO17XEaEyDC0fSnERU1xzFuR1RMl8pBM95', '21uOSDrgqvL._SL800_.jpg');
INSERT INTO `image` VALUES ('21VXwUtOzBL._SL800_.jpg', '4T5jH74YXyeq7sbcK9gjWc1yGagMiFB7yMThIB8hCCecKA0bmW', '21VXwUtOzBL._SL800_.jpg');
INSERT INTO `image` VALUES ('21W7KwdB0sL._SL800_.jpg', 'cFMYJs9klxva9TEAXO17XEaEyDC0fSnERU1xzFuR1RMl8pBM95', '21W7KwdB0sL._SL800_.jpg');
INSERT INTO `image` VALUES ('21wSJTO-cTL._SL800_.jpg', 'g6xuhmLgyado2dGZpKkXdYX74E2yiYQFOZsD2BAuGxPkyAinHw', '21wSJTO-cTL._SL800_.jpg');
INSERT INTO `image` VALUES ('21XHPEBJohL._SL800_.jpg', 'PyllyxxQBdNXo4lqIep3eMjz31dYGtwkDnrBSyyz6jaXlF7HHV', '21XHPEBJohL._SL800_.jpg');
INSERT INTO `image` VALUES ('31%2BYtCNtxQL._SL800_.jpg', '5WR9uj8SsE7LEZbJsQz8EkrhvgzC2KSzncMMeRHKSe7FzZiszV', '31%2BYtCNtxQL._SL800_.jpg');
INSERT INTO `image` VALUES ('31-P4m2Cj3L._SL800_.jpg', 'lOPTKxbtyFrySJSaRzxkK4PkD0nd5Kl2zhyFvJ5zPC5RuWjmpH', '31-P4m2Cj3L._SL800_.jpg');
INSERT INTO `image` VALUES ('31-VjXtJtUL._SL800_.jpg', 'AQT2rRThhwhAMbXRL0H5MkSm9lh5moYXoOsi6RX7eJP1WEoXZE', '31-VjXtJtUL._SL800_.jpg');
INSERT INTO `image` VALUES ('31-XoMzHGdL._SL800_.jpg', '7S9siiiVpoO8D970BjSoDSzCHwi35FuAV3cPCueAP1FdyjAN3j', '31-XoMzHGdL._SL800_.jpg');
INSERT INTO `image` VALUES ('310buzp4KWL._SL800_.jpg', 'nq7m8booWhUTQ2BKz2BY7KUbjBb6Eus0WtfNwCvrJUcCYtqDgl', '310buzp4KWL._SL800_.jpg');
INSERT INTO `image` VALUES ('310DVwLbUbL._SL800_.jpg', 'rvFkjfFJndjNCP6G4cOkZutXazwvBDPkbyGPQTFifSUkoZliQl', '310DVwLbUbL._SL800_.jpg');
INSERT INTO `image` VALUES ('310QB72a2NL._SL800_.jpg', 'JPtUSPUYDbYhzu9n2YbCWOxMxTgR8DUoFG0IUyANsNGwIMZOsc', '310QB72a2NL._SL800_.jpg');
INSERT INTO `image` VALUES ('3115hKgsmgL._SL800_.jpg', 'i4a4PTJrgB1qZAGNuZc0vulYvGKOiBI1DQcOqVZklKKboZp8If', '3115hKgsmgL._SL800_.jpg');
INSERT INTO `image` VALUES ('311BuayJPIL._SL800_.jpg', '1TBSWxxMKvZkqFySSsIWbiEDYKjARaY8aS33LKAWDbrCfA3Evx', '311BuayJPIL._SL800_.jpg');
INSERT INTO `image` VALUES ('312uzE3qR3L._SL800_.jpg', 'Hu8clX2mCoQ3muBt9gSNoKbeSOsrMNsreTtMIRKdtYQcB5Yhj3', '312uzE3qR3L._SL800_.jpg');
INSERT INTO `image` VALUES ('3156zt1S4LL._SL800_.jpg', 'qAutJ6uCpWZVjmFVQt3CG1Twzd0K195uxuUxk0z0ocv9idlXlR', '3156zt1S4LL._SL800_.jpg');
INSERT INTO `image` VALUES ('316Kg9MEpmL._SL800_.jpg', '7xkJnJlSUBdFltzMFvHBweNDQHVKOak6vOUmt8GkVIVqyOeyEH', '316Kg9MEpmL._SL800_.jpg');
INSERT INTO `image` VALUES ('317irueu80L._SL800_.jpg', 'EDxHhYPRmgK8idzRN9MCJ8xDP840k5XmgtPuV7IkYCloj1mOUf', '317irueu80L._SL800_.jpg');
INSERT INTO `image` VALUES ('319vX%2BLJKOL._SL800_.jpg', '3kNzVVb8oE5v4Sg1ZTS2srHP6imrICgOE5ljruRMpT3evH1Pwq', '319vX%2BLJKOL._SL800_.jpg');
INSERT INTO `image` VALUES ('31AHxen4BOL._SL800_.jpg', 'AQT2rRThhwhAMbXRL0H5MkSm9lh5moYXoOsi6RX7eJP1WEoXZE', '31AHxen4BOL._SL800_.jpg');
INSERT INTO `image` VALUES ('31bA0aTkq7L._SL800_.jpg', '7S9siiiVpoO8D970BjSoDSzCHwi35FuAV3cPCueAP1FdyjAN3j', '31bA0aTkq7L._SL800_.jpg');
INSERT INTO `image` VALUES ('31BakiXHANL._SL800_.jpg', 'OKJucJbwCsekFCDjxt3mlqnuw1dEz2XwToFczzKOrLAKMrngxF', '31BakiXHANL._SL800_.jpg');
INSERT INTO `image` VALUES ('31c51iKCMgL._SL800_.jpg', 'IE7JcRhMgqO4bHwYKqVWKjKGjSUUJ2LlzEXwSUff2Xi22QBf4f', '31c51iKCMgL._SL800_.jpg');
INSERT INTO `image` VALUES ('31EhTCgw6DL._SL800_.jpg', 'O10N1NCuzP5fVqgpPoVisS31uhPhnUp09cnzB317RJ7vfCnKi8', '31EhTCgw6DL._SL800_.jpg');
INSERT INTO `image` VALUES ('31Fag%2B2dXML._SL800_.jpg', 'cFMYJs9klxva9TEAXO17XEaEyDC0fSnERU1xzFuR1RMl8pBM95', '31Fag%2B2dXML._SL800_.jpg');
INSERT INTO `image` VALUES ('31FFc4oIYHL._SL800_.jpg', '7xkJnJlSUBdFltzMFvHBweNDQHVKOak6vOUmt8GkVIVqyOeyEH', '31FFc4oIYHL._SL800_.jpg');
INSERT INTO `image` VALUES ('31FGhR7yFuL._SL800_.jpg', 'A9VaXTrSMIgw62zDryWL1fLdCN2zEZpfQnaCgbm5hiXxVrEyRU', '31FGhR7yFuL._SL800_.jpg');
INSERT INTO `image` VALUES ('31FK9D-RldL._SL800_.jpg', '1TBSWxxMKvZkqFySSsIWbiEDYKjARaY8aS33LKAWDbrCfA3Evx', '31FK9D-RldL._SL800_.jpg');
INSERT INTO `image` VALUES ('31FomBOOUFL._SL800_.jpg', 'Eu80KHwVCOiBHHIK6Isrsr9zK7DY6RF8dFIors6IZdMAEENKI6', '31FomBOOUFL._SL800_.jpg');
INSERT INTO `image` VALUES ('31G14lxE9aL._SL800_.jpg', '2XA5OJkcCLUmQb5UbWOHWNQ3G7tdIz7co5hWfpkqmNguobEcGg', '31G14lxE9aL._SL800_.jpg');
INSERT INTO `image` VALUES ('31gCYvYt6VL._SL800_.jpg', '7xkJnJlSUBdFltzMFvHBweNDQHVKOak6vOUmt8GkVIVqyOeyEH', '31gCYvYt6VL._SL800_.jpg');
INSERT INTO `image` VALUES ('31HPaOrcL2L._SL800_.jpg', 'HXkpBZd3Uv9nQ3H60l4aE9SxitZIHyuga9LamKF8o7X2zoQHCs', '31HPaOrcL2L._SL800_.jpg');
INSERT INTO `image` VALUES ('31hr9rYxHeL._SL800_.jpg', 'Y2uYku0Ee3584MBb715zkQu48GEq161SL2UB4uBn38MKWC2ta2', '31hr9rYxHeL._SL800_.jpg');
INSERT INTO `image` VALUES ('31i53y1rjjL._SL800_.jpg', '7xkJnJlSUBdFltzMFvHBweNDQHVKOak6vOUmt8GkVIVqyOeyEH', '31i53y1rjjL._SL800_.jpg');
INSERT INTO `image` VALUES ('31KAwlWe3PL._SL800_.jpg', 'cxIuVx1SXv9xCALCfyuUHXPaeMzEXh5ClrnVQx8SqM054PY6j7', '31KAwlWe3PL._SL800_.jpg');
INSERT INTO `image` VALUES ('31kSuY6x7NL._SL800_.jpg', 'VdJCPNFJUGNdHs5DZCbYyLd8ER2sOlBT4SJfmKttVhDT2MrHdH', '31kSuY6x7NL._SL800_.jpg');
INSERT INTO `image` VALUES ('31LAc1QlpHL._SL800_.jpg', 'g6xuhmLgyado2dGZpKkXdYX74E2yiYQFOZsD2BAuGxPkyAinHw', '31LAc1QlpHL._SL800_.jpg');
INSERT INTO `image` VALUES ('31mRWSs5r1L._SL800_.jpg', '7xkJnJlSUBdFltzMFvHBweNDQHVKOak6vOUmt8GkVIVqyOeyEH', '31mRWSs5r1L._SL800_.jpg');
INSERT INTO `image` VALUES ('31n%2BNvm7qNL._SL800_.jpg', 'OKJucJbwCsekFCDjxt3mlqnuw1dEz2XwToFczzKOrLAKMrngxF', '31n%2BNvm7qNL._SL800_.jpg');
INSERT INTO `image` VALUES ('31n34S2HK2L._SL800_.jpg', 'EDxHhYPRmgK8idzRN9MCJ8xDP840k5XmgtPuV7IkYCloj1mOUf', '31n34S2HK2L._SL800_.jpg');
INSERT INTO `image` VALUES ('31Ny7988JrL._SL800_.jpg', 'IBDfqtGXiI9rWPpb3WCVrorLVn5mDksQTj2dNFHCcmWUS2TTNE', '31Ny7988JrL._SL800_.jpg');
INSERT INTO `image` VALUES ('31o%2BkiyHo9L._SL800_.jpg', 'ZKp9N1xbfUrU3WNE2sXSp0iRNzr3Cu8kusaPOlhZnutq0FsC32', '31o%2BkiyHo9L._SL800_.jpg');
INSERT INTO `image` VALUES ('31oJx2QpHZL._SL800_.jpg', 'JPtUSPUYDbYhzu9n2YbCWOxMxTgR8DUoFG0IUyANsNGwIMZOsc', '31oJx2QpHZL._SL800_.jpg');
INSERT INTO `image` VALUES ('31oLqtcSRUL._SL800_.jpg', 'PyllyxxQBdNXo4lqIep3eMjz31dYGtwkDnrBSyyz6jaXlF7HHV', '31oLqtcSRUL._SL800_.jpg');
INSERT INTO `image` VALUES ('31OOew3AzZL._SL800_.jpg', 'ApM6KvBcna0W3S3wZP0FZfpl61EeypHWO81VGTeGHkHo5IpivP', '31OOew3AzZL._SL800_.jpg');
INSERT INTO `image` VALUES ('31OORKgxwUL._SL800_.jpg', 'Q9LKqlzxnOUDzndPjCCpjI8eZVA7zfx0UNynW6pR9ULJGyUlXJ', '31OORKgxwUL._SL800_.jpg');
INSERT INTO `image` VALUES ('31OTGUlvd9L._SL800_.jpg', 'D7gojFukZqhJfoWosEkTWRhDUdyhX67cg5PRe4NDINqJZY8Krq', '31OTGUlvd9L._SL800_.jpg');
INSERT INTO `image` VALUES ('31oX8WtFCZL._SL800_.jpg', 'Y2uYku0Ee3584MBb715zkQu48GEq161SL2UB4uBn38MKWC2ta2', '31oX8WtFCZL._SL800_.jpg');
INSERT INTO `image` VALUES ('31P8rWJJKnL._SL800_.jpg', 'WIfDhrG0Zt9o5vxej5DyRfDajtSp9KFenyySnxie5N6yt7X282', '31P8rWJJKnL._SL800_.jpg');
INSERT INTO `image` VALUES ('31q%2BscuddrL._SL800_.jpg', 'EDxHhYPRmgK8idzRN9MCJ8xDP840k5XmgtPuV7IkYCloj1mOUf', '31q%2BscuddrL._SL800_.jpg');
INSERT INTO `image` VALUES ('31qNEmnl4ZL._SL800_.jpg', 'g6xuhmLgyado2dGZpKkXdYX74E2yiYQFOZsD2BAuGxPkyAinHw', '31qNEmnl4ZL._SL800_.jpg');
INSERT INTO `image` VALUES ('31QTHRzn8bL._SL800_.jpg', '4T5jH74YXyeq7sbcK9gjWc1yGagMiFB7yMThIB8hCCecKA0bmW', '31QTHRzn8bL._SL800_.jpg');
INSERT INTO `image` VALUES ('31qxBHAL0cL._SL800_.jpg', '2XA5OJkcCLUmQb5UbWOHWNQ3G7tdIz7co5hWfpkqmNguobEcGg', '31qxBHAL0cL._SL800_.jpg');
INSERT INTO `image` VALUES ('31R0OxaDviL._SL800_.jpg', 'HXkpBZd3Uv9nQ3H60l4aE9SxitZIHyuga9LamKF8o7X2zoQHCs', '31R0OxaDviL._SL800_.jpg');
INSERT INTO `image` VALUES ('31RblHyo1iL._SL800_.jpg', 'rAudXN3o5eMLaxxv4jk2VFji2zUFrpu7o0pJIuebc0ZEiVs6Rd', '31RblHyo1iL._SL800_.jpg');
INSERT INTO `image` VALUES ('31RnSm2JMSL._SL800_.jpg', 'OKJucJbwCsekFCDjxt3mlqnuw1dEz2XwToFczzKOrLAKMrngxF', '31RnSm2JMSL._SL800_.jpg');
INSERT INTO `image` VALUES ('31SBbY8XxwL._SL800_.jpg', 'IBDfqtGXiI9rWPpb3WCVrorLVn5mDksQTj2dNFHCcmWUS2TTNE', '31SBbY8XxwL._SL800_.jpg');
INSERT INTO `image` VALUES ('31Smaht7OjL._SL800_.jpg', 'LYFnk7WkNXP3VIP6sAd8AszpPI3EHxspE1p09dFD7tcBfmtOU0', '31Smaht7OjL._SL800_.jpg');
INSERT INTO `image` VALUES ('31sp2qHRTOL._SL800_.jpg', '7S9siiiVpoO8D970BjSoDSzCHwi35FuAV3cPCueAP1FdyjAN3j', '31sp2qHRTOL._SL800_.jpg');
INSERT INTO `image` VALUES ('31suoXkZ5LL._SL800_.jpg', 'i4a4PTJrgB1qZAGNuZc0vulYvGKOiBI1DQcOqVZklKKboZp8If', '31suoXkZ5LL._SL800_.jpg');
INSERT INTO `image` VALUES ('31T9basHiYL._SL800_.jpg', 'IE7JcRhMgqO4bHwYKqVWKjKGjSUUJ2LlzEXwSUff2Xi22QBf4f', '31T9basHiYL._SL800_.jpg');
INSERT INTO `image` VALUES ('31Tcrj7dOpL._SL800_.jpg', 'ULvD3UeNCioB6rnu9bDafzRxe8eNayUEObLtXgNrhH9C0wnWwy', '31Tcrj7dOpL._SL800_.jpg');
INSERT INTO `image` VALUES ('31tptID6E6L._SL800_.jpg', 'nq7m8booWhUTQ2BKz2BY7KUbjBb6Eus0WtfNwCvrJUcCYtqDgl', '31tptID6E6L._SL800_.jpg');
INSERT INTO `image` VALUES ('31trhv0NRIL._SL800_.jpg', 'B9akHWaZRUjCb2D8sANQxlEmbCGwxTnRi3aeGitlI7YHvaFHGa', '31trhv0NRIL._SL800_.jpg');
INSERT INTO `image` VALUES ('31tsvD1-QCL._SL800_.jpg', '3kNzVVb8oE5v4Sg1ZTS2srHP6imrICgOE5ljruRMpT3evH1Pwq', '31tsvD1-QCL._SL800_.jpg');
INSERT INTO `image` VALUES ('31TVdVp9JrL._SL800_.jpg', 'Xi8HgMZLdAPiisW3MSBR9ItuGEkFRhoSDxkuJIZMfgsbRiTuTm', '31TVdVp9JrL._SL800_.jpg');
INSERT INTO `image` VALUES ('31Ud4zFQH1L._SL800_.jpg', 'rvFkjfFJndjNCP6G4cOkZutXazwvBDPkbyGPQTFifSUkoZliQl', '31Ud4zFQH1L._SL800_.jpg');
INSERT INTO `image` VALUES ('31UJoR7tAmL._SL800_.jpg', '0gQ9rZ5pBvZaKrxLcuFNwJdnnvF1AW2z3g1bwYfR6qFQTb8gSb', '31UJoR7tAmL._SL800_.jpg');
INSERT INTO `image` VALUES ('31vnXHhTpWL._SL800_.jpg', '1TBSWxxMKvZkqFySSsIWbiEDYKjARaY8aS33LKAWDbrCfA3Evx', '31vnXHhTpWL._SL800_.jpg');
INSERT INTO `image` VALUES ('31wnCg3YWbL._SL800_.jpg', 'D7gojFukZqhJfoWosEkTWRhDUdyhX67cg5PRe4NDINqJZY8Krq', '31wnCg3YWbL._SL800_.jpg');
INSERT INTO `image` VALUES ('31x00lawF-L._SL800_.jpg', 'q88Sb8tW8zZugmr4ej3eCWTCW5lJEmEFhWY8PjFxgZKWI95jRT', '31x00lawF-L._SL800_.jpg');
INSERT INTO `image` VALUES ('31xBBK1IqNL._SL800_.jpg', 'LYFnk7WkNXP3VIP6sAd8AszpPI3EHxspE1p09dFD7tcBfmtOU0', '31xBBK1IqNL._SL800_.jpg');
INSERT INTO `image` VALUES ('31xo4xczNqL._SL800_.jpg', 'AQT2rRThhwhAMbXRL0H5MkSm9lh5moYXoOsi6RX7eJP1WEoXZE', '31xo4xczNqL._SL800_.jpg');
INSERT INTO `image` VALUES ('31y0C8lcvpL._SL800_.jpg', 'nhO8efiznB92GAOxLSlONVa7PDmDGOGo7htP6KvmMFDHsCMsOL', '31y0C8lcvpL._SL800_.jpg');
INSERT INTO `image` VALUES ('31yMHkKgUaL._SL800_.jpg', 'D7gojFukZqhJfoWosEkTWRhDUdyhX67cg5PRe4NDINqJZY8Krq', '31yMHkKgUaL._SL800_.jpg');
INSERT INTO `image` VALUES ('31yXFM4mTVL._SL800_.jpg', '7S9siiiVpoO8D970BjSoDSzCHwi35FuAV3cPCueAP1FdyjAN3j', '31yXFM4mTVL._SL800_.jpg');
INSERT INTO `image` VALUES ('31ZaJBqnLPL._SL800_.jpg', 'WIfDhrG0Zt9o5vxej5DyRfDajtSp9KFenyySnxie5N6yt7X282', '31ZaJBqnLPL._SL800_.jpg');
INSERT INTO `image` VALUES ('41%2Baya67KdL._SL800_.jpg', 'lOPTKxbtyFrySJSaRzxkK4PkD0nd5Kl2zhyFvJ5zPC5RuWjmpH', '41%2Baya67KdL._SL800_.jpg');
INSERT INTO `image` VALUES ('41%2BNVO2ZdYL._SL800_.jpg', 'g6xuhmLgyado2dGZpKkXdYX74E2yiYQFOZsD2BAuGxPkyAinHw', '41%2BNVO2ZdYL._SL800_.jpg');
INSERT INTO `image` VALUES ('41%2BPW0YaMzL._SL800_.jpg', 'xLplntwjWdEKPys1Cb0qIJU5EMsjfSLJNqWMqj1UbwRYIVIppv', '41%2BPW0YaMzL._SL800_.jpg');
INSERT INTO `image` VALUES ('41%2BTLTw1XJL._SL800_.jpg', '0gQ9rZ5pBvZaKrxLcuFNwJdnnvF1AW2z3g1bwYfR6qFQTb8gSb', '41%2BTLTw1XJL._SL800_.jpg');
INSERT INTO `image` VALUES ('41%2BvjX6--tL._SL800_.jpg', 'SPtm6i9yBgVw3TVvKVGWfVqA8I9R0vjgWlZf8c14Kr1piKvVp9', '41%2BvjX6--tL._SL800_.jpg');
INSERT INTO `image` VALUES ('41%2BZGMVF-oL._SL800_.jpg', 'Q9LKqlzxnOUDzndPjCCpjI8eZVA7zfx0UNynW6pR9ULJGyUlXJ', '41%2BZGMVF-oL._SL800_.jpg');
INSERT INTO `image` VALUES ('41-3HrdMaBL._SL800_.jpg', 'rvFkjfFJndjNCP6G4cOkZutXazwvBDPkbyGPQTFifSUkoZliQl', '41-3HrdMaBL._SL800_.jpg');
INSERT INTO `image` VALUES ('41-CAqLlvpL._SL800_.jpg', 'FnlpuSAoXbQNmD8O7Z2U1E7XMFY4BiRjumIG0VIRxmZydNxxAQ', '41-CAqLlvpL._SL800_.jpg');
INSERT INTO `image` VALUES ('41-fF4IYo1L._SL800_.jpg', 'AQT2rRThhwhAMbXRL0H5MkSm9lh5moYXoOsi6RX7eJP1WEoXZE', '41-fF4IYo1L._SL800_.jpg');
INSERT INTO `image` VALUES ('41-nNIzpsHL._SL800_.jpg', 'MJLYphwF7AUcCZ6UfO5mwAantkaSKTCR15DMeoCIXj9Cfstefq', '41-nNIzpsHL._SL800_.jpg');
INSERT INTO `image` VALUES ('410388ytqbL._SL800_.jpg', 'zWVKdgZkQhRgXfM1Mj7aPbARqMHYYvqZAiynNr9bGqQSucRL65', '410388ytqbL._SL800_.jpg');
INSERT INTO `image` VALUES ('4107ywNkq9L._SL800_.jpg', '0QZFNSuCMq1hkicfw5k80vXrK8I6mCq0oOj78zaHnQcVqfm4CO', '4107ywNkq9L._SL800_.jpg');
INSERT INTO `image` VALUES ('410cn2m-raL._SL800_.jpg', 'r364fXfGbzWogTocIMhqJlQyIJpZCqDWbDHNvOWT8nQpyYefCZ', '410cn2m-raL._SL800_.jpg');
INSERT INTO `image` VALUES ('410J%2BbWs%2ByL._SL800_.jpg', 'siPTRsTlu99h5t7V6CO3Z17xdQKbWcA6ur39ogU7J1DYXsfVKl', '410J%2BbWs%2ByL._SL800_.jpg');
INSERT INTO `image` VALUES ('410U2NV-SXL._SL800_.jpg', 'cFMYJs9klxva9TEAXO17XEaEyDC0fSnERU1xzFuR1RMl8pBM95', '410U2NV-SXL._SL800_.jpg');
INSERT INTO `image` VALUES ('411AXleQlzL._SL800_.jpg', 'QO5uG6dkdeVRAXQC2HRtKcusiBmLKzshtgtBfxsMQSdhdNgY6S', '411AXleQlzL._SL800_.jpg');
INSERT INTO `image` VALUES ('411BaLjfydL._SL800_.jpg', 'LfnUEcwpeY3VE2i81YaVXNN44Bsq1epN7wSZdJDDdcPCd3lcOX', '411BaLjfydL._SL800_.jpg');
INSERT INTO `image` VALUES ('411ceytOOSL._SL800_.jpg', 'cFMYJs9klxva9TEAXO17XEaEyDC0fSnERU1xzFuR1RMl8pBM95', '411ceytOOSL._SL800_.jpg');
INSERT INTO `image` VALUES ('411K2vVtlGL._SL800_.jpg', 'hxi2vjcgrvpbNkxDWL2ipwXFfYQ4vAeawTidycBWWoN8Xw09lP', '411K2vVtlGL._SL800_.jpg');
INSERT INTO `image` VALUES ('411KAt5LMUL._SL800_.jpg', 'B9akHWaZRUjCb2D8sANQxlEmbCGwxTnRi3aeGitlI7YHvaFHGa', '411KAt5LMUL._SL800_.jpg');
INSERT INTO `image` VALUES ('411LwdVNDiL._SL800_.jpg', 'iRWOYs0BBbkOMyI51I3Wr8m2xaGxulsT2O2CDLTTJmz4q6sfhr', '411LwdVNDiL._SL800_.jpg');
INSERT INTO `image` VALUES ('411omjE4rFL._SL800_.jpg', 'A9VaXTrSMIgw62zDryWL1fLdCN2zEZpfQnaCgbm5hiXxVrEyRU', '411omjE4rFL._SL800_.jpg');
INSERT INTO `image` VALUES ('411pyu5TNvL._SL800_.jpg', '9iGfVWRmILzaDJMCtV8lRklOmrNZ8tl0m9HWMzjPOsMHC2MxpR', '411pyu5TNvL._SL800_.jpg');
INSERT INTO `image` VALUES ('411WvrWDJdL._SL800_.jpg', 'QO5uG6dkdeVRAXQC2HRtKcusiBmLKzshtgtBfxsMQSdhdNgY6S', '411WvrWDJdL._SL800_.jpg');
INSERT INTO `image` VALUES ('411ZPHp1BUL._SL800_.jpg', 'r364fXfGbzWogTocIMhqJlQyIJpZCqDWbDHNvOWT8nQpyYefCZ', '411ZPHp1BUL._SL800_.jpg');
INSERT INTO `image` VALUES ('412lGVQuEsL._SL800_.jpg', 'iRWOYs0BBbkOMyI51I3Wr8m2xaGxulsT2O2CDLTTJmz4q6sfhr', '412lGVQuEsL._SL800_.jpg');
INSERT INTO `image` VALUES ('412ZRiCP1XL._SL800_.jpg', 'ruWJgQFViHDf5qqgg9o0kPXv3R955BCISBziVZmmLJYISWed9e', '412ZRiCP1XL._SL800_.jpg');
INSERT INTO `image` VALUES ('41304Ge07OL._SL800_.jpg', 'xLplntwjWdEKPys1Cb0qIJU5EMsjfSLJNqWMqj1UbwRYIVIppv', '41304Ge07OL._SL800_.jpg');
INSERT INTO `image` VALUES ('4134qD3VzYL._SL800_.jpg', 'L8UORrOn9hHtU3zxKnzwiAcPJnLJfdp1QGOMYucLUwqFUSvWEC', '4134qD3VzYL._SL800_.jpg');
INSERT INTO `image` VALUES ('413glzgTmIL._SL800_.jpg', '7bY84jMVf7WqqwyxAc0FgMu9EvoWNT6XIuqELhrLUtY4jwDYR2', '413glzgTmIL._SL800_.jpg');
INSERT INTO `image` VALUES ('413MfxHBfwL._SL800_.jpg', 'O4rCM3eOjwuTMJmmeKhkRsIzbDrz1OHiCf5CMkDAaDeGNN8D44', '413MfxHBfwL._SL800_.jpg');
INSERT INTO `image` VALUES ('413nCWgnUmL._SL800_.jpg', 'A9VaXTrSMIgw62zDryWL1fLdCN2zEZpfQnaCgbm5hiXxVrEyRU', '413nCWgnUmL._SL800_.jpg');
INSERT INTO `image` VALUES ('4145E5yo3rL._SL800_.jpg', 'F2XHBkRR8aaLWHP3bL2o0PEXerLYMOAuabU1BbBKSKteb24Uja', '4145E5yo3rL._SL800_.jpg');
INSERT INTO `image` VALUES ('414cE7gSmML._SL800_.jpg', 'feGSVAImKpIeVD8DM1sb2QepPsLHdCv9d8q3yzhR5mA1taSXlM', '414cE7gSmML._SL800_.jpg');
INSERT INTO `image` VALUES ('414Jw9dkXWL._SL800_.jpg', 'nhO8efiznB92GAOxLSlONVa7PDmDGOGo7htP6KvmMFDHsCMsOL', '414Jw9dkXWL._SL800_.jpg');
INSERT INTO `image` VALUES ('414NPqMvKbL._SL800_.jpg', '20aioGh1x40ZZgwDhgOnegdC8dbZQ5czR1Rsjgk27ZD5j2ZGIJ', '414NPqMvKbL._SL800_.jpg');
INSERT INTO `image` VALUES ('414Wy7hap8L._SL800_.jpg', 'xLplntwjWdEKPys1Cb0qIJU5EMsjfSLJNqWMqj1UbwRYIVIppv', '414Wy7hap8L._SL800_.jpg');
INSERT INTO `image` VALUES ('415tDwzF1RL._SL800_.jpg', 'Y2uYku0Ee3584MBb715zkQu48GEq161SL2UB4uBn38MKWC2ta2', '415tDwzF1RL._SL800_.jpg');
INSERT INTO `image` VALUES ('4161rDubThL._SL800_.jpg', 'SWrE3ztIrSk2jukqzAHYk75beLA1i5CCvS9frcuRBbTLMytSMO', '4161rDubThL._SL800_.jpg');
INSERT INTO `image` VALUES ('416gABP34zL._SL800_.jpg', '5WR9uj8SsE7LEZbJsQz8EkrhvgzC2KSzncMMeRHKSe7FzZiszV', '416gABP34zL._SL800_.jpg');
INSERT INTO `image` VALUES ('416t3Aot94L._SL800_.jpg', 'ruWJgQFViHDf5qqgg9o0kPXv3R955BCISBziVZmmLJYISWed9e', '416t3Aot94L._SL800_.jpg');
INSERT INTO `image` VALUES ('417ggPyU2tL._SL800_.jpg', 'nq7m8booWhUTQ2BKz2BY7KUbjBb6Eus0WtfNwCvrJUcCYtqDgl', '417ggPyU2tL._SL800_.jpg');
INSERT INTO `image` VALUES ('417Gs4IGfSL._SL800_.jpg', '0gQ9rZ5pBvZaKrxLcuFNwJdnnvF1AW2z3g1bwYfR6qFQTb8gSb', '417Gs4IGfSL._SL800_.jpg');
INSERT INTO `image` VALUES ('417gsjO4PsL._SL800_.jpg', '4T5jH74YXyeq7sbcK9gjWc1yGagMiFB7yMThIB8hCCecKA0bmW', '417gsjO4PsL._SL800_.jpg');
INSERT INTO `image` VALUES ('417YDCA9-cL._SL800_.jpg', 'rvFkjfFJndjNCP6G4cOkZutXazwvBDPkbyGPQTFifSUkoZliQl', '417YDCA9-cL._SL800_.jpg');
INSERT INTO `image` VALUES ('417YKfFEiPL._SL800_.jpg', '20aioGh1x40ZZgwDhgOnegdC8dbZQ5czR1Rsjgk27ZD5j2ZGIJ', '417YKfFEiPL._SL800_.jpg');
INSERT INTO `image` VALUES ('4183sqyv8DL._SL800_.jpg', 'O4rCM3eOjwuTMJmmeKhkRsIzbDrz1OHiCf5CMkDAaDeGNN8D44', '4183sqyv8DL._SL800_.jpg');
INSERT INTO `image` VALUES ('418E174w11L._SL800_.jpg', 'FnlpuSAoXbQNmD8O7Z2U1E7XMFY4BiRjumIG0VIRxmZydNxxAQ', '418E174w11L._SL800_.jpg');
INSERT INTO `image` VALUES ('419qMYqMkSL._SL800_.jpg', 'SKKsEcjyOhRxXVyK6mr9yIM2qm6jvkc5qPlpEkBzOoiPDMp3wd', '419qMYqMkSL._SL800_.jpg');
INSERT INTO `image` VALUES ('419Tugo3E3L._SL800_.jpg', 'SPtm6i9yBgVw3TVvKVGWfVqA8I9R0vjgWlZf8c14Kr1piKvVp9', '419Tugo3E3L._SL800_.jpg');
INSERT INTO `image` VALUES ('41a1PebPtbL._SL800_.jpg', '8PQVBwKQFmRaK73FxUmIRxPvzZIHa7UvSwzLPvGvlV3OlZ313p', '41a1PebPtbL._SL800_.jpg');
INSERT INTO `image` VALUES ('41Aa0WK7xPL._SL800_.jpg', 'MJLYphwF7AUcCZ6UfO5mwAantkaSKTCR15DMeoCIXj9Cfstefq', '41Aa0WK7xPL._SL800_.jpg');
INSERT INTO `image` VALUES ('41aAzdLFKvL._SL800_.jpg', '20aioGh1x40ZZgwDhgOnegdC8dbZQ5czR1Rsjgk27ZD5j2ZGIJ', '41aAzdLFKvL._SL800_.jpg');
INSERT INTO `image` VALUES ('41AIz7KiF0L._SL800_.jpg', 'O10N1NCuzP5fVqgpPoVisS31uhPhnUp09cnzB317RJ7vfCnKi8', '41AIz7KiF0L._SL800_.jpg');
INSERT INTO `image` VALUES ('41aKNb61pYL._SL800_.jpg', '2XA5OJkcCLUmQb5UbWOHWNQ3G7tdIz7co5hWfpkqmNguobEcGg', '41aKNb61pYL._SL800_.jpg');
INSERT INTO `image` VALUES ('41AQUQfyoxL._SL800_.jpg', 'Er1eGKkXszeQ0Xc0slsmCbZlCLO81RfurVHdnP5RqUIzrFOr6G', '41AQUQfyoxL._SL800_.jpg');
INSERT INTO `image` VALUES ('41ATKU02jyL._SL800_.jpg', 'Eu80KHwVCOiBHHIK6Isrsr9zK7DY6RF8dFIors6IZdMAEENKI6', '41ATKU02jyL._SL800_.jpg');
INSERT INTO `image` VALUES ('41AUyZrOUKL._SL800_.jpg', 'u07I4yP6owFd2DFQiob6RWhEAzQzcTmmHDT2GmQDchUk1VbOzU', '41AUyZrOUKL._SL800_.jpg');
INSERT INTO `image` VALUES ('41axxz0MnbL._SL800_.jpg', '4T5jH74YXyeq7sbcK9gjWc1yGagMiFB7yMThIB8hCCecKA0bmW', '41axxz0MnbL._SL800_.jpg');
INSERT INTO `image` VALUES ('41b0E6flifL._SL800_.jpg', '8PQVBwKQFmRaK73FxUmIRxPvzZIHa7UvSwzLPvGvlV3OlZ313p', '41b0E6flifL._SL800_.jpg');
INSERT INTO `image` VALUES ('41b9WvTbULL._SL800_.jpg', 'feGSVAImKpIeVD8DM1sb2QepPsLHdCv9d8q3yzhR5mA1taSXlM', '41b9WvTbULL._SL800_.jpg');
INSERT INTO `image` VALUES ('41bGuv1Jd7L._SL800_.jpg', 'nhO8efiznB92GAOxLSlONVa7PDmDGOGo7htP6KvmMFDHsCMsOL', '41bGuv1Jd7L._SL800_.jpg');
INSERT INTO `image` VALUES ('41BuzNduxPL._SL800_.jpg', '3kNzVVb8oE5v4Sg1ZTS2srHP6imrICgOE5ljruRMpT3evH1Pwq', '41BuzNduxPL._SL800_.jpg');
INSERT INTO `image` VALUES ('41BWyC6QpzL._SL800_.jpg', 'O4rCM3eOjwuTMJmmeKhkRsIzbDrz1OHiCf5CMkDAaDeGNN8D44', '41BWyC6QpzL._SL800_.jpg');
INSERT INTO `image` VALUES ('41c7awrpLjL._SL800_.jpg', 'qAutJ6uCpWZVjmFVQt3CG1Twzd0K195uxuUxk0z0ocv9idlXlR', '41c7awrpLjL._SL800_.jpg');
INSERT INTO `image` VALUES ('41CIHUVMsZL._SL800_.jpg', 'Y2uYku0Ee3584MBb715zkQu48GEq161SL2UB4uBn38MKWC2ta2', '41CIHUVMsZL._SL800_.jpg');
INSERT INTO `image` VALUES ('41cLGPwFm0L._SL800_.jpg', 'Eu80KHwVCOiBHHIK6Isrsr9zK7DY6RF8dFIors6IZdMAEENKI6', '41cLGPwFm0L._SL800_.jpg');
INSERT INTO `image` VALUES ('41cm5A1WX5L._SL800_.jpg', 'PyllyxxQBdNXo4lqIep3eMjz31dYGtwkDnrBSyyz6jaXlF7HHV', '41cm5A1WX5L._SL800_.jpg');
INSERT INTO `image` VALUES ('41cmaT6%2BzCL._SL800_.jpg', 'q88Sb8tW8zZugmr4ej3eCWTCW5lJEmEFhWY8PjFxgZKWI95jRT', '41cmaT6%2BzCL._SL800_.jpg');
INSERT INTO `image` VALUES ('41cMvSUsD7L._SL800_.jpg', 'QO5uG6dkdeVRAXQC2HRtKcusiBmLKzshtgtBfxsMQSdhdNgY6S', '41cMvSUsD7L._SL800_.jpg');
INSERT INTO `image` VALUES ('41CnLG5HymL._SL800_.jpg', 'xLplntwjWdEKPys1Cb0qIJU5EMsjfSLJNqWMqj1UbwRYIVIppv', '41CnLG5HymL._SL800_.jpg');
INSERT INTO `image` VALUES ('41coQgSBZhL._SL800_.jpg', 'q88Sb8tW8zZugmr4ej3eCWTCW5lJEmEFhWY8PjFxgZKWI95jRT', '41coQgSBZhL._SL800_.jpg');
INSERT INTO `image` VALUES ('41cP6EdlvBL._SL800_.jpg', 'qQ8IoHnidTLLZqlYdrE2inX8m4fYWLo4yby8V9WweCCD6PvbFE', '41cP6EdlvBL._SL800_.jpg');
INSERT INTO `image` VALUES ('41cyLGXMowL._SL800_.jpg', 'YvyzyvYsvfRif624aTSMCuJ2V3zxD0adk27YaAwsAJ55lg5csO', '41cyLGXMowL._SL800_.jpg');
INSERT INTO `image` VALUES ('41D0mNYcawL._SL800_.jpg', '5WR9uj8SsE7LEZbJsQz8EkrhvgzC2KSzncMMeRHKSe7FzZiszV', '41D0mNYcawL._SL800_.jpg');
INSERT INTO `image` VALUES ('41D2XLmM1XL._SL800_.jpg', '3kNzVVb8oE5v4Sg1ZTS2srHP6imrICgOE5ljruRMpT3evH1Pwq', '41D2XLmM1XL._SL800_.jpg');
INSERT INTO `image` VALUES ('41dakIhYYxL._SL800_.jpg', '3kNzVVb8oE5v4Sg1ZTS2srHP6imrICgOE5ljruRMpT3evH1Pwq', '41dakIhYYxL._SL800_.jpg');
INSERT INTO `image` VALUES ('41DnqdTQS1L._SL800_.jpg', 'WIfDhrG0Zt9o5vxej5DyRfDajtSp9KFenyySnxie5N6yt7X282', '41DnqdTQS1L._SL800_.jpg');
INSERT INTO `image` VALUES ('41dV3nmjjSL._SL800_.jpg', 'hxi2vjcgrvpbNkxDWL2ipwXFfYQ4vAeawTidycBWWoN8Xw09lP', '41dV3nmjjSL._SL800_.jpg');
INSERT INTO `image` VALUES ('41e-HhJ0c6L._SL800_.jpg', 'IBDfqtGXiI9rWPpb3WCVrorLVn5mDksQTj2dNFHCcmWUS2TTNE', '41e-HhJ0c6L._SL800_.jpg');
INSERT INTO `image` VALUES ('41E8O6H3fPL._SL800_.jpg', 'JPtUSPUYDbYhzu9n2YbCWOxMxTgR8DUoFG0IUyANsNGwIMZOsc', '41E8O6H3fPL._SL800_.jpg');
INSERT INTO `image` VALUES ('41eAv6OoKmL._SL800_.jpg', 'i4a4PTJrgB1qZAGNuZc0vulYvGKOiBI1DQcOqVZklKKboZp8If', '41eAv6OoKmL._SL800_.jpg');
INSERT INTO `image` VALUES ('41eb8TKCnbL._SL800_.jpg', 'nq7m8booWhUTQ2BKz2BY7KUbjBb6Eus0WtfNwCvrJUcCYtqDgl', '41eb8TKCnbL._SL800_.jpg');
INSERT INTO `image` VALUES ('41ejzsbVPML._SL800_.jpg', 'HXkpBZd3Uv9nQ3H60l4aE9SxitZIHyuga9LamKF8o7X2zoQHCs', '41ejzsbVPML._SL800_.jpg');
INSERT INTO `image` VALUES ('41eMsX6bl-L._SL800_.jpg', 'XXPJG0U2t8QjnAjDFoAqH1rEcSofM55WByxNxz9mKaCvdFNoke', '41eMsX6bl-L._SL800_.jpg');
INSERT INTO `image` VALUES ('41evGSwV8EL._SL800_.jpg', 'QO5uG6dkdeVRAXQC2HRtKcusiBmLKzshtgtBfxsMQSdhdNgY6S', '41evGSwV8EL._SL800_.jpg');
INSERT INTO `image` VALUES ('41evjObveCL._SL800_.jpg', 'L8UORrOn9hHtU3zxKnzwiAcPJnLJfdp1QGOMYucLUwqFUSvWEC', '41evjObveCL._SL800_.jpg');
INSERT INTO `image` VALUES ('41EVxsRcSdL._SL800_.jpg', 'WIfDhrG0Zt9o5vxej5DyRfDajtSp9KFenyySnxie5N6yt7X282', '41EVxsRcSdL._SL800_.jpg');
INSERT INTO `image` VALUES ('41f56lS1yEL._SL800_.jpg', 'qQ8IoHnidTLLZqlYdrE2inX8m4fYWLo4yby8V9WweCCD6PvbFE', '41f56lS1yEL._SL800_.jpg');
INSERT INTO `image` VALUES ('41f6r2MNhEL._SL800_.jpg', '20aioGh1x40ZZgwDhgOnegdC8dbZQ5czR1Rsjgk27ZD5j2ZGIJ', '41f6r2MNhEL._SL800_.jpg');
INSERT INTO `image` VALUES ('41fBArwiw2L._SL800_.jpg', 'i4a4PTJrgB1qZAGNuZc0vulYvGKOiBI1DQcOqVZklKKboZp8If', '41fBArwiw2L._SL800_.jpg');
INSERT INTO `image` VALUES ('41ff0oXpqyL._SL800_.jpg', 'IBDfqtGXiI9rWPpb3WCVrorLVn5mDksQTj2dNFHCcmWUS2TTNE', '41ff0oXpqyL._SL800_.jpg');
INSERT INTO `image` VALUES ('41FGAjvxjLL._SL800_.jpg', '7S9siiiVpoO8D970BjSoDSzCHwi35FuAV3cPCueAP1FdyjAN3j', '41FGAjvxjLL._SL800_.jpg');
INSERT INTO `image` VALUES ('41fm1APOreL._SL800_.jpg', 'O10N1NCuzP5fVqgpPoVisS31uhPhnUp09cnzB317RJ7vfCnKi8', '41fm1APOreL._SL800_.jpg');
INSERT INTO `image` VALUES ('41FQnYWroXL._SL800_.jpg', 'OKJucJbwCsekFCDjxt3mlqnuw1dEz2XwToFczzKOrLAKMrngxF', '41FQnYWroXL._SL800_.jpg');
INSERT INTO `image` VALUES ('41Fu3RMgeQL._SL800_.jpg', 'GNX9uuJbYCFd9i5hlqMVK0Yme2FSQtLVR6fzkB26h8779Jw6nP', '41Fu3RMgeQL._SL800_.jpg');
INSERT INTO `image` VALUES ('41g9NMir1gL._SL800_.jpg', '4T5jH74YXyeq7sbcK9gjWc1yGagMiFB7yMThIB8hCCecKA0bmW', '41g9NMir1gL._SL800_.jpg');
INSERT INTO `image` VALUES ('41Gf2gu1tPL._SL800_.jpg', 'SPtm6i9yBgVw3TVvKVGWfVqA8I9R0vjgWlZf8c14Kr1piKvVp9', '41Gf2gu1tPL._SL800_.jpg');
INSERT INTO `image` VALUES ('41gI1IZiQ2L._SL800_.jpg', 'cxIuVx1SXv9xCALCfyuUHXPaeMzEXh5ClrnVQx8SqM054PY6j7', '41gI1IZiQ2L._SL800_.jpg');
INSERT INTO `image` VALUES ('41Gr4bNi7jL._SL800_.jpg', 'ee0yArDSvm91HNnV1laIddNLrML0tSyxsNfOY4CCNBvQt7V7M9', '41Gr4bNi7jL._SL800_.jpg');
INSERT INTO `image` VALUES ('41gtNrgcOLL._SL800_.jpg', '7bY84jMVf7WqqwyxAc0FgMu9EvoWNT6XIuqELhrLUtY4jwDYR2', '41gtNrgcOLL._SL800_.jpg');
INSERT INTO `image` VALUES ('41gWrZ10PBL._SL800_.jpg', 'Er1eGKkXszeQ0Xc0slsmCbZlCLO81RfurVHdnP5RqUIzrFOr6G', '41gWrZ10PBL._SL800_.jpg');
INSERT INTO `image` VALUES ('41GwXCIv6UL._SL800_.jpg', '8PQVBwKQFmRaK73FxUmIRxPvzZIHa7UvSwzLPvGvlV3OlZ313p', '41GwXCIv6UL._SL800_.jpg');
INSERT INTO `image` VALUES ('41GzgAXAUTL._SL800_.jpg', 'siPTRsTlu99h5t7V6CO3Z17xdQKbWcA6ur39ogU7J1DYXsfVKl', '41GzgAXAUTL._SL800_.jpg');
INSERT INTO `image` VALUES ('41H3Fv3p8ZL._SL800_.jpg', 'IBDfqtGXiI9rWPpb3WCVrorLVn5mDksQTj2dNFHCcmWUS2TTNE', '41H3Fv3p8ZL._SL800_.jpg');
INSERT INTO `image` VALUES ('41H9Dy1VGYL._SL800_.jpg', 'OKJucJbwCsekFCDjxt3mlqnuw1dEz2XwToFczzKOrLAKMrngxF', '41H9Dy1VGYL._SL800_.jpg');
INSERT INTO `image` VALUES ('41hdxhaAC%2BL._SL800_.jpg', 'MJLYphwF7AUcCZ6UfO5mwAantkaSKTCR15DMeoCIXj9Cfstefq', '41hdxhaAC%2BL._SL800_.jpg');
INSERT INTO `image` VALUES ('41hhcWTHViL._SL800_.jpg', 'Y2uYku0Ee3584MBb715zkQu48GEq161SL2UB4uBn38MKWC2ta2', '41hhcWTHViL._SL800_.jpg');
INSERT INTO `image` VALUES ('41hn19ZunPL._SL800_.jpg', 'ZKp9N1xbfUrU3WNE2sXSp0iRNzr3Cu8kusaPOlhZnutq0FsC32', '41hn19ZunPL._SL800_.jpg');
INSERT INTO `image` VALUES ('41HZtgGlSwL._SL800_.jpg', 'Er1eGKkXszeQ0Xc0slsmCbZlCLO81RfurVHdnP5RqUIzrFOr6G', '41HZtgGlSwL._SL800_.jpg');
INSERT INTO `image` VALUES ('41i0uqgzPAL._SL800_.jpg', 'JWNVQXEL9gOAeCqKXnrfl4kBOIcabeXIVPbqyXrShlNwcYmVm3', '41i0uqgzPAL._SL800_.jpg');
INSERT INTO `image` VALUES ('41i62Nsi7cL._SL800_.jpg', 'ruWJgQFViHDf5qqgg9o0kPXv3R955BCISBziVZmmLJYISWed9e', '41i62Nsi7cL._SL800_.jpg');
INSERT INTO `image` VALUES ('41I6CA3B-BL._SL800_.jpg', 'qAutJ6uCpWZVjmFVQt3CG1Twzd0K195uxuUxk0z0ocv9idlXlR', '41I6CA3B-BL._SL800_.jpg');
INSERT INTO `image` VALUES ('41IceYlB7bL._SL800_.jpg', 'iRWOYs0BBbkOMyI51I3Wr8m2xaGxulsT2O2CDLTTJmz4q6sfhr', '41IceYlB7bL._SL800_.jpg');
INSERT INTO `image` VALUES ('41imLWMOFhL._SL800_.jpg', '5WR9uj8SsE7LEZbJsQz8EkrhvgzC2KSzncMMeRHKSe7FzZiszV', '41imLWMOFhL._SL800_.jpg');
INSERT INTO `image` VALUES ('41Iq3Hmbg0L._SL800_.jpg', 'AQT2rRThhwhAMbXRL0H5MkSm9lh5moYXoOsi6RX7eJP1WEoXZE', '41Iq3Hmbg0L._SL800_.jpg');
INSERT INTO `image` VALUES ('41IZPHT1t6L._SL800_.jpg', 'Eu80KHwVCOiBHHIK6Isrsr9zK7DY6RF8dFIors6IZdMAEENKI6', '41IZPHT1t6L._SL800_.jpg');
INSERT INTO `image` VALUES ('41j-u1piQjL._SL800_.jpg', 'QO5uG6dkdeVRAXQC2HRtKcusiBmLKzshtgtBfxsMQSdhdNgY6S', '41j-u1piQjL._SL800_.jpg');
INSERT INTO `image` VALUES ('41J2gWxRk1L._SL800_.jpg', 'IBDfqtGXiI9rWPpb3WCVrorLVn5mDksQTj2dNFHCcmWUS2TTNE', '41J2gWxRk1L._SL800_.jpg');
INSERT INTO `image` VALUES ('41jc6H2qYtL._SL800_.jpg', 'B9akHWaZRUjCb2D8sANQxlEmbCGwxTnRi3aeGitlI7YHvaFHGa', '41jc6H2qYtL._SL800_.jpg');
INSERT INTO `image` VALUES ('41jf0r7T4FL._SL800_.jpg', 'kFZKrcFaJFz9XQplxhOdqnaIyUk46TZKC7PrUTVbb8Ndwz4Dhp', '41jf0r7T4FL._SL800_.jpg');
INSERT INTO `image` VALUES ('41JgflKsjsL._SL800_.jpg', 'QO5uG6dkdeVRAXQC2HRtKcusiBmLKzshtgtBfxsMQSdhdNgY6S', '41JgflKsjsL._SL800_.jpg');
INSERT INTO `image` VALUES ('41kpXVKbi0L._SL800_.jpg', 'ukLmzqCIYvCvGNb56xbUTzsvGnqaJHVPPCzwJmh8jx6ldvAqg8', '41kpXVKbi0L._SL800_.jpg');
INSERT INTO `image` VALUES ('41KQT-ipg-L._SL800_.jpg', 'iRWOYs0BBbkOMyI51I3Wr8m2xaGxulsT2O2CDLTTJmz4q6sfhr', '41KQT-ipg-L._SL800_.jpg');
INSERT INTO `image` VALUES ('41KuKhJft1L._SL800_.jpg', 'ee0yArDSvm91HNnV1laIddNLrML0tSyxsNfOY4CCNBvQt7V7M9', '41KuKhJft1L._SL800_.jpg');
INSERT INTO `image` VALUES ('41KWSeLRX1L._SL800_.jpg', 'mYJdthslRcjCE7SbE2BmKVFKFdQIrHXAA0C09bnWEHgN9yK8qM', '41KWSeLRX1L._SL800_.jpg');
INSERT INTO `image` VALUES ('41L-aeNa4XL._SL800_.jpg', 'WIfDhrG0Zt9o5vxej5DyRfDajtSp9KFenyySnxie5N6yt7X282', '41L-aeNa4XL._SL800_.jpg');
INSERT INTO `image` VALUES ('41l2mBrRECL._SL800_.jpg', '7ozKi2BdO6cJyDQO6GRB4veRePAgqvkbbwqOChcTjY3FSBDaKr', '41l2mBrRECL._SL800_.jpg');
INSERT INTO `image` VALUES ('41l5fjcNYRL._SL800_.jpg', 'Er1eGKkXszeQ0Xc0slsmCbZlCLO81RfurVHdnP5RqUIzrFOr6G', '41l5fjcNYRL._SL800_.jpg');
INSERT INTO `image` VALUES ('41M5maKK4aL._SL800_.jpg', 'u07I4yP6owFd2DFQiob6RWhEAzQzcTmmHDT2GmQDchUk1VbOzU', '41M5maKK4aL._SL800_.jpg');
INSERT INTO `image` VALUES ('41MBROBAcPL._SL800_.jpg', '0gQ9rZ5pBvZaKrxLcuFNwJdnnvF1AW2z3g1bwYfR6qFQTb8gSb', '41MBROBAcPL._SL800_.jpg');
INSERT INTO `image` VALUES ('41mi72T1ttL._SL800_.jpg', '4T5jH74YXyeq7sbcK9gjWc1yGagMiFB7yMThIB8hCCecKA0bmW', '41mi72T1ttL._SL800_.jpg');
INSERT INTO `image` VALUES ('41mNKWni9tL._SL800_.jpg', 'A9VaXTrSMIgw62zDryWL1fLdCN2zEZpfQnaCgbm5hiXxVrEyRU', '41mNKWni9tL._SL800_.jpg');
INSERT INTO `image` VALUES ('41mPiXKKiWL._SL800_.jpg', 'hxi2vjcgrvpbNkxDWL2ipwXFfYQ4vAeawTidycBWWoN8Xw09lP', '41mPiXKKiWL._SL800_.jpg');
INSERT INTO `image` VALUES ('41N07RfayXL._SL800_.jpg', 'VdJCPNFJUGNdHs5DZCbYyLd8ER2sOlBT4SJfmKttVhDT2MrHdH', '41N07RfayXL._SL800_.jpg');
INSERT INTO `image` VALUES ('41nAyer-zNL._SL800_.jpg', '8G9C5Qjjzjqwjs8Gn7IGRiKtksVHEGSM9ajE0sPvV3I72Y7Q4t', '41nAyer-zNL._SL800_.jpg');
INSERT INTO `image` VALUES ('41nHU6qP-5L._SL800_.jpg', 'rvFkjfFJndjNCP6G4cOkZutXazwvBDPkbyGPQTFifSUkoZliQl', '41nHU6qP-5L._SL800_.jpg');
INSERT INTO `image` VALUES ('41nlhT3HTOL._SL800_.jpg', 'mYJdthslRcjCE7SbE2BmKVFKFdQIrHXAA0C09bnWEHgN9yK8qM', '41nlhT3HTOL._SL800_.jpg');
INSERT INTO `image` VALUES ('41NrqOGX9RL._SL800_.jpg', 'A9VaXTrSMIgw62zDryWL1fLdCN2zEZpfQnaCgbm5hiXxVrEyRU', '41NrqOGX9RL._SL800_.jpg');
INSERT INTO `image` VALUES ('41O0FTPjgsL._SL800_.jpg', '5WR9uj8SsE7LEZbJsQz8EkrhvgzC2KSzncMMeRHKSe7FzZiszV', '41O0FTPjgsL._SL800_.jpg');
INSERT INTO `image` VALUES ('41o5R1ZXWXL._SL800_.jpg', 'MJLYphwF7AUcCZ6UfO5mwAantkaSKTCR15DMeoCIXj9Cfstefq', '41o5R1ZXWXL._SL800_.jpg');
INSERT INTO `image` VALUES ('41OA3AdVqzL._SL800_.jpg', 'YvyzyvYsvfRif624aTSMCuJ2V3zxD0adk27YaAwsAJ55lg5csO', '41OA3AdVqzL._SL800_.jpg');
INSERT INTO `image` VALUES ('41oaACDTn4L._SL800_.jpg', '8G9C5Qjjzjqwjs8Gn7IGRiKtksVHEGSM9ajE0sPvV3I72Y7Q4t', '41oaACDTn4L._SL800_.jpg');
INSERT INTO `image` VALUES ('41oaan7WEmL._SL800_.jpg', 'O4rCM3eOjwuTMJmmeKhkRsIzbDrz1OHiCf5CMkDAaDeGNN8D44', '41oaan7WEmL._SL800_.jpg');
INSERT INTO `image` VALUES ('41OkAAcxYeL._SL800_.jpg', 'YvyzyvYsvfRif624aTSMCuJ2V3zxD0adk27YaAwsAJ55lg5csO', '41OkAAcxYeL._SL800_.jpg');
INSERT INTO `image` VALUES ('41P8l0ffiPL._SL800_.jpg', '8G9C5Qjjzjqwjs8Gn7IGRiKtksVHEGSM9ajE0sPvV3I72Y7Q4t', '41P8l0ffiPL._SL800_.jpg');
INSERT INTO `image` VALUES ('41PCeQYsEwL._SL800_.jpg', '8PQVBwKQFmRaK73FxUmIRxPvzZIHa7UvSwzLPvGvlV3OlZ313p', '41PCeQYsEwL._SL800_.jpg');
INSERT INTO `image` VALUES ('41pHNW8kMwL._SL800_.jpg', 'JWNVQXEL9gOAeCqKXnrfl4kBOIcabeXIVPbqyXrShlNwcYmVm3', '41pHNW8kMwL._SL800_.jpg');
INSERT INTO `image` VALUES ('41Pn0mOEaKL._SL800_.jpg', 'SPtm6i9yBgVw3TVvKVGWfVqA8I9R0vjgWlZf8c14Kr1piKvVp9', '41Pn0mOEaKL._SL800_.jpg');
INSERT INTO `image` VALUES ('41PNuuK6RuL._SL800_.jpg', 'feGSVAImKpIeVD8DM1sb2QepPsLHdCv9d8q3yzhR5mA1taSXlM', '41PNuuK6RuL._SL800_.jpg');
INSERT INTO `image` VALUES ('41POia4V%2B8L._SL800_.jpg', 'qAutJ6uCpWZVjmFVQt3CG1Twzd0K195uxuUxk0z0ocv9idlXlR', '41POia4V%2B8L._SL800_.jpg');
INSERT INTO `image` VALUES ('41PSMIyX3CL._SL800_.jpg', 'su2pG2pPAbzSgCZKNA4p5DPecIXm9NZ98q805lQigKpNuzMExx', '41PSMIyX3CL._SL800_.jpg');
INSERT INTO `image` VALUES ('41psXPcGD4L._SL800_.jpg', 'Er1eGKkXszeQ0Xc0slsmCbZlCLO81RfurVHdnP5RqUIzrFOr6G', '41psXPcGD4L._SL800_.jpg');
INSERT INTO `image` VALUES ('41pVBL5ObxL._SL800_.jpg', 'mYJdthslRcjCE7SbE2BmKVFKFdQIrHXAA0C09bnWEHgN9yK8qM', '41pVBL5ObxL._SL800_.jpg');
INSERT INTO `image` VALUES ('41PxFLcGVBL._SL800_.jpg', 'mlbzDPP46B1eUDM2ZVbHLVcEGKIZblXX1wNLT7dm33gMgV7Akg', '41PxFLcGVBL._SL800_.jpg');
INSERT INTO `image` VALUES ('41py7dkyZ3L._SL800_.jpg', 'ZKp9N1xbfUrU3WNE2sXSp0iRNzr3Cu8kusaPOlhZnutq0FsC32', '41py7dkyZ3L._SL800_.jpg');
INSERT INTO `image` VALUES ('41pYmWKQxQL._SL800_.jpg', 'IBDfqtGXiI9rWPpb3WCVrorLVn5mDksQTj2dNFHCcmWUS2TTNE', '41pYmWKQxQL._SL800_.jpg');
INSERT INTO `image` VALUES ('41pyz8TKmCL._SL800_.jpg', 'q88Sb8tW8zZugmr4ej3eCWTCW5lJEmEFhWY8PjFxgZKWI95jRT', '41pyz8TKmCL._SL800_.jpg');
INSERT INTO `image` VALUES ('41q2D3Fc9ML._SL800_.jpg', 'JPtUSPUYDbYhzu9n2YbCWOxMxTgR8DUoFG0IUyANsNGwIMZOsc', '41q2D3Fc9ML._SL800_.jpg');
INSERT INTO `image` VALUES ('41q3rtLOtvL._SL800_.jpg', 'O4rCM3eOjwuTMJmmeKhkRsIzbDrz1OHiCf5CMkDAaDeGNN8D44', '41q3rtLOtvL._SL800_.jpg');
INSERT INTO `image` VALUES ('41QaHeQOnDL._SL800_.jpg', 'HXkpBZd3Uv9nQ3H60l4aE9SxitZIHyuga9LamKF8o7X2zoQHCs', '41QaHeQOnDL._SL800_.jpg');
INSERT INTO `image` VALUES ('41QGh0XU1NL._SL800_.jpg', '3kNzVVb8oE5v4Sg1ZTS2srHP6imrICgOE5ljruRMpT3evH1Pwq', '41QGh0XU1NL._SL800_.jpg');
INSERT INTO `image` VALUES ('41qhFj05tuL._SL800_.jpg', 'R06uYNy8frA9aoCsm6qkY2QHK5y7OKOOPB8wi0OXmDltJXVnuk', '41qhFj05tuL._SL800_.jpg');
INSERT INTO `image` VALUES ('41QK8-vJ5OL._SL800_.jpg', '0QZFNSuCMq1hkicfw5k80vXrK8I6mCq0oOj78zaHnQcVqfm4CO', '41QK8-vJ5OL._SL800_.jpg');
INSERT INTO `image` VALUES ('41qnl9aifuL._SL800_.jpg', 'ULvD3UeNCioB6rnu9bDafzRxe8eNayUEObLtXgNrhH9C0wnWwy', '41qnl9aifuL._SL800_.jpg');
INSERT INTO `image` VALUES ('41qoKpvK%2BDL._SL800_.jpg', '1TBSWxxMKvZkqFySSsIWbiEDYKjARaY8aS33LKAWDbrCfA3Evx', '41qoKpvK%2BDL._SL800_.jpg');
INSERT INTO `image` VALUES ('41QV44zbhaL._SL800_.jpg', '9iGfVWRmILzaDJMCtV8lRklOmrNZ8tl0m9HWMzjPOsMHC2MxpR', '41QV44zbhaL._SL800_.jpg');
INSERT INTO `image` VALUES ('41qVm1E5BbL._SL800_.jpg', 'VdJCPNFJUGNdHs5DZCbYyLd8ER2sOlBT4SJfmKttVhDT2MrHdH', '41qVm1E5BbL._SL800_.jpg');
INSERT INTO `image` VALUES ('41r-UZwUJsL._SL800_.jpg', 'Y2uYku0Ee3584MBb715zkQu48GEq161SL2UB4uBn38MKWC2ta2', '41r-UZwUJsL._SL800_.jpg');
INSERT INTO `image` VALUES ('41R1xzY8TcL._SL800_.jpg', '7bY84jMVf7WqqwyxAc0FgMu9EvoWNT6XIuqELhrLUtY4jwDYR2', '41R1xzY8TcL._SL800_.jpg');
INSERT INTO `image` VALUES ('41Ra0q6LWnL._SL800_.jpg', '3kNzVVb8oE5v4Sg1ZTS2srHP6imrICgOE5ljruRMpT3evH1Pwq', '41Ra0q6LWnL._SL800_.jpg');
INSERT INTO `image` VALUES ('41RCyhjmKQL._SL800_.jpg', 'O10N1NCuzP5fVqgpPoVisS31uhPhnUp09cnzB317RJ7vfCnKi8', '41RCyhjmKQL._SL800_.jpg');
INSERT INTO `image` VALUES ('41RE0HhxOsL._SL800_.jpg', 'mYJdthslRcjCE7SbE2BmKVFKFdQIrHXAA0C09bnWEHgN9yK8qM', '41RE0HhxOsL._SL800_.jpg');
INSERT INTO `image` VALUES ('41rj2RuC64L._SL800_.jpg', 'r364fXfGbzWogTocIMhqJlQyIJpZCqDWbDHNvOWT8nQpyYefCZ', '41rj2RuC64L._SL800_.jpg');
INSERT INTO `image` VALUES ('41rKMWKBaPL._SL800_.jpg', '5Y7ASlpceeoyy3Hiwrjy2ahUGW4hTXZJHgy8CRen4TKvfgMbsI', '41rKMWKBaPL._SL800_.jpg');
INSERT INTO `image` VALUES ('41rmMYMHm3L._SL800_.jpg', '7ozKi2BdO6cJyDQO6GRB4veRePAgqvkbbwqOChcTjY3FSBDaKr', '41rmMYMHm3L._SL800_.jpg');
INSERT INTO `image` VALUES ('41RrtSOQGYL._SL800_.jpg', 'Eu80KHwVCOiBHHIK6Isrsr9zK7DY6RF8dFIors6IZdMAEENKI6', '41RrtSOQGYL._SL800_.jpg');
INSERT INTO `image` VALUES ('41rwKfVYTcL._SL800_.jpg', 'q88Sb8tW8zZugmr4ej3eCWTCW5lJEmEFhWY8PjFxgZKWI95jRT', '41rwKfVYTcL._SL800_.jpg');
INSERT INTO `image` VALUES ('41RxJc1xvKL._SL800_.jpg', 'Q9LKqlzxnOUDzndPjCCpjI8eZVA7zfx0UNynW6pR9ULJGyUlXJ', '41RxJc1xvKL._SL800_.jpg');
INSERT INTO `image` VALUES ('41RxpFlIvvL._SL800_.jpg', 'qQ8IoHnidTLLZqlYdrE2inX8m4fYWLo4yby8V9WweCCD6PvbFE', '41RxpFlIvvL._SL800_.jpg');
INSERT INTO `image` VALUES ('41rxU1p1csL._SL800_.jpg', '7S9siiiVpoO8D970BjSoDSzCHwi35FuAV3cPCueAP1FdyjAN3j', '41rxU1p1csL._SL800_.jpg');
INSERT INTO `image` VALUES ('41Sb5bMod%2BL._SL800_.jpg', 'feGSVAImKpIeVD8DM1sb2QepPsLHdCv9d8q3yzhR5mA1taSXlM', '41Sb5bMod%2BL._SL800_.jpg');
INSERT INTO `image` VALUES ('41sF4sn56FL._SL800_.jpg', 'xLplntwjWdEKPys1Cb0qIJU5EMsjfSLJNqWMqj1UbwRYIVIppv', '41sF4sn56FL._SL800_.jpg');
INSERT INTO `image` VALUES ('41she46n9eL._SL800_.jpg', 'QO5uG6dkdeVRAXQC2HRtKcusiBmLKzshtgtBfxsMQSdhdNgY6S', '41she46n9eL._SL800_.jpg');
INSERT INTO `image` VALUES ('41SixSmk%2BHL._SL800_.jpg', 'AQT2rRThhwhAMbXRL0H5MkSm9lh5moYXoOsi6RX7eJP1WEoXZE', '41SixSmk%2BHL._SL800_.jpg');
INSERT INTO `image` VALUES ('41Sl8lb%2BqlL._SL800_.jpg', 'JWNVQXEL9gOAeCqKXnrfl4kBOIcabeXIVPbqyXrShlNwcYmVm3', '41Sl8lb%2BqlL._SL800_.jpg');
INSERT INTO `image` VALUES ('41SlyHZ-tCL._SL800_.jpg', 'YvyzyvYsvfRif624aTSMCuJ2V3zxD0adk27YaAwsAJ55lg5csO', '41SlyHZ-tCL._SL800_.jpg');
INSERT INTO `image` VALUES ('41T3rbVwB%2BL._SL800_.jpg', 'Er1eGKkXszeQ0Xc0slsmCbZlCLO81RfurVHdnP5RqUIzrFOr6G', '41T3rbVwB%2BL._SL800_.jpg');
INSERT INTO `image` VALUES ('41TlhCe2a9L._SL800_.jpg', 'iRWOYs0BBbkOMyI51I3Wr8m2xaGxulsT2O2CDLTTJmz4q6sfhr', '41TlhCe2a9L._SL800_.jpg');
INSERT INTO `image` VALUES ('41TMFPsZn7L._SL800_.jpg', 'ukLmzqCIYvCvGNb56xbUTzsvGnqaJHVPPCzwJmh8jx6ldvAqg8', '41TMFPsZn7L._SL800_.jpg');
INSERT INTO `image` VALUES ('41toi%2BAFomL._SL800_.jpg', 'F2XHBkRR8aaLWHP3bL2o0PEXerLYMOAuabU1BbBKSKteb24Uja', '41toi%2BAFomL._SL800_.jpg');
INSERT INTO `image` VALUES ('41tovQm89jL._SL800_.jpg', 'hxi2vjcgrvpbNkxDWL2ipwXFfYQ4vAeawTidycBWWoN8Xw09lP', '41tovQm89jL._SL800_.jpg');
INSERT INTO `image` VALUES ('41tTMci8ZSL._SL800_.jpg', 'GNX9uuJbYCFd9i5hlqMVK0Yme2FSQtLVR6fzkB26h8779Jw6nP', '41tTMci8ZSL._SL800_.jpg');
INSERT INTO `image` VALUES ('41tWLYvFNIL._SL800_.jpg', 'ee0yArDSvm91HNnV1laIddNLrML0tSyxsNfOY4CCNBvQt7V7M9', '41tWLYvFNIL._SL800_.jpg');
INSERT INTO `image` VALUES ('41TWwlqWAQL._SL800_.jpg', '8G9C5Qjjzjqwjs8Gn7IGRiKtksVHEGSM9ajE0sPvV3I72Y7Q4t', '41TWwlqWAQL._SL800_.jpg');
INSERT INTO `image` VALUES ('41TxbaE0SsL._SL800_.jpg', 's9dy2Mg5clKFCVabG5blunf7bkSH3lpv6QuJ92j9L1XKilkrjo', '41TxbaE0SsL._SL800_.jpg');
INSERT INTO `image` VALUES ('41u1qo0jhpL._SL800_.jpg', 'EDxHhYPRmgK8idzRN9MCJ8xDP840k5XmgtPuV7IkYCloj1mOUf', '41u1qo0jhpL._SL800_.jpg');
INSERT INTO `image` VALUES ('41u2OxmblcL._SL800_.jpg', '20aioGh1x40ZZgwDhgOnegdC8dbZQ5czR1Rsjgk27ZD5j2ZGIJ', '41u2OxmblcL._SL800_.jpg');
INSERT INTO `image` VALUES ('41UJRrbZZAL._SL800_.jpg', 'xLplntwjWdEKPys1Cb0qIJU5EMsjfSLJNqWMqj1UbwRYIVIppv', '41UJRrbZZAL._SL800_.jpg');
INSERT INTO `image` VALUES ('41urgWRKJ-L._SL800_.jpg', 'siPTRsTlu99h5t7V6CO3Z17xdQKbWcA6ur39ogU7J1DYXsfVKl', '41urgWRKJ-L._SL800_.jpg');
INSERT INTO `image` VALUES ('41UW95F4KVL._SL800_.jpg', 'Hu8clX2mCoQ3muBt9gSNoKbeSOsrMNsreTtMIRKdtYQcB5Yhj3', '41UW95F4KVL._SL800_.jpg');
INSERT INTO `image` VALUES ('41v6WnshI8L._SL800_.jpg', 'VdJCPNFJUGNdHs5DZCbYyLd8ER2sOlBT4SJfmKttVhDT2MrHdH', '41v6WnshI8L._SL800_.jpg');
INSERT INTO `image` VALUES ('41VA1yxKjNL._SL800_.jpg', '7xkJnJlSUBdFltzMFvHBweNDQHVKOak6vOUmt8GkVIVqyOeyEH', '41VA1yxKjNL._SL800_.jpg');
INSERT INTO `image` VALUES ('41vb2%2BSHRTL._SL800_.jpg', 'mlbzDPP46B1eUDM2ZVbHLVcEGKIZblXX1wNLT7dm33gMgV7Akg', '41vb2%2BSHRTL._SL800_.jpg');
INSERT INTO `image` VALUES ('41vEaWrjFeL._SL800_.jpg', 'F2XHBkRR8aaLWHP3bL2o0PEXerLYMOAuabU1BbBKSKteb24Uja', '41vEaWrjFeL._SL800_.jpg');
INSERT INTO `image` VALUES ('41vTcGVvnRL._SL800_.jpg', 'R06uYNy8frA9aoCsm6qkY2QHK5y7OKOOPB8wi0OXmDltJXVnuk', '41vTcGVvnRL._SL800_.jpg');
INSERT INTO `image` VALUES ('41vVNPdNPkL._SL800_.jpg', 'kFZKrcFaJFz9XQplxhOdqnaIyUk46TZKC7PrUTVbb8Ndwz4Dhp', '41vVNPdNPkL._SL800_.jpg');
INSERT INTO `image` VALUES ('41vZ4XC0ZBL._SL800_.jpg', 'qAutJ6uCpWZVjmFVQt3CG1Twzd0K195uxuUxk0z0ocv9idlXlR', '41vZ4XC0ZBL._SL800_.jpg');
INSERT INTO `image` VALUES ('41w1rMYO9dL._SL800_.jpg', 'ruWJgQFViHDf5qqgg9o0kPXv3R955BCISBziVZmmLJYISWed9e', '41w1rMYO9dL._SL800_.jpg');
INSERT INTO `image` VALUES ('41wtsUcxq7L._SL800_.jpg', 'ApM6KvBcna0W3S3wZP0FZfpl61EeypHWO81VGTeGHkHo5IpivP', '41wtsUcxq7L._SL800_.jpg');
INSERT INTO `image` VALUES ('41X10KHXkyL._SL800_.jpg', 'ULvD3UeNCioB6rnu9bDafzRxe8eNayUEObLtXgNrhH9C0wnWwy', '41X10KHXkyL._SL800_.jpg');
INSERT INTO `image` VALUES ('41Xa4CPFlML._SL800_.jpg', 'ukLmzqCIYvCvGNb56xbUTzsvGnqaJHVPPCzwJmh8jx6ldvAqg8', '41Xa4CPFlML._SL800_.jpg');
INSERT INTO `image` VALUES ('41xLqHEuNSL._SL800_.jpg', 'YvyzyvYsvfRif624aTSMCuJ2V3zxD0adk27YaAwsAJ55lg5csO', '41xLqHEuNSL._SL800_.jpg');
INSERT INTO `image` VALUES ('41XpoNxVgJL._SL800_.jpg', 'Hu8clX2mCoQ3muBt9gSNoKbeSOsrMNsreTtMIRKdtYQcB5Yhj3', '41XpoNxVgJL._SL800_.jpg');
INSERT INTO `image` VALUES ('41y-xRK47%2BL._SL800_.jpg', '7bY84jMVf7WqqwyxAc0FgMu9EvoWNT6XIuqELhrLUtY4jwDYR2', '41y-xRK47%2BL._SL800_.jpg');
INSERT INTO `image` VALUES ('41Y2eLMmOAL._SL800_.jpg', '0QZFNSuCMq1hkicfw5k80vXrK8I6mCq0oOj78zaHnQcVqfm4CO', '41Y2eLMmOAL._SL800_.jpg');
INSERT INTO `image` VALUES ('41Y9lGwsEWL._SL800_.jpg', 'LYFnk7WkNXP3VIP6sAd8AszpPI3EHxspE1p09dFD7tcBfmtOU0', '41Y9lGwsEWL._SL800_.jpg');
INSERT INTO `image` VALUES ('41YaZUCw9cL._SL800_.jpg', 'zWVKdgZkQhRgXfM1Mj7aPbARqMHYYvqZAiynNr9bGqQSucRL65', '41YaZUCw9cL._SL800_.jpg');
INSERT INTO `image` VALUES ('41yfm7FVfdL._SL800_.jpg', '9iGfVWRmILzaDJMCtV8lRklOmrNZ8tl0m9HWMzjPOsMHC2MxpR', '41yfm7FVfdL._SL800_.jpg');
INSERT INTO `image` VALUES ('41YHc8QpEsL._SL800_.jpg', 'YvyzyvYsvfRif624aTSMCuJ2V3zxD0adk27YaAwsAJ55lg5csO', '41YHc8QpEsL._SL800_.jpg');
INSERT INTO `image` VALUES ('41YIkfHa-HL._SL800_.jpg', '0gQ9rZ5pBvZaKrxLcuFNwJdnnvF1AW2z3g1bwYfR6qFQTb8gSb', '41YIkfHa-HL._SL800_.jpg');
INSERT INTO `image` VALUES ('41YmgmcSfuL._SL800_.jpg', '7bY84jMVf7WqqwyxAc0FgMu9EvoWNT6XIuqELhrLUtY4jwDYR2', '41YmgmcSfuL._SL800_.jpg');
INSERT INTO `image` VALUES ('41Yv4BJ9zyL._SL800_.jpg', 'r364fXfGbzWogTocIMhqJlQyIJpZCqDWbDHNvOWT8nQpyYefCZ', '41Yv4BJ9zyL._SL800_.jpg');
INSERT INTO `image` VALUES ('41YzD40CcDL._SL800_.jpg', 'ZKp9N1xbfUrU3WNE2sXSp0iRNzr3Cu8kusaPOlhZnutq0FsC32', '41YzD40CcDL._SL800_.jpg');
INSERT INTO `image` VALUES ('41z-T9BxDzL._SL800_.jpg', 'LfnUEcwpeY3VE2i81YaVXNN44Bsq1epN7wSZdJDDdcPCd3lcOX', '41z-T9BxDzL._SL800_.jpg');
INSERT INTO `image` VALUES ('41z6UzPGAgL._SL800_.jpg', 'cxIuVx1SXv9xCALCfyuUHXPaeMzEXh5ClrnVQx8SqM054PY6j7', '41z6UzPGAgL._SL800_.jpg');
INSERT INTO `image` VALUES ('41ZC%2BUsLwbL._SL800_.jpg', 'rAudXN3o5eMLaxxv4jk2VFji2zUFrpu7o0pJIuebc0ZEiVs6Rd', '41ZC%2BUsLwbL._SL800_.jpg');
INSERT INTO `image` VALUES ('41zCdZ7Cd7L._SL800_.jpg', 'Er1eGKkXszeQ0Xc0slsmCbZlCLO81RfurVHdnP5RqUIzrFOr6G', '41zCdZ7Cd7L._SL800_.jpg');
INSERT INTO `image` VALUES ('41zJ2a16gkL._SL800_.jpg', '7bY84jMVf7WqqwyxAc0FgMu9EvoWNT6XIuqELhrLUtY4jwDYR2', '41zJ2a16gkL._SL800_.jpg');
INSERT INTO `image` VALUES ('41zK6w8Sc6L._SL800_.jpg', 'B9akHWaZRUjCb2D8sANQxlEmbCGwxTnRi3aeGitlI7YHvaFHGa', '41zK6w8Sc6L._SL800_.jpg');
INSERT INTO `image` VALUES ('41zKULxzumL._SL800_.jpg', 'SPtm6i9yBgVw3TVvKVGWfVqA8I9R0vjgWlZf8c14Kr1piKvVp9', '41zKULxzumL._SL800_.jpg');
INSERT INTO `image` VALUES ('41Zn1KZaFLL._SL800_.jpg', '4T5jH74YXyeq7sbcK9gjWc1yGagMiFB7yMThIB8hCCecKA0bmW', '41Zn1KZaFLL._SL800_.jpg');
INSERT INTO `image` VALUES ('51%2BakXTOvmL._SL800_.jpg', 'D7gojFukZqhJfoWosEkTWRhDUdyhX67cg5PRe4NDINqJZY8Krq', '51%2BakXTOvmL._SL800_.jpg');
INSERT INTO `image` VALUES ('510KAiART9L._SL800_.jpg', 'UrCSUcPk9MvHe7lVJt1hji4KkdW3m1M2FPd1h7W8262VxZmnKl', '510KAiART9L._SL800_.jpg');
INSERT INTO `image` VALUES ('511%2BsnC2sQL._SL800_.jpg', 'cXMZpCvDQDWO6uNnKFPQKsIqMqIMbrAPJ0xWjSoqwW9F2sREC3', '511%2BsnC2sQL._SL800_.jpg');
INSERT INTO `image` VALUES ('5117hEuwozL._SL800_.jpg', 'JWNVQXEL9gOAeCqKXnrfl4kBOIcabeXIVPbqyXrShlNwcYmVm3', '5117hEuwozL._SL800_.jpg');
INSERT INTO `image` VALUES ('51290pL8%2BhL._SL800_.jpg', 'cXMZpCvDQDWO6uNnKFPQKsIqMqIMbrAPJ0xWjSoqwW9F2sREC3', '51290pL8%2BhL._SL800_.jpg');
INSERT INTO `image` VALUES ('5134DuQCDDL._SL800_.jpg', 'ZKp9N1xbfUrU3WNE2sXSp0iRNzr3Cu8kusaPOlhZnutq0FsC32', '5134DuQCDDL._SL800_.jpg');
INSERT INTO `image` VALUES ('514pr8QhYTL._SL800_.jpg', 'mlbzDPP46B1eUDM2ZVbHLVcEGKIZblXX1wNLT7dm33gMgV7Akg', '514pr8QhYTL._SL800_.jpg');
INSERT INTO `image` VALUES ('514TwM9-gDL._SL800_.jpg', 'rAudXN3o5eMLaxxv4jk2VFji2zUFrpu7o0pJIuebc0ZEiVs6Rd', '514TwM9-gDL._SL800_.jpg');
INSERT INTO `image` VALUES ('514YLR5M75L._SL800_.jpg', 's9dy2Mg5clKFCVabG5blunf7bkSH3lpv6QuJ92j9L1XKilkrjo', '514YLR5M75L._SL800_.jpg');
INSERT INTO `image` VALUES ('515A1RyGmwL._SL800_.jpg', 'FnlpuSAoXbQNmD8O7Z2U1E7XMFY4BiRjumIG0VIRxmZydNxxAQ', '515A1RyGmwL._SL800_.jpg');
INSERT INTO `image` VALUES ('516fhF952ZL._SL800_.jpg', 'B9akHWaZRUjCb2D8sANQxlEmbCGwxTnRi3aeGitlI7YHvaFHGa', '516fhF952ZL._SL800_.jpg');
INSERT INTO `image` VALUES ('516h40V7ByL._SL800_.jpg', 'nq7m8booWhUTQ2BKz2BY7KUbjBb6Eus0WtfNwCvrJUcCYtqDgl', '516h40V7ByL._SL800_.jpg');
INSERT INTO `image` VALUES ('516q1A5k1cL._SL800_.jpg', 'Bmh3rUYVn3eQbj9St6VTIyvJPnuEErZTZBfr40FnNZRGXz9wS1', '516q1A5k1cL._SL800_.jpg');
INSERT INTO `image` VALUES ('517aN9KziOL._SL800_.jpg', '2XA5OJkcCLUmQb5UbWOHWNQ3G7tdIz7co5hWfpkqmNguobEcGg', '517aN9KziOL._SL800_.jpg');
INSERT INTO `image` VALUES ('517fZSseyqL._SL800_.jpg', 'PyllyxxQBdNXo4lqIep3eMjz31dYGtwkDnrBSyyz6jaXlF7HHV', '517fZSseyqL._SL800_.jpg');
INSERT INTO `image` VALUES ('518gqY3rvjL._SL800_.jpg', 'ZSKvlrIqU7oQsM2z0GvWBYCVAElOqvz1nzet6fwJP04OnLS69n', '518gqY3rvjL._SL800_.jpg');
INSERT INTO `image` VALUES ('518J0M3SIML._SL800_.jpg', 'u07I4yP6owFd2DFQiob6RWhEAzQzcTmmHDT2GmQDchUk1VbOzU', '518J0M3SIML._SL800_.jpg');
INSERT INTO `image` VALUES ('518mE4zdJ7L._SL800_.jpg', 'Bmh3rUYVn3eQbj9St6VTIyvJPnuEErZTZBfr40FnNZRGXz9wS1', '518mE4zdJ7L._SL800_.jpg');
INSERT INTO `image` VALUES ('519muKuDpWL._SL800_.jpg', 'qQ8IoHnidTLLZqlYdrE2inX8m4fYWLo4yby8V9WweCCD6PvbFE', '519muKuDpWL._SL800_.jpg');
INSERT INTO `image` VALUES ('51AApM9ZePL._SL800_.jpg', 'XXPJG0U2t8QjnAjDFoAqH1rEcSofM55WByxNxz9mKaCvdFNoke', '51AApM9ZePL._SL800_.jpg');
INSERT INTO `image` VALUES ('51acH4ddwzL._SL800_.jpg', 'HXkpBZd3Uv9nQ3H60l4aE9SxitZIHyuga9LamKF8o7X2zoQHCs', '51acH4ddwzL._SL800_.jpg');
INSERT INTO `image` VALUES ('51b4N%2Bek0uL._SL800_.jpg', 'F2XHBkRR8aaLWHP3bL2o0PEXerLYMOAuabU1BbBKSKteb24Uja', '51b4N%2Bek0uL._SL800_.jpg');
INSERT INTO `image` VALUES ('51BouNOFQdL._SL800_.jpg', 'nhO8efiznB92GAOxLSlONVa7PDmDGOGo7htP6KvmMFDHsCMsOL', '51BouNOFQdL._SL800_.jpg');
INSERT INTO `image` VALUES ('51BswEM3zoL._SL800_.jpg', 'LfnUEcwpeY3VE2i81YaVXNN44Bsq1epN7wSZdJDDdcPCd3lcOX', '51BswEM3zoL._SL800_.jpg');
INSERT INTO `image` VALUES ('51bWdXqoykL._SL800_.jpg', 'ZKp9N1xbfUrU3WNE2sXSp0iRNzr3Cu8kusaPOlhZnutq0FsC32', '51bWdXqoykL._SL800_.jpg');
INSERT INTO `image` VALUES ('51C-zkuBGAL._SL800_.jpg', 'L8UORrOn9hHtU3zxKnzwiAcPJnLJfdp1QGOMYucLUwqFUSvWEC', '51C-zkuBGAL._SL800_.jpg');
INSERT INTO `image` VALUES ('51ccCess8YL._SL800_.jpg', 'WIfDhrG0Zt9o5vxej5DyRfDajtSp9KFenyySnxie5N6yt7X282', '51ccCess8YL._SL800_.jpg');
INSERT INTO `image` VALUES ('51chu-e3EUL._SL800_.jpg', 'qQ8IoHnidTLLZqlYdrE2inX8m4fYWLo4yby8V9WweCCD6PvbFE', '51chu-e3EUL._SL800_.jpg');
INSERT INTO `image` VALUES ('51cIszNnarL._SL800_.jpg', 'mlbzDPP46B1eUDM2ZVbHLVcEGKIZblXX1wNLT7dm33gMgV7Akg', '51cIszNnarL._SL800_.jpg');
INSERT INTO `image` VALUES ('51CjoBdkF1L._SL800_.jpg', 'SWrE3ztIrSk2jukqzAHYk75beLA1i5CCvS9frcuRBbTLMytSMO', '51CjoBdkF1L._SL800_.jpg');
INSERT INTO `image` VALUES ('51cQd-rJNML._SL800_.jpg', 'ApM6KvBcna0W3S3wZP0FZfpl61EeypHWO81VGTeGHkHo5IpivP', '51cQd-rJNML._SL800_.jpg');
INSERT INTO `image` VALUES ('51CsZIanNIL._SL800_.jpg', 'Bmh3rUYVn3eQbj9St6VTIyvJPnuEErZTZBfr40FnNZRGXz9wS1', '51CsZIanNIL._SL800_.jpg');
INSERT INTO `image` VALUES ('51D1RVi2-1L._SL800_.jpg', 'Bmh3rUYVn3eQbj9St6VTIyvJPnuEErZTZBfr40FnNZRGXz9wS1', '51D1RVi2-1L._SL800_.jpg');
INSERT INTO `image` VALUES ('51Dnt0W3e9L._SL800_.jpg', 'QlYnljOGYZPOeGQcv2xfDtsUdhfnF5ROFIuTGNS8Gjez9xevrp', '51Dnt0W3e9L._SL800_.jpg');
INSERT INTO `image` VALUES ('51du1y3NYiL._SL800_.jpg', 'r364fXfGbzWogTocIMhqJlQyIJpZCqDWbDHNvOWT8nQpyYefCZ', '51du1y3NYiL._SL800_.jpg');
INSERT INTO `image` VALUES ('51e-ZDXG-pL._SL800_.jpg', 'cxIuVx1SXv9xCALCfyuUHXPaeMzEXh5ClrnVQx8SqM054PY6j7', '51e-ZDXG-pL._SL800_.jpg');
INSERT INTO `image` VALUES ('51ehz5rtXgL._SL800_.jpg', 'u07I4yP6owFd2DFQiob6RWhEAzQzcTmmHDT2GmQDchUk1VbOzU', '51ehz5rtXgL._SL800_.jpg');
INSERT INTO `image` VALUES ('51EI1V9u3JL._SL800_.jpg', 'kFZKrcFaJFz9XQplxhOdqnaIyUk46TZKC7PrUTVbb8Ndwz4Dhp', '51EI1V9u3JL._SL800_.jpg');
INSERT INTO `image` VALUES ('51EjYLWXPUL._SL800_.jpg', '7bY84jMVf7WqqwyxAc0FgMu9EvoWNT6XIuqELhrLUtY4jwDYR2', '51EjYLWXPUL._SL800_.jpg');
INSERT INTO `image` VALUES ('51elY0NE71L._SL800_.jpg', 'WIfDhrG0Zt9o5vxej5DyRfDajtSp9KFenyySnxie5N6yt7X282', '51elY0NE71L._SL800_.jpg');
INSERT INTO `image` VALUES ('51ER5A1u-uL._SL800_.jpg', 'LfnUEcwpeY3VE2i81YaVXNN44Bsq1epN7wSZdJDDdcPCd3lcOX', '51ER5A1u-uL._SL800_.jpg');
INSERT INTO `image` VALUES ('51fXzOPJETL._SL800_.jpg', 'bzSaO6kGM8cj3lAP8UAjN7WdCkSoZ7L5OsR2OqSYD1t0e7hWIO', '51fXzOPJETL._SL800_.jpg');
INSERT INTO `image` VALUES ('51gavCHjyXL._SL800_.jpg', 'ZSKvlrIqU7oQsM2z0GvWBYCVAElOqvz1nzet6fwJP04OnLS69n', '51gavCHjyXL._SL800_.jpg');
INSERT INTO `image` VALUES ('51gfSjLe8IL._SL800_.jpg', 'ee0yArDSvm91HNnV1laIddNLrML0tSyxsNfOY4CCNBvQt7V7M9', '51gfSjLe8IL._SL800_.jpg');
INSERT INTO `image` VALUES ('51GGw6kuyFL._SL800_.jpg', 's9dy2Mg5clKFCVabG5blunf7bkSH3lpv6QuJ92j9L1XKilkrjo', '51GGw6kuyFL._SL800_.jpg');
INSERT INTO `image` VALUES ('51gHQjB%2BJ7L._SL800_.jpg', 'mYJdthslRcjCE7SbE2BmKVFKFdQIrHXAA0C09bnWEHgN9yK8qM', '51gHQjB%2BJ7L._SL800_.jpg');
INSERT INTO `image` VALUES ('51gMAXjN9LL._SL800_.jpg', 'JWNVQXEL9gOAeCqKXnrfl4kBOIcabeXIVPbqyXrShlNwcYmVm3', '51gMAXjN9LL._SL800_.jpg');
INSERT INTO `image` VALUES ('51gT3DjqLZL._SL800_.jpg', 'Eu80KHwVCOiBHHIK6Isrsr9zK7DY6RF8dFIors6IZdMAEENKI6', '51gT3DjqLZL._SL800_.jpg');
INSERT INTO `image` VALUES ('51gZDcNH3vL._SL800_.jpg', 'ZSKvlrIqU7oQsM2z0GvWBYCVAElOqvz1nzet6fwJP04OnLS69n', '51gZDcNH3vL._SL800_.jpg');
INSERT INTO `image` VALUES ('51HhJCse0SL._SL800_.jpg', 'IE7JcRhMgqO4bHwYKqVWKjKGjSUUJ2LlzEXwSUff2Xi22QBf4f', '51HhJCse0SL._SL800_.jpg');
INSERT INTO `image` VALUES ('51HNKrTgj%2BL._SL800_.jpg', 'feGSVAImKpIeVD8DM1sb2QepPsLHdCv9d8q3yzhR5mA1taSXlM', '51HNKrTgj%2BL._SL800_.jpg');
INSERT INTO `image` VALUES ('51hW2eRDdUL._SL800_.jpg', 'mlbzDPP46B1eUDM2ZVbHLVcEGKIZblXX1wNLT7dm33gMgV7Akg', '51hW2eRDdUL._SL800_.jpg');
INSERT INTO `image` VALUES ('51i0IWOKk1L._SL800_.jpg', 'nhO8efiznB92GAOxLSlONVa7PDmDGOGo7htP6KvmMFDHsCMsOL', '51i0IWOKk1L._SL800_.jpg');
INSERT INTO `image` VALUES ('51iAp2d-QfL._SL800_.jpg', 'rAudXN3o5eMLaxxv4jk2VFji2zUFrpu7o0pJIuebc0ZEiVs6Rd', '51iAp2d-QfL._SL800_.jpg');
INSERT INTO `image` VALUES ('51Im7pBxMWL._SL800_.jpg', 'q88Sb8tW8zZugmr4ej3eCWTCW5lJEmEFhWY8PjFxgZKWI95jRT', '51Im7pBxMWL._SL800_.jpg');
INSERT INTO `image` VALUES ('51iVIz9QRwL._SL800_.jpg', 'hxi2vjcgrvpbNkxDWL2ipwXFfYQ4vAeawTidycBWWoN8Xw09lP', '51iVIz9QRwL._SL800_.jpg');
INSERT INTO `image` VALUES ('51JeM2e6ulL._SL800_.jpg', 'siPTRsTlu99h5t7V6CO3Z17xdQKbWcA6ur39ogU7J1DYXsfVKl', '51JeM2e6ulL._SL800_.jpg');
INSERT INTO `image` VALUES ('51jHLT7rD3L._SL800_.jpg', 'L8UORrOn9hHtU3zxKnzwiAcPJnLJfdp1QGOMYucLUwqFUSvWEC', '51jHLT7rD3L._SL800_.jpg');
INSERT INTO `image` VALUES ('51jTKf6NHGL._SL800_.jpg', 'hIRKHMPa8xT0Pmdli6zzDC0m8Cr1tOXjkbUvLbwH0b2cXpVZGk', '51jTKf6NHGL._SL800_.jpg');
INSERT INTO `image` VALUES ('51JycVydDiL._SL800_.jpg', '2XA5OJkcCLUmQb5UbWOHWNQ3G7tdIz7co5hWfpkqmNguobEcGg', '51JycVydDiL._SL800_.jpg');
INSERT INTO `image` VALUES ('51JZKO0blML._SL800_.jpg', 'FnlpuSAoXbQNmD8O7Z2U1E7XMFY4BiRjumIG0VIRxmZydNxxAQ', '51JZKO0blML._SL800_.jpg');
INSERT INTO `image` VALUES ('51Kh0fDu11L._SL800_.jpg', 'L8UORrOn9hHtU3zxKnzwiAcPJnLJfdp1QGOMYucLUwqFUSvWEC', '51Kh0fDu11L._SL800_.jpg');
INSERT INTO `image` VALUES ('51kmimkhegL._SL800_.jpg', 'LfnUEcwpeY3VE2i81YaVXNN44Bsq1epN7wSZdJDDdcPCd3lcOX', '51kmimkhegL._SL800_.jpg');
INSERT INTO `image` VALUES ('51knaSxkZEL._SL800_.jpg', '5WR9uj8SsE7LEZbJsQz8EkrhvgzC2KSzncMMeRHKSe7FzZiszV', '51knaSxkZEL._SL800_.jpg');
INSERT INTO `image` VALUES ('51KTQwxpzRL._SL800_.jpg', 'qQ8IoHnidTLLZqlYdrE2inX8m4fYWLo4yby8V9WweCCD6PvbFE', '51KTQwxpzRL._SL800_.jpg');
INSERT INTO `image` VALUES ('51kTTYAlD5L._SL800_.jpg', 'rAudXN3o5eMLaxxv4jk2VFji2zUFrpu7o0pJIuebc0ZEiVs6Rd', '51kTTYAlD5L._SL800_.jpg');
INSERT INTO `image` VALUES ('51kUJVUGQzL._SL800_.jpg', 'kFZKrcFaJFz9XQplxhOdqnaIyUk46TZKC7PrUTVbb8Ndwz4Dhp', '51kUJVUGQzL._SL800_.jpg');
INSERT INTO `image` VALUES ('51Lj5WiKu%2BL._SL800_.jpg', 'ruWJgQFViHDf5qqgg9o0kPXv3R955BCISBziVZmmLJYISWed9e', '51Lj5WiKu%2BL._SL800_.jpg');
INSERT INTO `image` VALUES ('51lmEjDfnXL._SL800_.jpg', 'ZKp9N1xbfUrU3WNE2sXSp0iRNzr3Cu8kusaPOlhZnutq0FsC32', '51lmEjDfnXL._SL800_.jpg');
INSERT INTO `image` VALUES ('51lNoNNZ03L._SL800_.jpg', 'hIRKHMPa8xT0Pmdli6zzDC0m8Cr1tOXjkbUvLbwH0b2cXpVZGk', '51lNoNNZ03L._SL800_.jpg');
INSERT INTO `image` VALUES ('51m03DZjj3L._SL800_.jpg', '9iGfVWRmILzaDJMCtV8lRklOmrNZ8tl0m9HWMzjPOsMHC2MxpR', '51m03DZjj3L._SL800_.jpg');
INSERT INTO `image` VALUES ('51M277Kn2YL._SL800_.jpg', 'LfnUEcwpeY3VE2i81YaVXNN44Bsq1epN7wSZdJDDdcPCd3lcOX', '51M277Kn2YL._SL800_.jpg');
INSERT INTO `image` VALUES ('51MlNYm4ceL._SL800_.jpg', 'siPTRsTlu99h5t7V6CO3Z17xdQKbWcA6ur39ogU7J1DYXsfVKl', '51MlNYm4ceL._SL800_.jpg');
INSERT INTO `image` VALUES ('51Mnfj0wnPL._SL800_.jpg', 'ApM6KvBcna0W3S3wZP0FZfpl61EeypHWO81VGTeGHkHo5IpivP', '51Mnfj0wnPL._SL800_.jpg');
INSERT INTO `image` VALUES ('51mwO7FC7bL._SL800_.jpg', '8PQVBwKQFmRaK73FxUmIRxPvzZIHa7UvSwzLPvGvlV3OlZ313p', '51mwO7FC7bL._SL800_.jpg');
INSERT INTO `image` VALUES ('51n2604EOEL._SL800_.jpg', '8G9C5Qjjzjqwjs8Gn7IGRiKtksVHEGSM9ajE0sPvV3I72Y7Q4t', '51n2604EOEL._SL800_.jpg');
INSERT INTO `image` VALUES ('51n3azHKUqL._SL800_.jpg', 'B9akHWaZRUjCb2D8sANQxlEmbCGwxTnRi3aeGitlI7YHvaFHGa', '51n3azHKUqL._SL800_.jpg');
INSERT INTO `image` VALUES ('51npy57EpbL._SL800_.jpg', 'ukLmzqCIYvCvGNb56xbUTzsvGnqaJHVPPCzwJmh8jx6ldvAqg8', '51npy57EpbL._SL800_.jpg');
INSERT INTO `image` VALUES ('51nXBmnlQmL._SL800_.jpg', 'MJLYphwF7AUcCZ6UfO5mwAantkaSKTCR15DMeoCIXj9Cfstefq', '51nXBmnlQmL._SL800_.jpg');
INSERT INTO `image` VALUES ('51NXCBNGV7L._SL800_.jpg', 'XXPJG0U2t8QjnAjDFoAqH1rEcSofM55WByxNxz9mKaCvdFNoke', '51NXCBNGV7L._SL800_.jpg');
INSERT INTO `image` VALUES ('51NZkDUPeVL._SL800_.jpg', 'Eu80KHwVCOiBHHIK6Isrsr9zK7DY6RF8dFIors6IZdMAEENKI6', '51NZkDUPeVL._SL800_.jpg');
INSERT INTO `image` VALUES ('51o91zTSzCL._SL800_.jpg', 'udZj8AiZfOTxSUtAcupcILqKpJLiuFYoYgXxUn7wlzLbBhU4n7', '51o91zTSzCL._SL800_.jpg');
INSERT INTO `image` VALUES ('51o9hjMkFfL._SL800_.jpg', 'siPTRsTlu99h5t7V6CO3Z17xdQKbWcA6ur39ogU7J1DYXsfVKl', '51o9hjMkFfL._SL800_.jpg');
INSERT INTO `image` VALUES ('51ohEXr%2BBCL._SL800_.jpg', 'A9VaXTrSMIgw62zDryWL1fLdCN2zEZpfQnaCgbm5hiXxVrEyRU', '51ohEXr%2BBCL._SL800_.jpg');
INSERT INTO `image` VALUES ('51ORb-6XNSL._SL800_.jpg', '1TBSWxxMKvZkqFySSsIWbiEDYKjARaY8aS33LKAWDbrCfA3Evx', '51ORb-6XNSL._SL800_.jpg');
INSERT INTO `image` VALUES ('51OucS5B7kL._SL800_.jpg', 'mlbzDPP46B1eUDM2ZVbHLVcEGKIZblXX1wNLT7dm33gMgV7Akg', '51OucS5B7kL._SL800_.jpg');
INSERT INTO `image` VALUES ('51OUJlNrOAL._SL800_.jpg', 'IE7JcRhMgqO4bHwYKqVWKjKGjSUUJ2LlzEXwSUff2Xi22QBf4f', '51OUJlNrOAL._SL800_.jpg');
INSERT INTO `image` VALUES ('51oX1XGAd6L._SL800_.jpg', 'PyllyxxQBdNXo4lqIep3eMjz31dYGtwkDnrBSyyz6jaXlF7HHV', '51oX1XGAd6L._SL800_.jpg');
INSERT INTO `image` VALUES ('51P-BYNTq1L._SL800_.jpg', 'B9akHWaZRUjCb2D8sANQxlEmbCGwxTnRi3aeGitlI7YHvaFHGa', '51P-BYNTq1L._SL800_.jpg');
INSERT INTO `image` VALUES ('51p2AFCjqcL._SL800_.jpg', '8PQVBwKQFmRaK73FxUmIRxPvzZIHa7UvSwzLPvGvlV3OlZ313p', '51p2AFCjqcL._SL800_.jpg');
INSERT INTO `image` VALUES ('51PBctPLg4L._SL800_.jpg', 'PyllyxxQBdNXo4lqIep3eMjz31dYGtwkDnrBSyyz6jaXlF7HHV', '51PBctPLg4L._SL800_.jpg');
INSERT INTO `image` VALUES ('51pO%2BrHVkFL._SL800_.jpg', 'Bmh3rUYVn3eQbj9St6VTIyvJPnuEErZTZBfr40FnNZRGXz9wS1', '51pO%2BrHVkFL._SL800_.jpg');
INSERT INTO `image` VALUES ('51pQAwXPNxL._SL800_.jpg', 'HlyAgaJs2IlzSpg5RcGoTNlte6JQoGVXfsn9gnYWrX5U6xATjn', '51pQAwXPNxL._SL800_.jpg');
INSERT INTO `image` VALUES ('51PWylFl0DL._SL800_.jpg', 'ruWJgQFViHDf5qqgg9o0kPXv3R955BCISBziVZmmLJYISWed9e', '51PWylFl0DL._SL800_.jpg');
INSERT INTO `image` VALUES ('51QF53AfdXL._SL800_.jpg', '8G9C5Qjjzjqwjs8Gn7IGRiKtksVHEGSM9ajE0sPvV3I72Y7Q4t', '51QF53AfdXL._SL800_.jpg');
INSERT INTO `image` VALUES ('51Qkl%2BjgjML._SL800_.jpg', 'Y2uYku0Ee3584MBb715zkQu48GEq161SL2UB4uBn38MKWC2ta2', '51Qkl%2BjgjML._SL800_.jpg');
INSERT INTO `image` VALUES ('51qkLdXSB1L._SL800_.jpg', 'O4rCM3eOjwuTMJmmeKhkRsIzbDrz1OHiCf5CMkDAaDeGNN8D44', '51qkLdXSB1L._SL800_.jpg');
INSERT INTO `image` VALUES ('51Qo0RkoruL._SL800_.jpg', 'Xi8HgMZLdAPiisW3MSBR9ItuGEkFRhoSDxkuJIZMfgsbRiTuTm', '51Qo0RkoruL._SL800_.jpg');
INSERT INTO `image` VALUES ('51qOPQTMQJL._SL800_.jpg', '8G9C5Qjjzjqwjs8Gn7IGRiKtksVHEGSM9ajE0sPvV3I72Y7Q4t', '51qOPQTMQJL._SL800_.jpg');
INSERT INTO `image` VALUES ('51QZWptC4CL._SL800_.jpg', '7xkJnJlSUBdFltzMFvHBweNDQHVKOak6vOUmt8GkVIVqyOeyEH', '51QZWptC4CL._SL800_.jpg');
INSERT INTO `image` VALUES ('51rc4n4G9ZL._SL800_.jpg', 'Xi8HgMZLdAPiisW3MSBR9ItuGEkFRhoSDxkuJIZMfgsbRiTuTm', '51rc4n4G9ZL._SL800_.jpg');
INSERT INTO `image` VALUES ('51rclk-KASL._SL800_.jpg', 'FnlpuSAoXbQNmD8O7Z2U1E7XMFY4BiRjumIG0VIRxmZydNxxAQ', '51rclk-KASL._SL800_.jpg');
INSERT INTO `image` VALUES ('51rYAe9YvwL._SL800_.jpg', '9iGfVWRmILzaDJMCtV8lRklOmrNZ8tl0m9HWMzjPOsMHC2MxpR', '51rYAe9YvwL._SL800_.jpg');
INSERT INTO `image` VALUES ('51SEocDRReL._SL800_.jpg', 'hIRKHMPa8xT0Pmdli6zzDC0m8Cr1tOXjkbUvLbwH0b2cXpVZGk', '51SEocDRReL._SL800_.jpg');
INSERT INTO `image` VALUES ('51sfUs7EdDL._SL800_.jpg', 'ZSKvlrIqU7oQsM2z0GvWBYCVAElOqvz1nzet6fwJP04OnLS69n', '51sfUs7EdDL._SL800_.jpg');
INSERT INTO `image` VALUES ('51SLhDlywjL._SL800_.jpg', '20aioGh1x40ZZgwDhgOnegdC8dbZQ5czR1Rsjgk27ZD5j2ZGIJ', '51SLhDlywjL._SL800_.jpg');
INSERT INTO `image` VALUES ('51SRqLiOFtL._SL800_.jpg', 'su2pG2pPAbzSgCZKNA4p5DPecIXm9NZ98q805lQigKpNuzMExx', '51SRqLiOFtL._SL800_.jpg');
INSERT INTO `image` VALUES ('51sSFErIxeL._SL800_.jpg', 'ApM6KvBcna0W3S3wZP0FZfpl61EeypHWO81VGTeGHkHo5IpivP', '51sSFErIxeL._SL800_.jpg');
INSERT INTO `image` VALUES ('51sWgleXUBL._SL800_.jpg', 'JWNVQXEL9gOAeCqKXnrfl4kBOIcabeXIVPbqyXrShlNwcYmVm3', '51sWgleXUBL._SL800_.jpg');
INSERT INTO `image` VALUES ('51TeAsuczOL._SL800_.jpg', 'qQ8IoHnidTLLZqlYdrE2inX8m4fYWLo4yby8V9WweCCD6PvbFE', '51TeAsuczOL._SL800_.jpg');
INSERT INTO `image` VALUES ('51tlkxSyv6L._SL800_.jpg', 'ZSKvlrIqU7oQsM2z0GvWBYCVAElOqvz1nzet6fwJP04OnLS69n', '51tlkxSyv6L._SL800_.jpg');
INSERT INTO `image` VALUES ('51tYwB7nfQL._SL800_.jpg', '9iGfVWRmILzaDJMCtV8lRklOmrNZ8tl0m9HWMzjPOsMHC2MxpR', '51tYwB7nfQL._SL800_.jpg');
INSERT INTO `image` VALUES ('51u%2BiuJJfPL._SL800_.jpg', 'q88Sb8tW8zZugmr4ej3eCWTCW5lJEmEFhWY8PjFxgZKWI95jRT', '51u%2BiuJJfPL._SL800_.jpg');
INSERT INTO `image` VALUES ('51u4Hvpw4BL._SL800_.jpg', 'Bmh3rUYVn3eQbj9St6VTIyvJPnuEErZTZBfr40FnNZRGXz9wS1', '51u4Hvpw4BL._SL800_.jpg');
INSERT INTO `image` VALUES ('51UAQa6DyFL._SL800_.jpg', 'u07I4yP6owFd2DFQiob6RWhEAzQzcTmmHDT2GmQDchUk1VbOzU', '51UAQa6DyFL._SL800_.jpg');
INSERT INTO `image` VALUES ('51ucHqr8NGL._SL800_.jpg', 'xLplntwjWdEKPys1Cb0qIJU5EMsjfSLJNqWMqj1UbwRYIVIppv', '51ucHqr8NGL._SL800_.jpg');
INSERT INTO `image` VALUES ('51UX9jKVY5L._SL800_.jpg', 'MJLYphwF7AUcCZ6UfO5mwAantkaSKTCR15DMeoCIXj9Cfstefq', '51UX9jKVY5L._SL800_.jpg');
INSERT INTO `image` VALUES ('51v0pXqIxVL._SL800_.jpg', 'OKJucJbwCsekFCDjxt3mlqnuw1dEz2XwToFczzKOrLAKMrngxF', '51v0pXqIxVL._SL800_.jpg');
INSERT INTO `image` VALUES ('51v6wr3GzjL._SL800_.jpg', 'OKJucJbwCsekFCDjxt3mlqnuw1dEz2XwToFczzKOrLAKMrngxF', '51v6wr3GzjL._SL800_.jpg');
INSERT INTO `image` VALUES ('51vbYSd0FeL._SL800_.jpg', 'u07I4yP6owFd2DFQiob6RWhEAzQzcTmmHDT2GmQDchUk1VbOzU', '51vbYSd0FeL._SL800_.jpg');
INSERT INTO `image` VALUES ('51VkdbqhzwL._SL800_.jpg', '9iGfVWRmILzaDJMCtV8lRklOmrNZ8tl0m9HWMzjPOsMHC2MxpR', '51VkdbqhzwL._SL800_.jpg');
INSERT INTO `image` VALUES ('51vmFmGlmjL._SL800_.jpg', 's9dy2Mg5clKFCVabG5blunf7bkSH3lpv6QuJ92j9L1XKilkrjo', '51vmFmGlmjL._SL800_.jpg');
INSERT INTO `image` VALUES ('51vw1C5JZxL._SL800_.jpg', 'kFZKrcFaJFz9XQplxhOdqnaIyUk46TZKC7PrUTVbb8Ndwz4Dhp', '51vw1C5JZxL._SL800_.jpg');
INSERT INTO `image` VALUES ('51w0MJYAjBL._SL800_.jpg', 'JWNVQXEL9gOAeCqKXnrfl4kBOIcabeXIVPbqyXrShlNwcYmVm3', '51w0MJYAjBL._SL800_.jpg');
INSERT INTO `image` VALUES ('51W3sAhU3IL._SL800_.jpg', 'cxIuVx1SXv9xCALCfyuUHXPaeMzEXh5ClrnVQx8SqM054PY6j7', '51W3sAhU3IL._SL800_.jpg');
INSERT INTO `image` VALUES ('51wi32SJZ7L._SL800_.jpg', 'nhO8efiznB92GAOxLSlONVa7PDmDGOGo7htP6KvmMFDHsCMsOL', '51wi32SJZ7L._SL800_.jpg');
INSERT INTO `image` VALUES ('51wZmbC%2BPxL._SL800_.jpg', 'cXMZpCvDQDWO6uNnKFPQKsIqMqIMbrAPJ0xWjSoqwW9F2sREC3', '51wZmbC%2BPxL._SL800_.jpg');
INSERT INTO `image` VALUES ('51XFz8xOWgL._SL800_.jpg', 's9dy2Mg5clKFCVabG5blunf7bkSH3lpv6QuJ92j9L1XKilkrjo', '51XFz8xOWgL._SL800_.jpg');
INSERT INTO `image` VALUES ('51xNOCR1K2L._SL800_.jpg', 'L8UORrOn9hHtU3zxKnzwiAcPJnLJfdp1QGOMYucLUwqFUSvWEC', '51xNOCR1K2L._SL800_.jpg');
INSERT INTO `image` VALUES ('51y%2BbJ9VvqL._SL800_.jpg', 'ZSKvlrIqU7oQsM2z0GvWBYCVAElOqvz1nzet6fwJP04OnLS69n', '51y%2BbJ9VvqL._SL800_.jpg');
INSERT INTO `image` VALUES ('51Ya5IgJHBL._SL800_.jpg', 'VdJCPNFJUGNdHs5DZCbYyLd8ER2sOlBT4SJfmKttVhDT2MrHdH', '51Ya5IgJHBL._SL800_.jpg');
INSERT INTO `image` VALUES ('51YO1pwTYPL._SL800_.jpg', 'O4rCM3eOjwuTMJmmeKhkRsIzbDrz1OHiCf5CMkDAaDeGNN8D44', '51YO1pwTYPL._SL800_.jpg');
INSERT INTO `image` VALUES ('51yU3kWtH%2BL._SL800_.jpg', 'cxIuVx1SXv9xCALCfyuUHXPaeMzEXh5ClrnVQx8SqM054PY6j7', '51yU3kWtH%2BL._SL800_.jpg');
INSERT INTO `image` VALUES ('51YXpnySijL._SL800_.jpg', 'EDxHhYPRmgK8idzRN9MCJ8xDP840k5XmgtPuV7IkYCloj1mOUf', '51YXpnySijL._SL800_.jpg');
INSERT INTO `image` VALUES ('51z9mpSwDxL._SL800_.jpg', 'mlbzDPP46B1eUDM2ZVbHLVcEGKIZblXX1wNLT7dm33gMgV7Akg', '51z9mpSwDxL._SL800_.jpg');
INSERT INTO `image` VALUES ('51ZfnMycAnL._SL800_.jpg', 'L8UORrOn9hHtU3zxKnzwiAcPJnLJfdp1QGOMYucLUwqFUSvWEC', '51ZfnMycAnL._SL800_.jpg');
INSERT INTO `image` VALUES ('51zFyawLMvL._SL800_.jpg', 'Q9LKqlzxnOUDzndPjCCpjI8eZVA7zfx0UNynW6pR9ULJGyUlXJ', '51zFyawLMvL._SL800_.jpg');
INSERT INTO `image` VALUES ('51ZmCSD4fjL._SL800_.jpg', 'kFZKrcFaJFz9XQplxhOdqnaIyUk46TZKC7PrUTVbb8Ndwz4Dhp', '51ZmCSD4fjL._SL800_.jpg');
INSERT INTO `image` VALUES ('51ZZtIrSO4L._SL800_.jpg', 'IE7JcRhMgqO4bHwYKqVWKjKGjSUUJ2LlzEXwSUff2Xi22QBf4f', '51ZZtIrSO4L._SL800_.jpg');
INSERT INTO `image` VALUES ('61%2Belgrg3XL._SL800_.jpg', 'r364fXfGbzWogTocIMhqJlQyIJpZCqDWbDHNvOWT8nQpyYefCZ', '61%2Belgrg3XL._SL800_.jpg');
INSERT INTO `image` VALUES ('61atY28bH6L._SL800_.jpg', 'Bmh3rUYVn3eQbj9St6VTIyvJPnuEErZTZBfr40FnNZRGXz9wS1', '61atY28bH6L._SL800_.jpg');
INSERT INTO `image` VALUES ('61d5XwxzDML._SL800_.jpg', 'su2pG2pPAbzSgCZKNA4p5DPecIXm9NZ98q805lQigKpNuzMExx', '61d5XwxzDML._SL800_.jpg');
INSERT INTO `image` VALUES ('61ef4n0XhQL._SL800_.jpg', 'nhO8efiznB92GAOxLSlONVa7PDmDGOGo7htP6KvmMFDHsCMsOL', '61ef4n0XhQL._SL800_.jpg');
INSERT INTO `image` VALUES ('61HdzbSpFNL._SL800_.jpg', '8PQVBwKQFmRaK73FxUmIRxPvzZIHa7UvSwzLPvGvlV3OlZ313p', '61HdzbSpFNL._SL800_.jpg');
INSERT INTO `image` VALUES ('61Js7ZpTDiL._SL800_.jpg', 's9dy2Mg5clKFCVabG5blunf7bkSH3lpv6QuJ92j9L1XKilkrjo', '61Js7ZpTDiL._SL800_.jpg');
INSERT INTO `image` VALUES ('61KUmOAXI9L._SL800_.jpg', 'ZSKvlrIqU7oQsM2z0GvWBYCVAElOqvz1nzet6fwJP04OnLS69n', '61KUmOAXI9L._SL800_.jpg');
INSERT INTO `image` VALUES ('61qiqLxBllS._SL800_.jpg', 'rAudXN3o5eMLaxxv4jk2VFji2zUFrpu7o0pJIuebc0ZEiVs6Rd', '61qiqLxBllS._SL800_.jpg');
INSERT INTO `image` VALUES ('81LojLQ1e0S._SL800_.jpg', 's9dy2Mg5clKFCVabG5blunf7bkSH3lpv6QuJ92j9L1XKilkrjo', '81LojLQ1e0S._SL800_.jpg');
INSERT INTO `image` VALUES ('81oyqczUMBS._SL800_.jpg', 'LfnUEcwpeY3VE2i81YaVXNN44Bsq1epN7wSZdJDDdcPCd3lcOX', '81oyqczUMBS._SL800_.jpg');
INSERT INTO `image` VALUES ('81xup-oFrCS._SL800_.jpg', 'ruWJgQFViHDf5qqgg9o0kPXv3R955BCISBziVZmmLJYISWed9e', '81xup-oFrCS._SL800_.jpg');
INSERT INTO `image` VALUES ('911Ty-tvBXS._SL800_.jpg', 'ApM6KvBcna0W3S3wZP0FZfpl61EeypHWO81VGTeGHkHo5IpivP', '911Ty-tvBXS._SL800_.jpg');
INSERT INTO `image` VALUES ('917KCBOmr3S._SL800_.jpg', 'su2pG2pPAbzSgCZKNA4p5DPecIXm9NZ98q805lQigKpNuzMExx', '917KCBOmr3S._SL800_.jpg');
COMMIT;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `message_id` varchar(100) NOT NULL,
  `sender_id` varchar(100) NOT NULL,
  `recv_id` varchar(100) DEFAULT NULL,
  `message_content` varchar(500) DEFAULT NULL,
  `send_time` date DEFAULT NULL,
  `is_read` bit(1) DEFAULT NULL,
  PRIMARY KEY (`message_id`),
  UNIQUE KEY `message_message_id_uindex` (`message_id`),
  KEY `message_user_user_id_fk_2` (`sender_id`),
  KEY `message_user_user_id_fk_1` (`recv_id`),
  CONSTRAINT `message_user_user_id_fk_1` FOREIGN KEY (`recv_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message_user_user_id_fk_2` FOREIGN KEY (`sender_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
BEGIN;
INSERT INTO `message` VALUES ('081be4cd-8bae-454f-aec1-76d36021ffbf', 'test@123.com', 'test2@123.com', 'test1', '2019-01-04', NULL);
COMMIT;

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item` (
  `product_id` varchar(100) NOT NULL,
  `order_id` varchar(100) NOT NULL,
  `product_count` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`order_id`),
  KEY `order_item_user_order_order_id_fk` (`order_id`),
  CONSTRAINT `order_item_user_order_order_id_fk` FOREIGN KEY (`order_id`) REFERENCES `user_order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_item
-- ----------------------------
BEGIN;
INSERT INTO `order_item` VALUES ('0gQ9rZ5pBvZaKrxLcuFNwJdnnvF1AW2z3g1bwYfR6qFQTb8gSb', '5471d0c1-dde9-4c2b-a90b-4eb06fb626a3', 1);
INSERT INTO `order_item` VALUES ('D7gojFukZqhJfoWosEkTWRhDUdyhX67cg5PRe4NDINqJZY8Krq', '4e18b3d8-f9ea-4cca-9933-7074e4e4eb22', 3);
COMMIT;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` varchar(100) NOT NULL,
  `product_name` varchar(1000) NOT NULL,
  `second_category_id` varchar(100) NOT NULL,
  `product_price` double NOT NULL,
  `product_description` varchar(10000) DEFAULT NULL,
  `product_left_totals` int(11) NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `product_product_id_uindex` (`product_id`),
  KEY `product_second_category_second_category_id_fk` (`second_category_id`),
  CONSTRAINT `product_second_category_second_category_id_fk` FOREIGN KEY (`second_category_id`) REFERENCES `second_category` (`second_category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
BEGIN;
INSERT INTO `product` VALUES ('043qUqd9F3gwsUfDh8E33izoYPiY1sVrCTQ1fLFY0IRU66S0pv', '安尚 笔记本电脑健康托架NBS-03 散热支架/散热架/多角度支架', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 55, '{\"品牌\": \"actto 安尚\"}', 100);
INSERT INTO `product` VALUES ('0CkdxfV89k3aXzoa3PsNvPElhdxGlDANTlIvE4KRFpyC9m9O6m', '华为（HUAWEI）华为M3青春版 10.1英寸平板电脑(BAH-W09 1920×1200 8核 4GB＋64GB WIFI)流光金', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 1975, '{\"品牌\": \"Huawei 华为\", \"型号\": \"华为平板M3青春版\", \"商品尺寸\": \"25.2 x 18 x 4.2 cm\", \"商品重量\": \"839 g\", \"颜色\": \"WIFI 4G+64G 金\", \"屏幕尺寸\": \"10.1 英寸\", \"屏幕分辨率\": \"1920*1080\", \"显示最大分辨率\": \"1920*1200\", \"CPU主频\": \"2.50 GHz\", \"内存容量\": \"4 GB\", \"内存类型\": \"DDR3 SDRAM\", \"硬盘容量\": \"64 GB\", \"操作系统\": \"Android 7.0\"}', 100);
INSERT INTO `product` VALUES ('0gQ9rZ5pBvZaKrxLcuFNwJdnnvF1AW2z3g1bwYfR6qFQTb8gSb', 'Microsoft 微软 Surface Pro 二合一平板电脑 12.3英寸 中文版(新)酷睿 i5/8GB/256GB/银灰【2017款】(不含触控笔)', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 7488, '{\"品牌\": \"Microsoft 微软\", \"型号\": \"Surface Pro\", \"商品尺寸\": \"29.2 x 20.1 x 0.8 cm\", \"商品重量\": \"771 g\", \"屏幕尺寸\": \"12.3 英寸\", \"显示最大分辨率\": \"2736  x 1824\", \"CPU生产商\": \"Intel\", \"CPU主频\": \"2.60 GHz\", \"CPU核心数量\": \"2\", \"内存容量\": \"8 GB\", \"硬盘容量\": \"256 GB\", \"硬盘描述\": \"SSD\", \"显卡芯片\": \"Intel HD 显卡 620\", \"显示芯片品牌\": \"Intel\", \"计算机无线类型1\": \"802.11bgn\", \"像素\": \"8 megapixels\", \"操作系统\": \"Windows 10\", \"电池包装类型\": \"电池是装配在该商品内\"}', 99);
INSERT INTO `product` VALUES ('0Nimf4wYwCNVe3MNSIuW8NYGEGBkzkn7qC7OOhqekDg38AZcZn', 'Apple iPad 9.7英寸平板电脑(银色) WIFI版 128G【2017款】', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 2988, '{\"品牌\": \"Apple\", \"型号\": \"iPad\", \"商品尺寸\": \"24 x 16.9 x 0.8 cm\", \"商品重量\": \"467 g\", \"颜色\": \"银色\", \"屏幕尺寸\": \"9.7 英寸\", \"显示最大分辨率\": \"2048×1536\", \"硬盘容量\": \"128 GB\", \"显卡芯片\": \"64 位架构的 A9 芯片\", \"操作系统\": \"iOS 10\", \"电池类型\": \"内置 32.4 瓦时锂聚合物充电电池\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('0QZFNSuCMq1hkicfw5k80vXrK8I6mCq0oOj78zaHnQcVqfm4CO', 'Apple 苹果 MacBook Air 13.3英寸笔记本电脑 MQD42CH/A 双核 i5/8GB内存/256GB固态硬盘 1.8GHz 双核 Intel Core i5 处理器 苹果电脑【2017款】', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 7388, '{\"品牌\": \"Apple\", \"型号\": \"MacBook Air\", \"商品尺寸\": \"42.7 x 34 x 12.3 cm\", \"商品重量\": \"3.08 Kg\", \"颜色\": \"银色\", \"屏幕尺寸\": \"13.3 英寸\", \"CPU生产商\": \"Intel\", \"CPU核心数量\": \"2\", \"内存容量\": \"8 GB\", \"硬盘容量\": \"256 GB\", \"硬盘描述\": \"固态硬盘\", \"显示芯片品牌\": \"Intel\", \"显卡类型\": \"集成显卡\", \"操作系统\": \"macOS\", \"锂电池容量\": \"54 每小时瓦\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('0rfYMR21qFavhAqjLDNSTBh6daH7mAMvajl36gKYloqkrOhQXR', '【下单送包鼠】ThinkPad New S2-20J3A00YCD(联想）13.3英寸IBM商务超极本笔记本电脑（intel双核C3865U 4G内存 128G固态硬盘 蓝牙 摄像头 Win10）银色', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 3981, '{\"品牌\": \"Thinkpad\", \"商品尺寸\": \"47.2 x 30.4 x 7.8 cm\", \"商品重量\": \"1.5 Kg\", \"电池\": \"1 Lithium Polymer 电池(附带)\", \"颜色\": \"银\", \"屏幕尺寸\": \"13.30 英寸\", \"屏幕分辨率\": \"1366x768\", \"CPU生产商\": \"Intel\", \"CPU主频\": \"1.80 GHz\", \"CPU核心数量\": \"2\", \"内存容量\": \"4 GB\", \"内存类型\": \"DDR SDRAM\", \"硬盘容量\": \"128 GB\", \"硬盘描述\": \"128G固态硬盘\", \"显卡芯片\": \"Intel HD Graphics 610\", \"显卡类型\": \"集成显卡\", \"操作系统\": \"Windows10\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('0w62OgUoCBY0toYp9RdNXhBQAtnVMrEevBva2dG3HWSYLp39Yh', 'Apple MacBook Air MJVM2CH/A 11.6英寸笔记本电脑(11.6英寸/i5 1.6G/4G/128G SSD)', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 4988, '{\"品牌\": \"Apple\", \"型号\": \"MJVM2CH/A\", \"商品尺寸\": \"34 x 23.2 x 7.4 cm\", \"商品重量\": \"1.96 Kg\", \"颜色\": \"银色\", \"屏幕尺寸\": \"11.6 英寸\", \"CPU生产商\": \"Intel\", \"CPU主频\": \"1.6 GHz\", \"内存容量\": \"4 GB\", \"硬盘容量\": \"128 GB\", \"硬盘描述\": \"128GB 闪存\", \"显卡芯片\": \"Intel HD Graphics 6000 图形处理器\", \"显示芯片品牌\": \"Intel\", \"显卡类型\": \"集成显卡\", \"操作系统\": \"OS X Yosemite\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('1B9TLzo2lH1lw5pY8NDnxiDBCfwQLQaPXbPw7eXGIZpCrfgZuZ', 'Lenovo 联想 ThinkPad T 420 商务笔记本电脑 14 \"，Intel Core i5，4 GB RAM，160 GB 硬盘，WLAN，网络摄像头，DVD 驱动器，win10 专业版（经认证和翻新）', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 2036.06, '{\"品牌\": \"Lenovo 联想\", \"商品尺寸\": \"23 x 34 x 3 cm\", \"商品重量\": \"2.24 Kg\", \"颜色\": \"黑色\", \"形状大小\": \"Notebook\", \"屏幕尺寸\": \"14 英寸\", \"屏幕分辨率\": \"1366x768\", \"显示最大分辨率\": \"1366x768\", \"CPU生产商\": \"Intel\", \"芯片类型\": \"Intel Core i5\", \"CPU主频\": \"2.5 GHz\", \"CPU核心数量\": \"2\", \"内存容量\": \"4 GB\", \"内存类型\": \"DDR3 SDRAM\", \"硬盘容量\": \"160 GB\", \"硬盘描述\": \"HDD\", \"连接类型\": \"dect\", \"计算机无线类型1\": \"DECT\", \"USB 2.0接口\": \"2\", \"光驱设备\": \"DVD-ROM\", \"操作系统\": \"Windows 10 Pro\", \"电池续航时间（小时）\": \"0.5 小时\"}', 100);
INSERT INTO `product` VALUES ('1LZvvzUhRFXTRJd4e0ShxGQEc1f02LGQdiFtg8YQda32mBKOMc', 'Dell 戴尔 灵越新飞匣Ins15ER-4725B 15.6英寸游戏笔记本电脑（i7-7500U 4G 1T 2G独显 WIN10 黑色）', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 4020, '{\"品牌\": \"Dell 戴尔\", \"型号\": \"Ins15E-4725B\", \"商品尺寸\": \"49.2 x 34.8 x 7.8 cm\", \"商品重量\": \"2 Kg\", \"颜色\": \"黑色\", \"屏幕尺寸\": \"15.6 英寸\", \"显示最大分辨率\": \"1920x1080\", \"CPU生产商\": \"Intel\", \"CPU主频\": \"3.5 GHz\", \"内存容量\": \"4 GB\", \"存储技术\": \"DDR3\", \"硬盘容量\": \"1 TB\", \"硬盘描述\": \"SATA\", \"显卡芯片\": \"R5 M315\", \"显示芯片品牌\": \"AMD\", \"显卡类型\": \"独立显卡\", \"显存容量\": \"2 GB\", \"光驱设备\": \"否\", \"电源类型\": \"45W AC适配器\", \"操作系统\": \"Win 10\", \"电池类型\": \"高性能6芯锂离子电池\", \"电池包装类型\": \"电池是包含在该商品的包装内，但没有装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('1mr7o2mYOd2iXxZPqSTe2LKHKeyGjYhWA2VG9aQkuYa2lxajkC', 'SIKU 德国 仿真 比例 合金 车模 收藏玩具 仿真模型-平板拖车带推土机 1616', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 58, '{\"商品尺寸\": \"16.3 x 3.6 x 4.6 cm\", \"产品尺寸及重量\": \"16.3 x 3.6 x 4.6 cm\", \"产地\": \"广东\", \"产品颜色\": \"平板拖车带推土机\", \"厂商推荐适用年龄:\": \"3 岁以上\", \"材质\": \"锌合金\"}', 100);
INSERT INTO `product` VALUES ('1TBSWxxMKvZkqFySSsIWbiEDYKjARaY8aS33LKAWDbrCfA3Evx', 'Dell 戴尔 灵越新飞匣Ins15ER-4725B 15.6英寸游戏笔记本电脑（i7-7500U 4G 1T 2G独显 WIN10 黑色）', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 4020, '{\"品牌\": \"Dell 戴尔\", \"型号\": \"Ins15E-4725B\", \"商品尺寸\": \"49.2 x 34.8 x 7.8 cm\", \"商品重量\": \"2 Kg\", \"颜色\": \"黑色\", \"屏幕尺寸\": \"15.6 英寸\", \"显示最大分辨率\": \"1920x1080\", \"CPU生产商\": \"Intel\", \"CPU主频\": \"3.5 GHz\", \"内存容量\": \"4 GB\", \"存储技术\": \"DDR3\", \"硬盘容量\": \"1 TB\", \"硬盘描述\": \"SATA\", \"显卡芯片\": \"R5 M315\", \"显示芯片品牌\": \"AMD\", \"显卡类型\": \"独立显卡\", \"显存容量\": \"2 GB\", \"光驱设备\": \"否\", \"电源类型\": \"45W AC适配器\", \"操作系统\": \"Win 10\", \"电池类型\": \"高性能6芯锂离子电池\", \"电池包装类型\": \"电池是包含在该商品的包装内，但没有装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('1tI6jBTuBNbfkxQKp4F7eFJWxmCrrW6ofQPFtiH4JhBUuklL4C', '【现货发售】Smartisan 锤子 坚果Pro2 碳黑色（细红线版） 6G+128GB 全网通 移动联通电信4G手机 5.99英寸 双卡双待 顺丰发货 可开专票', 'qz0tG4n27DTunWh8R2yx6C86iEQy4tc1m1vWC8tAUK7mPyfMoe', 2598, '{\"产品颜色\": \"碳黑色\", \"特殊功能\": \"快速充电, 指纹识别, 双卡\", \"网络制式\": \"全网通4G\", \"操作系统\": \"Android\", \"型号\": \"148252-1\"}', 100);
INSERT INTO `product` VALUES ('1VXgXyLGncvZKBgWpszVJlCjcp5cCHuK7bf9KZwvQqi5S1tKQi', 'Osprey 彗星 Comet 30升 户外徒步城市日用双肩背包/15寸笔记本电脑仓/防泼水/三年质保终身维修（两种LOGO随机发，详见页面下方注释）【城市系列】', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 399, '{\"商品尺寸\": \"48.3 x 27.9 x 27.9 cm\", \"商品重量\": \"862 g\", \"颜色\": \"F14绿色\", \"尺寸\": \"均码\", \"面料成分\": \"95%尼龙+5%塑料扣件\", \"件数\": \"1\", \"季节\": \"全年\", \"款式特征\": \"双肩背包\", \"容量\": \"30 公升\", \"包装清单\": \"售后服务承诺卡、标示卡、主品\", \"本商品是否包含电池\": \"不是\", \"是否需要电池\": \"不是\", \"品牌所属地\": \"美国\", \"适用性别\": \"男式\", \"型号\": \"F14 Comet 彗星\", \"型号年份\": \"2014\", \"适用场合\": \"日常\", \"原产地\": \"越南\", \"商品特征\": \"35 升\"}', 100);
INSERT INTO `product` VALUES ('1YnCb1G7uisQLBkck6OI5rrTtiZKqF7r1GXnXbMO48GFk2KAdc', 'ASUS 华硕 10.1英寸 Transformer Mini T102HA-D4-GR，2英寸触摸屏笔记本电脑，Intel Quad-Core Atom，4GB RAM，128GB EMMC，带笔和键盘', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 2527.94, '{\"品牌\": \"ASUS 华硕\", \"型号\": \"Transformer Book\", \"商品尺寸\": \"17 x 25.9 x 1.3 cm\", \"商品重量\": \"771 g\", \"电池\": \"1 Lithium Polymer 电池(附带)\", \"屏幕尺寸\": \"10.1 英寸\", \"显示最大分辨率\": \"1280 x 800\", \"CPU生产商\": \"Intel\", \"芯片类型\": \"None\", \"CPU主频\": \"1.44 GHz\", \"CPU核心数量\": \"4\", \"内存容量\": \"4 GB\", \"内存类型\": \"DDR3 SDRAM\", \"Max. unterstützte Größe\": \"4 GB\", \"硬盘描述\": \"emmc\", \"显卡类型\": \"Integrated\", \"计算机无线类型1\": \"802.11 A/C\", \"USB 2.0接口\": \"1\", \" 电压 \": \"9 伏特\", \"操作系统\": \"Windows 10\", \"电池续航时间（小时）\": \"11 小时\", \"锂电池容量\": \"32 每小时瓦\", \"电池包装类型\": \"电池是装配在该商品内\", \"电池锂含量\": \"0.87 克\", \"锂离子的数量\": \"3\"}', 100);
INSERT INTO `product` VALUES ('20aioGh1x40ZZgwDhgOnegdC8dbZQ5czR1Rsjgk27ZD5j2ZGIJ', 'Lenovo 联想 ThinkPad T 420 商务笔记本电脑 14 \"，Intel Core i5，4 GB RAM，160 GB 硬盘，WLAN，网络摄像头，DVD 驱动器，win10 专业版（经认证和翻新）', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 2036.06, '{\"品牌\": \"Lenovo 联想\", \"商品尺寸\": \"23 x 34 x 3 cm\", \"商品重量\": \"2.24 Kg\", \"颜色\": \"黑色\", \"形状大小\": \"Notebook\", \"屏幕尺寸\": \"14 英寸\", \"屏幕分辨率\": \"1366x768\", \"显示最大分辨率\": \"1366x768\", \"CPU生产商\": \"Intel\", \"芯片类型\": \"Intel Core i5\", \"CPU主频\": \"2.5 GHz\", \"CPU核心数量\": \"2\", \"内存容量\": \"4 GB\", \"内存类型\": \"DDR3 SDRAM\", \"硬盘容量\": \"160 GB\", \"硬盘描述\": \"HDD\", \"连接类型\": \"dect\", \"计算机无线类型1\": \"DECT\", \"USB 2.0接口\": \"2\", \"光驱设备\": \"DVD-ROM\", \"操作系统\": \"Windows 10 Pro\", \"电池续航时间（小时）\": \"0.5 小时\"}', 100);
INSERT INTO `product` VALUES ('27brj5hFZSFJr6TeBXuIa4XlXHoeDbT3Q48qWzwl8mqu0vnyit', 'Apple iPad mini 4 MK9Q2CH/A 7.9英寸平板电脑 (128G/WLAN/金色)', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 3049, '{\"品牌\": \"Apple\", \"型号\": \"MK9Q2CH/A\", \"商品尺寸\": \"21.4 x 14.6 x 4.2 cm\", \"商品重量\": \"581 g\", \"颜色\": \"金色\", \"屏幕尺寸\": \"7.9 英寸\", \"显示最大分辨率\": \"2048×1536\", \"硬盘容量\": \"128 GB\", \"操作系统\": \"iOS 9\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('2eekGLVliF6TEmMsPs6ZmvaQaxKO1k2a5H1yJJHAwWesC6glmv', 'Wacom 和冠 Bamboo Spark CDS600PG 数位本手写本(含平板套)', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 437.7, '{\"ASIN\": \"B01762FEN2\", \"用户评分\": \"\\n  \\n    \\n      \\n        平均 3.8 星\\n      \\n    \\n  \\n  \\n  \\n    \\n      69 条商品评论\\n    \\n  \\n\", \"亚马逊热销商品排名\": \"\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n办公用品商品里排第1,682名 (查看销售排行榜)\\n \\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n    \\n    第17位\\n    - 办公用品 > 办公设备 > 触摸板及配件 > 数位板\\n    \\n\\n\", \"发货重量\": \"1.2 Kg\", \"Amazon.cn上架时间\": \"2015年10月20日\"}', 100);
INSERT INTO `product` VALUES ('2XA5OJkcCLUmQb5UbWOHWNQ3G7tdIz7co5hWfpkqmNguobEcGg', '【国行正品全新】Apple 苹果 iPhone 6S Plus 手机 (全网通32G, 玫瑰金)', 'qz0tG4n27DTunWh8R2yx6C86iEQy4tc1m1vWC8tAUK7mPyfMoe', 3508, '{\"产品颜色\": \"玫瑰金\", \"特殊功能\": \"指纹识别\", \"操作系统\": \"iOS\", \"屏幕尺寸\": \"5.5 英寸\", \"型号\": \"iPhone 6s Plus\"}', 100);
INSERT INTO `product` VALUES ('34Ws86C1rhTfigmkFlSaZJ58RANVmCTxEaGWLzrbdt3VpWsXxS', '【2017新款】Apple iPad 9.7英寸平板电脑(金色) WIFI版 32G', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 2288, '{\"品牌\": \"Apple\", \"型号\": \"iPad\", \"商品尺寸\": \"24 x 16.9 x 0.8 cm\", \"商品重量\": \"467 g\", \"颜色\": \"金色\", \"屏幕尺寸\": \"9.7 英寸\", \"显示最大分辨率\": \"2048×1536\", \"硬盘容量\": \"32 GB\", \"显卡芯片\": \"64 位架构的 A9 芯片\", \"操作系统\": \"iOS 10\", \"电池类型\": \"内置 32.4 瓦时锂聚合物充电电池\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('3kNzVVb8oE5v4Sg1ZTS2srHP6imrICgOE5ljruRMpT3evH1Pwq', '华为（HUAWEI）华为M3青春版 10.1英寸平板电脑(BAH-W09 1920×1200 8核 3GB＋32GB WIFI)皎月白', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 1750, '{\"品牌\": \"Huawei 华为\", \"型号\": \"华为平板M3青春版\", \"商品尺寸\": \"24.1 x 17.1 x 0.7 cm\", \"商品重量\": \"308 g\", \"颜色\": \"WIFI 3G+32G 白\", \"屏幕尺寸\": \"10.1 英寸\", \"屏幕分辨率\": \"1920*1080\", \"显示最大分辨率\": \"1920*1200\", \"CPU主频\": \"2.50 GHz\", \"内存容量\": \"3 GB\", \"内存类型\": \"DDR3 SDRAM\", \"硬盘容量\": \"32 GB\", \"操作系统\": \"Android 7.0\"}', 100);
INSERT INTO `product` VALUES ('3pJTUjy8uw5dkSNjRTs2IxRYjgJxuRpVMf3V5mUbKqQQwkSMBh', 'BAIDATONG 蓝牙适配器Bluetooth CSR 4.0 电脑USB发射器 手机接收器 镀金属接口抗氧化 迷你免驱win7/8/XP 电脑、笔记本、台式机、等带有USB接口的电子设备等 支持音频 数据传输', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 23.9, '{\"品牌\": \"BAIDATONG\", \"商品尺寸\": \"12.8 x 9.8 x 1 cm\", \"商品重量\": \"59 g\"}', 100);
INSERT INTO `product` VALUES ('4MIhD9lOHU1svRDEC0MD0tJRK1qcZtDumFgcN4Wp3EzcUDZ98H', 'Apple 苹果 MacBook Air 13.3英寸笔记本电脑 MQD42CH/A 双核 i5/8GB内存/256GB固态硬盘 1.8GHz 双核 Intel Core i5 处理器 苹果电脑【2017款】', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 7388, '{\"品牌\": \"Apple\", \"型号\": \"MacBook Air\", \"商品尺寸\": \"42.7 x 34 x 12.3 cm\", \"商品重量\": \"3.08 Kg\", \"颜色\": \"银色\", \"屏幕尺寸\": \"13.3 英寸\", \"CPU生产商\": \"Intel\", \"CPU核心数量\": \"2\", \"内存容量\": \"8 GB\", \"硬盘容量\": \"256 GB\", \"硬盘描述\": \"固态硬盘\", \"显示芯片品牌\": \"Intel\", \"显卡类型\": \"集成显卡\", \"操作系统\": \"macOS\", \"锂电池容量\": \"54 每小时瓦\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('4N7pxNJTYye4mL7qSrELrXc0OvIeI5ZFJRuRrQycKtlkAWf7BA', 'Apple iPad mini 4 MK9Q2CH/A 7.9英寸平板电脑 (128G/WLAN/金色)', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 3049, '{\"品牌\": \"Apple\", \"型号\": \"MK9Q2CH/A\", \"商品尺寸\": \"21.4 x 14.6 x 4.2 cm\", \"商品重量\": \"581 g\", \"颜色\": \"金色\", \"屏幕尺寸\": \"7.9 英寸\", \"显示最大分辨率\": \"2048×1536\", \"硬盘容量\": \"128 GB\", \"操作系统\": \"iOS 9\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('4T5jH74YXyeq7sbcK9gjWc1yGagMiFB7yMThIB8hCCecKA0bmW', '华为（HUAWEI）华为M3青春版 10.1英寸平板电脑(BAH-W09 1920×1200 8核 3GB＋32GB WIFI)苍穹灰', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 1715, '{\"品牌\": \"Huawei 华为\", \"型号\": \"华为平板M3青春版\", \"商品尺寸\": \"24.1 x 17.1 x 0.7 cm\", \"商品重量\": \"308 g\", \"颜色\": \"WIFI 3G+32G 灰\", \"屏幕尺寸\": \"10.1 英寸\", \"屏幕分辨率\": \"1920*1080\", \"显示最大分辨率\": \"1920*1200\", \"CPU主频\": \"2.50 GHz\", \"内存容量\": \"3 GB\", \"内存类型\": \"DDR3 SDRAM\", \"硬盘容量\": \"32 GB\", \"操作系统\": \"Android 7.0\"}', 100);
INSERT INTO `product` VALUES ('5qtdUkheqFuS2iR1O7KtnUdm82koqaH1zaHG4F8eIB993Utwir', 'Haier 海尔 EC6002-R 60升 防电墙 电热水器 三档功率可调 安全预警功能 适用各种不同用电环境 预约加热 省时节能 360度立体保温 避免热量散失 断电记忆功能 简约操控面板 使用方便 电脑温控 控温更精确超长超粗有芯镁棒 有效延长内胆使用寿命', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 1329, '{\"Brand\": \"Haier 海尔\", \"商品尺寸\": \"81 x 44.4 x 47.7 cm\", \"商品重量\": \"23 Kg\", \" 效率 \": \"1级\", \" 容量 \": \"60 公升\", \" 零件编号 \": \"EC6002-R\", \" 类型 \": \"定频\", \" 特殊功能 \": \"防电墙技术\", \" 加热模式 \": \"双管加热\", \" 电压 \": \"220 伏特\", \"瓦数\": \"2000 瓦特\", \" 燃料类型 \": \"电力\", \" 是否包含电池 \": \"不是\", \" 是否需要电池 \": \"不是\", \" 重量 \": \"23 公斤\"}', 100);
INSERT INTO `product` VALUES ('5WR9uj8SsE7LEZbJsQz8EkrhvgzC2KSzncMMeRHKSe7FzZiszV', 'Panasonic 松下8kg全自动大容量变频波轮洗衣机XQB80-X8156（香槟金）（供应商直送）赠品：松下衣物护理套装', 'QKZDcx97eVbAMGocGBlNn2wv9cMJcgFrxQlfPMKONVn5ad5Kb9', 3188, '{\"Brand\": \"Panasonic 松下\", \"商品尺寸\": \"56 x 61 x 95.5 cm\", \"商品重量\": \"39 Kg\", \"型号\": \"XQB80-X8156\", \" 效率 \": \"1级\", \" 容量 \": \"8 公斤\", \" 最大旋转速度 \": \"1000 rpm\", \" 零件编号 \": \"XQB80-X8156\", \" 类型 \": \"波轮式\", \"Color\": \"香槟金\", \" 控制类型 \": \"全自动\", \"瓦数\": \"300 瓦特\", \" 适用容量 \": \"0-8 kg\", \" 包括的配件 \": \"洗衣机一台、进水管一根、进水管接头一个、排水管一根、底板一块，罩盖四个、保修证/认定服务店名录一本\", \" 是否包含电池 \": \"不是\", \" 是否需要电池 \": \"不是\", \" 重量 \": \"39 公斤\"}', 100);
INSERT INTO `product` VALUES ('5Y7ASlpceeoyy3Hiwrjy2ahUGW4hTXZJHgy8CRen4TKvfgMbsI', '小米 红米4A 移动联通电信4G手机(香槟金)', 'qz0tG4n27DTunWh8R2yx6C86iEQy4tc1m1vWC8tAUK7mPyfMoe', 627, '{\"商品尺寸\": \"13.9 x 7 x 0.8 cm\", \"商品重量\": \"132 g\", \"品牌所属地\": \"中国\", \"产品颜色\": \"香槟金\", \"容量\": \"16 GB\", \"特殊功能\": \"指纹识别, 双卡, 支持存储卡\", \"输入方式\": \"电容触屏\", \"摄像头像素\": \"1300 megapixels\", \"网络制式\": \"4G全网通\", \"电话卡卡槽\": \"2\", \"外置存储卡\": \"支持外置存储卡\", \"操作系统\": \"Android\", \"屏幕尺寸\": \"5 英寸\", \"有效分辨率\": \"294\", \"型号年份\": \"2016\", \"型号\": \"红米, 4A\", \"包装清单\": \"手机主机  1 件电源适配器  1 件USB数据线  1 件三包凭证  1 件入门指南  1 件插针  1 件\"}', 100);
INSERT INTO `product` VALUES ('6bU6Np4i2COnjyiYfl2uSFG2l2FEA9MN4XCR8QwBokw7XbSqIm', 'AmazonBasics Aluminum Laptop Stand AmazonBasics Aluminum Laptop Stand 银色', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 141.72, '{\"品牌\": \"AmazonBasics 亚马逊倍思\", \"商品尺寸\": \"25.6 x 23.7 x 15.5 cm\", \"商品重量\": \"2 Kg\", \"颜色\": \"银色\"}', 100);
INSERT INTO `product` VALUES ('6cQ4h0kkWsZvDWcUCOFw0AORvgHlGYxXJQ3jpFwLBBEqyysJW0', 'Huawei 华为 M3青春版 8.0英寸平板电脑(CPN-W09 1920×1200 8核 3GB＋32GB WIFI)皎月白', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 1499, '{\"品牌\": \"Huawei 华为\", \"型号\": \"M3青春版\", \"商品尺寸\": \"21.3 x 12.3 x 0.8 cm\", \"商品重量\": \"308 g\", \"颜色\": \"WIFI 3G+32G 白\", \"屏幕尺寸\": \"8 英寸\", \"显示最大分辨率\": \"1920x1200\", \"硬盘容量\": \"32 GB\", \"操作系统\": \"Android 7.0\"}', 100);
INSERT INTO `product` VALUES ('6ZhofZ9N7O4ne1socqvO10RCqPyAqeqPxfxu8a1CZmrxi8M1oF', 'Apple iPad 9.7英寸平板电脑(银色) WIFI版 128G【2017款】', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 2988, '{\"品牌\": \"Apple\", \"型号\": \"iPad\", \"商品尺寸\": \"24 x 16.9 x 0.8 cm\", \"商品重量\": \"467 g\", \"颜色\": \"银色\", \"屏幕尺寸\": \"9.7 英寸\", \"显示最大分辨率\": \"2048×1536\", \"硬盘容量\": \"128 GB\", \"显卡芯片\": \"64 位架构的 A9 芯片\", \"操作系统\": \"iOS 10\", \"电池类型\": \"内置 32.4 瓦时锂聚合物充电电池\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('7bY84jMVf7WqqwyxAc0FgMu9EvoWNT6XIuqELhrLUtY4jwDYR2', 'Dell 戴尔 燃7000 Ins15-7560-R1505S 15.6英寸轻薄笔记本电脑（i5-7200U 4G 128G SSD+500G机械硬盘 WIN10 银色）', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 4799, '{\"品牌\": \"Dell 戴尔\", \"型号\": \"Ins15-7560-1505S\", \"商品尺寸\": \"35.8 x 24.7 x 2 cm\", \"商品重量\": \"2.04 Kg\", \"颜色\": \"银色\", \"屏幕尺寸\": \"15.6 英寸\", \"显示最大分辨率\": \"1920*1080\", \"CPU生产商\": \"Intel\", \"内存容量\": \"4 GB\", \"存储技术\": \"DDR4\", \"硬盘容量\": \"628 GB\", \"硬盘描述\": \"固态硬盘, 机械硬盘\", \"显示芯片品牌\": \"Intel\", \"显卡类型\": \"集成显卡\", \"电源类型\": \"65W\", \"操作系统\": \"Windows 10\", \"电池类型\": \"3芯锂电池 锂离子 (42 Wh) 电池\", \"电池包装类型\": \"电池是包含在该商品的包装内，但没有装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('7oP4WDszZX3sDLs0XtdLjuxjJ6GWrfu7Zr4WHSk9scyHiX1dNY', 'Microsoft 微软 原装正版 系统 Win 10家庭中文版/可装MAC苹果电脑 Windows10 家庭中文版实物秘钥卡 密钥卡', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 599, '{\"品牌\": \"Microsoft 微软\", \"颜色\": \"Windows10家庭中文版\", \"内存类型\": \"DRAM\"}', 100);
INSERT INTO `product` VALUES ('7ozKi2BdO6cJyDQO6GRB4veRePAgqvkbbwqOChcTjY3FSBDaKr', 'Edifier 漫步者 K550 入门级时尚高品质耳麦 游戏耳机 电脑耳机 时尚白色', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 49, '{\"商品尺寸\": \"17.7 x 6.2 x 21.6 cm\", \"商品重量\": \"90.7 g\", \"品牌所属地\": \"中国\", \"包装清单\": \"耳机 × 1； 说明书 × 1 ；保修卡 × 1\", \"连接技术\": \"3.5mm接头\", \"佩戴方式\": \"头戴式\", \"线控\": \"有线控\", \"功能用途\": \"语音通话, 游戏, 音乐欣赏\"}', 100);
INSERT INTO `product` VALUES ('7S9siiiVpoO8D970BjSoDSzCHwi35FuAV3cPCueAP1FdyjAN3j', 'Huawei 华为 MateBook X 13英寸全金属超轻薄笔记本电脑(i5-7200U 8G 256G Win10 内含拓展坞)流光金', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 6575, '{\"品牌\": \"Huawei 华为\", \"型号\": \"WT-W09B\", \"商品尺寸\": \"28.6 x 21.1 x 1.2 cm\", \"商品重量\": \"1.05 Kg\", \"电池\": \"1 Lithium Polymer 电池(附带)\", \"颜色\": \"流光金\", \"屏幕尺寸\": \"13 英寸\", \"屏幕分辨率\": \"1280*720\", \"显示最大分辨率\": \"2160x1440\", \"CPU生产商\": \"因特尔\", \"CPU主频\": \"2.50 GHz\", \"内存容量\": \"4 GB\", \"内存类型\": \"DDR3 SDRAM\", \"硬盘容量\": \"256 GB\", \"显卡类型\": \"集成显卡\", \"电源类型\": \"40W智能电源适配器\", \"操作系统\": \"Windows 10\", \"电池类型\": \"锂聚合物\", \"锂电池容量\": \"41.4 每小时瓦\", \"电池包装类型\": \"电池是装配在该商品内\", \"锂离子的数量\": \"1\"}', 100);
INSERT INTO `product` VALUES ('7xkJnJlSUBdFltzMFvHBweNDQHVKOak6vOUmt8GkVIVqyOeyEH', '儿童电脑眼镜蓝光阻隔率约38 90% 儿童超轻眼镜  リキッドブラック', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 95.41, '{\"品牌\": \"ARTIFACT\", \"商品尺寸\": \"3 x 12.5 x 4 cm\", \"商品重量\": \"9.07 g\", \"颜色\": \"リキッドブラック\"}', 100);
INSERT INTO `product` VALUES ('8G9C5Qjjzjqwjs8Gn7IGRiKtksVHEGSM9ajE0sPvV3I72Y7Q4t', 'ThinkPad E570（20EVA04WCD）联想15.6英寸大屏商务办公笔记本电脑 (Intel双核C3865U 4G 500G 蓝牙 摄像头 win10 )', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 2589, '{\"品牌\": \"Thinkpad\", \"商品尺寸\": \"50.5 x 32.8 x 7.9 cm\", \"商品重量\": \"2.3 Kg\", \"电池\": \"1 Lithium Polymer 电池(附带)\", \"屏幕尺寸\": \"15.60 英寸\", \"屏幕分辨率\": \"1366 x 768\", \"CPU生产商\": \"inter\", \"芯片类型\": \"Intel Celeron\", \"CPU主频\": \"1.80 GHz\", \"CPU核心数量\": \"2\", \"内存容量\": \"4 GB\", \"内存类型\": \"DDR DRAM\", \"硬盘容量\": \"500 GB\", \"硬盘描述\": \"机械硬盘\", \"硬盘接口\": \"Serial ATA-300\", \"显卡芯片\": \"Intel HD Graphics 610\", \"显卡类型\": \"集成显卡\", \"硬件平台\": \"PC\", \"操作系统\": \"Windows10\", \"锂电池容量\": \"45 每小时瓦\", \"电池包装类型\": \"电池是包含在该商品的包装内，但没有装配在该商品内\", \"电池锂含量\": \"1 克\"}', 100);
INSERT INTO `product` VALUES ('8OPChkAxcxJuAZOatF1c6Ig8wMKwZuJPPhrmvSET3Jd7f9cZRk', '宏捷电X511平板电脑PC二合一11.6英寸Intel四核带键盘（2+32G+32G） 整机', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 866, '{\"品牌\": \"宏捷电hagile\", \"操作系统\": \"windows\"}', 100);
INSERT INTO `product` VALUES ('8PQVBwKQFmRaK73FxUmIRxPvzZIHa7UvSwzLPvGvlV3OlZ313p', 'SANWA SUPPLY 山业 老板椅 办公椅 椅子 职员开会座椅 透气型电脑椅 双层网格 高靠背带扶手 可升降可360度旋转可逍遥 日本品质 一生的享受 SNC-NET15ABK(黑色)(供应商直送)', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 399, '{\"ASIN\": \"B06X3V1M6W\", \"用户评分\": \"\\n  \\n    \\n      \\n        平均 4.3 星\\n      \\n    \\n  \\n  \\n  \\n    \\n      93 条商品评论\\n    \\n  \\n\", \"亚马逊热销商品排名\": \"\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n办公用品商品里排第85名 (查看销售排行榜)\\n \\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n    \\n    第2位\\n    - 办公用品 > 办公家具灯具 > 办公家具 > 椅子沙发 > 办公椅\\n    \\n\\n\", \"发货重量\": \"16 Kg\", \"Amazon.cn上架时间\": \"2012年6月16日\"}', 100);
INSERT INTO `product` VALUES ('8Q5wty0iqJERf7VJZyLPGHZ84JTRmCPcsHfKDaHE9iUtTef1kI', '三星（SAMSUNG）千小E Galaxy Tab E T560 9.6英寸平板电脑 T560（ 四核 8G WIFI版 屏幕分辨率1280*800 Android系统）白色', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 1058, '{\"品牌\": \"Samsung 三星\"}', 100);
INSERT INTO `product` VALUES ('8rdV5PGOXThDpovOQqN4jej1U2zp9jbJwVGoki7mF9Xt4zkJzF', '【2017新款】Apple iPad 9.7英寸平板电脑(金色) WIFI版 32G', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 2288, '{\"品牌\": \"Apple\", \"型号\": \"iPad\", \"商品尺寸\": \"24 x 16.9 x 0.8 cm\", \"商品重量\": \"467 g\", \"颜色\": \"金色\", \"屏幕尺寸\": \"9.7 英寸\", \"显示最大分辨率\": \"2048×1536\", \"硬盘容量\": \"32 GB\", \"显卡芯片\": \"64 位架构的 A9 芯片\", \"操作系统\": \"iOS 10\", \"电池类型\": \"内置 32.4 瓦时锂聚合物充电电池\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('8tvkxQcFRkuKxHOIBx12DleMRXSYFpcram9CEuTeLfRjwcrCtr', 'LeapFrog EPIC 水果忍者套装包括 EPIC android-based 儿童平板电脑', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 244.83, '{\"商品尺寸\": \"28.2 x 4.1 x 27.2 cm\", \"商品重量\": \"907 g\", \"产品颜色\": \"绿色\", \"Size\": \"()\", \"厂商推荐适用年龄:\": \"24 个月以上\", \"材质\": \"塑料、金属\", \"片数\": \"1\", \" 是否需要电池 \": \"是\"}', 100);
INSERT INTO `product` VALUES ('98iSOj9SOs44iIykWlMYb4WsWM68S5jGE6gOBIPTe12kib9NqX', 'ThinkPad E570-20H5A04WCD(联想)15.6英寸笔记本电脑(Intel双核C3865U 4G 500G 蓝牙 摄像头 6芯电池 WIN10)', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 2499, '{\"品牌\": \"Thinkpad\", \"商品尺寸\": \"34.7 x 23.6 x 2.2 cm\", \"商品重量\": \"2.1 Kg\", \"电池\": \"1 锂离子电池 电池(附带)\", \"颜色\": \"黑色\", \"屏幕尺寸\": \"15.60 英寸\", \"CPU生产商\": \"Intel\", \"CPU主频\": \"1.60 GHz\", \"CPU核心数量\": \"2\", \"内存容量\": \"4 GB\", \"硬盘容量\": \"500 GB\", \"显卡芯片\": \"Intel HD\", \"显示芯片品牌\": \"inte\", \"显卡类型\": \"集成显卡\", \"电源类型\": \"交流\", \"操作系统\": \"Windows 10\", \"锂电池容量\": \"47 每小时瓦\", \"电池包装类型\": \"电池是装配在该商品内\", \"锂离子的数量\": \"2\"}', 100);
INSERT INTO `product` VALUES ('9iGfVWRmILzaDJMCtV8lRklOmrNZ8tl0m9HWMzjPOsMHC2MxpR', 'AUBY 澳贝 启智系列 滑盖音乐手机 婴幼玩具 463415DS', 'qz0tG4n27DTunWh8R2yx6C86iEQy4tc1m1vWC8tAUK7mPyfMoe', 31, '{\"商品尺寸\": \"14 x 6.5 x 21 cm\", \"产品尺寸及重量\": \"14 x 6.5 x 21 cm\", \"产地\": \"广东\", \"型号\": \"463415DS\", \"厂商推荐适用年龄:\": \"12 个月以上\", \"材质\": \"塑料\"}', 100);
INSERT INTO `product` VALUES ('9UXPoVMiVsk83DVaTyYlS0cL9FWPv7GVTmvFnWwRZZAuAHEsxG', '三星（SAMSUNG）Tab A T350C 8.0英寸4：3屏幕 四核Android 5.0系统 平板电脑 WiFi版(白色 官方标配 不支持电话功能 )', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 1458, '{\"商品尺寸\": \"21.6 x 14.6 x 4.8 cm\", \"商品重量\": \"522 g\", \"操作系统\": \"android\"}', 100);
INSERT INTO `product` VALUES ('A1oCKqEXkQ3UsDofPy7hbWBjAYaServuDCqcqJ7z9oRvjzxAYS', 'ThinkPad E470-20H1A01LCD(联想)14英寸笔记本电脑(i5-6200U 4G内存 500G硬盘 2G独显 摄像头 蓝牙 WIN10)', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 3799, '{\"品牌\": \"Thinkpad\", \"商品尺寸\": \"34.7 x 23.6 x 2.2 cm\", \"商品重量\": \"2.1 Kg\", \"电池\": \"1 锂离子电池 电池(附带)\", \"颜色\": \"黑色\", \"屏幕尺寸\": \"14 英寸\", \"屏幕分辨率\": \"1366x768\", \"CPU生产商\": \"Intel\", \"CPU主频\": \"2.30 GHz\", \"内存容量\": \"4 GB\", \"硬盘容量\": \"500 GB\", \"显卡芯片\": \"NVIDIA GeForce 920MX\", \"显示芯片品牌\": \"NVIDIA\", \"显卡类型\": \"独立显卡\", \"显存容量\": \"2 GB\", \"电源类型\": \"交流\", \"操作系统\": \"windows 10\", \"锂电池容量\": \"45 每小时瓦\", \"电池包装类型\": \"电池是装配在该商品内\", \"电池锂含量\": \"0.85 克\", \"锂离子的数量\": \"1\"}', 100);
INSERT INTO `product` VALUES ('A6UBm3Tmf9Oh9Fe0U3p3kxcAxddpJ6kNVpJOh8ubzO20NkiCJ1', '【Surface平板专营店】Microsoft 微软 Surface Book 2 二合一平板笔记本电脑 不带触控笔 顺丰发货 可开专票 (15英寸, 八代酷睿i7/16GB/256GB/GTX1060独显)', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 19888, '{\"品牌\": \"Microsoft 微软\", \"颜色\": \"八代酷睿i7/16GB/256GB/GTX1060独显\", \"CPU生产商\": \"Intel\", \"芯片类型\": \"Intel Core i5\", \"CPU主频\": \"2.60 GHz\", \"内存容量\": \"8 GB\", \"内存类型\": \"DDR3 SDRAM\", \"硬盘容量\": \"256 GB\", \"硬盘接口\": \"Serial ATA\", \"硬件平台\": \"Windows\", \"操作系统\": \"Windows Pro\"}', 100);
INSERT INTO `product` VALUES ('A9VaXTrSMIgw62zDryWL1fLdCN2zEZpfQnaCgbm5hiXxVrEyRU', 'Seagate 希捷科技 储备与 8 TB 台式电脑外接硬盘 用于苹果系统 (STEM8000400)', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 1040.86, '{\"品牌\": \"SEAGATE\", \"型号\": \"STEM8000400\", \"商品尺寸\": \"11.8 x 4.1 x 19.8 cm\", \"商品重量\": \"1.06 Kg\", \"颜色\": \"白色\", \"硬盘容量\": \"8 TB\", \"硬件平台\": \"PC\", \"操作系统\": \"N/A\"}', 100);
INSERT INTO `product` VALUES ('ApM6KvBcna0W3S3wZP0FZfpl61EeypHWO81VGTeGHkHo5IpivP', 'Osprey 彗星 Comet 30升 户外徒步城市日用双肩背包/15寸笔记本电脑仓/防泼水/三年质保终身维修（两种LOGO随机发，详见页面下方注释）【城市系列】', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 399, '{\"商品尺寸\": \"48.3 x 27.9 x 27.9 cm\", \"商品重量\": \"862 g\", \"颜色\": \"F14绿色\", \"尺寸\": \"均码\", \"面料成分\": \"95%尼龙+5%塑料扣件\", \"件数\": \"1\", \"季节\": \"全年\", \"款式特征\": \"双肩背包\", \"容量\": \"30 公升\", \"包装清单\": \"售后服务承诺卡、标示卡、主品\", \"本商品是否包含电池\": \"不是\", \"是否需要电池\": \"不是\", \"品牌所属地\": \"美国\", \"适用性别\": \"男式\", \"型号\": \"F14 Comet 彗星\", \"型号年份\": \"2014\", \"适用场合\": \"日常\", \"原产地\": \"越南\", \"商品特征\": \"35 升\"}', 100);
INSERT INTO `product` VALUES ('AQT2rRThhwhAMbXRL0H5MkSm9lh5moYXoOsi6RX7eJP1WEoXZE', 'Moveski 摩维凯 Type C转接头拓展HUB读卡器T800【通用苹果笔记本小米华为和手机 USB C转USB TF SD卡】铝壳银色', 'qz0tG4n27DTunWh8R2yx6C86iEQy4tc1m1vWC8tAUK7mPyfMoe', 59, '{\"品牌\": \"Moveski 摩维凯\", \"商品尺寸\": \"9.6 x 6 x 1.6 cm\", \"商品重量\": \"18.1 g\", \"颜色\": \"T800-Type C转USB+读卡器-银色\", \"内存类型\": \"WRAM\"}', 100);
INSERT INTO `product` VALUES ('B9akHWaZRUjCb2D8sANQxlEmbCGwxTnRi3aeGitlI7YHvaFHGa', 'Meister Precision mechanic &apos; s 108件套 & # x2713补漆套装适用于智能手机平板电脑 PC  consoles 相机手表眼镜 modelling & CO . 工具套装 | 修复 | 精密螺丝刀套装 | 3387780', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 184.54, '{\"商品尺寸\": \"17.4 x 10.5 x 4.5 cm\", \"是否需要电池驱动\": \"不是\", \"本商品是否包含电池\": \"不是\"}', 100);
INSERT INTO `product` VALUES ('Bmh3rUYVn3eQbj9St6VTIyvJPnuEErZTZBfr40FnNZRGXz9wS1', 'advocator 纤薄商务笔记本电脑背包加铁手柄防水学院书包电脑背包双肩包适合15.6英寸笔记本电脑和笔记本电脑 grey1 均码', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 383.75, '{\"品牌\": \"Advocator\", \"商品尺寸\": \"44.4 x 30.5 x 6.6 cm\", \"商品重量\": \"476 g\", \"颜色\": \"grey1\", \"屏幕尺寸\": \"15.6 英寸\"}', 100);
INSERT INTO `product` VALUES ('bT3wyX2bQHs9VWBc1Q6FhFkJ4axuwb1x6axpUhs3A9rBDL1Aab', '华为（HUAWEI）华为M3青春版 10.1英寸平板电脑(BAH-W09 1920×1200 8核 3GB＋32GB WIFI)皎月白', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 1750, '{\"品牌\": \"Huawei 华为\", \"型号\": \"华为平板M3青春版\", \"商品尺寸\": \"24.1 x 17.1 x 0.7 cm\", \"商品重量\": \"308 g\", \"颜色\": \"WIFI 3G+32G 白\", \"屏幕尺寸\": \"10.1 英寸\", \"屏幕分辨率\": \"1920*1080\", \"显示最大分辨率\": \"1920*1200\", \"CPU主频\": \"2.50 GHz\", \"内存容量\": \"3 GB\", \"内存类型\": \"DDR3 SDRAM\", \"硬盘容量\": \"32 GB\", \"操作系统\": \"Android 7.0\"}', 100);
INSERT INTO `product` VALUES ('bTwp86AhCWeIw9VbpZ7PDcriW5SKAd7MCGVuoaOcMX0QRsaMBn', 'Dell 戴尔 灵越新飞匣Ins15ER-4725B 15.6英寸游戏笔记本电脑（i7-7500U 4G 1T 2G独显 WIN10 黑色）', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 4020, '{\"品牌\": \"Dell 戴尔\", \"型号\": \"Ins15E-4725B\", \"商品尺寸\": \"49.2 x 34.8 x 7.8 cm\", \"商品重量\": \"2 Kg\", \"颜色\": \"黑色\", \"屏幕尺寸\": \"15.6 英寸\", \"显示最大分辨率\": \"1920x1080\", \"CPU生产商\": \"Intel\", \"CPU主频\": \"3.5 GHz\", \"内存容量\": \"4 GB\", \"存储技术\": \"DDR3\", \"硬盘容量\": \"1 TB\", \"硬盘描述\": \"SATA\", \"显卡芯片\": \"R5 M315\", \"显示芯片品牌\": \"AMD\", \"显卡类型\": \"独立显卡\", \"显存容量\": \"2 GB\", \"光驱设备\": \"否\", \"电源类型\": \"45W AC适配器\", \"操作系统\": \"Win 10\", \"电池类型\": \"高性能6芯锂离子电池\", \"电池包装类型\": \"电池是包含在该商品的包装内，但没有装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('bVT9e9i82GmMl8SJ2QihIOL5r5e4kmYl4z6vnV42gseoU1LFN4', 'Rolodex Mesh Collection Mobile Device and Tablet Stand, Black (1866297)', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 78.91, '{\"ASIN\": \"B00EYNLXRI\", \"用户评分\": \"\\n  \\n    分享我的评价\\n  \\n\", \"亚马逊热销商品排名\": \"\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n办公用品商品里排第1,865名 (查看销售排行榜)\\n \\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n    \\n    第2位\\n    - 乐器 > 乐器配件 > 通用配件 > 乐谱架\\n    \\n    \\n    第132位\\n    - 电子产品 > 电脑\\\\IT > 外设产品 > 平板电脑配件\\n    \\n\\n\", \"发货重量\": \"454 g\", \"Amazon.cn上架时间\": \"2015年6月6日\"}', 100);
INSERT INTO `product` VALUES ('BybU5ypec57g4nMKhquKiopNag6jWI9v3YZ17bjbZGdyFRckcv', '【Surface平板专营店】Microsoft 微软 Surface Book 2 二合一平板笔记本电脑 不带触控笔 顺丰发货 可开专票 (15英寸, 八代酷睿i7/16GB/1TB/GTX1060独显)', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 26488, '{\"品牌\": \"Microsoft 微软\", \"颜色\": \"八代酷睿i7/16GB/1TB/GTX1060独显\", \"CPU生产商\": \"Intel\", \"芯片类型\": \"Intel Core i5\", \"CPU主频\": \"2.60 GHz\", \"内存容量\": \"8 GB\", \"内存类型\": \"DDR3 SDRAM\", \"硬盘容量\": \"256 GB\", \"硬盘接口\": \"Serial ATA\", \"硬件平台\": \"Windows\", \"操作系统\": \"Windows Pro\"}', 100);
INSERT INTO `product` VALUES ('bzSaO6kGM8cj3lAP8UAjN7WdCkSoZ7L5OsR2OqSYD1t0e7hWIO', 'Apple iPad 9.7英寸平板电脑(深空灰色) WIFI版 128G 【2017款】', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 2988, '{\"品牌\": \"Apple\", \"型号\": \"iPad\", \"商品尺寸\": \"24 x 16.9 x 0.8 cm\", \"商品重量\": \"467 g\", \"颜色\": \"深空灰色\", \"屏幕尺寸\": \"9.7 英寸\", \"显示最大分辨率\": \"2048×1536\", \"硬盘容量\": \"128 GB\", \"显卡芯片\": \"64 位架构的 A9 芯片\", \"操作系统\": \"iOS 10\", \"电池类型\": \"内置 32.4 瓦时锂聚合物充电电池\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('c4AUXMtOxVXvHxu5m4QycbUpf2djWqxLkSP5X2MgaLPf3whySm', 'Lenovo 联想 Yoga Tablet B6000-F 8.0英寸平板电脑(1.2G主频 1GB内存 16GB存储 蓝牙 802.11bgn 前后摄像头 GPS 内置重力感应器 光线感应器 指南针 霍尔传感器 10点触摸屏 Android 4.2 铂银色)', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 1099, '{\"品牌\": \"Lenovo 联想\", \"型号\": \"B6000\", \"商品尺寸\": \"22.4 x 15.4 x 5.2 cm\", \"商品重量\": \"1.9 Kg\", \"颜色\": \"铂银色\", \"屏幕尺寸\": \"8 英寸\", \"显示最大分辨率\": \"1280x800\", \"CPU生产商\": \"MTK\", \"CPU主频\": \"1.2 GHz\", \"内存容量\": \"1 GB\", \"存储技术\": \"LP-DDR2\", \"硬盘容量\": \"16 GB\", \"显卡类型\": \"集成显卡\", \"操作系统\": \"Android4.2\", \"电池类型\": \"高性能锂离子电池6000mAh\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('cFMYJs9klxva9TEAXO17XEaEyDC0fSnERU1xzFuR1RMl8pBM95', 'Huawei 华为 M3 8.4英寸 平板电脑(2560*1600 麒麟950 哈曼卡顿音效 4G/128G AKG耳机 WiFi)日晖金', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 2258, '{\"品牌\": \"Huawei 华为\", \"型号\": \"BTV-W09\", \"商品尺寸\": \"23.6 x 22 x 4 cm\", \"商品重量\": \"962 g\", \"电池\": \"1 锂离子电池 \", \"颜色\": \"日晖金[128G] WIFI\", \"屏幕尺寸\": \"8.4 英寸\", \"显示最大分辨率\": \"2560x1600\", \"硬盘容量\": \"128 GB\", \"操作系统\": \"Android 6.0\", \"锂电池容量\": \"47 每小时瓦\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('Ci78Cpag1J7mCuFVRphTBN3lqAyNS5RkupjfWTHxFTpZVFwryj', '戴尔（DELL）Vostro 5460-R2548BS 23.8英寸一体机电脑 （i5-7400T 8G 1TB +128GB SSD 4GB独显 Win10 三年上门）银', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 5649, '{\"品牌\": \"Dell 戴尔\", \"商品尺寸\": \"88 x 78 x 43 cm\", \"商品重量\": \"11 Kg\", \"颜色\": \"银色\", \"屏幕尺寸\": \"23.80 英寸\", \"屏幕分辨率\": \"1920X1080\", \"CPU生产商\": \"Intel\", \"内存容量\": \"8 GB\", \"存储技术\": \"DDR3 1600MHZ\", \"内存类型\": \"DDR3 SDRAM\", \"硬盘容量\": \"1 TB\", \"硬盘描述\": \"1TB 7200RPM\", \"操作系统\": \"Windows10\"}', 100);
INSERT INTO `product` VALUES ('CJvioDmj8i6bfO3dz8smTESOFyXUQ9XcojxivwBX8M73IaenjX', 'SANWA SUPPLY 山业 老板椅 办公椅 椅子 职员开会座椅 透气型电脑椅 双层网格 高靠背带扶手 可升降可360度旋转可逍遥 日本品质 一生的享受 SNC-NET15ABK(黑色)(供应商直送)', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 399, '{\"ASIN\": \"B06X3V1M6W\", \"用户评分\": \"\\n  \\n    \\n      \\n        平均 4.3 星\\n      \\n    \\n  \\n  \\n  \\n    \\n      93 条商品评论\\n    \\n  \\n\", \"亚马逊热销商品排名\": \"\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n办公用品商品里排第85名 (查看销售排行榜)\\n \\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n    \\n    第2位\\n    - 办公用品 > 办公家具灯具 > 办公家具 > 椅子沙发 > 办公椅\\n    \\n\\n\", \"发货重量\": \"16 Kg\", \"Amazon.cn上架时间\": \"2012年6月16日\"}', 100);
INSERT INTO `product` VALUES ('CoYWm3Bo3V9afvsS1mPjwe9J4eDJaQTfFOEgBpg4yhyegHFJSy', 'ThinkPad E470-20H1A02YCD(联想)14英寸笔记本电脑(i3-6006U 4G 500G 2G独显 蓝牙 摄像头 Win10)', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 3099, '{\"品牌\": \"Thinkpad\", \"商品尺寸\": \"34.7 x 23.6 x 2.2 cm\", \"商品重量\": \"1.8 Kg\", \"电池\": \"1 锂离子电池 电池(附带)\", \"颜色\": \"黑色\", \"屏幕尺寸\": \"14 英寸\", \"屏幕分辨率\": \"1366x768\", \"CPU生产商\": \"Intel\", \"CPU主频\": \"2 GHz\", \"内存容量\": \"4 GB\", \"硬盘容量\": \"500 GB\", \"显卡芯片\": \"NVIDIA GeForce 920MX\", \"显示芯片品牌\": \"NVIDIA\", \"显卡类型\": \"独立显卡\", \"显存容量\": \"2 GB\", \"电源类型\": \"交流\", \"操作系统\": \"Windows 10\", \"锂电池容量\": \"47 每小时瓦\", \"电池包装类型\": \"电池是装配在该商品内\", \"锂离子的数量\": \"2\"}', 100);
INSERT INTO `product` VALUES ('CrWRKxnpFl7Hi79iKN1US6jrQ2dWrIpyMhA1H1nFljwvg4UvY9', 'Apple iPad mini 4 MK9N2CH/A 7.9英寸平板电脑 (128G/WLAN/深空灰色)', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 3228, '{\"品牌\": \"Apple\", \"型号\": \"MK9N2CH/A\", \"商品尺寸\": \"21.6 x 14.6 x 4.4 cm\", \"商品重量\": \"599 g\", \"颜色\": \"深空灰色\", \"屏幕尺寸\": \"7.9 英寸\", \"显示最大分辨率\": \"2048×1536\", \"硬盘容量\": \"128 GB\", \"操作系统\": \"iOS 9\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('CU9NLd3VUsalMf28TVaicFf6TvyqdQ09y6AU6N2QttTqe286Ke', 'Seagate 希捷科技 储备与 8 TB 台式电脑外接硬盘 用于苹果系统 (STEM8000400)', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 1040.86, '{\"品牌\": \"SEAGATE\", \"型号\": \"STEM8000400\", \"商品尺寸\": \"11.8 x 4.1 x 19.8 cm\", \"商品重量\": \"1.06 Kg\", \"颜色\": \"白色\", \"硬盘容量\": \"8 TB\", \"硬件平台\": \"PC\", \"操作系统\": \"N/A\"}', 100);
INSERT INTO `product` VALUES ('cv6FVFfxsOqIhzo75tnXlcWk5NpJjgYfoLXvXma8KRbXYNEVNo', '【Surface平板专营店】Microsoft 微软 Surface Book 2 二合一平板笔记本电脑 不带触控笔 顺丰发货 可开专票 (15英寸, 八代酷睿i7/16GB/256GB/GTX1060独显)', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 19888, '{\"品牌\": \"Microsoft 微软\", \"颜色\": \"八代酷睿i7/16GB/256GB/GTX1060独显\", \"CPU生产商\": \"Intel\", \"芯片类型\": \"Intel Core i5\", \"CPU主频\": \"2.60 GHz\", \"内存容量\": \"8 GB\", \"内存类型\": \"DDR3 SDRAM\", \"硬盘容量\": \"256 GB\", \"硬盘接口\": \"Serial ATA\", \"硬件平台\": \"Windows\", \"操作系统\": \"Windows Pro\"}', 100);
INSERT INTO `product` VALUES ('cxIuVx1SXv9xCALCfyuUHXPaeMzEXh5ClrnVQx8SqM054PY6j7', '宏捷电X511平板电脑PC二合一11.6英寸Intel四核带键盘（2+32G+32G） 整机', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 866, '{\"品牌\": \"宏捷电hagile\", \"操作系统\": \"windows\"}', 100);
INSERT INTO `product` VALUES ('cXMZpCvDQDWO6uNnKFPQKsIqMqIMbrAPJ0xWjSoqwW9F2sREC3', 'HPE ProLiant Micro 服务器 gen10 x3216 , 8 GB - U , 4LFF , 不热插拔 - fã HIG 操纵 , SATA , 200 W 的电源 , 入门级服务器1J VOS', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 2197.13, '{\"品牌\": \"HP 惠普\", \"型号\": \"ProLiant MicroServer Gen10\", \"商品尺寸\": \"23.5 x 23 x 25.4 cm\", \"商品重量\": \"3.32 Kg\", \"形状大小\": \"Ultra Micro Tower\", \"CPU生产商\": \"Prozessorfamilie\", \"CPU主频\": \"1.6 GHz\", \"CPU核心数量\": \"2\", \"内存容量\": \"8192 MB\", \"存储技术\": \"DDR4-SDRAM\", \"Max. unterstützte Größe\": \"32 GB\", \"硬盘容量\": \"16 TB\", \"硬盘接口\": \"Serial ATA\", \"USB 2.0接口\": \"2\", \"以太网端口\": \"2\", \"瓦数\": \"200 瓦特\", \"光驱设备\": \"Nein\", \"操作系统\": \"Microsoft Windows Server 2012 R2 & 2016, ClearOS, Nein\"}', 100);
INSERT INTO `product` VALUES ('D7gojFukZqhJfoWosEkTWRhDUdyhX67cg5PRe4NDINqJZY8Krq', 'GREE格力 KFR-26GW/(26570)Ga-3 Q畅大1匹壁挂式定频冷暖空调(送货安装同步和空调罩一起发货）', 'Av7yd1bCsKdy0Tx66j6kmpEHEhjTdchmn7QJJmNt9HYnKS3EDO', 2499, '{\"Brand\": \"GREE 格力\", \" 效率 \": \"3级\", \" 零件编号 \": \"SZ-007\", \" 类型 \": \"定频\", \" 特殊功能 \": \"冷暖\", \"Color\": \"白色\", \" 匹数 \": \"1 匹\", \" 是否包含电池 \": \"不是\", \" 是否需要电池 \": \"不是\"}', 97);
INSERT INTO `product` VALUES ('dLDCIuDV2uTyJbdWxdJuhp6s67QJPH9e9T56hNycGpJAMbwEJ3', '可茵慈德国进口一次性擦镜布眼镜清洁纸湿巾擦屏幕镜头纸50片买5免1 适用iphone iPad MacBook 平板电脑 电视 手机屏幕 机身 相机镜头 键盘', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 23, '{\"商品尺寸\": \"10 x 8 x 6.5 cm\", \"包装尺寸\": \"10 x 8 x 6.5 cm\", \"尺寸\\n\": \"50\"}', 100);
INSERT INTO `product` VALUES ('DOS7v5ZIU0m2BnNVjdLkhQTDDJLTAGc4nFTgNtsb2dNKFfnwnd', '【Surface平板专营店】Microsoft 微软 Surface Book 2 二合一平板笔记本电脑 不带触控笔 顺丰发货 可开专票 (15英寸, 八代酷睿i7/16GB/512GB/GTX1060独显)', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 23488, '{\"品牌\": \"Microsoft 微软\", \"颜色\": \"八代酷睿i7/16GB/512GB/GTX1060独显\", \"CPU生产商\": \"Intel\", \"芯片类型\": \"Intel Core i5\", \"CPU主频\": \"2.60 GHz\", \"内存容量\": \"8 GB\", \"内存类型\": \"DDR3 SDRAM\", \"硬盘容量\": \"256 GB\", \"硬盘接口\": \"Serial ATA\", \"硬件平台\": \"Windows\", \"操作系统\": \"Windows Pro\"}', 100);
INSERT INTO `product` VALUES ('dpmPadFiTaIPKnPV97nNcbXQV6c9psLvoiXrrIDFR3yrAdCUdb', 'Whirldy 手机支架 桌面 ipad支架 手机平板通用 多功能 创意折叠 简约 (黑色)', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 18, '{\"品牌名称\": \"Whirldy\", \"产品颜色\": \"黑色\", \"制造商\": \"深圳市惠尔迪科技有限公司\", \"本商品是否包含电池\": \"不是\"}', 100);
INSERT INTO `product` VALUES ('dz671GAYTaXqxmQCqFn01VZrLScPuJtfQGWkcaF6zP8dBQa54F', 'advocator 纤薄商务笔记本电脑背包加铁手柄防水学院书包电脑背包双肩包适合15.6英寸笔记本电脑和笔记本电脑 grey1 均码', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 383.75, '{\"品牌\": \"Advocator\", \"商品尺寸\": \"44.4 x 30.5 x 6.6 cm\", \"商品重量\": \"476 g\", \"颜色\": \"grey1\", \"屏幕尺寸\": \"15.6 英寸\"}', 100);
INSERT INTO `product` VALUES ('EDxHhYPRmgK8idzRN9MCJ8xDP840k5XmgtPuV7IkYCloj1mOUf', 'Haier 海尔 EC6002-R 60升 防电墙 电热水器 三档功率可调 安全预警功能 适用各种不同用电环境 预约加热 省时节能 360度立体保温 避免热量散失 断电记忆功能 简约操控面板 使用方便 电脑温控 控温更精确超长超粗有芯镁棒 有效延长内胆使用寿命', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 1329, '{\"Brand\": \"Haier 海尔\", \"商品尺寸\": \"81 x 44.4 x 47.7 cm\", \"商品重量\": \"23 Kg\", \" 效率 \": \"1级\", \" 容量 \": \"60 公升\", \" 零件编号 \": \"EC6002-R\", \" 类型 \": \"定频\", \" 特殊功能 \": \"防电墙技术\", \" 加热模式 \": \"双管加热\", \" 电压 \": \"220 伏特\", \"瓦数\": \"2000 瓦特\", \" 燃料类型 \": \"电力\", \" 是否包含电池 \": \"不是\", \" 是否需要电池 \": \"不是\", \" 重量 \": \"23 公斤\"}', 100);
INSERT INTO `product` VALUES ('ee0yArDSvm91HNnV1laIddNLrML0tSyxsNfOY4CCNBvQt7V7M9', 'HP 惠普 8300 台式电脑 黑色 Intel Core i5, 4GB RAM, 250GB HDD', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 1121.76, '{\"品牌\": \"HP 惠普\", \"商品尺寸\": \"33.8 x 10 x 37.8 cm\", \"商品重量\": \"7.6 Kg\", \"颜色\": \"黑色\", \"形状大小\": \"Desktop PC\", \"CPU生产商\": \"Intel\", \"芯片类型\": \"Intel Core i5\", \"CPU主频\": \"3.2 GHz\", \"CPU核心数量\": \"2\", \"内存容量\": \"4 GB\", \"内存类型\": \"DDR3 SDRAM\", \"硬盘容量\": \"320 GB\", \"硬盘描述\": \"HDD\", \"USB 2.0接口\": \"10\", \"光驱设备\": \"DVD reader\", \"操作系统\": \"Windows 10 Home\"}', 100);
INSERT INTO `product` VALUES ('EfyQJUq1CieaiXIERtWBlmUXlVMgI4NMRA0XDUpBh2f8y6L0L5', '华为（HUAWEI）华为M3青春版 10.1英寸平板电脑(BAH-W09 1920×1200 8核 3GB＋32GB WIFI)苍穹灰', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 1715, '{\"品牌\": \"Huawei 华为\", \"型号\": \"华为平板M3青春版\", \"商品尺寸\": \"24.1 x 17.1 x 0.7 cm\", \"商品重量\": \"308 g\", \"颜色\": \"WIFI 3G+32G 灰\", \"屏幕尺寸\": \"10.1 英寸\", \"屏幕分辨率\": \"1920*1080\", \"显示最大分辨率\": \"1920*1200\", \"CPU主频\": \"2.50 GHz\", \"内存容量\": \"3 GB\", \"内存类型\": \"DDR3 SDRAM\", \"硬盘容量\": \"32 GB\", \"操作系统\": \"Android 7.0\"}', 100);
INSERT INTO `product` VALUES ('EKDZRswDPCPwdydRRSHCik3J2bZgDJJGWMTuL0jnkVFedLAzQA', 'VTech 伟易达 Light-Up 婴儿触摸平板（简约包装）', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 108.02, '{\"商品尺寸\": \"3 x 20.6 x 15.2 cm\", \"商品重量\": \"454 g\", \"产品颜色\": \"粉色\", \"型号\": \"VTech\", \"厂商推荐适用年龄:\": \"9 个月以上\", \" 是否需要电池 \": \"是\"}', 100);
INSERT INTO `product` VALUES ('enww1uL8Z7YVo9ubgCtUlPga9cFx1gBYGXrdgd9qZIL9yaSe9o', 'Dell 戴尔 灵越新飞匣Ins15ER-4525B 15.6英寸游戏笔记本电脑（i5-7200U 4G 500G 2G独显 WIN10 黑色）', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 3388, '{\"品牌\": \"Dell 戴尔\", \"型号\": \"Ins15E-4525B\", \"商品尺寸\": \"49.4 x 34.6 x 7.8 cm\", \"商品重量\": \"2 Kg\", \"颜色\": \"黑色\", \"屏幕尺寸\": \"15.6 英寸\", \"显示最大分辨率\": \"1920x1080\", \"CPU生产商\": \"Intel\", \"CPU主频\": \"3.1 GHz\", \"内存容量\": \"4 GB\", \"存储技术\": \"DDR3\", \"硬盘容量\": \"500 GB\", \"硬盘描述\": \"SATA\", \"显卡芯片\": \"R5 M315\", \"显示芯片品牌\": \"AMD\", \"显卡类型\": \"独立显卡\", \"显存容量\": \"2 GB\", \"光驱设备\": \"否\", \"电源类型\": \"45W AC适配器\", \"操作系统\": \"Win 10\", \"电池类型\": \"高性能6芯锂离子电池\", \"电池包装类型\": \"电池是包含在该商品的包装内，但没有装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('Ep2vKZIVjyOrNrPLBCNU5RJuWYcGZ9HC5AfVzR6eZLXG7b05sR', 'VTech 伟易达 Tote&Go 笔记本电脑，橙色', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 160.06, '{\"商品尺寸\": \"6.8 x 27.1 x 20.9 cm\", \"商品重量\": \"816 g\", \"产品颜色\": \"橙色\", \"Size\": \"2.68 x 10.67 x 8.23 Inches\", \"厂商推荐适用年龄:\": \"3 岁以上\", \"材质\": \"塑料\", \" 是否需要电池 \": \"是\"}', 100);
INSERT INTO `product` VALUES ('Er1eGKkXszeQ0Xc0slsmCbZlCLO81RfurVHdnP5RqUIzrFOr6G', 'Whirldy 手机支架 桌面 ipad支架 手机平板通用 多功能 创意折叠 简约 (黑色)', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 18, '{\"品牌名称\": \"Whirldy\", \"产品颜色\": \"黑色\", \"制造商\": \"深圳市惠尔迪科技有限公司\", \"本商品是否包含电池\": \"不是\"}', 100);
INSERT INTO `product` VALUES ('Eu80KHwVCOiBHHIK6Isrsr9zK7DY6RF8dFIors6IZdMAEENKI6', 'ThinkPad E470-20H1A02YCD(联想)14英寸笔记本电脑(i3-6006U 4G 500G 2G独显 蓝牙 摄像头 Win10)', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 3099, '{\"品牌\": \"Thinkpad\", \"商品尺寸\": \"34.7 x 23.6 x 2.2 cm\", \"商品重量\": \"1.8 Kg\", \"电池\": \"1 锂离子电池 电池(附带)\", \"颜色\": \"黑色\", \"屏幕尺寸\": \"14 英寸\", \"屏幕分辨率\": \"1366x768\", \"CPU生产商\": \"Intel\", \"CPU主频\": \"2 GHz\", \"内存容量\": \"4 GB\", \"硬盘容量\": \"500 GB\", \"显卡芯片\": \"NVIDIA GeForce 920MX\", \"显示芯片品牌\": \"NVIDIA\", \"显卡类型\": \"独立显卡\", \"显存容量\": \"2 GB\", \"电源类型\": \"交流\", \"操作系统\": \"Windows 10\", \"锂电池容量\": \"47 每小时瓦\", \"电池包装类型\": \"电池是装配在该商品内\", \"锂离子的数量\": \"2\"}', 100);
INSERT INTO `product` VALUES ('F2XHBkRR8aaLWHP3bL2o0PEXerLYMOAuabU1BbBKSKteb24Uja', 'Rolodex Mesh Collection Mobile Device and Tablet Stand, Black (1866297)', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 78.91, '{\"ASIN\": \"B00EYNLXRI\", \"用户评分\": \"\\n  \\n    分享我的评价\\n  \\n\", \"亚马逊热销商品排名\": \"\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n办公用品商品里排第1,865名 (查看销售排行榜)\\n \\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n    \\n    第2位\\n    - 乐器 > 乐器配件 > 通用配件 > 乐谱架\\n    \\n    \\n    第132位\\n    - 电子产品 > 电脑\\\\IT > 外设产品 > 平板电脑配件\\n    \\n\\n\", \"发货重量\": \"454 g\", \"Amazon.cn上架时间\": \"2015年6月6日\"}', 100);
INSERT INTO `product` VALUES ('f7ihLw7LNWZtHUuVZsNP5rPOBK7eFej59HQWS9XEjGP1PqCYM9', 'Huawei 华为 M3 8.4英寸 平板电脑(2560*1600 麒麟950 哈曼卡顿音效 4G/128G AKG耳机 WiFi)日晖金', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 2258, '{\"品牌\": \"Huawei 华为\", \"型号\": \"BTV-W09\", \"商品尺寸\": \"23.6 x 22 x 4 cm\", \"商品重量\": \"962 g\", \"电池\": \"1 锂离子电池 \", \"颜色\": \"日晖金[128G] WIFI\", \"屏幕尺寸\": \"8.4 英寸\", \"显示最大分辨率\": \"2560x1600\", \"硬盘容量\": \"128 GB\", \"操作系统\": \"Android 6.0\", \"锂电池容量\": \"47 每小时瓦\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('feGSVAImKpIeVD8DM1sb2QepPsLHdCv9d8q3yzhR5mA1taSXlM', 'GOXIIS歌杰仕 E09 金属入耳式耳机重低音带麦线控免提通话手机电脑MP3通用耳机(金色)', 'qz0tG4n27DTunWh8R2yx6C86iEQy4tc1m1vWC8tAUK7mPyfMoe', 69, '{\"商品尺寸\": \"17.8 x 7 x 2 cm\", \"商品重量\": \"18.1 g\", \"产品颜色\": \"金色\", \"功能用途\": \"支持所有3.5MM插孔的手机，兼容性强，免提通话，音量调节\", \"适用机型\": \"所有能支持3.5MM插头的手机，智能手机，平板电脑 笔记本电脑 MP3 MP4 播放器等\", \"型号\": \"E09\", \"包装清单\": \"E09耳机X1 合格证X1 保修卡X1 耳帽X2副\"}', 100);
INSERT INTO `product` VALUES ('fgpnRCzKJgSejL9V812URp0lBu2427KG7tw6gdEnAA6DmJct5O', 'Moveski 摩维凯 HDMI转换器7585C VGA显示转换头【苹果转HDMI VGA双口 配电源线】支持iphone6 7 8iPad 手机转电视投影仪', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 145, '{\"品牌\": \"Moveski 摩维凯\", \"商品尺寸\": \"15.8 x 11 x 2.6 cm\", \"商品重量\": \"59 g\", \"颜色\": \"苹果转HDMI+VGA双口\"}', 100);
INSERT INTO `product` VALUES ('fGwwh8hqIjnyKrh7ToPs7GfeLyJwYjEVLrnSSAmqAXYkMD4E2Z', 'Apple iPad mini 4 MK9N2CH/A 7.9英寸平板电脑 (128G/WLAN/深空灰色)', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 3228, '{\"品牌\": \"Apple\", \"型号\": \"MK9N2CH/A\", \"商品尺寸\": \"21.6 x 14.6 x 4.4 cm\", \"商品重量\": \"599 g\", \"颜色\": \"深空灰色\", \"屏幕尺寸\": \"7.9 英寸\", \"显示最大分辨率\": \"2048×1536\", \"硬盘容量\": \"128 GB\", \"操作系统\": \"iOS 9\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('FifAnhfDYCB3pDnQ1tbIePPNeswNpZEAidcgnhvvWD5x9oFyVF', 'Dell 戴尔 灵越新飞匣Ins15ER-4525B 15.6英寸游戏笔记本电脑（i5-7200U 4G 500G 2G独显 WIN10 黑色）', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 3388, '{\"品牌\": \"Dell 戴尔\", \"型号\": \"Ins15E-4525B\", \"商品尺寸\": \"49.4 x 34.6 x 7.8 cm\", \"商品重量\": \"2 Kg\", \"颜色\": \"黑色\", \"屏幕尺寸\": \"15.6 英寸\", \"显示最大分辨率\": \"1920x1080\", \"CPU生产商\": \"Intel\", \"CPU主频\": \"3.1 GHz\", \"内存容量\": \"4 GB\", \"存储技术\": \"DDR3\", \"硬盘容量\": \"500 GB\", \"硬盘描述\": \"SATA\", \"显卡芯片\": \"R5 M315\", \"显示芯片品牌\": \"AMD\", \"显卡类型\": \"独立显卡\", \"显存容量\": \"2 GB\", \"光驱设备\": \"否\", \"电源类型\": \"45W AC适配器\", \"操作系统\": \"Win 10\", \"电池类型\": \"高性能6芯锂离子电池\", \"电池包装类型\": \"电池是包含在该商品的包装内，但没有装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('Fkx1ELla3N9SXg5P8fpA4fJvLlJohARnhA3iiFbDxNJWemSA6t', '【Surface平板专营店】Microsoft 微软 Surface Book 2 二合一平板笔记本电脑 不带触控笔 顺丰发货 可开专票 (13.5英寸, 八代酷睿i7/16GB/512GB/GTX1050独显)', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 18458, '{\"品牌\": \"Microsoft 微软\", \"颜色\": \"八代酷睿i7/16GB/512GB/GTX1050独显\", \"CPU生产商\": \"Intel\", \"芯片类型\": \"Intel Core i5\", \"CPU主频\": \"2.60 GHz\", \"内存容量\": \"8 GB\", \"内存类型\": \"DDR3 SDRAM\", \"硬盘容量\": \"256 GB\", \"硬盘接口\": \"Serial ATA\", \"硬件平台\": \"Windows\", \"操作系统\": \"Windows Pro\"}', 100);
INSERT INTO `product` VALUES ('fN9zBoIH4F7tcj9yJnAMy0gEuMxAeJlbVWdSXKthHdojd1z5ge', 'Apple 苹果 MacBook Air 13.3英寸笔记本电脑 MQD32CH/A银色 Core i5/8G内存/128G固态硬盘 1.8GHz 双核 Intel Core i5 处理器 苹果电脑【2017款】', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 6188, '{\"品牌\": \"Apple\", \"型号\": \"MacBook Air\", \"商品尺寸\": \"42.7 x 34 x 12.3 cm\", \"商品重量\": \"3.08 Kg\", \"颜色\": \"13.3/1.8GHZ/8GB/128GB-CHN\", \"屏幕尺寸\": \"13.3 英寸\", \"CPU生产商\": \"Intel\", \"CPU核心数量\": \"2\", \"硬盘容量\": \"128 GB\", \"硬盘描述\": \"固态硬盘\", \"显示芯片品牌\": \"Intel\", \"显卡类型\": \"集成显卡\", \"操作系统\": \"macOS\", \"锂电池容量\": \"54 每小时瓦\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('FnlpuSAoXbQNmD8O7Z2U1E7XMFY4BiRjumIG0VIRxmZydNxxAQ', 'ThinkPad X1 Carbon 2017-20HRA007CD(联想)14英寸轻薄笔记本电脑(i5-7200U 8G 256G SSD固态硬盘 IPS高清屏 摄像头 蓝牙 指纹 背光键盘 WIN10)', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 9299, '{\"品牌\": \"Thinkpad\", \"商品尺寸\": \"33 x 23 x 1.6 cm\", \"商品重量\": \"1.2 Kg\", \"颜色\": \"黑色\", \"屏幕尺寸\": \"14 英寸\", \"屏幕分辨率\": \"1920x1080\", \"CPU生产商\": \"Intel\", \"CPU主频\": \"2.30 GHz\", \"内存容量\": \"8 GB\", \"存储技术\": \"DDR4\", \"硬盘容量\": \"256 GB\", \"硬盘描述\": \"固态硬盘\", \"显卡芯片\": \"Intel HD Graphics 520\", \"显示芯片品牌\": \"intel\", \"显卡类型\": \"核心显卡\", \"电源类型\": \"交流和电池\", \"操作系统\": \"Windows 10\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('fPJ0HFTxYg2YYYGFApCiJzxgyOcVjxSXlNkKqUATBqBMJVokeZ', 'ThinkPad E570-20H5A04WCD(联想)15.6英寸笔记本电脑(Intel双核C3865U 4G 500G 蓝牙 摄像头 6芯电池 WIN10)', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 2499, '{\"品牌\": \"Thinkpad\", \"商品尺寸\": \"34.7 x 23.6 x 2.2 cm\", \"商品重量\": \"2.1 Kg\", \"电池\": \"1 锂离子电池 电池(附带)\", \"颜色\": \"黑色\", \"屏幕尺寸\": \"15.60 英寸\", \"CPU生产商\": \"Intel\", \"CPU主频\": \"1.60 GHz\", \"CPU核心数量\": \"2\", \"内存容量\": \"4 GB\", \"硬盘容量\": \"500 GB\", \"显卡芯片\": \"Intel HD\", \"显示芯片品牌\": \"inte\", \"显卡类型\": \"集成显卡\", \"电源类型\": \"交流\", \"操作系统\": \"Windows 10\", \"锂电池容量\": \"47 每小时瓦\", \"电池包装类型\": \"电池是装配在该商品内\", \"锂离子的数量\": \"2\"}', 100);
INSERT INTO `product` VALUES ('Fpsr3ErWnuDhN3WuEOKZIxWSWj5XGRSGbbxvlT5kxmAHe29FNv', '【2017新款】Apple iPad 9.7英寸平板电脑(金色) WIFI版 32G', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 2288, '{\"品牌\": \"Apple\", \"型号\": \"iPad\", \"商品尺寸\": \"24 x 16.9 x 0.8 cm\", \"商品重量\": \"467 g\", \"颜色\": \"金色\", \"屏幕尺寸\": \"9.7 英寸\", \"显示最大分辨率\": \"2048×1536\", \"硬盘容量\": \"32 GB\", \"显卡芯片\": \"64 位架构的 A9 芯片\", \"操作系统\": \"iOS 10\", \"电池类型\": \"内置 32.4 瓦时锂聚合物充电电池\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('g6xuhmLgyado2dGZpKkXdYX74E2yiYQFOZsD2BAuGxPkyAinHw', '三星（SAMSUNG）千小E Galaxy Tab E T560 9.6英寸平板电脑 T560（ 四核 8G WIFI版 屏幕分辨率1280*800 Android系统）白色', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 1058, '{\"品牌\": \"Samsung 三星\"}', 100);
INSERT INTO `product` VALUES ('GLgZiXICjRrPFi1NaTX9bPNMnMuKOHuPWoOhZSPztmeJ4BQSKs', '【Surface平板专营店】Microsoft 微软 Surface Book 2 二合一平板笔记本电脑 不带触控笔 顺丰发货 可开专票 (13.5英寸, 八代酷睿i7/8GB/256GB/GTX1050独显)', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 14358, '{\"品牌\": \"Microsoft 微软\", \"颜色\": \"八代酷睿i7/8GB/256GB/GTX1050独显\", \"CPU生产商\": \"Intel\", \"芯片类型\": \"Intel Core i5\", \"CPU主频\": \"2.60 GHz\", \"内存容量\": \"8 GB\", \"内存类型\": \"DDR3 SDRAM\", \"硬盘容量\": \"256 GB\", \"硬盘接口\": \"Serial ATA\", \"硬件平台\": \"Windows\", \"操作系统\": \"Windows Pro\"}', 100);
INSERT INTO `product` VALUES ('Gnvnk8UmW1wzszdpRGQTVuCjPcA8QxJXLjIJjM0DlCZPHr221U', 'Huawei 华为 MateBook X 13英寸全金属超轻薄笔记本电脑(i5-7200U 8G 256G Win10 内含拓展坞)流光金', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 6575, '{\"品牌\": \"Huawei 华为\", \"型号\": \"WT-W09B\", \"商品尺寸\": \"28.6 x 21.1 x 1.2 cm\", \"商品重量\": \"1.05 Kg\", \"电池\": \"1 Lithium Polymer 电池(附带)\", \"颜色\": \"流光金\", \"屏幕尺寸\": \"13 英寸\", \"屏幕分辨率\": \"1280*720\", \"显示最大分辨率\": \"2160x1440\", \"CPU生产商\": \"因特尔\", \"CPU主频\": \"2.50 GHz\", \"内存容量\": \"4 GB\", \"内存类型\": \"DDR3 SDRAM\", \"硬盘容量\": \"256 GB\", \"显卡类型\": \"集成显卡\", \"电源类型\": \"40W智能电源适配器\", \"操作系统\": \"Windows 10\", \"电池类型\": \"锂聚合物\", \"锂电池容量\": \"41.4 每小时瓦\", \"电池包装类型\": \"电池是装配在该商品内\", \"锂离子的数量\": \"1\"}', 100);
INSERT INTO `product` VALUES ('GNX9uuJbYCFd9i5hlqMVK0Yme2FSQtLVR6fzkB26h8779Jw6nP', '安尚 笔记本电脑健康托架NBS-03 散热支架/散热架/多角度支架', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 55, '{\"品牌\": \"actto 安尚\"}', 100);
INSERT INTO `product` VALUES ('H1QPdn54XO0s9MjHGN4lMXaxcTXraoQZbJWa9EJefqiJhhvHqO', 'ThinkPad E470-20H1A02YCD(联想)14英寸笔记本电脑(i3-6006U 4G 500G 2G独显 蓝牙 摄像头 Win10)', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 3099, '{\"品牌\": \"Thinkpad\", \"商品尺寸\": \"34.7 x 23.6 x 2.2 cm\", \"商品重量\": \"1.8 Kg\", \"电池\": \"1 锂离子电池 电池(附带)\", \"颜色\": \"黑色\", \"屏幕尺寸\": \"14 英寸\", \"屏幕分辨率\": \"1366x768\", \"CPU生产商\": \"Intel\", \"CPU主频\": \"2 GHz\", \"内存容量\": \"4 GB\", \"硬盘容量\": \"500 GB\", \"显卡芯片\": \"NVIDIA GeForce 920MX\", \"显示芯片品牌\": \"NVIDIA\", \"显卡类型\": \"独立显卡\", \"显存容量\": \"2 GB\", \"电源类型\": \"交流\", \"操作系统\": \"Windows 10\", \"锂电池容量\": \"47 每小时瓦\", \"电池包装类型\": \"电池是装配在该商品内\", \"锂离子的数量\": \"2\"}', 100);
INSERT INTO `product` VALUES ('H6SGG7aBQ7hB4el4MqZZPl3nuki6EFFiCzEYcD4mCK2PoGZBMs', 'Toto 两档式卷纸器平板置物架（树脂）白色 yh650 tcf8cf65#nw1', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 147.7, '{\"产品颜色\": \"#NW1(白色)\", \"是否需要电池驱动\": \"不是\", \"本商品是否包含电池\": \"不是\"}', 100);
INSERT INTO `product` VALUES ('hIRKHMPa8xT0Pmdli6zzDC0m8Cr1tOXjkbUvLbwH0b2cXpVZGk', 'VTech 伟易达 Light-Up 婴儿触摸平板（简约包装）', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 108.02, '{\"商品尺寸\": \"3 x 20.6 x 15.2 cm\", \"商品重量\": \"454 g\", \"产品颜色\": \"粉色\", \"型号\": \"VTech\", \"厂商推荐适用年龄:\": \"9 个月以上\", \" 是否需要电池 \": \"是\"}', 100);
INSERT INTO `product` VALUES ('HlyAgaJs2IlzSpg5RcGoTNlte6JQoGVXfsn9gnYWrX5U6xATjn', 'Apple iPad 9.7英寸平板电脑(银色) WIFI版 128G【2017款】', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 2988, '{\"品牌\": \"Apple\", \"型号\": \"iPad\", \"商品尺寸\": \"24 x 16.9 x 0.8 cm\", \"商品重量\": \"467 g\", \"颜色\": \"银色\", \"屏幕尺寸\": \"9.7 英寸\", \"显示最大分辨率\": \"2048×1536\", \"硬盘容量\": \"128 GB\", \"显卡芯片\": \"64 位架构的 A9 芯片\", \"操作系统\": \"iOS 10\", \"电池类型\": \"内置 32.4 瓦时锂聚合物充电电池\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('hpqe7FKwZXLma4TOWFGyqlv0e5RYaj8wO8PBsOUhcsEGQXU7FZ', 'Huawei 华为 M3 8.4英寸 平板电脑(2560*1600 麒麟950 哈曼卡顿音效 4G/128G AKG耳机 WiFi)日晖金', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 2258, '{\"品牌\": \"Huawei 华为\", \"型号\": \"BTV-W09\", \"商品尺寸\": \"23.6 x 22 x 4 cm\", \"商品重量\": \"962 g\", \"电池\": \"1 锂离子电池 \", \"颜色\": \"日晖金[128G] WIFI\", \"屏幕尺寸\": \"8.4 英寸\", \"显示最大分辨率\": \"2560x1600\", \"硬盘容量\": \"128 GB\", \"操作系统\": \"Android 6.0\", \"锂电池容量\": \"47 每小时瓦\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('Hu8clX2mCoQ3muBt9gSNoKbeSOsrMNsreTtMIRKdtYQcB5Yhj3', 'Huawei 华为 M3 8.4英寸 平板电脑(2560*1600 麒麟950 哈曼卡顿音效 4G/64G WiFi)日晖金', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 301, '{\"品牌\": \"Huawei 华为\", \"型号\": \"BTV-W09\", \"商品尺寸\": \"23.6 x 22 x 4 cm\", \"商品重量\": \"821 g\", \"电池\": \"1 锂离子电池 \", \"颜色\": \"日晖金[64G] WIFI\", \"屏幕尺寸\": \"8.4 英寸\", \"显示最大分辨率\": \"2560x1600\", \"硬盘容量\": \"64 GB\", \"操作系统\": \"Android 6.0\", \"锂电池容量\": \"47 每小时瓦\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('HUSl2lcPeaEyB9SFwRcOAubHG9sEZlU4MsO7iSSL1JqXuK8jTP', 'Mr. YLLS 商用笔记本电脑背包防 thief 撕 / 防水旅行包适合高达38.10 cm macbook 电脑 USB 充电背包灰色全部 ) 黑色', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 246.68, '{\"品牌\": \"MR. YLLS\", \"商品尺寸\": \"18 x 32 x 41.9 cm\", \"商品重量\": \"635 g\", \"颜色\": \"黑色\", \"屏幕尺寸\": \"17 英寸\"}', 100);
INSERT INTO `product` VALUES ('HWUpn3vCdTAmJROQTqxHlFl8BRNCC0U8IaD2CSkyJQ2WhEZ6DD', 'ThinkPad E470-20H1A01LCD(联想)14英寸笔记本电脑(i5-6200U 4G内存 500G硬盘 2G独显 摄像头 蓝牙 WIN10)', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 3799, '{\"品牌\": \"Thinkpad\", \"商品尺寸\": \"34.7 x 23.6 x 2.2 cm\", \"商品重量\": \"2.1 Kg\", \"电池\": \"1 锂离子电池 电池(附带)\", \"颜色\": \"黑色\", \"屏幕尺寸\": \"14 英寸\", \"屏幕分辨率\": \"1366x768\", \"CPU生产商\": \"Intel\", \"CPU主频\": \"2.30 GHz\", \"内存容量\": \"4 GB\", \"硬盘容量\": \"500 GB\", \"显卡芯片\": \"NVIDIA GeForce 920MX\", \"显示芯片品牌\": \"NVIDIA\", \"显卡类型\": \"独立显卡\", \"显存容量\": \"2 GB\", \"电源类型\": \"交流\", \"操作系统\": \"windows 10\", \"锂电池容量\": \"45 每小时瓦\", \"电池包装类型\": \"电池是装配在该商品内\", \"电池锂含量\": \"0.85 克\", \"锂离子的数量\": \"1\"}', 100);
INSERT INTO `product` VALUES ('hxi2vjcgrvpbNkxDWL2ipwXFfYQ4vAeawTidycBWWoN8Xw09lP', 'DELL 戴尔 Ins灵越燃7000 II 15-7572-R1745S 15.6英寸轻薄窄边框笔记本电脑 i7-8550U 8G 128GSSD+1TB MX150 4G独显 IPS 银 下单送戴尔电脑包鼠标一套 (i7-8550U 8G 128G固态+1TB 4G独显, 银色)', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 6575, '{\"品牌\": \"Dell 戴尔\", \"商品重量\": \"2 Kg\", \"颜色\": \"银色\", \"屏幕尺寸\": \"15.60 英寸\", \"屏幕分辨率\": \"1920X1080\", \"CPU主频\": \"2.50 GHz\", \"CPU核心数量\": \"4\", \"内存容量\": \"8 GB\", \"内存类型\": \"DDR DRAM\", \"硬盘容量\": \"1000 GB\", \"显卡类型\": \"独立显卡\", \"操作系统\": \"win10\"}', 100);
INSERT INTO `product` VALUES ('HXkpBZd3Uv9nQ3H60l4aE9SxitZIHyuga9LamKF8o7X2zoQHCs', '【现货发售】Smartisan 锤子 坚果Pro2 碳黑色（细红线版） 6G+128GB 全网通 移动联通电信4G手机 5.99英寸 双卡双待 顺丰发货 可开专票', 'qz0tG4n27DTunWh8R2yx6C86iEQy4tc1m1vWC8tAUK7mPyfMoe', 2598, '{\"产品颜色\": \"碳黑色\", \"特殊功能\": \"快速充电, 指纹识别, 双卡\", \"网络制式\": \"全网通4G\", \"操作系统\": \"Android\", \"型号\": \"148252-1\"}', 100);
INSERT INTO `product` VALUES ('i4a4PTJrgB1qZAGNuZc0vulYvGKOiBI1DQcOqVZklKKboZp8If', 'SAMSUNG 三星 S8 曲面屏设计 超大屏幕占比 智能手机 全网通智能4G手机 4G+64G 星夜黑 随手机赠送价值288元 MAXCO 美能格 刀锋系列 8000毫安移动电源 5.25按付款先后顺序发顺丰', 'qz0tG4n27DTunWh8R2yx6C86iEQy4tc1m1vWC8tAUK7mPyfMoe', 4999, '{\"产品颜色\": \"黑\", \"功能用途\": \"曲面屏幕\", \"容量\": \"3000 milliamp_hours\", \"特殊功能\": \"支持存储卡, 指纹识别, 曲面屏, 重力感应, 双卡\", \"网络制式\": \"4g全网通, 非4G\", \"操作系统\": \"Android\", \"型号\": \"S8\"}', 100);
INSERT INTO `product` VALUES ('i7lNxUuHcNJSC6sjelBUPmVgtMIsWunq8Qlv7HdHtiZ9xuRMPZ', 'Microsoft 微软 Surface Pro 二合一平板电脑 12.3英寸 中文版(新)酷睿 i5/8GB/256GB/银灰【2017款】(不含触控笔)', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 7488, '{\"品牌\": \"Microsoft 微软\", \"型号\": \"Surface Pro\", \"商品尺寸\": \"29.2 x 20.1 x 0.8 cm\", \"商品重量\": \"771 g\", \"屏幕尺寸\": \"12.3 英寸\", \"显示最大分辨率\": \"2736  x 1824\", \"CPU生产商\": \"Intel\", \"CPU主频\": \"2.60 GHz\", \"CPU核心数量\": \"2\", \"内存容量\": \"8 GB\", \"硬盘容量\": \"256 GB\", \"硬盘描述\": \"SSD\", \"显卡芯片\": \"Intel HD 显卡 620\", \"显示芯片品牌\": \"Intel\", \"计算机无线类型1\": \"802.11bgn\", \"像素\": \"8 megapixels\", \"操作系统\": \"Windows 10\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('IBDfqtGXiI9rWPpb3WCVrorLVn5mDksQTj2dNFHCcmWUS2TTNE', '华为（HUAWEI）华为M3青春版 10.1英寸平板电脑(BAH-W09 1920×1200 8核 4GB＋64GB WIFI)流光金', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 1975, '{\"品牌\": \"Huawei 华为\", \"型号\": \"华为平板M3青春版\", \"商品尺寸\": \"25.2 x 18 x 4.2 cm\", \"商品重量\": \"839 g\", \"颜色\": \"WIFI 4G+64G 金\", \"屏幕尺寸\": \"10.1 英寸\", \"屏幕分辨率\": \"1920*1080\", \"显示最大分辨率\": \"1920*1200\", \"CPU主频\": \"2.50 GHz\", \"内存容量\": \"4 GB\", \"内存类型\": \"DDR3 SDRAM\", \"硬盘容量\": \"64 GB\", \"操作系统\": \"Android 7.0\"}', 100);
INSERT INTO `product` VALUES ('ie6OgsrNlyXNICgEG72ltYHMKdEgzWQE6jKyVZVPmxqKL0GPhS', 'Edifier 漫步者 K800 高品质游戏耳机 电脑耳机 电脑耳麦 黑色', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 59, '{\"商品尺寸\": \"22.8 x 18.2 x 8.2 cm\", \"商品重量\": \"150 g\", \"品牌所属地\": \"中国\", \"包装清单\": \"耳麦 × 1 说明书 × 1 低毒标识卡 × 1\", \"连接技术\": \"3.5mm接头\", \"佩戴方式\": \"头戴式\", \"线控\": \"有线控\", \"功能用途\": \"有线控\"}', 100);
INSERT INTO `product` VALUES ('IE7JcRhMgqO4bHwYKqVWKjKGjSUUJ2LlzEXwSUff2Xi22QBf4f', 'DELL 戴尔 Ins灵越 7775-R1D48A 27英寸微边框VR一体机电脑 (AMD Ryzen 5 1400 8G 1T RX560 4G独显 FHD WIN10) (AMD Ryzen 5 1400 8G 1TB 4G独显, 银灰色)', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 7190, '{}', 100);
INSERT INTO `product` VALUES ('IGKNFsrpqGUH5SqRzfMl35FzmDYQtCwAtvwvuz6JZ35x1dgqhX', 'Apple 苹果 MacBook Air 13.3英寸笔记本电脑 MQD32CH/A银色 Core i5/8G内存/128G固态硬盘 1.8GHz 双核 Intel Core i5 处理器 苹果电脑【2017款】', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 6188, '{\"品牌\": \"Apple\", \"型号\": \"MacBook Air\", \"商品尺寸\": \"42.7 x 34 x 12.3 cm\", \"商品重量\": \"3.08 Kg\", \"颜色\": \"13.3/1.8GHZ/8GB/128GB-CHN\", \"屏幕尺寸\": \"13.3 英寸\", \"CPU生产商\": \"Intel\", \"CPU核心数量\": \"2\", \"硬盘容量\": \"128 GB\", \"硬盘描述\": \"固态硬盘\", \"显示芯片品牌\": \"Intel\", \"显卡类型\": \"集成显卡\", \"操作系统\": \"macOS\", \"锂电池容量\": \"54 每小时瓦\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('iRWOYs0BBbkOMyI51I3Wr8m2xaGxulsT2O2CDLTTJmz4q6sfhr', 'WORKPRO 万克宝 iphone6S螺丝刀修理套装三星苹果小m手机维修拆机工具起子吸盘撬棒 W021190N（供应商直送）', 'qz0tG4n27DTunWh8R2yx6C86iEQy4tc1m1vWC8tAUK7mPyfMoe', 22, '{\"型号 / 款号\": \"W021190N\", \"产品颜色\": \"红蓝\", \"品牌所属地\": \"中国\", \"包装清单\": \"钟表手柄*1；尼龙撬棒*1；卡槽顶针*1；吸盘*1；批头*12；工具盒*1\", \"本商品是否包含电池\": \"不是\"}', 100);
INSERT INTO `product` VALUES ('JKj1TeTx9wZAtRulmCiWXQT28xUsJEgz2nlysRPOwU1fmZ7wcH', 'Moveski 摩维凯 HDMI转换器7585C VGA显示转换头【苹果转HDMI VGA双口 配电源线】支持iphone6 7 8iPad 手机转电视投影仪', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 145, '{\"品牌\": \"Moveski 摩维凯\", \"商品尺寸\": \"15.8 x 11 x 2.6 cm\", \"商品重量\": \"59 g\", \"颜色\": \"苹果转HDMI+VGA双口\"}', 100);
INSERT INTO `product` VALUES ('jN2LB84Ghaosqb6Z0VVGZ9K1AHE9e37iXFJ4KsBW0MjFxk7zg1', 'Apple 苹果 MacBook Pro 13英寸笔记本电脑 17款/i5/8G/256G/MPXU2CH/A 2.3GHz 双核 Intel Core i5 处理器 银色 苹果电脑 不带touch-bar【2017款】', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 10848, '{\"品牌\": \"Apple\", \"型号\": \"MacBook Pro\", \"商品尺寸\": \"36.5 x 9.4 x 26.2 cm\", \"商品重量\": \"2.76 Kg\", \"颜色\": \"13英寸 2.3GHZ/8GB/256GB 银色\", \"屏幕尺寸\": \"13 英寸\", \"屏幕分辨率\": \"2560 x 1600 (227 ppi)\", \"显示最大分辨率\": \"2560 x 1600\", \"CPU生产商\": \"Intel\", \"CPU主频\": \"2.30 GHz\", \"CPU核心数量\": \"2\", \"内存容量\": \"8 GB\", \"硬盘容量\": \"256 GB\", \"显示芯片品牌\": \"Intel\", \"显卡类型\": \"集成显卡\", \"操作系统\": \"macOS\", \"电池续航时间（小时）\": \"10 小时\", \"锂电池容量\": \"54.5 每小时瓦\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('Jn9v0onrEq4cWzQoUtaRTyzYMgE7UzBwVDD5ZYYb1bHMKuMPKa', '【2017新款】Apple iPad 9.7英寸平板电脑(金色) WIFI版 128G', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 2988, '{\"品牌\": \"Apple\", \"型号\": \"iPad\", \"商品尺寸\": \"24 x 16.9 x 0.8 cm\", \"商品重量\": \"467 g\", \"颜色\": \"金色\", \"屏幕尺寸\": \"9.7 英寸\", \"显示最大分辨率\": \"2048×1536\", \"硬盘容量\": \"128 GB\", \"显卡芯片\": \"64 位架构的 A9 芯片\", \"操作系统\": \"iOS 10\", \"电池类型\": \"内置 32.4 瓦时锂聚合物充电电池\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('JPtUSPUYDbYhzu9n2YbCWOxMxTgR8DUoFG0IUyANsNGwIMZOsc', 'Huawei 华为 M3青春版 8.0英寸平板电脑(CPN-W09 1920×1200 8核 3GB＋32GB WIFI)皎月白', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 1499, '{\"品牌\": \"Huawei 华为\", \"型号\": \"M3青春版\", \"商品尺寸\": \"21.3 x 12.3 x 0.8 cm\", \"商品重量\": \"308 g\", \"颜色\": \"WIFI 3G+32G 白\", \"屏幕尺寸\": \"8 英寸\", \"显示最大分辨率\": \"1920x1200\", \"硬盘容量\": \"32 GB\", \"操作系统\": \"Android 7.0\"}', 100);
INSERT INTO `product` VALUES ('JVBYK5XAYqsJ8u2KriTrB4G4KnbzHcW0w5JUwu0uc1EoVfZb9i', 'Apple iPad 9.7英寸平板电脑(银色) WIFI版 32G 【2017款】', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 2288, '{\"品牌\": \"Apple\", \"型号\": \"iPad\", \"商品尺寸\": \"24 x 16.9 x 0.8 cm\", \"商品重量\": \"467 g\", \"颜色\": \"银色\", \"屏幕尺寸\": \"9.7 英寸\", \"显示最大分辨率\": \"2048×1536\", \"硬盘容量\": \"32 GB\", \"显卡芯片\": \"64 位架构的 A9 芯片\", \"操作系统\": \"iOS 10\", \"电池类型\": \"内置 32.4 瓦时锂聚合物充电电池\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('JWNVQXEL9gOAeCqKXnrfl4kBOIcabeXIVPbqyXrShlNwcYmVm3', 'ASUS 华硕 10.1英寸 Transformer Mini T102HA-D4-GR，2英寸触摸屏笔记本电脑，Intel Quad-Core Atom，4GB RAM，128GB EMMC，带笔和键盘', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 2527.94, '{\"品牌\": \"ASUS 华硕\", \"型号\": \"Transformer Book\", \"商品尺寸\": \"17 x 25.9 x 1.3 cm\", \"商品重量\": \"771 g\", \"电池\": \"1 Lithium Polymer 电池(附带)\", \"屏幕尺寸\": \"10.1 英寸\", \"显示最大分辨率\": \"1280 x 800\", \"CPU生产商\": \"Intel\", \"芯片类型\": \"None\", \"CPU主频\": \"1.44 GHz\", \"CPU核心数量\": \"4\", \"内存容量\": \"4 GB\", \"内存类型\": \"DDR3 SDRAM\", \"Max. unterstützte Größe\": \"4 GB\", \"硬盘描述\": \"emmc\", \"显卡类型\": \"Integrated\", \"计算机无线类型1\": \"802.11 A/C\", \"USB 2.0接口\": \"1\", \" 电压 \": \"9 伏特\", \"操作系统\": \"Windows 10\", \"电池续航时间（小时）\": \"11 小时\", \"锂电池容量\": \"32 每小时瓦\", \"电池包装类型\": \"电池是装配在该商品内\", \"电池锂含量\": \"0.87 克\", \"锂离子的数量\": \"3\"}', 100);
INSERT INTO `product` VALUES ('KaBu18hhOXjFhbhi2TNBqwrrBUyPPxZoVssVGPbjEyWqpKjO2G', 'Apple 苹果 MacBook Pro 13英寸笔记本电脑 17款/i5/8G/256G/MPXU2CH/A 2.3GHz 双核 Intel Core i5 处理器 银色 苹果电脑 不带touch-bar【2017款】', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 10848, '{\"品牌\": \"Apple\", \"型号\": \"MacBook Pro\", \"商品尺寸\": \"36.5 x 9.4 x 26.2 cm\", \"商品重量\": \"2.76 Kg\", \"颜色\": \"13英寸 2.3GHZ/8GB/256GB 银色\", \"屏幕尺寸\": \"13 英寸\", \"屏幕分辨率\": \"2560 x 1600 (227 ppi)\", \"显示最大分辨率\": \"2560 x 1600\", \"CPU生产商\": \"Intel\", \"CPU主频\": \"2.30 GHz\", \"CPU核心数量\": \"2\", \"内存容量\": \"8 GB\", \"硬盘容量\": \"256 GB\", \"显示芯片品牌\": \"Intel\", \"显卡类型\": \"集成显卡\", \"操作系统\": \"macOS\", \"电池续航时间（小时）\": \"10 小时\", \"锂电池容量\": \"54.5 每小时瓦\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('kCyhlxNL2o3lmFU2zEQi0g6ZvZl9YuH87vMdEy2SRFuWd81o9B', '【Surface平板专营店】Microsoft 微软 Surface Book 2 二合一平板笔记本电脑 不带触控笔 顺丰发货 可开专票 (13.5英寸, 八代酷睿i7/16GB/1TB/GTX1050独显)', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 22058, '{\"品牌\": \"Microsoft 微软\", \"颜色\": \"八代酷睿i7/16GB/1TB/GTX1050独显\", \"CPU生产商\": \"Intel\", \"芯片类型\": \"Intel Core i5\", \"CPU主频\": \"2.60 GHz\", \"内存容量\": \"8 GB\", \"内存类型\": \"DDR3 SDRAM\", \"硬盘容量\": \"256 GB\", \"硬盘接口\": \"Serial ATA\", \"硬件平台\": \"Windows\", \"操作系统\": \"Windows Pro\"}', 100);
INSERT INTO `product` VALUES ('kFZKrcFaJFz9XQplxhOdqnaIyUk46TZKC7PrUTVbb8Ndwz4Dhp', 'ThinkPad E570-20H5A04WCD(联想)15.6英寸笔记本电脑(Intel双核C3865U 4G 500G 蓝牙 摄像头 6芯电池 WIN10)', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 2499, '{\"品牌\": \"Thinkpad\", \"商品尺寸\": \"34.7 x 23.6 x 2.2 cm\", \"商品重量\": \"2.1 Kg\", \"电池\": \"1 锂离子电池 电池(附带)\", \"颜色\": \"黑色\", \"屏幕尺寸\": \"15.60 英寸\", \"CPU生产商\": \"Intel\", \"CPU主频\": \"1.60 GHz\", \"CPU核心数量\": \"2\", \"内存容量\": \"4 GB\", \"硬盘容量\": \"500 GB\", \"显卡芯片\": \"Intel HD\", \"显示芯片品牌\": \"inte\", \"显卡类型\": \"集成显卡\", \"电源类型\": \"交流\", \"操作系统\": \"Windows 10\", \"锂电池容量\": \"47 每小时瓦\", \"电池包装类型\": \"电池是装配在该商品内\", \"锂离子的数量\": \"2\"}', 100);
INSERT INTO `product` VALUES ('kVNnEOW5frXCiaIP8x9kxSsLcjG3dey3gfhBgmbzeCY1tQANvt', 'Apple 苹果 MacBook Air 13.3英寸笔记本电脑 MQD32CH/A银色 Core i5/8G内存/128G固态硬盘 1.8GHz 双核 Intel Core i5 处理器 苹果电脑【2017款】', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 6188, '{\"品牌\": \"Apple\", \"型号\": \"MacBook Air\", \"商品尺寸\": \"42.7 x 34 x 12.3 cm\", \"商品重量\": \"3.08 Kg\", \"颜色\": \"13.3/1.8GHZ/8GB/128GB-CHN\", \"屏幕尺寸\": \"13.3 英寸\", \"CPU生产商\": \"Intel\", \"CPU核心数量\": \"2\", \"硬盘容量\": \"128 GB\", \"硬盘描述\": \"固态硬盘\", \"显示芯片品牌\": \"Intel\", \"显卡类型\": \"集成显卡\", \"操作系统\": \"macOS\", \"锂电池容量\": \"54 每小时瓦\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('KWa5jKT15k0gAPZd7BdUFiG414TiiXnQSHrbz15i1J7khn48gU', '【2017新款】Apple iPad 9.7英寸平板电脑(金色) WIFI版 128G', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 2988, '{\"品牌\": \"Apple\", \"型号\": \"iPad\", \"商品尺寸\": \"24 x 16.9 x 0.8 cm\", \"商品重量\": \"467 g\", \"颜色\": \"金色\", \"屏幕尺寸\": \"9.7 英寸\", \"显示最大分辨率\": \"2048×1536\", \"硬盘容量\": \"128 GB\", \"显卡芯片\": \"64 位架构的 A9 芯片\", \"操作系统\": \"iOS 10\", \"电池类型\": \"内置 32.4 瓦时锂聚合物充电电池\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('L8UORrOn9hHtU3zxKnzwiAcPJnLJfdp1QGOMYucLUwqFUSvWEC', '可茵慈德国进口一次性擦镜布眼镜清洁纸湿巾擦屏幕镜头纸50片买5免1 适用iphone iPad MacBook 平板电脑 电视 手机屏幕 机身 相机镜头 键盘', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 23, '{\"商品尺寸\": \"10 x 8 x 6.5 cm\", \"包装尺寸\": \"10 x 8 x 6.5 cm\", \"尺寸\\n\": \"50\"}', 100);
INSERT INTO `product` VALUES ('LfnUEcwpeY3VE2i81YaVXNN44Bsq1epN7wSZdJDDdcPCd3lcOX', 'LeapFrog EPIC 水果忍者套装包括 EPIC android-based 儿童平板电脑', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 244.83, '{\"商品尺寸\": \"28.2 x 4.1 x 27.2 cm\", \"商品重量\": \"907 g\", \"产品颜色\": \"绿色\", \"Size\": \"()\", \"厂商推荐适用年龄:\": \"24 个月以上\", \"材质\": \"塑料、金属\", \"片数\": \"1\", \" 是否需要电池 \": \"是\"}', 100);
INSERT INTO `product` VALUES ('lOHaJtPAkbAJMWzFTCiTjb8uc4bRWhlcM4oM6kJiwtzc4Tz7Qu', '【2017新款】Apple iPad 9.7英寸平板电脑(金色) WIFI版 128G', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 2988, '{\"品牌\": \"Apple\", \"型号\": \"iPad\", \"商品尺寸\": \"24 x 16.9 x 0.8 cm\", \"商品重量\": \"467 g\", \"颜色\": \"金色\", \"屏幕尺寸\": \"9.7 英寸\", \"显示最大分辨率\": \"2048×1536\", \"硬盘容量\": \"128 GB\", \"显卡芯片\": \"64 位架构的 A9 芯片\", \"操作系统\": \"iOS 10\", \"电池类型\": \"内置 32.4 瓦时锂聚合物充电电池\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('lOPTKxbtyFrySJSaRzxkK4PkD0nd5Kl2zhyFvJ5zPC5RuWjmpH', 'Toto 两档式卷纸器平板置物架（树脂）白色 yh650 tcf8cf65#nw1', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 147.7, '{\"产品颜色\": \"#NW1(白色)\", \"是否需要电池驱动\": \"不是\", \"本商品是否包含电池\": \"不是\"}', 100);
INSERT INTO `product` VALUES ('Luw97gg9pUYB8Np7C5aWfFaXjwQRSdNFa9SkZ0jWYBNwRefVie', '华为（HUAWEI）华为M3青春版 10.1英寸平板电脑(BAH-W09 1920×1200 8核 4GB＋64GB WIFI)流光金', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 1975, '{\"品牌\": \"Huawei 华为\", \"型号\": \"华为平板M3青春版\", \"商品尺寸\": \"25.2 x 18 x 4.2 cm\", \"商品重量\": \"839 g\", \"颜色\": \"WIFI 4G+64G 金\", \"屏幕尺寸\": \"10.1 英寸\", \"屏幕分辨率\": \"1920*1080\", \"显示最大分辨率\": \"1920*1200\", \"CPU主频\": \"2.50 GHz\", \"内存容量\": \"4 GB\", \"内存类型\": \"DDR3 SDRAM\", \"硬盘容量\": \"64 GB\", \"操作系统\": \"Android 7.0\"}', 100);
INSERT INTO `product` VALUES ('LYFnk7WkNXP3VIP6sAd8AszpPI3EHxspE1p09dFD7tcBfmtOU0', '三星（SAMSUNG）Tab A T350C 8.0英寸4：3屏幕 四核Android 5.0系统 平板电脑 WiFi版(白色 官方标配 不支持电话功能 )', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 1458, '{\"商品尺寸\": \"21.6 x 14.6 x 4.8 cm\", \"商品重量\": \"522 g\", \"操作系统\": \"android\"}', 100);
INSERT INTO `product` VALUES ('MCA3M2rluv9VWTZ8oRejziVb9aTE973VvIeWfTA9hu4C7MvuNh', '【2017新款】Apple iPad 9.7英寸平板电脑(金色) WIFI版 128G', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 2988, '{\"品牌\": \"Apple\", \"型号\": \"iPad\", \"商品尺寸\": \"24 x 16.9 x 0.8 cm\", \"商品重量\": \"467 g\", \"颜色\": \"金色\", \"屏幕尺寸\": \"9.7 英寸\", \"显示最大分辨率\": \"2048×1536\", \"硬盘容量\": \"128 GB\", \"显卡芯片\": \"64 位架构的 A9 芯片\", \"操作系统\": \"iOS 10\", \"电池类型\": \"内置 32.4 瓦时锂聚合物充电电池\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('MJLYphwF7AUcCZ6UfO5mwAantkaSKTCR15DMeoCIXj9Cfstefq', 'Lenovo联想 H3005/家用办公台式电脑主机/AMD E1-6010双核处理器/2G DDR3内存（升级至4G)/500G硬盘/高性能集成显卡/内置100M网卡/USB2.0+USB3.0/USB键盘鼠标套装/黑色', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 2015, '{\"品牌\": \"Lenovo 联想\", \"颜色\": \"黑色\", \"CPU生产商\": \"AMD\", \"CPU主频\": \"1.35 GHz\", \"内存容量\": \"4 GB\", \"存储技术\": \"DDR3\", \"内存类型\": \"DDR3 SDRAM\", \"硬盘容量\": \"500 GB\", \"硬盘接口\": \"Serial ATA\", \"显卡类型\": \"集成显卡\", \" 电压 \": \"220 伏特\", \"电源类型\": \"直流\", \"硬件平台\": \"PC\", \"操作系统\": \"Windows_7\"}', 100);
INSERT INTO `product` VALUES ('mlbzDPP46B1eUDM2ZVbHLVcEGKIZblXX1wNLT7dm33gMgV7Akg', 'USB 闪存驱动器外接存储 USB *棒 DRIVE with 闪电 USB Type-C 端口适用于 Apple iphone ipad IOS Android 平板电脑 Mac PC 连接器4合1来自 elekmall 64G+Necklace', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 479.67, '{\"品牌\": \"Elekmall\", \"商品尺寸\": \"4.6 x 4.6 x 0.5 cm\", \"商品重量\": \"113 g\", \"颜色\": \"64G+Necklace\", \"电源类型\": \"USB\", \"硬件平台\": \"PC, Mac\"}', 100);
INSERT INTO `product` VALUES ('MO2Ke6CB90Ewq6GrO5eCiewXwgKeJIgbh9xnAgm0G0WzNq6syx', 'sweetleaf stevia 平板电脑100个6件装', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 224.39, '{\"品牌\": \"SweetLeaf\", \"商品尺寸\": \"19.8 x 8.6 x 7.9 cm\", \"商品重量\": \"68 g\", \"制造商\": \"Wisdom Natural Brands\"}', 100);
INSERT INTO `product` VALUES ('MSPl05pG3RlaILsKWFzkH3BiA7ne32irJ96aAVKUBvj1lVxhJK', '【下单送包鼠】ThinkPad New S2-20J3A00YCD(联想）13.3英寸IBM商务超极本笔记本电脑（intel双核C3865U 4G内存 128G固态硬盘 蓝牙 摄像头 Win10）银色', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 3981, '{\"品牌\": \"Thinkpad\", \"商品尺寸\": \"47.2 x 30.4 x 7.8 cm\", \"商品重量\": \"1.5 Kg\", \"电池\": \"1 Lithium Polymer 电池(附带)\", \"颜色\": \"银\", \"屏幕尺寸\": \"13.30 英寸\", \"屏幕分辨率\": \"1366x768\", \"CPU生产商\": \"Intel\", \"CPU主频\": \"1.80 GHz\", \"CPU核心数量\": \"2\", \"内存容量\": \"4 GB\", \"内存类型\": \"DDR SDRAM\", \"硬盘容量\": \"128 GB\", \"硬盘描述\": \"128G固态硬盘\", \"显卡芯片\": \"Intel HD Graphics 610\", \"显卡类型\": \"集成显卡\", \"操作系统\": \"Windows10\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('mYJdthslRcjCE7SbE2BmKVFKFdQIrHXAA0C09bnWEHgN9yK8qM', 'Prisma德国电脑护目镜glass 防蓝光率95% 选配近视框游戏眼镜男女款 lite镜片 s-704 (不带可拆卸近视框)', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 649, '{\"商品尺寸\": \"18.4 x 14.7 x 7.2 cm\", \"商品重量\": \"22.7 g\", \"尺寸\\n\": \"不带可拆卸近视框\"}', 100);
INSERT INTO `product` VALUES ('nhO8efiznB92GAOxLSlONVa7PDmDGOGo7htP6KvmMFDHsCMsOL', 'Moveski 摩维凯 HDMI转换器7585C VGA显示转换头【苹果转HDMI VGA双口 配电源线】支持iphone6 7 8iPad 手机转电视投影仪', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 145, '{\"品牌\": \"Moveski 摩维凯\", \"商品尺寸\": \"15.8 x 11 x 2.6 cm\", \"商品重量\": \"59 g\", \"颜色\": \"苹果转HDMI+VGA双口\"}', 100);
INSERT INTO `product` VALUES ('nq7m8booWhUTQ2BKz2BY7KUbjBb6Eus0WtfNwCvrJUcCYtqDgl', '戴尔（DELL）Vostro 5460-R2548BS 23.8英寸一体机电脑 （i5-7400T 8G 1TB +128GB SSD 4GB独显 Win10 三年上门）银', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 5649, '{\"品牌\": \"Dell 戴尔\", \"商品尺寸\": \"88 x 78 x 43 cm\", \"商品重量\": \"11 Kg\", \"颜色\": \"银色\", \"屏幕尺寸\": \"23.80 英寸\", \"屏幕分辨率\": \"1920X1080\", \"CPU生产商\": \"Intel\", \"内存容量\": \"8 GB\", \"存储技术\": \"DDR3 1600MHZ\", \"内存类型\": \"DDR3 SDRAM\", \"硬盘容量\": \"1 TB\", \"硬盘描述\": \"1TB 7200RPM\", \"操作系统\": \"Windows10\"}', 100);
INSERT INTO `product` VALUES ('O10N1NCuzP5fVqgpPoVisS31uhPhnUp09cnzB317RJ7vfCnKi8', 'Edifier 漫步者 K800 高品质游戏耳机 电脑耳机 电脑耳麦 黑色', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 59, '{\"商品尺寸\": \"22.8 x 18.2 x 8.2 cm\", \"商品重量\": \"150 g\", \"品牌所属地\": \"中国\", \"包装清单\": \"耳麦 × 1 说明书 × 1 低毒标识卡 × 1\", \"连接技术\": \"3.5mm接头\", \"佩戴方式\": \"头戴式\", \"线控\": \"有线控\", \"功能用途\": \"有线控\"}', 100);
INSERT INTO `product` VALUES ('O4rCM3eOjwuTMJmmeKhkRsIzbDrz1OHiCf5CMkDAaDeGNN8D44', 'AWINNER Type C 充电数据线 usb-c快速充电线 高速传输线 通用于华为 honor 荣耀 P9/P10、三星Note 8,S8、魅族 PRO5、6、乐视2、谷歌Nexus 6P, Nexus 5X、一加Type-C接口的手机与平板 快充(1米,黑色)', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 29.99, '{\"商品尺寸\": \"15 x 12 x 2 cm\", \"商品重量\": \"18.1 g\", \"产品颜色\": \"黑色\"}', 100);
INSERT INTO `product` VALUES ('o6im5d65KLTxjPKmT3iJ7o5EyEedmy5YZQNiUrylv7ONycwSWv', 'Microsoft 微软 Surface Pro 二合一平板电脑 12.3英寸 中文版(新)酷睿 m3/4GB/128GB/银灰【2017款】(不含触控笔)', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 4875, '{\"品牌\": \"Microsoft 微软\", \"型号\": \"Surface Pro\", \"商品尺寸\": \"29.2 x 20.1 x 0.8 cm\", \"商品重量\": \"767 g\", \"屏幕尺寸\": \"12.3 英寸\", \"显示最大分辨率\": \"2736  x 1824\", \"CPU生产商\": \"Intel\", \"CPU主频\": \"1 GHz\", \"硬盘容量\": \"128 GB\", \"硬盘描述\": \"SSD\", \"显卡芯片\": \"Intel HD 显卡 615\", \"显示芯片品牌\": \"Intel\", \"操作系统\": \"Windows 10\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('O7xWiv3EwgFLJMg1WSaSz95bDul9CtOCbUXqcAm3hATxaViNz7', '【Surface平板专营店】Microsoft 微软 Surface Book 2 二合一平板笔记本电脑 不带触控笔 顺丰发货 可开专票 (15英寸, 八代酷睿i7/16GB/1TB/GTX1060独显)', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 26488, '{\"品牌\": \"Microsoft 微软\", \"颜色\": \"八代酷睿i7/16GB/1TB/GTX1060独显\", \"CPU生产商\": \"Intel\", \"芯片类型\": \"Intel Core i5\", \"CPU主频\": \"2.60 GHz\", \"内存容量\": \"8 GB\", \"内存类型\": \"DDR3 SDRAM\", \"硬盘容量\": \"256 GB\", \"硬盘接口\": \"Serial ATA\", \"硬件平台\": \"Windows\", \"操作系统\": \"Windows Pro\"}', 100);
INSERT INTO `product` VALUES ('obp8oWgbSx8yjYCbbWooyg3gQxpFLk4yCu4Y6M6YQS60u1s96S', 'Huawei 华为 M3 8.4英寸 通话平板电脑(2560*1600 麒麟950 哈曼卡顿音效 4G/64G LTE)日晖金', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 2288, '{\"品牌\": \"Huawei 华为\", \"型号\": \"BTV-DL09\", \"商品尺寸\": \"25.4 x 22.4 x 3.2 cm\", \"商品重量\": \"839 g\", \"电池\": \"1 锂离子电池 \", \"颜色\": \"日晖金[64G] LTE\", \"屏幕尺寸\": \"8.4 英寸\", \"显示最大分辨率\": \"2560x1600\", \"CPU主频\": \"2.30 GHz\", \"硬盘容量\": \"64 GB\", \"操作系统\": \"Android 6.0\", \"锂电池容量\": \"47 每小时瓦\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('OKJucJbwCsekFCDjxt3mlqnuw1dEz2XwToFczzKOrLAKMrngxF', '戴尔（DELL）Ins15-5576-R1845B 灵越游匣SPEED游戏笔记本电脑（八核FX-9830P 8G 256GB AMD RX460 4G独显 15.6”FHD 1920*1080高清屏 正版Win10 预装office2016 2年全国联保）', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 5086, '{}', 100);
INSERT INTO `product` VALUES ('ORnvcVxiiyzZJBbmVW6Mp2CunYCrvBNsXwDmCLWyywtvAvxD7R', 'Apple 苹果 MacBook Air 13.3英寸笔记本电脑 MQD42CH/A 双核 i5/8GB内存/256GB固态硬盘 1.8GHz 双核 Intel Core i5 处理器 苹果电脑【2017款】', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 7388, '{\"品牌\": \"Apple\", \"型号\": \"MacBook Air\", \"商品尺寸\": \"42.7 x 34 x 12.3 cm\", \"商品重量\": \"3.08 Kg\", \"颜色\": \"银色\", \"屏幕尺寸\": \"13.3 英寸\", \"CPU生产商\": \"Intel\", \"CPU核心数量\": \"2\", \"内存容量\": \"8 GB\", \"硬盘容量\": \"256 GB\", \"硬盘描述\": \"固态硬盘\", \"显示芯片品牌\": \"Intel\", \"显卡类型\": \"集成显卡\", \"操作系统\": \"macOS\", \"锂电池容量\": \"54 每小时瓦\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('P2TBEWNElctRQTVtdtdjIiEuUMZ8SZvl5ckBaI6u0bsZCdBMCK', '可茵慈德国进口一次性擦镜布眼镜清洁纸湿巾擦屏幕镜头纸50片买5免1 适用iphone iPad MacBook 平板电脑 电视 手机屏幕 机身 相机镜头 键盘', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 23, '{\"商品尺寸\": \"10 x 8 x 6.5 cm\", \"包装尺寸\": \"10 x 8 x 6.5 cm\", \"尺寸\\n\": \"50\"}', 100);
INSERT INTO `product` VALUES ('pj9IEgQwus8AMF7tbOZ9VqQmmGP0Yac8r3aOeMFQVA8X258wq6', '华为（HUAWEI）华为M3青春版 10.1英寸平板电脑(BAH-W09 1920×1200 8核 3GB＋32GB WIFI)苍穹灰', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 1715, '{\"品牌\": \"Huawei 华为\", \"型号\": \"华为平板M3青春版\", \"商品尺寸\": \"24.1 x 17.1 x 0.7 cm\", \"商品重量\": \"308 g\", \"颜色\": \"WIFI 3G+32G 灰\", \"屏幕尺寸\": \"10.1 英寸\", \"屏幕分辨率\": \"1920*1080\", \"显示最大分辨率\": \"1920*1200\", \"CPU主频\": \"2.50 GHz\", \"内存容量\": \"3 GB\", \"内存类型\": \"DDR3 SDRAM\", \"硬盘容量\": \"32 GB\", \"操作系统\": \"Android 7.0\"}', 100);
INSERT INTO `product` VALUES ('pr6zhk4Y95ffAVZPbIuZFxAnpHNaAsdOVYs69oe5lKPSwm1PxD', 'Huawei 华为 M3 8.4英寸 平板电脑(2560*1600 麒麟950 哈曼卡顿音效 4G/64G WiFi)日晖金', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 301, '{\"品牌\": \"Huawei 华为\", \"型号\": \"BTV-W09\", \"商品尺寸\": \"23.6 x 22 x 4 cm\", \"商品重量\": \"821 g\", \"电池\": \"1 锂离子电池 \", \"颜色\": \"日晖金[64G] WIFI\", \"屏幕尺寸\": \"8.4 英寸\", \"显示最大分辨率\": \"2560x1600\", \"硬盘容量\": \"64 GB\", \"操作系统\": \"Android 6.0\", \"锂电池容量\": \"47 每小时瓦\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('PyllyxxQBdNXo4lqIep3eMjz31dYGtwkDnrBSyyz6jaXlF7HHV', 'Brother P-Touch Cube 标签水鏡', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 438.19, '{\"ASIN\": \"B06Y17WNGK\", \"用户评分\": \"\\n  \\n    分享我的评价\\n  \\n\", \"亚马逊热销商品排名\": \"\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n办公用品商品里排第312名 (查看销售排行榜)\\n \\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n    \\n    第2位\\n    - 办公用品 > 办公设备 > 打印机 > 标签打印机\\n    \\n    \\n    第2位\\n    - 办公用品 > 办公设备 > 商超设备\\n    \\n    \\n    第19位\\n    - 家居装修 > 劳保安防清洁用品\\n    \\n\\n\", \"发货重量\": \"662 g\", \"Amazon.cn上架时间\": \"2017年12月27日\"}', 100);
INSERT INTO `product` VALUES ('q88Sb8tW8zZugmr4ej3eCWTCW5lJEmEFhWY8PjFxgZKWI95jRT', 'ThinkPad E470-20H1A01LCD(联想)14英寸笔记本电脑(i5-6200U 4G内存 500G硬盘 2G独显 摄像头 蓝牙 WIN10)', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 3799, '{\"品牌\": \"Thinkpad\", \"商品尺寸\": \"34.7 x 23.6 x 2.2 cm\", \"商品重量\": \"2.1 Kg\", \"电池\": \"1 锂离子电池 电池(附带)\", \"颜色\": \"黑色\", \"屏幕尺寸\": \"14 英寸\", \"屏幕分辨率\": \"1366x768\", \"CPU生产商\": \"Intel\", \"CPU主频\": \"2.30 GHz\", \"内存容量\": \"4 GB\", \"硬盘容量\": \"500 GB\", \"显卡芯片\": \"NVIDIA GeForce 920MX\", \"显示芯片品牌\": \"NVIDIA\", \"显卡类型\": \"独立显卡\", \"显存容量\": \"2 GB\", \"电源类型\": \"交流\", \"操作系统\": \"windows 10\", \"锂电池容量\": \"45 每小时瓦\", \"电池包装类型\": \"电池是装配在该商品内\", \"电池锂含量\": \"0.85 克\", \"锂离子的数量\": \"1\"}', 100);
INSERT INTO `product` VALUES ('Q9LKqlzxnOUDzndPjCCpjI8eZVA7zfx0UNynW6pR9ULJGyUlXJ', 'Panasonic 松下 7kg全自动大容量清净乐波轮洗衣机XQB70-Q27H2F(供应商直送)赠品：松下衣物护理套装', 'QKZDcx97eVbAMGocGBlNn2wv9cMJcgFrxQlfPMKONVn5ad5Kb9', 338, '{\"Brand\": \"Panasonic 松下\", \"Model\": \"XQB70-Q27H2F\", \"商品尺寸\": \"56.1 x 53.1 x 92 cm\", \"商品重量\": \"30 Kg\", \"型号\": \"XQB70-Q27H2F\", \"产地\": \"浙江\", \" 效率 \": \"3级\", \" 容量 \": \"7 公斤\", \" 零件编号 \": \"XQB70-Q27H2F\", \" 类型 \": \"波轮式\", \"Color\": \"浅灰色\", \" 控制类型 \": \"全自动\", \"瓦数\": \"260 瓦特\", \" 适用容量 \": \"7kg\", \" 包括的配件 \": \"洗衣机一台;进水管一根;进水管接头一个;底板一块\", \" 是否需要电池 \": \"不是\", \" 重量 \": \"30 公斤\"}', 100);
INSERT INTO `product` VALUES ('qAutJ6uCpWZVjmFVQt3CG1Twzd0K195uxuUxk0z0ocv9idlXlR', 'Lenovo 联想 Yoga Tablet B6000-F 8.0英寸平板电脑(1.2G主频 1GB内存 16GB存储 蓝牙 802.11bgn 前后摄像头 GPS 内置重力感应器 光线感应器 指南针 霍尔传感器 10点触摸屏 Android 4.2 铂银色)', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 1099, '{\"品牌\": \"Lenovo 联想\", \"型号\": \"B6000\", \"商品尺寸\": \"22.4 x 15.4 x 5.2 cm\", \"商品重量\": \"1.9 Kg\", \"颜色\": \"铂银色\", \"屏幕尺寸\": \"8 英寸\", \"显示最大分辨率\": \"1280x800\", \"CPU生产商\": \"MTK\", \"CPU主频\": \"1.2 GHz\", \"内存容量\": \"1 GB\", \"存储技术\": \"LP-DDR2\", \"硬盘容量\": \"16 GB\", \"显卡类型\": \"集成显卡\", \"操作系统\": \"Android4.2\", \"电池类型\": \"高性能锂离子电池6000mAh\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('qBHOq5OHUDACYs6Xjlaxx3fQiP8Ka4qxRjKWZhe36EBCJvzgoU', 'Apple iPad 9.7英寸平板电脑(深空灰色) WIFI版 128G 【2017款】', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 2988, '{\"品牌\": \"Apple\", \"型号\": \"iPad\", \"商品尺寸\": \"24 x 16.9 x 0.8 cm\", \"商品重量\": \"467 g\", \"颜色\": \"深空灰色\", \"屏幕尺寸\": \"9.7 英寸\", \"显示最大分辨率\": \"2048×1536\", \"硬盘容量\": \"128 GB\", \"显卡芯片\": \"64 位架构的 A9 芯片\", \"操作系统\": \"iOS 10\", \"电池类型\": \"内置 32.4 瓦时锂聚合物充电电池\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('QlYnljOGYZPOeGQcv2xfDtsUdhfnF5ROFIuTGNS8Gjez9xevrp', '【Surface平板专营店】Microsoft 微软 Surface Book 2 二合一平板笔记本电脑 不带触控笔 顺丰发货 可开专票 (13.5英寸, 八代酷睿i7/16GB/512GB/GTX1050独显)', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 18458, '{\"品牌\": \"Microsoft 微软\", \"颜色\": \"八代酷睿i7/16GB/512GB/GTX1050独显\", \"CPU生产商\": \"Intel\", \"芯片类型\": \"Intel Core i5\", \"CPU主频\": \"2.60 GHz\", \"内存容量\": \"8 GB\", \"内存类型\": \"DDR3 SDRAM\", \"硬盘容量\": \"256 GB\", \"硬盘接口\": \"Serial ATA\", \"硬件平台\": \"Windows\", \"操作系统\": \"Windows Pro\"}', 100);
INSERT INTO `product` VALUES ('QO5uG6dkdeVRAXQC2HRtKcusiBmLKzshtgtBfxsMQSdhdNgY6S', '提亚TIYA 华为M3平板保护套 8.4英寸（BTV-W09/BTV-DL09）MediaPad皮套 PU+PC 支架功能 防摔 翻盖 平板电脑保护壳 卡斯特系列三折款皮套适用于HUAWEI华为M3平板 8.4英寸（BTV-W09/BTV-DL09）MediaPad附带透明钢化膜(深蓝色)', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 68, '{\"产品颜色\": \"深蓝色\"}', 100);
INSERT INTO `product` VALUES ('qQ8IoHnidTLLZqlYdrE2inX8m4fYWLo4yby8V9WweCCD6PvbFE', 'BAIDATONG 蓝牙适配器Bluetooth CSR 4.0 电脑USB发射器 手机接收器 镀金属接口抗氧化 迷你免驱win7/8/XP 电脑、笔记本、台式机、等带有USB接口的电子设备等 支持音频 数据传输', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 23.9, '{\"品牌\": \"BAIDATONG\", \"商品尺寸\": \"12.8 x 9.8 x 1 cm\", \"商品重量\": \"59 g\"}', 100);
INSERT INTO `product` VALUES ('R06uYNy8frA9aoCsm6qkY2QHK5y7OKOOPB8wi0OXmDltJXVnuk', 'Microsoft 微软 原装正版 系统 Win 10家庭中文版/可装MAC苹果电脑 Windows10 家庭中文版实物秘钥卡 密钥卡', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 599, '{\"品牌\": \"Microsoft 微软\", \"颜色\": \"Windows10家庭中文版\", \"内存类型\": \"DRAM\"}', 100);
INSERT INTO `product` VALUES ('r0rbKgNX0MOJ0K6CjjaYzViKxIUQnx0QOVwufmLUawtLMZm3nH', 'Huawei 华为 M3 8.4英寸 通话平板电脑(2560*1600 麒麟950 哈曼卡顿音效 4G/64G LTE)日晖金', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 2288, '{\"品牌\": \"Huawei 华为\", \"型号\": \"BTV-DL09\", \"商品尺寸\": \"25.4 x 22.4 x 3.2 cm\", \"商品重量\": \"839 g\", \"电池\": \"1 锂离子电池 \", \"颜色\": \"日晖金[64G] LTE\", \"屏幕尺寸\": \"8.4 英寸\", \"显示最大分辨率\": \"2560x1600\", \"CPU主频\": \"2.30 GHz\", \"硬盘容量\": \"64 GB\", \"操作系统\": \"Android 6.0\", \"锂电池容量\": \"47 每小时瓦\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('r364fXfGbzWogTocIMhqJlQyIJpZCqDWbDHNvOWT8nQpyYefCZ', 'SIKU 德国 仿真 比例 合金 车模 收藏玩具 仿真模型-平板拖车带推土机 1616', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 58, '{\"商品尺寸\": \"16.3 x 3.6 x 4.6 cm\", \"产品尺寸及重量\": \"16.3 x 3.6 x 4.6 cm\", \"产地\": \"广东\", \"产品颜色\": \"平板拖车带推土机\", \"厂商推荐适用年龄:\": \"3 岁以上\", \"材质\": \"锌合金\"}', 100);
INSERT INTO `product` VALUES ('RAccc1kqE0AafdWgM5XCoemsVwypK7w0VUlKPEEsl20Sy8f4En', 'Microsoft 微软 原装正版 系统 Win 10家庭中文版/可装MAC苹果电脑 Windows10 家庭中文版实物秘钥卡 密钥卡', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 599, '{\"品牌\": \"Microsoft 微软\", \"颜色\": \"Windows10家庭中文版\", \"内存类型\": \"DRAM\"}', 100);
INSERT INTO `product` VALUES ('rAudXN3o5eMLaxxv4jk2VFji2zUFrpu7o0pJIuebc0ZEiVs6Rd', 'Wacom 和冠 Bamboo Spark CDS600PG 数位本手写本(含平板套)', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 437.7, '{\"ASIN\": \"B01762FEN2\", \"用户评分\": \"\\n  \\n    \\n      \\n        平均 3.8 星\\n      \\n    \\n  \\n  \\n  \\n    \\n      69 条商品评论\\n    \\n  \\n\", \"亚马逊热销商品排名\": \"\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n办公用品商品里排第1,682名 (查看销售排行榜)\\n \\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n    \\n    第17位\\n    - 办公用品 > 办公设备 > 触摸板及配件 > 数位板\\n    \\n\\n\", \"发货重量\": \"1.2 Kg\", \"Amazon.cn上架时间\": \"2015年10月20日\"}', 100);
INSERT INTO `product` VALUES ('rDVyjtfmvgfgYUcfd8ewW5o4SFfTzmombiOZCz1zuT5r9ULjSv', 'AWINNER Type C 充电数据线 usb-c快速充电线 高速传输线 通用于华为 honor 荣耀 P9/P10、三星Note 8,S8、魅族 PRO5、6、乐视2、谷歌Nexus 6P, Nexus 5X、一加Type-C接口的手机与平板 快充(1米,黑色)', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 29.99, '{\"商品尺寸\": \"15 x 12 x 2 cm\", \"商品重量\": \"18.1 g\", \"产品颜色\": \"黑色\"}', 100);
INSERT INTO `product` VALUES ('rfv4Y0XCGJVUdCTJWQQ080XNTGbHNs2HDcBn9VRJItzElR26AQ', 'Apple iPad 9.7英寸平板电脑(银色) WIFI版 32G 【2017款】', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 2288, '{\"品牌\": \"Apple\", \"型号\": \"iPad\", \"商品尺寸\": \"24 x 16.9 x 0.8 cm\", \"商品重量\": \"467 g\", \"颜色\": \"银色\", \"屏幕尺寸\": \"9.7 英寸\", \"显示最大分辨率\": \"2048×1536\", \"硬盘容量\": \"32 GB\", \"显卡芯片\": \"64 位架构的 A9 芯片\", \"操作系统\": \"iOS 10\", \"电池类型\": \"内置 32.4 瓦时锂聚合物充电电池\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('rSZVJ7cQ00ywzajvFehKc58Ub5CqlnS1Q9rvQBUnMpVB24RJyp', 'Edifier 漫步者 K550 入门级时尚高品质耳麦 游戏耳机 电脑耳机 时尚白色', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 49, '{\"商品尺寸\": \"17.7 x 6.2 x 21.6 cm\", \"商品重量\": \"90.7 g\", \"品牌所属地\": \"中国\", \"包装清单\": \"耳机 × 1； 说明书 × 1 ；保修卡 × 1\", \"连接技术\": \"3.5mm接头\", \"佩戴方式\": \"头戴式\", \"线控\": \"有线控\", \"功能用途\": \"语音通话, 游戏, 音乐欣赏\"}', 100);
INSERT INTO `product` VALUES ('ruWJgQFViHDf5qqgg9o0kPXv3R955BCISBziVZmmLJYISWed9e', 'CTA Digital二合一厨房壁挂架 适合iPad Air、iPad mini、Surface等7-12英寸平板电脑（PAD-KMS）', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 214.83, '{\"品牌\": \"CTA Digital\", \"商品尺寸\": \"22.9 x 8.9 x 10.2 cm\", \"商品重量\": \"794 g\", \"颜色\": \"银色\", \"屏幕尺寸\": \"10 英寸\", \"像素\": \"1 megapixels\"}', 100);
INSERT INTO `product` VALUES ('rvFkjfFJndjNCP6G4cOkZutXazwvBDPkbyGPQTFifSUkoZliQl', 'Apple 苹果 手机 iPhone X 银色 64G', 'qz0tG4n27DTunWh8R2yx6C86iEQy4tc1m1vWC8tAUK7mPyfMoe', 7977, '{\"商品尺寸\": \"14.4 x 7.1 x 0.8 cm\", \"商品重量\": \"172 g\", \"品牌所属地\": \"美国\", \"产品颜色\": \"银色\", \"特殊功能\": \"无线充电\", \"输入方式\": \"电容触屏\", \"摄像头像素\": \"1200 megapixels\", \"网络制式\": \"4G全网通\", \"电话卡卡槽\": \"1\", \"外置存储卡\": \"不支持外置存储卡\", \"操作系统\": \"IOS\", \"屏幕尺寸\": \"5.8 英寸\", \"容量\": \"64 GB\", \"有效分辨率\": \"458\", \"型号年份\": \"2017\", \"型号\": \"iPhone X\", \"包装清单\": \"装有 iOS 11 的 iPhone手机采用 Lightning 接头的 EarPodsLightning 至 3.5 毫米耳机插孔转换器Lightning 至 USB 连接线USB 电源适配器资料\"}', 100);
INSERT INTO `product` VALUES ('s9dy2Mg5clKFCVabG5blunf7bkSH3lpv6QuJ92j9L1XKilkrjo', 'VTech 伟易达 Tote&Go 笔记本电脑，橙色', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 160.06, '{\"商品尺寸\": \"6.8 x 27.1 x 20.9 cm\", \"商品重量\": \"816 g\", \"产品颜色\": \"橙色\", \"Size\": \"2.68 x 10.67 x 8.23 Inches\", \"厂商推荐适用年龄:\": \"3 岁以上\", \"材质\": \"塑料\", \" 是否需要电池 \": \"是\"}', 100);
INSERT INTO `product` VALUES ('sI3RlizNoMCIf39D1BgT5h4vB60QPcwxPtEugSy4LgVbqhG6rW', 'Apple MacBook Air MJVM2CH/A 11.6英寸笔记本电脑(11.6英寸/i5 1.6G/4G/128G SSD)', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 4988, '{\"品牌\": \"Apple\", \"型号\": \"MJVM2CH/A\", \"商品尺寸\": \"34 x 23.2 x 7.4 cm\", \"商品重量\": \"1.96 Kg\", \"颜色\": \"银色\", \"屏幕尺寸\": \"11.6 英寸\", \"CPU生产商\": \"Intel\", \"CPU主频\": \"1.6 GHz\", \"内存容量\": \"4 GB\", \"硬盘容量\": \"128 GB\", \"硬盘描述\": \"128GB 闪存\", \"显卡芯片\": \"Intel HD Graphics 6000 图形处理器\", \"显示芯片品牌\": \"Intel\", \"显卡类型\": \"集成显卡\", \"操作系统\": \"OS X Yosemite\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('sIMZOK1ysk3nSpTpZzfBCfBybtwsiHhoP1wX8THaVBThB4R9Z5', 'SANWA SUPPLY 山业 老板椅 办公椅 椅子 职员开会座椅 透气型电脑椅 双层网格 高靠背带扶手 可升降可360度旋转可逍遥 日本品质 一生的享受 SNC-NET15ABK(黑色)(供应商直送)', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 399, '{\"ASIN\": \"B06X3V1M6W\", \"用户评分\": \"\\n  \\n    \\n      \\n        平均 4.3 星\\n      \\n    \\n  \\n  \\n  \\n    \\n      93 条商品评论\\n    \\n  \\n\", \"亚马逊热销商品排名\": \"\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n办公用品商品里排第85名 (查看销售排行榜)\\n \\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n    \\n    第2位\\n    - 办公用品 > 办公家具灯具 > 办公家具 > 椅子沙发 > 办公椅\\n    \\n\\n\", \"发货重量\": \"16 Kg\", \"Amazon.cn上架时间\": \"2012年6月16日\"}', 100);
INSERT INTO `product` VALUES ('siPTRsTlu99h5t7V6CO3Z17xdQKbWcA6ur39ogU7J1DYXsfVKl', '【下单送包鼠】ThinkPad New S2-20J3A00YCD(联想）13.3英寸IBM商务超极本笔记本电脑（intel双核C3865U 4G内存 128G固态硬盘 蓝牙 摄像头 Win10）银色', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 3981, '{\"品牌\": \"Thinkpad\", \"商品尺寸\": \"47.2 x 30.4 x 7.8 cm\", \"商品重量\": \"1.5 Kg\", \"电池\": \"1 Lithium Polymer 电池(附带)\", \"颜色\": \"银\", \"屏幕尺寸\": \"13.30 英寸\", \"屏幕分辨率\": \"1366x768\", \"CPU生产商\": \"Intel\", \"CPU主频\": \"1.80 GHz\", \"CPU核心数量\": \"2\", \"内存容量\": \"4 GB\", \"内存类型\": \"DDR SDRAM\", \"硬盘容量\": \"128 GB\", \"硬盘描述\": \"128G固态硬盘\", \"显卡芯片\": \"Intel HD Graphics 610\", \"显卡类型\": \"集成显卡\", \"操作系统\": \"Windows10\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('SKKsEcjyOhRxXVyK6mr9yIM2qm6jvkc5qPlpEkBzOoiPDMp3wd', 'YOCY 华为荣耀畅玩6X手机壳 华为荣耀畅玩6X手机保护壳 保护套 透明壳 手机保护壳 手机套 纤薄TPU保护套', 'qz0tG4n27DTunWh8R2yx6C86iEQy4tc1m1vWC8tAUK7mPyfMoe', 19, '{\"商品尺寸\": \"20 x 10 x 0.4 cm\", \"商品重量\": \"18.1 g\", \"产品颜色\": \"华为荣耀畅玩6X\"}', 100);
INSERT INTO `product` VALUES ('SPtm6i9yBgVw3TVvKVGWfVqA8I9R0vjgWlZf8c14Kr1piKvVp9', 'Best Feel 儿童防蓝光 防紫外线 防视疲劳 防辐射眼镜 平光电竞游戏眼镜 电脑护目镜镜 配浅兰色耳挂 BF2001 C14（用于手机、电脑、平板电脑、电视等蓝光危害的环境）(亚马逊自营商品, 由供应商配送)', 'qz0tG4n27DTunWh8R2yx6C86iEQy4tc1m1vWC8tAUK7mPyfMoe', 238, '{\"商品尺寸\": \"16.4 x 6 x 4 cm\", \"商品重量\": \"141 g\"}', 100);
INSERT INTO `product` VALUES ('su2pG2pPAbzSgCZKNA4p5DPecIXm9NZ98q805lQigKpNuzMExx', 'Osprey F16 中性童 弹簧 Pogo 24升 均码 儿童日用旅游多功能双肩背包硬质背板透气肩带舒适背负可放平板电脑多重分仓 三年质保终身维修（两种LOGO随机发，详见页面下方注释）【儿童系列】', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 329, '{\"商品尺寸\": \"42 x 30 x 6 cm\", \"商品重量\": \"540 g\", \"颜色\": \"红色\", \"尺寸\": \"O/S\", \"产品系列名称\": \"F16 弹簧 Pogo 24\", \"面料成分\": \"95%尼龙+5%塑料扣件\", \"商品材质\": \"尼龙\", \"季节\": \"全年\", \"款式特征\": \"双肩背包\", \"容量\": \"24 公升\", \"包装清单\": \"售后服务承诺卡、标示卡、主品\", \"是否需要电池\": \"不是\", \"品牌所属地\": \"美国\", \"适用性别\": \"中性童\", \"型号\": \"10000594\", \"原产地\": \"越南\", \"商品特征\": \"规格：迷你包(10-25升)\", \"适合人群\": \"中性童\"}', 100);
INSERT INTO `product` VALUES ('SWrE3ztIrSk2jukqzAHYk75beLA1i5CCvS9frcuRBbTLMytSMO', 'Apple 苹果 MacBook Pro 13英寸笔记本电脑 17款/i5/8G/256G/MPXU2CH/A 2.3GHz 双核 Intel Core i5 处理器 银色 苹果电脑 不带touch-bar【2017款】', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 10848, '{\"品牌\": \"Apple\", \"型号\": \"MacBook Pro\", \"商品尺寸\": \"36.5 x 9.4 x 26.2 cm\", \"商品重量\": \"2.76 Kg\", \"颜色\": \"13英寸 2.3GHZ/8GB/256GB 银色\", \"屏幕尺寸\": \"13 英寸\", \"屏幕分辨率\": \"2560 x 1600 (227 ppi)\", \"显示最大分辨率\": \"2560 x 1600\", \"CPU生产商\": \"Intel\", \"CPU主频\": \"2.30 GHz\", \"CPU核心数量\": \"2\", \"内存容量\": \"8 GB\", \"硬盘容量\": \"256 GB\", \"显示芯片品牌\": \"Intel\", \"显卡类型\": \"集成显卡\", \"操作系统\": \"macOS\", \"电池续航时间（小时）\": \"10 小时\", \"锂电池容量\": \"54.5 每小时瓦\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('TcyYTZA4zqYdhhWIYPiluHAwc38lfzauiRzgBoS5RsTTXtYlI5', 'Huawei 华为 M3青春版 8.0英寸平板电脑(CPN-W09 1920×1200 8核 3GB＋32GB WIFI)皎月白', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 1499, '{\"品牌\": \"Huawei 华为\", \"型号\": \"M3青春版\", \"商品尺寸\": \"21.3 x 12.3 x 0.8 cm\", \"商品重量\": \"308 g\", \"颜色\": \"WIFI 3G+32G 白\", \"屏幕尺寸\": \"8 英寸\", \"显示最大分辨率\": \"1920x1200\", \"硬盘容量\": \"32 GB\", \"操作系统\": \"Android 7.0\"}', 100);
INSERT INTO `product` VALUES ('TEKcu4gHGqmjpCV86VMjfibkzZ1v8yLTqgy6nIYG89n57NcVfE', 'Cartinoe 卡提诺 牛仔酷系列 13.3英寸笔记本包 电脑包 适用于macbook pro/air 13.3英寸 经典灰', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 98, '{\"商品尺寸\": \"44.5 x 31 x 3.5 cm\", \"商品重量\": \"340 g\", \"包装清单\": \"电脑包*1\"}', 100);
INSERT INTO `product` VALUES ('tgNXHrEyyQtGK6g2AYGhXu5oTGxkezg0g3d7Tji09RqCsBWQfH', '【2017新款】Apple iPad 9.7英寸平板电脑(金色) WIFI版 128G', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 2988, '{\"品牌\": \"Apple\", \"型号\": \"iPad\", \"商品尺寸\": \"24 x 16.9 x 0.8 cm\", \"商品重量\": \"467 g\", \"颜色\": \"金色\", \"屏幕尺寸\": \"9.7 英寸\", \"显示最大分辨率\": \"2048×1536\", \"硬盘容量\": \"128 GB\", \"显卡芯片\": \"64 位架构的 A9 芯片\", \"操作系统\": \"iOS 10\", \"电池类型\": \"内置 32.4 瓦时锂聚合物充电电池\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('tkvVmJwTaeQVlyyTZ1Y0PeKxabJonr275OPuaiRC9LInuml8gW', '【Surface平板专营店】Microsoft 微软 Surface Book 2 二合一平板笔记本电脑 不带触控笔 顺丰发货 可开专票 (13.5英寸, 八代酷睿i7/16GB/1TB/GTX1050独显)', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 22058, '{\"品牌\": \"Microsoft 微软\", \"颜色\": \"八代酷睿i7/16GB/1TB/GTX1050独显\", \"CPU生产商\": \"Intel\", \"芯片类型\": \"Intel Core i5\", \"CPU主频\": \"2.60 GHz\", \"内存容量\": \"8 GB\", \"内存类型\": \"DDR3 SDRAM\", \"硬盘容量\": \"256 GB\", \"硬盘接口\": \"Serial ATA\", \"硬件平台\": \"Windows\", \"操作系统\": \"Windows Pro\"}', 100);
INSERT INTO `product` VALUES ('u07I4yP6owFd2DFQiob6RWhEAzQzcTmmHDT2GmQDchUk1VbOzU', '美国JETech 苹果iPad Pro 9.7英寸保护套 平板保护壳 Smart Case皮套 智能休眠唤醒功能 孔位精准 三折支撑 内置磁力吸扣 适用于苹果9.7英寸Apple iPad Pro (黑色)', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 49, '{\"商品尺寸\": \"24.3 x 17.5 x 1.3 cm\", \"商品重量\": \"200 g\", \"产品颜色\": \"黑色（国内发货）\", \"型号\": \"J3370-CN\"}', 100);
INSERT INTO `product` VALUES ('udZj8AiZfOTxSUtAcupcILqKpJLiuFYoYgXxUn7wlzLbBhU4n7', 'Apple iPad mini 4 MK9Q2CH/A 7.9英寸平板电脑 (128G/WLAN/金色)', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 3049, '{\"品牌\": \"Apple\", \"型号\": \"MK9Q2CH/A\", \"商品尺寸\": \"21.4 x 14.6 x 4.2 cm\", \"商品重量\": \"581 g\", \"颜色\": \"金色\", \"屏幕尺寸\": \"7.9 英寸\", \"显示最大分辨率\": \"2048×1536\", \"硬盘容量\": \"128 GB\", \"操作系统\": \"iOS 9\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('UibK3Egc8s0EYoKb5Lz5EZBslHmdETBTuSUOYAjyxJKsefXdW5', '戴尔（DELL）Vostro 5460-R2548BS 23.8英寸一体机电脑 （i5-7400T 8G 1TB +128GB SSD 4GB独显 Win10 三年上门）银', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 5649, '{\"品牌\": \"Dell 戴尔\", \"商品尺寸\": \"88 x 78 x 43 cm\", \"商品重量\": \"11 Kg\", \"颜色\": \"银色\", \"屏幕尺寸\": \"23.80 英寸\", \"屏幕分辨率\": \"1920X1080\", \"CPU生产商\": \"Intel\", \"内存容量\": \"8 GB\", \"存储技术\": \"DDR3 1600MHZ\", \"内存类型\": \"DDR3 SDRAM\", \"硬盘容量\": \"1 TB\", \"硬盘描述\": \"1TB 7200RPM\", \"操作系统\": \"Windows10\"}', 100);
INSERT INTO `product` VALUES ('ukLmzqCIYvCvGNb56xbUTzsvGnqaJHVPPCzwJmh8jx6ldvAqg8', '【2017新款】Apple iPad 9.7英寸平板电脑(金色) WIFI版 32G', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 2288, '{\"品牌\": \"Apple\", \"型号\": \"iPad\", \"商品尺寸\": \"24 x 16.9 x 0.8 cm\", \"商品重量\": \"467 g\", \"颜色\": \"金色\", \"屏幕尺寸\": \"9.7 英寸\", \"显示最大分辨率\": \"2048×1536\", \"硬盘容量\": \"32 GB\", \"显卡芯片\": \"64 位架构的 A9 芯片\", \"操作系统\": \"iOS 10\", \"电池类型\": \"内置 32.4 瓦时锂聚合物充电电池\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('ULvD3UeNCioB6rnu9bDafzRxe8eNayUEObLtXgNrhH9C0wnWwy', 'Huawei 华为 M3 8.4英寸 通话平板电脑(2560*1600 麒麟950 哈曼卡顿音效 4G/64G LTE)日晖金', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 2288, '{\"品牌\": \"Huawei 华为\", \"型号\": \"BTV-DL09\", \"商品尺寸\": \"25.4 x 22.4 x 3.2 cm\", \"商品重量\": \"839 g\", \"电池\": \"1 锂离子电池 \", \"颜色\": \"日晖金[64G] LTE\", \"屏幕尺寸\": \"8.4 英寸\", \"显示最大分辨率\": \"2560x1600\", \"CPU主频\": \"2.30 GHz\", \"硬盘容量\": \"64 GB\", \"操作系统\": \"Android 6.0\", \"锂电池容量\": \"47 每小时瓦\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('UofoOzSkM12RocHMlgmug8Iyxfw6dtdfXCmiassPh2zcsgcASZ', 'Huawei 华为 M3 8.4英寸 平板电脑(2560*1600 麒麟950 哈曼卡顿音效 4G/64G WiFi)日晖金', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 301, '{\"品牌\": \"Huawei 华为\", \"型号\": \"BTV-W09\", \"商品尺寸\": \"23.6 x 22 x 4 cm\", \"商品重量\": \"821 g\", \"电池\": \"1 锂离子电池 \", \"颜色\": \"日晖金[64G] WIFI\", \"屏幕尺寸\": \"8.4 英寸\", \"显示最大分辨率\": \"2560x1600\", \"硬盘容量\": \"64 GB\", \"操作系统\": \"Android 6.0\", \"锂电池容量\": \"47 每小时瓦\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('UrCSUcPk9MvHe7lVJt1hji4KkdW3m1M2FPd1h7W8262VxZmnKl', 'Apple iPad mini 4 MK9N2CH/A 7.9英寸平板电脑 (128G/WLAN/深空灰色)', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 3228, '{\"品牌\": \"Apple\", \"型号\": \"MK9N2CH/A\", \"商品尺寸\": \"21.6 x 14.6 x 4.4 cm\", \"商品重量\": \"599 g\", \"颜色\": \"深空灰色\", \"屏幕尺寸\": \"7.9 英寸\", \"显示最大分辨率\": \"2048×1536\", \"硬盘容量\": \"128 GB\", \"操作系统\": \"iOS 9\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('V2htwqZNiHBvhd7JYHaT35UEn57nK14IEqYgWZcKbJMhmiSH96', 'ThinkPad X1 Carbon 2017-20HRA007CD(联想)14英寸轻薄笔记本电脑(i5-7200U 8G 256G SSD固态硬盘 IPS高清屏 摄像头 蓝牙 指纹 背光键盘 WIN10)', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 9299, '{\"品牌\": \"Thinkpad\", \"商品尺寸\": \"33 x 23 x 1.6 cm\", \"商品重量\": \"1.2 Kg\", \"颜色\": \"黑色\", \"屏幕尺寸\": \"14 英寸\", \"屏幕分辨率\": \"1920x1080\", \"CPU生产商\": \"Intel\", \"CPU主频\": \"2.30 GHz\", \"内存容量\": \"8 GB\", \"存储技术\": \"DDR4\", \"硬盘容量\": \"256 GB\", \"硬盘描述\": \"固态硬盘\", \"显卡芯片\": \"Intel HD Graphics 520\", \"显示芯片品牌\": \"intel\", \"显卡类型\": \"核心显卡\", \"电源类型\": \"交流和电池\", \"操作系统\": \"Windows 10\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('VdJCPNFJUGNdHs5DZCbYyLd8ER2sOlBT4SJfmKttVhDT2MrHdH', 'Cartinoe 卡提诺 牛仔酷系列 13.3英寸笔记本包 电脑包 适用于macbook pro/air 13.3英寸 经典灰', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 98, '{\"商品尺寸\": \"44.5 x 31 x 3.5 cm\", \"商品重量\": \"340 g\", \"包装清单\": \"电脑包*1\"}', 100);
INSERT INTO `product` VALUES ('Vkq7XNzpZe2CXGpmkqJH8SL1AjPjXNUAVXlC3dI6SKL4PRleMd', 'ThinkPad E570（20EVA04WCD）联想15.6英寸大屏商务办公笔记本电脑 (Intel双核C3865U 4G 500G 蓝牙 摄像头 win10 )', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 2589, '{\"品牌\": \"Thinkpad\", \"商品尺寸\": \"50.5 x 32.8 x 7.9 cm\", \"商品重量\": \"2.3 Kg\", \"电池\": \"1 Lithium Polymer 电池(附带)\", \"屏幕尺寸\": \"15.60 英寸\", \"屏幕分辨率\": \"1366 x 768\", \"CPU生产商\": \"inter\", \"芯片类型\": \"Intel Celeron\", \"CPU主频\": \"1.80 GHz\", \"CPU核心数量\": \"2\", \"内存容量\": \"4 GB\", \"内存类型\": \"DDR DRAM\", \"硬盘容量\": \"500 GB\", \"硬盘描述\": \"机械硬盘\", \"硬盘接口\": \"Serial ATA-300\", \"显卡芯片\": \"Intel HD Graphics 610\", \"显卡类型\": \"集成显卡\", \"硬件平台\": \"PC\", \"操作系统\": \"Windows10\", \"锂电池容量\": \"45 每小时瓦\", \"电池包装类型\": \"电池是包含在该商品的包装内，但没有装配在该商品内\", \"电池锂含量\": \"1 克\"}', 100);
INSERT INTO `product` VALUES ('vL2xt4ijCio9apXchFrR7STIZ37ny5enGzY0iRsPuxaS06rENU', 'Meister Precision mechanic &apos; s 108件套 & # x2713补漆套装适用于智能手机平板电脑 PC  consoles 相机手表眼镜 modelling & CO . 工具套装 | 修复 | 精密螺丝刀套装 | 3387780', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 184.54, '{\"商品尺寸\": \"17.4 x 10.5 x 4.5 cm\", \"是否需要电池驱动\": \"不是\", \"本商品是否包含电池\": \"不是\"}', 100);
INSERT INTO `product` VALUES ('VnL7jc6rUW9umamxAmfjEP4hxzPAOTuU94IGVEh9tblQ2JZd2R', 'WORKPRO 万克宝 iphone6S螺丝刀修理套装三星苹果小m手机维修拆机工具起子吸盘撬棒 W021190N（供应商直送）', 'qz0tG4n27DTunWh8R2yx6C86iEQy4tc1m1vWC8tAUK7mPyfMoe', 22, '{\"型号 / 款号\": \"W021190N\", \"产品颜色\": \"红蓝\", \"品牌所属地\": \"中国\", \"包装清单\": \"钟表手柄*1；尼龙撬棒*1；卡槽顶针*1；吸盘*1；批头*12；工具盒*1\", \"本商品是否包含电池\": \"不是\"}', 100);
INSERT INTO `product` VALUES ('vNYWBiodOn6TCH9OfWAa0UiwU7cF8ENNJqmLg26Zc6F0UvyYQE', 'CTA Digital二合一厨房壁挂架 适合iPad Air、iPad mini、Surface等7-12英寸平板电脑（PAD-KMS）', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 214.83, '{\"品牌\": \"CTA Digital\", \"商品尺寸\": \"22.9 x 8.9 x 10.2 cm\", \"商品重量\": \"794 g\", \"颜色\": \"银色\", \"屏幕尺寸\": \"10 英寸\", \"像素\": \"1 megapixels\"}', 100);
INSERT INTO `product` VALUES ('vXDoaWEL6GEqVsmrA9hWlgvzFKemoM341MMpq4tDLudQSpJDc4', '华为（HUAWEI）华为M3青春版 10.1英寸平板电脑(BAH-W09 1920×1200 8核 3GB＋32GB WIFI)皎月白', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 1750, '{\"品牌\": \"Huawei 华为\", \"型号\": \"华为平板M3青春版\", \"商品尺寸\": \"24.1 x 17.1 x 0.7 cm\", \"商品重量\": \"308 g\", \"颜色\": \"WIFI 3G+32G 白\", \"屏幕尺寸\": \"10.1 英寸\", \"屏幕分辨率\": \"1920*1080\", \"显示最大分辨率\": \"1920*1200\", \"CPU主频\": \"2.50 GHz\", \"内存容量\": \"3 GB\", \"内存类型\": \"DDR3 SDRAM\", \"硬盘容量\": \"32 GB\", \"操作系统\": \"Android 7.0\"}', 100);
INSERT INTO `product` VALUES ('W2ujLBwo3RniddCldcqTdiirHOzdHmSGangcSlDLKJmh7cYUfR', '儿童电脑眼镜蓝光阻隔率约38 90% 儿童超轻眼镜  リキッドブラック', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 95.41, '{\"品牌\": \"ARTIFACT\", \"商品尺寸\": \"3 x 12.5 x 4 cm\", \"商品重量\": \"9.07 g\", \"颜色\": \"リキッドブラック\"}', 100);
INSERT INTO `product` VALUES ('Wapx0h8Z3ddxytIlywzripZmAUj4HZLpeiQtEiWlNl4SZSeZsQ', 'Microsoft 微软 Surface Pro 二合一平板电脑 12.3英寸 中文版(新)酷睿 m3/4GB/128GB/银灰【2017款】(不含触控笔)', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 4875, '{\"品牌\": \"Microsoft 微软\", \"型号\": \"Surface Pro\", \"商品尺寸\": \"29.2 x 20.1 x 0.8 cm\", \"商品重量\": \"767 g\", \"屏幕尺寸\": \"12.3 英寸\", \"显示最大分辨率\": \"2736  x 1824\", \"CPU生产商\": \"Intel\", \"CPU主频\": \"1 GHz\", \"硬盘容量\": \"128 GB\", \"硬盘描述\": \"SSD\", \"显卡芯片\": \"Intel HD 显卡 615\", \"显示芯片品牌\": \"Intel\", \"操作系统\": \"Windows 10\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('WcioQQJL8K2AMN4YDEVztAZ1lw6HisM0wNhqkIbXxax3b0Vw4w', 'Whirldy 手机支架 桌面 ipad支架 手机平板通用 多功能 创意折叠 简约 (黑色)', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 18, '{\"品牌名称\": \"Whirldy\", \"产品颜色\": \"黑色\", \"制造商\": \"深圳市惠尔迪科技有限公司\", \"本商品是否包含电池\": \"不是\"}', 100);
INSERT INTO `product` VALUES ('WIfDhrG0Zt9o5vxej5DyRfDajtSp9KFenyySnxie5N6yt7X282', 'HUAWEI 华为 畅享7 3GB+32GB 全网通4G手机 蓝色', 'qz0tG4n27DTunWh8R2yx6C86iEQy4tc1m1vWC8tAUK7mPyfMoe', 969, '{\"商品尺寸\": \"14.4 x 7.1 x 0.8 cm\", \"商品重量\": \"145 g\", \"品牌所属地\": \"中国\", \"产品颜色\": \"蓝色\", \"容量\": \"32 GB\", \"特殊功能\": \"双卡, 支持存储卡, 指纹识别\", \"输入方式\": \"电容触屏\", \"摄像头像素\": \"1300 megapixels\", \"网络制式\": \"4G全网通\", \"电话卡卡槽\": \"2\", \"外置存储卡\": \"支持外置存储卡\", \"操作系统\": \"Android\", \"屏幕尺寸\": \"5 英寸\", \"有效分辨率\": \"294\", \"型号年份\": \"2017\", \"型号\": \"畅享7, SLA-AL00\", \"包装清单\": \"手机（带电池）x1;充电器x1;USB 线x1;快速指南x1;售后服务手册x1;取卡针x1;TP保护膜（出厂已贴）x1;\"}', 100);
INSERT INTO `product` VALUES ('Wm0109Gd0n2Z5rQbqN3iPrhiYZ6Co4Ohp8TjjNiXdLfQVfQyUk', 'CTA Digital二合一厨房壁挂架 适合iPad Air、iPad mini、Surface等7-12英寸平板电脑（PAD-KMS）', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 214.83, '{\"品牌\": \"CTA Digital\", \"商品尺寸\": \"22.9 x 8.9 x 10.2 cm\", \"商品重量\": \"794 g\", \"颜色\": \"银色\", \"屏幕尺寸\": \"10 英寸\", \"像素\": \"1 megapixels\"}', 100);
INSERT INTO `product` VALUES ('WRjTUPnhnf6gCJs2rZXcQSv0TECONsYMFenAtJr806Xqphp0Up', 'Cartinoe 卡提诺 牛仔酷系列 13.3英寸笔记本包 电脑包 适用于macbook pro/air 13.3英寸 经典灰', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 98, '{\"商品尺寸\": \"44.5 x 31 x 3.5 cm\", \"商品重量\": \"340 g\", \"包装清单\": \"电脑包*1\"}', 100);
INSERT INTO `product` VALUES ('WRqzDisapvAwL48AbTl7qL1uanBXv41MIssOGG3Aq84kPqDr7k', 'Apple iPad 9.7英寸平板电脑(深空灰色) WIFI版 128G 【2017款】', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 2988, '{\"品牌\": \"Apple\", \"型号\": \"iPad\", \"商品尺寸\": \"24 x 16.9 x 0.8 cm\", \"商品重量\": \"467 g\", \"颜色\": \"深空灰色\", \"屏幕尺寸\": \"9.7 英寸\", \"显示最大分辨率\": \"2048×1536\", \"硬盘容量\": \"128 GB\", \"显卡芯片\": \"64 位架构的 A9 芯片\", \"操作系统\": \"iOS 10\", \"电池类型\": \"内置 32.4 瓦时锂聚合物充电电池\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('WXXUW7Z5YnnsFevdPCt2t8o3SDvqQq62KMaxvW0c7hsR9ZYkT9', 'Dell 戴尔 灵越新飞匣Ins15ER-4525B 15.6英寸游戏笔记本电脑（i5-7200U 4G 500G 2G独显 WIN10 黑色）', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 3388, '{\"品牌\": \"Dell 戴尔\", \"型号\": \"Ins15E-4525B\", \"商品尺寸\": \"49.4 x 34.6 x 7.8 cm\", \"商品重量\": \"2 Kg\", \"颜色\": \"黑色\", \"屏幕尺寸\": \"15.6 英寸\", \"显示最大分辨率\": \"1920x1080\", \"CPU生产商\": \"Intel\", \"CPU主频\": \"3.1 GHz\", \"内存容量\": \"4 GB\", \"存储技术\": \"DDR3\", \"硬盘容量\": \"500 GB\", \"硬盘描述\": \"SATA\", \"显卡芯片\": \"R5 M315\", \"显示芯片品牌\": \"AMD\", \"显卡类型\": \"独立显卡\", \"显存容量\": \"2 GB\", \"光驱设备\": \"否\", \"电源类型\": \"45W AC适配器\", \"操作系统\": \"Win 10\", \"电池类型\": \"高性能6芯锂离子电池\", \"电池包装类型\": \"电池是包含在该商品的包装内，但没有装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('XeOQGDE2ERhLcTSjzPbL9ns5lnzEXg6oBadzXg1axDH0gyNJck', '【2017新款】Apple iPad 9.7英寸平板电脑(金色) WIFI版 128G', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 2988, '{\"品牌\": \"Apple\", \"型号\": \"iPad\", \"商品尺寸\": \"24 x 16.9 x 0.8 cm\", \"商品重量\": \"467 g\", \"颜色\": \"金色\", \"屏幕尺寸\": \"9.7 英寸\", \"显示最大分辨率\": \"2048×1536\", \"硬盘容量\": \"128 GB\", \"显卡芯片\": \"64 位架构的 A9 芯片\", \"操作系统\": \"iOS 10\", \"电池类型\": \"内置 32.4 瓦时锂聚合物充电电池\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('Xi8HgMZLdAPiisW3MSBR9ItuGEkFRhoSDxkuJIZMfgsbRiTuTm', 'sweetleaf stevia 平板电脑100个6件装', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 224.39, '{\"品牌\": \"SweetLeaf\", \"商品尺寸\": \"19.8 x 8.6 x 7.9 cm\", \"商品重量\": \"68 g\", \"制造商\": \"Wisdom Natural Brands\"}', 100);
INSERT INTO `product` VALUES ('xLEhyvjzX21FBuEMum4doVkNltrLTb4pTsF5kQNSERnC8tUAKj', 'Microsoft 微软 Surface Pro 二合一平板电脑 12.3英寸 中文版(新)酷睿 i5/8GB/256GB/银灰【2017款】(不含触控笔)', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 7488, '{\"品牌\": \"Microsoft 微软\", \"型号\": \"Surface Pro\", \"商品尺寸\": \"29.2 x 20.1 x 0.8 cm\", \"商品重量\": \"771 g\", \"屏幕尺寸\": \"12.3 英寸\", \"显示最大分辨率\": \"2736  x 1824\", \"CPU生产商\": \"Intel\", \"CPU主频\": \"2.60 GHz\", \"CPU核心数量\": \"2\", \"内存容量\": \"8 GB\", \"硬盘容量\": \"256 GB\", \"硬盘描述\": \"SSD\", \"显卡芯片\": \"Intel HD 显卡 620\", \"显示芯片品牌\": \"Intel\", \"计算机无线类型1\": \"802.11bgn\", \"像素\": \"8 megapixels\", \"操作系统\": \"Windows 10\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('xLplntwjWdEKPys1Cb0qIJU5EMsjfSLJNqWMqj1UbwRYIVIppv', 'AmazonBasics Aluminum Laptop Stand AmazonBasics Aluminum Laptop Stand 银色', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 141.72, '{\"品牌\": \"AmazonBasics 亚马逊倍思\", \"商品尺寸\": \"25.6 x 23.7 x 15.5 cm\", \"商品重量\": \"2 Kg\", \"颜色\": \"银色\"}', 100);
INSERT INTO `product` VALUES ('xMb3829hOH1JMYtO4Jby9iIqHQ9bNgorHqdcrzaEVAbHAzW4QQ', 'ThinkPad E570（20EVA04WCD）联想15.6英寸大屏商务办公笔记本电脑 (Intel双核C3865U 4G 500G 蓝牙 摄像头 win10 )', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 2589, '{\"品牌\": \"Thinkpad\", \"商品尺寸\": \"50.5 x 32.8 x 7.9 cm\", \"商品重量\": \"2.3 Kg\", \"电池\": \"1 Lithium Polymer 电池(附带)\", \"屏幕尺寸\": \"15.60 英寸\", \"屏幕分辨率\": \"1366 x 768\", \"CPU生产商\": \"inter\", \"芯片类型\": \"Intel Celeron\", \"CPU主频\": \"1.80 GHz\", \"CPU核心数量\": \"2\", \"内存容量\": \"4 GB\", \"内存类型\": \"DDR DRAM\", \"硬盘容量\": \"500 GB\", \"硬盘描述\": \"机械硬盘\", \"硬盘接口\": \"Serial ATA-300\", \"显卡芯片\": \"Intel HD Graphics 610\", \"显卡类型\": \"集成显卡\", \"硬件平台\": \"PC\", \"操作系统\": \"Windows10\", \"锂电池容量\": \"45 每小时瓦\", \"电池包装类型\": \"电池是包含在该商品的包装内，但没有装配在该商品内\", \"电池锂含量\": \"1 克\"}', 100);
INSERT INTO `product` VALUES ('XxiALOzJaquNJlKxodiU9MYYpdvpkD3gCatrHfISECjTlBEPol', 'Osprey F16 中性童 弹簧 Pogo 24升 均码 儿童日用旅游多功能双肩背包硬质背板透气肩带舒适背负可放平板电脑多重分仓 三年质保终身维修（两种LOGO随机发，详见页面下方注释）【儿童系列】', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 329, '{\"商品尺寸\": \"42 x 30 x 6 cm\", \"商品重量\": \"540 g\", \"颜色\": \"红色\", \"尺寸\": \"O/S\", \"产品系列名称\": \"F16 弹簧 Pogo 24\", \"面料成分\": \"95%尼龙+5%塑料扣件\", \"商品材质\": \"尼龙\", \"季节\": \"全年\", \"款式特征\": \"双肩背包\", \"容量\": \"24 公升\", \"包装清单\": \"售后服务承诺卡、标示卡、主品\", \"是否需要电池\": \"不是\", \"品牌所属地\": \"美国\", \"适用性别\": \"中性童\", \"型号\": \"10000594\", \"原产地\": \"越南\", \"商品特征\": \"规格：迷你包(10-25升)\", \"适合人群\": \"中性童\"}', 100);
INSERT INTO `product` VALUES ('xXP8hBfqUpOdZQRhBeOxhxXtkfJvvQer5nDiu4Pa8fuxUFIpj3', '【Surface平板专营店】Microsoft 微软 Surface Book 2 二合一平板笔记本电脑 不带触控笔 顺丰发货 可开专票 (15英寸, 八代酷睿i7/16GB/512GB/GTX1060独显)', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 23488, '{\"品牌\": \"Microsoft 微软\", \"颜色\": \"八代酷睿i7/16GB/512GB/GTX1060独显\", \"CPU生产商\": \"Intel\", \"芯片类型\": \"Intel Core i5\", \"CPU主频\": \"2.60 GHz\", \"内存容量\": \"8 GB\", \"内存类型\": \"DDR3 SDRAM\", \"硬盘容量\": \"256 GB\", \"硬盘接口\": \"Serial ATA\", \"硬件平台\": \"Windows\", \"操作系统\": \"Windows Pro\"}', 100);
INSERT INTO `product` VALUES ('XXPJG0U2t8QjnAjDFoAqH1rEcSofM55WByxNxz9mKaCvdFNoke', 'eutopetian AIRLINE approved 柔软侧边宠物背带带羊毛床上用品席子适用于猫狗小号中号狗窝动物旅行 / 适合 Under seats 英寸便携式电脑包', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 274.07, '{\"商品颜色\": \"灰色\"}', 100);
INSERT INTO `product` VALUES ('Y2uYku0Ee3584MBb715zkQu48GEq161SL2UB4uBn38MKWC2ta2', 'HP 惠普 17（17.3英寸 / HD+ SVA）笔记本电脑（8 GB 内存，1 TB 硬盘，英特尔高清显卡，Windows 10家庭版64） 黑色 256 GB SSD', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 2313.81, '{\"品牌\": \"HP 惠普\", \"型号\": \"Notebook - 17-bs001ng\", \"商品尺寸\": \"45 x 30 x 5 cm\", \"商品重量\": \"3 Kg\", \"电池\": \"1 锂离子电池 电池(附带)\", \"颜色\": \"黑色\", \"形状大小\": \"Notebook\", \"屏幕尺寸\": \"17.3 英寸\", \"屏幕分辨率\": \"1600 x 900\", \"显示最大分辨率\": \"1600 x 900\", \"CPU生产商\": \"Intel\", \"芯片类型\": \"Intel Celeron\", \"CPU主频\": \"1.6 GHz\", \"CPU 核心数\": \"BGA 1170\", \"CPU核心数量\": \"1\", \"内存容量\": \"8 GB\", \"存储技术\": \"DDR3L-SDRAM\", \"内存类型\": \"DDR4 SDRAM\", \"硬盘容量\": \"256 GB\", \"硬盘描述\": \"SSD\", \"显卡芯片\": \"Intel\", \"显卡类型\": \"Intel HD-Grafikkarte 400\", \"连接类型\": \"801_11_AC\", \"计算机无线类型1\": \"802.11bgn\", \"USB 2.0接口\": \"1\", \"HDMI端口\": \"1\", \"以太网端口\": \"1\", \"光驱设备\": \"DVD-Writer\", \"操作系统\": \"DOS\", \"电池类型\": \"Lithium-Ion (Li-Ion)\", \"电池续航时间（小时）\": \"10 小时\", \"锂电池容量\": \"41 每小时瓦\", \"电池包装类型\": \"电池是包含在该商品的包装内，但没有装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('yk4RO1uycegC864ekvTQs7nr7aN9qzFiWnUzUB43cPx7E25DYn', 'Apple MacBook Air MJVM2CH/A 11.6英寸笔记本电脑(11.6英寸/i5 1.6G/4G/128G SSD)', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 4988, '{\"品牌\": \"Apple\", \"型号\": \"MJVM2CH/A\", \"商品尺寸\": \"34 x 23.2 x 7.4 cm\", \"商品重量\": \"1.96 Kg\", \"颜色\": \"银色\", \"屏幕尺寸\": \"11.6 英寸\", \"CPU生产商\": \"Intel\", \"CPU主频\": \"1.6 GHz\", \"内存容量\": \"4 GB\", \"硬盘容量\": \"128 GB\", \"硬盘描述\": \"128GB 闪存\", \"显卡芯片\": \"Intel HD Graphics 6000 图形处理器\", \"显示芯片品牌\": \"Intel\", \"显卡类型\": \"集成显卡\", \"操作系统\": \"OS X Yosemite\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('ylD6eu7nCLRSAknQxyn7Tjhu68UpfjZF09fEjUKoBD41U60J6u', '【2017新款】Apple iPad 9.7英寸平板电脑(金色) WIFI版 32G', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 2288, '{\"品牌\": \"Apple\", \"型号\": \"iPad\", \"商品尺寸\": \"24 x 16.9 x 0.8 cm\", \"商品重量\": \"467 g\", \"颜色\": \"金色\", \"屏幕尺寸\": \"9.7 英寸\", \"显示最大分辨率\": \"2048×1536\", \"硬盘容量\": \"32 GB\", \"显卡芯片\": \"64 位架构的 A9 芯片\", \"操作系统\": \"iOS 10\", \"电池类型\": \"内置 32.4 瓦时锂聚合物充电电池\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('YR7R1kCNyw7fikNfs6O4hUtIClip5IfOEFUdsQWlqbhoFXa530', 'CTA Digital二合一厨房壁挂架 适合iPad Air、iPad mini、Surface等7-12英寸平板电脑（PAD-KMS）', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 214.83, '{\"品牌\": \"CTA Digital\", \"商品尺寸\": \"22.9 x 8.9 x 10.2 cm\", \"商品重量\": \"794 g\", \"颜色\": \"银色\", \"屏幕尺寸\": \"10 英寸\", \"像素\": \"1 megapixels\"}', 100);
INSERT INTO `product` VALUES ('YvyzyvYsvfRif624aTSMCuJ2V3zxD0adk27YaAwsAJ55lg5csO', 'WowWee 智领高 Mip 机器人 蓝牙遥控智能机器人 适用于苹果/安卓手机 白色', 'qz0tG4n27DTunWh8R2yx6C86iEQy4tc1m1vWC8tAUK7mPyfMoe', 374.83, '{\"商品尺寸\": \"17.1 x 12.7 x 26 cm\", \"商品重量\": \"299 g\", \"品牌所属地\": \"美国\", \"产品颜色\": \"白色\", \"型号年份\": \"2014\", \"型号\": \"QKMKB182WE, MiP Robot (White)\", \"包装清单\": \"机器人主体 *1;平衡托盘 *1;底部支架 *1;说明书（英文） *1\"}', 100);
INSERT INTO `product` VALUES ('zbOi4HZxFLe6MBQnZGvjnw1ZI63OJqawkotjUmnbQXwaLKVDVM', 'Huawei 华为 MateBook X 13英寸全金属超轻薄笔记本电脑(i5-7200U 8G 256G Win10 内含拓展坞)流光金', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 6575, '{\"品牌\": \"Huawei 华为\", \"型号\": \"WT-W09B\", \"商品尺寸\": \"28.6 x 21.1 x 1.2 cm\", \"商品重量\": \"1.05 Kg\", \"电池\": \"1 Lithium Polymer 电池(附带)\", \"颜色\": \"流光金\", \"屏幕尺寸\": \"13 英寸\", \"屏幕分辨率\": \"1280*720\", \"显示最大分辨率\": \"2160x1440\", \"CPU生产商\": \"因特尔\", \"CPU主频\": \"2.50 GHz\", \"内存容量\": \"4 GB\", \"内存类型\": \"DDR3 SDRAM\", \"硬盘容量\": \"256 GB\", \"显卡类型\": \"集成显卡\", \"电源类型\": \"40W智能电源适配器\", \"操作系统\": \"Windows 10\", \"电池类型\": \"锂聚合物\", \"锂电池容量\": \"41.4 每小时瓦\", \"电池包装类型\": \"电池是装配在该商品内\", \"锂离子的数量\": \"1\"}', 100);
INSERT INTO `product` VALUES ('ZEzI3mMDtOcJkMcTnnKewSw3J7ekiVcp0BCaKRs3UwdMqq2tI4', '【2017新款】Apple iPad 9.7英寸平板电脑(金色) WIFI版 32G', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 2288, '{\"品牌\": \"Apple\", \"型号\": \"iPad\", \"商品尺寸\": \"24 x 16.9 x 0.8 cm\", \"商品重量\": \"467 g\", \"颜色\": \"金色\", \"屏幕尺寸\": \"9.7 英寸\", \"显示最大分辨率\": \"2048×1536\", \"硬盘容量\": \"32 GB\", \"显卡芯片\": \"64 位架构的 A9 芯片\", \"操作系统\": \"iOS 10\", \"电池类型\": \"内置 32.4 瓦时锂聚合物充电电池\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('ZGZSqRjyIbZPgU828pjspvgD4T2EynouC2f9pLFJHEoWQOgMQ8', 'Apple iPad 9.7英寸平板电脑(银色) WIFI版 32G 【2017款】', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 2288, '{\"品牌\": \"Apple\", \"型号\": \"iPad\", \"商品尺寸\": \"24 x 16.9 x 0.8 cm\", \"商品重量\": \"467 g\", \"颜色\": \"银色\", \"屏幕尺寸\": \"9.7 英寸\", \"显示最大分辨率\": \"2048×1536\", \"硬盘容量\": \"32 GB\", \"显卡芯片\": \"64 位架构的 A9 芯片\", \"操作系统\": \"iOS 10\", \"电池类型\": \"内置 32.4 瓦时锂聚合物充电电池\", \"电池包装类型\": \"电池是装配在该商品内\"}', 100);
INSERT INTO `product` VALUES ('ZKp9N1xbfUrU3WNE2sXSp0iRNzr3Cu8kusaPOlhZnutq0FsC32', 'korecase ipad 迷你套硅胶 ipad 迷你2保护套耐冲击混合三层盔甲防水手机全身防护防震保护套适用于 iPad mini 1 2 3', 'qz0tG4n27DTunWh8R2yx6C86iEQy4tc1m1vWC8tAUK7mPyfMoe', 445.46, '{\"品牌\": \"Korecase\", \"商品尺寸\": \"20.8 x 14.2 x 1.8 cm\", \"商品重量\": \"172 g\", \"颜色\": \"黑色\", \"屏幕尺寸\": \"8 英寸\"}', 100);
INSERT INTO `product` VALUES ('zltzX94RoAb3wyEM9f0UPgK9EJeNnsWTe78MK6Ycuta9UBWdFZ', '【Surface平板专营店】Microsoft 微软 Surface Book 2 二合一平板笔记本电脑 不带触控笔 顺丰发货 可开专票 (13.5英寸, 八代酷睿i7/8GB/256GB/GTX1050独显)', 'SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 14358, '{\"品牌\": \"Microsoft 微软\", \"颜色\": \"八代酷睿i7/8GB/256GB/GTX1050独显\", \"CPU生产商\": \"Intel\", \"芯片类型\": \"Intel Core i5\", \"CPU主频\": \"2.60 GHz\", \"内存容量\": \"8 GB\", \"内存类型\": \"DDR3 SDRAM\", \"硬盘容量\": \"256 GB\", \"硬盘接口\": \"Serial ATA\", \"硬件平台\": \"Windows\", \"操作系统\": \"Windows Pro\"}', 100);
INSERT INTO `product` VALUES ('ZSKvlrIqU7oQsM2z0GvWBYCVAElOqvz1nzet6fwJP04OnLS69n', 'Mr. YLLS 商用笔记本电脑背包防 thief 撕 / 防水旅行包适合高达38.10 cm macbook 电脑 USB 充电背包灰色全部 ) 黑色', 'WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 246.68, '{\"品牌\": \"MR. YLLS\", \"商品尺寸\": \"18 x 32 x 41.9 cm\", \"商品重量\": \"635 g\", \"颜色\": \"黑色\", \"屏幕尺寸\": \"17 英寸\"}', 100);
INSERT INTO `product` VALUES ('zWVKdgZkQhRgXfM1Mj7aPbARqMHYYvqZAiynNr9bGqQSucRL65', 'Philips飞利浦 E105 直板按键商务备用手机双卡双待小巧迷你无游戏学生手机儿童小手机 (陨石黑)', 'qz0tG4n27DTunWh8R2yx6C86iEQy4tc1m1vWC8tAUK7mPyfMoe', 62, '{\"商品尺寸\": \"4.4 x 1.4 x 10.6 cm\", \"商品重量\": \"72.6 g\", \"产品颜色\": \"陨石黑\", \"特殊功能\": \"双卡\", \"操作系统\": \"非智能机\", \"屏幕尺寸\": \"1.77 英寸\", \"型号年份\": \"2016\", \"型号\": \"CTE105BK/93\"}', 100);
COMMIT;

-- ----------------------------
-- Table structure for second_category
-- ----------------------------
DROP TABLE IF EXISTS `second_category`;
CREATE TABLE `second_category` (
  `second_category_id` varchar(100) NOT NULL,
  `first_category_id` varchar(100) NOT NULL,
  `second_category_name` varchar(100) NOT NULL,
  PRIMARY KEY (`second_category_id`),
  UNIQUE KEY `second_category_second_category_id_uindex` (`second_category_id`),
  UNIQUE KEY `second_category_second_category_name_uindex` (`second_category_name`),
  KEY `second_category_first_category_first_category_id_fk` (`first_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of second_category
-- ----------------------------
BEGIN;
INSERT INTO `second_category` VALUES ('1CMnGP2MiBLua1fXCt36d2j0qhf9HA2kkJvQYGlJWPffyBZbTH', 'QhUzQaamNO2Q4SZYSrGlfPa7Dg7GYt2ZjQK3KdXkYoWtBKfZm0', '名酒');
INSERT INTO `second_category` VALUES ('AjTK7ox73L6qfxuvtOI3NogtOTCVACkhxKKw9mVQVTwvPU46b2', 'E0XiJWDSyHy9VKrIhxceTsemmFMemHPYOrQqIrrIHWFupIbKkq', '配饰');
INSERT INTO `second_category` VALUES ('aoETMH5TBPmdl7wExItWc8ZGHZt4qkwJMyt8TzHrWiSLZvH2Kn', 'LfuB8VDSSiVayNEo2DiTFqAySvwXhzmyRezWDjmnpMZKb2bA4I', '文艺');
INSERT INTO `second_category` VALUES ('Av7yd1bCsKdy0Tx66j6kmpEHEhjTdchmn7QJJmNt9HYnKS3EDO', 'PmdCYbUJU7rXqHoEEA4Uei08sIKdSCCaXX8rQkVABQHMTm4by0', '空调');
INSERT INTO `second_category` VALUES ('D2mi6hVUHPwqPsFrBSFFIM89maFM2C3mrV97LzreXz6kdLarZg', 'LfuB8VDSSiVayNEo2DiTFqAySvwXhzmyRezWDjmnpMZKb2bA4I', '音像');
INSERT INTO `second_category` VALUES ('EbscV69oeARHJ2cUcuH7D6pwVrIL25iZZfcaq3NjCy3wlYHaI9', 'hmL914pKeRocGXQIkPPUFuPltsBrFCqYdpcsz3vhxxWFtGoi7f', '辅食');
INSERT INTO `second_category` VALUES ('EYfefnGaDFKS2Ko6JwZPkOPvNmSx1brWDvp23VIYNGkTsvW6gm', 'LfuB8VDSSiVayNEo2DiTFqAySvwXhzmyRezWDjmnpMZKb2bA4I', '教育');
INSERT INTO `second_category` VALUES ('i3wpXbEizmLFQTysnDTZ550V0Nz8baSQOMbCHLVtOBHNLesJtx', 'E0XiJWDSyHy9VKrIhxceTsemmFMemHPYOrQqIrrIHWFupIbKkq', '男装');
INSERT INTO `second_category` VALUES ('Jdl3sPWJB7XNZ43852ZX2W56MjcqAlQiYMBmqk61xy64FuQBTH', 'E0XiJWDSyHy9VKrIhxceTsemmFMemHPYOrQqIrrIHWFupIbKkq', '内衣');
INSERT INTO `second_category` VALUES ('jn0yJWwu8hZybMxJxOzGY3VctMNjg1C37kjLFzQihn6cTimVSy', 'E0XiJWDSyHy9VKrIhxceTsemmFMemHPYOrQqIrrIHWFupIbKkq', '女装');
INSERT INTO `second_category` VALUES ('Me5X46XNCBLRhuUCV8tpfPj5Zxu5ryBfRGDygAMhwGj39JUt3Z', 'QhUzQaamNO2Q4SZYSrGlfPa7Dg7GYt2ZjQK3KdXkYoWtBKfZm0', '水果');
INSERT INTO `second_category` VALUES ('MEsEBoUXj8JxUMBJwruViG3HSkZ1W3SivR3vuz6xoNAguF02PP', 'LfuB8VDSSiVayNEo2DiTFqAySvwXhzmyRezWDjmnpMZKb2bA4I', '杂志');
INSERT INTO `second_category` VALUES ('oQTwtlCzKO8ooDmwx6d9ynJf1u2lsDFJd6u6UuKJHnipFcKH62', 'QhUzQaamNO2Q4SZYSrGlfPa7Dg7GYt2ZjQK3KdXkYoWtBKfZm0', '饮料');
INSERT INTO `second_category` VALUES ('OTkhUJaFJZyOK5fFfBjdw7wI7aepbG4MQ4lIOgrLMxVfnTjcyu', 'hmL914pKeRocGXQIkPPUFuPltsBrFCqYdpcsz3vhxxWFtGoi7f', '奶粉');
INSERT INTO `second_category` VALUES ('QKZDcx97eVbAMGocGBlNn2wv9cMJcgFrxQlfPMKONVn5ad5Kb9', 'PmdCYbUJU7rXqHoEEA4Uei08sIKdSCCaXX8rQkVABQHMTm4by0', '洗衣机');
INSERT INTO `second_category` VALUES ('qz0tG4n27DTunWh8R2yx6C86iEQy4tc1m1vWC8tAUK7mPyfMoe', 'ZFMRhWOW07lsuShQ1bPvefmY9YJ1RIwmJ5oauh7QpSIcfnDWdK', '手机');
INSERT INTO `second_category` VALUES ('S9ygAhnDpeM2QWWrb4AmhMkTSvn8UQRo33e9zMJGVoSS4vZKjF', 'PmdCYbUJU7rXqHoEEA4Uei08sIKdSCCaXX8rQkVABQHMTm4by0', '电视');
INSERT INTO `second_category` VALUES ('SOXPyLwLdOlP9IhU2nJusILZSZggGi2Zk3sicMxLUHMiPOKaK1', 'ZFMRhWOW07lsuShQ1bPvefmY9YJ1RIwmJ5oauh7QpSIcfnDWdK', '平板');
INSERT INTO `second_category` VALUES ('SWfUOqHsB5L560D86A2MWh9w6mfKn293XYu91HulEcZqGgGgWo', 'PmdCYbUJU7rXqHoEEA4Uei08sIKdSCCaXX8rQkVABQHMTm4by0', '冰箱');
INSERT INTO `second_category` VALUES ('uQwktsUzznB3Sof1RB7SCpybQB3GM3HHHD4xXju0mOEBJGXpF9', 'hmL914pKeRocGXQIkPPUFuPltsBrFCqYdpcsz3vhxxWFtGoi7f', '喂养用品');
INSERT INTO `second_category` VALUES ('v7ChBz6ZyaObMmIgLRkfLGhCO7FPo76hPRif3APYRlZpCuWdkG', 'ZFMRhWOW07lsuShQ1bPvefmY9YJ1RIwmJ5oauh7QpSIcfnDWdK', '相机');
INSERT INTO `second_category` VALUES ('VUKMalyOdHsJMLCDFgZkvRs9vySI344bviOztcfUs3m2OXFvze', 'QhUzQaamNO2Q4SZYSrGlfPa7Dg7GYt2ZjQK3KdXkYoWtBKfZm0', '肉类');
INSERT INTO `second_category` VALUES ('WLjkLuSIrT4UQ5hZL8uKoUoylVZV9m9w5jgMxitVOwwUL3rT2g', 'ZFMRhWOW07lsuShQ1bPvefmY9YJ1RIwmJ5oauh7QpSIcfnDWdK', '电脑');
INSERT INTO `second_category` VALUES ('xhe5ogKHT585FB1rDkZ52cq0Sj42UL2MUz00y2EUZetfsytmP0', 'hmL914pKeRocGXQIkPPUFuPltsBrFCqYdpcsz3vhxxWFtGoi7f', '玩具');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `role` tinyint(1) NOT NULL DEFAULT '0',
  `user_name` varchar(100) NOT NULL,
  `head_img` varchar(100) NOT NULL DEFAULT 'http://tuchuang-1252747889.cosgz.myqcloud.com/2018-03-16-default_head_img.jpg',
  `birthday` date DEFAULT '2008-12-29',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_user_id_uindex` (`user_id`),
  UNIQUE KEY `user_user_name_uindex` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('96@qq.com', '$2a$10$mHOT5qBv4BLx2..zMWrYyehDWz0Hfr14AOKAxTEm9RoluuxYy.Jzi', 0, '1', 'images/head/boy.jpg', NULL);
INSERT INTO `user` VALUES ('97@qq.com', '$2a$10$mHOT5qBv4BLx2..zMWrYyehDWz0Hfr14AOKAxTEm9RoluuxYy.Jzi', 1, '2', 'images/head/boy.jpg', '2008-12-29');
INSERT INTO `user` VALUES ('test2@123.com', '$2a$10$ArwsJlYRKvv8uU32XEh0X.OhzyF/.Z2AKS3MgTaDhwNSqTOK4PXAW', 1, 'test2', 'boy.jpg', NULL);
INSERT INTO `user` VALUES ('test@123.com', '$2a$10$LQq.d7YXtTL2DF8xjq/iB.8s9Pu0jHXFEyBPHo.vNo.qwUeNuwhqK', 1, 'test1', 'test@123.com', NULL);
COMMIT;

-- ----------------------------
-- Table structure for user_order
-- ----------------------------
DROP TABLE IF EXISTS `user_order`;
CREATE TABLE `user_order` (
  `order_id` varchar(100) NOT NULL,
  `order_date` date DEFAULT NULL,
  `user_id` varchar(100) NOT NULL,
  `address_id` varchar(100) NOT NULL,
  `order_status` varchar(100) NOT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_order_id_uindex` (`order_id`),
  KEY `user_order_user_user_id_fk` (`user_id`),
  KEY `user_order_address_address_id_fk` (`address_id`),
  CONSTRAINT `user_order_address_address_id_fk` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_order_user_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_order
-- ----------------------------
BEGIN;
INSERT INTO `user_order` VALUES ('4e18b3d8-f9ea-4cca-9933-7074e4e4eb22', '2019-01-08', 'test2@123.com', '7498b556-437b-4898-8960-b658eb5fb2d5', '已付款');
INSERT INTO `user_order` VALUES ('5471d0c1-dde9-4c2b-a90b-4eb06fb626a3', '2018-12-27', 'test@123.com', 'a8e99755-dd7a-48d8-9a4b-01dd2cb34741', '已付款');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
