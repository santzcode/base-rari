local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
fclient = Tunnel.getInterface("nation_creator")
func = {}
Tunnel.bindInterface("nation_creator", func)


multiCharacter = true -- não mexer (pode bugar o script)

---------------------------------------------------------------------------
-----------------------VERIFICAÇÃO DE PERMISSÃO--------------------------
---------------------------------------------------------------------------


vRP.Prepare("nation_creator/createAgeColumn","ALTER TABLE characters ADD IF NOT EXISTS age INT(11) NOT NULL DEFAULT 20")
vRP.Prepare("nation_creator/remove_characters","UPDATE characters SET deleted = 1 WHERE id = @id")
vRP.Prepare("nation_creator/get_characters","SELECT * FROM characters WHERE license = @steam and deleted = 0")
vRP.Prepare("nation_creator/get_character","SELECT * FROM characters WHERE license = @steam and deleted = 0 and id = @user_id")
CreateThread(function() vRP.Query("nation_creator/createAgeColumn") end)


function func.checkPermission(permission, src)
    local source = src or source
    local user_id = vRP.Passport(source)
    if type(permission) == "table" then
        for i, perm in pairs(permission) do
            if vRP.HasGroup(user_id, perm) then
                return true
            end
        end
        return false
    end
    return vRP.HasGroup(user_id, permission)
end

function func.saveChar(name, lastName, age, char, id)
    local source = source
    if name and lastName and age then
        local License = vRP.Identities(source)

        local skin = "mp_m_freemode_01"
        if GetEntityModel(GetPlayerPed(source)) ~= GetHashKey(skin) then
            skin = "mp_f_freemode_01"
        end

        local sex = (skin == "mp_f_freemode_01") and "F" or "M"

-- vRP.Prepare("characters/newCharacter","INSERT INTO characters(license,name,name2,sex,phone,blood,created, time, prison) VALUES(@license,@name,@name2,@sex,@phone,@blood,UNIX_TIMESTAMP() + 259200, @time, 0)")

        local response = exports["oxmysql"]:insert_async(
            "INSERT INTO characters(license,name,name2,sex,phone,blood,created, prison) VALUES(@License,@Name,@Lastname,@Sex,@phone,@Blood,UNIX_TIMESTAMP() + 259200, 0)",
            {
                License = License,
                Name = name,
                Lastname = lastName,
                Sex = sex,
                phone = vRP.GeneratePhone(),
                -- Skin = skin,
                Blood = math.random(4)
            }
        )

		if response then
            local passport = response
            vRP.CharacterChosen(source,passport,skin)
        end
    end

    local user_id = vRP.Passport(source)
    if char then
        vRP.Query("playerdata/SetData",{ Passport = user_id, dkey = "nation_char", dvalue = json.encode(char) })
    end

    TriggerClientEvent("nation_barbershop:init",source,char)
    return true
end

function getUserChar(user_id, source, nation)
    local char = vRP.UserData(user_id,"nation_char")
    char.gender = getGender(user_id)
    return char
end

local userlogin = {}
function playerSpawn(user_id, source, first_spawn)
    if first_spawn then
        Wait(1000)
		processSpawnController(source,getUserChar(user_id, source),user_id)
	end
end

-- AddEventHandler("Connect",playerSpawn)

function processSpawnController(source,char,user_id)
    getUserLastPosition(source, user_id)
	local source = source

	if char then
		if not userlogin[user_id] then
			userlogin[user_id] = true
			fclient.spawnPlayer(source,true)
		else
			fclient.spawnPlayer(source,false)
		end

        fclient.setPlayerChar(source, char, true)
        TriggerClientEvent("nation_barbershop:init", source, char)
        setPlayerTattoos(source, getUserTattoos(user_id))
        fclient._setClothing(source, getUserClothes(user_id))
	else
        userlogin[user_id] = true
		fclient._startCreator(source)
	end
end

function setPlayerTattoos(source,data)
    if not data then return end

    TriggerClientEvent("reloadtattos",source,data)
end

function getUserLastPosition(source, user_id)
    local coords = {166.54,-1005.63,29.34}
    local datatable = vRP.Datatable(user_id)
    if datatable and datatable.Pos then
        local p = datatable.Pos
        coords = { p.x, p.y, p.z }
    else
        local data = vRP.UserData(user_id,"Datatable")
        if data and data.Pos then
            local p = data.Pos
            coords = { p.x, p.y, p.z }
        end
    end
    fclient._setPlayerLastCoords(source, coords)
    return coords
end

function func.getUserLastPosition()
    local source = source
    local user_id = vRP.Passport(source)
    getUserLastPosition(source, user_id)
end

function format(n)
	local left,num,right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
	return left..(num:reverse():gsub('(%d%d%d)','%1.'):reverse())..right
