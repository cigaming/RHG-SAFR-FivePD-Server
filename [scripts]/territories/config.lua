-- Crucial for scenes.
mLibs = exports["meta_libs"]

Config = {
  Lang              = 'en',           -- Currently only supports en.
  Debug             = true,           -- Remove after testing.
  ShowDebugText     = true,           -- Display drawtext for zone? Mostly used for debugging.

  InteractControl   = 38,             -- Control code to interact with most things.
  SlingDrugsControl = 47,             -- Hotkey to sling drugs.
  SlingByHotkey     = false,           -- If false must use /slingdrugs command
  InteractDist      = 2.0,            -- Distance to interact with things.
  InfluenceInHouse  = false,          -- Gain influence inside playerhousing?

  InfluenceTick     = 5000,           -- how long between influence gain/loss tick?

  DisplayZoneForAll  = false,         -- Display territory zone blips for all?
  DrugProcessBlip    = true,          -- Display drug process blip for gang members?

  MaxPlayerCount    = 64,             -- Change if using onesync I guess?
  UseProgBars       = true,          -- Using ProgBars? (should be included inside mod folder)
  StartEvent        = 'Thread',       -- If you don't want to start the mod by Citizen.CreateThread, change from "Thread" to your event name.
                                      -- NOTE: Must be client event/non-networked event.

  DrugSellDist      = 10.0,           -- Distance peds will buy drugs from
  DrugBuyChance     = 50,             -- % Chance for ped to buy drugs from a player.
  SalesReportChance = 1,              -- % Chance for ped to report player to police if they didn't buy the drugs.
  SellDrugsTimer    = 5000,           -- How long does the drug deal take? (MS)
  MinSellAmount     = 1,              -- Minimum amount of drugs to sell
  MaxSellAmount     = 20,             -- Max amount of drugs to sell

  DirtyReward       = true,           -- For drug deals. If false, receive clean money.
  DirtyAccount      = 'black_money',  -- For many things. Make sure you set this properly.

  SetJobEvent       = 'esx:setJob',   -- Probably don't change this if you're using ESX.
  SetJob2Event      = 'esx:setJob2',  -- If youre using job2...

  UsingItemLimit    = false,  -- if using esx item limits
  UsingWeightLimit  = true, -- if using esx item weight

  SqlSaveTimer      = 5, -- minutes for zone influence to save to database

  SmackCheaters     = true,

  PoliceJobs = {
    'police',                         -- The police job names.
    'sheriff',
  },

  GangJobs = {                        -- List all jobs that are able to contest for and control territories here.
    "grove",                          -- NOTE: Don't need to include police. Thats taken from PoliceJob var above.
    "crips",
    "vagos",
    "theblackwarriors",
  }
}

-- Drug sale prices, while slinging drugs inside a territory.
DrugPrices = {
  ['weed_packaged'] = 100,
  ['cocaine_packaged'] = 500,
  ['meth_packaged'] = 300,
}

-- The color for the blip when gang/job is controlling zone.
BlipColors = {
  police  = 0,
  grove   = 2,
  ballas  = 7,
  vagos   = 70,
  theblackwarriors  = 1,
}

-- Colors for drawtext.
TextColors = {
  police  = "white",              
  grove   = "green",
  ballas  = "blue",
  vagos   = "yellow",
  theblackwarriors  = "red",
}

-- Don't touch.
_U = Langs[Config.Lang]  

