function startFireworksForAll(coords)
    print("StartFireworksForAll: ", coords)
    local specificCoords = coords

    local fireworkObject = GetHashKey("rojao_simples")
    RequestModel(fireworkObject)
    while not HasModelLoaded(fireworkObject) do
        Wait(1)
    end
    local fireworkProp = CreateObject(fireworkObject, coords.x, coords.y, coords.z, true, true, false)

    local playerPed = PlayerPedId()
    AttachEntityToEntity(
        fireworkProp,
        playerPed,
        GetPedBoneIndex(playerPed, 57005), 0.1, 0.1, 0.0, 190.0, 0.0, 0.0,
        true, true, false, true, 1, true
    )

    RequestAnimDict("missmic4premiere")
    while not HasAnimDictLoaded("missmic4premiere") do
        Wait(1)
    end

    local duration = 5000

    TaskPlayAnim(
        playerPed,
        "missmic4premiere",
        "interview_short_lazlow",
        8.0, -8.0, duration, 50, 0, false, false, false
    )
    Citizen.Wait(1000)

    RequestNamedPtfxAsset("proj_xmas_firework")
    while not HasNamedPtfxAssetLoaded("proj_xmas_firework") do
        Wait(1)
    end

    SendNUIMessage({
        transactionType = 'playSound',
        transactionFile = 'fireworks.mp3',
        volume = 1
    })

    local startTime = GetGameTimer()
    while GetGameTimer() - startTime < duration do
        UseParticleFxAssetNextCall("proj_xmas_firework")
        StartParticleFxLoopedAtCoord(
            "scr_firework_xmas_burst_rgw",
            specificCoords.x + 0,       -- Coordenada X
            specificCoords.y,             -- Coordenada Y
            specificCoords.z + 40,         -- Coordenada Z
            0.0,                          -- Rotação no eixo X
            0.0,                          -- Rotação no eixo Y
            0.0,                          -- Rotação no eixo Z
            2.0,                          -- Escala
            false,                        -- Permitir rotação no eixo X
            false,                        -- Permitir rotação no eixo Y
            false                         -- Permitir rotação no eixo Z
        );

        Citizen.Wait(1000)
    end

    TriggerEvent("Notify", "verde", "Rojao lançados.", 7000)

    DeleteObject(fireworkProp)
    ClearPedTasks(playerPed)
    SetModelAsNoLongerNeeded(fireworkObject)
    RemoveNamedPtfxAsset("proj_xmas_firework")
end

RegisterNetEvent('startFireworks')
AddEventHandler('startFireworks', function(coords)
    print("startFireworks: ", coords)
    startFireworksForAll(coords)
end)

RegisterNetEvent('playFireworksSound')
AddEventHandler('playFireworksSound', function(coords, volume)
    print("Coords do player que usou: ", coords)
    local specificCoords = coords

    RequestNamedPtfxAsset("proj_xmas_firework")
    while not HasNamedPtfxAssetLoaded("proj_xmas_firework") do
        Wait(1)
    end

    local duration = 5000

    SendNUIMessage({
        transactionType = 'playSound',
        transactionFile = 'fireworks.mp3',
        volume = volume
    })

    local startTime = GetGameTimer()
    while GetGameTimer() - startTime < duration do
        UseParticleFxAssetNextCall("proj_xmas_firework")
        StartParticleFxLoopedAtCoord(
            "scr_firework_xmas_burst_rgw",
            specificCoords.x + 0,       -- Coordenada X
            specificCoords.y,             -- Coordenada Y
            specificCoords.z + 40,         -- Coordenada Z
            0.0,                          -- Rotação no eixo X
            0.0,                          -- Rotação no eixo Y
            0.0,                          -- Rotação no eixo Z
            2.0,                          -- Escala
            false,                        -- Permitir rotação no eixo X
            false,                        -- Permitir rotação no eixo Y
            false                         -- Permitir rotação no eixo Z
        );

        Citizen.Wait(1000)
    end

    Citizen.Wait(3000)
    RemoveNamedPtfxAsset("proj_xmas_firework")
end)