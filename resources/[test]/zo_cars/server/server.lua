
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
src = {}
Tunnel.bindInterface("zo_cars", src)
vCLIENT = Tunnel.getInterface("zo_cars")
function src.checkPermission()
    local user_id = vRP.Passport(source)
    if cfg.permissaoParaInstalar.existePermissao then
        for k, group in pairs(cfg.permissaoParaInstalar.permissoes) do
                if vRP.HasGroup(user_id, group) then
                    return true
            end
        end
    else
        return true
    end
    return false
end
function src.checkPermissionShop(perm)
    local user_id = vRP.Passport(source)
    if vRP.HasGroup(user_id, perm) then
        return true
    else
        return false
    end
end
function src.installXenon(car)
    local source = source
    local user_id = vRP.Passport(source)
    if vRP.TakeItem(user_id, "moduloxenon", 1) then
        vRPclient.playAnim(source, true,{{"mini@repair","fixing_a_ped",1}}, true)
        TriggerClientEvent("progress", source, 30000, "Instalando módulo de Xenon")
        SetTimeout(31000, function()
            vRPclient.Destroy(source)
            vRPclient.stopAnim(source,false)
            src.setXenon(car)
        end)
    else
        TriggerClientEvent("Notify",source,"negado","Você não possui um módulo xenon.")
    end
end
function src.setXenon(pVehicle)
    local source = source
    local vehicle, vnetid, placa, vname, lock, banned = vRPclient.VehicleList(source, 5)
    if vehicle == pVehicle then
        if vehicle and placa then
            local placa_user_id = vRP.PassportPlate(placa)
            if placa_user_id ~= nil then
                local tuning = vRP.GetSrvData("customVehicle:u"..placa_user_id.Passport.."veh_"..vname.."placa_".. placa) or {}
                local custom = json.decode(tuning) or {}
                custom.xenonControl = 1
                vRP.SetSrvData("customVehicle:u"..placa_user_id.Passport.."veh_"..vname.."placa_".. placa,json.encode(custom),true)
            end
        end
    end
end
function src.checkXenon()
    local source = source
    local user_id = vRP.Passport(source)
    local vehicle, vnetid, placa, vname, lock, banned = vRPclient.VehicleList(source, 5)
    if vehicle and placa then
        local placa_user_id = vRP.PassportPlate(placa)
        if placa_user_id ~= nil then
            if user_id == placa_user_id and cfg.apenasDonoAcessaXenon then
                local tuning = vRP.GetSrvData("customVehicle:u"..user_id.."veh_"..vname.."placa_".. placa) or {}
                local custom = json.decode(tuning) or {}
                
                if custom.xenonControl == 1 then
                    return true
                else
                    return false
                end
            else
                local tuning = vRP.GetSrvData("customVehicle:u"..placa_user_id.Passport.."veh_"..vname.."placa_".. placa) or {}
                local custom = json.decode(tuning) or {}
                
                if custom.xenonControl == 1 then
                    return true
                else
                    return false
                end
            end
        end
        
    end
    return false
end
function src.installNeon(car)
    local source = source
    local user_id = vRP.Passport(source)
    if vRP.TakeItem(user_id,"moduloneon", 1) then
        vRPclient.playAnim(source, true,{{"mini@repair","fixing_a_ped",1}}, true)
        TriggerClientEvent("progress", source, 30000, "Instalando módulo de neon")
        SetTimeout(31000, function()
            vRPclient.Destroy(source)
            vRPclient.stopAnim(source, false)
            src.setNeon(car)
        end)
    else
        TriggerClientEvent("Notify",source,"negado","Você não possui um módulo de Neon.")
    end
end
function src.setNeon(pVehicle)
    local source = source
    local vehicle, vnetid, placa, vname, lock, banned = vRPclient.VehicleList(source, 5)
    if vehicle == pVehicle then
        if vehicle and placa then
            local placa_user_id = vRP.PassportPlate(placa)
            if placa_user_id ~= nil then
                local tuning = vRP.GetSrvData("customVehicle:u"..placa_user_id.Passport.."veh_"..vname.."placa_".. placa) or {}
                local custom = json.decode(tuning) or {}
                custom.neonControl = 1
                vRP.SetSrvData("customVehicle:u"..placa_user_id.Passport.."veh_"..vname.."placa_".. placa,json.encode(custom),true)
            end
        end
    end
end
function src.checkNeon()
    local source = source
    local user_id = vRP.Passport(source)
    local vehicle, vnetid, placa, vname, lock, banned = vRPclient.VehicleList(source, 5)
    if vehicle and placa then
        local placa_user_id = vRP.PassportPlate(placa)
        if placa_user_id ~= nil then
            if user_id == placa_user_id and cfg.apenasDonoAcessaNeon then
                local tuning = vRP.GetSrvData("customVehicle:u"..user_id.."veh_"..vname.."placa_".. placa) or {}
                local custom = json.decode(tuning) or {}
                
                if custom.neonControl == 1 then
                    return true
                else
                    return false
                end
            else
                local tuning = vRP.GetSrvData("customVehicle:u"..placa_user_id.Passport.."veh_"..vname.."placa_".. placa) or {}
                local custom = json.decode(tuning) or {}
                
                if custom.neonControl == 1 then
                    return true
                else
                    return false
                end
            end
        end
        
    end
    return false
