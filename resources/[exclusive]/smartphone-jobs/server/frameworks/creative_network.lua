if config.framework ~= 'creative_network' then
  return
end

load(LoadResourceFile('vrp', 'lib/Utils.lua'))()
local Proxy = module('lib/Proxy')
local vRP = Proxy.getInterface('vRP')

API.getId = vRP.Passport
API.getBank = function(id)
  local id = vRP.Identity(id)
  assert(id, 'Jogador com identidade nula: '..tostring(id))
  return id.Bank or id.bank
end
API.addBank = function(id, amount) vRP.GiveBank(id, amount) end
API.subBank = function(id, amount) vRP.RemoveBank(id, amount) end
API.giveItem = vRP.GenerateItem
API.getIdentity = vRP.Identity

local __prepares = {}
function API.prepare(name, query)
  __prepares[name] = query
end

function API.query(name, args)
  local code = __prepares[name]
  return exports.oxmysql:querySync(code, args)
end

API.execute = API.query