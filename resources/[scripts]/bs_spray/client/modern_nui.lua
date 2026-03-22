-- BS Spray - Modern NUI Integration
local sprayMenuOpen = false
local currentFont = 1
local currentColor = 1
local currentSize = 100
local sprayText = ''

-- Initialize NUI state
local function InitializeNUI()
    SetNuiFocus(false, false)
    sprayMenuOpen = false
    
    -- Ensure all required functions exist
    if not sprayText then sprayText = 'GRAFITE' end
    if not currentFont then currentFont = 1 end
    if not currentColor then currentColor = 1 end
    if not currentSize then currentSize = 100 end
end

-- Open modern spray menu
local function OpenSprayMenu(text)
    sprayText = text or 'GRAFITE'
    
    SetNuiFocus(true, true)
    sprayMenuOpen = true
    
    SendNUIMessage({
        action = 'openSprayMenu',
        data = {
            font = currentFont,
            color = currentColor,
            size = currentSize,
            text = sprayText
        }
    })
end

-- Close spray menu
local function CloseSprayMenu()
    SetNuiFocus(false, false)
    sprayMenuOpen = false
    
    SendNUIMessage({
        action = 'closeSprayMenu'
    })
end

-- Handle spray action
local function HandleSpray(data)
    if data.font then currentFont = tonumber(data.font) or 1 end
    if data.color then currentColor = tonumber(data.color) or 1 end
    if data.size then currentSize = tonumber(data.size) or 100 end
    if data.text then sprayText = tostring(data.text) or "GRAFITE" end
    
    -- Validate data
    if sprayText == "undefined" or sprayText == "UNDEFINED" or sprayText == "" then
        sprayText = "GRAFITE"
    end
    
    print("NUI spray data:")
    print("- Font:", currentFont)
    print("- Color:", currentColor)
    print("- Size:", currentSize)
    print("- Text:", sprayText)
    
    -- Execute spray with selected settings
    if IsSpraying then
        TriggerEvent('bs_spray:executeSprayWithSettings', {
            font = currentFont,
            color = currentColor,
            size = currentSize,
            text = sprayText
        })
    end
    
    CloseSprayMenu()
end

-- NUI Event Handlers
RegisterNUICallback('closeSprayMenu', function(data, cb)
    CloseSprayMenu()
    cb('ok')
end)

RegisterNUICallback('startSpraying', function(data, cb)
    if data.data then
        HandleSpray(data.data)
    end
    cb('ok')
end)

RegisterNUICallback('executeSprayWithSettings', function(data, cb)
    -- Validate and process data
    if data.font and data.color and data.size and data.text then
        TriggerEvent('bs_spray:executeSprayWithSettings', {
            font = tonumber(data.font) or 1,
            color = tonumber(data.color) or 1, 
            size = tonumber(data.size) or 100,
            text = tostring(data.text) or 'GRAFITE'
        })
        CloseSprayMenu()
    end
    cb('ok')
end)

-- Catch messages back from NUI
AddEventHandler('onClientResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        InitializeNUI()
    end
end)

-- Export functions for main spray system
function OpenModernSprayMenu(text)
    if not sprayMenuOpen then
        OpenSprayMenu(text)
    end
end

function CloseModernSprayMenu()
    CloseSprayMenu()
end

function IsModernSprayMenuOpen()
    return sprayMenuOpen
end

function GetModernSprayFont()
    return currentFont
end

function GetModernSprayColor()
    return currentColor
end

function GetModernSpraySize()
    return currentSize
end
