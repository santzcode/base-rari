if config.framework ~= 'vrpex' then
  return
end

load(LoadResourceFile('vrp', 'lib/utils.lua'))()
local Proxy = module('lib/Proxy')
local vRP = Proxy.getInterface('vRP')

API.getId = vRP.getUserId
API.getBank = vRP.getBankMoney
API.addBank = vRP.giveBankMoney
API.setBank = vRP.setBankMoney
API.giveItem = vRP.giveInventoryItem
API.getIdentity = vRP.getUserIdentity

API.prepare = vRP.prepare
API.query = vRP.query
API.execute = vRP.execute