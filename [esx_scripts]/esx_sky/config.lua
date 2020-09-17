Config              = {}
Config.DrawDistance = 100.0
Config.MaxDelivery	= 10
Config.TruckPrice	= 200
Config.Locale       = 'en'

Config.Trucks = {
	"speedo",
	--"packer"	
}

Config.Cloakroom = {
	CloakRoom = {
			Pos   = {x = 145.86, y = -1058.95, z = 30.19 },
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1
		},
}

Config.Zones = {
	VehicleSpawner = {
			Pos   = {x = 135.56, y = -1051.0, z = 28.98 },
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1
		},

	VehicleSpawnPoint = {
			Pos   = { x = 128.36, y = -1055.52, z = 29.02 },
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Type  = -1
		},
}

Config.Livraison = {
-------------------------------------------Los Santos
	-- Strawberry avenue et Davis avenue
	Delivery1LS = {
			Pos   = {x = 95.22, y = -219.12, z = 54.31},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 700
		},
	-- a coté des flic
	Delivery2LS = {
			Pos   = {x = 162.54, y = -111.32, z = 62.12},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 500
		},
	-- vers la plage
	Delivery3LS = {
			Pos   = {x = 324.71, y = 96.79, z = 71.1},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 650
		},
	-- studio 1
	Delivery4LS = {
			Pos   = {x = 188.69, y = 305.45, z = 105.23},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 400
		},
	-- popular street et el rancho boulevard
	Delivery5LS = {
			Pos   = {x = 16.48, y = 376.81, z = 112.18},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 750
		},
	--Alta street et las lagunas boulevard
	Delivery6LS = {
			Pos   = {x = -184.65, y = 419.62, z = 110.54},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 200
		},
	--Rockford Drive Noth et boulevard del perro
	Delivery7LS = {
			Pos   = {x = -307.58, y = 378.42, z = 110.16},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 650
		},
	--Rockford Drive Noth et boulevard del perro
	Delivery8LS = {
			Pos   = {x = -404.06, y = 338.11, z = 108.54},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 500
		},
	--New empire way (airport)
	Delivery9LS = {
			Pos   = {x = -515.53, y = 426.96, z = 97.14},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 400
		},
	--Rockford drive south
	Delivery10LS = {
			Pos   = {x = -686.22, y = 500.89, z = 109.87},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
------------------------------------------- Blaine County
	-- panorama drive
	Delivery1BC = {
			Pos   = {x = -876.11, y = 499.53, z = 90.83},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 400
		},
	-- route 68
	Delivery2BC = {
			Pos   = {x = 33.67, y = -1032.48, z = 29.31},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 300
		},
	-- Algonquin boulevard et cholla springs avenue
	Delivery3BC = {
			Pos   = {x = -1097.44, y = 546.08, z = 102.53},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
	-- Joshua road
	Delivery4BC = {
			Pos   = {x = -1178.62, y = 456.28, z = 86.49},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	-- East joshua road
	Delivery5BC = {
			Pos   = {x = -925.72, y = 9.95, z = 47.56},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 250
		},
	-- Seaview road
	Delivery6BC = {
			Pos   = {x = -733.02, y = -286.16, z = 36.77},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 300
		},
	-- Paleto boulevard
	Delivery7BC = {
			Pos   = {x = -1182.52, y = -368.49, z = 36.3},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 500
		},
	-- Paleto boulevard et Procopio drive
	Delivery8BC = {
			Pos   = {x = -760.91, y = -897.39, z = 20.12},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 600
		},
	-- Marina drive et joshua road
	Delivery9BC = {
			Pos   = {x = -686.73, y = -981.94, z = 20.21},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 750
		},
	-- Pyrite Avenue
	Delivery10BC = {
			Pos   = {x = -596.75, y = -892.95, z = 25.31},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 300
		},
	
	RetourCamion = {
			Pos   = {x = 132.23, y = -1069.91, z = 29.01 },
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 0
		},
	
	AnnulerMission = {
			Pos   = {x = 138.86, y = -1059.77, z = 29.01 },
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 0
		},
}