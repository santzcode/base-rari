--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TUNNELS
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
vRP.Prepare("five_orgs_v2/fivePartner", "INSERT INTO five_orgs_partners (organization, cds, keyword, name, description, note) VALUES (@organization, @cds, @keyword, @name, @description, @note) ON DUPLICATE KEY UPDATE keyword = VALUES(keyword), name = VALUES(name), description = VALUES(description), note = VALUES(note)")


function RegisterTunnel.addPartner(data)
    if not data then
        print("Erro: data é nil em addPartner")
        return
    end
    local src = source
    local user_id = getUserId(src)

    if not user_id or not data then
        return
    end

    local user = Organizations.Members[user_id]
    if not user then return end
    -- local orgData = vRP.Query("five_orgs_v2/GetAllUserInfo", { user_id = user_id })

    if user.groupType then
        local organization = user.groupType

        vRP.Query("five_orgs_v2/fivePartner", {
            organization = organization,
            cds = data.cds,
            keyword = data.keyword,
            name = data.name,
            description = data.description,
            note = data.note
        })

        local partners = vRP.Query("five_orgs_v2/GetPartners", { organization = organization })
    
        return partners or {}
    end

    return {}
end

vRP.Prepare("five_orgs_v2/GetPartners", "SELECT * FROM five_orgs_partners WHERE organization = @organization")

function RegisterTunnel.GetPartners()
    local src = source
    local user_id = getUserId(src)

    if not user_id then
        return {}
    end
    -- local orgData = vRP.Query("five_orgs_v2/GetAllUserInfo", { user_id = user_id })

    -- if not orgData or #orgData == 0 or not orgData[1].organization then
    --     return {}
    -- end

    local user = Organizations.Members[user_id]
    if not user then return end

    -- local organization = orgData[1].organization
    local organization = user.groupType
    local partners = vRP.Query("five_orgs_v2/GetPartners", { organization = organization })

    return partners or {}
end

vRP.Prepare("five_orgs_v2/DeletePartner", "DELETE FROM five_orgs_partners WHERE organization = @organization AND name = @name")

function RegisterTunnel.deletePartner(data)
    if not data then
        print("Erro: data é nil em deletePartner")
        return
    end
    local src = source
    local user_id = getUserId(src)

    if not user_id or not data or not data.name then
        return
    end

    -- local orgData = vRP.Query("five_orgs_v2/GetAllUserInfo", { user_id = user_id })
    -- if not orgData or #orgData == 0 or not orgData[1].organization then
    --     return
    -- end

    local user = Organizations.Members[user_id]
    if not user then return end

    local organization = user.groupType
    local name = data.name
    vRP.Query("five_orgs_v2/DeletePartner", {
        name = name,
        organization = organization
    })

    local partners = vRP.Query("five_orgs_v2/GetPartners", { organization = organization })
    return partners or {}
end