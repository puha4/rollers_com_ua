DROP TABLE IF EXISTS `ps_tmmegamenu`;
CREATE TABLE `ps_tmmegamenu` (
  `id_item` int(11) NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `specific_class` varchar(100) DEFAULT NULL,
  `is_mega` int(11) NOT NULL DEFAULT '0',
  `is_simple` int(11) NOT NULL DEFAULT '0',
  `is_custom_url` int(11) NOT NULL DEFAULT '0',
  `url` varchar(100) DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `unique_code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_item`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/* Scheme for table ps_tmmegamenu */
INSERT INTO `ps_tmmegamenu` VALUES
('1','1','0',NULL,'1','0','0','CAT21','1','it_20741704'),
('2','1','0',NULL,'0','1','0','CAT14','1','it_17139594'),
('3','1','0',NULL,'0','0','0','CAT15','1','it_34462040'),
('4','1','0',NULL,'0','0','0','CAT19','1','it_31082471'),
('5','1','0',NULL,'0','1','0','CAT16','1','it_98785463'),
('6','1','0',NULL,'0','0','0','CAT13','1','it_73160667');
