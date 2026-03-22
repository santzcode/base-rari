local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPC = Tunnel.getInterface("vRP")

fclient = Tunnel.getInterface("nation_skinshop")
func = {}
Tunnel.bindInterface("nation_skinshop", func)


---------------------------------------------------------------------------
-----------------------VERIFICAÇÃO DE PERMISSÃO--------------------------
---------------------------------------------------------------------------


function func.checkPermission(permission)
    local source = source
    local user_id = vRP.Passport(source)
    if type(permission) == "table" then
        for i, perm in pairs(permission) do
            if vRP.HasGroup(user_id, perm) then
                return true
            end
        end
        return false
    end
    return vRP.HasGroup(user_id, permission)
end



---------------------------------------------------------------------------
-----------------------VERIFICAÇÃO DE PAGAMENTO--------------------------
---------------------------------------------------------------------------


function func.tryPayClothes(value)
    local source = source
    local user_id = vRP.Passport(source)
    if value >= 0 then
        return vRP.PaymentFull(user_id, value) or value == 0
    end
    return false
end

--------- CREATIVE V3 ------------


function func.tryPayClothes(value)
    local source = source
    local user_id = vRP.Passport(source)
    if value >= 0 then
        if vRP.PaymentFull(user_id, value) or value == 0 then
            local clothes = fclient.getCloths(source)
            vRP.Query("playerdata/SetData",{ Passport = user_id, dkey = "Clothings", dvalue = json.encode(clothes) })
            return true
        end
    end
    return false
end

function func.updateClothes()
    local source = source
    local user_id = vRP.Passport(source)
    local clothes = fclient.getCloths(source)
   if user_id then
        vRP.Query("playerdata/SetData",{ Passport = user_id, dkey = "Clothings", dvalue = json.encode(clothes) })
   end
end

RegisterServerEvent("skinshop:Send",function()
	local source = source
	local Passport = vRP.Passport(source)

	if not Passport then
		return
	end

	local OtherSource = vRPC.ClosestPed(source)
	if not OtherSource or vRP.GetHealth(OtherSource) <= 100 then
		return
	end

	if vRP.ModelPlayer(source) ~= vRP.ModelPlayer(OtherSource) then
		TriggerClientEvent("Notify",source,"Aviso","Vestimentas recusada.","amarelo",5000)
		return
	end

	if vRP.Request(OtherSource,false,"Aceitar vestimentas de <b>"..vRP.FullName(Passport).."</b>?") then
		TriggerClientEvent("Notify",source,"Sucesso","Vestimentas enviada.","verde",5000)
		TriggerClientEvent("skinshop:Apply",OtherSource,vRP.UserData(Passport,"Clothings"),true)
	else
		TriggerClientEvent("Notify",source,"Aviso","Vestimentas recusada.","amarelo",5000)
	end
end)

RegisterServerEvent("skinshop:Remove",function(Mode)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local ClosestPed = vRPC.ClosestPed(source)
		if ClosestPed and vRP.HasService(Passport,"Emergencia") then
			TriggerClientEvent("skinshop:set"..Mode,ClosestPed)
		end
	end
end)