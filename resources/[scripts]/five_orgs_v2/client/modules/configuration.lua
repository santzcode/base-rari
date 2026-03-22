RegisterNUICallback('GetPermissions', function(data, cb)
    local permissions = vTunnel.getPermissions(data.roleEdit)

    local t = {}
    for perm, status in pairs(permissions) do
        if not Config.defaultPermissions[perm] then break end

        t[perm] = {
            name = Config.defaultPermissions[perm].name,
            description = Config.defaultPermissions[perm].description,
            status = status
        }
    end

    cb(t)
end)

RegisterNUICallback('SetPermissions', function(data, cb)
    local t = {}
    for perm, v in pairs(data.permissions) do
        t[perm] = v.status
    end

    cb(vTunnel.updatePermissions(data.role, t))
end)

RegisterNUICallback('SetConfig', function(data, cb)
    if (data.discord and data.discord ~= "" and not (data.discord:find('https://') or data.discord:find('http://'))) then
        TriggerClientEvent('Notify', source, 'vermelho', 'Discord: Insira um URL válido. Exemplo: https://discord.gg/MPm3Pptfn5', 5000)
        return cb(false)
    end

    if (data.logo and data.logo ~= "" and not (data.logo:find('https://') or data.logo:find('http://'))) then
        TriggerClientEvent('Notify', source, 'vermelho', 'Logo: Insira um URL válido. Exemplo: https://five-store.com/imagem.png', 5000)
        return cb(false)
    end

    cb(vTunnel.updateConfig(data))
end)

RegisterNUICallback('SetRadio', function(data, cb)
    if data and data.frequency and tonumber(data.frequency) then
        cb(vTunnel.updateFrequency(data.frequency))
    else
        print('Radio: Insira um Numero não uma STRING.')
        cb(false)
    end
end)

RegisterNUICallback('SetPreset', function(data, cb)
    if data and (data.male or data.female) then
        local result = vTunnel.updatePreset(data.male or "", data.female or "")
        cb(result)
    else
        print('Presets: Insira pelo menos um preset.')
        cb(false)
    end
end)