-- CONEXÕES
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPC = Tunnel.getInterface('vRP')

Creative = {}
Tunnel.bindInterface("bancada", Creative)
vCLIENT = Tunnel.getInterface("bancada")
vKEYBOARD = Tunnel.getInterface("keyboard")
local Objects = {}
bancadas = {}
local ImageUrl = "nui://vrp/config/inventory/"
local quantidadePolicia = 0
local dinheiro = { -- valor de cada droga (1 qtd)
    ["joint"] = 7500,
    ["cocaine"] = 7500,
    ["ANFETAMINASAQUINHOZIPLOCK"] = 9500,
    ["haxixesaquinhoziplock"] = 10500,
    ["lancacolombina"] = 11500,
    ["CODEINAVENDASACOZIPLOCK"] = 14500,
}
local drogas = { -- drogas disponiveis para colocar na bancada
    "joint",
    "ANFETAMINASAQUINHOZIPLOCK",
    "cocaine",
    "haxixesaquinhoziplock",
    "lancacolombina",
    "CODEINAVENDASACOZIPLOCK",
}

function Creative.getBancadas()
    return bancadas
end

local function getPoliceServices()
    local Services = {}
    local Permissions = { "Policia", "2BPChq", "3BPChq", "4BPChq", "Baep" }
    for _, perm in ipairs(Permissions) do
        local Srv = vRP.NumPermission(perm)
        if type(Srv) == "table" then
            for passport, src in pairs(Srv) do
                Services[tostring(passport)] = src
            end
        end
    end
    return Services
end

function Creative.checkPolice()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
        local Services = getPoliceServices()
        local Total = 0
        for _ in pairs(Services) do Total = Total + 1 end

        if Total >= quantidadePolicia then
            return true
        else
            TriggerClientEvent("Notify",source,"amarelo","Contingente indisponível.",5000)
        end
    end
    return false
end

local function getPoliceCount()
    local Services = getPoliceServices()
    local Total = 0
    for _ in pairs(Services) do Total = Total + 1 end
    return Total
end

local function policeMultiplier()
    local count = getPoliceCount()
    local mult = 1.0 + (count * 0.10)
    if mult > 3.0 then
        mult = 3.0
    end
    return mult
end

function Creative.getDroga(perm)
    return drogas[perm],itemName(drogas[perm])
end

function Creative.returnDrugs(number)
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        if not bancadas[Passport] then
            bancadas[Passport] = {}
            for Index,item in pairs(drogas) do 
                local itemIndexValue = itemIndex(item)
                local consult = vRP.InventoryItemAmount(Passport,item)
                local invQtd = consult and consult[1] or 0
                if item == "joint" then
                    local consultJ0 = vRP.InventoryItemAmount(Passport,"joint-0")
                    invQtd = invQtd + (consultJ0 and consultJ0[1] or 0)
                end
                bancadas[Passport][Index] = {
                    item = item,
                    name = itemName(item),
                    image = itemIndexValue and (ImageUrl..itemIndexValue..".png") or (ImageUrl.."default.png"),
                    invQtd = invQtd,
                    counnInTable = 0
                }
            end
        else
            for Index,Value in pairs(bancadas[Passport]) do 
                local consult = vRP.InventoryItemAmount(Passport,Value.item)
                local invQtd = consult and consult[1] or 0
                if Value.item == "joint" then
                    local consultJ0 = vRP.InventoryItemAmount(Passport,"joint-0")
                    invQtd = invQtd + (consultJ0 and consultJ0[1] or 0)
                end
                bancadas[Passport][Index]["invQtd"] = invQtd
            end
        end  
    end
    return bancadas[Passport]
end


