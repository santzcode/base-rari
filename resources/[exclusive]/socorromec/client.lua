
-- Autenticado por es771 - HidenStore

local emCooldown = false

RegisterCommand("socorromec", function()
    if emCooldown then
        TriggerEvent("Notify", "negado", "Aguarde o tempo de recarga para usar novamente.")
        return
    end
    local vehicle = FindTargetVehicle(nil)
    if vehicle then
        TriggerServerEvent("hiden:solicitarReparo")
    else
        TriggerEvent("Notify","negado","Aproxime-se do veículo para chamar o mecânico.")
    end
end)

RegisterCommand("chamarmec", function()
    TriggerServerEvent("hiden:solicitarNPCMecanico")
end)

RegisterNetEvent("hiden:validarReparo")
AddEventHandler("hiden:validarReparo", function()
    local vehicle = FindTargetVehicle(nil)
    if vehicle ~= nil and vehicle ~= 0 then
        local plate = GetVehicleNumberPlateText(vehicle)
        TriggerServerEvent("hiden:executarReparo", plate)
    else
        TriggerEvent("Notify", "negado", "Não há veículo perto de você para reparar.")
    end
end)

RegisterNetEvent("hiden:autorizarNPCMecanico")
AddEventHandler("hiden:autorizarNPCMecanico", function()
    TriggerEvent("hiden:forcarNPCMecanico")
end)

RegisterNetEvent("hiden:repararVeiculo")
AddEventHandler("hiden:repararVeiculo", function()
    TriggerEvent("hiden:forcarNPCMecanico")
end)

