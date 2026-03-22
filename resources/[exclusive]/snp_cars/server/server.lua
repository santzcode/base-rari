
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
src = {}
Tunnel.bindInterface("snp_cars", src)
vCLIENT = Tunnel.getInterface("snp_cars")
---------------------------------------------------------------------------------------------------------------
--- CHECKPERMISSION
---------------------------------------------------------------------------------------------------------------
function src.checkPermission()
    local Passport = vRP.Passport(source)
    if cfg.permissaoParaInstalar.existePermissao then
        for k, group in pairs(cfg.permissaoParaInstalar.permissoes) do
                if vRP.HasGroup(Passport, group) then
                    return true
            end
        end
    else
        return true
    end
    return false
end
---------------------------------------------------------------------------------------------------------------
--- CHECKPERMISSIONSHOP
---------------------------------------------------------------------------------------------------------------
function src.checkPermissionShop(perm)
    local Passport = vRP.Passport(source)
    if vRP.HasGroup(Passport, perm) then
        return true
    else
        return false
    end
end
---------------------------------------------------------------------------------------------------------------
--- INSTALLXENON
---------------------------------------------------------------------------------------------------------------
function src.installXenon(car)
    local source = source
    local Passport = vRP.Passport(source)
    if vRP.TakeItem(Passport, "moduloxenon", 1) then
        vRPclient.playAnim(source,true,{"mini@repair","fixing_a_ped"},true)
        TriggerClientEvent("Progress",source,"Instalando módulo de Xenon",5000)
        SetTimeout(5000,function()
            vRPclient.Destroy(source)
            src.setXenon(car)
        end)
    else
        TriggerClientEvent("Notify",source,"vermelho","Você não possui um módulo xenon.",5000)
    end
end
---------------------------------------------------------------------------------------------------------------
--- SETXENON
---------------------------------------------------------------------------------------------------------------
function src.setXenon(pVehicle)
    local source = source
    local Passport = vRP.Passport(source)
    local vehicle, vnetid, placa, vname, lock, banned = vRPclient.VehicleList(source, 5)
    local tuning = vRP.UserData(Passport,"customVehicle:u"..Passport.."veh_"..vname.."placa_".. placa) or {}
    local custom = tuning
    custom.xenonControl = 1
    vRP.Query("playerdata/SetData",{ Passport = Passport, dkey = "customVehicle:u"..Passport.."veh_"..vname.."placa_".. placa, dvalue = json.encode(custom) })
end
---------------------------------------------------------------------------------------------------------------
--- CHECKXENON
---------------------------------------------------------------------------------------------------------------
function src.checkXenon()
    local source = source
    local Passport = vRP.Passport(source)
    local vehicle, vnetid, placa, vname, lock, banned = vRPclient.VehicleList(source, 5)
    if vehicle and placa then
        local tuning = vRP.UserData(Passport,"customVehicle:u"..Passport.."veh_"..vname.."placa_".. placa) or {}
        local custom = tuning
        
        if custom.xenonControl == 1 then
            return true
        else
            return false
        end
        
    end
    return false
end
---------------------------------------------------------------------------------------------------------------
--- INSTALLNEON
---------------------------------------------------------------------------------------------------------------
function src.installNeon(car)
    local source = source
    local Passport = vRP.Passport(source)
    if vRP.TakeItem(Passport,"moduloneon", 1) then
        vRPclient.playAnim(source,true,{"mini@repair","fixing_a_ped"},true)
        TriggerClientEvent("Progress",source,"Instalando módulo de neon",5000)
        SetTimeout(5000, function()
            vRPclient.Destroy(source)
            src.setNeon(car)
        end)
    else
        TriggerClientEvent("Notify",source,"vermelho","Você não possui um módulo de Neon.",5000)
    end
end
---------------------------------------------------------------------------------------------------------------
--- CHECKPERMISSION
---------------------------------------------------------------------------------------------------------------
function src.setNeon(pVehicle)
    local source = source
    local Passport = vRP.Passport(source)
    local vehicle, vnetid, placa, vname, lock, banned = vRPclient.VehicleList(source, 5)

    if vehicle and placa then
        local tuning = vRP.UserData(Passport, "customVehicle:u" .. Passport .. "veh_" .. vname .. "placa_" .. placa) or {}
        tuning.neonControl = 1

        local success, err = vRP.Query("playerdata/SetData", {
            Passport = Passport,
            dkey = "customVehicle:u" .. Passport .. "veh_" .. vname .. "placa_" .. placa,
            dvalue = json.encode(tuning)
        })
    end
