----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- PREPARES
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
vRP.Prepare("five_orgs_v2/GetOrganizationInfos", " SELECT * FROM five_orgs_info WHERE organization = @organization ")
vRP.Prepare("five_orgs_v2/GetOrgsPermissions", "SELECT organization,permissions FROM five_orgs_info")
vRP.Prepare("five_orgs_v2/GetGoalsConfig", "SELECT organization,config_goals FROM five_orgs_info")
vRP.Prepare("five_orgs_v2/GetOrgsSalary", "SELECT organization,salary FROM five_orgs_info")
vRP.Prepare("five_orgs_v2/getAlerts", "SELECT alerts FROM five_orgs_info WHERE organization = @organization")
vRP.Prepare("five_orgs_v2/updateAlerts", "UPDATE five_orgs_info SET alerts = @alerts WHERE organization = @organization")
vRP.Prepare("five_orgs_v2/UpdatePermissions", "UPDATE five_orgs_info SET permissions = @permissions WHERE organization = @organization")
vRP.Prepare("five_orgs_v2/updateFacInfo", "UPDATE five_orgs_info SET discord = @discord, logo = @logo WHERE organization = @organization")
vRP.Prepare("five_orgs_v2/updateFacRadio", "UPDATE five_orgs_info SET radio = @frequency WHERE organization = @organization")
vRP.Prepare("five_orgs_v2/updateFacPreset", "UPDATE five_orgs_info SET presets = @presets WHERE organization = @organization")
vRP.Prepare("five_orgs_v2/GetAllUsersInfo", "SELECT * FROM five_orgs_player_infos")
vRP.Prepare("five_orgs_v2/GetAllUsersInfoByGroup", "SELECT * FROM five_orgs_player_infos WHERE organization = @organization ORDER BY timeplayed DESC")
vRP.Prepare("five_orgs_v2/GetAllUserInfo", "SELECT * FROM five_orgs_player_infos WHERE user_id = @user_id")
vRP.Prepare("five_orgs_v2/GetAllUserInfoOrganizationName", "SELECT * FROM five_orgs_player_infos WHERE user_id = @user_id AND organization = @organization")
vRP.Prepare("five_orgs_v2/DeleteUserInfo", "DELETE FROM five_orgs_player_infos WHERE user_id = @user_id")
vRP.Prepare("five_orgs_v2/DeleteUserInfoByGroup", "DELETE FROM five_orgs_player_infos WHERE user_id = @user_id AND organization = @organization")
vRP.Prepare("five_orgs_v2/SetPlayerOrganization", "INSERT IGNORE INTO five_orgs_player_infos(user_id, organization, joindate, lastlogin, timeplayed) VALUES(@user_id, @organization, @joindate, @lastlogin, @timeplayed)")
vRP.Prepare("five_orgs_v2/SetPlayerLastLogin", "UPDATE five_orgs_player_infos SET lastlogin = @lastlogin WHERE user_id = @user_id")
vRP.Prepare("five_orgs_v2/AddPlayerTimePlayed", "UPDATE five_orgs_player_infos SET timeplayed = timeplayed + @timeplayed WHERE user_id = @user_id")
vRP.Prepare("five_orgs_v2/getInviteReward", "SELECT * FROM five_orgs_invite_rewards WHERE user_id = @user_id")
vRP.Prepare("five_orgs_v2/setInviteReward", "INSERT IGNORE INTO five_orgs_invite_rewards(user_id, organization, invite_userid) VALUES(@user_id, @organization, @invite_userid)")
vRP.Prepare("five_orgs_v2/updateSalary", "UPDATE five_orgs_info SET salary = @salary WHERE organization = @organization")
vRP.Prepare("five_orgs_v2/CreateTable1", "CREATE TABLE IF NOT EXISTS `five_orgs_goals` ( `user_id` int(11) NOT NULL, `organization` varchar(50) NOT NULL, `item` varchar(100) NOT NULL, `amount` int(11) NOT NULL DEFAULT 0, `day` int(11) NOT NULL, `month` int(11) NOT NULL, `step` int(11) DEFAULT 1, `reward_step` int(11) DEFAULT 0, UNIQUE KEY `user_id_organization_item_day` (`user_id`,`organization`,`item`,`day`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;")
vRP.Prepare("five_orgs_v2/CreateTable2", "CREATE TABLE IF NOT EXISTS `five_orgs_info` ( `organization` varchar(50) NOT NULL, `alerts` text DEFAULT '{}', `presets` text DEFAULT NULL, `logo` text DEFAULT NULL, `radio` int(11) DEFAULT 0, `discord` varchar(150) DEFAULT '', `bank` int(11) DEFAULT 0, `bank_historic` text DEFAULT '{}', `permissions` text DEFAULT '{}', `salary` text DEFAULT '{}', `config_goals` text DEFAULT '{}', PRIMARY KEY (`organization`) ) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;")
vRP.Prepare("five_orgs_v2/CreateTable3", "CREATE TABLE IF NOT EXISTS `five_orgs_logs` ( `organization` varchar(50) DEFAULT NULL, `user_id` int(11) DEFAULT NULL, `role` varchar(50) DEFAULT NULL, `name` varchar(50) DEFAULT NULL, `description` varchar(200) DEFAULT NULL, `date` varchar(50) DEFAULT NULL, `expire_at` int(11) DEFAULT NULL ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;")
vRP.Prepare("five_orgs_v2/CreateTable4", "CREATE TABLE IF NOT EXISTS `five_orgs_player_infos` ( `user_id` int(11) NOT NULL, `organization` varchar(50) DEFAULT NULL, `joindate` int(11) DEFAULT 0, `lastlogin` int(11) DEFAULT 0, `timeplayed` int(11) DEFAULT 0 ) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;")
vRP.Prepare("five_orgs_v2/CreateTable5", "CREATE TABLE IF NOT EXISTS `five_orgs_partners` ( `organization` varchar(50) DEFAULT NULL, `cds` text DEFAULT '{}', `keyword` text DEFAULT NULL, `name` text DEFAULT NULL, `description` text DEFAULT NULL, `note` text DEFAULT NULL ) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;")

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Organizations = {
    List = {
        --["lidermecanicacapital"] = "Mecanica Furia" @params group(string), @params groupType(string)
    },

    Permissions = {
        -- ['Hospital'] = {
        --      ["Vice-Diretor"] = { 
        --         invite = false, -- Permissao para Convidar
        --         demote = false, -- Permissao Para Demitir
        --         promove = false, -- Permissao Para Promover
        --         withdraw = false, -- Permissao Para Sacar Dinheiro
        --         deposit = false, -- Permissao Para Depositar Dinheiro
        --         message = false, -- Permissao para Escrever nas anotaçoes
        --         action = false, -- Permissao para Marcar Ação
        --         pix = false, -- Permissao para Alterar o Pix
        --     }
        -- }
    },

    Members = {
        --[1] = { @params user_id(integer)
        --  group = "lidermecanicacapital" @params group(string)
        --  groupType = "Mecanica Furia" @params groupType(string)
        --  joindate = 662251054, @params joindate(integer)
        --  lastlogin = 662251054, @params lastlogin(integer)
        --  timeplayed = 123, @params timeplayed(integer)
        --}
    },

    MembersList = {
        --["Mecanica Furia"] = { @params group(string)
        --  [1] = true @params user_id(int)
        --}
    },

    timePlayed = {
        --[1] = os.time() @params user_id(integer)
    },

    Chat = {
        -- ['Mecanica'] = {
        --     { text = 'test', author = 'five Literallyme', user_id = 1 }
        -- }
    },

    hasOppenedOrg = {
        -- ['Mecanica'] = { @params org(string)
        --     [199] = 15 @params user_id(integer), @params source(integer)
        -- }
    },

    payDayOrg = {
         -- ['Mecanica'] = { time = 32342432, amount = 5000 }
    },

    goalsConfig = {
        -- ['Mecanica'] = { @params org(string)
        --     info = {
        --         defaultReward = 1000,
        --         itens = {
        --             ['pecadearma'] = 500,
        --         }
        --     }
        -- }
    }
}

