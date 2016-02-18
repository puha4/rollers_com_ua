DROP TABLE IF EXISTS `ps_tmhtmlcontent`;
CREATE TABLE `ps_tmhtmlcontent` (
  `id_item` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `item_order` int(10) unsigned NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `title_use` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hook` varchar(100) DEFAULT NULL,
  `url` text,
  `target` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `image` varchar(100) DEFAULT NULL,
  `image_w` varchar(10) DEFAULT NULL,
  `image_h` varchar(10) DEFAULT NULL,
  `specific_class` varchar(100) DEFAULT NULL,
  `html` text,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_item`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/* Scheme for table ps_tmhtmlcontent */
INSERT INTO `ps_tmhtmlcontent` VALUES
('1','1','1','1',NULL,'0','topColumn','index.php?id_category=21&controller=category','0','c22cfead24104b1de3be77657164c7cf74e9c9a9_banner-1.png','0','0','banner_1','<p>New collection of helmets!</p>\n<h3>Helmets</h3>\n<button>Shop now!</button>','1'),
('2','1','1','1',NULL,'0','topColumn','index.php?id_category=22&controller=category','0',NULL,'0','0','banner_2','<h2>Sale</h2>\r\n<h3>get up to 20% off</h3>','1'),
('3','1','1','2',NULL,'0','topColumn','index.php?id_category=23&controller=category','0','046356ceb3d08ef4c4b06d2193ff60128151a2b0_banner-2.png','0','0','banner_3','<p>A great selection of tools and accessories</p>\n<h3>BIKE TOOLS</h3>\n<button>Shop now!</button>','1'),
('4','1','1','3',NULL,'0','topColumn','index.php?id_category=24&controller=category','0','06e993b8385f382d64b7ebfd5a9cd28849cedfb8_banner-3.png','0','0','banner_4','<p>Find bike apparel to fit your lifestyle</p>\n<h3>CLOTHING</h3>\n<button>Shop now!</button>','1'),
('5','1','2','1',NULL,'0','topColumn','index.php?id_category=21&controller=category','0','c22cfead24104b1de3be77657164c7cf74e9c9a9_banner-1.png','0','0','banner_1','<p>New collection of helmets!</p>\n<h3>Helmets</h3>\n<button>Shop now!</button>','1'),
('6','1','2','1',NULL,'0','topColumn','index.php?id_category=22&controller=category','0',NULL,'0','0','banner_2','<h2>Sale</h2>\r\n<h3>get up to 20% off</h3>','1'),
('7','1','2','2',NULL,'0','topColumn','index.php?id_category=23&controller=category','0','046356ceb3d08ef4c4b06d2193ff60128151a2b0_banner-2.png','0','0','banner_3','<p>A great selection of tools and accessories</p>\n<h3>BIKE TOOLS</h3>\n<button>Shop now!</button>','1'),
('8','1','2','3',NULL,'0','topColumn','index.php?id_category=24&controller=category','0','06e993b8385f382d64b7ebfd5a9cd28849cedfb8_banner-3.png','0','0','banner_4','<p>Find bike apparel to fit your lifestyle</p>\n<h3>CLOTHING</h3>\n<button>Shop now!</button>','1'),
('9','1','3','1',NULL,'0','topColumn','index.php?id_category=21&controller=category','0','c22cfead24104b1de3be77657164c7cf74e9c9a9_banner-1.png','0','0','banner_1','<p>New collection of helmets!</p>\n<h3>Helmets</h3>\n<button>Shop now!</button>','1'),
('10','1','3','1',NULL,'0','topColumn','index.php?id_category=22&controller=category','0',NULL,'0','0','banner_2','<h2>Sale</h2>\r\n<h3>get up to 20% off</h3>','1'),
('11','1','3','2',NULL,'0','topColumn','index.php?id_category=23&controller=category','0','046356ceb3d08ef4c4b06d2193ff60128151a2b0_banner-2.png','0','0','banner_3','<p>A great selection of tools and accessories</p>\n<h3>BIKE TOOLS</h3>\n<button>Shop now!</button>','1'),
('12','1','3','3',NULL,'0','topColumn','index.php?id_category=24&controller=category','0','06e993b8385f382d64b7ebfd5a9cd28849cedfb8_banner-3.png','0','0','banner_4','<p>Find bike apparel to fit your lifestyle</p>\n<h3>CLOTHING</h3>\n<button>Shop now!</button>','1'),
('13','1','4','1',NULL,'0','topColumn','index.php?id_category=21&controller=category','0','c22cfead24104b1de3be77657164c7cf74e9c9a9_banner-1.png','0','0','banner_1','<p>New collection of helmets!</p>\n<h3>Helmets</h3>\n<button>Shop now!</button>','1'),
('14','1','4','1',NULL,'0','topColumn','index.php?id_category=22&controller=category','0',NULL,'0','0','banner_2','<h2>Sale</h2>\r\n<h3>get up to 20% off</h3>','1'),
('15','1','4','2',NULL,'0','topColumn','index.php?id_category=23&controller=category','0','046356ceb3d08ef4c4b06d2193ff60128151a2b0_banner-2.png','0','0','banner_3','<p>A great selection of tools and accessories</p>\n<h3>BIKE TOOLS</h3>\n<button>Shop now!</button>','1'),
('16','1','4','3',NULL,'0','topColumn','index.php?id_category=24&controller=category','0','06e993b8385f382d64b7ebfd5a9cd28849cedfb8_banner-3.png','0','0','banner_4','<p>Find bike apparel to fit your lifestyle</p>\n<h3>CLOTHING</h3>\n<button>Shop now!</button>','1'),
('17','1','5','1',NULL,'0','topColumn','index.php?id_category=21&controller=category','0','c22cfead24104b1de3be77657164c7cf74e9c9a9_banner-1.png','0','0','banner_1','<p>New collection of helmets!</p>\n<h3>Helmets</h3>\n<button>Shop now!</button>','1'),
('18','1','5','1',NULL,'0','topColumn','index.php?id_category=22&controller=category','0',NULL,'0','0','banner_2','<h2>Sale</h2>\r\n<h3>get up to 20% off</h3>','1'),
('19','1','5','2',NULL,'0','topColumn','index.php?id_category=23&controller=category','0','046356ceb3d08ef4c4b06d2193ff60128151a2b0_banner-2.png','0','0','banner_3','<p>A great selection of tools and accessories</p>\n<h3>BIKE TOOLS</h3>\n<button>Shop now!</button>','1'),
('20','1','5','3',NULL,'0','topColumn','index.php?id_category=24&controller=category','0','06e993b8385f382d64b7ebfd5a9cd28849cedfb8_banner-3.png','0','0','banner_4','<p>Find bike apparel to fit your lifestyle</p>\n<h3>CLOTHING</h3>\n<button>Shop now!</button>','1');
