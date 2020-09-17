USE `essentialmode`;

CREATE TABLE `weashops` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`zone` varchar(255) NOT NULL,
	`item` varchar(255) NOT NULL,
	`price` int(11) NOT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `licenses` (`type`, `label`) VALUES
	('weapon', "Permis de port d'arme")
;

INSERT INTO `weashops` (`zone`, `item`, `price`) VALUES
	('BlackWeashop','WEAPON_PISTOL',250),
	('GunShop', 'WEAPON_FLASHLIGHT', 60),
	('GunShop', 'WEAPON_MACHETE', 900),
	('GunShop', 'WEAPON_NIGHTSTICK', 450),
	('GunShop', 'WEAPON_BAT', 500),
	('BlackWeashop', 'WEAPON_MICROSMG', 45000),
	('BlackWeashop', 'WEAPON_PUMPSHOTGUN', 25000),
	('BlackWeashop', 'WEAPON_ASSAULTRIFLE', 85000),
	('BlackWeashop', 'WEAPON_SPECIALCARBINE', 95000),
	('BlackWeashop', 'WEAPON_SNIPERRIFLE', 100000),
	('BlackWeashop', 'WEAPON_FIREWORK', 3000),
	('GunShop', 'WEAPON_FIREEXTINGUISHER', 10),
	('GunShop', 'WEAPON_BALL', 5),
	('BlackWeashop', 'WEAPON_SMOKEGRENADE', 1500),
	('BlackWeashop', 'WEAPON_BZGAS', 1500),
	('BlackWeashop', 'WEAPON_MOLOTOV', 1500),
	('GunShop', 'WEAPON_DAGGER', 2500),
	('GunShop', 'WEAPON_SWITCHBLADE', 1500),
	('GunShop', 'WEAPON_WRENCH', 45),
	('GunShop','WEAPON_CROWBAR',80),
	('GunShop','WEAPON_CombatPistol',500),
	('BlackWeashop', 'WEAPON_AssaultRifle_Mk2', 75000),
	('BlackWeashop', 'WEAPON_SMG_Mk2', 35000),
	('GunShop','WEAPON_StunGun',50),
	('BlackWeashop', 'WEAPON_Pistol_Mk2', 500),
	('BlackWeashop', 'WEAPON_Revolver', 700),
	('GunShop','WEAPON_Hatchet',70)		
	
;
