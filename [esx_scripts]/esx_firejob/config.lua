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
Config.EnableLicenses             = true
Config.MaxInService               = -1
Config.Locale                     = 'en'

Config.FireStations = {

  LSFD = {
    Blip = {
      Pos = { x = 1202.7244873047, y = -1463.0455322266, z = 34.849590301514 },
      Sprite  = 436,
      Display = 4,
      Scale   = 1.2,
      Colour  = 1,
    },

    AuthorizedWeapons = {
      {name = 'WEAPON_FLASHLIGHT',       price = 80},
      {name = 'WEAPON_FIREEXTINGUISHER', price = 120},
	  {name = 'WEAPON_FLARE',            price = 60 },
      {name = 'WEAPON_FLAREGUN',         price = 60},
    },

    AuthorizedVehicles = {
	  { name = 'medic1', label = 'Ambulance' },
	  { name = 'rescue1', label = 'Rescue 27 Heavy Response' },
	  { name = 'rescue2', label = 'Rescue1 27 Fast Response' },
    { name = 'engine1', label = 'Engine 27 v1' },
    { name = 'engine2', label = 'Engine 27 v2' },
    { name = 'mctanker', label = 'Tanker 27 v1' },
    { name = 'mctanker2', label = 'Tanker 27 v2' },
    { name = 'mctanker3', label = 'Tanker 27 v3' },
	  { name = 'utl2', label = 'Rapid Response Truck 2' },	  
	  { name = 'command1', label = 'SA Fire Explorer' },	  
	  { name = 'command1', label = 'LS Fire Tahoe' },	  
    },

    Cloakrooms = {
      { x = 1192.637, y = -1474.431, z = 33.893 }
    },

    Armories = {
      { x = 1194.7569580078, y = -1478.9689941406, z = 33.859531402588 },
    },

    Vehicles = {
      {
        Spawner    = { x = 1196.3173828125, y = -1462.1235351563, z = 33.822658538818 },
        SpawnPoint = { x = 1200.7666015625, y = -1456.6851806641, z = 34.93176651001 },
        Heading    = 359.68
      },
      {
        Spawner    = { x = 1700.41, y = 3590.54, z = 34.25 },
        SpawnPoint = { x = 1706.08, y = 3595.23, z = 34.15},
        Heading    = 359.68
      },
    },

    Helicopters = {
      {
        Spawner    = {x = 466.477, y = -982.819, z = 42.691},
        SpawnPoint = {x = 450.04, y = -981.14, z = 42.691},
        Heading    = 0.0
      }
    },

    VehicleDeleters = {
      { x = 1221.260, y = -1518.321, z = 33.692 },
      { x = 1691.80, y = 3606.74, z = 34.12 },
    },

    BossActions = {
      { x = 1209.4600830078, y = -1480.7308349609, z = 33.859531402588 },
    }
  }
}