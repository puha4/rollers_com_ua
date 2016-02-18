DROP TABLE IF EXISTS `ps_tmmegamenu_lang`;
CREATE TABLE `ps_tmmegamenu_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_item` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `badge` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

/* Scheme for table ps_tmmegamenu_lang */
INSERT INTO `ps_tmmegamenu_lang` VALUES
('16','4','1','HELMETS',NULL),
('17','4','2','HELMETS',NULL),
('18','4','3','HELMETS',NULL),
('19','4','4','HELMETS',NULL),
('20','4','5','HELMETS',NULL),
('41','1','1','Bikes',NULL),
('42','1','2','Bikes',NULL),
('43','1','3','Bikes',NULL),
('44','1','4','Bikes',NULL),
('45','1','5','Bikes',NULL),
('46','2','1','BIKE TOOLS',NULL),
('47','2','2','BIKE TOOLS',NULL),
('48','2','3','BIKE TOOLS',NULL),
('49','2','4','BIKE TOOLS',NULL),
('50','2','5','BIKE TOOLS',NULL),
('56','3','1','CLOTHING','new'),
('57','3','2','CLOTHING','new'),
('58','3','3','CLOTHING','new'),
('59','3','4','CLOTHING','new'),
('60','3','5','CLOTHING','new'),
('66','6','1','ACCESSORIES',NULL),
('67','6','2','ACCESSORIES',NULL),
('68','6','3','ACCESSORIES',NULL),
('69','6','4','ACCESSORIES',NULL),
('70','6','5','ACCESSORIES',NULL),
('71','5','1','SHOES','sale'),
('72','5','2','SHOES','sale'),
('73','5','3','SHOES','sale'),
('74','5','4','SHOES','sale'),
('75','5','5','SHOES','sale');
