INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_monkey','Monkey Clan',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_monkey','Monkey Clan',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('society_monkey', 'Monkey Clan', 1)
;

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('monkey', 'Monkey Clan', 0);

--
-- Déchargement des données de la table `jobs_grades`
--

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('monkey', 0, 'monkey1', 'Monkey Wench', 500, '{}', '{}'),
('monkey', 1, 'monkey2', 'Monkey Wench', 800, '{}', '{}'),
('monkey', 2, 'monkey3', 'Monkey Wench', 1000, '{}', '{}'),
('monkey', 3, 'monkey4', 'Monkey Boss', 1200, '{}', '{}');

CREATE TABLE `fine_types_mafia` (
  
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  
  PRIMARY KEY (`id`)
);

INSERT INTO `fine_types_mafia` (label, amount, category) VALUES 
	('Raket',3000,0),
	('Raket',5000,0),
	('Raket',10000,1),
	('Raket',20000,1),
	('Raket',50000,2),
	('Raket',150000,3),
	('Raket',350000,3)
;