
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TUNNELS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function RegisterTunnel.getPermissions(role)
    local source = source
    local user_id = getUserId(source)
    if not user_id then return end

    local user = Organizations.Members[user_id]
    if not user then return end

    return Organizations.Permissions[user.groupType] and Organizations.Permissions[user.groupType][role] or {}
end

function RegisterTunnel.updatePermissions(role_id, perms)
    local source = source
    local user_id = getUserId(source)
    if not user_id then return end

    local user = Organizations.Members[user_id]
    if not user then return end

    local hasPermission = Organizations.Permissions[user.groupType] and Organizations.Permissions[user.groupType][user.group] and Organizations.Permissions[user.groupType][user.group].leader or false
    if not hasPermission then
        return
    end

    if Organizations.Permissions[user.groupType] and Organizations.Permissions[user.groupType][role_id] then
        Organizations.Permissions[user.groupType][role_id] = perms
    end

    vRP.Query('five_orgs_v2/UpdatePermissions', { organization = user.groupType, permissions = json.encode(Organizations.Permissions[user.groupType]) })

    return true
end

function RegisterTunnel.updateConfig(data)
    local source = source
    local user_id = getUserId(source)
    if not user_id then return end
    
    if not data then
        print("Erro: data é nil em updateConfig")
        return
    end

    local user = Organizations.Members[user_id]
    if not user then return end

    local hasPermission = Organizations.Permissions[user.groupType] and Organizations.Permissions[user.groupType][user.group] and Organizations.Permissions[user.groupType][user.group].leader or false
    if not hasPermission then
        return
    end

    local query = vRP.Query('five_orgs_v2/GetOrganizationInfos', { organization = user.groupType })
    if query[1] then
        query[1].logo = data.logo or query[1].logo
        query[1].discord = data.discord or query[1].discord

        vRP.Query('five_orgs_v2/updateFacInfo', { organization = user.groupType, logo = query[1].logo, discord = query[1].discord })
    end

    return data.logo or data.discord
end

function RegisterTunnel.updateFrequency(frequency)
    local source = source
    local user_id = getUserId(source)
    if not user_id then return end

    local user = Organizations.Members[user_id]
    if not user then return end

    local hasPermission = Organizations.Permissions[user.groupType] and Organizations.Permissions[user.groupType][user.group] and Organizations.Permissions[user.groupType][user.group].leader or false
    if not hasPermission then
        return
    end

    vRP.Query('five_orgs_v2/updateFacRadio', { organization = user.groupType, frequency = frequency })

    return frequency
end

function RegisterTunnel.updatePreset(male, female)
    local source = source
    local user_id = getUserId(source)
    if not user_id then return end


    local user = Organizations.Members[user_id]
    if not user then 
        return 
    end


    local hasPermission = Organizations.Permissions[user.groupType] and Organizations.Permissions[user.groupType][user.group] and Organizations.Permissions[user.groupType][user.group].leader or false
    if not hasPermission then
        return
    end


    local TablePreset = {
        male = {},
        female = {}
    }

    -- Verificar se é string (comando antigo) ou tabela (novo sistema)
    if type(male) == "string" then
        TablePreset.male = male
    else
        TablePreset.male = male or {}
    end

    if type(female) == "string" then
        TablePreset.female = female
    else
        TablePreset.female = female or {}
    end

    local presetJson = json.encode(TablePreset)

    vRP.Query('five_orgs_v2/updateFacPreset', { organization = user.groupType, presets = presetJson })
    
    return TablePreset
end