--[[-------------------------------------------------------------------------
    Author: Lucifer
    Last Edit: 13/10/2019
    Description: Simple locking system made for SOSAY Nation
    Notes: You cannot release or remove this text, enjoy!
--]]-------------------------------------------------------------------------

local vehicleOwners = {}

RegisterServerEvent("SOSAY_Locking:GiveKeys")
AddEventHandler("SOSAY_Locking:GiveKeys", function(vehNet, plate)
    local src = source
    local plate = string.lower(plate)
    table.insert(vehicleOwners, {owner = src, netid = vehNet, plate = plate})
end)

RegisterServerEvent("SOSAY_Locking:CheckOwnership")
AddEventHandler("SOSAY_Locking:CheckOwnership", function(vehNet, plate)
    local src = source
    local plate = string.lower(plate)
    for i = 1, #vehicleOwners do
        if vehicleOwners[i].netid == vehNet then
            if vehicleOwners[i].owner == src then
                if vehicleOwners[i].plate == plate then
                    TriggerClientEvent("SOSAY_Locking:ToggleOutsideLock", src, vehNet, true)
                end
            end
        end
    end
    TriggerClientEvent("SOSAY_Locking:ToggleOutsideLock", src, vehNet, false)
end)

RegisterServerEvent("SOSAY_Locking:GiveKeysToPlayer")
AddEventHandler("SOSAY_Locking:GiveKeysToPlayer", function(player, vehNet, plate)
    local src = source
    local plate = string.lower(plate)

    for i = 1, #vehicleOwners do
        if vehicleOwners[i].netid == vehNet then
            if vehicleOwners[i].owner == src then
                if vehicleOwners[i].plate == plate then
                    for i = 1, #vehicleOwners do
                        if vehicleOwners[i].owner == src then
                            table.remove(vehicleOwners, i)
                            break
                        end
                    end

                    table.insert(vehicleOwners, {owner = player, netid = vehNet, plate = plate})
                    TriggerClientEvent("SOSAY_Locking:ESX_Notification", src, "You have given your vehicle keys of vehicle plate - " .. string.upper(plate) .. " to the nearest player")
                    TriggerClientEvent("SOSAY_Locking:ESX_Notification", player, "You have recieved the keys of the vehicle plate - " .. string.upper(plate) .. " from the nearest player")
                end
            else
                TriggerClientEvent("SOSAY_Locking:ESX_Notification", src, "~r~You don't have the keys to this vehicle!")
            end
        end
    end
end)