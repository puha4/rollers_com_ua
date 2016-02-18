DROP TABLE IF EXISTS `ps_themeconfigurator`;
CREATE TABLE `ps_themeconfigurator` (
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
  `html` text,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_item`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/* Scheme for table ps_themeconfigurator */
INSERT INTO `ps_themeconfigurator` VALUES
('8','1','1','1',NULL,'0','footer','index.php?id_category=22&controller=category','0',NULL,'0','0','<h4>Best price, best selection</h4>\n<h3>MEETING</h3>\n<h2>THE NEEDS OF EACH CYCLIST</h2>\n<button>Shop now!</button>','1'),
('9','1','1','1',NULL,'0','home','index.php?id_category=23&controller=category','0',NULL,'0','0','<h4>Elektro-Mountainbike</h4>\n<h3>Cube</h3>\n<h2>STEREO HYBRID 140 HPA SL 27.5</h2>\n<button>Shop now!</button>','1'),
('10','1','2','1',NULL,'0','footer','index.php?id_category=22&controller=category','0',NULL,'0','0','<h4>Best price, best selection</h4>\n<h3>MEETING</h3>\n<h2>THE NEEDS OF EACH CYCLIST</h2>\n<button>Shop now!</button>','1'),
('11','1','3','1',NULL,'0','footer','index.php?id_category=23&controller=category','0',NULL,'0','0','<h4>Best price, best selection</h4>\n<h3>MEETING</h3>\n<h2>THE NEEDS OF EACH CYCLIST</h2>\n<button>Shop now!</button>','1'),
('12','1','4','1',NULL,'0','footer','index.php?id_category=22&controller=category','0',NULL,'0','0','<h4>Best price, best selection</h4>\n<h3>MEETING</h3>\n<h2>THE NEEDS OF EACH CYCLIST</h2>\n<button>Shop now!</button>','1'),
('13','1','5','1',NULL,'0','footer','index.php?id_category=23&controller=category','0',NULL,'0','0','<h4>Best price, best selection</h4>\n<h3>MEETING</h3>\n<h2>THE NEEDS OF EACH CYCLIST</h2>\n<button>Shop now!</button>','1'),
('14','1','2','1',NULL,'0','home','index.php?id_category=22&controller=category','0',NULL,'0','0','<h4>Elektro-Mountainbike</h4>\n<h3>Cube</h3>\n<h2>STEREO HYBRID 140 HPA SL 27.5</h2>\n<button>Shop now!</button>','1'),
('15','1','3','1',NULL,'0','home','index.php?id_category=23&controller=category','0',NULL,'0','0','<h4>Elektro-Mountainbike</h4>\n<h3>Cube</h3>\n<h2>STEREO HYBRID 140 HPA SL 27.5</h2>\n<button>Shop now!</button>','1'),
('16','1','4','1',NULL,'0','home','index.php?id_category=22&controller=category','0',NULL,'0','0','<h4>Elektro-Mountainbike</h4>\n<h3>Cube</h3>\n<h2>STEREO HYBRID 140 HPA SL 27.5</h2>\n<button>Shop now!</button>','1'),
('17','1','5','1',NULL,'0','home','index.php?id_category=23&controller=category','0',NULL,'0','0','<h4>Elektro-Mountainbike</h4>\n<h3>Cube</h3>\n<h2>STEREO HYBRID 140 HPA SL 27.5</h2>\n<button>Shop now!</button>','1');
