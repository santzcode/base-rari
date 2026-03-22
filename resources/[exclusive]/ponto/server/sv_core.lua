-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
Tunnel = module("vrp","lib/Tunnel")
Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Street = {}
Tunnel.bindInterface("ponto",Street)
Proxy.addInterface("ponto",Street)

vCLIENT = Tunnel.getInterface("ponto")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONFIG USER
-----------------------------------------------------------------------------------------------------------------------------------------
local nomeApp = shared.nomeApp
local imagemApp = shared.imagemApp
-----------------------------------------------------------------------------------------------------------------------------------------
-- VERIFICAÇAO DO SHARED.LUA
-----------------------------------------------------------------------------------------------------------------------------------------
local function isStringEmpty(str)
	return str == nil or str:match("^%s*$") ~= nil
end

if imagemApp == nil or isStringEmpty(imagemApp) then
	imagemApp = "https://i.imgur.com/kMnNPj0.png"
	print("Você não colocou um link para imagem do app, a imagem padrão foi setada!")
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SERVICE:TOGGLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("service:EnterPol")
AddEventHandler("service:EnterPol",function(Service)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport, "Police") then
			TriggerClientEvent("service:Police",source)
		end
	end
end)
RegisterServerEvent("service:EnterHosp")
AddEventHandler("service:EnterHosp",function(Service)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport, "Paramedic") then
			TriggerClientEvent("service:Paramedic",source)
		end
	end
end)
RegisterServerEvent("service:EnterMec")
AddEventHandler("service:EnterMec",function(Service)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport, "Mechanic") then
			TriggerClientEvent("service:Mechanic",source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SERVICE:TOGGLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("service:Toggle")
AddEventHandler("service:Toggle",function(Service)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		vRP.ServiceToggle(source,Passport,Service,false)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SERVICE:PUNCH ANYWHERE
-----------------------------------------------------------------------------------------------------------------------------------------
local AVAILABLE_SERVICES = {
    "Hospital",
    "Pcesp",
    "Pmesp",
    "1BPChq",
    "2BPChq",
    "3BPChq",
    "4BPChq",
    "Baep",
    "Prf",
    -- "AutoSport",
    "Redline",
    "EastCustoms",
    "McDonalds"
}

RegisterServerEvent("service:Punch")
AddEventHandler("service:Punch",function()
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        local toggled = false
        for _, Service in ipairs(AVAILABLE_SERVICES) do
            if vRP.HasGroup(Passport, Service) then
                vRP.ServiceToggle(source, Passport, Service, false)
                toggled = true
                break
            end
        end
        if not toggled then
            TriggerClientEvent("Notify",source,"amarelo","Você não possui nenhum emprego de serviço para bater ponto.",5000)
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CREATE APP SMARTPHONE
-----------------------------------------------------------------------------------------------------------------------------------------
local function registerSmartphoneApp()
	if GetResourceState('smartphone') == 'started' then
		exports.smartphone:createApp('ponto',nomeApp,imagemApp,'nui://ponto/web-side/index.html#')
	end
end
registerSmartphoneApp()
AddEventHandler('onResourceStart',function(resourceName)
	if resourceName == 'smartphone' then
		registerSmartphoneApp()
	end
end)

AddEventHandler('smartphone:isReady',function()
	registerSmartphoneApp()
end)