BANK = {
    cooldown = {}
} 

local WARNS = {}
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Organizations:AddUserGroup(user_id, v)
    user_id = user_id

    self.Members[user_id] = v
    
    if not self.MembersList[v.groupType] then
        self.MembersList[v.groupType] = {}
    end

    local user = self.Members[user_id]
    local query = vRP.Query("five_orgs_v2/GetAllUserInfoOrganizationName", {user_id = user_id, organization = user.groupType})
    if not query[1] then
        self.Members[user_id].joindate = os.time()
        self.Members[user_id].lastlogin = os.time()
        self.Members[user_id].timeplayed = 0

        vRP.Query("five_orgs_v2/SetPlayerOrganization", { user_id = user_id, organization = user.groupType, joindate = self.Members[user_id].joindate, lastlogin = self.Members[user_id].lastlogin, timeplayed = self.Members[user_id].timeplayed })
    end

    self.MembersList[v.groupType][user_id] = true
end

function Organizations:RemUserGroup(user_id, group)
    user_id = user_id

    local groupType = self.Members[user_id] and self.Members[user_id].groupType or false
    if groupType and self.MembersList[groupType] then
        self.MembersList[groupType][user_id] = nil
    end

    if group then
        vRP.Query('five_orgs_v2/DeleteUserInfoByGroup', { user_id = user_id, organization = group })
    else
        vRP.Query('five_orgs_v2/DeleteUserInfo', { user_id = user_id })
    end

    self.Members[user_id] = nil
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RECIVE HANDLERS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler('Salary:Add', function(user_id,group)
    user_id = parseInt(user_id)
    Wait(200)
    if Organizations.List[group] then
        Organizations:AddUserGroup(user_id, {
            group = group,
            groupType = Organizations.List[group]
        })
    end
end)

