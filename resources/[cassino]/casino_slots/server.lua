local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
local Tools = module("vrp", "lib/Tools")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

math.randomseed(os.time())

local activeSlot = {}

function hasEnoughChips(Passport, bet)
    return vRP.InventoryItemAmount(Passport, "chips")[1] >= bet
end

function removeChips(Passport, bet)
    vRP.TakeItem(Passport, "chips", bet, true)
end

function addChips(Passport, amount)
    vRP.GiveItem(Passport, "chips", amount, true)
end

RegisterNetEvent('casino:slots:isSeatUsed')
AddEventHandler('casino:slots:isSeatUsed', function(index)
    local source = source
    local Passport = vRP.Passport(source)
    if Passport ~= nil then
        if activeSlot[index] ~= nil then
            if activeSlot[index].used then
                
            else
                activeSlot[index].used = true
            end
        else
            activeSlot[index] = {}
            activeSlot[index].used = true
            updatePlayerChips(source)
        end
    end
end)

RegisterNetEvent('casino:slots:notUsing')
AddEventHandler('casino:slots:notUsing', function(index)
    local source = source
    local Passport = vRP.Passport(source)
    if Passport ~= nil then
        if activeSlot[index] ~= nil then
            activeSlot[index].used = false
        end
    end
end)

RegisterNetEvent('casino:taskStartSlots')
AddEventHandler('casino:taskStartSlots', function(index, data)
    local source = source
    local Passport = vRP.Passport(source)
    if Passport ~= nil then
        if not hasEnoughChips(Passport, data.bet) then
            TriggerClientEvent('t-notify:client:Custom', source, {
                style = 'error',
                message = 'Você não tem chips suficientes!',
                duration = 5500,
                sound = true
            })
        else
            if activeSlot[index] then
                removeChips(Passport, data.bet)
                local w = { a = math.random(1, 16), b = math.random(1, 16), c = math.random(1, 16) }

                local rnd1 = math.random(1, 100)
                local rnd2 = math.random(1, 100)
                local rnd3 = math.random(1, 100)

                if Config.Offset then
                    if rnd1 > 30 then w.a = w.a + 0.5 end
                    if rnd2 > 30 then w.b = w.b + 1.0 end
                    if rnd3 > 30 then w.c = w.c + 0.5 end
                end

                TriggerClientEvent('casino:slots:startSpin', source, index, w)
                activeSlot[index].win = w
            end
        end
    end
end)

RegisterNetEvent('casino:slotsCheckWin')
AddEventHandler('casino:slotsCheckWin', function(index, data, dt)
    if activeSlot[index] then
        if activeSlot[index].win then
            if activeSlot[index].win.a == data.a and activeSlot[index].win.b == data.b and activeSlot[index].win.c == data.c then
                CheckForWin(activeSlot[index].win, dt)
            end
        end
    end
end)

function CheckForWin(w, data)
    local source = source
    local Passport = vRP.Passport(source)
    if Passport ~= nil then
        local a = Config.Wins[w.a]
        local b = Config.Wins[w.b]
        local c = Config.Wins[w.c]
        local total = 0

        if a == b and b == c and a == c then
            if Config.Mult[a] then
                total = data.bet * Config.Mult[a]
            end
        elseif a == '6' and b == '6' then
            total = data.bet * 5
        elseif a == '6' and c == '6' then
            total = data.bet * 5
        elseif b == '6' and c == '6' then
            total = data.bet * 5
        elseif a == '6' then
            total = data.bet * 2
        elseif b == '6' then
            total = data.bet * 2
        elseif c == '6' then
            total = data.bet * 2
        end

        if total > 0 then
            TriggerClientEvent('t-notify:client:Custom', source, {
                style = 'success',
                message = 'Você ganhou ' .. total .. ' chips',
                duration = 5500,
                sound = false
            })
            TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'TD_BIG_WIN_01', 0.1)
            addChips(Passport, total)
            updatePlayerChips(source)
        else
            TriggerClientEvent('t-notify:client:Custom', source, {
                style = 'error',
                message = 'Infelizmente você perdeu',
                duration = 5500,
                sound = false
            })
            TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'TD_NO_WIN_01', 0.1)
            updatePlayerChips(source)
        end
    end
end

function updatePlayerChips(source)
    local Passport = vRP.Passport(source)
    if Passport then
        local chips = vRP.InventoryItemAmount(Passport, "chips")[1]
        TriggerClientEvent('slots:updatePlayerChips', source, chips)
    end
end