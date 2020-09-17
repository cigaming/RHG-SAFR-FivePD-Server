ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('esx_property:getPlayerDressing', function(source, cb)

  local xPlayer  = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)

    local count    = store.count('dressing')
    local labels   = {}

    for i=1, count, 1 do
      local entry = store.get('dressing', i)
      table.insert(labels, entry.label)
    end

    cb(labels)

  end)

end)

ESX.RegisterServerCallback('esx_property:getPlayerOutfit', function(source, cb, num)

  local xPlayer  = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
    local outfit = store.get('dressing', num)
    cb(outfit.skin)
  end)

end)

RegisterServerEvent('esx_property:removeOutfit')
AddEventHandler('esx_property:removeOutfit', function(label)

    local xPlayer = ESX.GetPlayerFromId(source)

    TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)

        local dressing = store.get('dressing')

        if dressing == nil then
            dressing = {}
        end

        label = label
        
        table.remove(dressing, label)

        store.set('dressing', dressing)

    end)

end)