function Creative.AddDrug(Index,Number,AmountParam)
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        local idx = tonumber(Index)
        if not idx or idx < 1 or idx > #drogas then
            TriggerClientEvent("Notify",source,"amarelo","Seleção inválida.",5000)
            return
        end
        if not bancadas[Passport] then
            bancadas[Passport] = {}
            for i,item in pairs(drogas) do
                local itemIndexValue = itemIndex(item)
                local invQtd = vRP.ItemAmount(Passport,item)
                if item == "joint" then
                    invQtd = invQtd + vRP.ItemAmount(Passport,"joint-0")
                end
                bancadas[Passport][i] = {
                    item = item,
                    name = itemName(item),
                    image = itemIndexValue and (ImageUrl..itemIndexValue..".png") or (ImageUrl.."default.png"),
                    invQtd = invQtd,
                    counnInTable = 0
                }
            end
        end
        local Drug = bancadas[Passport][idx] and bancadas[Passport][idx]["item"]
        if not Drug then
            TriggerClientEvent("Notify",source,"amarelo","Item inválido.",5000)
            return
        end
        local Amount = tonumber(AmountParam) or 1
        if Amount > 0 then
            local takeItemOk = vRP.TakeItem(Passport,Drug,Amount,true)
            if not takeItemOk and Drug == "joint" then
                takeItemOk = vRP.TakeItem(Passport,"joint-0",Amount,true)
            end
            if takeItemOk then
                bancadas[Passport][idx]["counnInTable"] = bancadas[Passport][idx]["counnInTable"] + Amount
                TriggerClientEvent("bancada:attCountInTable",source,idx,bancadas[Passport][idx]["counnInTable"])
                local consult = vRP.InventoryItemAmount(Passport,Drug)
                local invQtd = consult and consult[1] or 0
                if Drug == "joint" then
                    local consultJ0 = vRP.InventoryItemAmount(Passport,"joint-0")
                    invQtd = invQtd + (consultJ0 and consultJ0[1] or 0)
                end
                bancadas[Passport][idx]["invQtd"] = invQtd
                TriggerClientEvent("bancada:attInvQtd",source,idx,invQtd)
                TriggerClientEvent("inventory:Update",source,"Backpack")
                local table = {}
                for k,Value in pairs(bancadas[Passport]) do 
                    for i = 1, Value["counnInTable"] do
                        table[#table+1] = Value.item
                    end
                end
                if Objects[Number] then
                    Objects[Number].props = table
                end
                TriggerClientEvent("bancada:addProps",-1,Number,table)
                SendWebhookMessage(config.webhookDrogasAdded,"```prolog\n[ID]: "..Passport.." \n[ADD ITEM]: "..bancadas[Passport][idx]["item"].."\n[QUANTIDADE]:"..Amount.."  "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```",source)
            else
                TriggerClientEvent("Notify",source,"amarelo","Não há quantidade suficiente no inventário.",5000)
            end
        else
            TriggerClientEvent("Notify",source,"amarelo","Quantidade inválida.",5000)
        end
    end
end

function Creative.remDrug(Index,Number,AmountParam)
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        local idx = tonumber(Index)
        if not idx or idx < 1 or idx > #drogas then
            TriggerClientEvent("Notify",source,"amarelo","Seleção inválida.",5000)
            return
        end
        local Drug = bancadas[Passport][idx]["item"]
        local Amount = tonumber(AmountParam) or 1
        if Amount > 0 then
                if bancadas[Passport][idx]["counnInTable"] >= Amount then
                    if vRP.InventoryWeight(Passport) + itemWeight(Drug)*Amount <= vRP.GetWeight(Passport) then
                        bancadas[Passport][idx]["counnInTable"] = bancadas[Passport][idx]["counnInTable"] - Amount
                        vRP.GenerateItem(Passport,Drug,Amount,true)
                        TriggerClientEvent("bancada:attCountInTable",source,idx,bancadas[Passport][idx]["counnInTable"])
                        local consult = vRP.InventoryItemAmount(Passport,Drug)
                        local invQtd = consult and consult[1] or 0
                        if Drug == "joint" then
                            local consultJ0 = vRP.InventoryItemAmount(Passport,"joint-0")
                            invQtd = invQtd + (consultJ0 and consultJ0[1] or 0)
                        end
                        bancadas[Passport][idx]["invQtd"] = invQtd
                        TriggerClientEvent("bancada:attInvQtd",source,idx,invQtd)
                        TriggerClientEvent("inventory:Update",source,"Backpack")
                        local table = {}
                        for k,Value in pairs(bancadas[Passport]) do 
                            for i = 1, Value["counnInTable"] do
                                table[#table+1] = Value.item
                            end
                        end
                        if Objects[Number] then
                            Objects[Number].props = table
                        end
                        TriggerClientEvent("bancada:remProps",-1,Number,table)
                        SendWebhookMessage(config.webhookRemove,"```prolog\n[ID]: "..Passport.." \n[REM ITEM]: "..bancadas[Passport][idx]["item"].."\n[QUANTIDADE]:"..Amount.."  "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```",source)
                    else
                        TriggerClientEvent("Notify",source,"sucesso","Espaço insuficiente.",5000)
                    end
                else
                    TriggerClientEvent("Notify",source,"amarelo","Não há <b>"..Amount.."x "..itemName(Drug).."</b> na bancada!",5000)
                end
        else
            TriggerClientEvent("Notify",source,"sucesso","Quantidade inválida.",5000)
        end
    end
end

function Creative.callPmesp(source)
	local source = source or source
    local Passport = vRP.Passport(source)
    if Passport then
        TriggerEvent("Wanted",source,Passport,300)
        local Coords = GetEntityCoords(GetPlayerPed(source))
        local Services = getPoliceServices()
        for Passports,Sources in pairs(Services) do
            async(function()
                vRPC.PlaySound(Sources,"ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET")
                TriggerClientEvent("NotifyPush",Sources,{ code = "QTH", title = "Denúncia Anônima", x = Coords["x"], y = Coords["y"], z = Coords["z"], criminal = "Suspeita de tráfico de drogas", time = "Recebido às "..os.date("%H:%M"), blipColor = 16 })
            end)
        end
    end
end

RegisterServerEvent("bancada:Guardar")
AddEventHandler("bancada:Guardar",function(Number)
	local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        if bancadas[Passport] then
            -- Verifica peso e devolve as drogas da bancada para o inventário
            local weightNeeded = 0
            for Index, Value in pairs(bancadas[Passport]) do
                if Value.counnInTable > 0 then
                    weightNeeded = weightNeeded + (itemWeight(Value.item) or 0) * Value.counnInTable
                end
            end
            if weightNeeded > 0 then
                if vRP.InventoryWeight(Passport) + weightNeeded > vRP.GetWeight(Passport) then
                    TriggerClientEvent("Notify", source, "vermelho", "Espaço insuficiente no inventário para devolver as drogas.", 5000)
                    return
                end
                for Index, Value in pairs(bancadas[Passport]) do
                    if Value.counnInTable > 0 then
                        vRP.GenerateItem(Passport, Value.item, Value.counnInTable, true)
                    end
                end
                TriggerClientEvent("inventory:Update", source, "Backpack")
            end
            bancadas[Passport] = nil
        end
        local Ped = GetPlayerPed(source)
        local Coords = GetEntityCoords(Ped)
        SendWebhookMessage(config.webhookExit,"```prolog\n[ID]: "..Passport.." \n[CDS]: "..(json.encode(Coords)).."  "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```",source)
        vRP.GenerateItem(Passport,"drugtable",1,true)
        TriggerClientEvent("bancada:Remover",-1,Number)
        Objects[Number] = nil
    end
end)


function Creative.sellDrug(Number)
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        if not bancadas[Passport] then
            bancadas[Passport] = {}
            for Index,item in pairs(drogas) do 
                local itemIndexValue = itemIndex(item)
                local consult = vRP.InventoryItemAmount(Passport,item)
                local invQtd = consult and consult[1] or 0
                if item == "joint" then
                    local consultJ0 = vRP.InventoryItemAmount(Passport,"joint-0")
                    invQtd = invQtd + (consultJ0 and consultJ0[1] or 0)
                end
                bancadas[Passport][Index] = {
                    item = item,
                    name = itemName(item),
                    image = itemIndexValue and (ImageUrl..itemIndexValue..".png") or (ImageUrl.."default.png"),
                    invQtd = invQtd,
                    counnInTable = 0
                }
            end
        end

        -- Compra = 1 de cada droga que tiver na bancada (não precisa ter todas)
        local mult = policeMultiplier()
        local firstItemName = bancadas[Passport][1] and itemName(bancadas[Passport][1].item) or "droga"
        if not vRP.Request(source, firstItemName, getRandomMessage()) then
            return
        end

        local totalMoney = 0
        for idx = 1, #drogas do
            local Entry = bancadas[Passport][idx]
            if Entry and Entry["counnInTable"] >= 1 then
                Entry["counnInTable"] = Entry["counnInTable"] - 1
                local price = dinheiro[Entry.item] or 0
                totalMoney = totalMoney + math.floor(price * 1 * mult)
                TriggerClientEvent("bancada:attCountInTable", source, idx, Entry["counnInTable"])
            end
        end

        if totalMoney > 0 then
            vRP.GenerateItem(Passport, "dollars2", totalMoney)
            local table = {}
            for K, Value in pairs(bancadas[Passport]) do 
                for i = 1, Value["counnInTable"] do
                    table[#table+1] = Value.item
                end
            end
            if Objects[Number] then
                Objects[Number].props = table
            end
            TriggerClientEvent("bancada:remProps", -1, Number, table)
            Creative.callPmesp(source)
            TriggerClientEvent("Notify", source, "verde", "Ta na mão, R$ "..parseFormat(totalMoney).." (1 de cada que tinha)", 5000)
        else
            TriggerClientEvent("Notify", source, "amarelo", "Não tem droga na bancada!", 5000)
        end
    end
end

-- Tabela de mensagens
Messages = {
    'Eae, meu chapa! Tô em busca daquele conteúdo diferenciado, sabe? Tem a parada da boa pra vender? 👀💨',
    'Oi, boa noite me vê 2 Ck de 20 cria? 🌬️💨',
    'Oba oba, 4 po de 5 família? 🌬️💨',
    'Coe cria bom, tem skank paizão? Me vê 2 ai paizão? 🌬️💨',
    'Parada de 20 pai a forte? 🌬️💨',
    'Matin de 10 mano, me da uma aí? 🌬️💨',
    'cria tem? É quanto? Me da um ai paizão? 🌬️💨',
    'Solta a braba de galo aí pra nois marola no baile mais tarde? 🌬️💨',
    'Me vé uma Droga ai? 🌬️💨',
    'Boa me vé um Chá? 🌬️💨',
    'Tem de 10 padrinho? 🌬️💨',
    'Tem 2 do bom Chefe? 🌬️💨',
    'Tem a braba ai? 🌬️💨',
    'Visão da boca tem droga? 🌬️💨',
    'Fé, droga de 20 cria? 🌬️💨'
}

-- Função para obter uma mensagem aleatória
function getRandomMessage()
    -- Semente do gerador de números aleatórios
    math.randomseed(os.time())
    -- Seleciona um índice aleatório de 1 ao tamanho da tabela Messages
    local randomIndex = math.random(1, #Messages)
    -- Retorna a mensagem aleatória
    return Messages[randomIndex]
end

function SendWebhookMessage(webhook,message,Source)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
    if Source then
		TriggerClientEvent("Screenshot",Source,webhook)
	end
end



RegisterServerEvent("bancada:Adicionar")
AddEventHandler("bancada:Adicionar",function(Number,Table)
	Objects[Number] = Table
end)

AddEventHandler("Connect",function(Passport,source)
	TriggerClientEvent("bancada:Table",source,Objects)
end)

exports("canSell",function(source)
--[[     local playercoords = GetEntityCoords(GetPlayerPed(source))
    for i in ipairs(config.LocalCoords) do
        local coords = config.LocalCoords[i][1]
        local distance = #(playercoords - coords)
        if distance <= config.LocalCoords[i][4] then
            return true
        end
    end ]]
    return true
end)
