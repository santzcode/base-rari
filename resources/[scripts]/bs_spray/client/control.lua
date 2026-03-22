Fonts = {}

-- Initialize rotation tracking globals
currentComputedRotation = vector3(0,0,0)
currentSprayRotation = nil

for idx, f in pairs(FONTS) do
    Fonts[idx] = f.label
end

SprayFont = 1
SprayText = ''
FormattedSprayText = ''

SprayColor = 1

SprayScaleMin = 60
SprayScaleMax = 200
CurrentSprayScale = 40
SprayScale = 1
SprayScaleSelect = {}

for i = SprayScaleMin, SprayScaleMax, 5 do
    table.insert(SprayScaleSelect, i)
end

IsSpraying = false

local lastFormattedText = nil
function ResetFormattedText()
    local tmp = SprayText or "GRAFITE"
    if tmp ~= lastFormattedText then
        lastFormattedText = tmp
        
        -- Ensure we have valid font data
        local fontData = FONTS[SprayFont] or FONTS[1]
        
        if fontData.forceUppercase then
            tmp = tmp:upper()
        end
        
        -- Clean the text
        tmp = RemoveDisallowedCharacters(tmp, fontData.allowedInverse)
        
        -- Ensure we have valid text
        if tmp == "" or tmp == "undefined" or tmp == "UNDEFINED" then
            tmp = "GRAFITE"
        end
        
        FormattedSprayText = tmp
        
        print("Formatted text:", FormattedSprayText)
    end
end

RegisterNetEvent('bs_spray:spray')
AddEventHandler('bs_spray:spray', function(text)
    if not IsSpraying then
        if text then
            SprayText = text
            IsSpraying = true
            ResetFormattedText()
            -- Reset rotation for new spray session
            currentComputedRotation = vector3(0,0,0)
            currentSprayRotation = nil
            
            -- Use modern NUI instead of WarMenu
            OpenModernSprayMenu(text)
        end
    end
end, false)

-- Modern NUI Integration for Spray System
RegisterNetEvent('bs_spray:executeSprayWithSettings')
AddEventHandler('bs_spray:executeSprayWithSettings', function(settings)
    if settings then
        print("Executing spray with settings:")
        print("- Font:", settings.font)
        print("- Color:", settings.color)
        print("- Size:", settings.size)
        print("- Text:", settings.text)
        
        -- Update all spray variables with validation
        SprayFont = tonumber(settings.font) or 1
        SprayColor = tonumber(settings.color) or 1
        SprayScale = math.ceil((tonumber(settings.size) - 60) / 5) + 1 -- Convert size to scale index
        SprayText = tostring(settings.text) or "GRAFITE"
        
        -- Validate text
        if SprayText == "undefined" or SprayText == "UNDEFINED" or SprayText == "" then
            SprayText = "GRAFITE"
        end
        
        -- Clamp values
        if SprayFont < 1 or SprayFont > #FONTS then
            SprayFont = 1
        end
        if SprayColor < 1 or SprayColor > #COLORS then
            SprayColor = 1
        end
        if SprayScale < 1 or SprayScale > #SprayScaleSelect then
            SprayScale = 1
        end
        
        print("Validated spray data:")
        print("- SprayFont:", SprayFont)
        print("- SprayColor:", SprayColor)
        print("- SprayScale:", SprayScale)
        print("- SprayText:", SprayText)
        
        ResetFormattedText()
        PersistSpray()
        IsSpraying = false
        SprayText = ''
    end
end)

-- Keep WarMenu as fallback for compatibility (DISABLED to prevent conflicts with NUI)
Citizen.CreateThread(function()
    WarMenu.CreateMenu('spray','GRAFITI')
    WarMenu.SetSubTitle('spray', 'PRECIONE BACKSPACE PARA CANCELAR')
    WarMenu.SetMenuX('spray', 0.05)
    WarMenu.SetMenuY('spray', 0.25)
    WarMenu.SetMenuWidth('spray', 0.25)
    while true do
        Wait(1000)
        -- Disabled to prevent conflicts with modern NUI
        if false and IsSpraying and not IsModernSprayMenuOpen() then
            if IsImprovedColorMenuOpen() then
                -- Não mostrar WarMenu quando color menu está aberto
            elseif WarMenu.IsMenuOpened('spray') then
                if WarMenu.ComboBox('Estilo', Fonts, SprayFont, SprayFont, function(currentIndex, selectedIndex)
                    SprayFont = currentIndex
                    ResetFormattedText()
				end) then
                elseif WarMenu.Button('► SELECIONAR COR ◄') then
                    OpenImprovedColorMenu()
                elseif WarMenu.ComboBox('Tamanho', SprayScaleSelect, SprayScale, SprayScale, function(currentIndex, selectedIndex)
					SprayScale = currentIndex
                end) then
                elseif WarMenu.Button('Pintar') then
                    WarMenu.CloseMenu()
                    PersistSpray()
                    IsSpraying = false
                    SprayText = ''
                end

                WarMenu.Display()
            else
                IsSpraying = false
                SprayText = ''
            end
        end
    end
end)

