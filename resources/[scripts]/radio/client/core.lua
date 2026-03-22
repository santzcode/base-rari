-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vSERVER = Tunnel.getInterface("radio")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Frequency = 0
local Timer = GetGameTimer()
local lastTalker = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- RADIO:OPEN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("radio:Open")
AddEventHandler("radio:Open",function()
	if not LocalPlayer["state"]["Prison"] then
		SetNuiFocus(true,true)
		SetCursorLocation(0.9,0.9)
		SendNUIMessage({ action = "showMenu" })

		if not IsPedInAnyVehicle(PlayerPedId()) then
			vRP.CreateObjects("cellphone@","cellphone_text_in","prop_cs_hand_radio",50,28422)
		end
	end
end)
RegisterCommand("radio", function(source)
	local Passport = vRP.Passport(source)
	if not LocalPlayer["state"]["Prison"] then
		SetNuiFocus(true, true)
		SetCursorLocation(0.9, 0.9)
		SendNUIMessage({ action = "showMenu" })

		if not IsPedInAnyVehicle(PlayerPedId()) then
			vRP.CreateObjects("cellphone@", "cellphone_text_in", "prop_cs_hand_radio", 50, 28422)
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- RADIOCLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("RadioClose",function(Data,Callback)
	SetCursorLocation(0.5,0.5)
	SetNuiFocus(false,false)
	vRP.Destroy()
    SendNUIMessage({ action = "hideMenu" })

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RADIOACTIVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("RadioActive",function(Data,Callback)
	if MumbleIsConnected() and Frequency ~= Data["Frequency"] and vSERVER.Frequency(Data["Frequency"]) then
		if Frequency ~= 0 then
			exports["pma-voice"]:removePlayerFromRadio()
		end

		TriggerEvent("Notify","verde","Entrou na frequência <b>"..Data["Frequency"].."</b>.",5000)
		exports["pma-voice"]:setRadioChannel(Data["Frequency"])
		TriggerEvent("sounds:source","radioon",0.5)
		TriggerEvent("hud:Radio",Data["Frequency"])
		Frequency = Data["Frequency"]
	end

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RADIOINATIVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("RadioInactive",function(Data,Callback)
	TriggerEvent("radio:RadioClean")

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RADIO:RADIOCLEAN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("radio:RadioClean")
AddEventHandler("radio:RadioClean",function()
	if Frequency ~= 0 then
		TriggerEvent("sounds:source","radiooff",1.0)
		exports["pma-voice"]:removePlayerFromRadio()
		TriggerEvent("hud:Radio","Offline")
		TriggerEvent("Notify","vermelho","Você saiu da Radio",5000)
		Frequency = 0
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADRADIOEXIST
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		if GetGameTimer() >= Timer and Frequency ~= 0 then
			Timer = GetGameTimer() + 60000

			local Ped = PlayerPedId()
			if LocalPlayer["state"]["Prison"] or vSERVER.CheckRadio() or IsPedSwimming(Ped) then
				TriggerEvent("radio:RadioClean")
			end
		end

		Wait(10000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TALK INDICATOR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("pma-voice:setTalkingOnRadio")
AddEventHandler("pma-voice:setTalkingOnRadio",function(plySource,enabled)
	if enabled then
		lastTalker = plySource
		local Info = vSERVER.Identity(plySource)
		if Info then
			local fullname = Info.name
			if Info.name2 and Info.name2 ~= "" then
				fullname = fullname .. " " .. Info.name2
			end
			SendNUIMessage({ action = "showTalk", id = Info.id, cargo = Info.cargo, name = fullname })
		end
	else
		if lastTalker == plySource then
			SendNUIMessage({ action = "hideTalk" })
			lastTalker = 0
		end
	end
end)
RegisterNetEvent("pma-voice:radioActive")
AddEventHandler("pma-voice:radioActive",function(status)
	if status then
		local me = GetPlayerServerId(PlayerId())
		lastTalker = me
		local Info = vSERVER.Identity(me)
		if Info then
			local fullname = Info.name
			if Info.name2 and Info.name2 ~= "" then
				fullname = fullname .. " " .. Info.name2
			end
			SendNUIMessage({ action = "showTalk", id = Info.id, cargo = Info.cargo, name = fullname })
		end
	else
		if lastTalker == GetPlayerServerId(PlayerId()) then
			SendNUIMessage({ action = "hideTalk" })
			lastTalker = 0
		end
	end
end)
