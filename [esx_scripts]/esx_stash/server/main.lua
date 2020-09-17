ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


TriggerEvent('es:addCommand', 'hide', function(source, args, user) 
	local xPlayer = ESX.GetPlayerFromId(source)
	
	TriggerClientEvent('esx_stash:stash', source)
end, {help = ('hide vehicle under tarp')})