local ESX = nil
local inmate = 0
local mycell = 1
local imjailed = false
local lockdown = false
local playerCoords = GetEntityCoords(PlayerPedId())


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

    ESX.PlayerData = ESX.GetPlayerData()
    
    TriggerServerEvent("jail:firstSpawn")
end)

Citizen.CreateThread(function()
    while true do
        local waitCheck = #(playerCoords - vector3(Config.Locations["reclaim_items"]["x"], Config.Locations["reclaim_items"]["y"], Config.Locations["reclaim_items"]["z"]))
        if waitCheck < 15 then
            DrawText3D(Config.Locations["reclaim_items"]["x"], Config.Locations["reclaim_items"]["y"], Config.Locations["reclaim_items"]["z"]+1, 'Press [E] to re-claim your possessions.')
            DrawMarker(27,vector3(Config.Locations["reclaim_items"]["x"], Config.Locations["reclaim_items"]["y"], Config.Locations["reclaim_items"]["z"]), 0, 0, 0, 0, 0, 0, 1.001, 1.0001, 0.5001, 255, 255, 255, 55, 0, 0, 0, 0)
        end
        if waitCheck < 1.5 then
            if IsControlJustPressed(0,46) then
                TriggerServerEvent("jail:reclaimPossessions")
                TriggerEvent("notification", "You have re-claimed your possessions.")
                Wait(15000)
            end
        end
        waitCheck = (waitCheck < 15 and 1 or waitCheck)
        Wait(math.ceil(waitCheck))
    end
end)

Citizen.CreateThread(function()
    while true do
        playerCoords = GetEntityCoords(PlayerPedId())
        Citizen.Wait(1000)
    end
end)