Territories = {
  ["East V"] = {
    control = "theblackwarriors",                                   -- The default control for this zone belongs to this job.
    influence = 100.0,                                    -- The default influence for this zone.
    zone = "EAST_V",                                      -- Probably don't change this unless you intend on moving the zones around.

    canSell = false,                                      -- Can sell drugs in this zone? If false, no drugs can be sold here.
                                                          -- Check other examples on how to sell drugs in a zone.

    areas = {                                             -- Areas are responsible for the large square blips on the map.
      [1] = { 
        location  = vector3(904.06,-164.28,73.97),
        width     = 350.0,
        height    = 200.0,
        heading   = 60,
        display   = 10
      },
      [2] = {
        location  = vector3(789.57,-328.67,73.97),
        width     = 300.0,
        height    = 200.0,
        heading   = 60,
        display   = 10        
      }
    },

    blipData = {                                          -- BlipData is responsible for the blip corresponding to the entry action of this zone.
      pos = vector3(1005.76,-114.52,73.50),
      sprite = 500,
      color = 1,
      text = _U["laundry_blip"],
      display = 3,
      shortRange = true,
      scale = 1.0,
    },

    -- MONEY LAUNDRY HOUSE
    actions = { 
      ["entry"] = {
        helpText = _U["enter_laundry"],
        location = vector3(1005.76,-114.52,73.50),
      },
      ["exit"] = {
        helpText = _U["leave_laundry"],
        location = vector3(1118.89,-3193.33,-40.00),
      },
      ["gather_money"] = {
        helpText    = _U["gather_money"],                 -- ESX.ShowHelpText in top left corner while standing near this zone.
        progText    = _U["gather_money_prog"],            -- Text inside the progress bar while performing this action.

        requireItem = false,                              -- Required item to perform this action (false if none).
        requireRate = false,                              -- Required amount of required item.
        requireCash = 50000,                              -- If not requireItem, requireCash instead. NOTE: Always dirty.

        rewardRate  = 10,                                 -- Reward item from perform action.
        rewardItem  = "sorted_money",                     -- Reward item amount.
        rewardCash  = false,                              -- If not rewardItem, rewardCash instead. NOTE: Always clean.

        location    = vector3(1119.55,-3197.79,-40.39),   -- The position to interact with this action.
        offset      = vector3(-0.8, 0.896, 0.6),          -- The offset for the scene/animations.
        rotation    = vector3(0.0, 0.0, 180.0),           -- Target rotation for the scene.
        time        = 20000,                              -- Action bar timer. Probably don't change these unless you find they're set incorrect.
        act         = "Money",                            -- Which set of scenes should we be performing?
        scene       = 1,                                  -- Which scene should we perform from above set?

        extraProps  = {                                   -- If extra props needed for scene that cannot be defined within the scene, set them here.
          [1] = {
            model = "bkr_prop_money_counter",             -- Model of prop.
            pos   = vector3(-0.25,0.22,0.4),              -- Offset from scene start location.
            rot   = vector3(0.0,0.0,180.0),               -- Object rotation.
          },
          [2] = {
            model = "bkr_prop_moneypack_03a",
            pos   = vector3(-0.7,-0.25,0.4),
            rot   = vector3( 0.0, 0.00,0.0),
          },
          [3] = {
            model = "bkr_prop_moneypack_03a",
            pos   = vector3(-0.7,-0.25,0.55),
            rot   = vector3( 0.0, 0.00,0.00),
          }
        }
      },
      ["package_money"] = {
        helpText    = _U["cutting_money"],
        progText    = _U["cutting_money_prog"],

        requireRate = 10,               
        requireItem = "sorted_money",   
        requireCash = false,            

        rewardRate  = 1,                
        rewardItem  = "cut_money",      
        rewardCash  = false,            

        location    = vector3(1122.27,-3197.82,-40.39),
        offset      = vector3(2.15, 0.67, 0.6),
        rotation    = vector3(0.0, 0.0, 180.0),
        time        = 45000,
        act         = "Money",
        scene       = 2,
      },
      ["clean_money"] = {
        helpText    = _U["cleaning_money"],
        progText    = _U["cleaning_money_prog"],

        requireRate = 1,                
        requireItem = "cut_money",      
        requireCash = false,            

        rewardRate  = false,            
        rewardItem  = false,            
        rewardCash  = 10000,            

        location    = vector3(1122.40,-3194.63,-40.39),
        offset      = vector3(0.15, 0.0, 0.0),
        rotation    = vector3(0.0, 0.0, 65.0),
        time        = 45000,
        act         = "Money",
        scene       = 3,
      }
    }
  },
  -- DAVIS
  ["Davis"] = {
    control   = "grove",
    influence = 100.0,
    zone      = "DAVIS",

    canSell   = {
      'weed_packaged',
    },

    areas = {
      [1] = {
        location  = vector3(53.95,-1818.36,27.66),
        width     = 390.0,
        height    = 210.0,
        heading   = 50,
        display   = 10
      },
      [2] = {
        location  = vector3(169.062, -1587.663, 77.28895),
        width     = 260.0,
        height    = 300.0,
        heading   = 50,
        display   = 10
      }, 
    },

    blipData = {
      pos = vector3(183.03, -1836.59, 28.10),
      sprite = 496,
      color = 2,
      text = _U["growhouse_blip"],
      display = 3,
      shortRange = true,
      scale = 1.0,
    },

    -- WEED GROW HOUSE
    actions = {
      ["entry"] = {
        helpText = _U["enter_growhouse"],
        location = vector3(183.03, -1836.59, 28.10),
      },
      ["exit"] = {
        helpText = _U["leave_growhouse"],
        location = vector3(1066.28, -3183.46, -39.16),
      },
      ["gather_plant"] = {
        helpText    = _U["gather_plant"],
        progText    = _U["gather_plant_prog"],

        requireRate = 0, 
        requireItem = false,
        rewardItem  = "weed_untrimmed",
        rewardRate  = 5,

        location    = vector3(1057.54,-3197.2,-39.13),
        offset      = vector3(-0.014, 0.896, 1.0),
        rotation    = vector3(0.0, 0.0, 90.0),
        time        = 15000,
        act         = "Weed",
        scene       = 1,
      },
      ["trim_plant"] = {
        helpText    = _U["trim_plant"],
        progText    = _U["trim_plant_prog"],

        requireRate = 5, 
        requireItem = "weed_untrimmed",
        rewardItem  = "weed_packaged",
        rewardRate  = 1,

        location    = vector3(1038.14,-3205.45,-38.16),
        offset      = vector3(-0.3, 0.4, 0.96),
        rotation    = vector3(0.0, 0.0, 90.0),
        time        = 30000,
        act         = "Weed",
        scene       = 2,
      },
    }
  },

  -- CHAMBERLAIN HILLS
  ["ChamberlainHills"] = {
    control   = "crips",
    influence = 100.0,
    zone      = "CHAMH",

    canSell   = {
      'meth_packaged',
    },

    areas = {
      [1] = {
        location  = vector3(-147.9323, -1600.784, 38.29156),
        width     = 200.0,
        height    = 280.0,
        heading   = 50,
        display   = 10
      },
    },

    blipData = {
      pos = vector3(-161.6598, -1638.28, 37.2459),
      sprite = 499,
      color = 3,
      text = _U["methlab_blip"],
      display = 3,
      shortRange = true,
      scale = 1.0,
    },

    -- METH LABORATORY
    actions = {
      ["entry"] = {
        helpText = _U["enter_methlab"],
        location = vector3(-161.6598, -1638.28, 37.2459),
      },
      ["exit"] = {
        helpText = _U["leave_methlab"],
        location = vector3(997.0199, -3200.684, -36.39373),
      },
      ["cook_meth"] = {
        helpText    = _U["cook_meth"],
        progText    = _U["cook_meth_prog"],

        requireRate = 0, 
        requireItem = false,
        rewardItem  = "meth_raw",
        rewardRate  = 5,

        location    = vector3(1005.80,-3200.40,-38.90),
        offset      = vector3(-4.88,-1.95,0.0),
        rotation    = vector3(0.0, 0.0, 0.0),
        time        = 73000,
        act         = "Meth",
        scene       = 1,
      },
      ["package_meth"] = {
        helpText    = _U["package_meth"],
        progText    = _U["package_meth_prog"],

        requireRate = 5, 
        requireItem = "meth_raw",
        rewardItem  = "meth_packaged",
        rewardRate  = 1,

        location    = vector3(1011.80,-3194.90,-38.99),
        offset      = vector3(4.48,1.7,1.0),
        rotation    = vector3(0.0, 0.0, 0.0),
        time        = 50000,
        act         = "Meth",
        scene       = 2,
      },
    }
  },

  -- RANCHO
  ["Rancho"] = {
    control   = "vagos",
    influence = 100.0,
    zone      = "RANCHO",

    canSell   = {
      'cocaine_packaged',
    },

    areas = {
      [1] = {
        location  = vector3(320.2412, -2039.633, 28.96141),
        width     = 290.0,
        height    = 220.0,
        heading   = 50,
        display   = 10
      },
      [2] = {
        location  = vector3(413.2437, -1782.743, 40.27221),
        width     = 370.0,
        height    = 300.0,
        heading   = 50,
        display   = 10
      },  
    },

    blipData = {
      pos = vector3(465.00, -1894.07, 27.90),
      sprite = 497,
      color = 0,
      text = _U["cokelab_blip"],
      display = 6,
      shortRange = true,
      scale = 1.0,
    },

    -- COCAINE FACTORY
    actions = {
      ["entry"] = {
        helpText = _U["enter_cokelab"],
        location = vector3(465.00, -1894.07, 25.90),
      },
      ["exit"] = {
        helpText = _U["leave_cokelab"],
        location = vector3(1088.74, -3187.61, -38.99),
      },
      ["gather_cocaine"] = {
        helpText    = _U["gather_cocaine"],
        progText    = _U["gather_cocaine_prog"],

        requireRate = 0, 
        requireItem = false,
        rewardItem  = "cocaine_uncut",
        rewardRate  = 10,

        location    = vector3(1093.18,-3194.925,-39.60),
        offset      = vector3(1.911,0.31,0.0),
        rotation    = vector3(0.0, 0.0, 0.0),
        time        = 25000,
        act         = "Cocaine",
        scene       = 1,
      }, 
      ["process_cocaine"] = {
        helpText    = _U["process_cocaine"],
        progText    = _U["process_cocaine_prog"],

        requireRate = 10, 
        requireItem = "cocaine_uncut",
        rewardItem  = "cocaine_cut",
        rewardRate  = 5,

        location    = vector3(1099.544,-3194.13,-39.60),
        offset      = vector3(0.31, -1.71,0.0),
        rotation    = vector3(0.0, 0.0, -90.0),
        time        = 25000,
        act         = "Cocaine",
        scene       = 1,
      }, 
      ["package_cocaine"] = {
        helpText    = _U["package_cocaine"],
        progText    = _U["package_cocaine_prog"],

        requireRate = 5, 
        requireItem = "cocaine_cut",
        rewardItem  = "cocaine_packaged",
        rewardRate  = 1,

        location    = vector3(1101.245,-3198.82,-39.60),
        offset      = vector3(7.663,-2.222,0.395),
        rotation    = vector3(0.0, 0.0, 0.0),
        time        = 59000,
        act         = "Cocaine",
        scene       = 2,
      }, 
    }
  },
} 

