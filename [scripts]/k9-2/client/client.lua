-- Vars
local breeds = K9Overhaul.Configs.Breeds
local dog = K9.New()

-- Menu Ready Listener
RegisterNUICallback("k9_menu_ready", function()
  NUI.Fire("set_resource_name", { resource = GetCurrentResourceName() })
end)

-- Base Menu Code
local K9Menu = xMenu.New("K9")

-- Basic Actions
local K9Basic = K9Menu:BindSubMenu("Basic")

K9Basic:BindCheckbox("Spawn Toggle", function(state)
  if state then
    dog:Spawn()
  else
    dog:Despawn()
  end
end)

K9Basic:BindList("Breeds", breeds, function(selected)
  dog:SetNewK9({ model = selected })
end)

-- K9 Actions
local K9Actions = K9Menu:BindSubMenu("Actions")

K9Actions:BindButton("Follow", function()
  dog:Follow()
end)

K9Actions:BindButton("Stay", function()
  dog:Stay()
end)

K9Actions:BindButton("Attack", function()
  dog:Attack()
end)

K9Actions:BindButton("Search Trunk", function()
  dog:Search()
end)

K9Actions:BindButton("Enter Vehicle", function()
  dog:EnterVehicle(GetVehiclePedIsIn(PlayerPedId(), true))
end)

K9Actions:BindButton("Exit Vehicle", function()
  dog:ExitVehicle()
end)

-- K9 Animations
local K9Actions = K9Menu:BindSubMenu("Animations")

K9Actions:BindButton("Sit", function()
  dog:Sit()
end)

-- KEYBOARD CONTROLS
Utils.RegisterKeyMap("k9_follow", function()
  dog:Follow()
end, function() end, "K9 Following toggle", "keyboard", "g")

Utils.RegisterKeyMap("open_menu", function()
  if not K9Menu.Opened then
    K9Menu:OpenMenu()
  end
end, function() end, "Open the K9 menu", "keyboard", "{F2}")

Utils.RegisterKeyMap("k9_attack", function()
  dog:Attack()
end, function() end, "K9 Attack", "keyboard", "lmenu")