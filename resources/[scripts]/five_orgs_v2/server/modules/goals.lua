--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- PREPARES
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
vRP.Prepare('five_orgs_v2/bank/getinfo', 'SELECT bank,bank_historic FROM five_orgs_info WHERE organization = @organization')
vRP.Prepare('five_orgs_v2/bank/updateBank', 'UPDATE five_orgs_info SET bank = @bank, bank_historic = @historic WHERE organization = @organization')
vRP.Prepare('five_orgs_v2/updateConfigGoals', 'UPDATE five_orgs_info SET config_goals = @config_goals WHERE organization = @organization')
vRP.Prepare('five_orgs_v2/allOrganizationsGoals', ' SELECT * FROM five_orgs_goals ')
vRP.Prepare('five_orgs_v2/allGoals', ' SELECT * FROM five_orgs_goals WHERE organization = @organization ')
vRP.Prepare('five_orgs_v2/allDayGoals', ' SELECT * FROM five_orgs_goals WHERE organization = @organization and day = @day and month = @month ')
vRP.Prepare('five_orgs_v2/myGoals', ' SELECT * FROM five_orgs_goals WHERE user_id = @user_id and organization = @organization and day = @day and month = @month ')
vRP.Prepare('five_orgs_v2/updateFarm', 'UPDATE five_orgs_goals SET step = @step, reward_step = @reward_step WHERE user_id = @user_id AND organization = @organization AND month = @month AND day = @day')
vRP.Prepare('five_orgs_v2/getDailyFarms', 'SELECT * FROM five_orgs_goals WHERE organization = @organization and day = @day and month = @month ORDER BY amount DESC')
vRP.Prepare('five_orgs_v2/addPlayerFarm', 'INSERT IGNORE INTO five_orgs_goals(organization, user_id, item, amount, day, month) VALUES(@organization, @user_id, @item, @amount, @day, @month) ON DUPLICATE KEY UPDATE amount = amount + @amount;')

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local GOALS = {
    cooldown = {}
}

-- Função para verificar progresso dos itens
function GetItemProgress(user_id, item, requiredAmount)
    local user = Organizations.Members[user_id]
    if not user then return 0 end
    
    -- Verificar se é um item do inventário
    local itemAmount = vRP.GetItemAmount(user_id, item) or 0
    
    -- Calcular progresso
    local progress = math.min((itemAmount / requiredAmount) * 100, 100)
    return math.floor(progress)
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TUNNELS rc.remoto365.com.br
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function RegisterTunnel.getGoals() -- Funcionando e testado por five/literallyme/jokerdev
    local source = source
    local user_id = vRP.Passport(source)
    if not user_id then return false end

    local user = Organizations.Members[user_id]
    if not user then return false end

    if not Organizations.goalsConfig[user.groupType] then return false end

    local myGoals = vRP.query('five_orgs_v2/myGoals', { user_id = user_id, organization = user.groupType, day = os.date('%d'), month = os.date('%m') }) or {}
    local myItems, concluded_items = {}, 0
    for i = 1, #myGoals do
        local goal = myGoals[i]
        
        local valid_goal = Organizations.goalsConfig[user.groupType].info.itens
        if valid_goal[goal.item] then
            local maxItem = valid_goal[goal.item]

            myItems[goal.item] = {
                amount = goal.amount,
                step = 1
            }

            if myItems[goal.item].amount >= (maxItem * myItems[goal.item].step) then
                concluded_items = (concluded_items + 1)
            end
        end
    end

    local goalsItens,totalItems = {}, 0
    for item, maxItem in pairs(Organizations.goalsConfig[user.groupType].info.itens) do
        totalItems = (totalItems + 1)

        goalsItens[#goalsItens + 1] = {
            name = getItemName(item),
            item = item,
            quantity = myItems[item] and myItems[item].amount or 0,
            total = myItems[item] and maxItem * myItems[item].step or maxItem
        }
    end

    return {
        goalsReedemed = (concluded_items >= totalItems),
        items = goalsItens
    }
end