end
---------------------------------------------------------------------------------------------------------------
--- CHECKNEON
---------------------------------------------------------------------------------------------------------------
function src.checkNeon()
    local source = source
    local Passport = vRP.Passport(source)
    local vehicle, vnetid, placa, vname, lock, banned = vRPclient.VehicleList(source, 5)
    if vehicle and placa then
        local tuning = vRP.UserData(Passport,"customVehicle:u"..Passport.."veh_"..vname.."placa_".. placa) or {}
        local custom = tuning
        if custom.neonControl == 1 then
            return true
        else
            return false
        end
    end
    return false
end
---------------------------------------------------------------------------------------------------------------
--- ANIM
---------------------------------------------------------------------------------------------------------------
function src.anim()
    local source = source
    vRPclient.playAnim(source,false,{"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer"},true)
    TriggerClientEvent("Progress",source,"Instalando módulo de SuspensaoAR",5000)
    SetTimeout(5000, function()
        vRPclient.Destroy(source)
        vCLIENT.instalando(source, false)
    end)
end
---------------------------------------------------------------------------------------------------------------
--- SETSUSPENSAO
---------------------------------------------------------------------------------------------------------------
function src.setSuspensao(pVehicle)
    local source = source
    local Passport = vRP.Passport(source)
    local vehicle, vnetid, placa, vname, lock, banned = vRPclient.VehicleList(source, 5)
    
    if vRP.TakeItem(Passport, "suspensaoar", 1) then
        local tuning = vRP.UserData(Passport, "customVehicle:u" .. Passport .. "veh_" .. vname .. "placa_" .. placa) or {}
        tuning.suspensaoAr = 1 -- Set suspension to air suspension
        vRP.Query("playerdata/SetData", {
            Passport = Passport,
            dkey = "customVehicle:u" .. Passport .. "veh_" .. vname .. "placa_" .. placa,
            dvalue = json.encode(tuning)
        })

    else
        TriggerClientEvent("Notify", source, "vermelho", "Você não possui um Kit de suspensão a ar.", 5000)
    end
end
---------------------------------------------------------------------------------------------------------------
--- CHECKSUSPENSION
---------------------------------------------------------------------------------------------------------------
function src.checkSuspension()
    local source = source
    local Passport = vRP.Passport(source)
    local vehicle, vnetid, placa, vname, lock, banned = vRPclient.VehicleList(source, 5)
    
    if vehicle and placa then
        local tuning = vRP.UserData(Passport, "customVehicle:u"..Passport.."veh_"..vname.."placa_"..placa) or {}
        local custom = tuning
        
        if custom.suspensaoAr == 1 then
            return true
        else
            return false
        end
    end
    
    return false
end
---------------------------------------------------------------------------------------------------------------
--- SETPRESET
---------------------------------------------------------------------------------------------------------------
function src.setPreset(value)
    local source = source
    local Passport = vRP.Passport(source)
    local vehicle, vnetid, placa, vname, lock, banned = vRPclient.VehicleList(source, 5)
    if vehicle and placa then
        local tuning = vRP.UserData(Passport,"customVehicle:u"..Passport.."veh_"..vname.."placa_".. placa) or {}
        local custom = tuning
        
        custom.presetSuspe = value
        vRP.Query("playerdata/SetData",{ Passport = Passport, dkey = "customVehicle:u"..Passport.."veh_"..vname.."placa_".. placa, dvalue = json.encode(custom) })
    end
end
---------------------------------------------------------------------------------------------------------------
--- RETURMPRESET
---------------------------------------------------------------------------------------------------------------
function src.returnPreset()
    local source = source
    local Passport = vRP.Passport(source)
    local vehicle, vnetid, placa, vname, lock, banned = vRPclient.VehicleList(source, 5)
    if vehicle and placa then
        local tuning = vRP.UserData(Passport,"customVehicle:u"..Passport.."veh_"..vname.."placa_".. placa) or {}
        local custom = tuning
        
        if custom.presetSuspe ~= nil then
            return custom.presetSuspe
        else
            return 0
        end
    end
    return 0
end
---------------------------------------------------------------------------------------------------------------
--- TRYZOSUSPE
---------------------------------------------------------------------------------------------------------------
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