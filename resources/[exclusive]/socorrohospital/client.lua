RegisterCommand("socorrohospital", function()
    local ped = PlayerPedId()
    local health = GetEntityHealth(ped)

    if health <= 101 then -- player desmaiado / morto
        TriggerServerEvent("socorro:verificarMedicosAmbulancia")
    else
        TriggerEvent("Notify", "negado", "Você só pode chamar socorro se estiver desmaiado.")
    end
end)

Citizen.CreateThread(function()
    local notified = false
    while true do
        local ped = PlayerPedId()
        local health = GetEntityHealth(ped)
        local dead = IsPedDeadOrDying(ped,true) or health <= 101
        if dead and not notified then
            TriggerEvent("Notify","importante",'Digite /socorrohospital para chamar socorro.')
            notified = true
        elseif not dead and notified then
            notified = false
        end
        Wait(500)
    end
end)

RegisterNetEvent("socorro:enviarAmbulanciaNPC")
AddEventHandler("socorro:enviarAmbulanciaNPC", function()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    -- VEICULO DO NPC
    local vehicleModel = GetHashKey("ambulance")
    local pedModel = GetHashKey("s_m_m_paramedic_01")

    RequestModel(vehicleModel)
    while not HasModelLoaded(vehicleModel) do Wait(10) end

    RequestModel(pedModel)
    while not HasModelLoaded(pedModel) do Wait(10) end

    -- DISTANCIA DO NPC VIM
    local spawnOffset = GetOffsetFromEntityInWorldCoords(playerPed, 25.0, 25.0, 0.0)
    local found, groundZ = GetGroundZFor_3dCoord(spawnOffset.x, spawnOffset.y, spawnOffset.z + 100.0, 0)
    if found then
        spawnOffset = vector3(spawnOffset.x, spawnOffset.y, groundZ)
    end
    local vehicle = CreateVehicle(vehicleModel, spawnOffset.x, spawnOffset.y, spawnOffset.z, GetEntityHeading(playerPed), true, false)
    local driver = CreatePedInsideVehicle(vehicle, 4, pedModel, -1, true, false)

    SetEntityAsMissionEntity(vehicle, true, true)
    SetEntityAsMissionEntity(driver, true, true)
    SetVehicleOnGroundProperly(vehicle)

    TaskVehicleDriveToCoord(driver, vehicle, playerCoords.x, playerCoords.y, playerCoords.z, 20.0, 1, vehicleModel, 786603, 1.0, true)

    local blip = AddBlipForEntity(vehicle)
    SetBlipSprite(blip, 56)
    SetBlipColour(blip, 1)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Ambulância Socorro")
    EndTextCommandSetBlipName(blip)

    Citizen.CreateThread(function()
        local deadline = GetGameTimer() + 8000
        while true do
            local vehCoords = GetEntityCoords(vehicle)
            if #(vehCoords - playerCoords) <= 10.0 then
                TaskLeaveVehicle(driver, vehicle, 256) -- Sai pela porta do motorista
                Citizen.Wait(1000)
                TaskGoToEntity(driver, playerPed, -1, 1.0, 1.0, 1073741824, 0)
                break
            end
            if GetGameTimer() > deadline then
                SetEntityCoords(vehicle, playerCoords.x + 15.0, playerCoords.y + 15.0, playerCoords.z)
                TaskVehicleDriveToCoord(driver, vehicle, playerCoords.x, playerCoords.y, playerCoords.z, 20.0, 1, vehicleModel, 786603, 1.0, true)
                deadline = GetGameTimer() + 30000
            end
            Wait(500)
        end

        while true do
            local npcCoords = GetEntityCoords(driver)
            if #(npcCoords - playerCoords) <= 1.5 then
                TaskStartScenarioInPlace(driver, "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
                Wait(10000)
                ClearPedTasksImmediately(driver)
                TriggerServerEvent("socorro:reviverPlayer")

                -- NPC vai andando até a ambulância
                TaskGoToEntity(driver, vehicle, -1, 2.0, 1.0, 1073741824, 0)
                Citizen.Wait(6000)

                -- Caminha 5 metros para frente da ambulância
                local vehCoords2 = GetEntityCoords(vehicle)
                local walkAway = GetOffsetFromEntityInWorldCoords(vehicle, 5.0, 0.0, 0.0)
                TaskGoStraightToCoord(driver, walkAway.x, walkAway.y, walkAway.z, 1.0, 3000, 0.0, 0.0)

                Citizen.Wait(3500)

                -- NPC volta para ambulância
                TaskGoToEntity(driver, vehicle, -1, 2.0, 1.0, 1073741824, 0)
                Citizen.Wait(3000)

                -- NPC entra na ambulância
                TaskEnterVehicle(driver, vehicle, 10000, -1, 1.0, 1, 0)
                Citizen.Wait(3000)

                -- Ponto para o NPC ir embora
                local pontoSaida = vector3(playerCoords.x + 50.0, playerCoords.y + 50.0, playerCoords.z)
                TaskVehicleDriveToCoord(driver, vehicle, pontoSaida.x, pontoSaida.y, pontoSaida.z, 20.0, 1, vehicleModel, 786603, 1.0, true)

                RemoveBlip(blip)
                Citizen.Wait(10000)

                DeleteEntity(driver)
                DeleteEntity(vehicle)
                break
            end
            Wait(500)
        end
    end)
end)

RegisterNetEvent("player:revive")
AddEventHandler("player:revive", function()
    local ped = PlayerPedId()
    local maxHealth = GetEntityMaxHealth(ped) or 200
    local half = math.floor(maxHealth / 2)
    local safeHalf = math.min(maxHealth, half + 1)
    exports["survival"]:Revive(safeHalf)
end)
