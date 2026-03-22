RegisterNUICallback('GetPartners', function(data, cb)
  local result = vTunnel.GetPartners()
  if result then
    cb(result)
  else
    cb({})
  end
end)

RegisterNUICallback('NewPartner', function(data, cb)
    local result = vTunnel.addPartner(data)
    if result ~= nil then
        cb(result)
    else
        cb(false)
    end
end)

RegisterNUICallback('DeletePartner', function(data,cb)
    local result = vTunnel.deletePartner(data.partner)
    if result ~= nil then
        cb(result)
    else
        cb(false)
    end
end)