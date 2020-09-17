DrawText3D = function(coords, text, scale)
    coords = coords + vector3(0.0, 0.0, 1.2)
	local onScreen,_x,_y=World3dToScreen2d(coords.x, coords.y, coords.z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(scale, scale)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 41, 41, 125)
end

weaponStorage = function(id)
    ESX.UI.Menu.CloseAll()
    ESX.TriggerServerCallback('loaf_housing:getInventory', function(inv)
        local elements = {}

        for k, v in pairs(inv['weapons']) do
            table.insert(elements, {label = v['label'], weapon = v['name'], ammo = v['ammo']})            
        end
        
    end)

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'storage',
    {
        title = Strings['Storage_Title'],
        align = 'center',
        elements = {
            {label = Strings['Store'], value = 's'},
            {label = Strings['Withdraw'], value = 'w'}
        },
    },
    function(data, menu)
        if data.current.value == 's' then

            ESX.TriggerServerCallback('loaf_housing:getInventory', function(inv)

                local elements = {}
        
                for k, v in pairs(inv['weapons']) do
                    table.insert(elements, {label = v['label'], weapon = v['name'], ammo = v['ammo']})            
                end

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'storeItem', {
                    title = Strings['House_Inventory'],
                    align = 'center',
                    elements = elements
                }, function(data2, menu2)
                    TriggerServerEvent('loaf_housing:storeItem', 'weapon', data2.current.weapon, data2.current.ammo, id)
                    menu2.close()
                end, function(data2, menu2)
                    menu2.close()
                end)

            end)

        elseif data.current.value == 'w' then
            
            ESX.TriggerServerCallback('loaf_housing:getHouseInv', function(inv)

                local elements = {}

                for k, v in pairs(inv['weapons']) do
                    table.insert(elements, {label = ('%s | x%s %s'):format(ESX.GetWeaponLabel(v['name']), v['ammo'], Strings['bullets']), weapon = v['name'], ammo = v['ammo']})
                end

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'withdrawItem', {
                    title = Strings['House_Inventory'],
                    align = 'center',
                    elements = elements
                }, function(data2, menu2)
                    TriggerServerEvent('loaf_housing:withdrawItem', 'weapon', data2.current.weapon, data2.current.ammo, id)
                    menu2.close()
                end, function(data2, menu2)
                    menu2.close()
                end)

            end, id)

        end

    end, function(data, menu)
        menu.close()
    end)
end

itemStorage = function(id)
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'storage',
    {
        title = Strings['Storage_Title'],
        align = 'center',
        elements = {
            {label = Strings['Store'], value = 's'},
            {label = Strings['Withdraw'], value = 'w'}
        },
    },
    function(data, menu)
        if data.current.value == 's' then

            ESX.TriggerServerCallback('loaf_housing:getInventory', function(inv)
                local elements = {}
        
                for k, v in pairs(inv['items']) do
                    if v['count'] >= 1 then
                        table.insert(elements, {label = ('x%s %s'):format(v['count'], v['label']), type = 'item', value = v['name']})
                    end
                end
        
                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'storeItem', {
                    title = Strings['Player_Inventory'],
                    align = 'center',
                    elements = elements
                }, function(data2, menu2)
                    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'putAmount', {title = Strings['Amount']}, function(data3, menu3)
                        local amount = tonumber(data3.value)

                        if amount == nil then
                            ESX.ShowNotification(Strings['Invalid_Amount'])
                        else
                            if amount >= 0 then
                                TriggerServerEvent('loaf_housing:storeItem', data2.current.type, data2.current.value, tonumber(data3.value), id)
                                menu3.close()
                                menu2.close()
                            else
                                ESX.ShowNotification(Strings['Invalid_Amount'])
                            end
                        end
                    end, function(data3, menu3)
                        menu3.close()
                    end)
                end, function(data2, menu2)
                    menu2.close()
                end)
            end)
        elseif data.current.value == 'w' then
            
            ESX.TriggerServerCallback('loaf_housing:getHouseInv', function(inv)

                local elements = {}

                for k, v in pairs(inv['items']) do
                    if v['count'] > 0 then
                        table.insert(elements, {label = ('x%s %s'):format(v['count'], v['label']), value = v['name']})
                    end
                end

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'withdrawItem', {
                    title = Strings['House_Inventory'],
                    align = 'center',
                    elements = elements
                }, function(data2, menu2)
                    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'putAmount', {title = Strings['Amount']}, function(data3, menu3)
                        local amount = tonumber(data3.value)

                        if amount == nil then
                            ESX.ShowNotification(Strings['Invalid_Amount'])
                        else
                            if amount >= 0 then
                                TriggerServerEvent('loaf_housing:withdrawItem', 'item', data2.current.value, tonumber(data3.value), id)
                                menu3.close()
                                menu2.close()
                            else
                                ESX.ShowNotification(Strings['Invalid_Amount'])
                            end
                        end
                    end, function(data3, menu3)
                        menu3.close()
                    end)
                end, function(data2, menu2)
                    menu2.close()
                end)

            end, id)

        end

    end, function(data, menu)
        menu.close()
    end)
end