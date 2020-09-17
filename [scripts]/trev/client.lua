ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

--######################
--######################

RegisterNetEvent("TrevLol")
AddEventHandler("TrevLol",function()
    DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 20)
    local input = true
    Citizen.CreateThread(function()
    while input do
        if input == true then
            HideHudAndRadarThisFrame()
            if UpdateOnscreenKeyboard() == 3 then
                input = false
            elseif UpdateOnscreenKeyboard() == 1 then
                local inputText = GetOnscreenKeyboardResult()
                if string.len(inputText) > 0 then
                    TriggerServerEvent('TrevNotify', inputText)
                    input = false
                else
                    DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 20)
                end
            elseif UpdateOnscreenKeyboard() == 2 then
                input = false
            end
        end
        Citizen.Wait(0)
    end
end)
end)

RegisterNetEvent('TrevNotifyText')
AddEventHandler('TrevNotifyText',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_TREVOR", "CHAR_TREVOR", true, 1, "T-Dog", "");
DrawNotification(false, true);
end)

--######################
--######################

RegisterNetEvent("LamarLol")
AddEventHandler("LamarLol",function()
    DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 20)
    local input = true
    Citizen.CreateThread(function()
    while input do
        if input == true then
            HideHudAndRadarThisFrame()
            if UpdateOnscreenKeyboard() == 3 then
                input = false
            elseif UpdateOnscreenKeyboard() == 1 then
                local inputText = GetOnscreenKeyboardResult()
                if string.len(inputText) > 0 then
                    TriggerServerEvent('LamarNotify', inputText)
                    input = false
                else
                    DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 20)
                end
            elseif UpdateOnscreenKeyboard() == 2 then
                input = false
            end
        end
        Citizen.Wait(0)
    end
end)
end)

RegisterNetEvent('LamarNotifyText')
AddEventHandler('LamarNotifyText',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_LAMAR", "CHAR_LAMAR", true, 1, "LD", "");
DrawNotification(false, true);
end)



local interface = true

function openInterface()
	interface = not interface
	if not interface then -- hidden
	  -- DisplayRadar(false)
	  ESX.UI.HUD.SetDisplay(0.0)
	  TriggerEvent('es:setMoneyDisplay', 0.0)
	  --TriggerEvent('esx_status:setDisplay', 0.0)
	elseif interface then -- shown
	  -- DisplayRadar(true)
	  ESX.UI.HUD.SetDisplay(1.0)
	  TriggerEvent('es:setMoneyDisplay', 1.0)
	  --TriggerEvent('esx_status:setDisplay', 1.0)
	end
end

RegisterCommand("hud", function()
	openInterface()
end, false)