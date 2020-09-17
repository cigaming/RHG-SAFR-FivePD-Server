Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.EnablePlayerManagement     = false
Config.EnableArmoryManagement     = false
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = true
Config.MaxInService               = -1
Config.Locale                     = 'en'

Config.MafiaStations = {

  Mafia = {

    --[[
    Blip = {
      Pos     = { x = 425.130, y = -979.558, z = 30.711 },
      Sprite  = 60,
      Display = 4,
      Scale   = 1.2,
      Colour  = 29,
    }, ]]
    AuthorizedWeapons = {
      { name = 'WEAPON_COMBATPISTOL',     price = 40000 },
      { name = 'WEAPON_ASSAULTSMG',       price = 120000 },
      { name = 'WEAPON_ASSAULTRIFLE',     price = 140000 },
      { name = 'WEAPON_PUMPSHOTGUN',      price = 18000 },
      { name = 'WEAPON_STUNGUN',          price = 250 },
      { name = 'WEAPON_FLASHLIGHT',       price = 50 },
      { name = 'WEAPON_FIREEXTINGUISHER', price = 50 },
      { name = 'WEAPON_FLAREGUN',         price = 3000 },
      { name = 'GADGET_PARACHUTE',        price = 2000 },
      { name = 'WEAPON_SNIPERRIFLE',      price = 150000 },
      { name = 'WEAPON_FLARE',            price = 8000 },
      { name = 'WEAPON_SWITCHBLADE',      price = 500 },
	  { name = 'WEAPON_POOLCUE',          price = 100 },
	  
    },
	  AuthorizedVehicles = {
		  { name = 'xls2',  label = 'woodys 1' },
		  { name = 'baller5',      label = 'woodys 2' },
	  },

    Cloakrooms = {
      { x = -0.57, y = -1041.78, z = 39.41 },
    },

    Armories = {
      { x = 2.2, y = -1042.49, z = 39.55 },
    },
    Vehicles = {
      {
        Spawner    = { x = 17.51, y = -1045.31, z = 37.07 },
        SpawnPoint = { x = 19.11, y = -1045.79, z = 36.63 },
        Heading    = 90.0,
      }
    },
	
	Helicopters = {
      {
        Spawner    = { x = 5.52, y = -1096.25, z = 38.43 },
        SpawnPoint = { x = 3.40, y = -1096.25, z = 38.43 },
        Heading    = 0.0,
      }
    },

    VehicleDeleters = {
      { x = 22.74, y = 545.9, z = 175.027 },
      { x = 21.35, y = 543.3, z = 175.027 },
    },

    BossActions = {
      { x = -0.62, y = -1039.18, z = 39.71 }
    },

  },

}
