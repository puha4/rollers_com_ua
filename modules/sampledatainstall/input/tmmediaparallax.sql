DROP TABLE IF EXISTS `ps_tmmediaparallax`;
CREATE TABLE `ps_tmmediaparallax` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) unsigned NOT NULL,
  `selector` varchar(64) DEFAULT NULL,
  `filename` varchar(64) DEFAULT NULL,
  `width` int(10) DEFAULT NULL,
  `height` int(10) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/* Scheme for table ps_tmmediaparallax */
INSERT INTO `ps_tmmediaparallax` VALUES
('1','1','#htmlcontent_footer','14_19.jpg','2048','1458','image');
