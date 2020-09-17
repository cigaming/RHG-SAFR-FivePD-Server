Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = false
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = true -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = true -- only turn this on if you are using esx_license

Config.EnableHandcuffTimer        = true -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 20 * 600000 -- 10 mins

Config.EnableJobBlip              = true -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale                     = 'en'

Config.PoliceStations = {

	LSPD = {

		Blip = {
			Pos     = { x = 425.130, y = -979.558, z = 30.711 },
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29,
		},
		-- https://wiki.rage.mp/index.php?title=Weapons
		AuthorizedWeapons = {
			{ name = 'WEAPON_NIGHTSTICK',       price = 200 },
			{ name = 'WEAPON_COMBATPISTOL',     price = 300 },
			{ name = 'WEAPON_VINTAGEPISTOL',    price = 1 },
			{ name = 'WEAPON_CARBINERIFLE',     price = 1500 },
			{ name = 'WEAPON_PUMPSHOTGUN',      price = 600 },
			{ name = 'WEAPON_STUNGUN',          price = 500 },
			{ name = 'WEAPON_FLASHLIGHT',       price = 80 },
			{ name = 'WEAPON_FIREEXTINGUISHER', price = 120 },
			{ name = 'WEAPON_FLAREGUN',         price = 60 },
			{ name = 'WEAPON_FLARE',         price = 60 },
		},

		Cloakrooms = {
		},

		Armories = {
			{ x = 459.64, y = -980.21, z = 29.689 },
			{ x = 1841.67, y = 3691.12, z = 34.27 }, -- Sandy Shores
			{ x = -426.93, y = 5998.08, z = 31.72 }, -- Paleto Bay
			{ x = -1106.93, y = -825.23, z = 14.28 }, -- Vespucci PD1
			{ x = -1104.25, y = -821.42, z = 14.28 }, -- Vespucci PD2
			{ x = 1778.85, y = 2543.71, z = 44.6 }, -- Jail
		},

		Vehicles = {
			{
				Spawner    = { x = 454.69, y = -1017.4, z = 27.430 }, -- Mission Row Police Station
				SpawnPoint = { x = 438.42, y = -1018.3, z = 27.757 },
				Heading    = 90.0,
			},
			{
				Spawner    = { x = 1869.98, y = 3699.41, z = 32.28 }, -- Sandy Shores
				SpawnPoint = { x = 1870.00, y = 3700.40, z = 32.30 },
				Heading    = 90.0,
			},
			{
				Spawner    = { x = -452.34, y = 6005.78, z = 30.42 }, -- Paleto Bay
				SpawnPoint = { x = -472.65, y = 6014.51, z = 31.10 },
				Heading    = 90.0,
			},
			{
				Spawner    = { x = 380.04, y = -1627.96, z = 27.46 }, -- Davis Police Station
				SpawnPoint = { x = 385.99, y = -1620.54, z = 27.82 },
				Heading    = 90.0,
			},
			{
				Spawner    = { x = -1070.55, y = -845.93, z = 4.88 }, -- Vespucci Police Station
				SpawnPoint = { x = -1078.69, y = -845.58, z = 4.88 },
				Heading    = 217.17,
			},
			{
				Spawner    = { x = 856.00, y = -1287.77, z = 25.12 }, --  La Messa
				SpawnPoint = { x = 854.72, y = -1276.72, z = 25.12 },
				Heading    = 90.0,
			},
			{
				Spawner    = { x = 2521.67, y = -458.00, z = 91.54 }, --State Police HQ Sustancia Rd 
				SpawnPoint = { x = 2523.92, y = -467.14, z = 91.54 },
				Heading    = 90.0,
			},
			{
				Spawner    = { x = 1788.76, y = 2598.99, z = 44.6 }, --Prison
				SpawnPoint = { x = 1811.24, y = 2599.55, z = 45.56 },
				Heading    = 331.62,
			},
		},

		Helicopters = {
			{
				Spawner    = { x = 466.477, y = -982.819, z = 42.691 },
				SpawnPoint = { x = 450.04, y = -981.14, z = 42.691 },
				Heading    = 0.0,
			},
			{
				Spawner    = { x = -1092.05, y = -839.71, z = 37.7 }, --Vespucci PD
				SpawnPoint = { x = -1096.73, y = -832.92, z = 37.7 },
				Heading    = 123.68,
			}
		},

		VehicleDeleters = {
			{ x = 462.74, y = -1014.4, z = 27.065 },
			{ x = 462.40, y = -1019.7, z = 27.104 },
			{ x = 1838.96, y = 3665.86, z = 32.31 },
			{ x = -450.61, y = 5997.69, z = 29.87 },
		},

		BossActions = {
			{ x = 448.417, y = -973.208, z = 29.689 }
		},
		
	},
}

