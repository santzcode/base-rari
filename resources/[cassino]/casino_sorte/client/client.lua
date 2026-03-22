local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

local _wheel = nil
local _lambo = nil
local _isShowCar = false
local _wheelPos = vector3(1109.76, 227.89, -49.64)
local _baseWheelPos = vector3(1111.05, 229.81, -53.38)
local Keys = {
	["ESC"] = 322, ["BACKSPACE"] = 177, ["E"] = 38, ["ENTER"] = 18,	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173
}
local _isRolling = false


-- DrawText3D function ultra elegante e bonita
function DrawText3Ds(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    
    if onScreen then
        local camDistance = #(GetGameplayCamCoords() - vector3(x, y, z))
        local scale = (1 / camDistance) * 1.4
        local fov = (1 / GetGameplayCamFov()) * 100
        scale = math.min(scale * fov, 0.6)
        
        -- Sombra principal em preto
        SetTextScale(0.0, 0.5 * scale)
        SetTextFont(7)
        SetTextProportional(1)
        SetTextColour(0, 0, 0, 255)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x + 0.003, _y + 0.003)
        
        -- Brilho de contorno em branco
        SetTextScale(0.0, 0.5 * scale)
        SetTextFont(7)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x + 0.001, _y - 0.001)
        DrawText(_x - 0.001, _y + 0.001)
        DrawText(_x + 0.002, _y)
        DrawText(_x - 0.002, _y)
        
        -- Texto principal dourado
        SetTextScale(0.0, 0.5 * scale)
        SetTextFont(7)
        SetTextProportional(1)
        SetTextColour(255, 215, 0, 255)
        SetTextDropShadow(2, 0, 0, 0, 255)
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
        
        -- Efeito neon dourado
        SetTextScale(0.0, 0.52 * scale)
        SetTextFont(7)
        SetTextProportional(1)
        SetTextColour(255, 255, 150, 100)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end

Citizen.CreateThread(function()
        local model = GetHashKey('vw_prop_vw_luckywheel_02a')
        local baseWheelModel = GetHashKey('vw_prop_vw_luckywheel_01a')

        Citizen.CreateThread(function()
            -- Base wheel
            RequestModel(baseWheelModel)
            while not HasModelLoaded(baseWheelModel) do
                Citizen.Wait(0)
            end

            _basewheel = CreateObject(baseWheelModel, _baseWheelPos.x, _baseWheelPos.y, _baseWheelPos.z, false, false, true)
            SetEntityHeading(_basewheel, 0.0)
            SetModelAsNoLongerNeeded(baseWheelModel)

            -- Wheel
            RequestModel(model)

            while not HasModelLoaded(model) do
                Citizen.Wait(0)
            end
			_wheel = CreateObject(model, 1111.05, 229.81, -50.38, false, false, true)
            SetEntityHeading(_wheel, 0.0)
            SetModelAsNoLongerNeeded(model)
        end)
end)

RegisterNetEvent("casino_luckywheel:doRoll")
AddEventHandler("casino_luckywheel:doRoll", function(_priceIndex) 
    _isRolling = true
    SetEntityHeading(_wheel, -30.0)
    SetEntityRotation(_wheel, 0.0, 0.0, 0.0, 1, true)
    Citizen.CreateThread(function()
        local speedIntCnt = 1
        local rollspeed = 1.0
        local _priceIndex = math.random(1, 20)
        local _winAngle = (_priceIndex - 1) * 18
        local _rollAngle = _winAngle + (360 * 8)
        local _midLength = (_rollAngle / 2)
        local intCnt = 0
        while speedIntCnt > 0 do
            local retval = GetEntityRotation(_wheel, 1)
            if _rollAngle > _midLength then
                speedIntCnt = speedIntCnt + 1
            else
                speedIntCnt = speedIntCnt - 1
                if speedIntCnt < 0 then
                    speedIntCnt = 0
                    
                end
            end
            intCnt = intCnt + 1
            rollspeed = speedIntCnt / 10
            local _y = retval.y - rollspeed
            _rollAngle = _rollAngle - rollspeed
            SetEntityRotation(_wheel, 0.0, _y, 0.0, 1, true)
            Citizen.Wait(0)
        end
    end)
end)

