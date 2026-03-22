local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

SPRAYS = {}
FastBlacklist = {}

-- Initialize database and load existing sprays
Citizen.CreateThread(function()
    -- Create table if it doesn't exist
    MySQL.ready(function()
        MySQL.Sync.execute([[
            CREATE TABLE IF NOT EXISTS `bs_spray` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `user_id` int(11) NOT NULL,
                `text` varchar(255) NOT NULL,
                `font` varchar(100) NOT NULL,
                `original_color` int(11) NOT NULL,
                `scale` decimal(10,2) NOT NULL,
                `location_x` decimal(15,6) NOT NULL,
                `location_y` decimal(15,6) NOT NULL,
                `location_z` decimal(15,6) NOT NULL,
                `rotation_x` decimal(15,6) NOT NULL,
                `rotation_y` decimal(15,6) NOT NULL,
                `rotation_z` decimal(15,6) NOT NULL,
                `interior` tinyint(1) NOT NULL DEFAULT 0,
                `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
                PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
        ]])
    end)
    
    -- Load all sprays from database
    MySQL.Async.fetchAll("SELECT * FROM bs_spray", {}, function(result)
        SPRAYS = {}
        for _, spray in pairs(result) do
            -- Safe vector creation with validation
            local location = vector3(
                tonumber(spray.location_x or 0),
                tonumber(spray.location_y or 0), 
                tonumber(spray.location_z or 0)
            )
            local rotation = vector3(
                tonumber(spray.rotation_x or 0),
                tonumber(spray.rotation_y or 0),
                tonumber(spray.rotation_z or 0)
            )
            
            -- Get the correct color based on time and interior
            local cIndex = 'color'
            if not (spray.interior == 1) then
                -- This will be calculated on client side based on time
                cIndex = 'color'
            end
            
            local sprayData = {
                id = spray.id,
                user_id = spray.user_id,
                text = spray.text or "",
                font = spray.font or "graffiti1",
                originalColor = tonumber(spray.original_color or 1),
                scale = tonumber(spray.scale or 1.0),
                location = location,
                realRotation = rotation,
                interior = spray.interior == 1
            }
            SPRAYS[#SPRAYS+1] = sprayData
        end
        
        -- Update all clients
        TriggerClientEvent('bs_spray:setSprays', -1, SPRAYS)
    end)
    
    -- Initialize blacklist
    if Config.Blacklist then
        for _, word in pairs(Config.Blacklist) do
            FastBlacklist[word] = word
        end
    end
end)

function GetSprayAtCoords(pos)
    for _, spray in pairs(SPRAYS) do
        if spray.location == pos then
            return spray
        end
    end
end

RegisterNetEvent('bs_spray:addSpray')
AddEventHandler('bs_spray:addSpray', function(spray)
    local source = source
    local user_id = vRP.getUserId(source)
    
    if user_id then
        -- Validate and clean data from spray
        local sprayData = {
            location = spray.location or vector3(0,0,0),
            realRotation = spray.realRotation or vector3(0,0,0),
            text = tostring(spray.text or "GRAFITE"),
            font = tostring(spray.font or "graffiti1"),
            originalColor = tonumber(spray.originalColor) or 1,
            scale = tonumber(spray.scale) or 1.0,
            interior = spray.interior == true or false
        }
        
        -- Additional validation
        if sprayData.text == "undefined" or sprayData.text == "UNDEFINED" or sprayData.text == "" then
            sprayData.text = "GRAFITE"
        end
        
        if sprayData.font == "undefined" or sprayData.font == "UNDEFINED" or sprayData.font == "" then
            sprayData.font = "graffiti1"
        end
        
        -- Debug log
        print("Received spray data from client:")
        print("- Text:", sprayData.text)
        print("- Font:", sprayData.font)
        print("- Original Color:", sprayData.originalColor)
        print("- Scale:", sprayData.scale)
        print("- Interior:", sprayData.interior)
        
        -- Save to database with safe data extraction
        local locationCoords = sprayData.location
        local rotationCoords = sprayData.realRotation
        
        -- Ensure we have valid color data
        local colorHex = sprayData.color or "ffffff"
        
        MySQL.Async.execute("INSERT INTO bs_spray (user_id, text, font, original_color, scale, location_x, location_y, location_z, rotation_x, rotation_y, rotation_z, interior) VALUES (@user_id, @text, @font, @original_color, @scale, @location_x, @location_y, @location_z, @rotation_x, @rotation_y, @rotation_z, @interior)", {
            ['@user_id'] = user_id,
            ['@text'] = sprayData.text,
            ['@font'] = sprayData.font,
            ['@original_color'] = sprayData.originalColor,
            ['@scale'] = sprayData.scale,
            ['@location_x'] = tonumber(locationCoords.x) or 0,
            ['@location_y'] = tonumber(locationCoords.y) or 0,
            ['@location_z'] = tonumber(locationCoords.z) or 0,
            ['@rotation_x'] = tonumber(rotationCoords.x) or 0,
            ['@rotation_y'] = tonumber(rotationCoords.y) or 0,
            ['@rotation_z'] = tonumber(rotationCoords.z) or 0,
            ['@interior'] = sprayData.interior
        }, function(insId)
            if insId then
                sprayData.id = insId
                sprayData.user_id = user_id
                sprayData.color = colorHex
                
                -- Add to local table
                SPRAYS[#SPRAYS+1] = sprayData
                
                -- Update all clients
                TriggerClientEvent('bs_spray:setSprays', -1, SPRAYS)
                print("Graffiti added to database with ID: " .. insId .. " Color: " .. colorHex)
            end
        end)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Connect",function(Passport,source)
    TriggerClientEvent('bs_spray:setSprays',source,SPRAYS)
end)

RegisterNetEvent('bs_spray:UseItemInventory')
AddEventHandler('bs_spray:UseItemInventory', function(source,sprayText)
    local Ped = GetPlayerPed(source)
    local Coords = GetEntityCoords(Ped)
    local Service,Total = vRP.NumPermission("Police")
    if FastBlacklist[sprayText] then
        TriggerClientEvent("Notify",source,"vermelho","Você não pode usar esse tipo de palavra ofenciva",5000)
    else
        if sprayText then
            if sprayText:len() <= 25 then
                TriggerClientEvent('bs_spray:spray', source, sprayText)
                TriggerClientEvent("Notify",source,"amarelo","Autoridades foram notificadas.",3000)
                for k,v in pairs(Service) do
                    async(function()
                        TriggerClientEvent("NotifyPush",v,{ time = os.date("%H:%M:%S"), code = 'QTH', title = "Dano ao patrimônio", x = Coords["x"], y = Coords["y"], z = Coords["z"], criminal = "Câmera de segurança", rgba = {160,108,15} })
                    end)
                end
            else
                TriggerClientEvent("Notify",source,"vermelho","Você so consegue grafitar palavras com até 25 letras",5000)
            end
        else
            TriggerClientEvent("Notify",source,"vermelho","Ultilize /spary (nome desejado).",5000)
        end
    end
end)

RegisterCommand('remove', function(source)
    TriggerClientEvent('bs_spray:removeClosestSpray', source)
end, false)