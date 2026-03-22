local Proxy = module("vrp","lib/Proxy")
local vRP = Proxy.getInterface("vRP")

function GetPlayer(playerId)
    local player = { source = playerId }
    return player
end

function GetCharacterId(player)
	return vRP.Passport(player.source)
end

function IsPlayerInGroup(player, filter)
    local playerId = vRP.Passport(player.source)

    local type = type(filter)
    if type == "string" then
        return vRP.HasGroup(playerId,filter)
    end

    if table.type(filter) == "array" then
        for i = 1, #filter do
            local groupName = filter[i]
            local result = vRP.HasGroup(playerId,groupName)
            if result then
                return result
            end
        end
        return
    end

    for group, grade in pairs(filter) do
        if vRP.HasGroup(playerId,group,grade ~= 0 and grade or false) then
            return true
        end
    end

    return false
end
