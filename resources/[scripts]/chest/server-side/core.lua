-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
GorzinDev = {}
Tunnel.bindInterface("chest",GorzinDev)
vKEYBOARD = Tunnel.getInterface("keyboard")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Open = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- HELPERS
-----------------------------------------------------------------------------------------------------------------------------------------
function itemName(Item)
	local Data = ItemList[Item] or ItemList[SplitOne(Item)]
	if Data and Data["Name"] then return Data["Name"] end
	return "Unknown"
end

function itemWeight(Item)
	local Data = ItemList[Item] or ItemList[SplitOne(Item)]
	if Data and Data["Weight"] then return Data["Weight"] end
	return 0
end

function itemIndex(Item)
	local Data = ItemList[Item] or ItemList[SplitOne(Item)]
	if Data and Data["Index"] then return Data["Index"] end
	return Item
end

function itemMaxAmount(Item)
	local Data = ItemList[Item] or ItemList[SplitOne(Item)]
	if Data and Data["Max"] then return Data["Max"] end
	return 200
end

function itemDescription(Item)
	local Data = ItemList[Item] or ItemList[SplitOne(Item)]
	if Data and Data["Description"] then return Data["Description"] end
	return ""
end

function itemEconomy(Item)
	local Data = ItemList[Item] or ItemList[SplitOne(Item)]
	if Data and Data["Economy"] then return Data["Economy"] end
	return 0
end

