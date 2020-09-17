DROP TABLE IF EXISTS `properties`;
DROP TABLE IF EXISTS `owned_properties`;

CREATE TABLE IF NOT EXISTS `playerhousing` (
  `id` int(32),
  `owner` varchar(50),
  `rented` tinyint(1),
  `price` int(32),
  `wardrobe` LONGTEXT,
  PRIMARY KEY (`id`)
);

ALTER TABLE `users`
  ADD `last_house` INT(11) DEFAULT 0,
  DROP COLUMN `last_property`
;

ALTER TABLE `owned_vehicles`
  ADD `lasthouse` INT(11) DEFAULT 0
;

