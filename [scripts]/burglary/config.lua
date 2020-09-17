Config = {}

Config.Items = {
    {Label = 'Cocaine', Name = 'coke'},
    {Label = 'Crack Cocaine', Name = 'crack', Amount = 3},
    {Label = 'Lottery Ticket', Name = 'lotteryticket'},
    {Label = 'Lockpick', Name = 'lockpick'},
    {Label = 'Bag of weed', Name = 'marijuana'},
    {Label = 'Designer Clothes', Name = 'clothe', Amount = 50},
    {Label = 'Bag of spice', Name = 'spice'},

} 

Config.GhettoPeds = { -- https://wiki.gt-mp.net/index.php/Peds
    588969535,
    -198252413,
    -1492432238,
    599294057
}

Config.GhettoWeapons = { -- vapen som npcer kan få
    "WEAPON_BAT" 
}

Config.WeaponChance = 25 -- % att npcen får ett vapen 

Config.Burglary = {
    [1] = {
        Door = {Object = "v_ilev_fa_frontdoor", Coords = vector3(-14.36, -1441.58, 30.22), Frozen = true, Heading = 180.0, Health = 1000},
        Type = 'ghetto',
        Cops = 0,
        Peds = {
            vector3(-3.33, -1476.56, 29.66),
            vector3(-5.42,  -1480.09, 29.52)
        },
        MultipleSearch = {
            {Items = 5, Position = vector3(-17.85, -1432.38, 30.22), Heading = 331.55, Text = 'Search box', Name = 'Dresser'},
            {Items = 2, Position = vector3(-14.87, -1440.19, 30.22), Heading = 93.55, Text = 'Search through', Name = 'Cabinet'},
            {Items = 5, Position = vector3(-12.29, -1434.98, 30.22), Heading = 87.47, Text = 'Search through', Name = 'Praise'},
            {Items = 2, Position = vector3(-9.36, -1434.79, 30.22), Heading = 215.48, Text = 'Search through', Name = 'Dresser'},
            {Items = 3, Position = vector3(-18.4, -1440.59, 30.22), Heading = 100.32, Text = 'Search', Name = 'Table'},
        },
    },

    [2] = {
        Door = {Object = 'v_ilev_trev_doorfront', Coords = vector3(-1150.14, -1521.71, 9.75), Frozen = true, Heading = 35.0, Health = 1000},
        Type = 'city',
        Cops = 0,
        MultipleSearch = {
            {Items = 3, Position = vector3(-1147.57, -1511.07, 9.75), Heading = 34.56, Text = 'Search', Name = 'Table'},
            {Items = 3, Position = vector3(-1149.87, -1512.61, 9.75), Heading = 37.75, Text = 'Search', Name = 'Table'},
            {Items = 4, Position = vector3(-1158.12, -1518.2, 9.75), Heading = 37.85, Text = 'Search through', Name = 'Praise'},
            {Items = 4, Position = vector3(-1155.52, -1523.76, 9.75), Heading = 216.29, Text = 'Search through', Name = 'Praise'},
        },
    },

    [3] = {
        Door = {Object = 'v_ilev_janitor_frontdoor', Coords = vector3(-106.62, -8.62, 70.52), Frozen = true, Heading = 72.24, Health = 780},
        Type = 'city',
        Cops = 0,
        MultipleSearch = {
            {Items = 5, Position = vector3(-109.03, -9.76, 70.525), Heading = 238.88, Text = 'Search', Name = 'Toolbox'},
            {Items = 4, Position = vector3(-112.22, -7.79, 70.52), Heading = 101.66, Text = 'Search', Name = 'Cupboard'},
            {Items = 6, Position = vector3(-109.18, -11.6, 70.52), Heading = 325.47, Text = 'Search through', Name = 'Box'}
        },
    },

    [4] = {
        Door = {Object = 'v_ilev_mm_doorm_l', Coords = vector3(-817.15, 178.24, 72.23), Frozen = true, Heading = 294.91, Health = 1000},
        Type = 'city',
        Cops = 0,
        MultipleSearch = {
            {Items = 5, Position = vector3(-807.72, 180.89, 72.15), Heading = 16.49, Text = 'Search through', Name = 'Drawers'},
            {Items = 4, Position = vector3(-801.83, 186.01, 72.61), Heading = 20.94, Text = 'Search through', Name = 'Drawers'},
            {Items = 4, Position = vector3(-799.79, 177.43, 72.83), Heading = 206.71, Text = 'Search', Name = 'Cupboards'},
            {Items = 4, Position = vector3(-801.83, 173.17, 76.75), Heading = 102.89, Text = 'Search', Name = 'Drawers'},
            {Items = 4, Position = vector3(-799.85, 170.33, 76.74), Heading = 165.88, Text = 'Search', Name = 'Praise'},
            {Items = 3, Position = vector3(-805.87, 167.91, 76.74), Heading = 180.8, Text = 'Search', Name = 'Desk'},
            {Items = 3, Position = vector3(-808.15, 167.0, 76.74), Heading = 253.13, Text = 'Search', Name = 'Desk Drawers'},
        },
    },
}

--[[
v_ilev_janitor_frontdoor
v_ilev_mm_doorm_l
'v_ilev_mm_doorm_r'
]]

-- sc1_29_clth_01

