USE `essentialmode`;

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('notepad', 'Notepad', 1, 0, 1)
;

INSERT INTO `shops` (name, item, price) VALUES
	('Steves','notepad', 10)

;