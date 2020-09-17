USE `essentialmode`;

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('cburger', 'Cheese Burger', 1, 0, 1),
	('dcburger', 'Double Cheese Burger', 1, 0, 1),
	('fries', 'Small Fries', 1, 0, 1),
	('fries2', 'Large Fries', 1, 0, 1),
	('sprite', 'Bottle of 7UP', 1, 0, 1),
	('cola', 'Can of Cola', 1, 0, 1)
;

INSERT INTO `shops` (name, item, price) VALUES
	('Mcdonalds','cburger', 2),
	('Mcdonalds','dcburger', 4),
	('Mcdonalds','fries', 2),
	('Mcdonalds','fries2', 3),
	('Mcdonalds','sprite', 4),
	('Mcdonalds','cola', 2)

;