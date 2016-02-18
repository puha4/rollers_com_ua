DROP TABLE IF EXISTS `ps_tmmegamenu_banner_lang`;
CREATE TABLE `ps_tmmegamenu_banner_lang` (
  `id_item` int(10) unsigned NOT NULL,
  `id_lang` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `url` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `public_title` varchar(100) DEFAULT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id_item`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/* Scheme for table ps_tmmegamenu_banner_lang */
INSERT INTO `ps_tmmegamenu_banner_lang` VALUES
('1','1','banner_1','index.php?id_category=19&controller=category','86b1c8bf8d1c85da2e73a58021242068176e5a75_14-Recovered_08.jpg',NULL,'<h3>New arrivals</h3>\r\n<p>It’s fast, light for mid-level enduro runs. Its 5.5-inch Maestro suspension can handle blocky trail descents in climbing mode.</p>\r\n<p><button>Shop now!</button></p>'),
('1','2','banner_1','index.php?id_category=19&controller=category','86b1c8bf8d1c85da2e73a58021242068176e5a75_14-Recovered_08.jpg',NULL,'<h3>New arrivals</h3>\r\n<p>It’s fast, light for mid-level enduro runs. Its 5.5-inch Maestro suspension can handle blocky trail descents in climbing mode.</p>\r\n<p><button>Shop now!</button></p>'),
('1','3','banner_1','index.php?id_category=19&controller=category','86b1c8bf8d1c85da2e73a58021242068176e5a75_14-Recovered_08.jpg',NULL,'<h3>New arrivals</h3>\r\n<p>It’s fast, light for mid-level enduro runs. Its 5.5-inch Maestro suspension can handle blocky trail descents in climbing mode.</p>\r\n<p><button>Shop now!</button></p>'),
('1','4','banner_1','index.php?id_category=19&controller=category','86b1c8bf8d1c85da2e73a58021242068176e5a75_14-Recovered_08.jpg',NULL,'<h3>New arrivals</h3>\r\n<p>It’s fast, light for mid-level enduro runs. Its 5.5-inch Maestro suspension can handle blocky trail descents in climbing mode.</p>\r\n<p><button>Shop now!</button></p>'),
('1','5','banner_1','index.php?id_category=19&controller=category','86b1c8bf8d1c85da2e73a58021242068176e5a75_14-Recovered_08.jpg',NULL,'<h3>New arrivals</h3>\r\n<p>It’s fast, light for mid-level enduro runs. Its 5.5-inch Maestro suspension can handle blocky trail descents in climbing mode.</p>\r\n<p><button>Shop now!</button></p>');
