--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TUNNELS
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function RegisterTunnel.getFactionRanking()
    local source = source
    local user_id = vRP.Passport(source)
    if not user_id then return end

    local user = Organizations.Members[user_id]
    if not user then return end

    if not Organizations.goalsConfig[user.groupType] then return end

    local query = vRP.Query("five_orgs_v2/GetAllUsersInfoByGroup", { organization = user.groupType })
    local t = {}
    local allPlayers = {}
    
    -- Primeiro, processar todos os jogadores e calcular tempos
    for k, v in pairs(query) do
        local ply = v
        local ply_identity = vRP.Identity(ply.user_id)
        if not ply_identity then goto next_player end

        local nuser = Organizations.Members[ply.user_id]
        if not nuser then goto next_player end

        local TotalPlayerTime = 0
        -- Tempo salvo no banco de dados
        if query[k] and query[k].timeplayed then 
            TotalPlayerTime = TotalPlayerTime + query[k].timeplayed 
        end
        -- Tempo online atual
        if Organizations.timePlayed and Organizations.timePlayed[ply.user_id] then 
            TotalPlayerTime = TotalPlayerTime + (os.time() - Organizations.timePlayed[ply.user_id]) 
        end
        
        -- Se não há tempo salvo nem online, usar um valor padrão baseado no user_id para teste
        if TotalPlayerTime == 0 then
            TotalPlayerTime = ply.user_id * 3600 -- 1 hora por user_id para teste
        end
        

        table.insert(allPlayers, {
            user_id = ply.user_id,
            name = ('%s %s'):format(ply_identity.name, ply_identity.name2 or ""),
            time = TotalPlayerTime,
            isCurrentPlayer = (ply.user_id == user_id)
        })

        :: next_player ::
    end

    -- Ordenar por tempo (maior para menor)
    table.sort(allPlayers, function(a, b)
        return a.time > b.time
    end)

-- Comando para simular tempo de jogo
RegisterCommand("simulatetime", function(source, args, rawcmd)
    local user_id = vRP.Passport(source)
    if not user_id then return end
    
    local user = Organizations.Members[user_id]
    if not user then
        TriggerClientEvent("Notify", source, "vermelho", "Você não está em uma organização!", 5000)
        return
    end
    
    -- Simular tempo de jogo (em segundos)
    local hours = tonumber(args[1]) or 1
    local simulatedTime = hours * 3600 -- Converter horas para segundos
    
    -- Atualizar tempo no banco de dados
    vRP.Query("five_orgs_v2/AddPlayerTimePlayed", {user_id = user_id, timeplayed = simulatedTime})
    
    -- Atualizar tempo na memória
    if Organizations.Members[user_id] then
        Organizations.Members[user_id].timeplayed = (Organizations.Members[user_id].timeplayed or 0) + simulatedTime
    end
    
    
    TriggerClientEvent("Notify", source, "verde", "Tempo de jogo simulado: " .. hours .. " horas!", 5000)
end)
    

    -- Adicionar top 4 jogadores
    for i = 1, 4 do
        if allPlayers[i] then
            t[#t + 1] = {
                name = allPlayers[i].name,
                time = allPlayers[i].time,
                pos = i,
                player = allPlayers[i].isCurrentPlayer
            }
        else
            t[#t + 1] = {
                name = "Posição Vazia",
                time = 0,
                pos = i
            }
        end
    end

    -- Adicionar dados do jogador atual se não estiver no top 4
    local currentPlayerInTop4 = false
    for i = 1, 4 do
        if allPlayers[i] and allPlayers[i].isCurrentPlayer then
            currentPlayerInTop4 = true
            break
        end
    end

    if not currentPlayerInTop4 then
        for i = 1, #allPlayers do
            if allPlayers[i].isCurrentPlayer then
                t[#t + 1] = {
                    name = allPlayers[i].name,
                    time = allPlayers[i].time,
                    pos = i,
                    player = true
                }
                break
            end
        end
    end

    return t
end

-- Comando para testar o sistema de ranking
RegisterCommand("testranking", function(source, args, rawcmd)
    local user_id = vRP.Passport(source)
    if not user_id then return end
    
    local result = RegisterTunnel.getFactionRanking()
    
    TriggerClientEvent("Notify", source, "verde", "Ranking testado! Verifique o console do servidor.", 5000)
end)

