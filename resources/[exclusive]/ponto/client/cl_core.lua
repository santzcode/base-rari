-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Street = {}
Tunnel.bindInterface("ponto",Street)
vSERVER = Tunnel.getInterface("ponto")
-----------------------------------------------------------------------------------------------------------------------------------------
-- Ponto
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Ponto",function(data,cb)
	TriggerServerEvent("service:Punch")
	if cb then
		cb("ok")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- POLICIA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("service:Police") 
AddEventHandler("service:Police",function()
	TriggerServerEvent("service:Toggle","Police")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HOSPITAL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("service:Paramedic")
AddEventHandler("service:Paramedic",function()
	TriggerServerEvent("service:Toggle","Paramedic")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MECANICA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("service:Mechanic")
AddEventHandler("service:Mechanic",function()
	TriggerServerEvent("service:Toggle","Mechanic")
end)

RegisterNetEvent("service:Punch")
AddEventHandler("service:Punch",function()
	TriggerServerEvent("service:Punch")
end)

RegisterNetEvent("service:Bombeiro")
AddEventHandler("service:Bombeiro",function()
	TriggerServerEvent("service:Toggle","Bombeiro")
end)

RegisterNetEvent("service:PM")
AddEventHandler("service:PM",function()
	TriggerServerEvent("service:Toggle","PM")
end)

RegisterNetEvent("service:CHOQUE")
AddEventHandler("service:CHOQUE",function()
	TriggerServerEvent("service:Toggle","CHOQUE")
end)

RegisterNetEvent("service:TM")
AddEventHandler("service:TM",function()
	TriggerServerEvent("service:Toggle","TM")
end)

RegisterNetEvent("service:PC")
AddEventHandler("service:PC",function()
	TriggerServerEvent("service:Toggle","PC")
end)

RegisterNetEvent("service:BOPE")
AddEventHandler("service:BOPE",function()
	TriggerServerEvent("service:Toggle","BOPE")
end)

RegisterNetEvent("service:PF")
AddEventHandler("service:PF",function()
	TriggerServerEvent("service:Toggle","PF")
end)

RegisterNetEvent("service:PRF")
AddEventHandler("service:PRF",function()
	TriggerServerEvent("service:Toggle","PRF")
end)

RegisterNetEvent("service:ROTAM")
AddEventHandler("service:ROTAM",function()
	TriggerServerEvent("service:Toggle","ROTAM")
end)

RegisterNetEvent("service:BAEP")
AddEventHandler("service:BAEP",function()
	TriggerServerEvent("service:Toggle","BAEP")
end)

RegisterNetEvent("service:EB")
AddEventHandler("service:EB",function()
	TriggerServerEvent("service:Toggle","EB")
end)

RegisterNetEvent("service:Paramedico")
AddEventHandler("service:Paramedico",function()
	TriggerServerEvent("service:Toggle","Paramedico")
end)

RegisterNetEvent("service:WestCoast")
AddEventHandler("service:WestCoast",function()
	TriggerServerEvent("service:Toggle","WestCoast")
end)

RegisterNetEvent("service:StopCar")
AddEventHandler("service:StopCar",function()
	TriggerServerEvent("service:Toggle","StopCar")
end)

RegisterNetEvent("service:MinasBurguer")
AddEventHandler("service:MinasBurguer",function()
	TriggerServerEvent("service:Toggle","MinasBurguer")
end)

RegisterNetEvent("service:McDonalds")
AddEventHandler("service:McDonalds",function()
	TriggerServerEvent("service:Toggle","McDonalds")
end)
