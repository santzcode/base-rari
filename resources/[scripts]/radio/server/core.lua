-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
network = {}
Tunnel.bindInterface("radio",network)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESERVED
-----------------------------------------------------------------------------------------------------------------------------------------
local Reserved = {
	[911] = "Police",
	[911] = "Core",
	[912] = "Police",
	[912] = "Core",
	[913] = "Police",
	[913] = "Core",
	[914] = "Police",
	[914] = "Core",
	[915] = "Police",
	[915] = "Core",
	[916] = "Police",
	[916] = "Core",
	[917] = "Police",
	[917] = "Core",
	[918] = "Police",
	[918] = "Core",
	[919] = "Police",
	[919] = "Core",
	[920] = "Police",
	[920] = "Core",
	[112] = "Paramedic",
	[113] = "Paramedic",
	[114] = "Paramedic"
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- FREQUENCY
-----------------------------------------------------------------------------------------------------------------------------------------
function network.Frequency(Number)
	local source = source
	local Number = parseInt(Number)
	local Passport = vRP.Passport(source)
	if Passport then
		if Reserved[Number] then
			if vRP.HasService(Passport,Reserved[Number]) then
				return true
			else
				TriggerClientEvent("Notify",source,"amarelo","Você nao Tem Permissão para entrar nessa Rádio exclusiva para <b>"..Reserved[Number].."</b>.",5000)
			end
		else
			return true
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKRADIO
-----------------------------------------------------------------------------------------------------------------------------------------
function network.CheckRadio()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Consult = vRP.InventoryItemAmount(Passport,"radio")
		if Consult[1] <= 0 then
			return true
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- IDENTITY
-----------------------------------------------------------------------------------------------------------------------------------------
function network.Identity(OtherSource)
	local OtherPassport = vRP.Passport(OtherSource)
	if OtherPassport then
		local Identity = vRP.Identity(OtherPassport)
		if Identity then
			local Cargo = vRP.GetUserType(OtherPassport,"Policia") or vRP.GetUserType(OtherPassport,"Hospital") or vRP.GetUserType(OtherPassport,"Mecanica") or vRP.GetUserType(OtherPassport,"Gov")
			if not Cargo and vRP.HasGroup(OtherPassport,"Advogado") then
				Cargo = "Advogado"
			end
			local Tag = Cargo
			if Cargo == "Pmesp" then
				Tag = "PMESP"
			elseif Cargo == "Pcesp" then
				Tag = "PCESP"
			elseif Cargo == "Prf" then
				Tag = "PRF"
			elseif Cargo == "Baep" then
				Tag = "BAEP"
			elseif Cargo == "Exercito" then
				Tag = "EXERCITO"
			elseif Cargo == "Hospital" then
				Tag = "HOSPITAL"
			elseif Cargo == "Bombeiro" then
				Tag = "BOMBEIRO"
			-- elseif Cargo == "AutoSport" then
				-- Tag = "AUTOSPORT"
			elseif Cargo == "Redline" then
				Tag = "REDLINE"
			elseif Cargo == "EastCustoms" then
				Tag = "EASTCUSTOMS"
			elseif Cargo == "Advogado" then
				Tag = "ADVOGADO"
			end
			return { id = OtherPassport, name = (Identity["name"] or ""), name2 = (Identity["name2"] or ""), cargo = Tag }
		end
	end
	return nil
end