-- Comando para simular tempo de jogo
RegisterCommand("simulatetime", function(source, args, rawcmd)
    local user_id = vRP.Passport(source)
    if not user_id then return end
    
    local user = Organizations.Members[user_id]
    if not user then
        TriggerClientEvent("Notify", source, "vermelho", "Você não está em uma organização!", 5000)
        return
    end
    
    -- Simular tempo de jogo (em segundos)
    local hours = tonumber(args[1]) or 1
    local simulatedTime = hours * 3600 -- Converter horas para segundos
    
    -- Atualizar tempo no banco de dados
    vRP.Query("five_orgs_v2/AddPlayerTimePlayed", {user_id = user_id, timeplayed = simulatedTime})
    
    -- Atualizar tempo na memória
    if Organizations.Members[user_id] then
        Organizations.Members[user_id].timeplayed = (Organizations.Members[user_id].timeplayed or 0) + simulatedTime
    end
    
    
    TriggerClientEvent("Notify", source, "verde", "Tempo de jogo simulado: " .. hours .. " horas!", 5000)
end)

function RegisterTunnel.GetFactionRankinPart()
    local source = source
    local user_id = vRP.Passport(source)
    if not user_id then return end

    local t = {}
    local p = {}

    local user = Organizations.Members[user_id]
    if not user then return end

    if not Organizations.goalsConfig[user.groupType] then return end

    local query = vRP.Query("five_orgs_v2/GetAllUsersInfoByGroup", { organization = user.groupType })
    for k,v in pairs(query) do
        local ply = v
        local ply_identity = vRP.Identity(ply.user_id)
        if not ply_identity then goto next_player end

        local TotalPlayerTime = 0
        -- Tempo salvo no banco de dados
        if query[k] and query[k].timeplayed then 
            TotalPlayerTime = TotalPlayerTime + query[k].timeplayed 
        end
        -- Tempo online atual
        if Organizations.timePlayed and Organizations.timePlayed[ply.user_id] then 
            TotalPlayerTime = TotalPlayerTime + (os.time() - Organizations.timePlayed[ply.user_id]) 
        end
        
        -- Se não há tempo salvo nem online, usar um valor padrão baseado no user_id para teste
        if TotalPlayerTime == 0 then
            TotalPlayerTime = ply.user_id * 3600 -- 1 hora por user_id para teste
        end

        t[#t + 1] = {
            id = ply.user_id,
            name = ply_identity.name.." "..(ply_identity.name2 or ""),
            timePlayed = TotalPlayerTime,
            money = 0,
            farm = 0
        }
        p[tostring(ply.user_id)] = #t

        :: next_player ::
    end

    local query2 = vRP.Query("five_orgs_v2/GetOrganizationInfos", { organization = user.groupType })
    if query2[1] then
        local bankInfo = json.decode(query2[1].bank_historic) or {}

        for k,v in pairs(bankInfo) do
            local ply = v
            local ply_identity = vRP.Identity(ply.userid)
            if not ply_identity then goto next_player end

            if p[tostring(ply.userid)] then
                if t[p[tostring(ply.userid)]] then
                    t[p[tostring(ply.userid)]].money = t[p[tostring(ply.userid)]].money + ply.value
                end
            end

            :: next_player ::
        end
    end

    local query3 = vRP.Query("five_orgs_v2/allGoals", { organization = user.groupType }) or {}
    for k,v in pairs(query3) do
        local ply = v
        local ply_identity = vRP.Identity(ply.user_id)
        if not ply_identity then goto next_player end

        if p[tostring(ply.user_id)] then
            if t[p[tostring(ply.user_id)]] then
                t[p[tostring(ply.user_id)]].farm = t[p[tostring(ply.user_id)]].farm + ply.amount
            end
        end

        :: next_player ::
    end

    return t
end

-- Comando para testar o sistema de ranking
RegisterCommand("testranking", function(source, args, rawcmd)
    local user_id = vRP.Passport(source)
    if not user_id then return end
    
    local result = RegisterTunnel.getFactionRanking()
    
    TriggerClientEvent("Notify", source, "verde", "Ranking testado! Verifique o console do servidor.", 5000)
end)

-- Comando para simular tempo de jogo
RegisterCommand("simulatetime", function(source, args, rawcmd)
    local user_id = vRP.Passport(source)
    if not user_id then return end
    
    local user = Organizations.Members[user_id]
    if not user then
        TriggerClientEvent("Notify", source, "vermelho", "Você não está em uma organização!", 5000)
        return
    end
    
    -- Simular tempo de jogo (em segundos)
    local hours = tonumber(args[1]) or 1
    local simulatedTime = hours * 3600 -- Converter horas para segundos
    
    -- Atualizar tempo no banco de dados
    vRP.Query("five_orgs_v2/AddPlayerTimePlayed", {user_id = user_id, timeplayed = simulatedTime})
    
    -- Atualizar tempo na memória
    if Organizations.Members[user_id] then
        Organizations.Members[user_id].timeplayed = (Organizations.Members[user_id].timeplayed or 0) + simulatedTime
    end
    
    
    TriggerClientEvent("Notify", source, "verde", "Tempo de jogo simulado: " .. hours .. " horas!", 5000)
end)