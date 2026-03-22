local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

src = {}
Tunnel.bindInterface("c2n_manobras",src)

--[ PERMISSÃO ]-------------------------------------------------------------------
function src.checkPermVip(perm)
    local source = source
	local user_id = vRP.Passport(source)
    for _,v in pairs(perm) do
		if vRP.HasPermission(user_id,v) or vRP.HasGroup(user_id,v) then
			return true
		end
	end
	return false
end
