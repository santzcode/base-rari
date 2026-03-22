local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

vRP = Proxy.getInterface("vRP")

function r_showNotification(source, msg)
    TriggerClientEvent('sorte:showNotification', source, msg)
end

isRoll = false
amount = 10

local amount = 10
local isRoll = false 

RegisterServerEvent('casino_luckywheel:getLucky')
AddEventHandler('casino_luckywheel:getLucky', function()
    local source = source
    local Passport = vRP.Passport(source)
    local chips = vRP.InventoryItemAmount(Passport, "chips")[1] or 0

    if not isRoll then
        if Passport ~= nil then
            if chips >= amount then
                vRP.TakeItem(Passport, "chips", amount, true)
                isRoll = true

                local _randomPrice = math.random(1, 100)
                local _priceIndex = 11

                if _randomPrice == 1 then
                    local _subRan = math.random(1, 2)
                    _priceIndex = (_subRan == 1) and 1 or 11
                elseif _randomPrice > 1 and _randomPrice <= 6 then
                    local _subRan = math.random(1, 2)
                    _priceIndex = (_subRan == 1) and 2 or 11
                elseif _randomPrice > 6 and _randomPrice <= 15 then
                    local _subRan = math.random(1, 3)
                    _priceIndex = (_subRan == 1) and 3 or 11
                elseif _randomPrice > 15 and _randomPrice <= 25 then
                    local _subRan = math.random(1, 3)
                    _priceIndex = (_subRan == 1) and 4 or 11
                elseif _randomPrice > 25 and _randomPrice <= 40 then
                    local _subRan = math.random(1, 3)
                    _priceIndex = (_subRan == 1) and 5 or 11
                elseif _randomPrice > 40 and _randomPrice <= 60 then
                    local _subRan = math.random(1, 3)
                    _priceIndex = (_subRan == 1) and 6 or 11
                elseif _randomPrice > 60 and _randomPrice <= 100 then
                    local _subRan = math.random(1, 3)
                    _priceIndex = (_subRan == 1) and 7 or 11
                end

                
                TriggerClientEvent("casino_luckywheel:doRoll", -1, _priceIndex)

                SetTimeout(2000, function()
                    isRoll = false
                    if _priceIndex == 1 then
                        local vehicle = "adder"
                        local sql = "INSERT IGNORE INTO vrp_user_vehicles(Passport,vehicle,ipva) VALUES(@Passport,@vehicle,@ipva)"
                        MySQL.Sync.execute(sql, { ['@Passport'] = Passport, ['vehicle'] = vehicle, ['ipva'] = parseInt(os.time()) })
                        r_showNotification(source, 'Você ganhou: Parabéns, você ganhou um CARRO!')
                        TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'LUCKY_WHEEL_WIN_WIN_CAR', 0.1)
                    elseif _priceIndex == 2 then
                        vRP.GiveItem(Passport, "chips", 2000, true)
                        r_showNotification(source, 'Você ganhou: Parabéns, você ganhou 2000 fichas!')
                        TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'LUCKY_WHEEL_WIN_WIN_CHIPS', 0.1)
                    elseif _priceIndex == 3 then
                        vRP.GiveItem(Passport, "chips", 3000, true)
                        r_showNotification(source, 'Você ganhou: Parabéns, você ganhou 3000 fichas!')
                        TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'LUCKY_WHEEL_WIN_WIN_CHIPS', 0.1)
                    elseif _priceIndex == 4 then
                        vRP.GiveItem(Passport, "chips", 5000, true)
                        r_showNotification(source, 'Você ganhou: Parabéns, você ganhou 5000 fichas!')
                        TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'LUCKY_WHEEL_WIN_WIN_CHIPS', 0.1)
                    elseif _priceIndex == 5 then
                        vRP.GiveItem(Passport, "chips", 10000, true)
                        r_showNotification(source, 'Você ganhou: Parabéns, você ganhou 10,000 fichas!')
                        TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'LUCKY_WHEEL_WIN_WIN_CHIPS', 0.1)
                    elseif _priceIndex == 6 then
                        vRP.GiveItem(Passport, "chips", 20000, true)
                        r_showNotification(source, 'Você ganhou: Parabéns, você ganhou 20,000 fichas!')
                        TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'LUCKY_WHEEL_WIN_WIN_CHIPS', 0.1)
                    elseif _priceIndex == 7 then
                        vRP.GiveItem(Passport, "chips", 50000, true)
                        r_showNotification(source, 'Você ganhou: Parabéns, você ganhou 50,000 fichas!')
                        TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'LUCKY_WHEEL_WIN_WIN_CHIPS', 0.1)
                    else
                        r_showNotification(source, 'Você perdeu: Por favor, tente novamente!')
                        TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'TD_NO_WIN_03', 0.1)
                    end
                    TriggerClientEvent("casino_luckywheel:rollFinished", -1)
                end)
            else
                TriggerClientEvent("casino_luckywheel:rollFinished", -1)
                r_showNotification(source, 'Infelizmente você não tem fichas suficientes! (Necessário: ' .. amount .. ' fichas)')
            end
        end
    end
end)