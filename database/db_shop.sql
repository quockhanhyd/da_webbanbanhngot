/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80037
 Source Host           : localhost:3306
 Source Schema         : da_webbanbanhngot

 Target Server Type    : MySQL
 Target Server Version : 80037
 File Encoding         : 65001

 Date: 09/07/2024 20:23:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_category
-- ----------------------------
DROP TABLE IF EXISTS `tbl_category`;
CREATE TABLE `tbl_category`  (
  `cat_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `parent_id` int NOT NULL DEFAULT 0,
  `type` int NOT NULL,
  `active` int NOT NULL DEFAULT 2,
  `create_at` int NOT NULL,
  `create_by` int NOT NULL,
  `modify_at` int NOT NULL,
  `modify_by` int NOT NULL,
  PRIMARY KEY (`cat_id`) USING BTREE,
  INDEX `create_by`(`create_by` ASC) USING BTREE,
  INDEX `modify_by`(`modify_by` ASC) USING BTREE,
  CONSTRAINT `tbl_category_ibfk_1` FOREIGN KEY (`modify_by`) REFERENCES `tbl_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbl_category_ibfk_2` FOREIGN KEY (`create_by`) REFERENCES `tbl_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_category
-- ----------------------------
INSERT INTO `tbl_category` VALUES (10, 'Bánh sinh nhật', 'banh-sinh-nhat', 0, 2, 1, 1512296644, 1, 1719724240, 1);
INSERT INTO `tbl_category` VALUES (11, 'Gateaux Kem Tươi', 'gateaux-kem-tuoi', 10, 2, 1, 1512614886, 1, 1719724293, 1);
INSERT INTO `tbl_category` VALUES (12, 'Bánh mỳ  Bánh mặn', 'banh-my-banh-man', 0, 2, 1, 1513096449, 1, 1719724250, 1);
INSERT INTO `tbl_category` VALUES (13, 'Công nghệ', 'cong-nghe', 0, 1, 1, 1513183416, 1, 1513936783, 1);
INSERT INTO `tbl_category` VALUES (14, 'Tin tức', 'tin-tuc', 13, 1, 1, 1513183490, 1, 1513936639, 1);
INSERT INTO `tbl_category` VALUES (15, 'Gateaux Kem Bơ', 'gateaux-kem-bo', 10, 2, 1, 1513254068, 1, 1719724301, 1);
INSERT INTO `tbl_category` VALUES (16, 'Cookies  Minicakes', 'cookies-minicakes', 0, 2, 2, 1719724281, 1, 1719724281, 1);

-- ----------------------------
-- Table structure for tbl_customer
-- ----------------------------
DROP TABLE IF EXISTS `tbl_customer`;
CREATE TABLE `tbl_customer`  (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NULL DEFAULT NULL,
  `phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NULL DEFAULT NULL,
  `buy` int NOT NULL DEFAULT 0,
  `code_active` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NULL,
  `subcribe` int NOT NULL DEFAULT 0,
  `create_at` int NOT NULL,
  PRIMARY KEY (`customer_id`) USING BTREE,
  UNIQUE INDEX `email`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_customer
-- ----------------------------
INSERT INTO `tbl_customer` VALUES (7, 'Phan Văn Huy', 'phantam.t10@gmail.co', 'Tân Yên - Bắc Giang ', '01656788365', 1, '', '', 1, 1513859014);
INSERT INTO `tbl_customer` VALUES (8, 'Phan Văn Tâm   ', 'phantam.t10@gmail.com', 'Phú Đô - Nam Từ Liêm - Hà Nội', '01656788365', 0, '', '', 1, 1515571390);
INSERT INTO `tbl_customer` VALUES (9, NULL, 'vuvanxuan195@gmail.com', NULL, NULL, 0, '3772facf7eaae060c1a23f5dc62cdcde', NULL, 0, 0);
INSERT INTO `tbl_customer` VALUES (10, 'Nguyễn Quốc Khánh', 'quockhanh01091@gmail.com', 'H9', '0971586159', 1, '', '', 1, 1719411039);

-- ----------------------------
-- Table structure for tbl_detail_order
-- ----------------------------
DROP TABLE IF EXISTS `tbl_detail_order`;
CREATE TABLE `tbl_detail_order`  (
  `detail_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `price` int NOT NULL,
  `qty` int NOT NULL,
  `total_price` int NOT NULL,
  `connect_product` int NOT NULL,
  `order_id` int NOT NULL,
  PRIMARY KEY (`detail_id`) USING BTREE,
  INDEX `oreder_id`(`order_id` ASC) USING BTREE,
  CONSTRAINT `tbl_detail_order_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tbl_order` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_detail_order
-- ----------------------------
INSERT INTO `tbl_detail_order` VALUES (85, 'Laptop HP Probook 440 G2 LED Backlit', 13230000, 1, 13230000, 7, 1);
INSERT INTO `tbl_detail_order` VALUES (86, 'Motorola Moto G5S Plus', 6990000, 1, 6990000, 11, 2);
INSERT INTO `tbl_detail_order` VALUES (87, 'Điện thoại iPhone 8 64G', 20990000, 1, 20990000, 5, 3);
INSERT INTO `tbl_detail_order` VALUES (88, 'Điện thoại iPhone 8 64G', 20990000, 2, 41980000, 5, 4);
INSERT INTO `tbl_detail_order` VALUES (89, 'Laptop HP Probook 440', 9000000, 1, 9000000, 6, 4);
INSERT INTO `tbl_detail_order` VALUES (90, 'Laptop HP Probook 440 G2 LED Backlit', 13230000, 1, 13230000, 7, 5);
INSERT INTO `tbl_detail_order` VALUES (91, 'Điện thoại iPhone X 64GB', 26990000, 1, 26990000, 4, 6);
INSERT INTO `tbl_detail_order` VALUES (92, 'Samsung Galaxy A5', 6390000, 1, 6390000, 12, 7);
INSERT INTO `tbl_detail_order` VALUES (93, 'Điện thoại iPhone X 64GB', 26990000, 1, 26990000, 4, 8);
INSERT INTO `tbl_detail_order` VALUES (94, 'Điện thoại iPhone 8 64G', 20990000, 1, 20990000, 5, 8);
INSERT INTO `tbl_detail_order` VALUES (95, 'Điện thoại iPhone X 64GB', 26990000, 1, 26990000, 4, 9);
INSERT INTO `tbl_detail_order` VALUES (96, 'Điện thoại iPhone X 64GB', 26990000, 1, 26990000, 4, 10);

-- ----------------------------
-- Table structure for tbl_filter
-- ----------------------------
DROP TABLE IF EXISTS `tbl_filter`;
CREATE TABLE `tbl_filter`  (
  `filter_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `type` int NOT NULL COMMENT '1=>filter by price .2=> filter by category',
  `max_price` int NULL DEFAULT NULL,
  `min_price` int NULL DEFAULT 0,
  `cat_id` int NULL DEFAULT NULL,
  `create_at` int NOT NULL,
  `active` int NOT NULL DEFAULT 2,
  `create_by` int NOT NULL,
  `modify_at` int NOT NULL,
  `modify_by` int NOT NULL,
  PRIMARY KEY (`filter_id`) USING BTREE,
  INDEX `cat_id`(`cat_id` ASC) USING BTREE,
  INDEX `create_by`(`create_by` ASC) USING BTREE,
  INDEX `modify_by`(`modify_by` ASC) USING BTREE,
  CONSTRAINT `tbl_filter_ibfk_1` FOREIGN KEY (`modify_by`) REFERENCES `tbl_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbl_filter_ibfk_2` FOREIGN KEY (`create_by`) REFERENCES `tbl_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbl_filter_ibfk_3` FOREIGN KEY (`cat_id`) REFERENCES `tbl_category` (`cat_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_filter
-- ----------------------------
INSERT INTO `tbl_filter` VALUES (11, 'Từ 1.000.000đ đến 5.000.000đ', 1, 5000000, 1000000, NULL, 1512573657, 1, 1, 1515631537, 1);
INSERT INTO `tbl_filter` VALUES (13, 'Máy tính', 2, NULL, NULL, 12, 1512573802, 3, 1, 1513361285, 1);
INSERT INTO `tbl_filter` VALUES (14, 'Điện thoại', 2, NULL, NULL, 10, 1513137088, 3, 1, 1513937289, 1);
INSERT INTO `tbl_filter` VALUES (22, 'Từ 5.000.000 đến 10.000.000', 1, 10000000, 5000000, NULL, 1515631367, 1, 1, 1515631367, 1);
INSERT INTO `tbl_filter` VALUES (23, 'Từ 10.000.000 đến 15.000.000', 1, 15000000, 10000000, NULL, 1515631491, 1, 1, 1515631491, 1);

-- ----------------------------
-- Table structure for tbl_history
-- ----------------------------
DROP TABLE IF EXISTS `tbl_history`;
CREATE TABLE `tbl_history`  (
  `history_id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NULL DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `user_id` int NOT NULL,
  `parent_id` int NOT NULL DEFAULT 0,
  `happen_at` int NOT NULL,
  PRIMARY KEY (`history_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_history
-- ----------------------------
INSERT INTO `tbl_history` VALUES (1, NULL, 'login', 1, 0, 1720236405);
INSERT INTO `tbl_history` VALUES (2, NULL, 'login', 1, 0, 1720258284);
INSERT INTO `tbl_history` VALUES (3, NULL, 'login', 1, 0, 1720503037);
INSERT INTO `tbl_history` VALUES (4, 'Cập nhập thành công Menu : Bánh sinh nhật', 'edit', 1, 3, 1720503128);
INSERT INTO `tbl_history` VALUES (5, 'Cập nhập thành công Menu : Bánh mì & bánh mặn', 'edit', 1, 3, 1720503152);
INSERT INTO `tbl_history` VALUES (6, 'Cập nhập thành công Menu : Bánh mì & Bánh mặn', 'edit', 1, 3, 1720503169);
INSERT INTO `tbl_history` VALUES (7, 'Cập nhập thành công Menu : COOKIES', 'edit', 1, 3, 1720503212);
INSERT INTO `tbl_history` VALUES (8, 'Xóa thành công Menu : COOKIES.Tạo ngày 10/01/2018', 'drop', 1, 3, 1720503215);
INSERT INTO `tbl_history` VALUES (9, 'Cập nhập thành công Menu : Cookies', 'edit', 1, 3, 1720503229);
INSERT INTO `tbl_history` VALUES (10, 'Cập nhập thành công Menu : Minicakes', 'edit', 1, 3, 1720503256);
INSERT INTO `tbl_history` VALUES (11, 'Cập nhập thành công Menu : Bánh mì', 'edit', 1, 3, 1720503290);
INSERT INTO `tbl_history` VALUES (12, 'Thêm thành công Menu : Bánh mặn', 'add', 1, 3, 1720503368);
INSERT INTO `tbl_history` VALUES (13, 'Xóa thành công Menu : Tin tức.Tạo ngày 10/01/2018', 'drop', 1, 3, 1720503402);
INSERT INTO `tbl_history` VALUES (14, NULL, 'login', 1, 0, 1720528754);
INSERT INTO `tbl_history` VALUES (15, 'Xóa thành công Menu : Điện thoại sam sung.Tạo ngày 04/03/2018', 'drop', 1, 14, 1720529010);

-- ----------------------------
-- Table structure for tbl_media
-- ----------------------------
DROP TABLE IF EXISTS `tbl_media`;
CREATE TABLE `tbl_media`  (
  `media_id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NULL DEFAULT NULL,
  `caption` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NULL DEFAULT NULL,
  `id_connect` int NULL DEFAULT 0,
  `active` int NOT NULL DEFAULT 2,
  `type` int NOT NULL,
  `create_at` int NOT NULL,
  `create_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`media_id`) USING BTREE,
  INDEX `id_connect`(`id_connect` ASC) USING BTREE,
  INDEX `create_by`(`create_by` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 329 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_media
-- ----------------------------
INSERT INTO `tbl_media` VALUES (1, 'public/images/sytem/post.jpg', 'Ảnh mặc định cho bài viết', NULL, 0, 3, 3, 999999999, 1);
INSERT INTO `tbl_media` VALUES (2, 'public/images/sytem/product.jpg', 'Ảnh mặc định cho sản phẩm', NULL, 0, 3, 2, 999999999, 1);
INSERT INTO `tbl_media` VALUES (3, 'public/images/sytem/avatar.jpg', 'Ảnh mặc định cho người dùng ', 'Ảnh mặc định cho người dùng ', 0, 3, 1, 11111111, 1);
INSERT INTO `tbl_media` VALUES (184, 'public/images/product/product(copy-1).png', 'Product', 'undefined', 1, 1, 3, 1512296605, 1);
INSERT INTO `tbl_media` VALUES (186, 'public/images/product/product(copy-5).jpg', 'Product', 'undefined', 1, 1, 3, 1512296757, 1);
INSERT INTO `tbl_media` VALUES (216, 'public/images/product/product.jpg', 'Product', 'undefined', 1, 1, 3, 1512446214, 1);
INSERT INTO `tbl_media` VALUES (220, 'public/images/product/product(copy-2).jpg', 'Product', 'undefined', 1, 1, 3, 1512449268, 1);
INSERT INTO `tbl_media` VALUES (222, 'public/images/product/product(copy-1).jpg', 'Product', 'undefined', 1, 1, 3, 1512456009, 1);
INSERT INTO `tbl_media` VALUES (231, 'public/images/product/product.png', 'Product', 'undefined', 1, 1, 3, 1512469668, 1);
INSERT INTO `tbl_media` VALUES (241, 'public/images/avatar/phan-van-khuong(copy-1).png', 'Phan Văn Khương', 'undefined', 1, 1, 1, 1512844286, 1);
INSERT INTO `tbl_media` VALUES (257, 'public/images/product/red-velvet-cream-cheese-mousse-cake.png', 'RED VELVET CREAM CHEESE MOUSSE CAKE', NULL, 5, 1, 3, 1513062246, 1);
INSERT INTO `tbl_media` VALUES (261, 'public/images/product/mien-phi-van-chuyen(copy-1).png', 'Miễn phí vận chuyển', 'undefined', 1, 1, 3, 1513100331, 1);
INSERT INTO `tbl_media` VALUES (265, 'public/images/post/oppo-a83-ro-ri-thong-so-cau-hinh-su-dung-bao-mat-khuon-mat(copy-1).png', 'OPPO A83 rò rỉ thông số cấu hình sử dụng bảo mật khuôn mặt', 'undefined', 1, 1, 2, 1513183552, 1);
INSERT INTO `tbl_media` VALUES (298, 'public/images/product/dat-hang-online(copy-1).png', 'Đặt hàng online', 'undefined', 5, 1, 3, 1513697680, 1);
INSERT INTO `tbl_media` VALUES (314, 'public/images/post/dien-thoai-co-ban-ho-tro-4g-cua-nokia-vua-dat-chung-nhan-bluetooth(copy-1).png', 'Điện thoại cơ bản hỗ trợ 4G của Nokia vừa đạt chứng nhận Bluetooth', 'undefined', 2, 1, 2, 1513960285, 5);
INSERT INTO `tbl_media` VALUES (315, 'public/images/product/mien-phi-van-chuyen(copy-1).png', 'Miễn phí vận chuyển', NULL, 5, 1, 3, 1515574694, 1);
INSERT INTO `tbl_media` VALUES (316, 'public/images/product/slide-1.png', 'Slide 1', '', 1, 1, 3, 1515586065, 1);
INSERT INTO `tbl_media` VALUES (317, 'public/images/product/slide-3.png', 'Slide 3', '', 2, 1, 3, 1515586205, 1);
INSERT INTO `tbl_media` VALUES (318, 'public/images/product/thanh-toan-nhanh.png', 'Thanh toán nhanh', NULL, 6, 1, 3, 1515629046, 1);
INSERT INTO `tbl_media` VALUES (319, 'public/images/product/tiet-kiem-hon.png', 'Tiết kiệm hơn', NULL, 7, 1, 3, 1515629094, 1);
INSERT INTO `tbl_media` VALUES (320, 'public/images/product/tu-van-247(copy-1).png', 'Tư vấn 24/7', NULL, 8, 1, 3, 1515629151, 1);
INSERT INTO `tbl_media` VALUES (321, 'public/images/product/dat-hang-online.png', 'Đặt hàng online', NULL, 9, 1, 3, 1515629218, 1);
INSERT INTO `tbl_media` VALUES (323, 'public/images/product/3499704f027336546022b340f1e45304.jpg', NULL, NULL, 0, 2, 3, 1517468300, 1);
INSERT INTO `tbl_media` VALUES (325, 'public/images/product/5b00c11f36a0a3a3656165c704773c2c.jpg', NULL, NULL, 0, 2, 3, 1517547215, 1);
INSERT INTO `tbl_media` VALUES (326, 'public/images/product/tiramisu-cake-mousse.png', 'TIRAMISU CAKE MOUSSE', NULL, 18, 1, 3, 1719416458, 1);
INSERT INTO `tbl_media` VALUES (327, 'public/images/avatar/quoc-khanh.png', 'Quoc Khanh', NULL, 1, 1, 1, 1719466156, 1);
INSERT INTO `tbl_media` VALUES (328, 'public/images/product/slide-2.png', 'Slide 2', '', 3, 1, 3, 1719671204, 1);

-- ----------------------------
-- Table structure for tbl_menu
-- ----------------------------
DROP TABLE IF EXISTS `tbl_menu`;
CREATE TABLE `tbl_menu`  (
  `menu_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `type` int NOT NULL COMMENT '1 => page .2 => cat_post. 3 => cat_product',
  `connect_to` int NULL DEFAULT NULL,
  `parent_id` int NOT NULL,
  `active` int NOT NULL DEFAULT 2,
  `link` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `location` int NOT NULL COMMENT '1=> header . 2=> footer 3- sidebar 4-> response',
  `ordinal` int NOT NULL,
  `create_at` int NOT NULL,
  `modify_at` int NOT NULL,
  `create_by` int NOT NULL,
  `modify_by` int NOT NULL,
  PRIMARY KEY (`menu_id`) USING BTREE,
  INDEX `modify_by`(`modify_by` ASC) USING BTREE,
  INDEX `create_by`(`create_by` ASC) USING BTREE,
  CONSTRAINT `tbl_menu_ibfk_1` FOREIGN KEY (`modify_by`) REFERENCES `tbl_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbl_menu_ibfk_2` FOREIGN KEY (`create_by`) REFERENCES `tbl_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_menu
-- ----------------------------
INSERT INTO `tbl_menu` VALUES (3, 'Chính sách trả góp', 1, 2, 6, 1, 'where-does-it-come-from.html', 2, 1, 1512619090, 1513757048, 1, 1);
INSERT INTO `tbl_menu` VALUES (6, 'Chính sách mua hàng', 1, 2, 0, 1, 'where-does-it-come-from.html', 2, 1, 1512982583, 1513756153, 1, 1);
INSERT INTO `tbl_menu` VALUES (7, 'Chính sách bảo hành - đổi trả', 1, 6, 6, 1, 'why-do-we-use-i.html', 2, 4, 1512985619, 1513756987, 1, 1);
INSERT INTO `tbl_menu` VALUES (8, 'Quy định - chính sách', 1, 2, 6, 1, 'where-does-it-come-from.html', 2, 3, 1513015664, 1513756996, 1, 1);
INSERT INTO `tbl_menu` VALUES (9, 'Cookies Minicakes', 3, 10, 0, 1, 'san-pham/banh-sinh-nhat', 1, 4, 1513016412, 1719724357, 1, 1);
INSERT INTO `tbl_menu` VALUES (10, 'Tin tức', 2, 13, 0, 1, 'cong-nghe', 1, 5, 1513303403, 1515585082, 1, 1);
INSERT INTO `tbl_menu` VALUES (11, 'Bánh sinh nhật', 3, 10, 0, 1, 'san-pham/banh-sinh-nhat', 3, 1, 1513303781, 1720503128, 1, 1);
INSERT INTO `tbl_menu` VALUES (12, 'Giường ngủ', 3, 15, 11, 1, 'san-pham/giuong-ngu', 3, 2, 1513307289, 1719672833, 1, 1);
INSERT INTO `tbl_menu` VALUES (15, 'Bánh mì', 3, 12, 0, 1, 'san-pham/banh-my-banh-man', 3, 1, 1513550602, 1720503290, 1, 1);
INSERT INTO `tbl_menu` VALUES (20, 'Bánh sinh nhật', 3, 10, 0, 1, 'san-pham/phong-ngu', 1, 2, 1515584830, 1719724193, 1, 1);
INSERT INTO `tbl_menu` VALUES (21, 'Trang chủ', 4, NULL, 0, 1, 'trang-chu.html', 1, 1, 1515584958, 1515585040, 1, 1);
INSERT INTO `tbl_menu` VALUES (22, 'Bánh mỳ & Bánh mặn', 3, 12, 0, 1, 'san-pham/phong-khach', 1, 3, 1515585017, 1719724227, 1, 1);
INSERT INTO `tbl_menu` VALUES (23, 'Cookies', 3, 10, 0, 1, 'san-pham/banh-sinh-nhat', 3, 1, 1515585611, 1720503229, 1, 1);
INSERT INTO `tbl_menu` VALUES (25, 'Tủ quần áo', 3, 11, 11, 1, 'san-pham/tu-quan-ao', 3, 1, 1515585696, 1719672857, 1, 1);
INSERT INTO `tbl_menu` VALUES (26, 'Phòng ngủ', 3, 10, 0, 1, 'san-pham/phong-ngu', 4, 1, 1515627849, 1719672754, 1, 1);
INSERT INTO `tbl_menu` VALUES (28, 'Giường ngủ', 3, 15, 26, 1, 'san-pham/giuong-ngu', 4, 1, 1515627981, 1719672772, 1, 1);
INSERT INTO `tbl_menu` VALUES (29, 'Máy tính', 3, 12, 0, 1, 'san-pham/may-tinh', 4, 1, 1515628008, 1515628008, 1, 1);
INSERT INTO `tbl_menu` VALUES (30, 'Tablet', 3, 12, 0, 1, 'san-pham/may-tinh', 4, 1, 1515628036, 1515628036, 1, 1);
INSERT INTO `tbl_menu` VALUES (31, 'Tai nghe', 3, 12, 0, 1, 'san-pham/may-tinh', 4, 1, 1515628065, 1515628065, 1, 1);
INSERT INTO `tbl_menu` VALUES (33, 'Minicakes', 3, 12, 0, 1, 'san-pham/banh-my-banh-man', 3, 3, 1719672952, 1720503256, 1, 1);
INSERT INTO `tbl_menu` VALUES (34, 'Bánh mặn', 1, 1, 0, 1, 'gioi-thieu.html', 3, 3, 1720503368, 1720503368, 1, 1);

-- ----------------------------
-- Table structure for tbl_order
-- ----------------------------
DROP TABLE IF EXISTS `tbl_order`;
CREATE TABLE `tbl_order`  (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `code_order` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `buyer` int NOT NULL,
  `active` int NOT NULL DEFAULT 3,
  `payment_method` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `code_active` varchar(33) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NULL DEFAULT NULL,
  `total_price` int NOT NULL,
  `total_qty` int NOT NULL,
  `create_at` int NOT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  UNIQUE INDEX `code_order`(`code_order` ASC) USING BTREE,
  INDEX `buyer`(`buyer` ASC) USING BTREE,
  CONSTRAINT `tbl_order_ibfk_1` FOREIGN KEY (`buyer`) REFERENCES `tbl_customer` (`customer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_order
-- ----------------------------
INSERT INTO `tbl_order` VALUES (1, 'VSZ-1', 7, 3, 'direct-payment', '235980b03cfc7ffd9f1d6468a7d382dd', 13230000, 1, 1513858271);
INSERT INTO `tbl_order` VALUES (2, 'VSZ-2', 7, 3, 'direct-payment', '', 6990000, 1, 1513859014);
INSERT INTO `tbl_order` VALUES (3, 'VSZ-3', 8, 4, 'direct-payment', '', 20990000, 1, 1513859936);
INSERT INTO `tbl_order` VALUES (4, 'VSZ-4', 8, 3, 'direct-payment', 'dca802c97173fb76e5ca1eea09a2ca68', 50980000, 3, 1515560301);
INSERT INTO `tbl_order` VALUES (5, 'VSZ-5', 8, 2, 'direct-payment', '6b17ccf125e5f88ef6c8e2fbaca16a6f', 13230000, 1, 1515571390);
INSERT INTO `tbl_order` VALUES (6, 'VSZ-6', 10, 3, 'direct-payment', '102f2533ac7b357cf50388192d5742ce', 26990000, 1, 1719410402);
INSERT INTO `tbl_order` VALUES (7, 'VSZ-7', 10, 3, 'direct-payment', '1c69170ed0a2289ae3c3e8a30d77ea84', 6390000, 1, 1719410564);
INSERT INTO `tbl_order` VALUES (8, 'VSZ-8', 10, 3, 'direct-payment', 'f622f3b491f8dfcb4c38248b3ea0e562', 47980000, 2, 1719410722);
INSERT INTO `tbl_order` VALUES (9, 'VSZ-9', 10, 3, 'direct-payment', 'a45e7fad1e89e9911c4df5ff49c4783e', 26990000, 1, 1719410993);
INSERT INTO `tbl_order` VALUES (10, 'VSZ-10', 10, 2, 'direct-payment', '', 26990000, 1, 1719411039);

-- ----------------------------
-- Table structure for tbl_page
-- ----------------------------
DROP TABLE IF EXISTS `tbl_page`;
CREATE TABLE `tbl_page`  (
  `page_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `slug` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `active` int NOT NULL DEFAULT 2,
  `create_at` int NOT NULL,
  `modify_by` int NOT NULL,
  `create_by` int NOT NULL,
  `modify_at` int NOT NULL,
  PRIMARY KEY (`page_id`) USING BTREE,
  INDEX `modify_by`(`modify_by` ASC) USING BTREE,
  INDEX `create_by`(`create_by` ASC) USING BTREE,
  CONSTRAINT `tbl_page_ibfk_1` FOREIGN KEY (`modify_by`) REFERENCES `tbl_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbl_page_ibfk_2` FOREIGN KEY (`create_by`) REFERENCES `tbl_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_page
-- ----------------------------
INSERT INTO `tbl_page` VALUES (1, 'giới thiệu', 'gioi-thieu', '<p>shop đồ điện tử vs shop</p>\r\n', 1, 1520149189, 1, 1, 1520149189);

-- ----------------------------
-- Table structure for tbl_post
-- ----------------------------
DROP TABLE IF EXISTS `tbl_post`;
CREATE TABLE `tbl_post`  (
  `post_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `thumbnail` int NOT NULL,
  `cat_id` int NOT NULL,
  `slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `active` int NOT NULL DEFAULT 2,
  `view` int NULL DEFAULT 1,
  `create_at` int NOT NULL,
  `create_by` int NOT NULL,
  `modify_at` int NOT NULL,
  `modify_by` int NOT NULL,
  PRIMARY KEY (`post_id`) USING BTREE,
  UNIQUE INDEX `slug`(`slug` ASC) USING BTREE,
  INDEX `thumbnail`(`thumbnail` ASC) USING BTREE,
  INDEX `cat_id`(`cat_id` ASC) USING BTREE,
  INDEX `modify_by`(`modify_by` ASC) USING BTREE,
  INDEX `creat_by`(`create_by` ASC) USING BTREE,
  CONSTRAINT `tbl_post_ibfk_1` FOREIGN KEY (`create_by`) REFERENCES `tbl_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbl_post_ibfk_2` FOREIGN KEY (`modify_by`) REFERENCES `tbl_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbl_post_ibfk_3` FOREIGN KEY (`cat_id`) REFERENCES `tbl_category` (`cat_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbl_post_ibfk_4` FOREIGN KEY (`thumbnail`) REFERENCES `tbl_media` (`media_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_post
-- ----------------------------
INSERT INTO `tbl_post` VALUES (1, 'OPPO A83 rò rỉ thông số cấu hình sử dụng bảo mật khuôn mặt', '            Đầu th&aacute;ng 12 vừa qua, cơ quan TENAA đ&atilde; thừa nhận sự xuất hiện của OPPO A83 với thiết kế to&agrave;n m&agrave;n h&igrave;nh. Mới đ&acirc;y, nguồn tin r&ograve; rỉ lại cho ch&uacute;ng ta...\r\n        ', '<h2 dir=\"ltr\">Đầu th&aacute;ng 12 vừa qua, cơ quan&nbsp;<a href=\"https://www.thegioididong.com/tin-tuc/fcc-ccc-la-gi-vi-sao-smartphone-muon-ban-ra-phai-duoc-ho-chung-nhan--1024896\" target=\"_blank\" title=\"TENAA\" type=\"TENAA\">TENAA</a>&nbsp;đ&atilde; thừa nhận sự xuất hiện của&nbsp;<a href=\"https://www.thegioididong.com/tin-tuc/tim-kiem?key=OPPO+A83\" target=\"_blank\" title=\"OPPO A83 \" type=\"OPPO A83 \">OPPO A83</a>với thiết kế m&agrave;n h&igrave;nh tr&agrave;n viền. Mới đ&acirc;y, nguồn tin r&ograve; rỉ lại cho ch&uacute;ng ta biết th&ecirc;m cấu h&igrave;nh của m&aacute;y.</h2>\r\n\r\n<p><img alt=\"Thông tin rò rỉ về cấu hình của OPPO A83\" src=\"https://cdn4.tgdd.vn/Files/2017/12/13/1050119/oppo-a83-leak-2_600x459.jpg\" title=\"Thông tin rò rỉ về cấu hình của OPPO A83\" /></p>\r\n\r\n<p dir=\"ltr\">Theo đ&oacute;, OPPO A83 sẽ c&oacute; m&agrave;n h&igrave;nh 5.7 inch HD+ tỉ lệ 18:9 đang ng&agrave;y c&agrave;ng thịnh h&agrave;nh, trang bị bộ vi xử l&yacute; Helio P23 đi k&egrave;m 2 GB RAM + 16 GB ROM (hỗ trợ khe cắm thẻ nhớ microSD).</p>\r\n\r\n<p><img alt=\"Thông tin rò rỉ về cấu hình của OPPO A83\" src=\"https://cdn1.tgdd.vn/Files/2017/12/13/1050119/oppo-a83-leak-3_600x512.jpg\" title=\"Thông tin rò rỉ về cấu hình của OPPO A83\" /></p>\r\n\r\n<p dir=\"ltr\">Nh&igrave;n v&agrave;o những h&igrave;nh ảnh được cung cấp c&oacute; thể thấy rằng OPPO A83 kh&ocirc;ng được t&iacute;ch hợp cảm biến v&acirc;n tay. Thay v&agrave;o đ&oacute;, nhiều người tin rằng m&aacute;y sẽ sử dụng chức năng bảo mật nhận diện khu&ocirc;n mặt. Ngo&agrave;i ra, sản phẩm n&agrave;y c&ograve;n sở hữu camera trước sau 5/13 MP v&agrave; vi&ecirc;n pin dung lượng 3.180 mAh.</p>\r\n\r\n<p><img alt=\"Thông tin rò rỉ về cấu hình của OPPO A83\" src=\"https://cdn3.tgdd.vn/Files/2017/12/13/1050119/oppo-a83-leak-1_600x291.jpg\" title=\"Thông tin rò rỉ về cấu hình của OPPO A83\" /></p>\r\n\r\n<p>Th&ocirc;ng số cấu h&igrave;nh của tin đồn n&agrave;y ho&agrave;n to&agrave;n ph&ugrave; hợp với những th&ocirc;ng tin của cơ quan TENAA cung cấp từ trước đ&oacute;. Chưa hết, trang&nbsp;<a href=\"http://playfuldroid.com/oppo-a83-specs-surface-may-arrive-with-facial-recognition-instead-of-fingerprint-scanner/\" rel=\"nofollow\" target=\"_blank\" title=\"playfuldroid \" type=\"playfuldroid \">playfuldroid</a>&nbsp;c&ograve;n cho biết th&ecirc;m, OPPO A83 c&oacute; k&iacute;ch thước 150.5 x73.1 x 7.7 mm, xuất hiện với t&ugrave;y chọn m&agrave;u v&agrave;ng v&agrave; đen cho người d&ugrave;ng chọn lựa.</p>\r\n\r\n<p dir=\"ltr\">Dự kiến, OPPO sẽ c&ocirc;ng bố OPPO A83 v&agrave;o ng&agrave;y 30/12 tới với gi&aacute; b&aacute;n khoảng 1.199 NDT (gần 4.1 triệu đồng).</p>\r\n', 265, 14, 'oppo-a83-ro-ri-thong-so-cau-hinh-su-dung-bao-mat-k', 1, 31, 1513183556, 1, 1513953229, 1);
INSERT INTO `tbl_post` VALUES (2, 'Điện thoại cơ bản hỗ trợ 4G của Nokia vừa đạt chứng nhận Bluetooth', 'Một v&agrave;i th&ocirc;ng tin gần nhất cho thấy, HMD sắp ra mắt một điện thoại &quot;cục gạch&quot; hỗ trợ 4G. V&agrave; mới nhất, c&aacute;c model TA-1047, TA-1060 đ&atilde; đạt chứng nhận tại&nbsp;FCC. Dự kiến đ&acirc;y ch&iacute;nh l&agrave; những điện thoại cơ bản hỗ trợ 4G tuy kh&ocirc;ng phải l&agrave; smartphone.', '<h2>Một v&agrave;i th&ocirc;ng tin gần nhất cho thấy, HMD sắp ra mắt một điện thoại &quot;cục gạch&quot; hỗ trợ 4G. V&agrave; mới nhất, c&aacute;c model TA-1047, TA-1060 đ&atilde; đạt chứng nhận tại&nbsp;<a href=\"https://www.thegioididong.com/tin-tuc/fcc-ccc-la-gi-vi-sao-smartphone-muon-ban-ra-phai-duoc-ho-chung-nhan--1024896\" target=\"_blank\" title=\"FCC\">FCC</a>. Dự kiến đ&acirc;y ch&iacute;nh l&agrave; những điện thoại cơ bản hỗ trợ 4G tuy kh&ocirc;ng phải l&agrave; smartphone.</h2>\r\n\r\n<p>Theo&nbsp;<a href=\"https://www.gizmochina.com/2017/12/21/4g-nokia-feature-phone-receives-bluetooth-sig-certification-launch-nearing/\" rel=\"nofollow\" target=\"_blank\" title=\"Nokia\">gizmochina</a>, mẫu điện thoại cơ bản hỗ trợ 4G của&nbsp;<a href=\"https://www.thegioididong.com/dtdd-nokia\" target=\"_blank\" title=\"Nokia \">Nokia</a>&nbsp;cũng vừa đạt chứng nhận tại tổ chức Bluetooth SIG, điều n&agrave;y chứng tỏ m&aacute;y đ&atilde; sẵn s&agrave;ng ra mắt.</p>\r\n\r\n<p>Bluetooth SIG đ&atilde; chứng nhận 5 model gồm: Nokia TA-1047, TA-1060, TA-1056, TA-1079 v&agrave; TA-1066. Dường như đ&acirc;y l&agrave; 5 biến thể của mẫu điện thoại nghe gọi sắp ra mắt.</p>\r\n\r\n<p><img alt=\"Điện thoại cục gạch Nokia hỗ trợ 4G đạt chứng nhận Bluetooth\" src=\"https://cdn.tgdd.vn/Files/2017/12/21/1052290/nokia-2_800x300.jpg\" title=\"Điện thoại cục gạch Nokia hỗ trợ 4G đạt chứng nhận Bluetooth\" /></p>\r\n\r\n<p>Dự kiến chiếc điện thoại mới n&agrave;y sẽ l&ecirc;n kệ ở nhiều thị trường kh&aacute;c nhau với 2 phi&ecirc;n bản l&agrave; 1 SIM v&agrave; 2 SIM. Ngo&agrave;i ra, phần m&ocirc; tả phần mềm cho thấy m&aacute;y kh&ocirc;ng chạy Android, rất c&oacute; thể sẽ t&iacute;ch hợp hệ điều h&agrave;nh series 30+ Feature OS tương tự như&nbsp;<a href=\"https://www.thegioididong.com/dtdd/nokia-3310-2017\" target=\"_blank\" title=\"Nokia 3310\">Nokia 3310</a>&nbsp;(2017).</p>\r\n\r\n<p>Danh s&aacute;ch tr&ecirc;n FCC cho thấy m&aacute;y c&oacute; k&iacute;ch thước l&agrave; 133 x 68 mm. N&oacute; được suy đo&aacute;n sẽ sử dụng b&agrave;n ph&iacute;m QWERTY giống với Nokia E72.</p>\r\n', 314, 14, 'dien-thoai-co-ban-ho-tro-4g-cua-nokia-vua-dat-chung-nhan-bluetooth', 2, 25, 1513960290, 5, 1513960503, 5);

-- ----------------------------
-- Table structure for tbl_product
-- ----------------------------
DROP TABLE IF EXISTS `tbl_product`;
CREATE TABLE `tbl_product`  (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `favorite` int NOT NULL DEFAULT 0,
  `name` varchar(220) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `percen` int NULL DEFAULT 0,
  `thumb` int NOT NULL,
  `img_involve` varchar(220) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NULL DEFAULT NULL,
  `depict` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `price` int NOT NULL,
  `cat_id` int NOT NULL,
  `info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `create_at` int NOT NULL,
  `total_product` int NOT NULL,
  `active` int NOT NULL DEFAULT 2,
  `discount` int NULL DEFAULT NULL,
  `create_by` int NOT NULL,
  `modify_by` int NOT NULL,
  `modify_at` int NOT NULL,
  PRIMARY KEY (`product_id`) USING BTREE,
  INDEX `thumb`(`thumb` ASC) USING BTREE,
  INDEX `cat_id`(`cat_id` ASC) USING BTREE,
  INDEX `create_by`(`create_by` ASC) USING BTREE,
  INDEX `modify_by`(`modify_by` ASC) USING BTREE,
  CONSTRAINT `tbl_product_ibfk_1` FOREIGN KEY (`modify_by`) REFERENCES `tbl_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbl_product_ibfk_2` FOREIGN KEY (`create_by`) REFERENCES `tbl_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbl_product_ibfk_3` FOREIGN KEY (`thumb`) REFERENCES `tbl_media` (`media_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_product
-- ----------------------------
INSERT INTO `tbl_product` VALUES (5, 1, 'RED VELVET CREAM CHEESE MOUSSE CAKE', 'red-velvet-cream-cheese-mousse-cake', 36, 257, '[]', '<p>Th&agrave;nh phần: Trứng, đường, bột mỳ, cream cheese, wipping cream, jalamtine. B&aacute;nh được l&agrave;m từ 3 lớp b&aacute;nh red velvet xe lẫn 3 lớp kem tươi pho mai. B&ecirc;n ngo&agrave;i phủ 1 lớp Jame đỏ vị Anh Đ&agrave;o v&agrave; trang tr&iacute; Socola</p>\r\n', 360000, 11, 'Th&agrave;nh phần: Trứng, đường, bột mỳ, cream cheese, wipping cream, jalamtine. B&aacute;nh được l&agrave;m từ 3 lớp b&aacute;nh red velvet xe lẫn 3 lớp kem tươi pho mai. B&ecirc;n ngo&agrave;i phủ 1 lớp Jame đỏ vị Anh Đ&agrave;o v&agrave; trang tr&iacute; Socola', 1513062277, 20, 1, 230000, 1, 1, 1719845690);
INSERT INTO `tbl_product` VALUES (18, 1, 'TIRAMISU CAKE MOUSSE', 'tiramisu-cake-mousse', 33, 326, NULL, '<p>- GATO&nbsp;<br />\r\n- CREAM CHEESE PHOMAI<br />\r\nB&Aacute;NH ĐƯỢC L&Agrave;M TỪ 3 LỚP GATO KẾT HỢP VỚI LỚP CREAM CHEESE , PHOMAI. PHỦ MẶT B&Aacute;NH 1 LỚP BỘT CACAO V&Agrave; TRANG TR&Iacute; HOA QUẢ.</p>\r\n', 360000, 10, '- GATO \r\n- CREAM CHEESE PHOMAI\r\nB&Aacute;NH ĐƯỢC L&Agrave;M TỪ 3 LỚP GATO KẾT HỢP VỚI LỚP CREAM CHEESE , PHOMAI. PHỦ MẶT B&Aacute;NH 1 LỚP BỘT CACAO V&Agrave; TRANG TR&Iacute; HOA QUẢ.', 1719416471, 22, 1, 240000, 1, 1, 1719845504);

-- ----------------------------
-- Table structure for tbl_slider
-- ----------------------------
DROP TABLE IF EXISTS `tbl_slider`;
CREATE TABLE `tbl_slider`  (
  `slider_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `thumb` int NOT NULL,
  `active` int NOT NULL DEFAULT 2,
  `create_at` int NOT NULL,
  `modify_at` int NOT NULL,
  `create_by` int NOT NULL,
  `modify_by` int NOT NULL,
  PRIMARY KEY (`slider_id`) USING BTREE,
  INDEX `thumb`(`thumb` ASC) USING BTREE,
  INDEX `create_by`(`create_by` ASC) USING BTREE,
  INDEX `modify_by`(`modify_by` ASC) USING BTREE,
  CONSTRAINT `tbl_slider_ibfk_1` FOREIGN KEY (`thumb`) REFERENCES `tbl_media` (`media_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_slider
-- ----------------------------
INSERT INTO `tbl_slider` VALUES (1, 'Slide 1', 316, 1, 1515586078, 1719732514, 1, 1);
INSERT INTO `tbl_slider` VALUES (2, 'Slide 3', 317, 1, 1515586220, 1719732110, 1, 1);
INSERT INTO `tbl_slider` VALUES (3, 'Slide 2', 328, 1, 1719671219, 1719732125, 1, 1);

-- ----------------------------
-- Table structure for tbl_support
-- ----------------------------
DROP TABLE IF EXISTS `tbl_support`;
CREATE TABLE `tbl_support`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `depict` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NULL DEFAULT NULL,
  `thumb` int NOT NULL,
  `link` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NULL DEFAULT NULL,
  `active` int NOT NULL DEFAULT 2,
  `page_connect` int NOT NULL,
  `create_at` int NOT NULL,
  `modify_at` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `thumb`(`thumb` ASC) USING BTREE,
  INDEX `page_connect`(`page_connect` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_support
-- ----------------------------
INSERT INTO `tbl_support` VALUES (5, 'Miễn phí vận chuyển', 'Tận tay khách hàng', 315, NULL, 1, 0, 1515574721, 1515574721);
INSERT INTO `tbl_support` VALUES (6, 'Thanh toán nhanh', 'Hỗ trợ nhiều hình thức', 318, NULL, 1, 0, 1515629048, 1515629048);
INSERT INTO `tbl_support` VALUES (7, 'Tiết kiệm hơn', 'Với nhiều ưu đãi cực lớn', 319, 'why-do-we-use-i.html', 1, 6, 1515629098, 1515629098);
INSERT INTO `tbl_support` VALUES (8, 'Tư vấn 24/7', '1900.9999', 320, 'why-do-we-use-i.html', 1, 6, 1515629152, 1515629152);
INSERT INTO `tbl_support` VALUES (9, 'Đặt hàng online', 'Thao tác đơn giản', 321, 'why-do-we-use-i.html', 1, 6, 1515629219, 1515629219);

-- ----------------------------
-- Table structure for tbl_sytem
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sytem`;
CREATE TABLE `tbl_sytem`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `describe` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `tel` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `per_page` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_sytem
-- ----------------------------
INSERT INTO `tbl_sytem` VALUES (1, 'Gardenista Bakery', 'Hương vị Pháp giữa lòng Hà Nội', '0123456789', '106 - Trần Bình - Cầu Giấy - Hà Nội', 'gardenista-bakery@gmail.com', 8);

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user`  (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `avatar` int NULL DEFAULT NULL,
  `level` int NOT NULL DEFAULT 3,
  `salt` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `active` int NOT NULL DEFAULT 1,
  `fullname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NULL,
  `tel` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NULL DEFAULT NULL,
  `facebook` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NULL DEFAULT NULL,
  `modify_at` int NULL DEFAULT NULL,
  `code_confirm` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL DEFAULT '{}',
  `create_at` int NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `email`(`email` ASC) USING BTREE,
  INDEX `avatar`(`avatar` ASC) USING BTREE,
  CONSTRAINT `tbl_user_ibfk_1` FOREIGN KEY (`avatar`) REFERENCES `tbl_media` (`media_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES (1, 'f46bdbaf704f698c99bcba1a813c20a0', 'quockhanh01091@gmail.com', 327, 1, 'abc123', 1, 'Quoc Khanh', '', '0123456789', '', 1719466165, '{\"reset_pass\":{\"code\":\"3189f2b9d6f2651c86f19bc1df6c27fe\",\"time\":1719411748}}', 1511658087);
INSERT INTO `tbl_user` VALUES (5, '87f5cc93cac27f2712a20000a8188936', 'quockhanhyd1004@gmail.com', NULL, 2, 'db936adf80fcfde49bb6c795505b11ad', 1, 'Phan Huy', NULL, NULL, NULL, 1513961210, '{\"reset_pass\":{\"code\":\"5b1c5286ad7ba8b3e79f21d496302482\",\"time\":1719411978}}', 1513956306);
INSERT INTO `tbl_user` VALUES (6, '2cdf43a22bd3bd61c92d0a5c088dbecc', 'phankhuong.t10@gmail.com', NULL, 3, '792a7362132bfca13a8d35ac5127bf6f', 2, 'Phan Khương', NULL, NULL, NULL, 1513961200, '{\"reset_pass\":{\"code\":\"16bc367ed731da444a3a705f3baf8e4c\",\"time\":1513962851}}', 1513961200);
INSERT INTO `tbl_user` VALUES (7, '140f20bc71bb87a2c7eaa0ba52668b22', 'test123123@gmail.com', NULL, 3, 'fa88c56ebef8f3d10592de6eeb90a8d8', 1, 'test', NULL, NULL, NULL, 1719414257, '{}', 1719414257);

SET FOREIGN_KEY_CHECKS = 1;
