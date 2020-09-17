-- Found on: https://modit.store
-- ModFreakz Discord: https://discord.gg/4S7FcFs

local isOpen = false

function Start(timer, text, disableControls) 
  SendNUIMessage({
    message = "OpenUI",
    timer = timer,
    text = text
  })

  Opened()

  if disableControls then
    Citizen.CreateThread(function() DisableControls(timer,disableControls); end)
  end
end

function DisableControls(timer,controls)  
  local start = GetGameTimer()
  while (GetGameTimer() - start) < timer do
    for k,v in pairs(controls) do
      DisableControlAction(0,v,true)
    end
    Wait(0)
  end
  for k,v in pairs(controls) do
    DisableControlAction(0,v,false)
  end
end

function Close() 
  SendNUIMessage({
    message = "CloseUI",
  })

  Closed()
end

function Opened()
  isOpen = true
end

function Closed()
  isOpen = false
end

exports('StartProg',Start)
exports('CloseProg',Close)