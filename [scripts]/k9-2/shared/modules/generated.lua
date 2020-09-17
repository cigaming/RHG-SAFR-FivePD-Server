local isServer = IsDuplicityVersion()

if isServer then

else

  local illegalChance = 40
  local GeneratedModule = Module.New("GENERATED")
  ModuleManager:AddModule(GeneratedModule)

  function SearchTrunk(callback)
    callback(RandomChance(illegalChance))
  end

  function SearchGlovebox(callback)
    callback(RandomChance(illegalChance))
  end

  function RandomChance(percent)
    assert(percent >= 0 and percent <= 100)
    return percent >= math.random(1, 100)
  end

  GeneratedModule:AddFunction("SearchTrunk", SearchTrunk)
  GeneratedModule:AddFunction("SearchGlovebox", SearchGlovebox)

end