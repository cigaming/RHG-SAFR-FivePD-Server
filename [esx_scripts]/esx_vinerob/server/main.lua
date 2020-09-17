ESX               = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local cooldown = 0
local cooldowntime = 600 * 6000

function Timer()
	cooldown = 1
	Citizen.Wait(cooldowntime)
	cooldown = 0
end

RegisterServerEvent('esx_mansion:robbery')
AddEventHandler('esx_mansion:robbery', function(text)
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()
	local police = 0
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			police = police+1
		end
	end
		if police > Config.LSPD-1 and cooldown == 0 then
			TriggerClientEvent("esx_mansion:start", source)
			TriggerClientEvent("esx_mansion:true", source)
			TriggerClientEvent("esx_mansion:notification", source, _U('robbery_started'))
			LSPD()
			Citizen.Wait(1000)
			Timer()
		end

		if cooldown == 1 then
			TriggerClientEvent("esx_mansion:notification", source, _U('robbed_recent'))
		end

		if police < Config.LSPD then
			TriggerClientEvent("esx_mansion:notification", source, _U('police'))
		end
end)

RegisterServerEvent('esx_mansion:reward')
AddEventHandler('esx_mansion:reward', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.addMoney(math.random(Config.MinReward,Config.MaxReward))
end)

function LSPD()
	local _source = source
	local xPlayers = ESX.GetPlayers()

	for i=1, #xPlayers, 1 do
		xPlayer = ESX.GetPlayerFromId(xPlayers[i])

		if xPlayer.job.name == 'police' then
			TriggerClientEvent("esx_mansion:notify", -1)
		end
	end
end
