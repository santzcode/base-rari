local display = false
local mouseEnabled = false
local settingsOpen = false -- Controle para a janela de configurações

RegisterCommand("ft", function()
    local ped = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(ped, false)

    -- Verifica se o jogador está em um veículo
    if vehicle ~= 0 and IsPedInAnyVehicle(ped, false) then
        display = not display
        SetNuiFocus(false, false) -- Garantir que o jogador possa interagir com o jogo
        SendNUIMessage({
            type = "ui",
            display = display
        })
    else
        -- Se o jogador não estiver em um veículo, garante que a interface está oculta
        display = false
        SendNUIMessage({
            type = "ui",
            display = false
        })
    end
end)

-- Mapeia a tecla "I" para ativar/desativar o mouse
RegisterKeyMapping('ftm', 'Ativar/Desativar Mouse FuelTech', 'keyboard', 'I')


-- Comando para ativar/desativar o mouse ao pressionar J (verifica se o veículo está parado)
RegisterCommand("ftm", function()
    if display then
        local ped = PlayerPedId() -- Usar PlayerPedId para maior compatibilidade
        local vehicle = GetVehiclePedIsIn(ped, false)
        
        -- Verifica se o jogador está em um veículo
        if vehicle ~= 0 then
            local speed = GetEntitySpeed(vehicle) * 3.6 -- Converte para KMH

            if speed <= 0.5 then -- Verifica se o veículo está parado (com pequena margem)
                mouseEnabled = not mouseEnabled
                SetNuiFocus(mouseEnabled, mouseEnabled) -- Ativa ou desativa o foco do NUI e o mouse
                SendNUIMessage({
                    type = "toggleMouse",
                    mouseEnabled = mouseEnabled
                })
                -- Ativa ou desativa o pisca-alerta dependendo do estado do mouse
                toggleHazardLights(vehicle, mouseEnabled)
            else
                -- Se o veículo estiver em movimento, exibe uma mensagem
                TriggerEvent('chat:addMessage', {
                    color = { 255, 0, 0 },
                    multiline = true,
                    args = {"Sistema", "Pare o veículo para acessar as configurações!"}
                })
            end
        else
            -- Se o jogador não estiver em um veículo
            TriggerEvent('chat:addMessage', {
                color = { 255, 0, 0 },
                multiline = true,
                args = {"Sistema", "Você não está em um veículo!"}
            })
        end
    end
end)

-- Mapeia a tecla "J" para ativar/desativar o mouse e interagir com as configurações
RegisterKeyMapping('toggleMouse', 'Ativar/Desativar Mouse FuelTech', 'keyboard', 'J')

-- Comando para abrir/fechar configurações ao pressionar I (verifica se o veículo está parado)
RegisterCommand("toggleSettings", function()
    if display then
        local ped = PlayerPedId() -- Usar PlayerPedId para maior compatibilidade
        local vehicle = GetVehiclePedIsIn(ped, false)
        
        -- Verifica se o jogador está em um veículo
        if vehicle ~= 0 then
            local speed = GetEntitySpeed(vehicle) * 3.6 -- Converte para KMH

            if speed <= 0.5 then -- Verifica se o veículo está parado (com pequena margem)
                settingsOpen = not settingsOpen
                SendNUIMessage({
                    type = "toggleSettings",
                    settingsOpen = settingsOpen
                })
            else
                -- Se o veículo estiver em movimento, exibe uma mensagem
                --TriggerEvent('chat:addMessage', {
                --    color = { 255, 0, 0 },
                --    multiline = true,
                --    args = {"", ""}
                --})
            end
        else
            -- Se o jogador não estiver em um veículo
            -- TriggerEvent('chat:addMessage', {
            --     color = { 255, 0, 0 },
            --     multiline = true,
            --     args = {"", ""}
            -- })
        end
    end
end)

-- Mapeia a tecla "I" para abrir/fechar configurações
RegisterKeyMapping('toggleSettings', 'Abrir/Fechar Configurações FuelTech', 'keyboard', 'I')

