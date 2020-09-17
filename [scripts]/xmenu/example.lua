-- local menu = xMenu.New("MyMenuName")

-- local submenu = menu:BindSubMenu("SubMenuName")

-- menu:BindButton("ButtonName", function()
--   print("TRIGGERED!")
-- end)

-- menu:BindCheckbox("Checkbox", function(state)
--   print("STATE: " .. tostring(state))
-- end)

-- submenu:BindButton("ButtonName", function()
--   print("TRIGGERED!")
-- end)

-- submenu:BindList("ListHere", { "1", "2" }, function()
--   print("LIST CALLED!")
-- end)

-- Citizen.CreateThread(function()
--   while true do
--     Citizen.Wait(0)
--     if IsControlJustPressed(0, 121) then
--       if not menu:IsAnyMenuOpen() then
--         menu:OpenMenu()
--       end
--     end
--   end
-- end)