-- Animation dicts for scenes.
SceneDicts = {
  Cocaine = {
    [1] = 'anim@amb@business@coc@coc_unpack_cut_left@',
    [2] = 'anim@amb@business@coc@coc_packing_hi@',
  },
  Meth = {
    [1] = 'anim@amb@business@meth@meth_monitoring_cooking@cooking@',
    [2] = 'anim@amb@business@meth@meth_smash_weight_check@',
  },
  Weed = {
    [1] = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@',
    [2] = 'anim@amb@business@weed@weed_sorting_seated@',
  }, 
  Money = {
    [1] = 'anim@amb@business@cfm@cfm_counting_notes@',
    [2] = 'anim@amb@business@cfm@cfm_cut_sheets@',
    [3] = 'anim@amb@business@cfm@cfm_drying_notes@',
  }
}

-- Animation for player within scenes.
PlayerAnims = {
  Cocaine = {
    [1] = 'coke_cut_v5_coccutter',
    [2] = 'full_cycle_v3_pressoperator'
  },
  Meth = {
    [1] = 'chemical_pour_short_cooker',
    [2] = 'break_weigh_v3_char01',
  },
  Weed = {
    [1] = 'weed_spraybottle_crouch_spraying_02_inspector',
    [2] = "sorter_right_sort_v3_sorter02",
  }, 
  Money = {
    [1] = 'note_counting_v2_counter',
    [2] = 'extended_load_tune_cut_billcutter',
    [3] = 'loading_v3_worker',
  }
}