function PersistSpray()
    IsSpraying = false
        
    local rayEndCoords, rayNormal, sprayFwdVector = FindRaycastedSprayCoords()
    if rayEndCoords and rayNormal then
        local sprayLocation = rayEndCoords + sprayFwdVector * SPRAY_FORWARD_OFFSET
        

        local ped = PlayerPedId()

        local canPos = vector3(0.072, 0.041, -0.06)
        local canRot = vector3(33.0, 38.0, 0.0)
    
        local canObj = CreateObject(
            `ng_proc_spraycan01b`,
            0.0, 0.0, 0.0,
            true, false, false
        )
        
        AttachEntityToEntity(
            canObj, ped, 
            GetPedBoneIndex(ped, 57005), 
            canPos.x, canPos.y, canPos.z, 
            canRot.x, canRot.y, canRot.z, 
            true, true, false, true, 1, true
        )

        local isCancelled = false

        Citizen.CreateThread(function()
            Wait(2000)
            while not isCancelled do
                SprayEffects()
                Wait(5000)
            end
        end)

        CancellableProgress(
            Config.DURACAO_BARRA_PROGRESSO, 
            'anim@amb@business@weed@weed_inspecting_lo_med_hi@', 'weed_spraybottle_stand_spraying_01_inspector', 16,
            function() 
                -- Calcular rotação para alinhamento correto na parede
                local finalRotation
                
                if rayNormal then
                    -- Usar rayNormal para calcular rotação alinhada com a parede
                    finalRotation = CalculateLookRotation(rayNormal)
                else
                    -- Fallback se não há ray normal
                    finalRotation = vector3(0, 0, GetEntityHeading(PlayerPedId()))
                end
                
                -- Garantir que a rotação está correta (fixo perpendicular à parede)
                if finalRotation and (finalRotation.x ~= 0 or finalRotation.y ~= 0 or finalRotation.z ~= 0) then
                    -- Usar a rotação calculada diretamente
                else
                    -- Fallback com rotação de camera
                    finalRotation = currentComputedRotation or vector3(0, 0, 0)
                end
                
                -- Get the correct color for the spray
                local isInterior = GetInteriorFromEntity(PlayerPedId()) > 0
                local cIndex = isInterior and 'color' or GetTimeColorName()
                local selectedColor = COLORS[SprayColor] or COLORS[1]
                local colorHex = selectedColor[cIndex] and selectedColor[cIndex].hex or "ffffff"
                
                -- Validate data before sending
                local sprayData = {
                    location = sprayLocation,
                    realRotation = finalRotation, 
                    scale = (SprayScaleSelect[SprayScale] / 10.0) * FONTS[SprayFont].sizeMult,
                    text = FormattedSprayText or "GRAFITE",
                    font = FONTS[SprayFont].font or "graffiti1",
                    color = colorHex or "ffffff",
                    originalColor = SprayColor or 1,
                    interior = isInterior or false
                }
                
                -- Debug log
                print("Sending spray data to server:")
                print("- Text:", sprayData.text)
                print("- Font:", sprayData.font)
                print("- Color:", sprayData.color)
                print("- Original Color:", sprayData.originalColor)
                print("- Scale:", sprayData.scale)
                
                TriggerServerEvent('bs_spray:addSpray', sprayData)
                ClearPedTasks(ped)
                DeleteObject(canObj)
                isCancelled = true
            end,
            function()
                ClearPedTasks(ped)
                DeleteObject(canObj)
                isCancelled = true
            end
        )
    end
end

function CalculateLookRotation(wallNormal)
    -- Calcular rotação que alinha o spray perpendicular à parede
    local wallX, wallY, wallZ = wallNormal.x, wallNormal.y, wallNormal.z
    
    -- Normalizar os valores para evitar divisão por zero
    if wallX == 0 and wallY == 0 then
        -- Se o normal está apenas na verticais Z (pokēko parede), manter nivelado
        return vector3(0, 0, 0)
    end
    
    -- Calcular a rotação em Z (azimute) baseada no normal da parede
    local yawRadians = math.atan2(wallY, wallX)
    local yawDegrees = math.deg(yawRadians)
    
    -- Rotação 90° para perpendicular à parede
    local perpendicularHeading = yawDegrees + 90
    
    -- Corrigir se a diferença é muito extremada  
    if perpendicularHeading < 0 then
        perpendicularHeading = perpendicularHeading + 360
    end
    if perpendicularHeading >= 360 then
        perpendicularHeading = perpendicularHeading - 360
    end
    
    -- Criar vetor de rotação orientado perpendicularmente a parede
    local adjustedRotation = vector3(0, 0, perpendicularHeading)
    
    return adjustedRotation
end

function SprayEffects()
    local dict = "scr_recartheft"
    local name = "scr_wheel_burnout"
    
    local ped = PlayerPedId()
    local fwd = GetEntityForwardVector(ped)
    local coords = GetEntityCoords(ped) + fwd * 0.5 + vector3(0.0, 0.0, -0.5)

	RequestNamedPtfxAsset(dict)
    while not HasNamedPtfxAssetLoaded(dict) do
        Citizen.Wait(0)
	end

	local pointers = {}
    
    local color = COLORS[SprayColor]['color'].rgb

    local heading = GetEntityHeading(ped)

    UseParticleFxAssetNextCall(dict)
    SetParticleFxNonLoopedColour(color[1] / 255, color[2] / 255, color[3] / 255)
    SetParticleFxNonLoopedAlpha(1.0)
    local ptr = StartNetworkedParticleFxNonLoopedAtCoord(
        name, 
        coords.x, coords.y, coords.z + 2.0, 
        0.0, 0.0, heading, 
        0.7, 
        0.0, 0.0, 0.0
    )
    RemoveNamedPtfxAsset(dict)
end

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 100 )
    end
end

function RemoveDisallowedCharacters(str, inverse)
    local replaced, _ = str:gsub(inverse, '')

    return replaced
end