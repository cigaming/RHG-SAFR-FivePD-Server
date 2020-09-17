USE `essentialmode`;

INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
	('donut', 'Glazed Donut', 25, 0, 1),
	('donut2', 'Super Donut', 25, 0, 1),
	('taco4', 'Super Taco', 25, 0, 1),
	('monster', 'Monster Energy', 25, 0, 1)
;

INSERT INTO `shops` (name, item, price) VALUES
	('Steves','donut', 3.50),
	('Steves','donut2', 8.50),
	('Steves','taco4', 10),
	('Steves','monster', 2.30)

;