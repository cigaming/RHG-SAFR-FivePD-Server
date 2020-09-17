CREATE TABLE `businesses` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `description` varchar(75) NOT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `earnings` int(11) NOT NULL,
  `position` text NOT NULL,
  `stock` int(11) NOT NULL DEFAULT '0',
  `stock_price` int(11) NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
);
INSERT INTO `businesses` (`id`, `name`, `address`, `description`, `owner`, `price`, `earnings`, `position`, `stock`, `stock_price`) VALUES (1, 'Gucci Store', 'Some random street 1337, Beverly Hills', 'Very fancy store', NULL, 1000000, 10000, '{\"buy\":{\"x\":2524.11, \"y\":-382.22, \"z\":93},\"actions\":{\"x\":2526.04,\"y\":-379.43,\"z\":92.99}}', 47, 100), (2, 'Gucci Store 2', 'Some random street 1338, Beverly Hills', 'Very fancy store', NULL, 1333337, 1337, '{\"buy\":{\"x\":0.0,\"y\":0.0,\"z\":0.0},\"actions\":{\"x\":0.0,\"y\":0.0,\"z\":0.0}}', 0, 100);