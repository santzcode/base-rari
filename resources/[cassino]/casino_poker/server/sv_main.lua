local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")

function getPlayerChips(source)
    local Passport = vRP.Passport(source)
    if Passport then
        local amount = vRP.ItemAmount(Passport, "chips")
        return tonumber(amount) or 0
    end
    return 0
end

function giveChips(source, amount)
    local Passport = vRP.Passport(source)
    if Passport then
        amount = math.abs(tonumber(amount) or 0)
        if amount > 0 then
            vRP.GiveItem(Passport, "chips", amount, true)
            updatePlayerChips(source)
            return true
        end
    end
    return false
end

function removeChips(source, amount)
    local Passport = vRP.Passport(source)
    if Passport then
        amount = math.abs(tonumber(amount) or 0)
        local currentChips = getPlayerChips(source)
        if currentChips >= amount then
            if vRP.TakeItem(Passport, "chips", amount, true) then
                updatePlayerChips(source)
                return true
            end
        end
    end
    return false
end

function debugChips(source)
    local Passport = vRP.Passport(source)
    if Passport then
        local chips = getPlayerChips(source)
        print("^2[DEBUG] ^7Player ID: " .. source .. " | Passport: " .. Passport .. " | Chips: " .. chips)
    end
end

function Notify(source, msg)
    TriggerClientEvent("Notify", source, "importante", msg, 5000)
end

-- Eventos do poker
ServerPokers = {}

RegisterNetEvent('aquiverPoker:standUp')
RegisterNetEvent('aquiverPoker:betPlayer')
RegisterNetEvent('aquiverPoker:playCards')
RegisterNetEvent('aquiverPoker:foldCards')
RegisterNetEvent('aquiverPoker:betPairPlusPlayer')

AddEventHandler('aquiverPoker:foldCards', function(tableId)
    local source = source
    if ServerPokers[tableId] then
        ServerPokers[tableId].PlayersFolded[source] = true
        TriggerClientEvent('aquiverPoker:playerFoldCards', -1, source, tableId)
    end
end)

AddEventHandler('aquiverPoker:playCards', function(tableId, bettedAmount)
    local source = source
    local Passport = vRP.Passport(source)
    
    if not Passport then
        Notify(source, "Erro de autenticação")
        return
    end

    if not ServerPokers[tableId] then
        Notify(source, "Mesa inválida")
        return
    end

    bettedAmount = tonumber(bettedAmount)
    if not bettedAmount or bettedAmount <= 0 then
        Notify(source, "Valor de aposta inválido")
        return
    end

    debugChips(source)
    local playerChips = getPlayerChips(source)
    if playerChips >= bettedAmount then
        if removeChips(source, bettedAmount) then
            TriggerClientEvent('aquiverPoker:playerPlayCards', -1, source, tableId)
            Notify(source, string.format("Aposta play de %d fichas realizada", bettedAmount))
        else
            Notify(source, "Erro ao realizar a aposta play")
        end
    else
        Notify(source, string.format("Fichas insuficientes para a aposta play. Você tem %d fichas", playerChips))
    end
end)

AddEventHandler('aquiverPoker:standUp', function(tableId, chairId)
    local source = source
    if ServerPokers[tableId] and ServerPokers[tableId].ChairsUsed[chairId] then
        ServerPokers[tableId].ChairsUsed[chairId] = nil
    end
end)

