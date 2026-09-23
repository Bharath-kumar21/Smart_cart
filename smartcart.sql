-- SmartCart Database Dump for Deployment
-- Compatible with MySQL 5.7+ / 8.0+
SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `admin` (`admin_id`, `name`, `email`, `password`, `profile_image`) VALUES (1, 'bharath', 'bharatkumartalagana@gmail.com', '$2b$12$A.9dCiEGAi2L2sc6bvosbubpMrmAFq14iSDvNbBx5ymMJRV7Qz70O', NULL);

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_name` varchar(200) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `quantity`, `price`) VALUES (1, 1, 4, 'sample product', 1, '1.00');
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `quantity`, `price`) VALUES (2, 2, 3, 'cmf phone 1', 1, '17000.00');
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `quantity`, `price`) VALUES (3, 3, 4, 'sample product', 1, '1.00');
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `quantity`, `price`) VALUES (4, 4, 3, 'cmf phone 1', 1, '17000.00');
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `quantity`, `price`) VALUES (5, 5, 4, 'sample product', 1, '1.00');
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `quantity`, `price`) VALUES (6, 5, 5, 'Apple Earphones', 1, '1599.89');
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `quantity`, `price`) VALUES (7, 6, 3, 'cmf phone 1', 1, '17000.00');
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `quantity`, `price`) VALUES (8, 7, 3, 'cmf phone 1', 1, '17000.00');
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `quantity`, `price`) VALUES (9, 7, 4, 'sample product', 1, '1.00');

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `shipping_name` varchar(150) DEFAULT NULL,
  `shipping_phone` varchar(20) DEFAULT NULL,
  `shipping_address` text,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `pincode` varchar(20) DEFAULT NULL,
  `razorpay_order_id` varchar(100) DEFAULT NULL,
  `razorpay_payment_id` varchar(100) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_status` varchar(30) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `orders` (`order_id`, `user_id`, `shipping_name`, `shipping_phone`, `shipping_address`, `city`, `state`, `pincode`, `razorpay_order_id`, `razorpay_payment_id`, `amount`, `payment_status`, `created_at`) VALUES (1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'order_TcyHWVezwbvAQF', 'pay_TcyHfUEaMxY6l9', '1.00', 'paid', '2026-09-17 09:55:49');
