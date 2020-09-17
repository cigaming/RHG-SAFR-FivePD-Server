

ESX = nil
Citizen.CreateThread(function()
	while true do
		Wait(5)
		if ESX ~= nil then
		
		else
			ESX = nil
			TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		end
	end
end)

local locations = {}
local primeraaparicion = true 

local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}


local spawned = false


Citizen.CreateThread( function()
Citizen.Wait(10000)
while true do
Citizen.Wait(1000)
	if GetDistanceBetweenCoords(Config.PickupBlip.x,Config.PickupBlip.y,Config.PickupBlip.z, GetEntityCoords(GetPlayerPed(-1))) <= 200 then
		if spawned == false then

			TriggerEvent('Farmcyc:comienzo')
			TriggerEvent('Farmcyc:comienzo')
			TriggerEvent('Farmcyc:comienzo')
			TriggerEvent('Farmcyc:comienzo')
			TriggerEvent('Farmcyc:comienzo')
			TriggerEvent('Farmcyc:comienzo')
			TriggerEvent('Farmcyc:comienzo')
			TriggerEvent('Farmcyc:comienzo')
			TriggerEvent('Farmcyc:comienzo')
			TriggerEvent('Farmcyc:comienzo')
			TriggerEvent('Farmcyc:comienzo')
			TriggerEvent('Farmcyc:comienzo')
			TriggerEvent('Farmcyc:comienzo')
			TriggerEvent('Farmcyc:comienzo')
			TriggerEvent('Farmcyc:comienzo')

		end
		spawned = true
	else
		if spawned then
			locations = {}
		end
		spawned = false
		
	end
end
end)


local displayed = false
local menuOpen = false