AddEventHandler('aquiverPoker:betPairPlusPlayer', function(tableId, betAmount)
    local source = source
    local Passport = vRP.Passport(source)

    if not Passport then
        Notify(source, "Erro de autenticação")
        return
    end

    if not ServerPokers[tableId] then
        Notify(source, "Mesa inválida")
        return
    end

    betAmount = tonumber(betAmount)
    if not betAmount or betAmount <= 0 then
        Notify(source, "Valor de aposta pair plus inválido")
        return
    end

    if ServerPokers[tableId].PairPlusBets[source] then
        Notify(source, "Você já fez uma aposta pair plus")
        return
    end

    debugChips(source)
    local playerChips = getPlayerChips(source)
    if playerChips < betAmount then
        Notify(source, string.format("Fichas insuficientes para aposta pair plus. Você tem %d fichas", playerChips))
        return
    end

    local currentAnteBetAmount = getPlayerBetAmount(source, tableId)
    if playerChips < (currentAnteBetAmount + betAmount) then
        Notify(source, string.format("Fichas insuficientes para próxima aposta. Você tem %d fichas", playerChips))
        return
    end

    if ServerPokers[tableId].TimeLeft and ServerPokers[tableId].TimeLeft > 0 then
        if removeChips(source, betAmount) then
            ServerPokers[tableId].PairPlusBets[source] = betAmount
            TriggerClientEvent('aquiverPoker:playerPairPlusAnim', source, betAmount)
            Notify(source, string.format("Aposta pair plus de %d fichas realizada", betAmount))
        else
            Notify(source, "Erro ao realizar a aposta pair plus")
        end
    end
end)

AddEventHandler('aquiverPoker:betPlayer', function(tableId, chairData, betAmount)
    local source = source
    local Passport = vRP.Passport(source)

    if not Passport then
        Notify(source, "Erro de autenticação")
        return
    end

    if not ServerPokers[tableId] then
        Notify(source, "Mesa inválida")
        return
    end

    if ServerPokers[tableId].PlayerBets[source] then
        Notify(source, "Você já fez uma aposta")
        return
    end

    betAmount = tonumber(betAmount)
    if not betAmount or betAmount <= 0 then
        Notify(source, "Valor de aposta inválido")
        return
    end

    debugChips(source)
    local playerChips = getPlayerChips(source)
    if playerChips < betAmount then
        Notify(source, string.format("Fichas insuficientes para apostar. Você tem %d fichas", playerChips))
        return
    end

    if playerChips < (betAmount * 2) then
        Notify(source, string.format("Você precisa ter %d fichas para a aposta play (2x a aposta inicial). Você tem %d fichas", betAmount * 2, playerChips))
        return
    end

    if removeChips(source, betAmount) then
        if not ServerPokers[tableId].Active then
            ServerPokers[tableId].TimeLeft = Config.TimeLeftAfter
            ServerPokers[tableId].Active = true
            TriggerClientEvent('aquiverPoker:updateState', -1, tableId, ServerPokers[tableId].Active, ServerPokers[tableId].TimeLeft)
        end

        ServerPokers[tableId].PlayerBets[source] = betAmount
        TriggerClientEvent('aquiverPoker:playerBetAnim', source, betAmount)

        if not ServerPokers[tableId].Cards['dealer'] then
            ServerPokers[tableId].Cards['dealer'] = { Hand = generateHand(tableId) }
        end

        if not ServerPokers[tableId].Cards[source] then
            ServerPokers[tableId].Cards[source] = { Hand = generateHand(tableId), chairData = chairData }
        end

        TriggerClientEvent('aquiverPoker:updateCards', -1, tableId, ServerPokers[tableId].Cards)
        
        debugChips(source)
        Notify(source, string.format("Aposta de %d fichas realizada com sucesso", betAmount))
    else
        Notify(source, "Erro ao realizar a aposta")
    end
end)

