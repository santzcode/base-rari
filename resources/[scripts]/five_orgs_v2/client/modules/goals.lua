RegisterNUICallback('GetGoals', function(data, cb)
  -- {
  --   my = {
  --     {name = "sla", item = "sla", current = 10, max = 20}
  --   },
  --   members = {
  --     {name = "sla teste", id = 255, status = {1,1,2}}
  --   }
  -- }

  local result = vTunnel.GetGoalsFaction()
  if result then
    cb(result)
  else
    cb({my = {}, members = {}})
  end
end)

RegisterNUICallback('GetGoalsDetails', function(data, cb)
  local result = vTunnel.GetGoalsDetails()
  if result then
    cb(result)
  else
    cb({reward = 0, goalsCurrent = 0, goalsMax = 0, rewards = {}})
  end
end)

RegisterNUICallback('MyGoalsInfos', function(data, cb)
  local result = vTunnel.MyGoalsInfos()
  if result then
    cb(result)
  else
    cb({})
  end
end)

RegisterNUICallback('RedeemGoals', function(data, cb)
  local reward = vTunnel.rewardGoal()
  if reward then
  DeletarObjeto()
  SendNUIMessage({ action = 'close' })
  SetNuiFocus(false,false)
  end

  cb(reward)
end)

RegisterNUICallback('ClaimRewards', function(data, cb)
  local result = vTunnel.ClaimRewards(data.rewards)
  if result ~= nil then
    cb(result)
  else
    cb(false)
  end
end)

RegisterNUICallback('OpenChest', function(data, cb)
  -- Enviar mensagem para a interface NUI mostrar "Em construção"
  SendNUIMessage({ 
    action = 'ShowChestMessage', 
    data = { 
      message = "Em breve, ainda em construção",
      type = "construction"
    } 
  })
  cb(true)
end)

-- Função para abrir baú por target
function OpenChestByTarget()
  -- Enviar mensagem para a interface NUI mostrar "Em construção"
  SendNUIMessage({ 
    action = 'ShowChestMessage', 
    data = { 
      message = "Em breve, ainda em construção",
      type = "construction"
    } 
  })
end

-- Exportar função para uso externo
exports('OpenChestByTarget', OpenChestByTarget)

RegisterNUICallback('GetGoalsConfig', function(data, cb)
  local result = vTunnel.getListGoals()
  if result then
    cb(result)
  else
    cb({})
  end
end)
  
RegisterNUICallback('SaveGoalsConfig', function(data, cb)
  DeletarObjeto()
  SendNUIMessage({ action = 'close' })
  SetNuiFocus(false,false)

  local result = vTunnel.saveGoals(data)
  if result ~= nil then
    cb(result)
  else
    cb(false)
  end
end)

RegisterNUICallback('GetTotalRewardValue', function(data, cb)
  local result = vTunnel.GetTotalRewardValue()
  if result then
    cb(result)
  else
    cb(0)
  end
end)