NUI = {}

function NUI.Fire(event, data)
  SendNUIMessage({
    type = event,
    data = data
  })
end