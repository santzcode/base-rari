local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
API = {}

Tunnel.bindInterface("nation_bennys", API)

local using_bennys = {}

function API.checkPermission()
	local source = source

	print("Nation Bennys aberta!")

	return vRP.HasPermission(vRP.Passport(source), "EastCustoms") or vRP.HasPermission(vRP.Passport(source), "Redline")
end

function API.getSavedMods(vehicle_name, vehicle_plate)
	local vehicle_owner_id = vRP.PassportPlate(vehicle_plate)
	if not vehicle_owner_id then return end

	local getData = vRP.Query("entitydata/GetData", {
		dkey = "custom:" .. vehicle_owner_id.Passport .. ":" .. tostring(vehicle_name)
	})

	if vehicle_owner_id then
		if #getData > 0 then
			return json.decode(getData[1]["dvalue"])
		end

		return {}
	end
end

function API.checkPayment(amount)
	if not tonumber(amount) then
		return false
	end

	local source = source
	local user_id = vRP.Passport(source)

	if not vRP.PaymentFull(user_id, tonumber(amount)) then
		TriggerClientEvent("Notify", source, "cancel", "Negado", "Você não possui dinheiro suficiente.", "vermelho", 7000)

		return false
	end

	TriggerClientEvent("Notify", source, "check", "Sucesso", "Modificações aplicadas com sucesso Você pagou $" .. tonumber(amount) .. " dólares.", "verder", 7000)

	return true
end

function API.repairVehicle(vehicle, damage)
	TriggerEvent("tryreparar", vehicle)

	return true
end

function API.removeVehicle(vehicle)
	using_bennys[vehicle] = nil

	return true
end

function API.checkVehicle(vehicle)
	if using_bennys[vehicle] then
		return false
	end

	using_bennys[vehicle] = true

	return true
end

function API.saveVehicle(vehicle_name, vehicle_plate, vehicle_mods)
	local vehicle_owner_id = vRP.PassportPlate(vehicle_plate)

	if vehicle_owner_id then
		vRP.Query("entitydata/SetData", {
			dkey = "custom:" .. vehicle_owner_id.Passport .. ":" .. tostring(vehicle_name),
			dvalue = json.encode(vehicle_mods)
		})
	end

	return true
end

RegisterServerEvent("nation:syncApplyMods")
AddEventHandler("nation:syncApplyMods", function(vehicle_tuning, vehicle)
	TriggerClientEvent("nation:applymods_sync", -1, vehicle_tuning, vehicle)
end)