end

function func.changeSession(session)
    local source = source
    SetPlayerRoutingBucket(source, session)
end

function func.updateLogin()
    local source = source
    local user_id = vRP.Passport(source)
    if not user_id then return end

    userlogin[user_id] = true
    local char = getUserChar(user_id, source)
    TriggerClientEvent("nation_barbershop:init", source, char)
    setPlayerTattoos(source, getUserTattoos(user_id))
end

function func.getCharsInfo()
    local source = source
    local License = vRP.Identities(source)
    local data = vRP.Query("nation_creator/get_characters",{ steam = License })
    local info = { chars = {} }
    for k,v in ipairs(data) do
        local char = getUserChar(v.id,source)
        local gender = "masculino"
        if char.gender and char.gender == "mp_f_freemode_01" then
            gender = "feminino"
        elseif char.gender ~= "mp_m_freemode_01" then
            gender = "outros"
        end

        info.chars[k] = {
            name = v.name.." "..v.name2,
            age = v.age.." anos",
            tattoos = getUserTattoos(v.id),
            clothes = getUserClothes(v.id),
            registration = Sanguine(v.blood),
            bank = vRP.GetBank(source),
            phone = v.phone,
            user_id = v.id,
            id = "#"..v.id,
            gender = gender,
            char = char or {}
        }
    end
    info.maxChars = getUserMaxChars(source)
    return info
end

function getUserMaxChars(source)
    local License = vRP.Identities(source)
    local Account = vRP.Account(License)
    if Account then
        return Account.chars
    end
    return 1
end

function getUserClothes(user_id)
    return vRP.UserData(user_id,"Clothings")
end

function getUserTattoos(user_id)
    return vRP.UserData(user_id,"Tattooshop")
end

function getGender(Passport)
    -- local row = exports.oxmysql:single_async('SELECT `Skin` FROM `characters` WHERE `id` = ? LIMIT 1',{ Passport })
    -- if row then
    --     return row.Skin
    -- end

   local datatable = vRP.Datatable(user_id)
    if datatable and datatable.Skin then
        return data.Skin
    else
        local data = vRP.UserData(user_id,"Datatable")
        if data and data.Skin then
            return data.Skin
        end
    end

    return "mp_m_freemode_01"
end

-- function func.getOverlay()

--     print('getOverlay')
--     local source = source
--     local user_id = vRP.Passport(source)
--     if user_id then
--         local char = getUserChar(user_id, source, true)
--         if char and char.overlay then
--             return char.overlay
--         end
--     end
--     return 0
-- end

function func.playChar(info)
    local source = source
    local response = vRP.Query("nation_creator/get_character",{ steam = vRP.Identities(source), user_id = info.user_id })
    if #response > 0 then
        vRP.CharacterChosen(source,info.user_id,nil)
        playerSpawn(info.user_id, source, true)
    end
end

function func.tryDeleteChar(info)
    local source = source
    local response = vRP.Query("nation_creator/get_character",{ steam = vRP.Identities(source), user_id = info.user_id })
    if #response > 0 then
        vRP.Query("nation_creator/remove_characters",{ id = info.user_id })
        return true, ""
    end

    return false, "error"
end

function func.tryCreateChar()
    local source = source
    local License = vRP.Identities(source)
    local response = vRP.Query("nation_creator/get_characters",{ steam = License })
    if #response < getUserMaxChars(source) then
        return true
    end
end

-- function getPlayerSteam(source)
-- end

RegisterCommand("char", function(source) -- setar as customizações dnv (tipo bvida)
    local user_id = vRP.Passport(source)
    local char = getUserChar(user_id, source)
    if char then
        fclient._setPlayerChar(source, char, true)
        TriggerClientEvent("nation_barbershop:init", source, char)
        setPlayerTattoos(source, getUserTattoos(user_id))
        fclient._setClothing(source, getUserClothes(user_id))
    end
end,false)

RegisterCommand('resetchar',function(source, args) -- COMANDO DE ADMIN PARA RESETAR PERSONAGEM
    if func.checkPermission({"Admin"}, source) then
        if args[1] then 
            local id = tonumber(args[1])
            if id then
                local src = vRP.Source(id)
                if src and vRP.Request(source, "Creator", "Deseja resetar o id "..id.." ?") then
                    fclient._startCreator(src)
                end
            end
        elseif vRP.Request(source, "Creator", "Deseja resetar seu personagem ?") then
            fclient._startCreator(source)
        end
    end
end,false)

RegisterCommand('spawn',function(source) -- COMANDO DE ADMIN PARA SIMULAR O SPAWN
    if func.checkPermission({"admin.permissao", "mod.permissao", "Admin"}, source) or not vRP.Passport(source) then
        TriggerClientEvent("spawn:setupChars", source)
    end
end,false)