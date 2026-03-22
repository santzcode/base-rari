-- Nova implementação do sistema de seleção de cores para bs_spray
-- Resolve definitivamente o bug das 3 faixas de cores (laranja/preto/branco)

local ColorMenuMode = false
local CurrentColorIndex = 1
local AvailableColors = {}

local function LoadAvailableColors()
    AvailableColors = {}
    for idx, c in pairs(COLORS) do
        table.insert(AvailableColors, {
            index = idx,
            rgb = { c.color.rgb[1], c.color.rgb[2], c.color.rgb[3] },
            name = c.basic or "COLOR" .. idx,
            hex = c.color.hex
        })
    end
end

local function DrawCleanColorPreview(centerX, centerY, colorRGB, rectWidth, rectHeight)
    local colorR = colorRGB[1] or 255
    local colorG = colorRGB[2] or 255  
    local colorB = colorRGB[3] or 255
    
    -- Draw a solid, clean rectangle - ONE SINGLE COLOR OVERLAY
    DrawRect(centerX, centerY, rectWidth, rectHeight, colorR, colorG, colorB, 255)
end

local function ShowColorMenu()
    ColorMenuMode = true
    CurrentColorIndex = SprayColor
    SetNuiFocus(false, false)
end

local function HideColorMenu()
    ColorMenuMode = false
end

local function DrawColorMenu()
    if not ColorMenuMode then return end
    
    local screenW, screenH = GetScreenResolution()
    local baseX = 0.05
    local baseY = 0.3
    local menuWidth = 0.18
    local menuHeight = 0.4
    
    -- Background do menu
    DrawRect(baseX, baseY, menuWidth, menuHeight, 0, 0, 0, 200)
    
    -- Border branca
    DrawRect(baseX, baseY, menuWidth, 0.005, 255, 255, 255, 255) -- top
    DrawRect(baseX, baseY, 0.005, menuHeight, 255, 255, 255, 255) -- left
    DrawRect(baseX + menuWidth, baseY, 0.005, menuHeight, 255, 255, 255, 255) -- right
    DrawRect(baseX, baseY + menuHeight, menuWidth, 0.005, 255, 255, 255, 255) -- bottom
    
    -- Titulo
    SetTextFont(1)
    SetTextProportional(false)
    SetTextScale(0.35, 0.35)
    SetTextColour(255, 255, 255, 255)
    SetTextCentre(true)
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName("SELECIONAR COR")
    EndTextCommandDisplayText(baseX, baseY - 0.015)
    
    -- Preview da cor atual (grande, limpo, sem artefatos)
    local previewX = baseX
    local previewY = baseY + 0.02
    local previewWidth = menuWidth - 0.02
    local previewHeight = 0.08
    
    -- Cor de fundo do preview
    DrawRect(previewX, previewY, previewWidth, previewHeight, 50, 50, 50, 255)
    
    -- Preview da cor selecionada
    if AvailableColors[CurrentColorIndex] then
        local selectedColorRGB = AvailableColors[CurrentColorIndex].rgb
        DrawCleanColorPreview(previewX, previewY, selectedColorRGB, previewWidth, previewHeight)
    end
    
    -- Label da cor selecionada
    SetTextFont(0)
    SetTextScale(0.25, 0.25)
    SetTextColour(200, 200, 200, 255)
    SetTextCentre(true)
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(AvailableColors[CurrentColorIndex].name or "")
    EndTextCommandDisplayText(previewX, previewY + previewHeight/2 + 0.025)
    
    -- Sombras do gradiente de cores disponíveis
    local gradientX = baseX
    local gradientY = baseY + 0.12
    local gradientWidth = menuWidth - 0.01
    local gradientHeight = 0.03
    
    -- Miniaturas das cores na parte inferior
    local totalColors = #AvailableColors
    local colorWidth = (gradientWidth - 0.05) / totalColors
    
    for i = 1, totalColors do
        local colorX = gradientX + 0.025 + (i - 1) * colorWidth
        local colorY = gradientY
        local currentColorRGB = AvailableColors[i].rgb
        
        -- Highlight da cor atual
        if i == CurrentColorIndex then
            DrawRect(colorX - 0.005, colorY - 0.005, colorWidth + 0.01, gradientHeight + 0.01, 255, 255, 255, 180)
        end
        
        -- Cor em si
        DrawCleanColorPreview(colorX, colorY, currentColorRGB, colorWidth, gradientHeight)
    end
    
    -- Controles
    SetTextFont(0)
    SetTextScale(0.20, 0.20)
    SetTextColour(180, 180, 180, 255)
    SetTextCentre(false)
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName("←  ← → →  - Navegar | ENTER - Selecionar | ESC - Cancelar")
    EndTextCommandDisplayText(gradientX, baseY + menuHeight - 0.04)
end

-- Controles permitidos no menu color
local function HandleColorMenuInput()
    if not ColorMenuMode then return end
    
    if IsControlJustPressed(0, 15) then -- arrow right
        CurrentColorIndex = CurrentColorIndex + 1
        if CurrentColorIndex > #AvailableColors then
            CurrentColorIndex = 1
        end
    elseif IsControlJustPressed(0, 14) then -- arrow left  
        CurrentColorIndex = CurrentColorIndex - 1
        if CurrentColorIndex < 1 then
            CurrentColorIndex = #AvailableColors
        end
    elseif IsControlJustPressed(0, 18) then -- ENTER
        SprayColor = CurrentColorIndex
        HideColorMenu()
    elseif IsControlJustPressed(0, 177) then -- ESC
        HideColorMenu()
    end
end

-- Thread principal da interface de cores
Citizen.CreateThread(function()
    LoadAvailableColors()
    
    while true do
        Citizen.Wait(1000)
        
        -- Disabled to prevent conflicts with modern NUI
        if false and ColorMenuMode then
            DrawColorMenu()
            HandleColorMenuInput()
            
            -- Lock other controls que podem conflito
            DisableControlAction(0, 1, true) -- camera look left/right  
            DisableControlAction(0, 2, true) -- camera look up/down
            DisableControlAction(0, 19, true) -- Player input
            DisableControlAction(0, 20, true) -- disable breaking controls
        end
    end
end)

-- Alternative simpler interface when WarMenu panel fails
local function DrawSimplifiedColorSelector()
    -- Disabled to prevent conflicts with modern NUI
    return
end

-- Disable simple mode to prevent conflicts
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        -- Disabled to prevent conflicts with modern NUI
    end
end)

-- Exports for WarMenu replacement
function GetImprovedColorIndex()
    return SprayColor
end

function SetImprovedColorIndex(index)
    SprayColor = index
end

function OpenImprovedColorMenu()
    ShowColorMenu()
end

function IsImprovedColorMenuOpen()
    return ColorMenuMode
end
