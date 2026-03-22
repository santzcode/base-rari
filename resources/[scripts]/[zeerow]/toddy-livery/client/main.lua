RegisterNetEvent('toddy:livery',function(option)
  local ped = PlayerPedId()
  local vehicle = GetVehiclePedIsUsing(ped)

  if vehicle == 0 then
    print('Precisa estar dentro de um veiculo.')
    return
  end

  if not option then
    print('Use /plotagem info ou /plotagem [numero da plotagem]')
    return
  end

  if option == 'info' then
    local livery = GetVehicleLiveryCount(vehicle)
    print(('Quantidade de plotagem: %d'):format(livery))
    return
  end

  local number = tonumber(option)
  if not number then
    return
  end

  SetVehicleLivery(vehicle,number)
  print(('Setado a plotagem: %d'):format(number))
end)

-- /plotagem info
-- /plotagem 1