-- Callback para ativar/desativar o NUI Focus
RegisterNUICallback('setNuiFocus', function(data, cb)
    if data.focus then
        SetNuiFocus(true, true) -- Ativa o foco do NUI
    else
        SetNuiFocus(false, false) -- Desativa o foco do NUI
    end
    cb('ok')
end)
RegisterNUICallback('closeSettings', function(data, cb)
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)

    if vehicle ~= 0 then
        toggleHazardLights(vehicle, false) -- Desliga o pisca-alerta
    end

    cb('ok')
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(200)

        local ped = GetPlayerPed(-1)
        local vehicle = GetVehiclePedIsIn(ped, false)

        if vehicle ~= 0 and IsPedInAnyVehicle(ped, false) then
            local engineRunning = GetIsVehicleEngineRunning(vehicle) -- Verifica se o motor está ligado

            if engineRunning then
                -- Motor está ligado, atualiza os dados do painel
                local rpm = math.floor(GetVehicleCurrentRpm(vehicle) * 10000)
                local speedMph = GetEntitySpeed(vehicle) * 2.236936
                local speedKmh = math.ceil(speedMph * 1.60934)
                local gear = GetVehicleCurrentGear(vehicle)
                local fuelLevel = math.floor(GetVehicleFuelLevel(vehicle))
                local oilLevel = math.floor(GetVehicleOilLevel(vehicle) * 100)
                local batteryLevel = math.random(12, 14)
                local mapValue = math.random(24, 30)
                local tps = math.random(0, 100)

                -- Pegando a aceleração do veículo (X, Y, Z)
                local accelX, accelY, accelZ = table.unpack(GetEntityVelocity(vehicle))

                -- Enviando dados para a interface NUI
                SendNUIMessage({
                    type = "update",
                    rpm = rpm,
                    speed = speedKmh,
                    gear = gear,
                    fuel = fuelLevel,
                    oil = oilLevel,
                    battery = batteryLevel,
                    map = mapValue,
                    tps = tps,
                    accelerationX = accelX,
                    accelerationY = accelY,
                    accelerationZ = accelZ,
                    engineOn = true -- Motor ligado
                })
            else
                -- Motor está desligado, simular desligamento no painel
                SendNUIMessage({
                    type = "update",
                    engineOn = false -- Motor desligado
                })
            end
        else
            -- Se o jogador sair do veículo, garantir que a interface seja fechada
            if display then
                display = false
                SendNUIMessage({
                    type = "ui",
                    display = false
                })
            end

            -- Além disso, atualizar o painel para mostrar motor desligado
            SendNUIMessage({
                type = "update",
                engineOn = false -- Motor desligado
            })
        end
    end
end)
-- Função para ativar/desativar o pisca-alerta
function toggleHazardLights(vehicle, state)
    if state then
        -- Ativar pisca-alerta (ambos os indicadores)
        SetVehicleIndicatorLights(vehicle, 0, true) -- Pisca lado esquerdo
        SetVehicleIndicatorLights(vehicle, 1, true) -- Pisca lado direito
    else
        -- Desativar pisca-alerta
        SetVehicleIndicatorLights(vehicle, 0, false) -- Desliga lado esquerdo
        SetVehicleIndicatorLights(vehicle, 1, false) -- Desliga lado direito
    end
end
local tractionControl = true

RegisterNUICallback('toggleTractionControl', function(data, cb)
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)

    if vehicle ~= 0 then
        tractionControl = data.enabled
        if tractionControl then
            -- Aumenta a aderência do veículo
            SetVehicleReduceGrip(vehicle, false)
        else
            -- Reduz a aderência do veículo
            SetVehicleReduceGrip(vehicle, true)
        end
    end

    cb('ok')
end)

local launchControl = 0.5
local brakeForce = 1.0

RegisterNUICallback('adjustLaunchAndBrake', function(data, cb)
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)

    if vehicle ~= 0 then
        launchControl = data.launch
        brakeForce = data.brake

        -- Ajusta a força do motor para controle de arrancada
        SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fInitialDriveForce', launchControl)
        
        -- Ajusta a força de frenagem do veículo
        SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fBrakeForce', brakeForce)
    end

    cb('ok')
