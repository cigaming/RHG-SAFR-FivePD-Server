Config.Jobs.fisherman = {
  BlipInfos = {
    Sprite = 68,
    Color = 38
  },
  Vehicles = {
    Truck = {
      Spawner = 1,
      Hash = "benson",
      Trailer = "none",
      HasCaution = true
    },
    Boat = {
      Spawner = 2,
      Hash = "tug",
      Trailer = "none",
      HasCaution = false
    }
  },
  Zones = {
    CloakRoom = {
      Pos   = {x = -1603.9803466797, y = -1174.4775390625, z = 1.2737610340118},
      Size  = {x = 3.0, y = 3.0, z = 1.0},
      Color = {r = 204, g = 204, b = 0},
      Marker= 1,
      Blip  = true,
      Name  = _U('fm_fish_locker'),
      Type  = "cloakroom",
      Hint  = _U('cloak_change'),
      GPS = {x = -1603.9803466797, y = -1174.4775390625, z = 1.2737610340118}
    },

    FishingSpot = {
      Pos   = {x = -1917.7598876953, y = -1330.1520996094, z =0.17638377845287},
      Color = {r = 204, g = 204, b = 0},
      Size  = {x = 110.0, y = 110.0, z = 10.0},
      Marker= 1,
      Blip  = true,
      Name  = _U('fm_fish_area'),
      Type  = "work",
      Item  = {
        {
          name   = _U('fm_fish'),
          db_name= "fish",
          time   = 2000,
          max    = 100,
          add    = 1,
          remove = 1,
          requires = "nothing",
          requires_name = "Nothing",
          drop   = 100
        }
      },
      Hint  = _U('fm_fish_button'),
      GPS = {x = -1610.1475830078, y = -1176.9515380859, z =0.54881817102432}
    },

    BoatSpawner = {
      Pos   = {x = -1601.0209960938, y = -1179.5595703125, z = 1.3936004638672},
      Size  = {x = 3.0, y = 3.0, z = 1.0},
      Color = {r = 204, g = 204, b = 0},
      Marker= 1,
      Blip  = true,
      Name  = _U('fm_spawnboat_title'),
      Type  = "vehspawner",
      Spawner = 2,
      Hint  = _U('fm_spawnboat'),
      Caution = 0,
      GPS = {x = -1601.0209960938, y = -1179.5595703125, z = 1.3936004638672}
    },

    BoatSpawnPoint = {
      Pos   = {x = -1617.3044433594, y = -1192.0346679688, z = 0.86201250553131},
      Size  = {x = 3.0, y = 3.0, z = 1.0},
      Marker= -1,
      Blip  = false,
      Name  = _U('fm_boat_title'),
      Type  = "vehspawnpt",
      Spawner = 2,
      GPS = 0,
      Heading = 270.1
    },

    BoatDeletePoint = {
      Pos   = {x = -1633.9219970703, y = -1192.5036621094, z = -0.098638080060482},
      Size  = {x = 10.0, y = 10.0, z = 1.0},
      Color = {r = 255, g = 0, b = 0},
      Marker= 1,
      Blip  = false,
      Name  = _U('fm_boat_return_title'),
      Type  = "vehdelete",
      Hint  = _U('fm_boat_return_button'),
      Spawner = 2,
      Caution = 0,
      GPS = {x = -1633.9219970703, y = -1192.5036621094, z = -0.098638080060482},
      Teleport = {x = -1603.9803466797, y = -1174.4775390625, z = 1.2737610340118}
    },


    VehicleSpawner = {
          Pos   = {x = -1604.3591308594, y = -1183.8707275391, z = 0.94467669725418}, 
          Size  = {x = 3.0, y = 3.0, z = 1.0},
          Color = {r = 204, g = 204, b = 0},
      Marker= 1,
      Blip  = false,
      Name  = _U('spawn_veh'),
      Type  = "vehspawner",
      Spawner = 1,
      Hint  = _U('spawn_veh_button'),
      Caution = 2000,
      GPS = {x = -1604.3591308594, y = -1183.8707275391, z = 0.94467669725418}
    },

    VehicleSpawnPoint = {
          Pos   = {x = -1603.9803466797, y = -1174.4775390625, z = 1.2737610340118},
          Size  = {x = 3.0, y = 3.0, z = 1.0},
      Marker= -1,
      Blip  = false,
      Name  = _U('service_vh'),
      Type  = "vehspawnpt",
      Spawner = 1,
      GPS = 0,
      Heading = 70.1
    },

    VehicleDeletePoint = {
          Pos   = {x = 863.23254394531, y = -1718.2849121094, z = 28.631998062134},
          Size  = {x = 5.0, y = 5.0, z = 1.0},
          Color = {r = 255, g = 0, b = 0},
      Marker= 1,
      Blip  = false,
      Name  = _U('return_vh'),
      Type  = "vehdelete",
      Hint  = _U('return_vh_button'),
      Spawner = 1,
      Caution = 2000,
      GPS = 0,
      Teleport = 0
    },

    Delivery = {
      Pos   = {x = -1012.64758300781, y = -1354.62634277344, z = 5.54292726516724},
      Color = {r = 204, g = 204, b = 0},
      Size  = {x = 5.0, y = 5.0, z = 3.0},
      Color = {r = 204, g = 204, b = 0},
      Marker= 1,
      Blip  = true,
      Name  = _U('delivery_point'),
      Type  = "delivery",
      Spawner = 2,
      Item  = {
        {
          name   = _U('delivery'),
          time   = 500,
          remove = 1,
          max    = 100, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
          price  = 11,
          requires = "fish",
          requires_name = _U('fm_fish'),
          drop   = 100
        }
      },
      Hint  = _U('fm_deliver_fish'),
      GPS = {x = 3867.44, y = 4463.62, z = 1.72386}
    }
  }
}
