local Proxy = module("vrp", "lib/Proxy")
local vRP = Proxy.getInterface("vRP")

function IsPlayerAdmin(source)
  local Passport = vRP.Passport(source)
  if not Passport then return false end
  return vRP.HasGroup(Passport, Config.AdminPermission)
end

function CanAccessClockroom(source, permission)
  if not permission or permission == "" then return true end
  local Passport = vRP.Passport(source)
  if not Passport then return false end
  return vRP.HasGroup(Passport, permission)
end

function ApplyPreset(source, data)
  TriggerClientEvent("skinshop:Apply", source, data, true)
end