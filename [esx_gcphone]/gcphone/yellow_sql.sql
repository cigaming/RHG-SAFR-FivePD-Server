CREATE TABLE `yellow_tweets` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`phone_number` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`firstname` VARCHAR(256) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`lastname` VARCHAR(256) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`message` VARCHAR(256) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`image` VARCHAR(256) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`time` TIMESTAMP NOT NULL DEFAULT current_timestamp(),
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
AUTO_INCREMENT=895
;
