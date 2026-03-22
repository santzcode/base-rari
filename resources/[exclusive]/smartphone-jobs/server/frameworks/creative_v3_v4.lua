if config.framework ~= 'creative_v3' and config.framework ~= 'creative_v4' then
  return
end

load(LoadResourceFile('vrp', 'lib/utils.lua'))()
local Proxy = module('lib/Proxy')
local vRP = Proxy.getInterface('vRP')

API.getId = vRP.getUserId
API.getBank = vRP.getBank
API.addBank = vRP.addBank
function API.setBank(user_id, amount)
  local bank = API.getBank(user_id)
  local dif = math.abs(bank - amount)

  if amount < bank then
    vRP.delBank(user_id, dif)
  else
    vRP.addBank(user_id, dif)
  end
end
API.giveItem = vRP.giveInventoryItem
API.getIdentity = function(id)
  return vRP.getUserIdentity(id) or vRP.userIdentity(id)
end

API.prepare = vRP.prepare
API.query = vRP.query
API.execute = vRP.execute