-- Animation for entities within scenes.
SceneAnims = {
  Cocaine = {
    [1] = {
      bakingsoda  = 'coke_cut_v5_bakingsoda',
      creditcard1 = 'coke_cut_v5_creditcard',
      creditcard2 = 'coke_cut_v5_creditcard^1',     
    },
    [2] = {
      scoop     = 'full_cycle_v3_scoop',
      box1      = 'full_cycle_v3_FoldedBox',
      dollmold  = 'full_cycle_v3_dollmould',
      dollcast1 = 'full_cycle_v3_dollcast',
      dollcast2 = 'full_cycle_v3_dollCast^1',
      dollcast3 = 'full_cycle_v3_dollCast^2',
      dollcast4 = 'full_cycle_v3_dollCast^3',
      press     = 'full_cycle_v3_cokePress',
      doll      = 'full_cycle_v3_cocdoll',
      bowl      = 'full_cycle_v3_cocbowl',
      boxed     = 'full_cycle_v3_boxedDoll',
    },
  },
  Meth = {
    [1] = {
      ammonia   = 'chemical_pour_short_ammonia',
      clipboard = 'chemical_pour_short_clipboard',
      pencil    = 'chemical_pour_short_pencil',
      sacid     = 'chemical_pour_short_sacid',
    },
    [2] = {
      box1      = 'break_weigh_v3_box01',
      box2      = 'break_weigh_v3_box01^1',
      clipboard = 'break_weigh_v3_clipboard',
      methbag1  = 'break_weigh_v3_methbag01',
      methbag2  = 'break_weigh_v3_methbag01^1',
      methbag3  = 'break_weigh_v3_methbag01^2',
      methbag4  = 'break_weigh_v3_methbag01^3',
      methbag5  = 'break_weigh_v3_methbag01^4',
      methbag6  = 'break_weigh_v3_methbag01^5',
      methbag7  = 'break_weigh_v3_methbag01^6',
      pen       = 'break_weigh_v3_pen',
      scale     = 'break_weigh_v3_scale',
      scoop     = 'break_weigh_v3_scoop',     
    },
  },
  Weed = {
    [1] = {},
    [2] = {
      weeddry1  = 'sorter_right_sort_v3_weeddry01a',
      weeddry2  = 'sorter_right_sort_v3_weeddry01a^1',
      weedleaf1 = 'sorter_right_sort_v3_weedleaf01a',
      weedleaf2 = 'sorter_right_sort_v3_weedleaf01a^1',
      weedbag   = 'sorter_right_sort_v3_weedbag01a',
      weedbud1a = 'sorter_right_sort_v3_weedbud02b',
      weedbud2a = 'sorter_right_sort_v3_weedbud02b^1',
      weedbud3a = 'sorter_right_sort_v3_weedbud02b^2',
      weedbud4a = 'sorter_right_sort_v3_weedbud02b^3',
      weedbud5a = 'sorter_right_sort_v3_weedbud02b^4',
      weedbud6a = 'sorter_right_sort_v3_weedbud02b^5',
      weedbud1b = 'sorter_right_sort_v3_weedbud02a',
      weedbud2b = 'sorter_right_sort_v3_weedbud02a^1',
      weedbud3b = 'sorter_right_sort_v3_weedbud02a^2',
      bagpile   = 'sorter_right_sort_v3_weedbagpile01a',
      weedbuck  = 'sorter_right_sort_v3_bucket01a',
      weedbuck  = 'sorter_right_sort_v3_bucket01a^1',
    },
  },
  Money = {
    [1] = {
      binmoney  = 'note_counting_v2_binmoney',
      moneybin  = 'note_counting_v2_moneybin',
      money1    = 'note_counting_v2_moneyunsorted',
      money2    = 'note_counting_v2_moneyunsorted^1',
      wrap1     = 'note_counting_v2_moneywrap',
      wrap2     = 'note_counting_v2_moneywrap^1',
    },
    [2] = {
      cutter    = 'extended_load_tune_cut_papercutter',
      singlep1  = 'extended_load_tune_cut_singlemoneypage',
      singlep2  = 'extended_load_tune_cut_singlemoneypage^1',
      singlep3  = 'extended_load_tune_cut_singlemoneypage^2',
      table     = 'extended_load_tune_cut_table',
      stack     = 'extended_load_tune_cut_moneystack',
      strip1    = 'extended_load_tune_cut_singlemoneystrip',
      strip2    = 'extended_load_tune_cut_singlemoneystrip^1',
      strip3    = 'extended_load_tune_cut_singlemoneystrip^2',
      strip4    = 'extended_load_tune_cut_singlemoneystrip^3',
      strip5    = 'extended_load_tune_cut_singlemoneystrip^4',
      sinstack  = 'extended_load_tune_cut_singlestack',
    },
    [3] = {
      bucket    = 'loading_v3_bucket',
      money1    = 'loading_v3_money01',
      money2    = 'loading_v3_money01^1',
    }
  },
}

