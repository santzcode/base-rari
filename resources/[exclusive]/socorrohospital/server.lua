local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")

local webhookURL = "https://discord.com/api/webhooks/1402291093533360198/81R3QCow4KvHSEJqmq8-Nj1wwCw-eQT_uLpa4726xgFaZIRg1vxk6HVjudXRQwW3lqcv"

local function sendToDiscord(playerName, user_id, valorPago)
    local date = os.date("%d/%m/%Y")
    local time = os.date("%H:%M:%S")
    local mensagem = string.format(
        "👤 Jogador: **%s**\n🆔 ID: %d\n💰 Valor Pago: R$ %d\n📅 Data: %s\n⏰ Hora: %s",
        playerName, user_id, valorPago, date, time
    )

    PerformHttpRequest(webhookURL, function(err, text, headers)
        if err ~= 204 then
            print("[WEBHOOK ERROR] Código: "..tostring(err))
        end
    end, 'POST', json.encode({
        username = "SocorroNPC",
        embeds = {{
            title = "Alerta Socorro Hospital",
            description = mensagem,
            color = 16711680
        }}
    }), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent("socorro:verificarMedicosAmbulancia")
AddEventHandler("socorro:verificarMedicosAmbulancia", function()
    local source = source
    local user_id = vRP.Passport(source)
    local _, medicosHosp = vRP.NumPermission("Hospital")
    local _, medicosBombeiro = vRP.NumPermission("Bombeiro")
    local medicosOnline = (medicosHosp or 0) + (medicosBombeiro or 0)

    local playerName = GetPlayerName(source)

    if medicosOnline == 0 then
        if vRP.PaymentFull(user_id, 30000, "SocorroHospital") then
            TriggerClientEvent("socorro:enviarAmbulanciaNPC", source)
            TriggerClientEvent("Notify", source, "sucesso", "Uma ambulância está a caminho. Custo: R$30.000.")

            vRP.GenerateItem(user_id,"bandage",2,true)
            
            sendToDiscord(playerName, user_id, 30000)
        else
            TriggerClientEvent("Notify", source, "negado", "Você não tem dinheiro suficiente!")
        end
    else
        TriggerClientEvent("Notify", source, "negado", "Há médicos de serviço, chame pelo /112!")
        
        sendToDiscord(playerName, user_id, 0)
    end
end)

RegisterServerEvent("socorro:reviverPlayer")
AddEventHandler("socorro:reviverPlayer", function()
    local source = source
    TriggerClientEvent("player:revive", source)
end)
