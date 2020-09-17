ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

----
ESX.RegisterUsableItem('rope', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('esx_rope:ropecheck', source)
end)

----

RegisterServerEvent('esx_rope:unlocking')
AddEventHandler('esx_rope:unlocking', function(source)
  TriggerClientEvent('esx_rope:unlockingcuffs', source)
end)
---
