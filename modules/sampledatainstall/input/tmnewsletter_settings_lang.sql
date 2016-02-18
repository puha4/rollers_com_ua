DROP TABLE IF EXISTS `ps_tmnewsletter_settings_lang`;
CREATE TABLE `ps_tmnewsletter_settings_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tmnewsletter` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/* Scheme for table ps_tmnewsletter_settings_lang */
INSERT INTO `ps_tmnewsletter_settings_lang` VALUES
('21','5','1','Newsletter','&lt;p&gt;Subscribe to the Bikes mailing list to receive updates on new arrivals, special offers and other discount information.&lt;/p&gt;'),
('22','5','2','Newsletter','&lt;p&gt;Subscribe to the Bikes mailing list to receive updates on new arrivals, special offers and other discount information.&lt;/p&gt;'),
('23','5','3','Newsletter','&lt;p&gt;Subscribe to the Bikes mailing list to receive updates on new arrivals, special offers and other discount information.&lt;/p&gt;'),
('24','5','4','Newsletter','&lt;p&gt;Subscribe to the Bikes mailing list to receive updates on new arrivals, special offers and other discount information.&lt;/p&gt;'),
('25','5','5','Newsletter','&lt;p&gt;Subscribe to the Bikes mailing list to receive updates on new arrivals, special offers and other discount information.&lt;/p&gt;'),
('26','6','1','Newsletter','&lt;p&gt;Subscribe to the Bikes mailing list to receive updates on new arrivals, special offers and other discount information.&lt;/p&gt;'),
('27','6','2','Newsletter','&lt;p&gt;Subscribe to the Bikes mailing list to receive updates on new arrivals, special offers and other discount information.&lt;/p&gt;'),
('28','6','3','Newsletter','&lt;p&gt;Subscribe to the Bikes mailing list to receive updates on new arrivals, special offers and other discount information.&lt;/p&gt;'),
('29','6','4','Newsletter','&lt;p&gt;Subscribe to the Bikes mailing list to receive updates on new arrivals, special offers and other discount information.&lt;/p&gt;'),
('30','6','5','Newsletter','&lt;p&gt;Subscribe to the Bikes mailing list to receive updates on new arrivals, special offers and other discount information.&lt;/p&gt;');
