-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPC = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Creative = {}
vCLIENT = Tunnel.getInterface("inspect")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local openPlayer = {}
local openSource = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- POLICE:RUNINSPECT
-----------------------------------------------------------------------------------------------------------------------------------------
function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

local WEBHOOK_INSPECT = 'https://discord.com/api/webhooks/'



RegisterServerEvent("police:runInspect")
AddEventHandler("police:runInspect",function(Entity,Service)
	local source = source
	local Passport = vRP.Passport(source)
	local canRevist = vRP.HasGroup(Passport, 'Police') or vRP.GetHealth(Entity[1]) <= 100 or Service == "handsup" or vRP.Request(Entity[1], 'Deseja aceitar a revista?', 'sim', 'nao')

	
	if Passport and vRP.GetHealth(source) > 100 and canRevist then
		openSource[Passport] = Entity[1]
		openPlayer[Passport] = vRP.Passport(Entity[1])

		vCLIENT.Attach(source, Entity[1], true)

		vRPC.playAnim(source, false, {"cpdrevistandopolicial@animations","gndrevistandopolicial_clip"}, false)
		vRPC.playAnim(Entity[1], false, {"cpdanimacaomaonacabeca@animations","gndanimacaomaonacabeca_clip"}, true)

		Wait(8500)

		TriggerClientEvent("player:Commands",Entity[1],true)
		TriggerClientEvent("inventory:Close",Entity[1])

		Wait(8500)

		vRPC.stopAnim(source)
		vRPC.stopAnim(Entity[1])
		vCLIENT.Attach(source,Entity[1],false)

		TriggerClientEvent("revistar:StartInspect",source,Entity[1])

		
		local identity = vRP.Identity(Passport)
		local otherIdentity = vRP.Identity(openPlayer[Passport])
		if otherIdentity then
			SendWebhookMessage(
				WEBHOOK_INSPECT,
				"```prolog\n[ID]: "..Passport.." "..identity.name.." "..identity.name2..
				"\n[INICIOU REVISTA EM]: " .. openPlayer[Passport] .. " " .. otherIdentity.name .. " " .. otherIdentity.name2 ..
				os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```"
			)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESETINSPECT
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.resetInspect()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if openSource[Passport] then
			TriggerClientEvent("player:Commands",openSource[Passport],false)
			TriggerClientEvent("player:playerCarry",openSource[Passport],source)
			openSource[Passport] = nil
		end
		if openPlayer[Passport] then
			openPlayer[Passport] = nil
		end
	end
end