function itemDurability(Item)
	local Data = ItemList[Item] or ItemList[SplitOne(Item)]
	if Data and Data["Durability"] then return Data["Durability"] end
	return nil
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VERIFY
-----------------------------------------------------------------------------------------------------------------------------------------
function GorzinDev.Verify()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.GetFine(Passport) > 0 then
			TriggerClientEvent("Notify",source,"amarelo","Você possui multas pendentes.",10000)
			return false
		end

		if exports["hud"]:Wanted(Passport,source) and exports["hud"]:Reposed(Passport) then
			return false
		end
	end

	return true
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PERMISSIONS
-----------------------------------------------------------------------------------------------------------------------------------------
function GorzinDev.Permissions(Name,Mode)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not exports["hud"]:Wanted(Passport) then
		if Mode == "Personal" then
			Open[Passport] = { ["Name"] = Passport, ["Weight"] = 50, ["Logs"] = false, ["Save"] = true }
			return true
		elseif Mode == "Evidences" and vRP.HasGroup(Passport,"Police") then
			local Keyboard = vKEYBOARD.keySingle(source,"Passaporte:")
			if Keyboard then
				Open[Passport] = { ["Name"] = "Evidences:"..Keyboard[1], ["Weight"] = 50, ["Logs"] = false, ["Save"] = true }
				return true
			end
		elseif Mode == "Custom" then
			Open[Passport] = { ["Name"] = Name, ["Weight"] = 50, ["Logs"] = false, ["Save"] = false }
			return true
		elseif Mode == "Manager" then
			if vRP.HasGroup(Passport,Name,2) then
			    Open[Passport] = { ["Name"] = "Manager:"..Name, ["Weight"] = 1000, ["Logs"] = true, ["Save"] = true }
			    return true
			end
		elseif Mode == "Tray" then
			Open[Passport] = { ["Name"] = Name, ["Weight"] = 15, ["Logs"] = false, ["Save"] = true }
			return true
		elseif Mode == "Trash" or Mode == "Lixo" then
			Open[Passport] = { ["Name"] = Name, ["Weight"] = 15, ["Logs"] = false, ["Save"] = true }
			return true
		elseif Mode == "Safe" or Mode == "Cofre" then
			Open[Passport] = { ["Name"] = Name, ["Weight"] = 50, ["Logs"] = false, ["Save"] = true }
			return true
		elseif Mode == "Vending" then
			Open[Passport] = { ["Name"] = Name, ["Weight"] = 50, ["Logs"] = false, ["Save"] = true }
			return true
		elseif Mode == "Vault" then
			Open[Passport] = { ["Name"] = Name, ["Weight"] = 200, ["Logs"] = true, ["Save"] = true }
			return true
		elseif Mode == "Warehouse" then
			local Number = tonumber(Name)
			local Consult = vRP.Query("warehouse/Informations",{ Number = Number })
			if Consult[1] then
				if Consult[1]["Passport"] ~= Passport then
					local Keyboard = vKEYBOARD.Password(source,"Senha")
					if Keyboard then
						local Warehouse = vRP.Query("warehouse/Acess",{ Number = Number, Password = Keyboard[1] })
						if not Warehouse[1] then
							TriggerClientEvent("Notify",source,"vermelho","Senha incorreta.",5000,"Erro") 
							return false
						end
					else
						return false
					end
				end
				if Consult[1]["Tax"] < os.time() then
					if vRP.Request(source,"Armazém","Deseja efetuar o pagamento do aluguel de <b>R$75.000</b>?") then
						if vRP.PaymentFull(Passport,75000) then
							vRP.Query("warehouse/Tax",{ Number = Number })
						else
							return false
						end
					else
						return false
					end
				end
			else
				if vRP.Request(source,"Armazém","Gostaria de comprar o armazém por <b>R$500.000</b> Reais?") then
					local Keyboard = vKEYBOARD.Password(source,"Senha")
					if Keyboard then
						local Password = sanitizeString(Keyboard[1],"0123456789",true)
						if string.len(Password) >= 4 and string.len(Password) <= 20 then
							if vRP.PaymentFull(Passport,500000) then
								local Warehouses = GlobalState["Warehouses"]
								Warehouses[Number] = true
								GlobalState:set("Warehouses",Warehouses,true)
								exports["bank"]:AddTaxs(Passport,"Armazém",500000,"Compra de armazém.")
								vRP.Query("warehouse/Buy",{ Number = Number, Passport = Passport, Password = Password })
								TriggerClientEvent("sounds:Private",source,"cash",0.1)
							end
						else
							TriggerClientEvent("Notify",source,"amarelo","Necessário possuir entre <b>4</b> e <b>20</b> números.",5000,"Aviso")
							return false
						end
					else
						return false
					end
				else
					return false
				end
			end

			Open[Passport] = { ["Name"] = Mode..":"..Name, ["Weight"] = 2500, ["Logs"] = true, ["Save"] = true }

			return true
		else
			local Consult = exports.oxmysql:query_async('SELECT * FROM chests WHERE Name = ?',{Name})
			if not Consult[1] then
				vRP.Query("chests/AddChests",{ Name = Name })
				Consult = exports.oxmysql:query_async('SELECT * FROM chests WHERE Name = ?',{Name})
			end

			if not Consult[1] then return false end

			if Consult[1] and vRP.HasGroup(Passport,Consult[1]["Permission"]) then
				Open[Passport] = { ["Name"] = Name, ["Weight"] = Consult[1]["Weight"], ["Logs"] = Consult[1]["Logs"], ["Save"] = true }
				return true
			end
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST
-----------------------------------------------------------------------------------------------------------------------------------------
function GorzinDev.Chest()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Open[Passport] then
		local Inventory = {}
		local Inv = vRP.Inventory(Passport)
		for Index,v in pairs(Inv) do
			v["amount"] = parseInt(v["amount"])
			v["name"] = itemName(v["item"])
			v["peso"] = itemWeight(v["item"])
			v["index"] = itemIndex(v["item"])
			v["max"] = itemMaxAmount(v["item"])
			v["desc"] = itemDescription(v["item"])
			v["economy"] = parseFormat(itemEconomy(v["item"]))
			v["key"] = v["item"]
			v["slot"] = Index

			local Split = splitString(v["item"],"-")
			if Split[2] ~= nil then
				if itemDurability(v["item"]) then
					v["durability"] = parseInt(os.time() - Split[2])
					v["days"] = itemDurability(v["item"])
				else
					v["durability"] = 0
					v["days"] = 1
				end
			else
				v["durability"] = 0
				v["days"] = 1
			end

			Inventory[Index] = v
		end

		local Chest = {}
		local Result = vRP.GetSrvData("Chest:"..Open[Passport]["Name"],Open[Passport]["Save"])
		for Index,v in pairs(Result) do
			v["amount"] = parseInt(v["amount"])
			v["name"] = itemName(v["item"])
			v["peso"] = itemWeight(v["item"])
			v["index"] = itemIndex(v["item"])
			v["max"] = itemMaxAmount(v["item"])
			v["economy"] = parseFormat(itemEconomy(v["item"]))
			v["desc"] = itemDescription(v["item"])
			v["key"] = v["item"]
			v["slot"] = Index

			local Split = splitString(v["item"],"-")
			if Split[2] ~= nil then
				if itemDurability(v["item"]) then
					v["durability"] = parseInt(os.time() - Split[2])
					v["days"] = itemDurability(v["item"])
				else
					v["durability"] = 0
					v["days"] = 1
				end
			else
				v["durability"] = 0
				v["days"] = 1
			end

			Chest[Index] = v
		end

		return Inventory,Chest,vRP.InventoryWeight(Passport),vRP.GetWeight(Passport),vRP.ChestWeight(Result),Open[Passport]["Weight"]
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- OPENITENS
-----------------------------------------------------------------------------------------------------------------------------------------
local OpenItens = {
	["mechanicpass"] = {
		["Open"] = "Mechanic",
		["Table"] = {
			{ ["Item"] = "advtoolbox", ["Amount"] = 1 },
			{ ["Item"] = "toolbox", ["Amount"] = 2 },
			{ ["Item"] = "tyres", ["Amount"] = 4 },
			{ ["Item"] = "dollars", ["Amount"] = 200 }
		}
	},
	["uwucoffeepass"] = {
		["Open"] = "UwuCoffee",
		["Table"] = {
			{ ["Item"] = "nigirizushi", ["Amount"] = 3 },
			{ ["Item"] = "sushi", ["Amount"] = 3 },
			{ ["Item"] = "dollars", ["Amount"] = 200 }
		}
	},
	["pizzathispass"] = {
		["Open"] = "PizzaThis",
		["Table"] = {
			{ ["Item"] = "nigirizushi", ["Amount"] = 3 },
			{ ["Item"] = "sushi", ["Amount"] = 3 },
			{ ["Item"] = "dollars", ["Amount"] = 200 }
		}
	},
	["burgershotpass"] = {
		["Open"] = "BurgerShot",
		["Table"] = {
			{ ["Item"] = "hamburger2", ["Amount"] = 1 },
			{ ["Item"] = "cookedmeat", ["Amount"] = 2 },
			{ ["Item"] = "cookedfishfillet", ["Amount"] = 1 },
			{ ["Item"] = "dollars", ["Amount"] = 200 }
		}
	},
	["paramedicpass"] = {
		["Open"] = "Paramedic",
		["Table"] = {
			{ ["Item"] = "gauze", ["Amount"] = 3 },
			{ ["Item"] = "medkit", ["Amount"] = 1 },
			{ ["Item"] = "analgesic", ["Amount"] = 4 },
			{ ["Item"] = "dollars", ["Amount"] = 200 }
		}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- STORE
-----------------------------------------------------------------------------------------------------------------------------------------
function GorzinDev.Store(Item,Slot,Amount,Target)
	local source = source
	local Amount = parseInt(Amount)
	local Passport = vRP.Passport(source)
	if Passport and Open[Passport] then
		if Amount <= 0 then Amount = 1 end

		if BlockChest(Item) then
			TriggerClientEvent("chest:Update",source,"Refresh")
			return true
		end

		if OpenItens[Item] and OpenItens[Item]["Open"] == Open[Passport]["Name"] then
			if vRP.TakeItem(Passport,Item,1) then
				for _,v in pairs(OpenItens[Item]["Table"]) do
					vRP.GenerateItem(Passport,v["Item"],v["Amount"])
				end
			end

			TriggerClientEvent("chest:Update",source,"Refresh")
			return true
		end

		vRP.StoreChest(Passport,"Chest:"..Open[Passport]["Name"],Amount,Slot,Target,Open[Passport]["Weight"],Open[Passport]["Logs"])
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKE
-----------------------------------------------------------------------------------------------------------------------------------------
function GorzinDev.Take(Item,Slot,Amount,Target)
	local source = source
	local Amount = parseInt(Amount)
	local Passport = vRP.Passport(source)
	if Passport and Open[Passport] then
		if Amount <= 0 then Amount = 1 end

		vRP.TakeChest(Passport,"Chest:"..Open[Passport]["Name"],Amount,Slot,Target,Open[Passport]["Weight"],Open[Passport]["Logs"])

		if string.sub(Open[Passport]["Name"],1,9) == "Helicrash" then
			local Result = vRP.GetSrvData("Chest:"..Open[Passport]["Name"],Open[Passport]["Save"])
			if vRP.ChestWeight(Result) <= 0 then
				TriggerClientEvent("chest:Close",source)
				exports["helicrash"]:Box()
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
function GorzinDev.Update(Slot,Target,Amount)
	local source = source
	local Amount = parseInt(Amount)
	local Passport = vRP.Passport(source)
	if Passport and Open[Passport] then
		if Amount <= 0 then Amount = 1 end

		if vRP.UpdateChest(Passport,"Chest:"..Open[Passport]["Name"],Slot,Target,Amount) then
			TriggerClientEvent("chest:Update",source,"Refresh")
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST:UPGRADE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("chest:Upgrade")
AddEventHandler("chest:Upgrade",function(Name)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasService(Passport,Name) then
			if vRP.Request(source,"Aumentar <b>10Kg</b> por <b>$5.000</b> dólares?","Sim, efetuar pagamento","Não, decido depois") then
				if vRP.PaymentFull(Passport,5000) then
					vRP.Query("chests/UpdateWeight",{ Name = Name, Multiplier = 1 })
					TriggerClientEvent("Notify",source,"verde","Compra concluída.",3000)
				else
					TriggerClientEvent("Notify",source,"vermelho","<b>Dólares</b> insuficientes.",5000)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect",function(Passport)
	if Open[Passport] then
		Open[Passport] = nil
	end
end)