INSERT INTO `orders` (`order_id`, `user_id`, `shipping_name`, `shipping_phone`, `shipping_address`, `city`, `state`, `pincode`, `razorpay_order_id`, `razorpay_payment_id`, `amount`, `payment_status`, `created_at`) VALUES (2, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'order_TdMiExqm5xvYgZ', 'pay_TdMiPrOEx1snCn', '17000.00', 'paid', '2026-09-18 09:49:50');
INSERT INTO `orders` (`order_id`, `user_id`, `shipping_name`, `shipping_phone`, `shipping_address`, `city`, `state`, `pincode`, `razorpay_order_id`, `razorpay_payment_id`, `amount`, `payment_status`, `created_at`) VALUES (3, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'order_TdN2BafE4h27F1', 'pay_TdN2ImPxMRFsb0', '1.00', 'paid', '2026-09-18 10:08:42');
INSERT INTO `orders` (`order_id`, `user_id`, `shipping_name`, `shipping_phone`, `shipping_address`, `city`, `state`, `pincode`, `razorpay_order_id`, `razorpay_payment_id`, `amount`, `payment_status`, `created_at`) VALUES (4, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'order_TdNAm3OlZHymsK', 'pay_TdNAvH5AxlsV3I', '17000.00', 'paid', '2026-09-18 10:16:46');
INSERT INTO `orders` (`order_id`, `user_id`, `shipping_name`, `shipping_phone`, `shipping_address`, `city`, `state`, `pincode`, `razorpay_order_id`, `razorpay_payment_id`, `amount`, `payment_status`, `created_at`) VALUES (5, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'order_TdNuBcFARsB497', 'pay_TdNuPQ2mgT4Udg', '1600.89', 'paid', '2026-09-18 10:59:52');
INSERT INTO `orders` (`order_id`, `user_id`, `shipping_name`, `shipping_phone`, `shipping_address`, `city`, `state`, `pincode`, `razorpay_order_id`, `razorpay_payment_id`, `amount`, `payment_status`, `created_at`) VALUES (6, 1, 'Bharath kumar Talagana', '7013855313', '2-226
Near YSR Center ,Kalapaka village
parawada mandal,Anakapalli district,Andhra pradesh', 'Visakhapatnam', 'Andhra Pradesh', '531021', 'order_Te7zlKLtA2yqFA', 'pay_Te801FoSKavjHH', '17000.00', 'paid', '2026-09-20 08:05:04');
INSERT INTO `orders` (`order_id`, `user_id`, `shipping_name`, `shipping_phone`, `shipping_address`, `city`, `state`, `pincode`, `razorpay_order_id`, `razorpay_payment_id`, `amount`, `payment_status`, `created_at`) VALUES (7, 1, 'Bharath kumar Talagana', '7013855313', '2-226
Near YSR Center ,Kalapaka village
parawada mandal,Anakapalli district,Andhra pradesh', 'Visakhapatnam', 'Andhra Pradesh', '531021', 'order_TeZQDlg4r4twuY', 'pay_TeZQOr2e2VDf5D', '17001.00', 'paid', '2026-09-21 10:54:46');

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `description` text,
  `category` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `products` (`product_id`, `name`, `description`, `category`, `price`, `image`) VALUES (2, 'Nikon camera', 'nikon camera ', 'camera', '50000.00', 'images.jpg');
INSERT INTO `products` (`product_id`, `name`, `description`, `category`, `price`, `image`) VALUES (3, 'cmf phone 1', 'cmf phone one is a brand new ', 'Mobiles', '17000.00', 'cmf.jpg');
INSERT INTO `products` (`product_id`, `name`, `description`, `category`, `price`, `image`) VALUES (4, 'sample product', 'this is a sample product which is created to test weather the payment is working fine ...', 'sample', '1.00', 'Imagefromdribbble.comon2023-03-20at17.50.42.jpeg');
INSERT INTO `products` (`product_id`, `name`, `description`, `category`, `price`, `image`) VALUES (5, 'Apple Earphones', '
Unlike traditional, circular earbuds, the design of the EarPods is defined by the geometry of the ear. Which makes them more comfortable for more people than any other earbud-style headphones.

The speakers inside the EarPods have been engineered to maximise sound output, which means you get high-quality audio.

The EarPods (USB-C) also include a built-in remote that lets you adjust the volume, control the playback of music and video, and answer or end calls with a press of the remote.', 'Earphones', '1599.89', 'MTJY3.jpg');
INSERT INTO `products` (`product_id`, `name`, `description`, `category`, `price`, `image`) VALUES (6, 'redmi 15', 'REDMI 15 5G – mAhA Battery. Snapdragon Power.
Introducing the all-new REDMI 15 5G, designed to elevate your everyday smartphone experience with flagship-level performance and unbeatable battery life. Powered by the Snapdragon® 6s Gen 3 processor, it ensures smooth multitasking, gaming, and productivity on the go. The only smartphone in the segment to offer Snapdragon performance.
Sporting a stunning, Segment\'s Largest and Smoothest 17.53cm (6.9") FHD+ display with up to 144Hz AdaptiveSync refresh rate, the Redmi 15 5G delivers ultra-smooth visuals, perfect for scrolling, gaming, and content consumption. With TÜV Rheinland Low Blue Light, Flicker-Free, and Circadian Friendly certifications, your eyes stay comfortable even with long usage.
Stay unplugged longer with the massive Segment\'s Largest 7000mAh battery, enhanced by Si-C technology, and recharge quickly with 33W fast charging (charger in-box). It even supports 18W reverse charging to power up your other devices on the move.
Capture every detail with the 50MP AI Dual Camera and explore smart features like AI Erase, AI Sky, and classic film filters. With IP64 protection, side fingerprint sensor, Dolby-certified audio, and 200% super volume, the Redmi 15 5G blends utility, entertainment, and durability.
Available in Frosted White, Sandy Purple, and Midnight Black, and backed by HyperOS (Android 15) with 2 years OS + 4 years security updates. The REDMI 15 5G is the segment game changer punching way above it\'s weight. 
*As per internal data', 'Mobiles', '15000.00', '39d5f4df4f119a37368b696f658509b6.jpg');

DROP TABLE IF EXISTS `user_addresses`;
CREATE TABLE `user_addresses` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `full_name` varchar(150) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `street` text,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `pincode` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`address_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `user_addresses` (`address_id`, `user_id`, `full_name`, `phone`, `street`, `city`, `state`, `pincode`, `created_at`, `updated_at`) VALUES (1, 1, 'Bharath kumar Talagana', '7013855313', '2-226
Near YSR Center ,Kalapaka village
parawada mandal,Anakapalli district,Andhra pradesh', 'Visakhapatnam', 'Andhra Pradesh', '531021', '2026-09-20 08:04:34', '2026-09-20 08:04:34');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `users` (`user_id`, `name`, `email`, `password`) VALUES (1, 'Bharath kumar Talagana', 'bharatkumartalagana@gmail.com', '$2b$12$EhGr868f9CRlQgJx5DXHOeQrn4WlxvKF0hHdiw8x6uWVDhOC7NiPe');

SET FOREIGN_KEY_CHECKS=1;
