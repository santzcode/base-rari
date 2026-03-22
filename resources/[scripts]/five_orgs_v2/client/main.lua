----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TUNNELS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function RegisterTunnel.OpenPainel(data)
    SetNuiFocus(true, true)
    SendNUIMessage({ action = 'open' })
    CarregarObjeto("amb@code_human_in_bus_passenger_idles@female@tablet@idle_a", "idle_b", "prop_cs_tablet", 49, 60309)
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- EVENTS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('updateWarnings', function(warnings)
    SendNUIMessage({ action = 'UpdateWarnings', data = warnings })
end)

RegisterNetEvent('updateChatMessage', function(data)
    SendNUIMessage({ action = 'Create:Message', data = data })
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CALLBACKS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterNuiCallback('GetPainelInfos', function(data, cb)
    cb(vTunnel.getFaction())
end)

RegisterNuiCallback('NewWarn', function(data, cb)
    cb(vTunnel.addWarn(data.message))
end)

RegisterNuiCallback('GetMessages', function(data, cb) -- Requisita todas as mensagens
    cb(vTunnel.getChatMessages())
end)

RegisterNuiCallback('New:Message', function(data, cb) -- Recebe a mensagem digitada pelo usuário
    cb(vTunnel.sendMessage(data.message))
end)

RegisterNuiCallback('GetCDS', function(data, cb)
    local coords = GetEntityCoords(PlayerPedId())
    cb(coords.x..','..coords.y)
end)

RegisterNUICallback('MarkLocal', function(data, cb)
    -- Obter coordenadas atuais do jogador
    local coords = GetEntityCoords(PlayerPedId())
    local x, y, z = coords.x, coords.y, coords.z
    
    -- Debug: imprimir coordenadas no console
    
    -- Tentar marcar no mapa de diferentes formas
    local success = false
    
    -- Método 1: SetNewWaypoint
    success = SetNewWaypoint(x, y)
    
    -- Método 2: Alternativa usando SetWaypointOff
    if not success then
        SetWaypointOff()
        Wait(100)
        success = SetNewWaypoint(x, y)
    end
    
    -- Método 3: Usar coordenadas de blip
    if not success then
        local blip = AddBlipForCoord(x, y, z)
        if blip and DoesBlipExist(blip) then
            SetBlipSprite(blip, 1)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, 0.8)
            SetBlipColour(blip, 3)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Localização Marcada")
            EndTextCommandSetBlipName(blip)
            success = true
        end
    end
    
    -- Notificar o jogador
    if success then
        TriggerEvent("Notify", "verde", "Localização marcada no mapa! Coordenadas: " .. math.floor(x) .. ", " .. math.floor(y), 5000)
    else
        TriggerEvent("Notify", "vermelho", "Erro ao marcar localização no mapa!", 3000)
    end
    
    cb(true)
end)

RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false, false)

    vTunnel._close()
    DeletarObjeto()
    cb(true)
end)

-- Evento para fechar o painel e deletar props
RegisterNetEvent('five_orgs_v2:closePanel')
AddEventHandler('five_orgs_v2:closePanel', function()
    SetNuiFocus(false, false)
    SendNUIMessage({ action = 'close' })
    DeletarObjeto()
end)

-- Timer para deletar props periodicamente (segurança)
CreateThread(function()
    while true do
        Wait(30000) -- Verificar a cada 30 segundos
        if not IsNuiFocused() and object then
            -- Se o NUI não está focado e há um objeto, deletar
            DeletarObjeto()
        end
    end
end)

-- Deletar props quando o jogador sai do jogo
AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        DeletarObjeto()
    end
end)

-- Deletar props quando o jogador desconecta
AddEventHandler('playerDropped', function()
    DeletarObjeto()
end)

-- Sistema de target para baús
local chestTargets = {}

-- Função para criar target de baú
function CreateChestTarget(coords, organization, label)
    local targetId = "chest_" .. organization
    chestTargets[targetId] = {
        coords = coords,
        organization = organization,
        label = label or "Baú da Organização"
    }
    
    exports["target"]:AddCircleZone(targetId, coords, 1.5, {
        name = targetId,
        heading = 0.0
    }, {
        Distance = 2.0,
        options = {
            {
                event = "five_orgs_v2:openChest",
                icon = "fas fa-box",
                label = label or "Abrir Baú",
                organization = organization
            }
        }
    })
    
end

-- Evento para abrir baú por target
RegisterNetEvent("five_orgs_v2:openChest")
AddEventHandler("five_orgs_v2:openChest", function(data)
    -- Enviar mensagem para a interface NUI mostrar "Em construção"
    SendNUIMessage({ 
        action = 'ShowChestMessage', 
        data = { 
            message = "Em breve, ainda em construção",
            type = "construction"
        } 
    })
end)

-- Exportar função para criar targets
exports('CreateChestTarget', CreateChestTarget)

-- Evento para criar target de baú
RegisterNetEvent("five_orgs_v2:createChestTarget")
AddEventHandler("five_orgs_v2:createChestTarget", function(coords, organization, label)
    CreateChestTarget(coords, organization, label)
end)

-- Evento para listar targets de baú
RegisterNetEvent("five_orgs_v2:listChestTargets")
AddEventHandler("five_orgs_v2:listChestTargets", function()
    local count = 0
    for targetId, target in pairs(chestTargets) do
        count = count + 1
    end
    
    if count == 0 then
    end
end)

-- Evento para reabrir o painel das organizações quando o baú for fechado
RegisterNetEvent("chest:Close")
AddEventHandler("chest:Close", function()
    -- Aguardar um pouco para o baú fechar completamente
    Wait(500)
    
    -- Reabrir o painel das organizações
    SetNuiFocus(true, true)
    SendNUIMessage({ action = 'open' })
    CarregarObjeto("amb@code_human_in_bus_passenger_idles@female@tablet@idle_a", "idle_b", "prop_cs_tablet", 49, 60309)
    
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- OTHERS FUNCTIONS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local object
function CarregarAnim(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(10)
    end
end

function CarregarObjeto(dict,anim,prop,flag,mao,altura,pos1,pos2,pos3)
    local ped = PlayerPedId()

    RequestModel(GetHashKey(prop))
    while not HasModelLoaded(GetHashKey(prop)) do
        Citizen.Wait(10)
    end

    if altura then
        local coords = GetOffsetFromEntityInWorldCoords(ped,0.0,0.0,-5.0)
        object = CreateObject(GetHashKey(prop),coords.x,coords.y,coords.z,true,true,true)
        SetEntityCollision(object,false,false)

        AttachEntityToEntity(object,ped,GetPedBoneIndex(ped,mao),altura,pos1,pos2,pos3,260.0,60.0,true,true,false,true,1,true)
    else
        CarregarAnim(dict)
        TaskPlayAnim(ped,dict,anim,3.0,3.0,-1,flag,0,0,0,0)
        local coords = GetOffsetFromEntityInWorldCoords(ped,0.0,0.0,-5.0)
        object = CreateObject(GetHashKey(prop),coords.x,coords.y,coords.z,true,true,true)
        SetEntityCollision(object,false,false)
        AttachEntityToEntity(object,ped,GetPedBoneIndex(ped,mao),0.0,0.0,0.0,0.0,0.0,0.0,false,false,false,false,2,true)
    end
    SetEntityAsMissionEntity(object,true,true)
end

function DeletarObjeto()
    ClearPedTasks(PlayerPedId())
    if DoesEntityExist(object) then
        DetachEntity(object,false,false)
        TriggerServerEvent("trydeleteobj",ObjToNet(object))
        DeleteEntity(object)
        object = nil
    end
end