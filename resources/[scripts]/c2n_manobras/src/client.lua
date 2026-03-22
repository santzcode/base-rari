local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vSERVER = Tunnel.getInterface("c2n_manobras")

--[ VARIAVEIS ]-----------------------------------------------------------------
local comecar = false

--[ THREADS ]-------------------------------------------------------------------
AddEventHandler("playerSpawned", function()
    if cfg.keyMapSuggest.suggestion['active'] then
        TriggerEvent("chat:addSuggestion",cfg.keyMapSuggest.suggestion['title'],cfg.keyMapSuggest.suggestion['details'])
    end
end)

if cfg.keyMapSuggest.suggestion['active'] then
	TriggerEvent("chat:addSuggestion",cfg.keyMapSuggest.suggestion['title'],cfg.keyMapSuggest.suggestion['details'])
end

Citizen.CreateThread(function()
	while true do
		local idle = 1000
		local ped = PlayerPedId()
		local bike = GetVehiclePedIsIn(ped)
		local speed = GetEntitySpeed(bike)*3.6
		local dict = cfg.dict
		local anims = cfg.anims
		if comecar == true then
			if IsPedOnAnyBike(ped) then
				if speed >= 5 then
					idle = 5
					while not HasAnimDictLoaded(dict) do 
						Wait(0)
						RequestAnimDict(dict)
					end

					if IsControlJustPressed(0,174) or IsControlJustPressed(0,108) then -- Seta Esquerda ou NumPad 4 = Manobra esquerda
						TaskPlayAnim(ped,dict,anims[1], 8.0, -8.0, -1, 32, 0, false, false, false)
						Wait(1000)
					elseif IsControlJustPressed(0,175) or IsControlJustPressed(0,107) then -- Seta Direita ou NumPad 6 = Manobra direita
						TaskPlayAnim(ped,dict,anims[2], 8.0, -8.0, -1, 32, 0, false, false, false)
						Wait(1000)
					elseif IsControlJustPressed(0,173) or IsControlJustPressed(0,110) then -- Seta para Baixo ou NumPad 5 = Manobra lados
						TaskPlayAnim(ped,dict,anims[3], 8.0, -8.0, -1, 32, 0, false, false, false)
						Wait(1000)
					elseif IsControlJustPressed(0,27) or IsControlJustPressed(0,111) then -- Seta para Cima ou NumPad 8 = Manobra cima
						TaskPlayAnim(ped,dict,anims[4], 8.0, -8.0, -1, 32, 0, false, false, false)
						Wait(1000)
					end
				end
			else
				comecar = false
				TriggerEvent("Notify","importante","Você saiu da motocicleta")
			end
		end
		Citizen.Wait(idle)
	end
end)

--[ COMANDOS ]-------------------------------------------------------------------
RegisterCommand(cfg.keyMapSuggest['command'],function(raw,args)
	local ped = PlayerPedId()
	if comecar == false then
		if IsPedOnAnyBike(ped) then
			if cfg.checkVip['active'] then
				if vSERVER.checkPermVip(cfg.checkVip['perms']) then
					comecar = true
					TriggerEvent("Notify","sucesso","Você está preparado para fazer as manobras")
				else
					TriggerEvent("Notify","negado","Você não tem permissão")
					return false
				end
			else
				comecar = true
				TriggerEvent("Notify","sucesso","Você está preparado para fazer as manobras")
			end
		else
			TriggerEvent("Notify","negado","Você não está em uma motocicleta")
			return false
		end
	else
		comecar = false
		TriggerEvent("Notify","importante","Você parou de fazer manobras")
	end
end)