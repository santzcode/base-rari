local Tunnel = module("lib/Tunnel")
local Proxy = module("lib/Proxy")
vRP = Proxy.getInterface("vRP")
fclient = Tunnel.getInterface("nation_tattoos")
func = {}
Tunnel.bindInterface("nation_tattoos", func)

function func.checkPermission(permission, src)
    local source = src or source
    local user_id = vRP.Passport(source)
    if type(permission) == "table" then
        for i, perm in pairs(permission) do
            if vRP.HasGroup(user_id, perm) then
                return true
            end
        end
        return false
    end
    return not permission or vRP.HasGroup(user_id, permission)
end

function func.saveChar(t)
    local source = source
    local user_id = vRP.Passport(source)
    if user_id then
        local char = getUserChar(user_id)
        char.tattoos, char.overlay = t.tattoos, t.overlay
        vRP.Query("playerdata/SetData",{ Passport = user_id, dkey = "Tattooshop", dvalue = json.encode(char) })
    end
end

function func.tryPay(value)
    local source = source
    local user_id = vRP.Passport(source)
    if value >= 0 then
        if vRP.PaymentFull(user_id, value) or value == 0 then
            return true
        end
    end
    return false
end

function func.getTattoos()
    local source = source
    local user_id = vRP.Passport(source)
    if user_id then
        local char = getUserChar(user_id)
        return (char.tattoos or {}), (char.overlay or 0)
    end
    return false
end

function getUserChar(user_id)
    return vRP.UserData(user_id,"Tattooshop")
end