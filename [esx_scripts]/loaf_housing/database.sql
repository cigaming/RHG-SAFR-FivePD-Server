ALTER TABLE users ADD COLUMN house LONGTEXT NOT NULL DEFAULT '{"owns":false,"furniture":[],"houseId":0}';
ALTER TABLE users ADD COLUMN bought_furniture LONGTEXT NOT NULL DEFAULT '{}';

CREATE TABLE IF NOT EXISTS `bought_houses` (
  `houseid` INT(50),
  PRIMARY KEY (`houseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  ('housing', 'Housing', 0)
;

INSERT INTO `datastore` (name, label, shared) VALUES
  ('housing', 'Housing', 0)
;