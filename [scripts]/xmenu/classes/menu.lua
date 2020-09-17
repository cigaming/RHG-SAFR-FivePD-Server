xMenu = {}
xMenu.__index = xMenu

function xMenu.New(name)
  local newMenu = {}
  setmetatable(newMenu, xMenu)

  newMenu.Name = name
  newMenu.Resource = GetCurrentResourceName()
  newMenu.Handle = exports["xmenu"]:AddMenu(name, newMenu.Resource)

  return newMenu
end

function xMenu:IsAnyMenuOpen()
  return exports["xmenu"]:IsAnyMenuOpen()
end

function xMenu:OpenMenu()
  exports["xmenu"]:OpenMenu(self.Handle)
end

function xMenu:BindSubMenu(name)
  local newHandle = exports["xmenu"]:AddSubMenu(name, self.Handle, self.Resource)
  return xSubMenu.New(name, newHandle)
end

function xMenu:BindButton(name, callback)
  exports["xmenu"]:AddButton(name, self.Handle, callback, self.Resource)
end

function xMenu:BindCheckbox(name, callback)
  exports["xmenu"]:AddCheckbox(name, self.Handle, callback, self.Resource)
end

function xMenu:BindList(name, list, callback)
  exports["xmenu"]:AddList(name, self.Handle, list, callback, self.Resource)
end