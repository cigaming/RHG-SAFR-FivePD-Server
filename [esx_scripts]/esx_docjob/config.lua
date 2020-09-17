Config              = {}
Config.DrawDistance = 100.0
Config.MaxDelivery	= 10
Config.TruckPrice	= 200
Config.Locale       = 'en'

Config.Trucks = {
	--"sprint3",
	--"packer"	
}

Config.Cloakroom = {
	CloakRoom = {
			Pos   = {x = 1176.449, y = 3055.16, z = 41.503},
			Size  = {x = 1.0, y = 1.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27
		},
}

Config.Zones = {
	VehicleSpawner = {
			Pos   = {x = 1169.665, y = 3052.531, z = 41.514},
			Size  = {x = 1.0, y = 1.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27
		},

	VehicleSpawnPoint = {
			Pos   = {x = -4.2025122642517, y = -671.13537597656, z = 31.940116882324},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Type  = -1
		},
}

Config.Livraison = {
-------------------------------------------Los Santos
	-- Strawberry avenue et Davis avenue
	Delivery1LS = {
			Pos   = {x = 1205.651, y = 3065.922, z = 41.536},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 1.0, y = 1.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 650
		},
	-- a cot� des flic
	Delivery2LS = {
			Pos   = {x = 1193.921, y = 3075.055, z = 41.605},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 1.0, y = 1.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 650
		},
	-- vers la plage
	Delivery3LS = {
			Pos   = {x = 1208.345, y = 3073.595, z = 42.493},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 1.0, y = 1.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 650
		},
	-- studio 1
	Delivery4LS = {
			Pos   = {x = 1216.583, y = 3069.341, z = 42.431},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 1.0, y = 1.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 650
		},
	-- popular street et el rancho boulevard
	Delivery5LS = {
			Pos   = {x = 1204.192, y = 3088.761, z = 42.604},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 1.0, y = 1.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 650
		},
	--Alta street et las lagunas boulevard
	Delivery6LS = {
			Pos   = {x = 1202.439, y = 3094.365, z = 42.378},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 1.0, y = 1.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 650
		},
	--Rockford Drive Noth et boulevard del perro
	Delivery7LS = {
			Pos   = {x = 1207.37, y = 3108.867, z = 42.327},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 1.0, y = 1.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 650
		},
	--Rockford Drive Noth et boulevard del perro
	Delivery8LS = {
			Pos   = {x = 1195.918, y = 3126.937, z = 42.251},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 1.0, y = 1.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 650
		},
	--New empire way (airport)
	Delivery9LS = {
			Pos   = {x = 1172.228, y = 3118.68, z = 42.264},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 1.0, y = 1.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 650
		},
	--Rockford drive south
	Delivery10LS = {
			Pos   = {x = 1132.962, y = 3112.125, z = 42.988},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 1.0, y = 1.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 650
		},
------------------------------------------- Blaine County
	-- panorama drive
	Delivery1BC = {
			Pos   = {x = 1148.136, y = 3104.154, z = 42.88},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 1.0, y = 1.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 650
		},
	-- route 68
	Delivery2BC = {
			Pos   = {x = 1137.642, y = 3092.075, z = 42.794},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 1.0, y = 1.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 650
		},
	-- Algonquin boulevard et cholla springs avenue
	Delivery3BC = {
			Pos   = {x = 1140.77, y = 3081.535, z = 42.69},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 1.0, y = 1.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 650
		},
	-- Joshua road
	Delivery4BC = {
			Pos   = {x = 1160.229, y = 3074.357, z = 42.579},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 1.0, y = 1.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 650
		},
	-- East joshua road
	Delivery5BC = {
			Pos   = {x = 1142.075, y = 3067.811, z = 42.561},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 1.0, y = 1.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 650
		},
	-- Seaview road
	Delivery6BC = {
			Pos   = {x = 1156.685, y = 3050.04, z = 42.364},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 1.0, y = 1.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 650
		},
	-- Paleto boulevard
	Delivery7BC = {
			Pos   = {x = 1154.463, y = 3036.614, z = 40.487},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 1.0, y = 1.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 650
		},
	-- Paleto boulevard et Procopio drive
	Delivery8BC = {
			Pos   = {x = 1176.155, y = 3032.711, z = 40.518},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 1.0, y = 1.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 650
		},
	-- Marina drive et joshua road
	Delivery9BC = {
			Pos   = {x = 1214.895, y = 3057.063, z = 40.534},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 1.0, y = 1.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 650
		},
	-- Pyrite Avenue
	Delivery10BC = {
			Pos   = {x = 1241.369, y = 3046.837, z = 40.574},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 1.0, y = 1.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 650
		},
	
	RetourCamion = {
			Pos   = {x = 1181.359, y = 3058.122, z = 42.403},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 1.0, y = 1.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 0
		},
	
	AnnulerMission = {
			Pos   = {x = 1182.046, y = 3054.996, z = 42.403},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 1.0, y = 1.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 0
		},
}
