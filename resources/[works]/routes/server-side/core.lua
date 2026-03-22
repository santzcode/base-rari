-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Creative = {}
Tunnel.bindInterface("routes",Creative)
vCLIENT = Tunnel.getInterface("routes")
-----------------------------------------------------------------------------------------------------------------------------------------
-- COLLECT
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Collect(Service)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if Collect[Service] then
			local Itens = Collect[Service]["Items"]
			for Slot = 1, #Itens do
				-- local RandItem = math.random(#Itens)
				-- if math.random(100) <= Itens[RandItem]["Rand"] then
					-- local Item = Itens[RandItem]["Item"]
					-- local Amount = math.random(Itens[RandItem]["Min"], Itens[RandItem]["Max"])
					-- if (vRP.InventoryWeight(Passport) + (itemWeight(Item) * parseInt(Amount))) <= vRP.GetWeight(Passport) then
					-- 	vRP.GenerateItem(Passport,Item,Amount,true)
					-- 	return true
					-- else
					-- 	TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
					-- end
				-- end

				local weight = 0
				local items = {}
				for _,v in ipairs(Itens) do
					local Item = v["Item"]
					local Amount = math.random(v["Min"], v["Max"])
					weight = weight + (itemWeight(Item) * parseInt(Amount))

					items[#items + 1] = { item = Item, amount = Amount }
				end

				if not ((vRP.InventoryWeight(Passport) + weight) <= vRP.GetWeight(Passport)) then
					TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
					return false
				end

				for _,v in pairs(items) do
					vRP.GenerateItem(Passport,v.item,v.amount,true)
				end

				return true
			end
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELIVERY
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Delivery(Service)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if Delivery[Service] then
			local Itens = Delivery[Service]["Items"]
			for Slot = 1, #Itens do
				local RandItem = math.random(#Itens)
				if math.random(100) <= Itens[RandItem]["Rand"] then
					local Item = Itens[RandItem]["Item"]
					local Amount = math.random(Itens[RandItem]["Min"], Itens[RandItem]["Max"])
					if (vRP.InventoryWeight(Passport) + (itemWeight("dollars") * parseInt(Itens[RandItem]["Payment"]))) <= vRP.GetWeight(Passport) then
						if vRP.TakeItem(Passport,Item,Amount) then
							vRP.GenerateItem(Passport,"dollars",parseInt(Itens[RandItem]["Payment"] * Amount),true)
							return true
						else
							TriggerClientEvent("Notify",source,"amarelo","Precisa de <b>"..parseFormat(Amount).."x "..itemName(Item).."</b> para entregar.",5000)
						end
					else
						TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
					end
				end
			end
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Permission(Service)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Group = Service
		if Collect[Service] and Collect[Service]["Perm"] then
			Group = Collect[Service]["Perm"]
		elseif Delivery[Service] and Delivery[Service]["Perm"] then
			Group = Delivery[Service]["Perm"]
		end
		if vRP.HasGroup(Passport,Group) then
			return true
		end
	end
	return false
end
