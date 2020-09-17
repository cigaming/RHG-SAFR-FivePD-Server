

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)




RegisterServerEvent("Farmcyc:recoleccion")
AddEventHandler("Farmcyc:recoleccion", function()

    local _source = source	
	local xPlayer = ESX.GetPlayerFromId(_source)
	local recoleccionsuerte = math.random(1,100)
	local cangrejos = xPlayer.getInventoryItem('cangrejos').count	
	local camarones = xPlayer.getInventoryItem('camarones').count	

         if recoleccionsuerte < 50 then

         	   if xPlayer.getInventoryItem('cangrejos').count >= 20 then
         	TriggerClientEvent('esx:showNotification', source, '~r~You cant carry more crabs')	
else 

         	xPlayer.addInventoryItem("cangrejos", math.random(1,2)) 
         
              end

         elseif recoleccionsuerte > 51 then 
         	
         	if xPlayer.getInventoryItem('camarones').count >= 20 then
         	TriggerClientEvent('esx:showNotification', source, '~r~You cant take more prawns')
else 

            xPlayer.addInventoryItem("camarones", math.random(1,2)) 
        end

            end 
		
end)




ESX.RegisterServerCallback('Farmcyc:empaquetado:cangrejos', function (source, cb)
	
	local _source = source
	
	local xPlayer  = ESX.GetPlayerFromId(_source)
			
			if xPlayer.getInventoryItem('cajadecangrejos').count >= 4 then

			TriggerClientEvent('esx:showNotification', source, '~r~You cant carry any more boxes')

else

				if xPlayer.getInventoryItem('cangrejos').count >= 5 then


 
					xPlayer.removeInventoryItem('cangrejos', 4) 
					Citizen.Wait(1000)
					xPlayer.addInventoryItem('cajadecangrejos', 1) 

					cb(true)

				else
				TriggerClientEvent('esx:showNotification', source, '~r~You have no crabs')
				cb(false)
				end
			
      		end

end)

ESX.RegisterServerCallback('Farmcyc:empaquetado:camarones', function (source, cb)
	
	local _source = source
	
	local xPlayer  = ESX.GetPlayerFromId(_source)
			
			if xPlayer.getInventoryItem('cajadecamarones').count >= 5 then

			TriggerClientEvent('esx:showNotification', source, '~r~You cant carry any more boxes')

else

				if xPlayer.getInventoryItem('camarones').count >= 4 then


 
					xPlayer.removeInventoryItem('camarones', 4) 
					Citizen.Wait(1000)
					xPlayer.addInventoryItem('cajadecamarones', 1) 

					cb(true)

				else
				TriggerClientEvent('esx:showNotification', source, '~r~You have no shrimp')
				cb(false)
				end
			
      		end

end)


RegisterNetEvent('Ventadecamarones')
AddEventHandler('Ventadecamarones', function()
	local _source = source 
    local xPlayer = ESX.GetPlayerFromId(_source)
    local camarones = xPlayer.getInventoryItem('cajadecamarones').count
    local PrecioCamarones = Config.PCamaron
   

if camarones > 0 then


    xPlayer.removeInventoryItem('cajadecamarones', 1)
    xPlayer.addMoney(PrecioCamarones)
elseif camarones < 1 then
	TriggerClientEvent('esx:showNotification', source, '~r~You dont have shrimp to sell')

end

end)



RegisterNetEvent('Ventadecangrejos')
AddEventHandler('Ventadecangrejos', function()
	local _source = source 
    local xPlayer = ESX.GetPlayerFromId(_source)
    local cangrejos = xPlayer.getInventoryItem('cajadecangrejos').count
    local PrecioCangrejos = Config.PCangrejo

if cangrejos > 0 then


    xPlayer.removeInventoryItem('cajadecangrejos', 1)
    Citizen.Wait(500)
    xPlayer.addMoney(PrecioCangrejos)
elseif cangrejos < 1 then
	TriggerClientEvent('esx:showNotification', source, '~r~You dont have crabs to sell')

end

end)
