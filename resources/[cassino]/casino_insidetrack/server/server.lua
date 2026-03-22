local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

src = {}
Tunnel.bindInterface("insidetrack", src)

function src.getPlayerChips()
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        local chipsAmount = vRP.ItemAmount(Passport, "chips")
        return chipsAmount
    end
    return 0
end

RegisterServerEvent("insidetrack:server:winnings")
AddEventHandler("insidetrack:server:winnings", function(amount)
    local source = source
    local Passport = vRP.Passport(source)
    if Passport and parseInt(amount) > 0 then
        vRP.GiveItem(Passport, "chips", amount, true)
    end
end)

RegisterServerEvent("insidetrack:server:placebet")
AddEventHandler("insidetrack:server:placebet", function(bet)
    local source = source
    local Passport = vRP.Passport(source)
    if Passport and parseInt(bet) > 0 then
        if vRP.TakeItem(Passport, "chips", bet, true) then
            return true
        end
    end
    return false
end)