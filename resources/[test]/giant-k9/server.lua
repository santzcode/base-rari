local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
----------------------------------------
src = {}
Tunnel.bindInterface("giant-k9",src)
vRPclient = Tunnel.getInterface("vRP")

function src.SearchPeople(target)	
    local src = target
	local nuser_id = vRP.Passport(src)
    for i = 1, #Config.SearchableItems, 1 do
		if vRP.InventoryItemAmount(nuser_id,Config.SearchableItems[i])[1] >= 1 then
			TriggerClientEvent("Notify",source,"negado","O cachorro encontrou itens ilegais","vermelho",5000)
			return true
		else
			TriggerClientEvent("Notify",source,"negado","O cachorro não encontrou nenhum item ilegal","verde",5000)
			return false
		end
    end
end