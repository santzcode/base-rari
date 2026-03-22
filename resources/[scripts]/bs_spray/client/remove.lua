RegisterNetEvent('bs_spray:removeClosestSpray')
AddEventHandler('bs_spray:removeClosestSpray', function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)

    local closestSprayLoc = nil
    local closestSprayDist = nil

    local dist = 'timetable@maid@cleaning_window@idle_a'
    local name = 'idle_a'

    for _, spray in pairs(SPRAYS) do
        local sprayPos = spray.location
        local dist = #(sprayPos - coords)

        if dist < 3.0 and (not closestSprayDist or closestSprayDist > dist) then
            closestSprayLoc = sprayPos
            closestSprayDist = dist
        end
    end

    if closestSprayLoc then
        local ragProp = CreateSprayRemoveProp(ped)

        CancellableProgress(
            Config.DURACAO_REMOCAO_SPRAY, 
            dist, 
            name, 
            1,
            function()
                RemoveSprayRemoveProp(ragProp)
                TriggerServerEvent('bs_spray:remove', closestSprayLoc)
                TriggerEvent("Notify",source,"vermelho","Removendo pixação",5000)
            end, 
            function()
                RemoveSprayRemoveProp(ragProp)
            end
        )
    else
        TriggerEvent("Notify","importante","Não há grafite proximo para ser removido",8000)
    end
end)

function CreateSprayRemoveProp(ped)
    local ragProp = CreateObject(
        `p_loose_rag_01_s`,
        0.0, 0.0, 0.0,
        true, false, false
    )

    AttachEntityToEntity(ragProp, ped, GetPedBoneIndex(ped, 28422), x, y, z, ax, ay, az, true, true, false, true, 1, true)

    return ragProp
end

function RemoveSprayRemoveProp(ent)
    if NetworkGetEntityOwner(ent) ~= PlayerId() then
    end
    DeleteEntity(ent)
end