function drink()
    ClearPedSecondaryTask(PlayerPedId())
    loadAnimDict( "mp_player_intdrink" ) 

    TaskPlayAnim( PlayerPedId(), "mp_player_intdrink", "loop_bottle", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
    Citizen.Wait(5000)

    endanimation()
end

function endanimation()
    ClearPedSecondaryTask(PlayerPedId())
end

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end



function DisplayHelpText(str)
    SetTextComponentFormat("STRING")
    AddTextComponentString(str)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function MissionText(self, text, time)
    if not text then return end

    text = tostring(text)
    
    drawTxt(0.97, 1.43, 1.0,1.0,0.4, text, 255, 255, 255, 255)  -- INT: kmh
end

function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
        SetTextOutline()
    end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end


local smokeTable = {}
local prisonerTable = {}
local copTable = {}

local smokeLocations = {
    {1709.9931640625,2691.6640625,45.572238922119},
    {1715.095703125,2688.6574707031,45.571224212646},
    {1703.8051757813,2689.1862792969,45.571407318115},
    {1721.8214111328,2685.5402832031,45.56489944458},
    {1697.8100585938,2683.208984375,45.564933776855},

    {1662.4675292969,2669.0375976563,45.564895629883},
    {1656.9019775391,2668.3435058594,45.564895629883},
    {1652.5489501953,2665.0114746094,45.564895629883},
    {1650.9392089844,2659.8876953125,45.564926147461},
    {1650.7983398438,2653.5249023438,45.564926147461},

    {1758.0987548828,2673.1220703125,45.564872741699},
    {1765.3293457031,2673.1318359375,45.564872741699},
    {1770.9254150391,2670.3132324219,45.564872741699},
    {1774.1247558594,2665.9516601563,45.564872741699},
    {1776.4498291016,2661.21875,45.564872741699},

    {1754.9405517578,2651.4887695313,45.564918518066},
    {1759.7680664063,2649.8244628906,45.584705352783},
    {1768.2872314453,2649.865234375,45.581718444824},
    {1718.4710693359,2649.6398925781,45.564933776855},
    {1714.5267333984,2625.9748535156,45.564888000488},
    {1708.4614257813,2624.4741210938,45.564888000488},

}

local SpawnLocations = {
    [1] = {["name"] = "prisoner", ["pos"] = {1776.3377685547,2666.0100097656,45.564937591553}},
    [2] = {["name"] = "prisoner", ["pos"] = {1772.5654296875,2675.6342773438,45.564918518066}},
    [3] = {["name"] = "prisoner", ["pos"] = {1762.251953125,2676.0573730469,45.564918518066}},
    [4] = {["name"] = "prisoner", ["pos"] = {1719.8916015625,2686.947265625,45.565704345703}},
    [5] = {["name"] = "prisoner", ["pos"] = {1711.4210205078,2693.9387207031,45.583290100098}},
    [6] = {["name"] = "prisoner", ["pos"] = {1701.1168212891,2687.2568359375,45.564990997314}},
    [7] = {["name"] = "prisoner", ["pos"] = {1663.0439453125,2671.5556640625,45.602420806885}},
    [8] = {["name"] = "prisoner", ["pos"] = {1652.5731201172,2667.578125,45.564937591553}},
    [9] = {["name"] = "prisoner", ["pos"] = {1651.0554199219,2656.02734375,45.564937591553}},

    [10] = {["name"] = "cop", ["pos"] = {1690.3841552734,2623.3342285156,45.564903259277}},
    [11] = {["name"] = "cop", ["pos"] = {1711.5394287109,2622.4599609375,45.564895629883}},
    [12] = {["name"] = "cop", ["pos"] = {1719.8424072266,2623.2243652344,45.564895629883}},
    [13] = {["name"] = "cop", ["pos"] = {1770.4345703125,2646.404296875,45.564914703369}},
    [14] = {["name"] = "cop", ["pos"] = {1753.9340820313,2649.5444335938,45.564918518066}},
}

local models = {
    ["prisoner"] = "S_M_Y_Prisoner_01",
    ["cop"] = "S_M_Y_Cop_01",
}


local missionState = {
    ["prisoner"] = "MISSION5",
    ["cop"] = "COP"
}

randomWeapon = {
[1] = "WEAPON_UNARMED",
[2] = "WEAPON_KNIFE",
[3] = "WEAPON_NIGHTSTICK",
[4] = "WEAPON_HAMMER",
[5] = "WEAPON_BAT",
[6] = "WEAPON_GOLFCLUB",
[7] = "WEAPON_CROWBAR",
[8] = "WEAPON_BOTTLE",
[9] = "WEAPON_DAGGER",
[10] = "WEAPON_KNUCKLE",
[11] = "WEAPON_HATCHET",
[12] = "WEAPON_MACHETE",
[13] = "WEAPON_SWITCHBLADE",
[14] = "WEAPON_REVOLVER",
[15] = "WEAPON_BATTLEAXE",
[16] = "WEAPON_POOLCUE",
[17] = "WEAPON_WRENCH"
}

randomWeaponCop = {
[1] = "WEAPON_PISTOL",
[2] = "WEAPON_COMBATPISTOL",
[3] = "WEAPON_APPISTOL",
[4] = "WEAPON_ASSAULTSMG",
[5] = "WEAPON_CARBINERIFLE",
[6] = "WEAPON_MG",
[7] = "WEAPON_PUMPSHOTGUN",
[8] = "WEAPON_ASSAULTSHOTGUN",
[9] = "WEAPON_STUNGUN",
[10] = "WEAPON_SNSPISTOL",
[11] = "WEAPON_SPECIALCARBINE",
[12] = "WEAPON_MARKSMANRIFLE"
}


RegisterNetEvent('ai:removePeds')
AddEventHandler('ai:removePeds', function(cops,prisoners)
   for i,v in ipairs(cops) do
        local ped = NetworkGetEntityFromNetworkId(v)

        DeletePed(ped)
   end
   for i,v in ipairs(prisoners) do
        local ped = NetworkGetEntityFromNetworkId(v)

        DeletePed(ped)
   end  
end)



function DrawMarkerRad(markerType,x,y,z,arg1,arg2,arg3,arg4,arg5,arg6,sx,sy,sz,r,g,b,a,upDown,face,p19,rotate,texture,textureName,drawEnts)
    local dist = #(vector3(x,y,z) - GetEntityCoords(PlayerPedId()))
    if dist < 40 then
      local dist = math.floor(a - (dist * 10))
      if dist < 0 then dist = 0 end
      DrawMarker(markerType,x,y,z,arg1,arg2,arg3,arg4,arg5,arg6,sx,sy,sz,r,g,b,dist,upDown,face,p19,rotate,texture,textureName,drawEnts)
    end
end


local hasMoved = false
RegisterNetEvent('jail:lockdown')
AddEventHandler('jail:lockdown', function(lockdownState)
    lockdown = lockdownState
    if lockdown and imjailed and not hasMoved then
        mycell = math.random(1,32)
        mycell = math.ceil(mycell)
        SetEntityCoords(PlayerPedId(), Config.PrisonCells[mycell].x,Config.PrisonCells[mycell].y,Config.PrisonCells[mycell].z) 
        TriggerEvent("chatMessage", "DOC | " , { 33, 118, 255 }, "You have been placed into lockdown due to a disturbance.")
        hasMoved = true
    elseif not lockdown and imjailed then
        hasMoved = false
        TriggerEvent("chatMessage", "DOC | " , { 33, 118, 255 }, "Lockdown has ended.")
    end
end)


function JailIntro()
    DoScreenFadeOut(10)
    FreezeEntityPosition(PlayerPedId(), true)
    TriggerEvent('InteractSound_CL:PlayOnOne', 'handcuff', 1.0)

    
    SetPedComponentVariation(PlayerPedId(), 1, -1, -1, -1)
    ClearPedProp(PlayerPedId(), 0)

    Citizen.Wait(1000)

    SetEntityCoords(PlayerPedId(),Config.Locations["takephotos"]["x"],Config.Locations["takephotos"]["y"],Config.Locations["takephotos"]["z"])
    SetEntityHeading(PlayerPedId(),270.0)
    Citizen.Wait(1500) 
    DoScreenFadeIn(500)
    TriggerEvent('InteractSound_CL:PlayOnOne', 'photo', 0.4)
    Citizen.Wait(3000) 
    TriggerEvent('InteractSound_CL:PlayOnOne', 'photo', 0.4)
    Citizen.Wait(3000)     
    SetEntityHeading(PlayerPedId(),-355.74) 

    TriggerEvent('InteractSound_CL:PlayOnOne', 'photo', 0.4)
    Citizen.Wait(3000)  
    TriggerEvent('InteractSound_CL:PlayOnOne', 'photo', 0.4)
    Citizen.Wait(3000)         
    SetEntityHeading(PlayerPedId(),170.74) 

    TriggerEvent('InteractSound_CL:PlayOnOne', 'photo', 0.4)
    Citizen.Wait(3000) 
     TriggerEvent('InteractSound_CL:PlayOnOne', 'photo', 0.4)
    Citizen.Wait(3000)       

    SetEntityHeading(PlayerPedId(),270.0)

    Citizen.Wait(2000)
    DoScreenFadeOut(1100)   
    Citizen.Wait(2000)
    TriggerEvent('InteractSound_CL:PlayOnOne', 'jaildoor', 1.0)

end

DoScreenFadeIn(1500)
outofrange = false
minutes = 0

function InmateAnim()
    if ( DoesEntityExist( inmate ) and not IsEntityDead( inmate ) ) then 
        loadAnimDict( "random@mugging4" )
        TaskPlayAnim( inmate, "random@mugging4", "agitated_loop_a", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
    end
end

function InmateDelete()
    if DoesEntityExist(inmate) then 
        SetPedAsNoLongerNeeded(inmate)
        DeletePed(inmate)
    end
end

function InmateCreate()
    local hashKey = -1313105063
    local pedType = 5
    RequestModel(hashKey)
    while not HasModelLoaded(hashKey) do
        RequestModel(hashKey)
        Citizen.Wait(100)
    end
    inmate = CreatePed(pedType, hashKey, 1642.08, 2522.16, 45.57, 43.62, false, false)
end

function InmatePedSettings()
    SetEntityInvincible(inmate,true)
    ClearPedTasks(inmate)
    ClearPedSecondaryTask(inmate)
    TaskSetBlockingOfNonTemporaryEvents(inmate, true)
    SetPedFleeAttributes(inmate, 0, 0)
    SetPedCombatAttributes(inmate, 17, 1)
    SetPedSeeingRange(inmate, 0.0)
    SetPedHearingRange(inmate, 0.0)
    SetPedAlertness(inmate, 0)
    SetPedKeepTask(inmate, true)
end

RegisterNetEvent('beginJail')
AddEventHandler('beginJail', function(time, delivery)
    if not imjailed then
        TriggerServerEvent("jail:saveItems")
    end

    imjailed = false
    local playerPed = PlayerPedId()

    mycell = math.random(1,#Config.PrisonCells)
    minutes = tonumber(time)

    JailIntro()
    FreezeEntityPosition(playerPed, false)
    
    DoScreenFadeOut(1)
    if mycell == nil then
        mycell = 1
    end
    SetEntityCoords(playerPed, Config.PrisonCells[mycell].x,Config.PrisonCells[mycell].y,Config.PrisonCells[mycell].z ) 
 
    InmateDelete()
    InmateCreate()
    InmatePedSettings()
    InmateAnim()


    Citizen.Wait(500)
    FreezeEntityPosition(playerPed, false)
    DoScreenFadeIn(1500)
    TriggerServerEvent("updateJailTime", minutes)
    imjailed = true
    RemoveAllPedWeapons(playerPed)
    TriggerEvent("notification", "You have been jailed. You can pick up your shit when you leave.")

    local timer = minutes
    while imjailed do
        Citizen.Wait(60000)

        timer = timer - 1
        TriggerServerEvent("updateJailTime", timer)
        TriggerServerEvent("checkJailTime")

        if timer <= 0 then
            local playerPed = PlayerPedId()
            if (#(GetEntityCoords(playerPed) - vector3(Config.PrisonCells[mycell].x,Config.PrisonCells[mycell].y,Config.PrisonCells[mycell].z)) > 340) then
                SetEntityCoords(playerPed, Config.PrisonCells[mycell].x,Config.PrisonCells[mycell].y,Config.PrisonCells[mycell].z) 
            end
        end
    end

    TriggerServerEvent("updateJailTime", 0)

    TriggerEvent("notification", "You are free!.",1)
    SetEntityCoords(playerPed, Config.Locations["outjail"]["x"], Config.Locations["outjail"]["y"],Config.Locations["outjail"]["z"])
end)



Citizen.CreateThread(function()
    Wait(6000)
    while true do
        Wait(1)
        local playerPed = PlayerPedId()
        if (#(GetEntityCoords(playerPed, 0) - vector3(Config.Locations["checks"].x,Config.Locations["checks"].y, Config.Locations["checks"].z)) < 4.0) then

            if IsControlJustPressed(1, 38) then
                TriggerServerEvent("checkJailTime",true)
                Citizen.Wait(5000)
            end

            if IsControlJustPressed(1, 74) then
                TriggerEvent("bb-lawstats:openMenu")
                Citizen.Wait(5000)
            end     

            drawTxt(0.90, 1.44, 1.0,1.0,0.25, "Press [E] to check your jail time.", 255, 255, 255, 255)
            drawTxt(0.90, 1.40, 1.0,1.0,0.25, "Press [H] to get a list of available lawyers.", 255, 255, 255, 255)

        else
            Wait(10000)
        end
    end
end)


RegisterNetEvent('TimeRemaining')
AddEventHandler('TimeRemaining', function(TimeRemaining, release)
    local TimeR = TimeRemaining

    if TimeR < 0 and release then
       imjailed = false
        TriggerEvent("notification", "You are free!.",1)
        SetEntityCoords(playerPed, Config.Locations["outjail"]["x"], Config.Locations["outjail"]["y"],Config.Locations["outjail"]["z"])   
    end

    local minutes = math.ceil(TimeR / 60)

    TriggerEvent('chat:addMessage', {
        template = '<div class="chat-message" style="backgroud-color: rgb(33, 118, 255);">You have ' .. minutes .. ' months remaining</div>',
        args = {}
    })
end)

RegisterNetEvent('endJailTime')
AddEventHandler('endJailTime', function()
    imjailed = false
end)

selectedCell = 0

function DrawText3D(x,y,z, text) -- some useful function, use it if you want!
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end