RegisterNetEvent("casino_luckywheel:rollFinished")
AddEventHandler("casino_luckywheel:rollFinished", function() 
    _isRolling = false
end)

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

function doRoll()
    if not _isRolling then
        _isRolling = true
        local playerPed = PlayerPedId()
        loadAnimDict("anim_casino_a@amb@casino@games@lucky7wheel@male")
            local _movePos = vector3(1109.55, 228.88, -49.64)
            TaskGoStraightToCoord(playerPed,  _movePos.x,  _movePos.y,  _movePos.z,  1.0,  -1,  312.2,  0.0)
            local _isMoved = false
            while not _isMoved do
                local coords = GetEntityCoords(PlayerPedId())
                if coords.x >= (_movePos.x - 0.01) and coords.x <= (_movePos.x + 0.01) and coords.y >= (_movePos.y - 0.01) and coords.y <= (_movePos.y + 0.01) then
                    _isMoved = true
                end
                Citizen.Wait(0)
            end
            TaskPlayAnim(playerPed, 'anim_casino_a@amb@casino@games@lucky7wheel@male', anim, 8.0, -8.0, -1, 0, 0, false, false, false)
            while IsEntityPlayingAnim(playerPed, 'anim_casino_a@amb@casino@games@lucky7wheel@male', anim, 3) do
                    Citizen.Wait(0)
                    DisableAllControlActions(0)
            end
            TaskPlayAnim(playerPed, 'anim_casino_a@amb@casino@games@lucky7wheel@male', 'enter_to_armraisedidle', 8.0, -8.0, -1, 0, 0, false, false, false)
            while IsEntityPlayingAnim(playerPed, 'anim_casino_a@amb@casino@games@lucky7wheel@male', 'enter_to_armraisedidle', 3) do
                Citizen.Wait(0)
                DisableAllControlActions(0)
            end
            TriggerServerEvent("casino_luckywheel:getLucky")
            TaskPlayAnim(playerPed, 'anim_casino_a@amb@casino@games@lucky7wheel@male', 'armraisedidle_to_spinningidle_high', 8.0, -8.0, -1, 0, 0, false, false, false)
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local coords = GetEntityCoords(PlayerPedId())
        local distance = GetDistanceBetweenCoords(coords, _wheelPos.x, _wheelPos.y, _wheelPos.z, true)

        if distance < 5.0 then
            if not _isRolling then
                -- Draw 3D text ABOVE the wheel  
                DrawText3Ds(_wheelPos.x, _wheelPos.y, _wheelPos.z + 2.0, "🎰 ROLETA DA SORTE 🎰")
                
                -- Notificação visível quando próximo
                if distance < 2.5 then
                    -- Notificações múltiplas para garantir visibilidade
                    drawNativeNotification("APERTE E PARA RODAR A ROLETA DA SORTE")
                    
                    -- Feedback adicional na tela
                    SetTextScale(0.35, 0.35)
                    SetTextFont(4)
                    SetTextProportional(1)
                    SetTextColour(255, 255, 0, 255) -- Amarelo
                    SetTextEntry("STRING")
                    SetTextCentre(true)
                    AddTextComponentString("APERTE E PARA RODAR A ROLETA DA SORTE")
                    DrawText(0.5, 0.85)
                    
                    if IsControlJustReleased(0, Keys['E']) then
                        TriggerEvent("invarte")
                        Wait(500)
                        PlaySoundFrontend(-1, "Spin_Single_Ticks", "dlc_vw_casino_lucky_wheel_sounds", 1)
                    end
                end
            end
        else
            Citizen.Wait(500) -- Otimização quando longe
        end
    end
end)

RegisterNetEvent("invarte")
AddEventHandler("invarte", function()
    doRoll()
end)

function drawNativeNotification(text)
    SetTextComponentFormat('STRING')
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

print("")
print("^1Author : Hari (HARI  - DEVERLOPMENT-FIVEM)^0")
print("")