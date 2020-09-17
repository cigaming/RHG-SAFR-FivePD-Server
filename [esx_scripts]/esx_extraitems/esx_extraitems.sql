INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
	('oxygen_mask', 'Oxygen Mask', -1, 0, 1),
	('clip', 'Weapon Clip', -1, 0, 1)
;

INSERT INTO `shops` (name, item, price) VALUES
	
	('TwentyFourSeven','clip',530),
	('RobsLiquor','clip', 525),
	('LTDgasoline','clip', 530),
	
	('TwentyFourSeven','oxygen_mask',330),
	('RobsLiquor','oxygen_mask', 325),
	('LTDgasoline','oxygen_mask', 330)
;