-- https://wiki.rage.mp/index.php?title=Vehicles
Config.AuthorizedVehicles = {
	Shared = {
		{
			model = 'riot',
			label = 'Police Riot'
		},
		{
			model = 'policet',
			label = 'Police Transport'
		},
		{
			model = 'pbus',
			label = 'Police Prison Bus'
		}
	},

	recruit = {
		{
			model = 'police20',
			label = 'SA-DOCJT Cadet CVPI'
		}
	},

	officer = {
		{
			model = 'pol1',
			label = '2011 CVPI'
		},
		{
			model = 'pol2',
			label = '2014 Charger'
		},
		{
			model = 'pol3',
			label = '2018 Charger'
		},
		{
			model = 'pol4',
			label = '2013 FPI'
		},
		{
			model = 'pol5',
			label = '2016 FPIU'
		},
		{
			model = 'pol6',
			label = '2016 FPIU - K9'
		},
		{
			model = 'pol7',
			label = '2020 FPIU'
		},
		{
			model = 'pol8',
			label = '2018 Tahoe'
		},
		{
			model = 'pol9',
			label = '2018 F150 SRU'
		},
		{
			model = 'pol10',
			label = '2018 F150 SRU'
		},
		{
			model = 'policeb2',
			label = 'LSPD Bike'
		},
		{
			model = '1200RT',
			label = 'BMW Motorcycle'
		},
		{
			model = 'sspbp1',
			label = 'SS & PB 2016 FPIU'
		},
		{
			model = 'sspbp2',
			label = 'SS & PB 2014 Chrg'
		},
		{
			model = 'sspbp3',
			label = 'SS & PB 2011 CVPI'
		},
		{
			model = 'sspbp4',
			label = 'SS & PB 2013 FPI'
		},
		{
			model = 'sspbp5',
			label = 'SS & PB 2016 Charger'
		},
		{
			model = 'sspbp6',
			label = 'SS & PB 2016 Tahoe'
		},
	},

	officer2 = {
		{
			model = 'pol1',
			label = '2011 CVPI'
		},
		{
			model = 'pol2',
			label = '2014 Charger'
		},
		{
			model = 'pol3',
			label = '2018 Charger'
		},
		{
			model = 'pol4',
			label = '2013 FPI'
		},
		{
			model = 'pol5',
			label = '2016 FPIU'
		},
		{
			model = 'pol6',
			label = '2016 FPIU - K9'
		},
		{
			model = 'pol7',
			label = '2020 FPIU'
		},
		{
			model = 'pol8',
			label = '2018 Tahoe'
		},
		{
			model = 'pol9',
			label = '2018 F150 SRU'
		},
		{
			model = 'pol10',
			label = '2018 F150 SRU'
		},
		{
			model = 'policeb2',
			label = 'LSPD Bike'
		},
		{
			model = '1200RT',
			label = 'BMW Motorcycle'
		},
		{
			model = 'sspbp1',
			label = 'SS & PB 2016 FPIU'
		},
		{
			model = 'sspbp2',
			label = 'SS & PB 2014 Chrg'
		},
		{
			model = 'sspbp3',
			label = 'SS & PB 2011 CVPI'
		},
		{
			model = 'sspbp4',
			label = 'SS & PB 2013 FPI'
		},
		{
			model = 'sspbp5',
			label = 'SS & PB 2016 Charger'
		},
		{
			model = 'sspbp6',
			label = 'SS & PB 2016 Tahoe'
		},
	},


	deputy = {
		{
			model = 'so1',
			label = '2011 LSBCSO M CVPI'
		},
		{
			model = 'so3',
			label = '2010 LSBCSO M/T Caprice'
		},
	},

	deputy2 = {
		{
			model = 'so1',
			label = '2011 LSBCSO M CVPI'
		},
		{
			model = 'so2',
			label = '2013 LSBCSO M FPI'
		},
	},

	trooper = {
		{
			model = 'state6',
			label = 'M 14 Charger - Pull Car'
		},
		{
			model = 'state12',
			label = 'M 18 Durango - Patrol Unit'
		},
		{
			model = 'state7',
			label = 'M 18 Charger - Patrol Unit'
		},
		{
			model = 'state1',
			label = 'M 11 CVPI S.E.R.V.E Unit'
		},
		{
			model = 'state2',
			label = 'M 14 FPI S.E.R.V.E Unit'
		},
		{
			model = 'state3',
			label = 'M 16 FPIU S.E.R.V.E Unit'
		},
		{
			model = 'state4',
			label = 'M 18 RAM - F&W Unit'
		},
	},

	lspdcpl = {
		{
			model = 'pol1',
			label = '2011 CVPI'
		},
		{
			model = 'pol2',
			label = '2014 Charger'
		},
		{
			model = 'pol3',
			label = '2018 Charger'
		},
		{
			model = 'pol4',
			label = '2013 FPI'
		},
		{
			model = 'pol5',
			label = '2016 FPIU'
		},
		{
			model = 'pol6',
			label = '2016 FPIU - K9'
		},
		{
			model = 'pol7',
			label = '2020 FPIU'
		},
		{
			model = 'pol8',
			label = '2018 Tahoe'
		},
		{
			model = 'pol9',
			label = '2018 F150 SRU'
		},
		{
			model = 'pol10',
			label = '2018 F150 SRU'
		},
		{
			model = 'policeb2',
			label = 'LSPD Bike'
		},
		{
			model = '1200RT',
			label = 'BMW Motorcycle'
		},
		{
			model = 'sspbp1',
			label = 'SS & PB 2016 FPIU'
		},
		{
			model = 'sspbp2',
			label = 'SS & PB 2014 Chrg'
		},
		{
			model = 'sspbp3',
			label = 'SS & PB 2011 CVPI'
		},
		{
			model = 'sspbp4',
			label = 'SS & PB 2013 FPI'
		},
		{
			model = 'sspbp5',
			label = 'SS & PB 2016 Charger'
		},
		{
			model = 'sspbp6',
			label = 'SS & PB 2016 Tahoe'
		},
	},

	lsbcsocpl = {
		{
			model = 'so1',
			label = '2011 LSBCSO M CVPI'
		},
		{
			model = 'so4',
			label = '2018 LSBCSO M Charger'
		},
	},

	sastcpl = {
		{
			model = 'state1',
			label = 'M 11 CVPI S.E.R.V.E Unit'
		},
		{
			model = 'state2',
			label = 'M 14 FPI S.E.R.V.E Unit'
		},
		{
			model = 'state3',
			label = 'M 16 FPIU S.E.R.V.E Unit'
		},
		{
			model = 'state4',
			label = 'M 18 RAM - F&W Unit'
		},
		{
			model = 'state6',
			label = 'M 14 Charger - Pull Car'
		},
		{
			model = 'state12',
			label = 'M 18 Durango - Patrol Unit'
		},
		{
			model = 'state7',
			label = 'M 18 Charger - Patrol Unit'
		},
		{
			model = 'state9',
			label = 'M 18 FPIU - Patrol Unit'
		},
	},

	sergeant = {
		{
			model = 'pol1',
			label = '2011 CVPI'
		},
		{
			model = 'pol2',
			label = '2014 Charger'
		},
		{
			model = 'pol3',
			label = '2018 Charger'
		},
		{
			model = 'pol4',
			label = '2013 FPI'
		},
		{
			model = 'pol5',
			label = '2016 FPIU'
		},
		{
			model = 'pol6',
			label = '2016 FPIU - K9'
		},
		{
			model = 'pol7',
			label = '2020 FPIU'
		},
		{
			model = 'pol8',
			label = '2018 Tahoe'
		},
		{
			model = 'pol9',
			label = '2018 F150 SRU'
		},
		{
			model = 'pol10',
			label = '2018 F150 SRU'
		},
		{
			model = 'policeb2',
			label = 'LSPD Bike'
		},
		{
			model = '1200RT',
			label = 'BMW Motorcycle'
		},
		{
			model = 'mrap',
			label = 'Rapid Response Unit MRAP'
		},
		{
			model = 'sspbp1',
			label = 'SS & PB 2016 FPIU'
		},
		{
			model = 'sspbp2',
			label = 'SS & PB 2014 Chrg'
		},
		{
			model = 'sspbp3',
			label = 'SS & PB 2011 CVPI'
		},
		{
			model = 'sspbp4',
			label = 'SS & PB 2013 FPI'
		},
		{
			model = 'sspbp5',
			label = 'SS & PB 2016 Charger'
		},
		{
			model = 'sspbp6',
			label = 'SS & PB 2016 Tahoe'
		},
	},

	sergeantso = {
		{
			model = 'so1',
			label = '2011 LSBCSO CVPI'
		},
		{
			model = 'so2',
			label = '2013 LSBCSO FPI'
		},
		{
			model = 'so3',
			label = '2014 LSBCSO Charger'
		},
		{
			model = 'so4',
			label = '2018 LSBCSO Charger'
		},
		{
			model = 'so5',
			label = '2014 LSBCSO Tahoe'
		},
		{
			model = 'so6',
			label = '2018 LSBCSO Tahoe'
		},
		{
			model = 'so7',
			label = '2018 LSBCSO M FPIU'
		},
		{
			model = 'so8',
			label = '2020 LSBCSO M FPIU'
		},
	},

	sergeantst = {
		{
			model = 'state1',
			label = 'SGTs DRIVE SLICKTOP UNITS'
		},
		{
			model = 'state1',
			label = 'S 11 CVPI S.E.R.V.E Unit'
		},
		{
			model = 'state2',
			label = 'S 14 FPI S.E.R.V.E Unit'
		},
		{
			model = 'state3',
			label = 'S 18 FPIU S.E.R.V.E Unit'
		},
		{
			model = 'state4',
			label = 'S 18 RAM - F&W Unit'
		},
		{
			model = 'state12',
			label = 'S 18 Durango - Patrol Unit'
		},
		{
			model = 'state9',
			label = 'S 18 FPIU - Patrol Unit'
		},
		{
			model = 'state11',
			label = 'S 18 Challenger - Patrol Unit'
		},
	},


	intendent = {
		{
			model = 'scar',
			label = 'SAST CVPI'
		},
		{
			model = 'scar2',
			label = 'SAST M FPIU'
		},
		{
			model = 'scar4',
			label = 'SAST S/UM 15 FPIU'
		},
		{
			model = 'scar7',
			label = 'SAST M 14 Charger'
		},
		{
			model = 'scar8',
			label = 'SAST M/S/UM 14 Charger'
		},
		{
			model = 'scar9',
			label = 'SAST M/S/UM 16 Charger'
		},
		{
			model = 'scar10',
			label = 'SAST S/UM 16 Charger'
		},
		{
			model = 'scar12',
			label = 'SAST M/S 16 Charger'
		},
	},

	lieutenant = {
		{
			model = 'pol1',
			label = '2011 CVPI'
		},
		{
			model = 'pol2',
			label = '2014 Charger'
		},
		{
			model = 'pol3',
			label = '2018 Charger'
		},
		{
			model = 'pol4',
			label = '2013 FPI'
		},
		{
			model = 'pol5',
			label = '2016 FPIU'
		},
		{
			model = 'pol6',
			label = '2016 FPIU - K9'
		},
		{
			model = 'pol7',
			label = '2020 FPIU'
		},
		{
			model = 'pol8',
			label = '2018 Tahoe'
		},
		{
			model = 'pol9',
			label = '2018 F150 SRU'
		},
		{
			model = 'pol10',
			label = '2018 F150 SRU'
		},
		{
			model = 'policeb2',
			label = 'LSPD Bike'
		},
		{
			model = '1200RT',
			label = 'BMW Motorcycle'
		},
		{
			model = 'mrap',
			label = 'Rapid Response Unit MRAP'
		},
		{
			model = 'sspbp1',
			label = 'SS & PB 2016 FPIU'
		},
		{
			model = 'sspbp2',
			label = 'SS & PB 2014 Chrg'
		},
		{
			model = 'sspbp3',
			label = 'SS & PB 2011 CVPI'
		},
		{
			model = 'sspbp4',
			label = 'SS & PB 2013 FPI'
		},
		{
			model = 'sspbp5',
			label = 'SS & PB 2016 Charger'
		},
		{
			model = 'sspbp6',
			label = 'SS & PB 2016 Tahoe'
		},
	},

	lieutenantso = {
		{
			model = 'so1',
			label = '2011 LSBCSO CVPI'
		},
		{
			model = 'so2',
			label = '2013 LSBCSO FPI'
		},
		{
			model = 'so3',
			label = '2014 LSBCSO Charger'
		},
		{
			model = 'so4',
			label = '2018 LSBCSO Charger'
		},
		{
			model = 'so5',
			label = '2014 LSBCSO Tahoe'
		},
		{
			model = 'so6',
			label = '2018 LSBCSO Tahoe'
		},
		{
			model = 'so7',
			label = '2018 LSBCSO M FPIU'
		},
		{
			model = 'so8',
			label = '2020 LSBCSO M FPIU'
		},
	},

	lieutenantst = {
		{
			model = 'state1',
			label = 'M 11 CVPI S.E.R.V.E Unit'
		},
		{
			model = 'state2',
			label = 'M 14 FPI S.E.R.V.E Unit'
		},
		{
			model = 'state3',
			label = 'M 16 FPIU S.E.R.V.E Unit'
		},
		{
			model = 'state4',
			label = 'M 18 RAM - F&W Unit'
		},
		{
			model = 'state6',
			label = 'M 14 Charger - Pull Car'
		},
		{
			model = 'state9',
			label = 'M 18 Explorer - Patrol Unit'
		},
		{
			model = 'state12',
			label = 'M 18 Durango - Patrol Unit'
		},
		{
			model = 'state7',
			label = 'M 18 Charger - Patrol Unit'
		},
		{
			model = 'state10',
			label = 'M 18 Tahoe - Patrol Unit'
		},
	},

	captain = {
		{
			model = 'pol1',
			label = '2011 CVPI'
		},
		{
			model = 'pol2',
			label = '2014 Charger'
		},
		{
			model = 'pol3',
			label = '2018 Charger'
		},
		{
			model = 'pol4',
			label = '2013 FPI'
		},
		{
			model = 'pol5',
			label = '2016 FPIU'
		},
		{
			model = 'pol6',
			label = '2016 FPIU - K9'
		},
		{
			model = 'pol7',
			label = '2020 FPIU'
		},
		{
			model = 'pol8',
			label = '2018 Tahoe'
		},
		{
			model = 'pol9',
			label = '2018 F150 SRU'
		},
		{
			model = 'pol10',
			label = '2018 F150 SRU'
		},
		{
			model = 'policeb2',
			label = 'LSPD Bike'
		},
		{
			model = '1200RT',
			label = 'BMW Motorcycle'
		},
		{
			model = 'mrap',
			label = 'Rapid Response Unit MRAP'
		},
		{
			model = 'sspbp1',
			label = 'SS & PB 2016 FPIU'
		},
		{
			model = 'sspbp2',
			label = 'SS & PB 2014 Chrg'
		},
		{
			model = 'sspbp3',
			label = 'SS & PB 2011 CVPI'
		},
		{
			model = 'sspbp4',
			label = 'SS & PB 2013 FPI'
		},
		{
			model = 'sspbp5',
			label = 'SS & PB 2016 Charger'
		},
		{
			model = 'sspbp6',
			label = 'SS & PB 2016 Tahoe'
		},
	},

	captainso = {
		{
			model = 'so1',
			label = '2011 LSBCSO CVPI'
		},
		{
			model = 'so2',
			label = '2013 LSBCSO FPI'
		},
		{
			model = 'so3',
			label = '2014 LSBCSO Charger'
		},
		{
			model = 'so4',
			label = '2018 LSBCSO Charger'
		},
		{
			model = 'so5',
			label = '2014 LSBCSO Tahoe'
		},
		{
			model = 'so6',
			label = '2018 LSBCSO Tahoe'
		},
		{
			model = 'so7',
			label = '2018 LSBCSO M FPIU'
		},
		{
			model = 'so8',
			label = '2020 LSBCSO M FPIU'
		},

	},

	astchef = {
		{
			model = 'pol1',
			label = '2011 CVPI'
		},
		{
			model = 'pol2',
			label = '2014 Charger'
		},
		{
			model = 'pol3',
			label = '2018 Charger'
		},
		{
			model = 'pol4',
			label = '2013 FPI'
		},
		{
			model = 'pol5',
			label = '2016 FPIU'
		},
		{
			model = 'pol6',
			label = '2016 FPIU - K9'
		},
		{
			model = 'pol7',
			label = '2020 FPIU'
		},
		{
			model = 'pol8',
			label = '2018 Tahoe'
		},
		{
			model = 'pol9',
			label = '2018 F150 SRU'
		},
		{
			model = 'pol10',
			label = '2018 F150 SRU'
		},
		{
			model = 'policeb2',
			label = 'LSPD Bike'
		},
		{
			model = '1200RT',
			label = 'BMW Motorcycle'
		},
		{
			model = 'mrap',
			label = 'Rapid Response Unit MRAP'
		},
		{
			model = 'sspbp1',
			label = 'SS & PB 2016 FPIU'
		},
		{
			model = 'sspbp2',
			label = 'SS & PB 2014 Chrg'
		},
		{
			model = 'sspbp3',
			label = 'SS & PB 2011 CVPI'
		},
		{
			model = 'sspbp4',
			label = 'SS & PB 2013 FPI'
		},
		{
			model = 'sspbp5',
			label = 'SS & PB 2016 Charger'
		},
		{
			model = 'sspbp6',
			label = 'SS & PB 2016 Tahoe'
		},
	},

	depsher = {
		{
			model = 'sheriff14',
			label = '2011 M CVPI'
		},
		{
			model = 'sheriff3',
			label = '2010 S Impalla'
		},
		{
			model = 'sheriff4',
			label = '2014 S Caprice'
		},
		{
			model = 'sheriff5',
			label = '2010 M Caprice'
		},
		{
			model = 'sheriff6',
			label = '2010 S Chevy SS'
		},
		{
			model = 'sheriff7',
			label = '2016 M/S/UM Tahoe'
		},
		{
			model = 'sheriff8',
			label = '2010 LSBCSO M/Traffic Impalla'
		},
		{
			model = 'sheriff9',
			label = '2017 LSBCSO Chevy Silverado'
		},
		{
			model = 'sheriff10',
			label = '2018 LSBCSO Traffic Charger'
		},
		{
			model = 'sheriff11',
			label = '2015 LSBCSO Dodge Ram'
		},
		{
			model = 'sheriff12',
			label = '2013 LSBCSO M/S/UM Charger'
		},
		{
			model = 'sheriff13',
			label = '2018 LSBCSO M/S/UM Charger'
		},
	},

	chef = {
		{
			model = 'pol1',
			label = '2011 CVPI'
		},
		{
			model = 'pol2',
			label = '2014 Charger'
		},
		{
			model = 'pol3',
			label = '2018 Charger'
		},
		{
			model = 'pol4',
			label = '2013 FPI'
		},
		{
			model = 'pol5',
			label = '2016 FPIU'
		},
		{
			model = 'pol6',
			label = '2016 FPIU - K9'
		},
		{
			model = 'pol7',
			label = '2020 FPIU'
		},
		{
			model = 'pol8',
			label = '2018 Tahoe'
		},
		{
			model = 'pol9',
			label = '2018 F150 SRU'
		},
		{
			model = 'pol10',
			label = '2018 F150 SRU'
		},
		{
			model = 'policeb2',
			label = 'LSPD Bike'
		},
		{
			model = '1200RT',
			label = 'BMW Motorcycle'
		},
		{
			model = 'mrap',
			label = 'Rapid Response Unit MRAP'
		},
		{
			model = 'sspbp1',
			label = 'SS & PB 2016 FPIU'
		},
		{
			model = 'sspbp2',
			label = 'SS & PB 2014 Chrg'
		},
		{
			model = 'sspbp3',
			label = 'SS & PB 2011 CVPI'
		},
		{
			model = 'sspbp4',
			label = 'SS & PB 2013 FPI'
		},
		{
			model = 'sspbp5',
			label = 'SS & PB 2016 Charger'
		},
		{
			model = 'sspbp6',
			label = 'SS & PB 2016 Tahoe'
		},
	},

	sheriff = {
		{
			model = 'so1',
			label = '2011 LSBCSO CVPI'
		},
	},
	
	boss = {
		{
			model = 'pol1',
			label = '2011 CVPI'
		},
		{
			model = 'pol2',
			label = '2014 Charger'
		},
		{
			model = 'pol3',
			label = '2018 Charger'
		},
		{
			model = 'pol4',
			label = '2013 FPI'
		},
		{
			model = 'pol5',
			label = '2016 FPIU'
		},
		{
			model = 'pol6',
			label = '2016 FPIU - K9'
		},
		{
			model = 'pol7',
			label = '2020 FPIU'
		},
		{
			model = 'pol8',
			label = '2018 Tahoe'
		},
		{
			model = 'pol9',
			label = '2018 F150 SRU'
		},
		{
			model = 'pol10',
			label = '2018 F150 SRU'
		},
		{
			model = 'policeb2',
			label = 'LSPD Bike'
		},
		{
			model = '1200RT',
			label = 'BMW Motorcycle'
		},
		{
			model = 'mrap',
			label = 'Rapid Response Unit MRAP'
		},
		{
			model = 'sspbp1',
			label = 'SS & PB 2016 FPIU'
		},
		{
			model = 'sspbp2',
			label = 'SS & PB 2014 Chrg'
		},
		{
			model = 'sspbp3',
			label = 'SS & PB 2011 CVPI'
		},
		{
			model = 'sspbp4',
			label = 'SS & PB 2013 FPI'
		},
		{
			model = 'sspbp5',
			label = 'SS & PB 2016 Charger'
		},
		{
			model = 'sspbp6',
			label = 'SS & PB 2016 Tahoe'
		},
		{
			model = 'so1',
			label = '2011 LSBCSO CVPI'
		},
		{
			model = 'so2',
			label = '2013 LSBCSO FPI'
		},
		{
			model = 'so3',
			label = '2014 LSBCSO Charger'
		},
		{
			model = 'so4',
			label = '2018 LSBCSO Charger'
		},
		{
			model = 'so5',
			label = '2014 LSBCSO Tahoe'
		},
		{
			model = 'so6',
			label = '2018 LSBCSO Tahoe'
		},
		{
			model = 'so7',
			label = '2018 LSBCSO M FPIU'
		},
		{
			model = 'so8',
			label = '2018 LSBCSO M FPIU'
		},
		{
			model = 'so9',
			label = 'F250'
		},
		{
			model = 'state1',
			label = 'M 11 CVPI S.E.R.V.E Unit'
		},
		{
			model = 'state2',
			label = 'M 14 FPI S.E.R.V.E Unit'
		},
		{
			model = 'state3',
			label = 'M 16 FPIU S.E.R.V.E Unit'
		},
		{
			model = 'state4',
			label = 'M 18 RAM - F&W Unit'
		},
		{
			model = 'state6',
			label = 'M 14 Charger - Pull Car'
		},
		{
			model = 'state9',
			label = 'M 18 Explorer - Patrol Unit'
		},
		{
			model = 'state7',
			label = 'M 18 Charger - Patrol Unit'
		},
		{
			model = 'state8',
			label = 'M 18 Charger - Patrol Unit'
		},
		{
			model = 'state10',
			label = 'M 18 Tahoe - Patrol Unit'
		},
	},
}


-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	recruit_wear = {
		male = {
			['tshirt_1'] = 59,  ['tshirt_2'] = 1,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 46,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 1,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = 45,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	officer_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 1,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 1,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},

	deputy = {
		male = {
			['tshirt_1'] = 37,  ['tshirt_2'] = 0,
			['torso_1'] = 26,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 1,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 51,   ['shoes_2'] = 0,
			['helmet_1'] = 13,  ['helmet_2'] = 1,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 37,  ['tshirt_2'] = 0,
			['torso_1'] = 26,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 1,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 51,   ['shoes_2'] = 0,
			['helmet_1'] = 13,  ['helmet_2'] = 1,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
		}
	},

	trooper = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 1,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 1,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},

	sergeant_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 1,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 1,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	intendent_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 2,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	lieutenant_wear = { -- currently the same as intendent_wear
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 2,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	chef_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 3,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	boss_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 3,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	bullet_wear = {
		male = {
			['bproof_1'] = 11,  ['bproof_2'] = 1
		},
		female = {
			['bproof_1'] = 13,  ['bproof_2'] = 1
		}
	},
	gilet_wear = {
		male = {
			['tshirt_1'] = 59,  ['tshirt_2'] = 1
		},
		female = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 1
		}
	}

}