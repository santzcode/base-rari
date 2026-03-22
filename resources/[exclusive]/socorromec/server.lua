
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")

-- Comando /chamarmec - chama o NPC
RegisterServerEvent("hiden:solicitarNPCMecanico")
AddEventHandler("hiden:solicitarNPCMecanico", function()
    local source = source
    local user_id = vRP.Passport(source)

    if user_id then
        if vRP.PaymentFull(user_id, 30000, "SocorroMec") then
            TriggerClientEvent("hiden:autorizarNPCMecanico", source)
            TriggerClientEvent("Notify", source, "sucesso", "Você pagou R$ 30.000 pelo atendimento do mecânico.")

            local webhookNPCMEC = "https://discord.com/api/webhooks/1343603961973968966/c3f6_EKsEHIgtaDjNsPAJ5vMfZYqYZQoZmu4eiJwIEQccgbC9WDADib1TWxQFJegjBqt"
            local nome = vRP.FullName(user_id)

            local date = os.date("%d/%m/%Y")
            local time = os.date("%H:%M:%S")
            local mensagem = string.format(
                "👤 Jogador: **%s**\n🆔 ID: %d\n💰 Valor Pago: R$ %d\n📅 Data: %s\n⏰ Hora: %s",
                nome, user_id, 30000, date, time
            )

            PerformHttpRequest(webhookNPCMEC, function(err, text, headers)
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
        else
            TriggerClientEvent("Notify", source, "negado", "Você não tem dinheiro suficiente.")
        end
    end
end)

-- Comando /socorromec - reparo imediato
RegisterServerEvent("hiden:solicitarReparo")
AddEventHandler("hiden:solicitarReparo", function()
    local source = source
    local user_id = vRP.Passport(source)

    if user_id then
        TriggerClientEvent("hiden:validarReparo", source)
    end
end)

RegisterServerEvent("hiden:executarReparo")
AddEventHandler("hiden:executarReparo", function(plate)
    local source = source
    local user_id = vRP.Passport(source)

    if user_id then
        local allowed = true
        if plate and plate ~= "" then
            plate = string.gsub(plate,"%s+","")
            local info = vRP.PassportPlate(plate)
            if info and info.Passport and parseInt(info.Passport) ~= parseInt(user_id) then
                allowed = false
            else
                local plates = GlobalState["Plates"] or {}
                local state = plates[plate]
                if type(state) == "number" and parseInt(state) ~= parseInt(user_id) then
                    allowed = false
                end
            end
        end
        if not allowed then
            TriggerClientEvent("Notify", source, "negado", "Este veículo não pertence a você.")
            return
        end

        if vRP.PaymentFull(user_id, 30000, "ReparoImediato") then
            TriggerClientEvent("hiden:repararVeiculo", source)
            TriggerClientEvent("Notify", source, "sucesso", "Você pagou R$ 30.000 pelo reparo imediato.")

            local webhook = "https://discord.com/api/webhooks/1343603961973968966/c3f6_EKsEHIgtaDjNsPAJ5vMfZYqYZQoZmu4eiJwIEQccgbC9WDADib1TWxQFJegjBqt"
            local nome = vRP.FullName(user_id)

            local mensagem = string.format(
                "👤 Jogador: **%s**\n🆔 ID: %d\n💰 Valor Pago: R$ %d\n📅 Data: %s\n⏰ Hora: %s",
                nome, user_id, 30000, os.date("%d/%m/%Y"), os.date("%H:%M:%S")
            )

            PerformHttpRequest(webhook, function() end, 'POST', json.encode({
                username = "SocorroImediato",
                embeds = {{
                    title = "Reparo Imediato",
                    description = mensagem,
                    color = 65280
                }}
            }), { ['Content-Type'] = 'application/json' })
        else
            TriggerClientEvent("Notify", source, "negado", "Você não tem dinheiro suficiente.")
        end
    end
end)

RegisterServerEvent("hiden:autorizacaoReparoPlaca")
AddEventHandler("hiden:autorizacaoReparoPlaca", function(plate)
    local source = source
    local user_id = vRP.Passport(source)
    local allowed = true
    if user_id and plate and plate ~= "" then
        plate = string.gsub(plate,"%s+","")
        local info = vRP.PassportPlate(plate)
        if info and info.Passport and parseInt(info.Passport) ~= parseInt(user_id) then
            allowed = false
        else
            local plates = GlobalState["Plates"] or {}
            local state = plates[plate]
            if type(state) == "number" and parseInt(state) ~= parseInt(user_id) then
                allowed = false
            end
        end
    end
    if allowed then
        TriggerClientEvent("hiden:autorizadoReparoPlaca", source)
    else
        TriggerClientEvent("hiden:negadoReparoPlaca", source)
        TriggerClientEvent("Notify", source, "negado", "Este veículo não pertence a você.")
    end
end)
