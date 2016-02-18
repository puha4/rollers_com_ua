DROP TABLE IF EXISTS `ps_tmnewsletter_settings`;
CREATE TABLE `ps_tmnewsletter_settings` (
  `id_tmnewsletter` int(11) NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) NOT NULL,
  `is_guest` int(11) NOT NULL,
  `verification` int(11) NOT NULL,
  `timeout` float NOT NULL,
  `ft_delay` float NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id_tmnewsletter`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/* Scheme for table ps_tmnewsletter_settings */
INSERT INTO `ps_tmnewsletter_settings` VALUES
('5','1','1','0','10000','10000','1'),
('6','1','0','0','10000','10000','1');
