Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerColor                = { r = 102, g = 0, b = 102 }

local second = 1000
local minute = 60 * second

-- How much time before auto respawn at hospital
Config.RespawnDelayAfterRPDeath   = 10 * minute

-- How much time before a menu opens to ask the player if he wants to respawn at hospital now
-- The player is not obliged to select YES, but he will be auto respawn
-- at the end of RespawnDelayAfterRPDeath just above.
Config.RespawnToHospitalMenuTimer   = true
Config.MenuRespawnToHospitalDelay   = 5 * minute

Config.EnablePlayerManagement       = false
Config.EnableSocietyOwnedVehicles   = false

Config.RemoveWeaponsAfterRPDeath    = true
Config.RemoveCashAfterRPDeath       = true
Config.RemoveItemsAfterRPDeath      = true

-- Will display a timer that shows RespawnDelayAfterRPDeath time remaining
Config.ShowDeathTimer               = true

-- Will allow to respawn at any time, don't use RespawnToHospitalMenuTimer at the same time !
Config.EarlyRespawn                 = true
-- The player can have a fine (on bank account)
Config.RespawnFine                  = false
Config.RespawnFineAmount            = 500

Config.Locale                       = 'en'

Config.Blip = {
  Pos     = { x = 307.76, y = -1433.47, z = 28.97 },
  Sprite  = 61,
  Display = 4,
  Scale   = 1.2,
  Colour  = 2,
}

Config.HelicopterSpawner = {
  SpawnPoint  = { x = 313.33, y = -1465.2, z = 45.5 },
  Heading     = 0.0
}

Config.Zones = {

  HospitalInteriorEntering1 = { -- ok
    Pos  = { x = 294.6, y = -1448.01, z = 28.9 },
    Size = { x = 1.5, y = 1.5, z = 0.4 },
    Type = 1
  },

  HospitalInteriorInside1 = { -- ok
    Pos  = { x = 272.8, y = -1358.8, z = 23.5 },
    Size = { x = 1.5, y = 1.5, z = 1.0 },
    Type = -1
  },

  HospitalInteriorOutside1 = { -- ok
    Pos  = { x = 295.8, y = -1446.5, z = 28.9 },
    Size = { x = 1.5, y = 1.5, z = 1.0 },
    Type = -1
  },

  HospitalInteriorExit1 = { -- ok
    Pos  = { x = 275.7, y = -1361.5, z = 23.5 },
    Size = { x = 1.5, y = 1.5, z = 0.4 },
    Type = 1
  },

  HospitalInteriorEntering2 = { -- Ascenseur aller au toit
    Pos  = { x = 247.1, y = -1371.4, z = 23.5 },
    Size = { x = 1.5, y = 1.5, z = 0.4 },
    Type = 1
  },

  HospitalInteriorInside2 = { -- Toit sortie
    Pos  = { x = 333.1,  y = -1434.9, z = 45.5 },
    Size = { x = 1.5, y = 1.5, z = 1.0 },
    Type = -1
  },

  HospitalInteriorOutside2 = { -- Ascenseur retour depuis toit
    Pos  = { x = 249.1,  y = -1369.6, z = 23.5 },
    Size = { x = 1.5, y = 1.5, z = 1.0 },
    Type = -1
  },

  HospitalInteriorExit2 = { -- Toit entrée
    Pos  = { x = 335.5, y = -1432.0, z = 45.5 },
    Size = { x = 1.5, y = 1.5, z = 0.4 },
    Type = 1
  },

  AmbulanceActions = { -- CLOACKROOM
    Pos  = { x = 268.4, y = -1363.330, z = 23.5 },
    Size = { x = 1.5, y = 1.5, z = 0.4 },
    Type = 1
  },

  VehicleSpawner = {
    Pos  = { x = 307.76, y = -1433.47, z = 28.97 },
    Size = { x = 1.5, y = 1.5, z = 0.4 },
    Type = 1
  },

  VehicleSpawnPoint = {
    Pos  = { x = 304.87, y = -1437.69, z = 28.80 },
    Size = { x = 1.5, y = 1.5, z = 1.0 },
    Type = -1
  },

  VehicleDeleter = {
    Pos  = { x = 327.67, y = -1481.1, z = 28.83 },
    Size = { x = 3.0, y = 3.0, z = 0.4 },
    Type = 1
  },

  Pharmacy = {
    Pos  = { x = 230.13, y = -1366.18, z = 38.53 },
    Size = { x = 1.5, y = 1.5, z = 0.4 },
    Type = 1
  },

  ParkingDoorGoOutInside = {
    Pos  = { x = 234.56, y = -1373.77, z = 20.97 },
    Size = { x = 1.5, y = 1.5, z = 0.4 },
    Type = 1
  },

  ParkingDoorGoOutOutside = {
    Pos  = { x = 320.98, y = -1478.62, z = 28.81 },
    Size = { x = 1.5, y = 1.5, z = 1.5 },
    Type = -1
  },

  ParkingDoorGoInInside = {
    Pos  = { x = 238.64, y = -1368.48, z = 23.53 },
    Size = { x = 1.5, y = 1.5, z = 1.5 },
    Type = -1
  },

  ParkingDoorGoInOutside = {
    Pos  = { x = 317.97, y = -1476.13, z = 28.97 },
    Size = { x = 1.5, y = 1.5, z = 0.4 },
    Type = 1
  },

  StairsGoTopTop = {
    Pos  = { x = 251.91, y = -1363.3, z = 38.53 },
    Size = { x = 1.5, y = 1.5, z = 1.5 },
    Type = -1
  },

  StairsGoTopBottom = {
    Pos  = { x = 237.45, y = -1373.89, z = 26.30 },
    Size = { x = 3.5, y = 3.5, z = 0.4 },
    Type = -1
  },

  StairsGoBottomTop = {
    Pos  = { x = 256.58, y = -1357.7, z = 37.30 },
    Size = { x = 3.5, y = 3.5, z = 0.4 },
    Type = -1
  },

  StairsGoBottomBottom = {
    Pos  = { x = 240.94, y = -1369.91, z = 23.53 },
    Size = { x = 1.5, y = 1.5, z = 1.5 },
    Type = -1
  }

}