function generateHand(tableId)
    local handTable = {}

    if ServerPokers[tableId] then
        for i = 1, 3 do
            local randomCard = math.random(1, #Config.Cards)
            while ServerPokers[tableId].UsedCards[randomCard] do
                randomCard = math.random(1, #Config.Cards)
            end
            ServerPokers[tableId].UsedCards[randomCard] = true
            handTable[i] = randomCard
        end
    end

    return handTable
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        for tableId, tableData in pairs(ServerPokers) do
            if tableData.Active and tableData.TimeLeft > 0 then
                tableData.TimeLeft = tableData.TimeLeft - 1
                TriggerClientEvent('aquiverPoker:updateState', -1, tableId, tableData.Active, tableData.TimeLeft)

                if tableData.TimeLeft < 1 and tableData.Stage == 0 then
                    Citizen.CreateThread(function()
                        TriggerClientEvent('aquiverPoker:Stage:1', -1, tableId)
                        Citizen.Wait(9000)
                        TriggerClientEvent('aquiverPoker:Stage:2', -1, tableId)
                        Citizen.Wait(4000 * getTablePlayersCount(tableId))
                        TriggerClientEvent('aquiverPoker:Stage:3', -1, tableId)
                        Citizen.Wait(8000)
                        TriggerClientEvent('aquiverPoker:Stage:4', -1, tableId)
                        Citizen.Wait((Config.PlayerDecideTime * 1000) + 5000)
                        TriggerClientEvent('aquiverPoker:Stage:5', -1, tableId)
                        Citizen.Wait(2000 + (5000 * getTablePlayersCount(tableId)))
                        TriggerClientEvent('aquiverPoker:Stage:6', -1, tableId)
                        Citizen.Wait(10000)
                        CheckWinners(tableId)
                        Citizen.Wait(1500)
                        TriggerClientEvent('aquiverPoker:Stage:7', -1, tableId)
                        Citizen.Wait(8000 + (4000 * getTablePlayersCount(tableId)))
                        TriggerClientEvent('aquiverPoker:resetTable', -1, tableId)
                        ResetTable(tableId)
                    end)
                end
            end
        end
    end
end)

function ResetTable(tableId)
    if ServerPokers[tableId] then
        ServerPokers[tableId].PlayerBets = {}
        ServerPokers[tableId].Active = false
        ServerPokers[tableId].Cards = {}
        ServerPokers[tableId].UsedCards = {}
        ServerPokers[tableId].Stage = 0
        ServerPokers[tableId].TimeLeft = nil
        ServerPokers[tableId].PlayersFolded = {}
        ServerPokers[tableId].PairPlusBets = {}
    end
end

function CheckWinners(tableId)
    if ServerPokers[tableId] then
        local dealerHand = Config.getHandAllValues(ServerPokers[tableId].Cards['dealer'].Hand)
        local dealerHand_second = Config.getHandAllValues(ServerPokers[tableId].Cards['dealer'].Hand, true, false)
        local dealerHand_third = Config.getHandAllValues(ServerPokers[tableId].Cards['dealer'].Hand, false, true)

        for source, data in pairs(ServerPokers[tableId].Cards) do
            if source ~= 'dealer' and playerStillExist(source) and not ServerPokers[tableId].PlayersFolded[source] then
                local playerHand = Config.getHandAllValues(data.Hand)
                local playerHand_second = Config.getHandAllValues(data.Hand, true, false)
                local playerHand_third = Config.getHandAllValues(data.Hand, false, true)

                if Config.canDealerPlay(dealerHand) then
                    if playerHand > dealerHand then
                        playerWon(source, tableId, playerHand)
                    elseif playerHand < dealerHand then
                        playerLost(source, tableId, playerHand)
                    elseif playerHand == dealerHand then
                        if playerHand_second == dealerHand_second then
                            if playerHand_third > dealerHand_third then
                                playerWon(source, tableId, playerHand)
                            elseif playerHand_third == dealerHand_third then
                                playerDraw(source, tableId, playerHand)
                            else
                                playerLost(source, tableId, playerHand)
                            end
                        elseif playerHand_second > dealerHand_second then
                            playerWon(source, tableId, playerHand)
                        else
                            playerLost(source, tableId, playerHand)
                        end
                    end
                else
                    playerDraw(source, tableId, playerHand)
                end

                local pairMultiplier = Config.GetPairMultiplier(playerHand)
                if pairMultiplier > 0 then
                    playerPairPlusWon(source, tableId, pairMultiplier)
                end
            end
        end
    end
end

function playerPairPlusWon(source, tableId, pairMultiplier)
    local betAmount = getPlayerPairPlusBetAmount(source, tableId)
    if betAmount > 0 then
        local plusChips = math.floor(betAmount * pairMultiplier)
        if plusChips > 0 then
            Notify(source, string.format("Você ganhou %d fichas no pair plus (multiplicador: %dx)", plusChips, pairMultiplier))
            giveChips(source, plusChips)
        end
    end
end

function playerWon(source, tableId, handValue)
    local betAmount = getPlayerBetAmount(source, tableId)
    if betAmount > 0 then
        local plusChips = math.floor((betAmount * 2) * 2)
        local AnteMultiplier = Config.GetAnteMultiplier(handValue)
        if AnteMultiplier > 0 then
            plusChips = math.floor(plusChips + (AnteMultiplier * betAmount))
            Notify(source, string.format("Você ganhou %d fichas! (multiplicador ante: %dx)", plusChips, AnteMultiplier))
        else
            Notify(source, string.format("Você ganhou %d fichas!", plusChips))
        end
        giveChips(source, plusChips)
        TriggerClientEvent('aquiverPoker:playerWin', source, tableId)
    end
end

function playerDraw(source, tableId, handValue)
    local betAmount = getPlayerBetAmount(source, tableId)
    if betAmount > 0 then
        local plusChips = math.floor(betAmount * 2)
        local AnteMultiplier = Config.GetAnteMultiplier(handValue)
        if AnteMultiplier > 0 then
            plusChips = math.floor(plusChips + ((betAmount / 2) * AnteMultiplier))
            Notify(source, string.format("Dealer não qualificou. Você recebeu %d fichas de volta (multiplicador ante: %dx)", plusChips, AnteMultiplier))
        else
            Notify(source, string.format("Dealer não qualificou. Você recebeu %d fichas de volta", plusChips))
        end
        giveChips(source, plusChips)
        TriggerClientEvent('aquiverPoker:playerDraw', source, tableId)
    end
end

function playerLost(source, tableId, handValue)
    local betAmount = getPlayerBetAmount(source, tableId)
    if betAmount > 0 then
        Notify(source, "Você perdeu!")
        TriggerClientEvent('aquiverPoker:playerLost', source, tableId)
    end
end

function updatePlayerChips(source)
    local chips = getPlayerChips(source)
    TriggerClientEvent('aquiverPoker:updatePlayerChips', source, chips)
end

function getPlayerPairPlusBetAmount(source, tableId)
    if ServerPokers[tableId] and ServerPokers[tableId].PairPlusBets and ServerPokers[tableId].PairPlusBets[source] then
        return ServerPokers[tableId].PairPlusBets[source]
    end
    return 0
end

function getPlayerBetAmount(source, tableId)
    if ServerPokers[tableId] and ServerPokers[tableId].PlayerBets and ServerPokers[tableId].PlayerBets[source] then
        return ServerPokers[tableId].PlayerBets[source]
    end
    return 0
end

function playerStillExist(source)
    return GetPlayerName(source) ~= nil
end

function getTablePlayersCount(tableId)
    local playersCount = 0
    if ServerPokers[tableId] then
        for source, _ in pairs(ServerPokers[tableId].Cards) do
            if source ~= 'dealer' and playerStillExist(source) then
                playersCount = playersCount + 1
            end
        end
    end
    return playersCount
end

RegisterNetEvent('aquiverPoker:sitDown:server')
AddEventHandler('aquiverPoker:sitDown:server', function(tableId, chairId, chairCoords, chairRotation)
    local source = source
    local Passport = vRP.Passport(source)

    if not Passport then
        Notify(source, "Erro de autenticação")
        return
    end

    if not ServerPokers[tableId] then
        ServerPokers[tableId] = {
            ChairsUsed = {},
            PlayerBets = {},
            Active = false,
            Cards = {},
            UsedCards = {},
            PlayersFolded = {},
            PairPlusBets = {},
            Stage = 0,
            TimeLeft = nil
        }
    end

    if not ServerPokers[tableId].ChairsUsed[chairId] then
        ServerPokers[tableId].ChairsUsed[chairId] = source
        updatePlayerChips(source)
        TriggerClientEvent('aquiverPoker:sitDown:client', source, tableId, chairId, chairCoords, chairRotation)
        Notify(source, "Você sentou na mesa")
    else
        Notify(source, "Esta cadeira está ocupada")
    end
end)

AddEventHandler('playerDropped', function(reason)
    local source = source
    for tableId, tableData in pairs(ServerPokers) do
        if tableData.ChairsUsed then
            for chairId, chairOwner in pairs(tableData.ChairsUsed) do
                if chairOwner == source then
                    tableData.ChairsUsed[chairId] = nil
                end
            end
        end
    end
end)