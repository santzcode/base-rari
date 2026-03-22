CreateThread(function()
  if API.prepare then
    return
  end

  local framework = tostring(config and config.framework)

  print('A framework '..framework..' especificada na config.json nao existe')
  print('Insira uma framework valida, que exista na lista abaixo:')
  print('vrpex, creative_v3, creative_v4, creative_v5, creative_network')
end)