AddEventHandler('Salary:Remove', function(user_id,group)
    user_id = parseInt(user_id)
    if Organizations.List[group] then
        Organizations:RemUserGroup(user_id,group)
    end
end)

CreateThread(function()
    Wait(1000)

    -- Auto-populate Organizations.List from Config
    for orgName, orgData in pairs(Config.Groups) do
        if orgData.List then
            for roleName, roleData in pairs(orgData.List) do
                Organizations.List[roleName] = orgName
            end
        end
    end

    -- Execute Table Creation
    vRP.Query("five_orgs_v2/CreateTable1")
    vRP.Query("five_orgs_v2/CreateTable2")
    vRP.Query("five_orgs_v2/CreateTable3")
    vRP.Query("five_orgs_v2/CreateTable4")
    vRP.Query("five_orgs_v2/CreateTable5")

    while true do
        for Passport,Source in pairs(vRP.Players()) do
            -- print('1',Passport,Source)
            local Groups = vRP.Groups()

            if not Organizations.Members[Passport] then
                for Permission,_ in pairs(Groups) do
                    -- print('3',Permission)

                    local Data = vRP.DataGroups(Permission)
                    
                     local PassportTier = Data[tostring(Passport)]
                    if PassportTier then
                        -- print('4',Permission,PassportTier)
                        for PermGroup,GroupName in pairs(Organizations.List) do
                            -- print('5',PermGroup,GroupName)

                            if GroupName == Permission then
                                -- print('6',GroupName == Permission)

                                if vRP.HasPermission(Passport,GroupName,PassportTier) then
                                    -- print('7',vRP.HasPermission(Passport,GroupName,PassportTier))

                                    if Config.Groups[GroupName] then
                                        -- print('8',Config.Groups[GroupName])

                                        local hasPermission = Organizations.MembersList[GroupName] and Organizations.MembersList[GroupName][Passport] or false
                                        if not hasPermission then
                                            -- print('9',NowTier,hasPermission)

                                            local NowTier = Config.Groups[GroupName]["List"][PermGroup]["tier"]
                                            if NowTier == PassportTier then
                                                local blackList = BLACKLIST:checkUser(Passport) or 0
                                                if blackList and blackList > 0 then
                                                    -- print('11',blackList)
                                                    if (blackList - os.time()) > 0 then
                                                        goto skip
                                                    end
                                                end

                                                Organizations:AddUserGroup(Passport, {
                                                    group = PermGroup,
                                                    groupType = Organizations.List[PermGroup]
                                                })

                                                -- print('12 setei')
                                            end
                                        end
                                    end
                                end
                            end
    
                        end
                    end
                end
            end
        end

        :: skip ::

        for k,v in pairs(Organizations.Members) do
            local GroupName = v["groupType"]
            if not vRP.HasPermission(k,GroupName) then
                Organizations:RemUserGroup(k,GroupName)
            end
        end

        -- print('rodando')

        Wait(5000)
    end
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- COMMANDS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local nameOrg = {} 
RegisterCommand(Config.Main.cmd, function(source,args)
    local user_id = vRP.Passport(source)
    if not user_id then return end

    local user = Organizations.Members[user_id]
    if not user then
        return TriggerClientEvent('Notify',source,'vermelho','Você não faz parte de nenhuma organização.',5000)
    end

    if args[1] and Organizations.MembersList[args[1]] then
        local hasPermission = Organizations.MembersList[args[1]][user_id]
        if not hasPermission then
            return TriggerClientEvent('Notify',source,'vermelho','Você não faz parte dessa organização.',5000)
        end
    end

    if BANK.cooldown[user_id] and (BANK.cooldown[user_id] - os.time()) > 0 then
        TriggerClientEvent('Notify',source,'vermelho','Você precisa esperar <b>'..(BANK.cooldown[user_id] - os.time())..'</b> segundos para usar o comando novamente.',5000)
        return
    end
    BANK.cooldown[user_id] = (os.time() + 5)

    if args[1] then
        if not Config.Groups[args[1]] then
            TriggerClientEvent('Notify',source,'vermelho','<b>Organização</b> não encontrada.',5000)
            return
        end
        if not Organizations.MembersList[args[1]] then
            TriggerClientEvent('Notify',source,'vermelho','Você não faz parte desta organização.',5000)
            return
        end

        local bestGroup = ""
        for group,v in pairs(Config.Groups[args[1]].List) do
            if v.tier == 1 then
                bestGroup = group
            end
        end

        Organizations:AddUserGroup(user_id, {
            group = bestGroup,
            groupType = Organizations.List[bestGroup]
        })

        nameOrg[source] = args[1]
    end

    vTunnel._OpenPainel(source)
end)

RegisterCommand(Config.Main.cmdAdm, function(source,args)
    local user_id = vRP.Passport(source)
    if not user_id then return end

    if not vRP.HasPermission(user_id, "Admin") then return end

    local orgName = args[1]
    if not orgName or orgName == "" then
        return
    end

    if not Config.Groups[orgName] then
        return
    end

    local bestGroup = ""
    for group,v in pairs(Config.Groups[orgName].List) do
        if v.tier == 1 then
            bestGroup = group
        end
    end
    -- vRP.SetPermission(user_id, bestGroup, 1)

    Organizations:AddUserGroup(user_id, {
        group = bestGroup,
        groupType = Organizations.List[bestGroup]
    })

    -- OldPlayers[tostring(source)] = user_id

    Wait(1000)
    vTunnel._OpenPainel(source)
end)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TUNNELS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function RegisterTunnel._OpenPainel(source)
    local user_id = getUserId(source)
    if not user_id then return end

    local user = Organizations.Members[user_id]
    if not user then return end

    vTunnel.OpenPainel(source)
end
function RegisterTunnel.getFaction()
    local source = source
    local user_id = getUserId(source)
    local orgName = nil
    if not user_id then return end
    
    local user = Organizations.Members[user_id]
    if not user then return end

    if nameOrg[source] then
        orgName = nameOrg[source]
        user.groupType = orgName
    end

    local identity = getUserIdentity(user_id)
    if not identity then return end
    local query = vRP.Query('five_orgs_v2/GetOrganizationInfos', { organization = user.groupType })
    if #query == 0 then 
        print("Houve um problema ao encontrar essa Organizacao no banco de dados")
        return 
    end

    local leaderGroup,listRoles = '', {}
    for group, v in pairs(Config.Groups[user.groupType].List) do
        if v.tier == 1 then
            leaderGroup = group
        else
            local memberamount = getAmountPermission(user.groupType, v.tier)

            listRoles[#listRoles + 1] = {
                nivel = v.tier,
                prefix = v.prefix,
                group = group,
                members = memberamount
            }
        end
    end

    local leader = 'Ninguem'
    local totalMember,onlineMembers = 0,0
    
    if not Config.Groups[user.groupType] then
        TriggerClientEvent('Notify',source,'vermelho','<b>Organização</b> não encontrada.',5000)
        return
    end
    if Organizations.MembersList[user.groupType] then
        for ply_id in pairs(Organizations.MembersList[user.groupType]) do
            if vRP.HasPermission(ply_id,Organizations.Members[ply_id].groupType) then
                if not Organizations.Members[ply_id] then goto next_player end
                if Organizations.Members[ply_id].groupType ~= user.groupType then goto next_player end
                
                if not Organizations.timePlayed[ply_id] then
                    Organizations.timePlayed[ply_id] = os.time()
                end

                totalMember = (totalMember + 1)
                local plySrc = getUserSource(parseInt(ply_id))
                if plySrc then
                    onlineMembers = (onlineMembers + 1)
                end
                
                if Organizations.Members[ply_id].group == leaderGroup then
                    local identity = getUserIdentity(ply_id)
                    if not identity then goto next_player end
                    
                    leader = ("%s %s #%d"):format(identity.name,identity.name2 or "",ply_id)
                end
            end

            :: next_player ::
        end
    end

    local alerts = json.decode(query[1].alerts) or {}
    local convertedAlerts = {}

    local total = #alerts
    for i = 1, total do
        local alert = alerts[i]
        convertedAlerts[total - i + 1] = alert
    end

    if not Organizations.hasOppenedOrg[user.groupType] then Organizations.hasOppenedOrg[user.groupType] = {} end
    Organizations.hasOppenedOrg[user.groupType][user_id] = source
    
    local orgBank = query[1] and (query[1].bank or 0)
    local playerBank = vRP.GetBank(source) or 0
    
    return {
        user_id = user_id,
        logo = query[1] and (query[1].logo) or Config.Main.serverLogo,
        serverIcon = Config.Main.serverLogo,
        store = Config.Main.storeUrl,

        preset = query[1] and (function()
            return json.decode(query[1].presets) or {}
        end)() or {},
        radio = query[1] and (query[1].radio) or 0,
        avatar = query[1] and (query[1].logo) or Config.Main.serverLogo,
        canWarn = false,
        maxMembers = 100, -- máximo de membros de uma facção

        orgName = user.groupType,
        orgBalance = orgBank,
        name = ('%s %s'):format(identity.name, identity.name2 or ""),
        playerBalance = playerBank,
        cardBalance = orgBank, -- Saldo correto da organização para o cartão
        roles = listRoles,
        salary = Organizations.payDayOrg[user.groupType] and Organizations.payDayOrg[user.groupType].amount or false,
        nextPayment = Organizations.payDayOrg[user.groupType] and (Organizations.payDayOrg[user.groupType].time - os.time()) or false,
        nextPaymentMax = Organizations.payDayOrg[user.groupType] and (Organizations.payDayOrg[user.groupType].salaryTime * 60) or false,
        goalReward = Organizations.goalsConfig[user.groupType] and Organizations.goalsConfig[user.groupType].info.defaultReward or 1000,
        discord = query[1] and (query[1].discord or ""),
        leader = leader,
        members = totalMember,
        membersOnline = onlineMembers,
        warnings = convertedAlerts,
        permissions = Organizations.Permissions[user.groupType] and Organizations.Permissions[user.groupType][user.group] and Organizations.Permissions[user.groupType][user.group] or {}
    }
end

function RegisterTunnel.addWarn(message)
    local source = source
    local user_id = getUserId(source)
    if not user_id then return end

    local user = Organizations.Members[user_id]
    if not user then return end

    local identity = getUserIdentity(user_id)
    if not identity then return end

    if message:len() < 2 then return end

    local query = vRP.Query('five_orgs_v2/GetOrganizationInfos', { organization = user.groupType })

    local logoAvatar = ""
    logoAvatar = query[1] and query[1].logo or Config.Main.serverLogo

    local historic = WARNS:addWarning(user.groupType, {
        author = ('%s %s'):format(identity.name, identity.firstname),
        author_id = user_id,
        message = message,
        author_avatar = logoAvatar,
        date = os.date("%d/%m/%Y %X"),
    })

    if Organizations.hasOppenedOrg[user.groupType] then
        for ply_id, ply_src in pairs(Organizations.hasOppenedOrg[user.groupType]) do
            local ped = GetPlayerPed(ply_src)
            if ped == 0 then goto next_player end

            TriggerClientEvent('updateWarnings', ply_src, historic)

            :: next_player ::
        end
    end
    
    return true
end

function RegisterTunnel.sendMessage(message)
    local source = source
    local user_id = getUserId(source)
    if not user_id then return end

    local identity = getUserIdentity(user_id)
    if not identity then return end

    local user = Organizations.Members[user_id]
    if not user then return end

    if not Organizations.Chat[user.groupType] then Organizations.Chat[user.groupType] = {} end

    local gen_id = (#Organizations.Chat[user.groupType] + 1)
    Organizations.Chat[user.groupType][gen_id] = {
        message = message,
        author = ('%s %s'):format(identity.name,identity.name2 or ""),
        author_id = user_id,
    }

    for ply_id,ply_src in pairs(Organizations.hasOppenedOrg[user.groupType]) do
        async(function()
            local ped = GetPlayerPed(ply_src)
            if not ped then return end

            TriggerClientEvent("updateChatMessage", ply_src, Organizations.Chat[user.groupType][gen_id]) 
        end)
    end
end

function RegisterTunnel.getChatMessages()
    local source = source
    local user_id = getUserId(source)
    if not user_id then return end

    local user = Organizations.Members[user_id]
    if not user then return end

    local t = {}
    if Organizations.Chat[user.groupType] then
        for id in pairs(Organizations.Chat[user.groupType]) do
            local message = Organizations.Chat[user.groupType][id]

            t[#t + 1] = {
                message = message.message,
                author = message.author,
                author_id = message.author_id
            }
        end
    end

    return t
end

function RegisterTunnel.close()
    local source = source
    local user_id = getUserId(source)
    if not user_id then return end

    local user = Organizations.Members[user_id]
    if not user then return end

    if Organizations.hasOppenedOrg[user.groupType] and Organizations.hasOppenedOrg[user.groupType][user_id] then
        Organizations.hasOppenedOrg[user.groupType][user_id] = nil
        nameOrg[source] = nil
    end
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function WARNS:addWarning(organization, data)
    local query = vRP.Query('five_orgs_v2/getAlerts', { organization = organization })
    if #query == 0 then return end

    local historic = json.decode(query[1].alerts) or {}

    if #historic > 10 then
        table.remove(historic,1)
    end
    historic[#historic + 1] = data

    vRP.Query('five_orgs_v2/updateAlerts', { organization = organization, alerts = json.encode(historic) })

    local convertedAlerts = {}

    local total = #historic
    for i = 1, total do
        local alert = historic[i]
        convertedAlerts[total - i + 1] = alert
    end

    return convertedAlerts
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CACHE FUNCTIONS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Organizations:FormatConfig()
    local first = {}
    for orgName in pairs(Config.Groups) do
        for Group in pairs(Config.Groups[orgName].List) do
            self.List[Group] = orgName

            if (Config.Main.createAutomaticOrganizations) then
                if not first[orgName] then
                    first[orgName] = true
                    vRP.Query("five_orgs_v2/InsertOrganization", { orgName })
                end
            end
        end
    end 

    self:GenerateCache()
end

vRP.Prepare("five_orgs_v2/GetUsersGroup","SELECT * FROM entitydata")
vRP.Prepare("five_orgs_v2/InsertOrganization","INSERT IGNORE INTO five_orgs_info(organization) VALUES(?)")

-- Queries para sistema de baú
vRP.Prepare("chests/GetChests", "SELECT * FROM chests WHERE name = @name")
vRP.Prepare("chests/UpdateChests", "UPDATE chests SET weight = weight + 10 WHERE name = @name")

function Organizations:GenerateCache()
    local time = os.time()
    print(('^1[%s] ^0Iniciando Cache dos jogadores.'):format(GetCurrentResourceName():upper()))

    local query = vRP.Query('five_orgs_v2/GetUsersGroup') 
    local FormatUser = {}

    -- local literallyme = true
    -- if literallyme then
        local PlayersGroups = {}
        for i = 1, #query do
            if query[i]["dkey"]:find("Permissions") then
                local ply = query[i]
                local plyData = json.decode(ply["dvalue"])

                local GroupName = string.sub(query[i]["dkey"],13,-1)

                for UserID,TierGroup in pairs(plyData) do
                    if not vRP.Source(UserID) then
                        if not self.Members[UserID] then
                            local SelectTierGroup = 1
                            
                            for PermGroup,PermGroupName in pairs(Organizations.List) do
                                local PassportTier = TierGroup
                                local NowTier = Config.Groups[PermGroupName]["List"][PermGroup]["tier"]
                                
                                if PermGroupName == GroupName then
                                    if vRP.HasPermission(UserID,GroupName,PassportTier) then
                                        if NowTier == PassportTier then
                                            SelectTierGroup = PermGroup
                                        end
                                    end
                                end
                            end
    
                            if PlayersGroups[UserID] then
                                PlayersGroups[UserID][#PlayersGroups[UserID]+1] = {GroupName,SelectTierGroup}
                            else
                                PlayersGroups[UserID] = {}
                                PlayersGroups[UserID][#PlayersGroups[UserID]+1] = {GroupName,SelectTierGroup}
                            end
                        end
                    end
                end
            end
        end

        for UserIDInject,GroupsInject in pairs(PlayersGroups) do
            FormatUser[UserIDInject] = GroupsInject
        end

        for user_id, groups in pairs(FormatUser) do
            for _,groupName in pairs(groups) do
                if not Organizations.Members[user_id] then
                    if Config.Groups[groupName[1]] then
                        user_id = parseInt(user_id)

                        local v = {
                            group = groupName[2],
                            groupType = groupName[1]
                        }

                        Organizations:AddUserGroup(user_id, v)

                        -- Organizations.Members[user_id] = v
                        
                        -- if not Organizations.MembersList[v.groupType] then
                        --     Organizations.MembersList[v.groupType] = {}
                        -- end

                        -- Organizations.MembersList[v.groupType][user_id] = true
                    end
                end
            end
        end
    -- end

    print(('^2[%s] ^0Cache dos jogadores gerados com sucesso tempo %s segundo(s).'):format(GetCurrentResourceName():upper(), os.time() - time))
    FormatUser = {}

    self:GenerateCachePermissions()
    self:GenerateCacheGoals()
end

function Organizations:GenerateCacheInfos()
    local query = vRP.Query('five_orgs_v2/GetAllUsersInfo', {})
    for i = 1, #query do
        local ply = query[i]
        if self.Members[ply.user_id] then
            self.Members[ply.user_id].joindate = ply.joindate
            self.Members[ply.user_id].lastlogin = ply.lastlogin
            self.Members[ply.user_id].timeplayed = ply.timeplayed
        else
            -- REMOVENDO INFORMACOES CASO NÃO FOR MAIS DA ORGANIZAÇÃO
            vRP.Query('five_orgs_v2/DeleteUserInfo', { user_id = ply.user_id })
        end
    end
end

function Organizations:GenerateCachePermissions()
    local query = vRP.Query('five_orgs_v2/GetOrgsPermissions', {})
    for i = 1, #query do
        local v = query[i]
        if not v then goto five_orgs end

        local insert_permission = {}
        if Config.Groups[v.organization] then
            if not self.Permissions[v.organization] then self.Permissions[v.organization] = {} end
            
            if v.permissions == "{}" or not v.permissions then
                -- Gerar permissões padrão se não existirem
                for Group in pairs(Config.Groups[v.organization].List) do
                    if not self.Permissions[v.organization][Group] then self.Permissions[v.organization][Group] = {} end
                    for permission in pairs(Config.defaultPermissions) do
                        if Config.Groups[v.organization].List[Group].tier == 1 then
                            self.Permissions[v.organization][Group]['leader'] = true
                            self.Permissions[v.organization][Group][permission] = true
                        else
                            self.Permissions[v.organization][Group]['leader'] = false
                            self.Permissions[v.organization][Group][permission] = false
                        end
                    end
                end
                insert_permission[v.organization] = true
            else
                -- Carregar permissões existentes do banco
                self.Permissions[v.organization] = json.decode(v.permissions) or {}
                
                -- Verificar se todas as permissões necessárias existem
                for Group in pairs(Config.Groups[v.organization].List) do
                    if not self.Permissions[v.organization][Group] then 
                        self.Permissions[v.organization][Group] = {}
                        insert_permission[v.organization] = true
                    end
                    
                    for permission in pairs(Config.defaultPermissions) do
                        if not self.Permissions[v.organization][Group][permission] then
                            if Config.Groups[v.organization].List[Group].tier == 1 then
                                self.Permissions[v.organization][Group]['leader'] = true
                                self.Permissions[v.organization][Group][permission] = true
                            else
                                self.Permissions[v.organization][Group]['leader'] = false
                                self.Permissions[v.organization][Group][permission] = false
                            end
                            insert_permission[v.organization] = true
                        end
                    end
                    
                end
            end

            if insert_permission[v.organization] then
                vRP.Query('five_orgs_v2/UpdatePermissions', { organization = v.organization, permissions = json.encode(self.Permissions[v.organization]) })
            end
        end

        :: five_orgs ::
    end

    insert_permission = {}
end

function Organizations:PayDay()
    local query = vRP.Query('five_orgs_v2/GetOrgsSalary', {})
    local t = {}

    -- Preenche a tabela t com as organizações e seus salários
    for i = 1, #query do
        t[query[i].organization] = json.decode(query[i].salary) or {}
    end

    -- Para cada grupo configurado em Config.Groups
    for org, v in pairs(Config.Groups) do
        -- Verifica se o salário está ativo na configuração da organização
        if v.Config and v.Config.Salary and v.Config.Salary.active then
            -- Define a estrutura de pagamento da organização, com o tempo e o valor do salário
            self.payDayOrg[org] = {
                salaryTime = v.Config.Salary.time,
                time = os.time() + (v.Config.Salary.time * 60),
                amount = v.Config.Salary.amount,
            }
        end

        local salary = t[org]
        -- Se houver um salário configurado para a organização
        if salary and salary.expire_at and (salary.expire_at - os.time() > 0) then
            -- Define os detalhes do salário da organização a partir da consulta
            self.payDayOrg[org] = {
                salaryTime = salary.time,
                time = os.time() + (salary.salaryTime * 60),
                amount = salary.amount,
            }
        end
    end
    
    CreateThread(function()
        while true do
            for org, v in pairs(self.payDayOrg) do
                if (v.time - os.time()) <= 0 then
                    -- Atualiza o tempo para o próximo pagamento
                    self.payDayOrg[org].time = os.time() + (v.salaryTime * 60)
                    local query = vRP.Query('five_orgs_v2/bank/getinfo', { organization = org })
                    if #query == 0 then 
                        goto five_orgs 
                    end
                    
                    local bank_value = (query[1].bank + v.amount)
                    local generate_log = BANK:generateLog(json.decode(query[1].bank_historic), {
                        name = org,
                        type = "SALÁRIO FAC",
                        value = v.amount,
                        date = os.date('%d/%m/%Y %X'),
                    })
                    
                    vRP.Query('five_orgs_v2/bank/updateBank', { organization = org, bank = (query[1].bank + v.amount), historic = json.encode(generate_log) })
                end

                :: five_orgs ::
            end
            Wait(1000)
        end
    end)
end

function Organizations:addPayday(user_id, time, amount, expire)
    local user = Organizations.Members[user_id]
    if not user then 
        return false
    end

        self.payDayOrg[user.groupType] = {
            salaryTime = time,
            time = os.time() + (time * 60),
            amount = amount,
            expire_at = os.time() + (expire * 60 * 60 * 24)
        }

        vRP.Query('five_orgs_v2/updateSalary', {
            organization = user.groupType,
            salary = json.encode(self.payDayOrg[user.groupType])
        })

        TriggerClientEvent('Notify',src,'sucesso','Você renovou o seu <b>Salario de Facção</b>.', 5000)
        
    return true
end

exports('addOrganizationPayday', function(...)
    return Organizations:addPayday(...)
end)

-- Função para sincronizar metas de uma organização específica
function SyncOrganizationGoals(orgName, farmGoals, defaultReward)
    if not Config.Groups[orgName] then
        return false
    end
    
    -- Atualizar configuração de metas da organização
    if not Organizations.goalsConfig[orgName] then
        Organizations.goalsConfig[orgName] = {}
    end
    
    if not Organizations.goalsConfig[orgName].info then
        Organizations.goalsConfig[orgName].info = {
            defaultReward = defaultReward or 5000,
            itens = {}
        }
    end
    
    -- Sincronizar itens do farm com as metas da organização
    for item, amount in pairs(farmGoals) do
        Organizations.goalsConfig[orgName].info.itens[item] = amount
    end
    
    -- Salvar no banco de dados
    vRP.Query('five_orgs_v2/updateConfigGoals', { 
        organization = orgName, 
        config_goals = json.encode(Organizations.goalsConfig[orgName]) 
    })
    
    return true
end

-- Exportar a função
exports('SyncOrganizationGoals', SyncOrganizationGoals)

function Organizations:GenerateCacheGoals()
    local query = vRP.Query('five_orgs_v2/GetGoalsConfig', {})
    for i = 1, #query do
        local v = query[i]
        if not v then goto five_orgs end
        
        
        local insert_permission = {}
        if Config.Groups[v.organization] and Config.Groups[v.organization].Config.Goals then
            local data = json.decode(query[i].config_goals) or {}
            
            -- Usar configuração do arquivo se não houver dados no banco
            if not data.info or not data.info.itens or next(data.info.itens) == nil then
                data.info = { 
                    itens = {},
                    defaultReward = Config.Groups[v.organization].Config.Goals.defaultReward or 1000
                }
                
                -- Carregar metas do arquivo de configuração
                if Config.Groups[v.organization].Config.Goals.itens then
                    for _, goal in pairs(Config.Groups[v.organization].Config.Goals.itens) do
                        if goal.tier and goal.items then
                            for _, item in pairs(goal.items) do
                                if not data.info.itens[item.item] then
                                    data.info.itens[item.item] = item.amount
                                end
                            end
                        end
                    end
                end
            end
            
            self.goalsConfig[v.organization] = data
        end

        :: five_orgs ::
    end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- HANDLERS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("five_orgs_v2:playerSpawn", function(user_id, source)
    if Organizations.Members[user_id] then
        Organizations.Members[user_id].lastlogin = os.time()
        Organizations.timePlayed[user_id] = os.time()
        Organizations.Members[user_id].timeplayed = os.time()

        vRP.Query("five_orgs_v2/SetPlayerLastLogin", {user_id = user_id, lastlogin = Organizations.Members[user_id].lastlogin})
    end
end)

AddEventHandler("five_orgs_v2:playerLeave",function(user_id) 
    if Organizations.timePlayed[user_id] then
        if Organizations.Members[user_id] and Organizations.Members[user_id].timeplayed then
            Organizations.Members[user_id].timeplayed = os.time() - Organizations.timePlayed[user_id]

            vRP.Query("five_orgs_v2/AddPlayerTimePlayed", {user_id = user_id, timeplayed = Organizations.Members[user_id].timeplayed})
        end
    end
end)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- THREADS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    vRP.Query("five_orgs_v2/CreateTable1", { })
    vRP.Query("five_orgs_v2/CreateTable2", { })
    vRP.Query("five_orgs_v2/CreateTable3", { })
    vRP.Query("five_orgs_v2/CreateTable4", { })
    vRP.Query("five_orgs_v2/CreateTable5", { })

    Wait(10)
    Organizations:FormatConfig()
    Organizations:PayDay()
end)