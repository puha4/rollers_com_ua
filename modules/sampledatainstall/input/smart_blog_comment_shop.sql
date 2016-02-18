DROP TABLE IF EXISTS `ps_smart_blog_comment_shop`;
CREATE TABLE `ps_smart_blog_comment_shop` (
  `id_smart_blog_comment_shop` int(11) NOT NULL AUTO_INCREMENT,
  `id_smart_blog_comment` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_smart_blog_comment_shop`,`id_smart_blog_comment`,`id_shop`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/* Scheme for table ps_smart_blog_comment_shop */
INSERT INTO `ps_smart_blog_comment_shop` VALUES
('2','2','1'),
('3','3','1'),
('4','4','1'),
('5','5','1'),
('6','6','1'),
('7','7','1'),
('8','8','1'),
('9','9','1'),
('10','10','1'),
('11','11','1'),
('12','12','1'),
('13','13','1'),
('14','14','1'),
('15','15','1'),
('16','16','1'),
('17','17','1'),
('18','18','1'),
('19','19','1');
