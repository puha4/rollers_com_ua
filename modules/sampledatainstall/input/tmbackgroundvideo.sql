DROP TABLE IF EXISTS `ps_tmbackgroundvideo`;
CREATE TABLE `ps_tmbackgroundvideo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) unsigned NOT NULL,
  `selector` varchar(64) DEFAULT NULL,
  `href` varchar(64) DEFAULT NULL,
  `imgname` varchar(64) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `loop` varchar(32) DEFAULT NULL,
  `pause_on_scroll` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/* Scheme for table ps_tmbackgroundvideo */
INSERT INTO `ps_tmbackgroundvideo` VALUES
('1','1','#htmlcontent_home','2xZajWpyxVo','00_home_12.png','youtube','1','0');