RegisterNetEvent("hiden:forcarNPCMecanico")
AddEventHandler("hiden:forcarNPCMecanico", function()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local vehicle = FindTargetVehicle(nil)

    if vehicle and vehicle ~= 0 then
        if emCooldown then
            TriggerEvent("Notify", "negado", "Aguarde o tempo de recarga para usar novamente.")
            return
        end

        emCooldown = true

        -- Load Models
        local npcHash = GetHashKey("s_m_y_xmech_01")
        local motoHash = GetHashKey("sanchez")

        RequestModel(npcHash)
        while not HasModelLoaded(npcHash) do Wait(10) end

        RequestModel(motoHash)
        while not HasModelLoaded(motoHash) do Wait(10) end

        -- Spawn Moto
        local spawnOffset = GetOffsetFromEntityInWorldCoords(playerPed, 25.0, 25.0, 0.0)
        local moto = CreateVehicle(motoHash, spawnOffset.x, spawnOffset.y, spawnOffset.z, 0.0, true, false)

        -- Spawn NPC as driver
        local npc = CreatePedInsideVehicle(moto, 4, npcHash, -1, true, false)
        SetEntityAsMissionEntity(npc, true, true)
        SetEntityAsMissionEntity(moto, true, true)

        -- Criar Blip com Rota GPS
        local blip = AddBlipForEntity(moto)
        SetBlipSprite(blip, 348)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.8)
        SetBlipColour(blip, 5)
        SetBlipRoute(blip, true)
        SetBlipRouteColour(blip, 5)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Mecânico NPC")
        EndTextCommandSetBlipName(blip)

        -- NPC dirige até o player
        TaskVehicleDriveToCoord(npc, moto, playerCoords.x, playerCoords.y, playerCoords.z, 20.0, 1, motoHash, 786603, 10.0)
        TriggerEvent("Notify", "importante", "Mecânico NPC está a caminho com a moto...")

        -- Aguardar aproximação
        local approaching = true
        while approaching do
            Wait(1000)
            local motoCoords = GetEntityCoords(moto)
            if #(motoCoords - playerCoords) < 10.0 then
                approaching = false
            end
        end

        RemoveBlip(blip)

        vehicle = FindTargetVehicle(moto)
        TaskLeaveVehicle(npc, moto, 0)
        Wait(2000)
        if vehicle then
            TaskGoToEntity(npc, vehicle, -1, 2.0, 2.0, 1073741824, 0)
        end

        -- Reparar veículo
        local repairing = false
        while not repairing do
            Wait(500)
            vehicle = vehicle or FindTargetVehicle(moto)
            if vehicle then
                local npcCoords = GetEntityCoords(npc)
                local vehCoords = GetEntityCoords(vehicle)
                if #(npcCoords - vehCoords) < 2.0 then
                local plate = GetVehicleNumberPlateText(vehicle)
                local authorized = nil
                RegisterNetEvent("hiden:autorizadoReparoPlaca")
                AddEventHandler("hiden:autorizadoReparoPlaca", function()
                    authorized = true
                end)
                RegisterNetEvent("hiden:negadoReparoPlaca")
                AddEventHandler("hiden:negadoReparoPlaca", function()
                    authorized = false
                end)
                TriggerServerEvent("hiden:autorizacaoReparoPlaca", plate)
                local timeout = GetGameTimer() + 5000
                while authorized == nil and GetGameTimer() < timeout do Wait(0) end
                if authorized then
                    repairing = true
                    RequestAnimDict("mini@repair")
                    while not HasAnimDictLoaded("mini@repair") do Wait(10) end
                    TaskPlayAnim(npc, "mini@repair", "fixing_a_ped", 8.0, -8.0, -1, 1, 0, false, false, false)
                    TriggerEvent("Notify", "importante", "Mecânico está reparando seu veículo, aguarde...")
                    Wait(8000)
                    ClearPedTasks(npc)
                    SetVehicleFixed(vehicle)
                    SetVehicleDeformationFixed(vehicle)
                    SetVehicleUndriveable(vehicle, false)
                    SetVehicleEngineOn(vehicle, true, true)
                    TriggerEvent("Notify", "sucesso", "Veículo reparado com sucesso!")
                else
                    repairing = true
                    TriggerEvent("Notify","negado","Este veículo não pertence a você.")
                end
                else
                    TaskGoToEntity(npc, vehicle, -1, 2.0, 2.0, 1073741824, 0)
                    local deadline = GetGameTimer() + 8000
                    if GetGameTimer() > deadline then
                        local near = GetOffsetFromEntityInWorldCoords(vehicle, -1.2, -1.2, 0.0)
                        local found, gz = GetGroundZFor_3dCoord(near.x, near.y, near.z + 100.0, 0)
                        if found then near = vector3(near.x, near.y, gz) end
                        SetEntityCoords(npc, near.x, near.y, near.z)
                        TaskTurnPedToFaceEntity(npc, vehicle, 1000)
                    end
                end
            end
        end

        -- NPC volta para moto e vai embora
        TaskGoToEntity(npc, moto, -1, 2.0, 2.0, 1073741824, 0)
        Wait(5000)
        TaskEnterVehicle(npc, moto, -1, -1, 1.0, 1, 0)
        Wait(3000)
        TaskVehicleDriveWander(npc, moto, 20.0, 786603)

        SetTimeout(15000, function()
            DeleteEntity(npc)
            DeleteEntity(moto)
        end)

        SetTimeout(120000, function()
            emCooldown = false
            TriggerEvent("Notify", "importante", "Você pode usar o comando novamente.")
        end)
    else
        TriggerEvent("Notify", "negado", "Não há veículo perto de você para reparar.")
    end
end)

-- função auxiliar
function GetNearestVehicle(radius)
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local vehicles = GetGamePool('CVehicle')
    local closestVehicle = nil
    local closestDistance = radius + 0.01

    for _, v in pairs(vehicles) do
        local vehCoords = GetEntityCoords(v)
        local distance = #(coords - vehCoords)
        if distance < closestDistance then
            closestVehicle = v
            closestDistance = distance
        end
    end

    return closestVehicle
end

function FindTargetVehicle(exclude)
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped,false)
    if veh ~= 0 and veh ~= exclude then
        return veh
    end
    local near = GetNearestVehicle(10.0)
    if near and near ~= exclude then
        return near
    end
    near = GetNearestVehicle(20.0)
    if near and near ~= exclude then
        return near
    end
    return nil
end
