if config.framework ~= 'creative_v5' then
  return
end

load(LoadResourceFile('vrp', 'lib/utils.lua'))()
local Proxy = module('lib/Proxy')
local vRP = Proxy.getInterface('vRP')

API.getId = vRP.getUserId
API.getBank = vRP.getBank
API.addBank = function(id, amount) vRP.addBank(id, amount, 'Private') end
API.subBank = function(id, amount) vRP.delBank(id, amount, 'Private') end
API.giveItem = vRP.generateItem
API.getIdentity = vRP.userIdentity

API.prepare = vRP.prepare
API.query = vRP.query
API.execute = vRP.execute