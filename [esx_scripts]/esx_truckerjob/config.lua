Config              = {}
Config.DrawDistance = 100.0
Config.MaxDelivery	= 1
Config.TruckPrice	= 2000
Config.Locale       = 'en'

Config.Trucks = { -- all in the client and all use differant pick up places 
	"phantom3",
	"hauler",
	"phantom",
	"packer"
}

Config.Cloakroom = {
	CloakRoom = {
			Pos   = {x = 395.47, y = -656.92, z = 28.76},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1
		},
}

Config.Zones = {
	VehicleSpawner = {
			Pos   = {x = 408.98, y = -660.18, z = 28.43},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1
		},

	VehicleSpawnPoint = {
			Pos   = {x = 424.35, y = -653.53, z = 28.54},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Type  = -1
		},
}


Config.PickUps = { -- trailer pickup point
	TrailerSpawnPoint = {
		Pos   = {x = 1021.744, y = -3184.408, z = 4.6},
		Heading = 176.806,
		Size  = {x = 6.0, y = 6.0, z = 0.9},
		Color = {r = 0, g = 255, b = 0},
		Type  = 1
	},

	TrailerSpawnPoint2 = {
		Pos   = {x = 2589.091, y = 417.394, z = 108.0},
		Heading = 180.435,
		Size  = {x = 6.0, y = 6.0, z = 0.9},
		Color = {r = 0, g = 255, b = 0},
		Type  = 1
	},

	TrailerSpawnPoint3 = {
		Pos   = {x = 106.233, y = -1815.755, z = 26.0},
		Heading = 141.289,
		Size  = {x = 6.0, y = 6.0, z = 0.9},
		Color = {r = 0, g = 255, b = 0},
		Type  = 1
	},

	TrailerSpawnPoint4 = {
		Pos   = {x = -231.08, y = -271.554, z = 48.9},
		Heading = 71.103,
		Size  = {x = 6.0, y = 6.0, z = 0.9},
		Color = {r = 0, g = 255, b = 0},
		Type  = 1
	},
}

Config.Livraison = {
-------------------------------------------Los Santos
	-- Strawberry avenue et Davis avenue
	Delivery1LS = { -- keep these names or add more to line 652 in client.lua like others 
			Pos   = {x = 121.0655, y = -1488.4984, z = 28.0},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 6000
		},
	-- a cot� des flic
	Delivery2LS = {
			Pos   = {x = 451.4836, y = -899.0954, z = 27.5},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 6000
		},
	-- vers la plage
	Delivery3LS = {
			Pos   = {x = -1129.4438, y = -1607.2420, z = 3.9},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 6000
		},
	-- studio 1
	Delivery4LS = {
			Pos   = {x = -1064.7435, y = -553.4235, z = 32.5},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 6000
		},
	-- popular street et el rancho boulevard
	Delivery5LS = {
			Pos   = {x = 809.5350, y = -2024.2238, z = 28.0},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 6000
		},
	--Alta street et las lagunas boulevard
	Delivery6LS = {
			Pos   = {x = 63.2668, y = -227.9965, z = 50.0},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 6000
		},
	--Rockford Drive Noth et boulevard del perro
	Delivery7LS = {
			Pos   = {x = -1338.6923, y = -402.4188, z = 34.9},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 6000
		},
	--Rockford Drive Noth et boulevard del perro
	Delivery8LS = {
			Pos   = {x = 548.6097, y = -206.3496, z = 52.5},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 6000
		},
	--New empire way (airport)
	Delivery9LS = {
			Pos   = {x = -1141.9106, y = -2699.9340, z = 13.0},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 6000
		},
	--Rockford drive south
	Delivery10LS = {
			Pos   = {x = -640.0313, y = -1224.9519, z = 10.5},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 6000
		},
------------------------------------------- Blaine County
	-- panorama drive
	Delivery1BC = {
			Pos   = {x = 1999.5457, y = 3055.0686, z = 45.5},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 6000
		},
	-- route 68
	Delivery2BC = {
			Pos   = {x = 555.4768, y = 2733.9533, z = 41.0},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 6000
		},
	-- Algonquin boulevard et cholla springs avenue
	Delivery3BC = {
			Pos   = {x =1685.1549, y = 3752.0849, z = 33.0},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 6000
		},
	-- Joshua road
	Delivery4BC = {
			Pos   = {x = 182.7030, y = 2793.9829, z = 44.5},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 6000
		},
	-- East joshua road
	Delivery5BC = {
			Pos   = {x = 2710.6799, y = 4335.3168, z = 44.8},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 6000
		},
	-- Seaview road
	Delivery6BC = {
			Pos   = {x = 1930.6518, y = 4637.5878, z = 39.3},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 6000
		},
	-- Paleto boulevard
	Delivery7BC = {
			Pos   = {x = -448.2438, y = 5993.8686, z = 30.3},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 6000
		},
	-- Paleto boulevard et Procopio drive
	Delivery8BC = {
			Pos   = {x = 107.9181, y = 6605.9750, z = 30.8},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 6000
		},
	-- Marina drive et joshua road
	Delivery9BC = {
			Pos   = {x = 916.6915, y = 3568.7783, z = 32.7},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 6000
		},
	-- Pyrite Avenue
	Delivery10BC = {
			Pos   = {x = -128.6733, y = 6344.5493, z = 31.0},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 6000
		},
	
	RetourCamion = {
			Pos   = {x = 423.59, y =  -644.44, z = 29.17},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 0
		},
	
	AnnulerMission = {
			Pos   = {x = 429.63, y = -632.22, z = 28.22},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 0
		},
}