function RegisterTunnel.GetGoalsFaction(GetSrc) -- Funcionando e criado por five/literallyme/jokerdev
    local source = GetSrc or source

    local user_id = vRP.Passport(source)
    if not user_id then return false end

    local user = Organizations.Members[user_id]
    if not user then return false end

    local mymeta = {}
    local membersmeta = {}
    
    -- Integrar com sistema de metas do bs_farm
    if GetResourceState('bs_farm') == 'started' then
        local success, farmGoalsData = pcall(function()
            return exports['bs_farm']:GetFarmGoals(user_id, user.groupType)
        end)
        
        if success and farmGoalsData and #farmGoalsData > 0 then
            for _, goalData in pairs(farmGoalsData) do
                for _, item in pairs(goalData.items) do
                    table.insert(mymeta, {
                        name = item.name,
                        item = item.item,
                        current = item.current,
                        max = item.required
                    })
                end
            end
        end
    end
    
    -- Se não há metas do bs_farm, usar metas da organização
    if #mymeta == 0 and Organizations.goalsConfig[user.groupType] then
        -- Primeiro tentar usar as metas do arquivo de configuração
        local configGoals = Config.Groups[user.groupType] and Config.Groups[user.groupType].Config.Goals
        if configGoals and configGoals.itens then
            for _, goal in pairs(configGoals.itens) do
                if goal.tier and goal.tier <= user.tier then
                    -- Verificar progresso das metas
                    local progress = 0
                    local completed = true
                    local itemsProgress = {}
                    
                    for _, item in pairs(goal.items) do
                        local itemProgress = GetItemProgress(user_id, item.item, item.amount)
                        if itemProgress < 100 then
                            completed = false
                        end
                        progress = progress + itemProgress
                        
                        table.insert(itemsProgress, {
                            item = item.item,
                            current = vRP.GetItemAmount(user_id, item.item) or 0,
                            max = item.amount,
                            progress = itemProgress
                        })
                    end
                    
                    if #goal.items > 0 then
                        progress = progress / #goal.items
                    end
                    
                    table.insert(mymeta, {
                        name = goal.name,
                        description = goal.description,
                        items = itemsProgress,
                        reward = goal.reward,
                        completed = completed,
                        progress = math.floor(progress)
                    })
                end
            end
        end
        
        -- Se ainda não há metas, usar sistema antigo do banco de dados
        if #mymeta == 0 then
            local itensMeta = Organizations.goalsConfig[user.groupType].info.itens or {}
            for selectedItem, v in pairs(itensMeta) do
                local currentMeta = 0
                local maxMeta = v

                local myGoals = vRP.Query('five_orgs_v2/myGoals', { user_id = user_id, organization = user.groupType, day = os.date('%d'), month = os.date('%m') }) or {}
                if myGoals[1] then
                    local tbl = myGoals[1]
                    currentMeta = tbl.amount
                end

                table.insert(mymeta, {name = "META DIÁRIA", item = selectedItem, current = currentMeta, max = maxMeta})
            end
        end
    end

    -- Gerar ranking de membros (simplificado)
    local timeNow = os.time()
    local todayNow = os.date("*t", timeNow)
    local weekDays = (todayNow.wday == 1) and 6 or (todayNow.wday - 2)
    local mondayStart = timeNow - (weekDays * 86400)

    local tblFarmWeek = {}
    for i = 0, 6 do
        local dayTimeStamp = mondayStart + (i * 86400)
        local dateNow = os.date("*t", dayTimeStamp)

        local query2 = vRP.Query('five_orgs_v2/allDayGoals', {organization = user.groupType, day = dateNow.day, month = dateNow.month }) or {}
        for k,v in pairs(query2) do
            local tbl = v

            local identity = vRP.Identity(tbl.user_id)
            if not identity then goto next_player end

            if not tblFarmWeek[tostring(tbl.user_id)] then
                tblFarmWeek[tostring(tbl.user_id)] = {name = identity.name.." "..(identity.name2 or ""), id = tbl.user_id, status = {0, 0, 0, 0, 0, 0, 0}, value = tbl.amount}
            end

            local amountItem = 0
            local itensMeta = Organizations.goalsConfig[user.groupType] and Organizations.goalsConfig[user.groupType].info.itens or {}
            local totalMeta = 0

            for k,v in pairs(itensMeta) do
                local thisAmount = v
                totalMeta = totalMeta + thisAmount
            end

            for k,v in pairs(query2) do
                amountItem = amountItem + v.amount
            end

            if amountItem >= totalMeta then
                tblFarmWeek[tostring(tbl.user_id)].status[i + 1] = 1
            else
                tblFarmWeek[tostring(tbl.user_id)].status[i + 1] = 2
            end

            :: next_player ::
        end
    end

    for selectedPass,selectedTbl in pairs(tblFarmWeek) do
        for i = 0, 6 do
            local dayTimeStamp = mondayStart + (i * 86400)
            local dateNow = os.date("*t", dayTimeStamp)

            local myGoals = vRP.Query('five_orgs_v2/myGoals', { user_id = selectedPass, organization = user.groupType, day = os.date('%d'), month = os.date('%m') }) or {}
            if not myGoals[1] then
                if parseInt(dateNow.day) < parseInt(os.date('%d')) then
                    tblFarmWeek[tostring(selectedPass)].status[i + 1] = 2
                end
            end
        end
    end

    for k,v in pairs(tblFarmWeek) do
        membersmeta[#membersmeta+1] = v
    end

    table.sort(membersmeta, function(a, b)
        return a.value > b.value
    end)

    return {
        my = mymeta,
        members = membersmeta
    }
end

function RegisterTunnel.rewardGoal() -- Funcionando e criado por five/literallyme/jokerdev
    local source = source
    local user_id = vRP.Passport(source)
    if not user_id then return false end

    local identity = vRP.Identity(user_id)
    if not identity then return false end

    local user = Organizations.Members[user_id]
    if not user then return false end

    if not Organizations.goalsConfig[user.groupType] then return false end

    if GOALS.cooldown[user_id] and (GOALS.cooldown[user_id] - os.time()) > 0 then
        return Config.Langs['waitCooldown'](source)
    end
    GOALS.cooldown[user_id] = (os.time() + 5)

    local myGoals = vRP.Query('five_orgs_v2/myGoals', { user_id = user_id, organization = user.groupType, day = os.date('%d'), month = os.date('%m') }) or {}
    if #myGoals <= 0 or not myGoals[1] then
        return
    end

    local concluded_items = 0
    for i = 1, #myGoals do
        local goal = myGoals[i]
        
        local valid_goal = Organizations.goalsConfig[user.groupType].info.itens
        if valid_goal[goal.item] then
            local maxItem = valid_goal[goal.item]

            if goal.amount >= (maxItem * goal.step) then
                concluded_items = (concluded_items + 1)
            end
        end
    end

    local totalItems = 0
    for item, maxItem in pairs(Organizations.goalsConfig[user.groupType].info.itens) do
        totalItems = (totalItems + 1)
    end

    if concluded_items < totalItems then
        return
    end

    local reward_step = myGoals[1].reward_step
    if myGoals[1].step >= 1 then
        reward_step = (reward_step + 1)
    end
    vRP.Query('five_orgs_v2/updateFarm', { user_id = user_id, organization = user.groupType, day = os.date('%d'), month = os.date('%m'), reward_step = reward_step, step = (myGoals[1].step + 1) })

    -- PAGAR META
    local query = vRP.Query('five_orgs_v2/bank/getinfo', { organization = user.groupType })
    if #query == 0 then return end

    local amount = Organizations.goalsConfig[user.groupType].info.defaultReward or 0
    if not amount or not query[1].bank then
        return
    end
    if amount > query[1].bank then
        return Config.Langs['bankNotMoney'](source)
    end

    local bank_value = (query[1].bank - amount)
    local generate_log = BANK:generateLog(json.decode(query[1].bank_historic), {
        name = ('%s %s'):format(identity.name, identity.name2 or ""),
        type = "META DIARIA",
        value = amount,
        date = os.date('%d/%m/%Y %X'),
    })

    vRP.Query('five_orgs_v2/bank/updateBank', { organization = user.groupType, bank = bank_value, historic = json.encode(generate_log) })
    vRP.GiveBank(user_id, amount)

    Config.Langs['rewardedGoal'](source, amount)
    return true
end

function CalcularValorProporcional(reward, rewards, l) -- Funcionando e criado por five/literallyme/jokerdev
    local SomaTotalAmount = 0
    local SomaMinLMax = 0

    for _, item in ipairs(rewards) do
        SomaTotalAmount = SomaTotalAmount + item.amount
        SomaMinLMax = SomaMinLMax + math.min(l, item.max)
    end

    if SomaTotalAmount == 0 then return 0 end

    return math.floor((reward / SomaTotalAmount) * SomaMinLMax)
end

function RegisterTunnel.MyGoalsInfos() -- Funcionando e criado por five/literallyme/jokerdev
    local source = source
    local user_id = vRP.Passport(source)
    if not user_id then return false end

    local user = Organizations.Members[user_id]
    if not user then return false end

    if not Organizations.goalsConfig[user.groupType] then return false end

    local status = {}
    local rankingPosition = 99

    local timeNow = os.time()
    local todayNow = os.date("*t", timeNow)
    local weekDays = (todayNow.wday == 1) and 6 or (todayNow.wday - 2)
    local mondayStart = timeNow - (weekDays * 86400)

    for i = 0, 6 do
        status[i + 1] = 0

        local dayTimeStamp = mondayStart + (i * 86400)
        local dateNow = os.date("*t", dayTimeStamp)

        local query = vRP.Query('five_orgs_v2/myGoals', { user_id = user_id, organization = user.groupType, day = dateNow.day, month = dateNow.month }) or {}
        if query[1] then
            local amountItem = 0
            local itensMeta = Config.Groups[user.groupType].Config.Goals.itens or {}
            local totalMeta = 0

            for k,v in pairs(itensMeta) do
                local thisAmount = v
                totalMeta = totalMeta + thisAmount
            end

            for k,v in pairs(query) do
                amountItem = amountItem + v["amount"]
            end

            if amountItem >= totalMeta then
                status[i + 1] = 1
            else
                status[i + 1] = 2
            end
        else
            if parseInt(dateNow.day) < parseInt(os.date('%d')) then
                status[i + 1] = 2
            end
        end
    end

    local tblFarmWeek = {}
    for i = 0, 6 do
        local dayTimeStamp = mondayStart + (i * 86400)
        local dateNow = os.date("*t", dayTimeStamp)

        local query2 = vRP.Query('five_orgs_v2/allDayGoals', {organization = user.groupType, day = dateNow.day, month = dateNow.month }) or {}
        for k,v in pairs(query2) do
            local tbl = v

            if tblFarmWeek[tostring(tbl.user_id)] then
                tblFarmWeek[tostring(tbl.user_id)] = tblFarmWeek[tostring(tbl.user_id)] + tbl.amount
            else
                tblFarmWeek[tostring(tbl.user_id)] = tbl.amount
            end
        end
    end

    local newTblFarm = {}

    for k,v in pairs(tblFarmWeek) do
        newTblFarm[#newTblFarm + 1] = {user_id = parseInt(k), value = parseInt(v)}
    end

    table.sort(newTblFarm, function(a, b)
        return a.value > b.value
    end)

    for myPosition,tableFarm in pairs(newTblFarm) do
        if tableFarm.user_id == user_id then
            rankingPosition = myPosition
        end
    end

    return {
        status = status,
        rankingPosition = rankingPosition
    }
end

function RegisterTunnel.ClaimRewards(rewardsChoosed) -- Funcionando e criado por five/literallyme/jokerdev
    local source = source
    
    local user_id = vRP.Passport(source)
    if not user_id then 
        return false
    end

    local identity = vRP.Identity(user_id)
    if not identity then 
        return false
    end

    local user = Organizations.Members[user_id]
    if not user then 
        return false
    end

    if not Organizations.goalsConfig[user.groupType] then 
        return false
    end
    

    if GOALS.cooldown[user_id] and (GOALS.cooldown[user_id] - os.time()) > 0 then
        return Config.Langs['waitCooldown'](source)
    end
    GOALS.cooldown[user_id] = (os.time() + 5)
    
    -- Verificar se é uma meta do crafting
    if rewardsChoosed and rewardsChoosed.craftingType then
        if GetResourceState('crafting') == 'started' then
            local success = exports['crafting']:ClaimGoalReward(user_id, rewardsChoosed.craftingType)
            if success then
                return true
            end
        end
        return false
    end
    
    -- Verificar metas do bs_farm primeiro
    local farmGoalsData = nil
    local hasFarmGoals = false
    
    if GetResourceState('bs_farm') == 'started' then
        local success, result = pcall(function()
            return exports['bs_farm']:GetFarmGoals(user_id, user.groupType)
        end)
        
        if success and result and #result > 0 then
            farmGoalsData = result
            hasFarmGoals = true
        else
        end
    else
    end

    -- Verificar metas do bs_farm como fallback
    local farmGoalsData = nil
    local hasFarmGoals = false
    
    if not hasFarmGoals and GetResourceState('bs_farm') == 'started' then
        local success, result = pcall(function()
            return exports['bs_farm']:GetFarmGoals(user_id, user.groupType)
        end)
        
        if success and result and #result > 0 then
            farmGoalsData = result
            hasFarmGoals = true
        else
        end
    else
    end
    
    -- Se há metas do bs_farm, processar elas primeiro
    if hasFarmGoals and farmGoalsData then
        local totalReward = 0
        local hasCompletedGoals = false
        local completedGoals = {}
        
        -- Verificar se alguma meta está completa e calcular recompensa total
        for _, goalData in pairs(farmGoalsData) do
            local allCompleted = true
            for _, item in pairs(goalData.items) do
                if not item.completed then
                    allCompleted = false
                    break
                end
            end
            
            if allCompleted then
                totalReward = totalReward + goalData.reward
                hasCompletedGoals = true
                table.insert(completedGoals, goalData)
            end
        end
        
        
        -- Se há metas completas, dar a recompensa
        if hasCompletedGoals then
            local completedCount = #completedGoals
            local selectedQuantity = 0
            if rewardsChoosed and rewardsChoosed.rewards then
                for k, v in pairs(rewardsChoosed.rewards) do
                    selectedQuantity = v.amount
                    break
                end
            end
            
            local finalReward = math.min(selectedQuantity, totalReward)
            
            vRP.GiveMoney(user_id, "dollars", finalReward)
            TriggerClientEvent("Notify", source, "sucesso", "Você recebeu $" .. finalReward .. " por completar " .. completedCount .. " meta(s) do farm!", 5000)
            return true
        else
            TriggerClientEvent("Notify", source, "negado", "Nenhuma meta do farm foi completada ainda. Continue trabalhando!", 5000)
            return false
        end
    end

    -- Se há metas do crafting, processar elas
    if hasCraftingGoals and craftingGoalsData then
        local totalReward = 0
        local hasCompletedGoals = false
        local completedGoals = {}
        
        -- Verificar se alguma meta está completa e calcular recompensa total
        for _, goalData in pairs(craftingGoalsData) do
            local allCompleted = true
            for _, item in pairs(goalData.items) do
                if not item.completed then
                    allCompleted = false
                    break
                end
            end
            
            if allCompleted then
                totalReward = totalReward + goalData.reward
                hasCompletedGoals = true
                table.insert(completedGoals, goalData)
            end
        end
        
        
        -- Se há metas completas, dar a recompensa
        if hasCompletedGoals then
            local completedCount = #completedGoals
            local selectedQuantity = 0
            if rewardsChoosed and rewardsChoosed.rewards then
                for k, v in pairs(rewardsChoosed.rewards) do
                    selectedQuantity = v.amount
                    break
                end
            end
            
            if selectedQuantity <= 0 then
                selectedQuantity = completedCount
            end
            
            local finalReward = math.floor((totalReward / completedCount) * math.min(selectedQuantity, completedCount))
            
            
            vRP.GiveBank(user_id, finalReward)
            TriggerClientEvent("Notify", source, "verde", "Recompensa de $" .. finalReward .. " resgatada com sucesso!", 5000)
            
            -- Resetar apenas as metas que foram resgatadas
            local claimedCount = 0
            for _, goalData in pairs(completedGoals) do
                if claimedCount < selectedQuantity then
                    local success = pcall(function()
                        return exports['crafting']:ClaimGoalReward(user_id, goalData.type)
                    end)
                    if success then
                        claimedCount = claimedCount + 1
                    end
                end
            end
            
            return true
        else
            -- Não retornar false aqui, continuar para metas da organização
        end
    else
    end
    
    -- Se chegou até aqui, não há metas do crafting, verificar metas da organização
    local myGoals = vRP.Query('five_orgs_v2/myGoals', { user_id = user_id, organization = user.groupType, day = os.date('%d'), month = os.date('%m') }) or {}

    if #myGoals <= 0 or not myGoals[1] then
        TriggerClientEvent("Notify", source, "amarelo", "Você não tem metas completas para resgatar no momento. Complete algumas metas primeiro!", 5000)
        return false
    end

    local ChoosedAmount = 0
    local PaymentAmount = 0
    local TotalItemsAmounts = 0
    local TotalItemsMax = 0
    local TotalReward = 0

    local totalRequire = 0

    -- Processar dados recebidos do cliente
    if rewardsChoosed and rewardsChoosed.rewards then
        -- Se recebeu dados do novo formato (com slider)
        for k,v in pairs(rewardsChoosed.rewards) do
            ChoosedAmount = v.amount
        end
    else
        -- Formato antigo (compatibilidade)
        for k,v in pairs(rewardsChoosed) do
            ChoosedAmount = v.amount
        end
    end
    

    local goalItens = Organizations.goalsConfig[user.groupType].info.itens
    for k,v in pairs(goalItens) do
        TotalItemsAmounts = 300
        TotalItemsMax = math.min(ChoosedAmount, v)
        totalRequire = totalRequire + v
    end

    if Config.Groups[user.groupType].Config.Goals then
        TotalReward = Config.Groups[user.groupType].Config.Goals.defaultReward or 0
    end

    local TotalItensCount = {}
    for k,v in pairs(goalItens) do
        TotalItensCount[k] = {0, k}
    end

    for i = 1, #myGoals do
        local goal = myGoals[i]

        local valid_goal = Organizations.goalsConfig[user.groupType].info.itens
        if valid_goal[goal.item] then
            if goal.amount >= ChoosedAmount then
                if PaymentAmount == 0 then
                    PaymentAmount = parseInt((TotalReward / TotalItemsAmounts) * TotalItemsMax)
                end
            end

            TotalItensCount[goal.item] = {goal.amount, goal.item}
        end
    end

    local ContinueThis = true
    for IndexThisItem,ThisItemInfo in pairs(TotalItensCount) do
        if ThisItemInfo[1] <= 0 then
            ContinueThis = false
            Config.Langs.doesntHaveMinimumGoals(source, ThisItemInfo[2], ChoosedAmount)
        end
    end

    if not ContinueThis then Config.Langs.doesntHaveGoals(source) return false end

    if PaymentAmount <= 0 then 
        Config.Langs.doesntHaveGoals(source) 
        return false 
    end

    for IndexThisItem,ThisItemInfo in pairs(myGoals) do
        if (ThisItemInfo.amount - ThisItemInfo.reward_step) < ChoosedAmount then Config.Langs.alreadyGoal(source) return false end
    end

    local reward_step = ChoosedAmount
    for IndexThisItem,ThisItemInfo in pairs(myGoals) do
        if reward_step == ChoosedAmount then
            reward_step = (reward_step + ThisItemInfo.reward_step)
        end
    end

    for IndexThisItem,ThisItemInfo in pairs(myGoals) do
        if ThisItemInfo.reward_step >= totalRequire then Config.Langs.alreadyGoal(source) return false end
    end

    local TotalItensRequiredToReward = 0
    for IndexThisItem,ThisItemInfo in pairs(TotalItensCount) do
        TotalItensRequiredToReward = TotalItensRequiredToReward + ThisItemInfo[1]
    end

    if TotalItensRequiredToReward >= totalRequire then
        reward_step = totalRequire
        vRP.GiveBank(user_id, TotalReward)
        Config.Langs['bankMetaComplete'](source, parseFormat(TotalReward))
    end

    vRP.Query('five_orgs_v2/updateFarm', { user_id = user_id, organization = user.groupType, day = os.date('%d'), month = os.date('%m'), reward_step = reward_step, step = (myGoals[1].step + 1) })

    -- PAGAR META
    local query = vRP.Query('five_orgs_v2/bank/getinfo', { organization = user.groupType })
    if #query == 0 then return end

    local amount = parseInt(PaymentAmount)
    if not amount or not query[1].bank then
        return
    end
    if amount > query[1].bank then
        return Config.Langs['bankNotMoney'](source)
    end

    local bank_value = (query[1].bank - amount)
    local generate_log = BANK:generateLog(json.decode(query[1].bank_historic), {
        name = ('%s %s'):format(identity.name, identity.name2 or ""),
        type = "META DIARIA",
        value = amount,
        date = os.date('%d/%m/%Y %X'),
    })

    vRP.Query('five_orgs_v2/bank/updateBank', { organization = user.groupType, bank = bank_value, historic = json.encode(generate_log) })
    vRP.GiveBank(user_id, amount)

    Config.Langs['rewardedGoal'](source, amount)
    return true
end

function RegisterTunnel.getListGoals() -- Funcionando e testado por five/literallyme/jokerdev
    local source = source
    local user_id = vRP.Passport(source)
    if not user_id then return false end

    local user = Organizations.Members[user_id]
    if not user then return false end

    if not Organizations.goalsConfig[user.groupType] then return false end

    local goal = Organizations.goalsConfig[user.groupType].info
    local t  = {}
    local itemCount = 0
    local maxItems = 5 -- Limitar a apenas 5 itens
    
    for item, amount in pairs(goal.itens) do
        if itemCount >= maxItems then break end
        
        t[#t + 1] = {
            item = item,
            name = getItemName(item) or item,
            amount = amount
        }
        itemCount = itemCount + 1
    end

    return t
end

function RegisterTunnel.GetGoalsDetails()
    local source = source
    local user_id = vRP.Passport(source)
    if not user_id then return false end

    local user = Organizations.Members[user_id]
    if not user then return false end

    -- Verificar se há metas do bs_farm primeiro
    if GetResourceState('bs_farm') == 'started' then
        local success, farmGoals = pcall(function()
            return exports['bs_farm']:GetFarmGoals(user_id, user.groupType)
        end)
        
        if success and farmGoals and #farmGoals > 0 then
            local rewardsReturn = {}
            local totalReward = 0
            local goalsCurrent = 0
            local goalsMax = 0
            local itemCount = 0
            local maxItems = 5 -- Limitar a apenas 5 itens
            
            for _, goalData in pairs(farmGoals) do
                if itemCount >= maxItems then break end
                
                local allCompleted = true
                for _, item in pairs(goalData.items) do
                    if not item.completed then
                        allCompleted = false
                    end
                    goalsCurrent = goalsCurrent + item.current
                    goalsMax = goalsMax + item.required
                    
                    -- Adicionar item aos rewards (máximo 5)
                    if itemCount < maxItems then
                        local itemimage = itemIndex(item.item)
                        -- Garantir que max seja pelo menos 1 para evitar slider com max 0
                        local maxValue = math.max(item.required, 1)
                        rewardsReturn[#rewardsReturn+1] = {
                            image = "nui://vrp/config/inventory/"..(itemimage or item.item)..".png", 
                            amount = item.current, 
                            max = maxValue,
                            item = item.item,
                            name = item.name
                        }
                        itemCount = itemCount + 1
                    end
                end
                
                if allCompleted then
                    totalReward = totalReward + goalData.reward
                end
            end
            
            -- Se não há rewards, adicionar um item padrão para o slider funcionar
            if #rewardsReturn == 0 then
                rewardsReturn[#rewardsReturn+1] = {
                    image = "nui://vrp/config/inventory/unknown.png",
                    amount = 0,
                    max = 1,
                    item = "unknown",
                    name = "Nenhum item disponível"
                }
            end
            
            return {
                reward = totalReward,
                goalsCurrent = goalsCurrent,
                goalsMax = goalsMax,
                rewards = rewardsReturn
            }
        end
    end

    -- Se não há metas do bs_farm, usar metas da organização
    if not Organizations.goalsConfig[user.groupType] then 
        return {
            reward = 0,
            goalsCurrent = 0,
            goalsMax = 0,
            rewards = {{
                image = "nui://vrp/config/inventory/unknown.png",
                amount = 0,
                max = 1,
                item = "unknown",
                name = "Nenhum item disponível"
            }}
        }
    end

    local goal = Organizations.goalsConfig[user.groupType].info
    local rewardsReturn  = {}
    local itemCount = 0
    local maxItems = 5 -- Limitar a apenas 5 itens
    
    for item, amount in pairs(goal.itens) do
        if itemCount >= maxItems then break end
        
        local itemimage = itemIndex(item)
        -- Garantir que max seja pelo menos 1 para evitar slider com max 0
        local maxValue = math.max(amount, 1)
        rewardsReturn[#rewardsReturn+1] = {
            image = "nui://vrp/config/inventory/"..(itemimage or item)..".png", 
            amount = 0, -- Usar 0 em vez de 300 fixo
            max = maxValue,
            item = item,
            name = getItemName(item) or item
        }
        itemCount = itemCount + 1
    end

    local GoalsGet = RegisterTunnel.getGoals(source)

    local reward = 0
    local goalsCurrent = 0
    local goalsMax = 0

    if GoalsGet and GoalsGet.items then
        for k,v in pairs(GoalsGet.items) do
            goalsCurrent = goalsCurrent + v.quantity
            goalsMax = goalsMax + v.total
        end
    end

    if Config.Groups[user.groupType].Config.Goals then
        reward = Config.Groups[user.groupType].Config.Goals.defaultReward or 0
    end

    -- Se não há rewards, adicionar um item padrão para o slider funcionar
    if #rewardsReturn == 0 then
        rewardsReturn[#rewardsReturn+1] = {
            image = "nui://vrp/config/inventory/unknown.png",
            amount = 0,
            max = 1,
            item = "unknown",
            name = "Nenhum item disponível"
        }
    end

    return {
        reward = reward, -- Valor total da recompensa
        goalsCurrent = goalsCurrent, -- Progresso atual do jogador
        goalsMax = goalsMax, -- Meta máxima
        rewards = rewardsReturn
    }
end

function RegisterTunnel.saveGoals(data) -- Funcionando para administradores
    if not data then
        print("Erro: data é nil em saveGoals")
        return
    end
    local source = source
    local user_id = vRP.Passport(source)
    if not user_id then return false end

    local user = Organizations.Members[user_id]
    if not user then return false end

    -- Verificar se é administrador ou líder da organização
    local hasPermission = Organizations.Permissions[user.groupType] and Organizations.Permissions[user.groupType][user.group] and Organizations.Permissions[user.groupType][user.group].leader or false
    if not hasPermission then
        TriggerClientEvent("Notify", source, "vermelho", "Você não tem permissão para alterar as metas!", 5000)
        return false
    end


    local t = {}
    if data.goals and #data.goals > 0 then
        t.info = {
            defaultReward = data.reward or 1000,
            itens = {}
        }
        
        for index, goal in pairs(data.goals) do
            if goal.item and goal.amount then
                t.info.itens[goal.item] = tonumber(goal.amount) or 0
            end
        end
    end

    if t.info and t.info.itens then
        -- Atualizar configuração na memória
        if not Organizations.goalsConfig[user.groupType] then
            Organizations.goalsConfig[user.groupType] = {}
        end
        Organizations.goalsConfig[user.groupType] = t
        
        -- Salvar no banco de dados
        vRP.Query('five_orgs_v2/updateConfigGoals', { organization = user.groupType, config_goals = json.encode(t) })
        
        TriggerClientEvent("Notify", source, "verde", "Metas atualizadas com sucesso!", 5000)
        return true
    else
        TriggerClientEvent("Notify", source, "vermelho", "Dados de metas inválidos!", 5000)
        return false
    end
end

RegisterTunnel.OpenChest = function()
    local source = source
    local user_id = vRP.Passport(source)
    if not user_id then return false end
    
    local user = Organizations.Members[user_id]
    if not user then return false end
    
    -- Verificar se o jogador tem permissão para acessar o baú
    if not user.groupType then return false end
    
    return true
end

-- Comando para forçar sincronização das metas
RegisterCommand("syncgoals", function(source, args, rawcmd)
    local user_id = vRP.Passport(source)
    if not user_id then return end
    
    if not vRP.HasPermission(user_id, "Admin") then
        TriggerClientEvent("Notify", source, "vermelho", "Você não tem permissão para usar este comando!", 5000)
        return
    end
    
    TriggerClientEvent("Notify", source, "amarelo", "Sincronizando metas do farm...", 3000)
    
    -- Executar comando de sincronização do bs_farm
    if GetResourceState('bs_farm') == 'started' then
        ExecuteCommand("syncfarmgoals")
        TriggerClientEvent("Notify", source, "verde", "Sincronização executada! Verifique o console para detalhes.", 5000)
    else
        TriggerClientEvent("Notify", source, "vermelho", "bs_farm não está iniciado!", 5000)
    end
end)

-- Comando para testar sistema de baú
RegisterCommand("testchest", function(source, args, rawcmd)
    local user_id = vRP.Passport(source)
    if not user_id then return end
    
    local user = Organizations.Members[user_id]
    if not user then
        TriggerClientEvent("Notify", source, "vermelho", "Você não está em uma organização!", 5000)
        return
    end
    
    -- Testar query do baú
    local chestName = user.groupType
    local query = vRP.Query("chests/GetChests", { name = chestName })
    
    if query[1] then
        TriggerClientEvent("Notify", source, "verde", "Baú encontrado: " .. chestName .. " (Peso: " .. query[1].weight .. "kg)", 5000)
    else
        TriggerClientEvent("Notify", source, "vermelho", "Baú não encontrado: " .. chestName, 5000)
    end
end)

-- Comando para criar target de baú
RegisterCommand("createchesttarget", function(source, args, rawcmd)
    local user_id = vRP.Passport(source)
    if not user_id then return end
    
    local user = Organizations.Members[user_id]
    if not user then
        TriggerClientEvent("Notify", source, "vermelho", "Você não está em uma organização!", 5000)
        return
    end
    
    -- Verificar se é administrador ou líder
    local hasPermission = Organizations.Permissions[user.groupType] and Organizations.Permissions[user.groupType][user.group] and Organizations.Permissions[user.groupType][user.group].leader or false
    if not hasPermission then
        TriggerClientEvent("Notify", source, "vermelho", "Você não tem permissão para criar targets de baú!", 5000)
        return
    end
    
    local organization = user.groupType
    local label = args[1] or "Baú da " .. organization
    
    -- Obter coordenadas do jogador
    local coords = GetEntityCoords(GetPlayerPed(source))
    
    -- Criar target no cliente
    TriggerClientEvent("five_orgs_v2:createChestTarget", source, coords, organization, label)
    
    TriggerClientEvent("Notify", source, "verde", "Target de baú criado para " .. organization .. "!", 5000)
end)

-- Comando para listar targets de baú
RegisterCommand("listchesttargets", function(source, args, rawcmd)
    local user_id = vRP.Passport(source)
    if not user_id then return end
    
    local user = Organizations.Members[user_id]
    if not user then
        TriggerClientEvent("Notify", source, "vermelho", "Você não está em uma organização!", 5000)
        return
    end
    
    -- Listar targets existentes
    TriggerClientEvent("five_orgs_v2:listChestTargets", source)
end)

function addGoalBase(user_id, item, amount)
    user_id = parseInt(user_id)
    local source = vRP.Source(user_id)
    if not source then return end

    local user = Organizations.Members[user_id]
    if not user then return end

    local query = vRP.Query("five_orgs_v2/GetAllUserInfo", {user_id = user_id})
    for k,v in pairs(query) do
        if not Organizations.goalsConfig[v.organization] then goto next_player end
        if not Organizations.goalsConfig[v.organization].info.itens[item] then goto next_player end

        vRP.Query('five_orgs_v2/addPlayerFarm', { organization = v.organization, user_id = user_id, item = item, amount = amount, day = os.date('%d'), month = os.date('%m') })

        :: next_player ::
    end
end

exports('addGoal', function(user_id, item, amount)
    addGoalBase(user_id, item, amount)
end)

-- O de baixo foi criado apenas para afim de teste (só mexa se entender)
-- RegisterCommand("addgoal", function(source,args,rawcmd)
--     addGoalBase(args[1], args[2], args[3])
-- end)




CreateThread(function()
    while true do
        local allOrganizationsGoals = vRP.Query('five_orgs_v2/allOrganizationsGoals', {})
        local deleteGoals = {}
        local deleteAmount = 0
        for k,v in pairs(allOrganizationsGoals) do
            local timeNow = os.time()
            local today = os.date("*t", timeNow)

            for i = 8, 23 do
                local pastTime = os.time({
                    year = today.year,
                    month = today.month,
                    day = today.day
                }) - (i * 86400)

                local pastDate = os.date("*t", pastTime)

                if v.day == pastDate.day and v.month == pastDate.month then
                    deleteAmount = deleteAmount + 1
                    deleteGoals[#deleteGoals+1] = {day = v.day, month = v.month}
                end
            end
        end

        for k,v in pairs(deleteGoals) do
            vRP.Query('five_orgs_v2/deleteGoal', {day = v.day, month = v.month})
        end

        print(('^2[%s] ^0Metas semanais resetadas da última semana: %s.'):format(GetCurrentResourceName():upper(), deleteAmount))

        Wait(3600000)
    end
end)

-- Função para calcular valor total das recompensas disponíveis
function RegisterTunnel.GetTotalRewardValue(GetSrc)
    local source = GetSrc or source
    local user_id = vRP.Passport(source)
    if not user_id then return 0 end

    local totalReward = 0
    
    -- Verificar metas do bs_farm
    if GetResourceState('bs_farm') == 'started' then
        local farmGoalsData = exports['bs_farm']:GetFarmGoals(user_id, user.groupType)
        if farmGoalsData and #farmGoalsData > 0 then
            for _, goalData in pairs(farmGoalsData) do
                local allCompleted = true
                for _, item in pairs(goalData.items) do
                    if not item.completed then
                        allCompleted = false
                        break
                    end
                end
                
                if allCompleted then
                    totalReward = totalReward + goalData.reward
                end
            end
        end
    end
    
    return totalReward
end

-- Comando para recarregar configurações de metas
RegisterCommand('reloadgoals', function(source, args, rawcmd)
    local user_id = vRP.Passport(source)
    if not user_id then return end
    
    if not vRP.HasPermission(user_id, "Admin", 1) then
        TriggerClientEvent("Notify", source, "vermelho", "Você não tem permissão para usar este comando!", 5000)
        return
    end
    
    TriggerClientEvent("Notify", source, "amarelo", "Recarregando configurações de metas...", 3000)
    
    -- Recarregar configurações do arquivo
    for orgName, orgConfig in pairs(Config.Groups) do
        if orgConfig.Config and orgConfig.Config.Goals then
            if not Organizations.goalsConfig[orgName] then
                Organizations.goalsConfig[orgName] = {}
            end
            
            Organizations.goalsConfig[orgName].info = {
                itens = {},
                defaultReward = orgConfig.Config.Goals.defaultReward or 1000
            }
            
            -- Carregar metas do arquivo de configuração
            if orgConfig.Config.Goals.itens then
                for _, goal in pairs(orgConfig.Config.Goals.itens) do
                    if goal.tier and goal.items then
                        for _, item in pairs(goal.items) do
                            if not Organizations.goalsConfig[orgName].info.itens[item.item] then
                                Organizations.goalsConfig[orgName].info.itens[item.item] = item.amount
                            end
                        end
                    end
                end
            end
        end
    end
    
    TriggerClientEvent("Notify", source, "verde", "Configurações de metas recarregadas!", 5000)
end)




