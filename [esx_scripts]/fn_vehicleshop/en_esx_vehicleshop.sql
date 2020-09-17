USE `essentialmode`;

INSERT INTO `jobs` (name, label) VALUES
	('bikedealer','Bikedealer')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('bikedealer',0,'recruit','Recruit',10,'{}','{}'),
	('bikedealer',1,'novice','Novice',25,'{}','{}'),
	('bikedealer',2,'experienced','Experienced',40,'{}','{}'),
	('bikedealer',3,'boss','Boss',0,'{}','{}')
;