end)
local suspensionMode = "normal" -- Modo padrão
local suspensionHeight = 0.0

-- Definição dos modos de suspensão
local suspensionSettings = {
    ["racing"] = -0.05,  -- Modo Racing: Suspensão rebaixada
    ["normal"] = 0.0,   -- Modo Normal: Suspensão padrão
    ["offroad"] = 0.05   -- Modo Offroad: Suspensão elevada
}

-- Callback para ajustar o modo de suspensão
RegisterNUICallback('adjustSuspensionMode', function(data, cb)
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)

    if vehicle ~= 0 then
        -- Verifica o modo selecionado pelo jogador e aplica a altura correspondente
        suspensionMode = data.mode
        suspensionHeight = suspensionSettings[suspensionMode]

        -- Aplica o ajuste de suspensão de acordo com o modo selecionado
        SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fSuspensionRaise', suspensionHeight)

        -- Envia uma notificação ao jogador sobre o modo ativado (opcional)
        TriggerEvent('chat:addMessage', {
            color = { 255, 255, 0 },
            multiline = true,
            args = {"Sistema", "Modo de Suspensão alterado para: " .. suspensionMode}
        })
    end

    cb('ok')
end)

local rpmLimit = 7000 -- Valor padrão de limite de RPM

-- Callback para ajustar o limite de RPM
RegisterNUICallback('adjustRpmLimit', function(data, cb)
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)

    if vehicle ~= 0 then
        -- Garantir que o valor de RPM esteja entre 5000 e 10000 e seja ajustado em 500
        local newRpmLimit = math.floor(data.rpmLimit / 500) * 500
        rpmLimit = math.max(5000, math.min(newRpmLimit, 10000))

        -- Notificação opcional sobre o novo limite de RPM
        TriggerEvent('chat:addMessage', {
            color = { 255, 255, 0 },
            multiline = true,
            args = {"Sistema", "Limite de RPM ajustado para: " .. rpmLimit}
        })
    end

    cb('ok')
end)

-- Thread para aplicar o limite de RPM em tempo real
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)

        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)

        if vehicle ~= 0 and IsVehicleEngineOn(vehicle) then
            local currentRpm = GetVehicleCurrentRpm(vehicle) * 10000

            -- Verifica se o RPM atual excede o limite definido
            if currentRpm > rpmLimit then
                -- Reduz a potência do motor para limitar o RPM
                SetVehicleEnginePowerMultiplier(vehicle, -50.0) -- Reduz a potência
            else
                -- Restaura a potência normal do motor
                SetVehicleEnginePowerMultiplier(vehicle, 1.0)
            end
        end
    end
end)
---------------------------------------------------------
local rpmLimit = 7000 -- Valor padrão de limite de RPM

-- Callback para ajustar o limite de RPM
RegisterNUICallback('adjustRpmLimit', function(data, cb)
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)

    if vehicle ~= 0 then
        -- Garantir que o valor de RPM esteja entre 5000 e 10000 e seja ajustado em 500
        local newRpmLimit = math.floor(data.rpmLimit / 500) * 500
        rpmLimit = math.max(5000, math.min(newRpmLimit, 10000))

        -- Notificação opcional sobre o novo limite de RPM
        TriggerEvent('chat:addMessage', {
            color = { 255, 255, 0 },
            multiline = true,
            args = {"Sistema", "Limite de RPM ajustado para: " .. rpmLimit}
        })
    end

    cb('ok')
end)

-- Thread para aplicar o limite de RPM em tempo real
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)

        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)

        if vehicle ~= 0 and IsVehicleEngineOn(vehicle) then
            local currentRpm = GetVehicleCurrentRpm(vehicle) * 10000

            -- Verifica se o RPM atual excede o limite definido
            if currentRpm > rpmLimit then
                -- Reduz a potência do motor para limitar o RPM
                SetVehicleEnginePowerMultiplier(vehicle, -50.0) -- Reduz a potência
            else
                -- Restaura a potência normal do motor
                SetVehicleEnginePowerMultiplier(vehicle, 1.0)
            end
        end
    end
end)

