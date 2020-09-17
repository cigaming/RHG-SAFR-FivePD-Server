ESX                           = nil
wait = false
delay = 20 -- delay between each message in sec

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()

end)




Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
	if wait == true then
		Citizen.Wait(delay*1000)
		wait = false
	end	
  end
end)

RegisterCommand('ad', function(source, args)
	if wait == false and PlayerData.job.name == 'taxi' then
		TriggerServerEvent('global:advert', args)
		wait = true
	elseif wait == true then
		TriggerServerEvent('wait:advert')
	elseif PlayerData.job.name ~= 'taxi' then
		TriggerServerEvent('job:advert')
	end
end, false)