end
function src.anim()
    local source = source
    vRPclient.playAnim(source, false, {{"anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer"}}, true)
    SetTimeout(7000, function()
        vRPclient.Destroy(source)
        vRPclient.stopAnim(source,false)
        vCLIENT.instalando(source, false)
    end)
end
function src.setSuspensao(pVehicle)
    local source = source
    local user_id = vRP.Passport(source)
    local vehicle, vnetid, placa, vname, lock, banned = vRPclient.VehicleList(source, 5)
    if vRP.TakeItem(user_id, "suspensaoar", 1) then
        TriggerClientEvent('zo_cars:instalar', source)
       -- vRPclient.playAnim(source, true,{{"mini@cover@weapon@reloads@machinegun@combat_mg","fixing_a_ped",1}}, true)
        if vehicle == pVehicle then
            if vehicle and placa then
                local placa_user_id = vRP.PassportPlate(placa)
                if placa_user_id ~= nil then
                    local tuning = vRP.GetSrvData("customVehicle:u"..placa_user_id.Passport.."veh_"..vname.."placa_".. placa) or {}
                    local custom = json.decode(tuning) or {}
                    custom.suspensaoAr = 1
                    vRP.SetSrvData("customVehicle:u"..placa_user_id.Passport.."veh_"..vname.."placa_".. placa,json.encode(custom),true)
                end
            end
        end
    else
        TriggerClientEvent("Notify",source,"negado","Você não possui um Kit de suspensão a ar.")
    end
end
function src.checkSuspension()
    local source = source
    local user_id = vRP.Passport(source)
    local vehicle, vnetid, placa, vname, lock, banned = vRPclient.VehicleList(source, 5)
    if vehicle and placa then
        local placa_user_id = vRP.PassportPlate(placa)
        if placa_user_id ~= nil then
            if user_id == placa_user_id and cfg.apenasDonoAcessaSuspensao then
                local tuning = vRP.GetSrvData("customVehicle:u"..user_id.."veh_"..vname.."placa_".. placa) or {}
                local custom = json.decode(tuning) or {}
                
                if custom.suspensaoAr == 1 then
                    return true
                else
                    return false
                end
            else
                local tuning = vRP.GetSrvData("customVehicle:u"..placa_user_id.Passport.."veh_"..vname.."placa_".. placa) or {}
                local custom = json.decode(tuning) or {}
                
                if custom.suspensaoAr == 1 then
                    return true
                else
                    return false
                end
            end
        end
        
    end
    return false
end
function src.setPreset(value)
    local source = source
    local user_id = vRP.Passport(source)
    local vehicle, vnetid, placa, vname, lock, banned = vRPclient.VehicleList(source, 5)
    if vehicle and placa then
        local tuning = vRP.GetSrvData("customVehicle:u"..user_id.."veh_"..vname.."placa_".. placa) or {}
        local custom = json.decode(tuning) or {}
        
        custom.presetSuspe = value
        vRP.SetSrvData("customVehicle:u"..user_id.."veh_"..vname.."placa_".. placa,json.encode(custom),true)
    end
end
function src.returnPreset()
    local source = source
    local user_id = vRP.Passport(source)
    local vehicle, vnetid, placa, vname, lock, banned = vRPclient.VehicleList(source, 5)
    if vehicle and placa then
        local tuning = vRP.GetSrvData("customVehicle:u"..user_id.."veh_"..vname.."placa_".. placa) or {}
        local custom = json.decode(tuning) or {}
        
        if custom.presetSuspe ~= nil then
            return custom.presetSuspe
        else
            return 0
        end
    end
    return 0
end
RegisterNetEvent("tryzosuspe")
AddEventHandler('tryzosuspe', function(vehicle, pAlturaAtual, pAlturaAnterior, variacao, type)
    local altura = pAlturaAnterior
    if type == "subir" then
        while altura > pAlturaAtual do
            altura = altura - variacao
            TriggerClientEvent("synczosuspe", -1, vehicle, altura)
            Citizen.Wait(1)
        end
    elseif type == "descer" then
        while altura < pAlturaAtual do
            altura = altura + variacao
            TriggerClientEvent("synczosuspe", -1, vehicle, altura)
            Citizen.Wait(1)
        end
    end
end)






RegisterServerEvent("departamento-comprar")
AddEventHandler("departamento-comprar",function(item)
    local source = source
    local user_id = vRP.Passport(source)
    if user_id then
        for k, v in pairs(cfg.valores) do
            if item == v.item then
                if (vRP.InventoryWeight(user_id) + itemWeight(v.item) * v.quantidade) <= vRP.GetWeight(user_id) then
                    local preco = parseInt(v.compra)
                    if preco then
                        if vRP.FullPayment(user_id, parseInt(preco)) then
                            TriggerClientEvent("Notify",source,"sucesso","Comprou <b>"..parseInt(v.quantidade).."x "..itemName(v.item).."</b> por <b>$"..parseInt(v.compra).." dólares</b>.")
                            vRP.GiveItem(user_id, v.item, parseInt(v.quantidade))
                        else
                            TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
                        end
                    end
                else
                    TriggerClientEvent("Notify",source,"negado","Espaço insuficiente.")
                end
            end
        end
    end
end)


