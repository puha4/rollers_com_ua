DROP TABLE IF EXISTS `ps_smart_blog_comment`;
CREATE TABLE `ps_smart_blog_comment` (
  `id_smart_blog_comment` int(11) NOT NULL AUTO_INCREMENT,
  `id_parent` int(11) DEFAULT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `id_post` int(11) DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `email` varchar(90) DEFAULT NULL,
  `website` varchar(128) DEFAULT NULL,
  `content` text,
  `active` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id_smart_blog_comment`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/* Scheme for table ps_smart_blog_comment */
INSERT INTO `ps_smart_blog_comment` VALUES
('2','0','0','4','John Doe','admin@admin.com','#','Fusce id felis tempor, mollis ligula ac, iaculis massa. Aliquam nec mollis neque, eget laoreet nibh. Vivamus dictum tempor enim, a porttitor dui lacinia vitae.','0','2014-10-15 10:24:25'),
('3','2','0','4','Anna Lee','admin@admin.com','#','Cras in sem in arcu ultrices egestas sit amet nec metus.','0','2014-10-15 10:25:56'),
('4','2','0','4','Fred Crue','admin@admin.com','#','Suspendisse magna nisi, cursus ut condimentum eu, dapibus at dolor. Sed venenatis sapien quis urna consequat, quis tempor neque porttitor.','0','2014-10-15 10:26:57'),
('5','0','0','4','Anny Dawson','admin@admin.com','#','Vivamus iaculis eleifend varius. Vestibulum quis justo massa. Mauris et eros mollis, placerat mauris nec, mattis purus. Aliquam elementum lorem ac efficitur tristique. Duis vehicula non sapien eget rhoncus. Nulla et congue nunc, id eleifend neque.','0','2014-10-15 10:28:33'),
('6','4','0','4','Nick Nickelson','admin@admin.com','#','In hac habitasse platea dictumst. Nunc lacinia fringilla mi. Praesent quam nunc, pretium et aliquam ut, sollicitudin vel augue.','0','2014-10-15 10:29:22'),
('7','0','0','1','Joe Lee','Joe@test.com','#','Very inspiring! So much wisdom in simple words…','1','2015-11-02 03:21:29'),
('8','0','0','1','Kate Taylor','Kate@test.com','#','Love this poet! Absolutely brilliant quotes!','1','2015-11-02 03:21:51'),
('9','0','0','1','Kim Martin','Kim@test.com','#','He is phenomenal! Rumi is considered to be the most popular poet in America.','1','2015-11-02 03:23:23'),
('10','0','0','2','Zack Hernandez','Zack@test.com','#','\"The success of your business would solely depend on you. The only thing you can rely on is your power to achieve your goal\" – very true to life statement.','1','2015-11-02 03:24:59'),
('11','0','0','2','Greg Wilson','Greg@test.com','#','Unbelievable… Three simple guidelines to follow that can change your life. Worth trying out, sure they will work as everything genius is simple.','1','2015-11-02 03:25:59'),
('12','0','0','2','James Anderson','James@test.com','#','I am thinking of starting my own business and will ponder on the author’s notes. Concise and understandable, good job.','1','2015-11-02 03:26:20'),
('13','0','0','3','Taylor Miller','Taylor@test.com','#','Follow your dream and it will turn to reality. A very inspiring article. Thanks for sharing!','1','2015-11-02 03:27:24'),
('14','0','0','3','Max Harris','Max@test.com','#','Will try to repeat your mantras every day. Hopefully they will help in my current project.','1','2015-11-02 03:27:46'),
('15','0','0','3','Sidney Garcia','Sidney@test.com','#','I thought I am just a dreamer, but now I know how to become a doer. That’s cool, appreciate it!','1','2015-11-02 03:28:07'),
('16','0','0','4','Bernard Show','Bernard@test.com','#','That’s awesome! Future belongs to youngsters, so businessmen can’t ignore their needs in any case.','1','2015-11-02 03:29:24'),
('17','0','0','4','Sarah Cole','Sarah@test.com','#','The author did a great job with all these research work. Really valuable information, thank you!','1','2015-11-02 03:29:48'),
('18','0','0','4','Michael Ventura','Michael@test.com','#','Completely agree with the author. Modern businessmen should involve young people, introduce brands to them, socialize… Looks like a fresh product market!','1','2015-11-02 03:30:08'),
('19','0','0','3','mlir','alex@alec.com','#','test','0','2015-11-03 08:33:12');
