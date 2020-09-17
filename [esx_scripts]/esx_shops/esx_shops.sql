USE `essentialmode`;

CREATE TABLE `shops` (
  
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  
  PRIMARY KEY (`id`)
);

INSERT INTO `shops` (name, item, price) VALUES
	('TwentyFourSeven','bread',1.50),
	('TwentyFourSeven','water',1.50),
	('TwentyFourSeven','lotteryticket',3.00),
	('TwentyFourSeven','coffee',7.00),
	('TwentyFourSeven','vodka', 5.99),
	('TwentyFourSeven','beer', 3.50),
	('RobsLiquor','bread',1.50),
	('RobsLiquor','water',1.50),
	('RobsLiquor','lotteryticket',3.00),
	('RobsLiquor','coffee',7.00),
	('RobsLiquor','vodka', 5.99),
	('RobsLiquor','beer', 3.50),
	('LTDgasoline','bread',1.50),
	('LTDgasoline','water',1.50),
	('LTDgasoline','lotteryticket',3.00),
	('LTDgasoline','coffee', 7.00),
	('LTDgasoline','vodka', 5.99),
	('LTDgasoline','beer', 3.50);