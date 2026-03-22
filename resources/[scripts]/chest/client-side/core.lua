-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vSERVER = Tunnel.getInterface("chest")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHESTS
-----------------------------------------------------------------------------------------------------------------------------------------
local Chests = {

	{ ["Name"] = "Pcesp-2", ["Coords"] = vec3(429.95,-1016.36,29.52), ["Weight"] = 5000, ["Slots"] = 2000, ["Permission"] = "Pcesp", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Pcesp", ["Coords"] = vec3(433.11,-1016.33,29.52), ["Weight"] = 10000, ["Slots"] = 2000, ["Permission"] = "Pcesp", ["Logs"] = true, ["Mode"] = "2" },
	-- Policia Militar
	{ ["Name"] = "Pmesp-2", ["Coords"] = vec3(561.66,7.98,69.35), ["Weight"] = 5000, ["Slots"] = 2000, ["Permission"] = "Pmesp", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Pmesp", ["Coords"] = vec3(560.8,5.15,69.35), ["Weight"] = 10000, ["Slots"] = 2000, ["Permission"] = "Pmesp", ["Logs"] = true, ["Mode"] = "2" },
	-- Batalhão Rota
	{ ["Name"] = "1BPChq-2", ["Coords"] = vec3(338.55,-1569.77,29.57), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "1BPChq", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "1BPChq", ["Coords"] = vec3(342.26,-1564.49,29.57), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "1BPChq", ["Logs"] = true, ["Mode"] = "2" },
	-- Batalhão Anchieta
	{ ["Name"] = "2BPChq", ["Coords"] = vec3(-571.64,-2351.41,16.07), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "2BPChq", ["Logs"] = true, ["Mode"] = "2" },
	-- Batalhão Prf
	{ ["Name"] = "Prf-2", ["Coords"] = vec3(2614.67,5323.82,47.57), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "1BPChq", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Prf", ["Coords"] = vec3(2609.07,5344.5,47.57), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "1BPChq", ["Logs"] = true, ["Mode"] = "2" },
	-- Hospital
	{ ["Name"] = "Hospital", ["Coords"] = vec3(342.4,-572.18,48.16), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Paramedic", ["Logs"] = true, ["Mode"] = "2" },
	-- Fastfood
	{ ["Name"] = "McDonalds", ["Coords"] = vec3(89.82,296.77,110.2), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "McDonalds", ["Logs"] = true, ["Mode"] = "2" },
	-- Mecanica
	-- { ["Name"] = "AutoSport-2", ["Coords"] = vec3(-1304.9,-297.78,40.73), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "AutoSport", ["Logs"] = true, ["Mode"] = "2" },
	-- { ["Name"] = "AutoSport", ["Coords"] = vec3(-2041.62,-519.69,12.13), ["Weight"] = 5000, ["Slots"] = 2000, ["Permission"] = "AutoSport", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "EastCustoms-2", ["Coords"] = vec3(886.16,-2097.45,34.88), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "EastCustoms", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "EastCustoms", ["Coords"] = vec3(898.42,-2099.94,34.88), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "EastCustoms", ["Logs"] = true, ["Mode"] = "2" },
	-- Armamento
	{ ["Name"] = "Hotel", ["Coords"] = vec3(387.66,-9.91,86.68), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Hotel", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Hotel-2", ["Coords"] = vec3(409.38,0.37,84.92), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Weapons2", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Fazenda-2", ["Coords"] = vec3(1391.52,1158.85,114.33), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Hotel", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Fazenda", ["Coords"] = vec3(1400.02,1139.68,114.33), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Weapons2", ["Logs"] = true, ["Mode"] = "2" },
	-- Munição
	{ ["Name"] = "Vinhedo-2", ["Coords"] = vec3(-1884.38,2070.1,145.57), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Ammos", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Vinhedo", ["Coords"] = vec3(-1886.43,2062.32,140.98), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Ammos", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Playboy-2", ["Coords"] = vec3(-1519.78,115.67,50.04), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Ammos2", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Playboy", ["Coords"] = vec3(-1511.15,102.2,52.23), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Ammos2", ["Logs"] = true, ["Mode"] = "2" },
	-- Contrabando
	{ ["Name"] = "Motoclube-2", ["Coords"] = vec3(988.73,-138.11,74.07), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Smuggling", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Motoclube", ["Coords"] = vec3(996.6,-122.07,74.05), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Smuggling", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Porto-2", ["Coords"] = vec3(344.18,-2708.78,1.7), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Smuggling2", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Porto", ["Coords"] = vec3(346.28,-2730.65,1.70), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Smuggling2", ["Logs"] = true, ["Mode"] = "2" },
	-- Lavagem
	{ ["Name"] = "Vanilla-2", ["Coords"] = vec3(93.67,-1290.52,29.27), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "MoneyLaundry", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Vanilla", ["Coords"] = vec3(106.45,-1299.13,28.76), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "MoneyLaundry", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Bahamas-2", ["Coords"] = vec3(-1369.46,-624.58,30.8), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "MoneyLaundry2", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Bahamas", ["Coords"] = vec3(-1368.93,-613.83,30.31), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "MoneyLaundry2", ["Logs"] = true, ["Mode"] = "2" },
	-- Desmanche
	{ ["Name"] = "Harmony-2", ["Coords"] = vec3(1187.28,2635.27,38.4), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "MoneyLaundry", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Harmony", ["Coords"] = vec3(1172.73,2635.26,37.78), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "MoneyLaundry", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Beekers-2", ["Coords"] = vec3(98.26,6621.55,32.44), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "MoneyLaundry2", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Beekers", ["Coords"] = vec3(108.72,6631.76,31.78), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "MoneyLaundry2", ["Logs"] = true, ["Mode"] = "2" },
	-- Favelas
	-- { ["Name"] = "China", ["Coords"] = vec3(1245.06,-172.62,90.72), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "China", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Escocia", ["Coords"] = vec3(1343.4,-2525.52,55.01), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Escocia", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Turquia", ["Coords"] = vec3( 1526.64,-640.68,146.0), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Turquia", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Croacia", ["Coords"] = vec3(2128.42,-67.55,255.21), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Croacia", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Franca", ["Coords"] = vec3(-2364.43,1747.8,215.48), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Franca", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Israel", ["Coords"] = vec3(-1565.53,308.56,77.68), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Israel", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Brasilandia", ["Coords"] = vec3(-416.0,1532.09,398.87), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Brasilandia", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Suecia", ["Coords"] = vec3(1614.69,457.14,257.25), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Suecia", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Pcc", ["Coords"] = vec3(694.83,1264.05,355.41), ["Weight"] = 50000, ["Slots"] = 2000, ["Permission"] = "Pcc", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Cidadelíder", ["Coords"] = vec3(-1578.8,2878.41,33.67), ["Weight"] = 20000, ["Slots"] = 2000, ["Permission"] = "Cidadelíder", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Cidadelíder2", ["Coords"] = vec3(-1575.42,2975.62,43.37), ["Weight"] = 20000, ["Slots"] = 2000, ["Permission"] = "Cidadelíder", ["Logs"] = true, ["Mode"] = "2" },

	{ ["Name"] = "Makiavel", ["Coords"] = vec3(2226.65,5114.85,50.67), ["Weight"] = 20000, ["Slots"] = 2000, ["Permission"] = "Makiavel", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Makiavel2", ["Coords"] = vec3(2216.54,5115.16,50.67), ["Weight"] = 20000, ["Slots"] = 2000, ["Permission"] = "Makiavel", ["Logs"] = true, ["Mode"] = "2" },

	{ ["Name"] = "Capaoredondo", ["Coords"] = vec3(-1719.58,620.44,181.52), ["Weight"] = 20000, ["Slots"] = 2000, ["Permission"] = "Capaoredondo", ["Logs"] = true, ["Mode"] = "2" }, -- MODICAR PERMISSÃO ( FACÇÃO DE DROGAS )
	{ ["Name"] = "Capaoredondo2", ["Coords"] = vec3(-1711.7,619.15,181.52), ["Weight"] = 20000, ["Slots"] = 2000, ["Permission"] = "Capaoredondo", ["Logs"] = true, ["Mode"] = "2" }, -- MODICAR PERMISSÃO ( FACÇÃO DE DROGAS )

	{ ["Name"] = "Cumbica", ["Coords"] = vec3(1039.94,652.45,161.35), ["Weight"] = 20000, ["Slots"] = 2000, ["Permission"] = "Cumbica", ["Logs"] = true, ["Mode"] = "2" }, -- MODICAR PERMISSÃO ( FACÇÃO DE DROGAS )
	{ ["Name"] = "Cumbica2", ["Coords"] = vec3(037.44,653.4,161.35), ["Weight"] = 20000, ["Slots"] = 2000, ["Permission"] = "Cumbica", ["Logs"] = true, ["Mode"] = "2" }, -- MODICAR PERMISSÃO ( FACÇÃO DE DROGAS )

	{ ["Name"] = "Bololo", ["Coords"] = vec3(288.97,-695.7,30.5), ["Weight"] = 20000, ["Slots"] = 2000, ["Permission"] = "Bololo", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Bololo2", ["Coords"] = vec3(286.86,-693.08,34.36), ["Weight"] = 20000, ["Slots"] = 2000, ["Permission"] = "Bololo", ["Logs"] = true, ["Mode"] = "2" },

	-- { ["Name"] = "CidadeLider", ["Coords"] = vec3(1340.52,-747.36,71.12), ["Weight"] = 20000, ["Slots"] = 2000, ["Permission"] = "CidadeLider", ["Logs"] = true, ["Mode"] = "2" },
	-- { ["Name"] = "CidadeLider2", ["Coords"] = vec3(1337.98,-744.4,71.12), ["Weight"] = 20000, ["Slots"] = 2000, ["Permission"] = "CidadeLider", ["Logs"] = true, ["Mode"] = "2" },

	{ ["Name"] = "Exercito", ["Coords"] = vec3(-1757.93,3177.54,32.91), ["Weight"] = 10000, ["Slots"] = 2000, ["Permission"] = "Exercito", ["Logs"] = true, ["Mode"] = "2" },

	{ ["Name"] = "Teste", ["Coords"] = vec3(-1772.94,-119.09,89.1), ["Weight"] = 10000, ["Slots"] = 2000, ["Permission"] = "Admin", ["Logs"] = true, ["Mode"] = "3" },


	{ ["Name"] = "Cidadetiradentes", ["Coords"] = vec3(109.61,1340.62,283.85), ["Weight"] = 10000, ["Slots"] = 2000, ["Permission"] = "Cidadetiradentes", ["Logs"] = true, ["Mode"] = "3" },
	{ ["Name"] = "Capaoredondo", ["Coords"] = vec3(-1771.8,-117.86,95.4), ["Weight"] = 10000, ["Slots"] = 2000, ["Permission"] = "Capaoredondo", ["Logs"] = true, ["Mode"] = "3" },
	{ ["Name"] = "China", ["Coords"] = vec3(-49.79,2684.04,75.23), ["Weight"] = 10000, ["Slots"] = 2000, ["Permission"] = "China", ["Logs"] = true, ["Mode"] = "3" },
	{ ["Name"] = "Makiavel", ["Coords"] = vec3(2224.53,5105.78,50.67), ["Weight"] = 10000, ["Slots"] = 2000, ["Permission"] = "Makiavel", ["Logs"] = true, ["Mode"] = "3" },
	{ ["Name"] = "Beekers", ["Coords"] = vec3(2246.7,4250.92,40.42), ["Weight"] = 10000, ["Slots"] = 2000, ["Permission"] = "Beekers", ["Logs"] = true, ["Mode"] = "3" },
	{ ["Name"] = "Vaticano", ["Coords"] = vec3(-1866.96,2061.24,135.44), ["Weight"] = 10000, ["Slots"] = 2000, ["Permission"] = "Vaticano", ["Logs"] = true, ["Mode"] = "3" },
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- LABELS
-----------------------------------------------------------------------------------------------------------------------------------------
local Labels = {
	["1"] = {
		{
			event = "chest:Open",
			label = "Compartimento Geral",
			tunnel = "shop",
			service = "Normal"
		},{
			event = "chest:Open",
			label = "Compartimento Pessoal",
			tunnel = "shop",
			service = "Personal"
		},{
			event = "chest:Open",
			label = "Compartimento Evidências",
			tunnel = "shop",
			service = "Evidences"
		},{
			event = "chest:Upgrade",
			label = "Aumentar",
			tunnel = "server"
		}
	},
	["2"] = {
		{
			event = "chest:Open",
			label = "Abrir",
			tunnel = "shop",
			service = "Normal"
		},{
			event = "chest:Upgrade",
			label = "Aumentar",
			tunnel = "server"
		}
	},
	["3"] = {
		{
			event = "chest:Open",
			label = "Abrir",
			tunnel = "shop",
			service = "Normal"
		},{
			event = "chest:Upgrade",
			label = "Aumentar",
			tunnel = "server"
		},{
			event = "chest:Open",
			label = "Bau Lider",
			tunnel = "shop",
			service = "Manager"
		}
	},
	["4"] = {
		{
			event = "chest:Open",
			label = "Bandeja",
			tunnel = "shop",
			service = "Tray"
		}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADINIT
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	for Name,v in pairs(Chests) do
		exports["target"]:AddCircleZone("Chest:"..Name,v["Coords"],1.0,{
			name = "Chest:"..Name,
			heading = 3374176
		},{
			Distance = 1.5,
			shop = v["Name"],
			options = Labels[v["Mode"]]
		})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST:OPEN
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("chest:Open",function(Name,Init)
	local ChestName = Name
	local Service = Init

	if type(Name) == "table" then
		if Name["shop"] then
			ChestName = Name["shop"]
			Service = Name["service"]
		elseif Name[4] and type(Name[4]) == "vector3" then
			local x = math.floor(Name[4].x)
			local y = math.floor(Name[4].y)
			local z = math.floor(Name[4].z)
			ChestName = tostring(Init or "Chest")..":"..tostring(x)..":"..tostring(y)..":"..tostring(z)
		else
			ChestName = tostring(Init or "Unknown")
		end
	end

	if vSERVER.Permissions(ChestName,Service) then
		SetNuiFocus(true,true)
		SendNUIMessage({ Action = "Open" })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST:UPGRADE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("chest:Upgrade",function(Name)
	if type(Name) == "table" then
		Name = Name["shop"]
	end

	TriggerServerEvent("chest:Upgrade",Name)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHESTCLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Close",function(Data,Callback)
	SendNUIMessage({ Action = "Close" })
	SetNuiFocus(false,false)

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Take",function(Data,Callback)
	vSERVER.Take(Data["item"],Data["slot"],Data["amount"],Data["target"])

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STORE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Store",function(Data,Callback)
	vSERVER.Store(Data["item"],Data["slot"],Data["amount"],Data["target"])

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Update",function(Data,Callback)
	vSERVER.Update(Data["slot"],Data["target"],Data["amount"])

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Chest",function(Data,Callback)
	local Inventory,Chest,invPeso,invMaxpeso,chestPeso,chestMaxpeso = vSERVER.Chest()
	if Inventory then
		Callback({ Inventory = Inventory, Chest = Chest, invPeso = invPeso, invMaxpeso = invMaxpeso, chestPeso = chestPeso, chestMaxpeso = chestMaxpeso })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST:UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("chest:Update")
AddEventHandler("chest:Update",function(Action,invPeso,invMaxpeso,chestPeso,chestMaxpeso)
	SendNUIMessage({ Action = Action, invPeso = invPeso, invMaxpeso = invMaxpeso, chestPeso = chestPeso, chestMaxpeso = chestMaxpeso })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST:CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("chest:Close")
AddEventHandler("chest:Close",function(Action)
	SendNUIMessage({ Action = "Close" })
	SetNuiFocus(false,false)
end)