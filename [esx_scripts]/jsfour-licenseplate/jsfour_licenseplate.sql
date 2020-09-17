USE `essentialmode`;

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('licenseplate', 'License plate', 1, 0, 1)
;

INSERT INTO `shops` (name, item, price) VALUES
	('LTDgasoline','licenseplate', 2500)
;