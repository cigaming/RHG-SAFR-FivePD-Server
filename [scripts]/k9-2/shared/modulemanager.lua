ModuleManager = {}
ModuleManager.LoadedModules = {}
ModuleManager.SelectedModule = K9Overhaul.Configs.Module

function ModuleManager:AddModule(module)
  local key = module.Name
  self.LoadedModules[key] = module
end

function ModuleManager:GetModule()
  return ModuleManager.LoadedModules[self.SelectedModule]
end