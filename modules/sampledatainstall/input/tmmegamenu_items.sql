DROP TABLE IF EXISTS `ps_tmmegamenu_items`;
CREATE TABLE `ps_tmmegamenu_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tab` int(11) NOT NULL,
  `row` int(11) NOT NULL DEFAULT '1',
  `col` int(11) NOT NULL DEFAULT '1',
  `width` int(11) NOT NULL,
  `class` varchar(100) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `is_mega` int(11) NOT NULL DEFAULT '0',
  `settings` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

/* Scheme for table ps_tmmegamenu_items */
INSERT INTO `ps_tmmegamenu_items` VALUES
('1','2','1','1','0',NULL,'0','0','ALLMAN0,CAT26,CAT13,CAT15,CAT20'),
('32','1','1','1','3',NULL,'0','1','CAT22'),
('33','1','1','2','3',NULL,'0','1','CAT25'),
('34','1','1','3','6',NULL,'0','1','BNR1'),
('35','3','1','1','0',NULL,'0','0','CAT22,CAT23,CAT18,CAT20,CAT16,CAT14'),
('36','6','1','1','0',NULL,'0','0','CAT23,CAT22,CAT25,CAT18,CAT16'),
('37','5','1','1','0',NULL,'0','0','CAT23,CAT45,CAT46,CAT26,CAT56');
