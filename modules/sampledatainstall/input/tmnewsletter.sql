DROP TABLE IF EXISTS `ps_tmnewsletter`;
CREATE TABLE `ps_tmnewsletter` (
  `id_tmnewsletter` int(11) NOT NULL AUTO_INCREMENT,
  `id_guest` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id_tmnewsletter`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/* Scheme for table ps_tmnewsletter */
INSERT INTO `ps_tmnewsletter` VALUES
('1','5','0','1','0'),
('2','6','0','1','0'),
('3','7','0','1','0'),
('4','8','0','1','0'),
('5','9','0','1','0'),
('6','13','0','1','0'),
('7','14','0','1','0'),
('8','15','0','1','0'),
('9','16','0','1','0'),
('10','18','0','1','0'),
('11','0','5','1','1'),
('12','19','0','1','0'),
('13','20','0','1','0'),
('14','21','0','1','0'),
('15','22','0','1','0'),
('16','23','0','1','0'),
('17','24','0','1','0'),
('18','26','0','1','0'),
('19','28','0','1','0'),
('20','30','0','1','0');
