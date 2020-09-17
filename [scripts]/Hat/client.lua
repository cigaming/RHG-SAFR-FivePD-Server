  hatsOn = false
  currentHats = nil
  myHats = nil
  sgTexture = nil
  hatsSet = false
  noHats = false

local hwaycop = GetHashKey("s_m_y_hwaycop_01")
local cop = GetHashKey("s_m_y_cop_01")
local sheriff = GetHashKey("s_m_y_sheriff_01")
local pilot = GetHashKey("s_m_m_pilot_02")
local fireman = GetHashKey("s_m_y_fireman_01")
local medic = GetHashKey("s_m_m_paramedic_01")



RegisterNetEvent('hats')
AddEventHandler('hats', function()
--[[
  Sets variables for if sunglasses are on and which sunglasses they are
]]--
  local player = GetPlayerPed(-1)
  local currentHats = GetPedPropIndex(player, 0)
  if currentHats == -1 and hatsSet == false then
    noHats = true
    hatsSet = false
  elseif currentHats ~= -1 and hatsSet == false then
    myHats = GetPedPropIndex(player, 0)
    sgTexture = GetPedPropTextureIndex(player, 0)
    noHats = false
    hatsSet = true
    hatsOn = true
  elseif currentHats == -1 and hatsSet == true then
    hatsOn = false
  elseif hatsSet == true and currentHats ~= -1 and myHats ~= currentHats then
    myHats = GetPedPropIndex(player, 0)
    sgTexture = GetPedPropTextureIndex(player, 0)
    hatsSet = true
    noHats = false
    hatsOn = true
  end 

--Takes Glasses off / Puts them On
if not noHats then
  hatsOn = not hatsOn
  if hatsOn then
    SetPedPropIndex(player, 0, myHats, sgTexture, 2)
    ShowNotification('Hat is on')
  else
    ClearPedProp(player, 0)
    ShowNotification('Hat is off')
  end
else
  ShowNotification('You are not wearing a hat')
end

end, false)

RegisterCommand('hat', function()
  TriggerEvent('hats')
end)

--Function to show the notification

function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
  end

  sg = false

  RegisterNetEvent( 'sung' )
AddEventHandler( 'sung', function()
	sg = not sg
	if(GetEntityModel(GetPlayerPed(-1)) == hwaycop) then
		if sg then
			SetPedPropIndex(GetPlayerPed(-1), 1, 0, 1, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 1)
		end
	elseif(GetEntityModel(GetPlayerPed(-1)) == cop) then
		if sg then
			SetPedPropIndex(GetPlayerPed(-1), 1, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 1)
		end
	elseif(GetEntityModel(GetPlayerPed(-1)) == sheriff) then
		if sg then
			SetPedPropIndex(GetPlayerPed(-1), 1, 1, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 1)
		end
	elseif(GetEntityModel(GetPlayerPed(-1)) == pilot) then
		if sg then
			SetPedPropIndex(GetPlayerPed(-1), 1, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 1)
		end
	elseif(GetEntityModel(GetPlayerPed(-1)) == medic) then
		if sg then
			SetPedPropIndex(GetPlayerPed(-1), 1, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 1)
		end
	end
end)