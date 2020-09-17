Module = {}
Module.__index = Module

function Module.New(name)
  local newModule = {}
  setmetatable(newModule, Module)

  newModule.Name = name
  newModule.Functions = {}

  return newModule
end

function Module:AddFunction(name, func)
  self.Functions[name] = func
end

function Module:Fire(name, callback)
  print("NAME: " .. name)
  self.Functions[name](callback)
end