local LookoutNPCs = {}
local FireCooldowns = {}

CreateThread(function()

    for k,v in pairs(Config.Lookouts) do

        RequestModel(v.model)
        while not HasModelLoaded(v.model) do
            Wait(10)
        end

        local ped = CreatePed(
            4,
            v.model,
            v.coords.x,
            v.coords.y,
            v.coords.z - 1.0,
            v.heading,
            false,
            true
        )

        SetEntityInvincible(ped,true)
        FreezeEntityPosition(ped,true)
        SetBlockingOfNonTemporaryEvents(ped,true)

        LookoutNPCs[k] = ped
        FireCooldowns[k] = 0

    end

end)


CreateThread(function()

    while true do

        Wait(1500)

        local playerPed = PlayerPedId()

        if IsPedInAnyVehicle(playerPed,false) then

            local vehicle = GetVehiclePedIsUsing(playerPed)

            local modelName = GetDisplayNameFromVehicleModel(
                GetEntityModel(vehicle)
            ):lower()

            if Config.PoliceVehicles[modelName]
            or GetVehicleClass(vehicle) == 18 then

                local vehCoords = GetEntityCoords(vehicle)

                for k,npc in pairs(LookoutNPCs) do

                    local data = Config.Lookouts[k]

                    if #(vehCoords - data.coords) <= data.radius then

                        if GetGameTimer() >= FireCooldowns[k] then

                            FireCooldowns[k] =
                                GetGameTimer() + Config.FireworkCooldown

                            ShootFireworks(data.coords,npc)

                        end

                    end

                end

            end

        end

    end

end)


function ShootFireworks(coords,npc)

    TaskTurnPedToFaceCoord(
        npc,
        coords.x,
        coords.y,
        coords.z,
        1000
    )

    Wait(800)

    RequestAnimDict("anim@mp_fireworks")
    while not HasAnimDictLoaded("anim@mp_fireworks") do
        Wait(10)
    end

    TaskPlayAnim(
        npc,
        "anim@mp_fireworks",
        "place_firework_3_box",
        8.0,
        -8.0,
        2500,
        49,
        0,
        false,
        false,
        false
    )

    Wait(1200)

    ShootRocket(coords)

    Wait(900)

    ShootRocket(coords)

end

function ShootRocket(coords)

    UseParticleFxAssetNextCall("scr_indep_fireworks")

    StartParticleFxNonLoopedAtCoord(
        "scr_indep_firework_starburst",
        coords.x,
        coords.y,
        coords.z + 1.5,
        0.0,
        0.0,
        0.0,
        2.5,
        false,
        false,
        false
    )

end