-- Objects for entities within scenes.
SceneItems = {
  Cocaine = {
    [1] = {
      bakingsoda  = 'bkr_prop_coke_bakingsoda_o',
      creditcard1 = 'prop_cs_credit_card',
      creditcard2 = 'prop_cs_credit_card',
    },
    [2] = {
      scoop     = 'bkr_prop_coke_fullscoop_01a',
      doll      = 'bkr_prop_coke_doll',
      boxed     = 'bkr_prop_coke_boxedDoll',
      dollcast1 = 'bkr_prop_coke_dollCast',
      dollcast2 = 'bkr_prop_coke_dollCast',
      dollcast3 = 'bkr_prop_coke_dollCast',
      dollcast4 = 'bkr_prop_coke_dollCast',
      dollmold  = 'bkr_prop_coke_dollmould',
      bowl      = 'bkr_prop_coke_fullmetalbowl_02',
      press     = 'bkr_prop_coke_press_01b',      
      box1      = 'bkr_prop_coke_dollboxfolded',
    },
  },
  Meth = {
    [1] = {
      ammonia   = 'bkr_prop_meth_ammonia',
      clipboard = 'bkr_prop_fakeid_clipboard_01a',
      pencil    = 'bkr_prop_fakeid_penclipboard',
      sacid     = 'bkr_prop_meth_sacid',
    },
    [2] = {
      box1      = 'bkr_prop_meth_bigbag_04a',
      box2      = 'bkr_prop_meth_bigbag_03a',
      clipboard = 'bkr_prop_fakeid_clipboard_01a',
      methbag1  = 'bkr_prop_meth_openbag_02',
      methbag2  = 'bkr_prop_meth_openbag_02',
      methbag3  = 'bkr_prop_meth_openbag_02',
      methbag4  = 'bkr_prop_meth_openbag_02',
      methbag5  = 'bkr_prop_meth_openbag_02',
      methbag6  = 'bkr_prop_meth_openbag_02',
      methbag7  = 'bkr_prop_meth_openbag_02',
      pen       = 'bkr_prop_fakeid_penclipboard',
      scale     = 'bkr_prop_coke_scale_01',
      scoop     = 'bkr_prop_meth_scoop_01a',     
    },
  },
  Weed = {
    [1] = {},
    [2] = {
      weeddry1  = 'bkr_prop_weed_dry_01a',
      weeddry2  = 'bkr_prop_weed_dry_01a',
      weedleaf1 = 'bkr_prop_weed_leaf_01a',
      weedleaf2 = 'bkr_prop_weed_leaf_01a',
      weedbag   = 'bkr_prop_weed_bag_01a',
      weedbud1a = 'bkr_prop_weed_bud_02b',
      weedbud2a = 'bkr_prop_weed_bud_02b',
      weedbud3a = 'bkr_prop_weed_bud_02b',
      weedbud4a = 'bkr_prop_weed_bud_02b',
      weedbud5a = 'bkr_prop_weed_bud_02b',
      weedbud6a = 'bkr_prop_weed_bud_02b',
      weedbud1b = 'bkr_prop_weed_bud_02a',
      weedbud2b = 'bkr_prop_weed_bud_02a',
      weedbud3b = 'bkr_prop_weed_bud_02a',
      bagpile   = 'bkr_prop_weed_bag_pile_01a',
      weedbuck  = 'bkr_prop_weed_bucket_open_01a',
      weedbuck  = 'bkr_prop_weed_bucket_open_01a',
    },
  },
  Money = {
    [1] = {
      binmoney  = 'bkr_prop_coke_tin_01',
      moneybin  = 'bkr_prop_tin_cash_01a',
      money1    = 'bkr_prop_money_unsorted_01',
      money2    = 'bkr_prop_money_unsorted_01',
      wrap1     = 'bkr_prop_money_wrapped_01',
      wrap2     = 'bkr_prop_money_wrapped_01',
    },
    [2] = {
      cutter    = 'bkr_prop_fakeid_papercutter',
      singlep1  = 'bkr_prop_cutter_moneypage',
      singlep2  = 'bkr_prop_cutter_moneypage',
      singlep3  = 'bkr_prop_cutter_moneypage',
      table     = 'bkr_prop_fakeid_table',
      stack     = 'bkr_prop_cutter_moneystack_01a',
      strip1    = 'bkr_prop_cutter_moneystrip',
      strip2    = 'bkr_prop_cutter_moneystrip',
      strip3    = 'bkr_prop_cutter_moneystrip',
      strip4    = 'bkr_prop_cutter_moneystrip',
      strip5    = 'bkr_prop_cutter_moneystrip',
      sinstack  = 'bkr_prop_cutter_singlestack_01a',
    },
    [3] = {
      bucket    = 'bkr_prop_money_pokerbucket',
      money1    = 'bkr_prop_money_unsorted_01',
      money2    = 'bkr_prop_money_unsorted_01',
    }
  },
}

-- Ignore me. Don't touch.
GangLookup = {} for k,v in pairs(Config.GangJobs) do GangLookup[v] = true; end; for k,v in pairs(Config.PoliceJobs) do GangLookup[v] = true; end; 
PoliceLookup = {}; for k,v in pairs(Config.PoliceJobs) do PoliceLookup[v] = true; end; 

-- Get ESX. No support for other frameworks.
FrameworkStart = function()
  while not ESX do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end)
    Wait(0)
  end
end

-- Start 'er up.
Citizen.CreateThread(FrameworkStart)