local blipPickup = AddBlipForCoord(Config.PickupBlip.x,Config.PickupBlip.y,Config.PickupBlip.z)
			SetBlipSprite (blipPickup, 266)
			SetBlipDisplay(blipPickup, 4)
			SetBlipScale  (blipPickup, 0.7)
			SetBlipColour (blipPickup, 47)
			SetBlipAsShortRange(blipPickup, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(Config.nombrerecoBlip)
			EndTextCommandSetBlipName(blipPickup)
			
local blipProcess = AddBlipForCoord(Config.Processing.x, Config.Processing.y, Config.Processing.z)

			SetBlipSprite (blipProcess, 266)
			SetBlipDisplay(blipProcess, 4)
			SetBlipScale  (blipProcess, 0.7)
			SetBlipColour (blipProcess, 47)
			SetBlipAsShortRange(blipProcess, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(Config.nombreproceBlip)
			EndTextCommandSetBlipName(blipProcess)
			


local process = true

local blipcamarones = AddBlipForCoord(Config.camarones.x, Config.camarones.y, Config.camarones.z)

			SetBlipSprite (blipcamarones, 266)
			SetBlipDisplay(blipcamarones, 4)
			SetBlipScale  (blipcamarones, 0.7)
			SetBlipColour (blipcamarones, 47)
			SetBlipAsShortRange(blipcamarones, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(Config.nombrecamaBlip)
			EndTextCommandSetBlipName(blipcamarones)
			


local camarones = true

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		
			for k in pairs(locations) do
				if GetDistanceBetweenCoords(locations[k].x, locations[k].y, locations[k].z, GetEntityCoords(GetPlayerPed(-1))) < 150 then			
					DrawMarker(2, locations[k].x, locations[k].y, locations[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 228, 71, 12, 110, 1, 1, 0, 1)	
					
					if GetDistanceBetweenCoords(locations[k].x, locations[k].y, locations[k].z, GetEntityCoords(GetPlayerPed(-1)), false) < 2 then			
				ESX.ShowHelpNotification('Press ~INPUT_PICKUP~ to catch crabs / shrimp')

				if IsControlJustReleased(0, Keys['E']) then
						--TriggerServerEvent('Farmcyc:recoleccion')
						----TriggerEvent('Farmcyc:nuevo', k)
						Animacion()
						TriggerEvent('Farmcyc:nuevo', k)
				end

					end
				
				end
			end

			-------------------------------------------------------------------------------------------------------------------------------------
			
			if GetDistanceBetweenCoords(Config.Processing.x, Config.Processing.y, Config.Processing.z, GetEntityCoords(GetPlayerPed(-1))) < 150 then			
					DrawMarker(2, Config.Processing.x, Config.Processing.y, Config.Processing.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.3, 1.3, 1.0, 228, 71, 12, 110, 1, 1, 0, 1)	
					
					if GetDistanceBetweenCoords(Config.Processing.x, Config.Processing.y, Config.Processing.z, GetEntityCoords(GetPlayerPed(-1)), true) < 2 then			
						---Draw3DText( Config.Processing.x, Config.Processing.y, Config.Processing.z , "~w~Produccion de cangrejos~y~\nPress [~b~E~y~] to start packaging",4,0.15,0.1)
						DrawText3Ds(vector3(Config.Processing.x,Config.Processing.y,Config.Processing.z), "Press [E] to pack crabs ", 0.35)

						if IsControlJustReleased(0, Keys['E']) then
							Citizen.CreateThread(function()
								Process()

							end)
						end
					end
			
					if GetDistanceBetweenCoords(Config.Processing.x, Config.Processing.y, Config.Processing.z, GetEntityCoords(GetPlayerPed(-1)), true) < 5 and GetDistanceBetweenCoords(Config.Processing.x, Config.Processing.y, Config.Processing.z, GetEntityCoords(GetPlayerPed(-1)), true) > 3 then
						process = false
					end
				end


------------------------------------------------------------------------------------------------------------------------------------------------------

				if GetDistanceBetweenCoords(Config.camarones.x, Config.camarones.y, Config.camarones.z, GetEntityCoords(GetPlayerPed(-1))) < 150 then			
					DrawMarker(2, Config.camarones.x, Config.camarones.y, Config.camarones.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.3, 1.3, 1.0, 228, 71, 12, 110, 1, 1, 0, 1)	
					
					if GetDistanceBetweenCoords(Config.camarones.x, Config.camarones.y, Config.camarones.z, GetEntityCoords(GetPlayerPed(-1)), true) < 2 then			
						---Draw3DText( Config.Processing.x, Config.Processing.y, Config.Processing.z , "~w~Produccion de cangrejos~y~\nPress [~b~E~y~] to start packaging",4,0.15,0.1)
						DrawText3Ds(vector3(Config.camarones.x,Config.camarones.y,Config.camarones.z), "Press [E] to pack prawns ", 0.35)

						if IsControlJustReleased(0, Keys['E']) then
							Citizen.CreateThread(function()
								Camarones()
							end)
						end
					end
					
					if GetDistanceBetweenCoords(Config.camarones.x, Config.camarones.y, Config.camarones.z, GetEntityCoords(GetPlayerPed(-1)), true) < 5 and GetDistanceBetweenCoords(Config.Processing.x, Config.Processing.y, Config.Processing.z, GetEntityCoords(GetPlayerPed(-1)), true) > 3 then
						camarones = false
					end
				end
			
			
    end
end)

function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
         local px,py,pz=table.unpack(GetGameplayCamCoords())
         local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
         local scale = (1/dist)*20
         local fov = (1/GetGameplayCamFov())*100
         local scale = scale*fov   
         SetTextScale(scaleX*scale, scaleY*scale)
         SetTextFont(fontId)
         SetTextProportional(1)
		 if inDist then
			SetTextColour(0, 190, 0, 220)		-- You can change the text color here
		 else
		 	SetTextColour(220, 0, 0, 220)		-- You can change the text color here
		 end
         SetTextDropshadow(1, 1, 1, 1, 255)
         SetTextEdge(2, 0, 0, 0, 150)
         SetTextDropShadow()
         SetTextOutline()
         SetTextEntry("STRING")
         SetTextCentre(1)
         AddTextComponentString(textInput)
         SetDrawOrigin(x,y,z+2, 0)
         DrawText(0.0, 0.0)
         ClearDrawOrigin()
end

function Animacion()
local ped = PlayerPedId()
RequestAnimDict("amb@world_human_gardener_plant@male@idle_a")
Citizen.Wait(100)

FreezeEntityPosition(ped,true)
TaskPlayAnim(ped,'amb@world_human_gardener_plant@male@idle_a', 'idle_b', 8.0, 8.0, -1, 0, 0, 0, 0, 0)
exports['progressBars']:startUI(1500, "catching")
Citizen.Wait(1500)

TriggerServerEvent('Farmcyc:recoleccion')

ClearPedTasks(ped)
FreezeEntityPosition(ped,false)


end



function Process()
process = true
local making = true
	while making and process do
	TriggerEvent('esx:showNotification', '~g~Starting ~r~crab ~g~production')
	Citizen.Wait(5000)
	
	ESX.TriggerServerCallback('Farmcyc:empaquetado:cangrejos', function(output)
			making = output
		end)

	end
end


function Camarones()
camarones = true
local makingcamarones = true
	while makingcamarones and camarones do
	TriggerEvent('esx:showNotification', '~g~Starting ~r~shrimp ~g~ production')
	Citizen.Wait(5000)
	
	ESX.TriggerServerCallback('Farmcyc:empaquetado:camarones', function(output)
			makingcamarones = output
		end)

	end
end


RegisterNetEvent('Farmcyc:comienzo')
AddEventHandler('Farmcyc:comienzo', function()
	local set = false


	Citizen.Wait(10)
	
	local rnX = Config.PickupBlip.x + math.random(-35, 35)
	local rnY = Config.PickupBlip.y + math.random(-35, 35)
	
	local u, Z = GetGroundZFor_3dCoord(rnX ,rnY ,300.0,0)
	
	

	
	table.insert(locations,{x=rnX, y=rnY, z=Z + 0.3});

	

end)


RegisterNetEvent('Farmcyc:nuevo')
AddEventHandler('Farmcyc:nuevo', function(id)
	local set = false
	Citizen.Wait(10)
	
	
	local rnX = Config.PickupBlip.x + math.random(-35, 35)
	local rnY = Config.PickupBlip.y + math.random(-35, 35)
	
	local u, Z = GetGroundZFor_3dCoord(rnX ,rnY ,300.0,0)
	
	locations[id].x = rnX
	locations[id].y = rnY
	locations[id].z = Z + 0.3

end)

RegisterNetEvent('Farmcyc:mensaje')
AddEventHandler('Farmcyc:mensaje', function(message)
	ESX.ShowNotification(message)
end)
			
function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end



DrawText3Ds = function(coords, text, scale)
    local x,y,z = coords.x, coords.y, coords.z
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local pX, pY, pZ = table.unpack(GetGameplayCamCoords())

    SetTextScale(scale, scale)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextEntry("STRING")
    SetTextCentre(1)
    SetTextColour(255, 255, 255, 215)

    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 280

    DrawRect(_x, _y + 0.0115, 0.032 + factor, 0.033, 41, 11, 41, 100)
end




Citizen.CreateThread(function()

	Blipventacamaronesycangrejos = AddBlipForCoord(Config.ventacyc.x, Config.ventacyc.y, Config.ventacyc.z)

SetBlipSprite(Blipventacamaronesycangrejos, 266)
SetBlipColour(Blipventacamaronesycangrejos, 47)
SetBlipScale(Blipventacamaronesycangrejos, 0.7)
SetBlipAsShortRange(Blipventacamaronesycangrejos, true)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString(Config.Blipnombrecyc)
EndTextCommandSetBlipName(Blipventacamaronesycangrejos)

end)


Citizen.CreateThread(function()
	while true do
local ped = PlayerPedId()
Citizen.Wait(1)



 	if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.ventacyc.x, Config.ventacyc.y, Config.ventacyc.z, true) < 25 then 
 		
 		DrawMarker(29, Config.ventacyc.x, Config.ventacyc.y, Config.ventacyc.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0, 228, 71, 12, 100, true, false, 2, false, nil, nil, false)

   if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.ventacyc.x, Config.ventacyc.y, Config.ventacyc.z, true) < 2 then
   	DrawText3Ds(vector3(Config.ventacyc.x,Config.ventacyc.y,Config.ventacyc.z), "Press [E] to open the store menu ", 0.35)


   	--ESX.ShowHelplNotification("Press ~INPUT_CONTEXT~ to open the sale menu")

   if IsControlJustReleased(0, Keys['E']) then
   	tiendacyc()

   end
end
 	end
 


	end
end)

function tiendacyc()

local elements ={  
{ label = 'Sell Prawns <span style = "color:#65D754;">' ..Config.PCamaron ..  '$</span>', value = 'Camarones1'},

{ label = 'Sell Crabs <span style = "color:#65D754;">' ..Config.PCangrejo ..  '$</span>', value = 'Cangrejos1'},

{ label = 'Exit <span style = "color:#DA2020;">Exit</span>', value = 'salir'},

}

ESX.UI.Menu.CloseAll() 
ESX.UI.Menu.Open('default', GetCurrentResourceName(),'ventacyc',{
	title = 'SELL PRODUCTS', 
	align = 'right',
	elements = elements  

}, function(data, menu)

if data.current.value == 'Camarones1' then 
	TriggerServerEvent("Ventadecamarones")
elseif data.current.value == 'Cangrejos1' then
	TriggerServerEvent("Ventadecangrejos")
elseif data.current.value == 'salir' then
	menu.close()

end

	end)
end


Citizen.CreateThread(function()
local hash = GetHashKey("s_m_y_chef_01")
if not HasModelLoaded(hash) then
	RequestModel(hash)
	Citizen.Wait(100)

end

while not HasModelLoaded(hash) do 
	Citizen.Wait(0)
end

if primeraaparicion == true then
	local npc = CreatePed(6,hash, Config.pedventa.x, Config.pedventa.y, Config.pedventa.z, Config.pedventa.h, false, false)
    FreezeEntityPosition(npc, true)
    SetEntityInvincible(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
    while not TaskStartScenarioInPlace(npc,"WORLD_HUMAN_CLIPBOARD", 1, true) do 
    Citizen.Wait(200)

    end
    Citizen.Wait(200)

end 

end)



Citizen.CreateThread(function()
local hash = GetHashKey("s_f_y_factory_01")
if not HasModelLoaded(hash) then
	RequestModel(hash)
	Citizen.Wait(100)

end

while not HasModelLoaded(hash) do 
	Citizen.Wait(0)
end

if primeraaparicion == true then
	local npc = CreatePed(6,hash, Config.pedemp1.x, Config.pedemp1.y, Config.pedemp1.z, Config.pedemp1.h, false, false)
    FreezeEntityPosition(npc, true)
    SetEntityInvincible(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
    while not TaskStartScenarioInPlace(npc,"WORLD_HUMAN_CLIPBOARD", 2, true) do 
    Citizen.Wait(200)

    end
    Citizen.Wait(200)

end 

end)



Citizen.CreateThread(function()
local hash = GetHashKey("s_m_y_factory_01")
if not HasModelLoaded(hash) then
	RequestModel(hash)
	Citizen.Wait(100)

end

while not HasModelLoaded(hash) do 
	Citizen.Wait(0)
end

if primeraaparicion == true then
	local npc = CreatePed(6,hash, Config.pedemp2.x, Config.pedemp2.y, Config.pedemp2.z, Config.pedemp2.h, false, false)
    FreezeEntityPosition(npc, true)
    SetEntityInvincible(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
    while not TaskStartScenarioInPlace(npc,"WORLD_HUMAN_CLIPBOARD", 1, true) do 
    Citizen.Wait(200)

    end
    Citizen.Wait(200)

end 

end)

