vRP = module("vrp", "lib/Proxy").getInterface("vRP")
vRPclient = module("vrp", "lib/Tunnel").getInterface("vRP")
src = {}
module("vrp", "lib/Tunnel").bindInterface("skips_admin", src)


vGARAGE = module("vrp", "lib/Tunnel").getInterface("garages")
vTYLER = module("vrp", "lib/Tunnel").getInterface("skips_admin")

vRP.Prepare("aurora/admin_log", [[
  CREATE TABLE IF NOT EXISTS au_admin_log(
    id INTEGER AUTO_INCREMENT,
    user_id INTEGER,
    user_name VARCHAR(255),
    action VARCHAR(70),
    hour VARCHAR(255),
    data VARCHAR(255),
    CONSTRAINT pk_banco PRIMARY KEY(id)
  )
]])
async(function()
  vRP.Query("aurora/admin_log")
end)
vRP.Prepare("aurora/insert_log", "INSERT INTO au_admin_log(user_id, user_name, action, hour, data) VALUES(@user_id, @user_name, @action, @hour, DATE_FORMAT(CURDATE(), '%d/%m/%Y'))")
vRP.Prepare("aurora/rem_log", "DELETE FROM au_admin_log WHERE id = @id")
vRP.Prepare("aurora/rem_all_logs", "DELETE FROM au_admin_log")
vRP.Prepare("aurora/get_logs", "SELECT * FROM au_admin_log ORDER BY id DESC")
vRP.Prepare("aurora/get_user_money", "SELECT * FROM characters")
vRP.Prepare("aurora/get_users", "SELECT * FROM accounts")
vRP.Prepare("aurora/get_user_identity", "SELECT * FROM characters WHERE id = @user_id")
function src.GetUserMoney()
  va = {}
  local Result = vRP.Query("aurora/get_user_money")
  for Index,Value in pairs(Result) do
    local wallet = 0
    local Inventory = vRP.UserData(Value.id,"Datatable")["Inventory"]
    if Inventory then
      for k,v in pairs(Inventory) do
        if v["item"] then
          local split = splitString(v["item"], "-")
          if split and split[1] == "dollars" then
            wallet = wallet + v["amount"]
          end
        end
      end
    end
    table.insert(va, {
      u_id = Value.id,
      wallet = formatarNumero(wallet),
      bank = formatarNumero(Value.bank),
      total = formatarNumero(wallet + Value.bank)
    })
  end
  return va
end
-- Função para formatar um número em milhões, bilhões ou trilhões
-- Função para formatar um número em milhões, bilhões ou trilhões com no máximo dois dígitos após o ponto decimal
function formatarNumero(numero)
  if numero >= 1000000000000 then
      local trilhoes = math.floor(numero / 1000000000000)
      local resto = numero % 1000000000000
      local trilhoesFormatados = tostring(trilhoes)
      if resto > 0 then
          local bilhoes = math.floor(resto / 1000000000)
          local milhoes = math.floor((resto % 1000000000) / 1000000)
          local decimais = math.floor((resto % 1000000) / 10000) % 100 -- Limitando a dois dígitos após o ponto decimal
          trilhoesFormatados = trilhoesFormatados .. "." .. string.format("%02d", decimais)
      end
      return trilhoesFormatados .. " tri"
  elseif numero >= 1000000000 then
      local bilhoes = math.floor(numero / 1000000000)
      local resto = numero % 1000000000
      local bilhoesFormatados = tostring(bilhoes)
      if resto > 0 then
          local milhoes = math.floor(resto / 1000000)
          local decimais = math.floor((resto % 1000000) / 10000) % 100 -- Limitando a dois dígitos após o ponto decimal
          bilhoesFormatados = bilhoesFormatados .. "." .. string.format("%02d", milhoes)
      end
      return bilhoesFormatados .. " bi"
  elseif numero >= 1000000 then
      local milhoes = math.floor(numero / 1000000)
      local resto = numero % 1000000
      local milhoesFormatados = tostring(milhoes)
      if resto > 0 then
          local decimais = math.floor(resto / 10000) % 100 -- Limitando a dois dígitos após o ponto decimal
          milhoesFormatados = milhoesFormatados .. "." .. string.format("%02d", decimais)
      end
      return milhoesFormatados .. " mi"
    elseif numero >= 1000 then
      local milhares = math.floor(numero / 1000)
      local resto = numero % 1000
      local milharesFormatados = tostring(milhares)
      if resto > 0 then
        local milhares = math.floor(numero / 1000)
        return tostring(milhares) .. " mil"
      end
      return milharesFormatados .. " mil"
  else
      return tostring(numero)
  end
end

-- Teste
local numero = 1200043000000
print("Número antes do ajuste:", numero)
numero = formatarNumero(numero)
print("Número depois do ajuste:", numero)



-- Teste
local numero = 1200000000000
print("Número antes do ajuste:", numero)
numero = formatarNumero(numero)
print("Número depois do ajuste:", numero)


function src.GetPanelLogs()
  va = {}
  for fe = 1, #vRP.Query("aurora/get_logs") do
    table.insert(va, {
      log_id = vRP.Query("aurora/get_logs")[fe].id,
      u_id = vRP.Query("aurora/get_logs")[fe].user_id,
      u_name = vRP.Query("aurora/get_logs")[fe].user_name,
      log = vRP.Query("aurora/get_logs")[fe].action,
      data = vRP.Query("aurora/get_logs")[fe].data,
      hour = vRP.Query("aurora/get_logs")[fe].hour
    })
  end
  return va
end
function src.GetWhitelisted()
  va = {}
  va2 = {}
  local Result = vRP.Query("aurora/get_users")
  for Index,Value in pairs(Result) do
    if Value.whitelist then
      table.insert(va, {
        u_id = Value.id,
        wlstate = "Sim"
      })
    else
      table.insert(va2, {
        u_id = Value.id,
        wlstate = "N\195\163o"
      })
    end
  end
  return va,va2
end
function src.GetItemList()
  va = {}
  for fe, fg in pairs(ItemGlobal()) do
    table.insert(va, {
      k = fe,
      name = fg.Name,
      image = fg.Index,
      item_directory = config.ItemDirectory
    })
  end
  return va
end
function src.GetVehiclesList()
  va = {}
  for fg, fh in pairs(VehicleGlobal()) do
    table.insert(va, {
      k = fg,
      name = fh.name,
      tipo = fh.tipo,
      vehicle_directory = config.VehicleDirectory
    })
  end
  return va
end
function src.GetGroups()
  va = {}
  for fg, fh in pairs(Groups) do
    if fh.Type then
      for i = 1, #fh.Hierarchy do
        table.insert(va, {
          k = fg,
          rank = i,
          name = fh.Hierarchy[i],
        })
      end
    end
  end
  return va
end

function src.VerifyPerm(Action)
    local source = source
    local Passport = vRP.Passport(source)
    local Permission = config.globalPerm

    -- Map actions to config permissions
    local Mapping = {
        ["spawn_veh"] = config.perm_QuickActions_SpawnVeh,
        ["kill"] = config.perm_QuickActions_Kill,
        ["kill_all"] = config.perm_QuickActions_KillAll,
        ["revive"] = config.perm_QuickActions_Revive,
        ["revive_all"] = config.perm_QuickActions_ReviveAll,
        ["upgrade_veh"] = config.perm_QuickActions_UpgradeVeh,
        ["wl_manage"] = config.perm_QuickActions_WLManage,
        ["ban_manage"] = config.perm_QuickActions_BanManage,
        ["kick_all"] = config.perm_QuickActions_KickAll,
        ["kick_id"] = config.perm_QuickActions_KickID,
        ["manage_groups"] = config.perm_GroupManagement,
        ["manage_items"] = config.perm_ItemManagement,
        ["manage_vehicles"] = config.perm_VehicleManagement,
        ["players"] = config.perm_PlayerManagement,
        ["notify_players"] = config.perm_NotifyPlayers,
        ["get_coords"] = config.perm_GetCoordinates,
        ["teleport"] = config.perm_TeleportPlayer,
        ["weapons"] = config.perm_WeaponManagement,
        ["money"] = config.perm_MoneyManagement,
        ["logs"] = config.perm_SeeLogs,
        ["edit_logs"] = config.perm_EditLogs
    }

    local Required = Mapping[Action]
    if Required then
        for _, Group in pairs(Required) do
            if vRP.HasGroup(Passport, Group[1]) then
                return true
            end
        end
    end
    
    -- Fallback to global admin check if specific check fails or not defined (safety net)
    if vRP.HasGroup(Passport, Permission) then
        return true
    end

    return false
end
function src.getWeapons(a)
  va = {}
  for fh, fj in pairs(config.allowedWeapons) do
    if a == "all" then
      table.insert(va, {
        weapon_id = fj.id,
        weapon_name = fj.index,
        weapon_type = fj.type,
        weapon_directory = config.WeaponDirectory
      })
    elseif a == "melee" then
      if fj.type == "melee" then
        table.insert(va, {
          weapon_id = fj.id,
          weapon_name = fj.index,
          weapon_type = fj.type,
          weapon_directory = config.WeaponDirectory
        })
      end
    elseif a == "handgun" then
      if fj.type == "handgun" then
        table.insert(va, {
          weapon_id = fj.id,
          weapon_name = fj.index,
          weapon_type = fj.type,
          weapon_directory = config.WeaponDirectory
        })
      end
    elseif a == "submachine" then
      if fj.type == "submachine" then
        table.insert(va, {
          weapon_id = fj.id,
          weapon_name = fj.index,
          weapon_type = fj.type,
          weapon_directory = config.WeaponDirectory
        })
      end
    elseif a == "assault" then
      if fj.type == "assault" then
        table.insert(va, {
          weapon_id = fj.id,
          weapon_name = fj.index,
          weapon_type = fj.type,
          weapon_directory = config.WeaponDirectory
        })
      end
    elseif a == "shotgun" then
      if fj.type == "shotgun" then
        table.insert(va, {
          weapon_id = fj.id,
          weapon_name = fj.index,
          weapon_type = fj.type,
          weapon_directory = config.WeaponDirectory
        })
      end
    elseif a == "throwable" then
      if fj.type == "throwable" then
        table.insert(va, {
          weapon_id = fj.id,
          weapon_name = fj.index,
          weapon_type = fj.type,
          weapon_directory = config.WeaponDirectory
        })
      end
    elseif a == "rifle" then
      if fj.type == "rifle" then
        table.insert(va, {
          weapon_id = fj.id,
          weapon_name = fj.index,
          weapon_type = fj.type,
          weapon_directory = config.WeaponDirectory
        })
      end
    elseif a == "special" and fj.type == "special" then
      table.insert(va, {
        weapon_id = fj.id,
        weapon_name = fj.index,
        weapon_type = fj.type,
        weapon_directory = config.WeaponDirectory
      })
    end
  end
  return va
end
function src.GetOnlinePlayers()
  va = {}
  for fe, fg in pairs((vRP.Players())) do
    table.insert(va, {
      k = fe,
      uname = vRP.Identity(fe).name,
      ulname = vRP.Identity(fe).name2
    })
  end
  return va
end
function src.EraseLog(a)
--   for fg, fh in pairs(config.perm_EditLogs) do
--     if vRP.HasPermission(vRP.Passport(source), fh[1]) then
--       vRP.Query("aurora/rem_log", {
--         id = tonumber(parseInt(a))
--       })
--     end
--   end
end
function src.WipeLogs()
--   for fe, fg in pairs(config.perm_EditLogs) do
--     if vRP.HasPermission(vRP.Passport(source), fg[1]) then
--       vRP.Query("aurora/rem_all_logs")
--     end
--   end
end
function src.addToGarage(a, b)
  local source = source 
  for fk, fl in pairs(config.perm_VehicleManagement) do
    if vRP.HasPermission(vRP.Passport(source), fl[1]) then

      if VehicleMode(b) == "Rental" then
        vRP.Query("vehicles/rentalVehicles",{ Passport = parseInt(a), vehicle = b, plate = vRP.GeneratePlate(), work = "false" })
      else
        vRP.Query("vehicles/addVehicles",{ Passport = parseInt(a), vehicle = b, plate = vRP.GeneratePlate(), work = "false" })
      end
      TriggerClientEvent("Notify",source,"verde", "Você adicionou o veículo <b>"..VehicleName(b).."</b> para o Passaporte: <b>"..parseInt(a).."</b>.", 5000)
      TriggerClientEvent("Notify",vRP.Source(parseInt(a)),"verde", "O veículo <b>"..VehicleName(b).."</b> foi adicionado na sua garagem.", 5000)
    end
  end
end
function src.remFromGarage(a, b)
  local source = source
  for fk, fl in pairs(config.perm_VehicleManagement) do
    if vRP.HasPermission(vRP.Passport(source), fl[1]) then

      vRP.Query("vehicles/removeVehicles",{ Passport = parseInt(a), vehicle = b })
      TriggerClientEvent("Notify",source,"verde", "Você removeu o veículo <b>"..VehicleName(b).."</b> do Passaporte: <b>"..parseInt(a).."</b>.", 5000)
      TriggerClientEvent("Notify",vRP.Source(parseInt(a)),"vermelho", "O veículo <b>"..VehicleName(b).."</b> foi removido da sua garagem.", 5000)
    end
  end
end
function src.adminSpawnVeh(VehicleName)
  local source = source
  local Passport = vRP.Passport(source) 
  if Passport then
    for fk, fl in pairs(config.perm_QuickActions_SpawnVeh) do
      if vRP.HasPermission(Passport, fl[1]) then
        local Ped = GetPlayerPed(source)
        local Coords = GetEntityCoords(Ped)
        local Heading = GetEntityHeading(Ped)
        local Plate = "VEH"..(10000 + Passport)

        local Randomize = 0
        local Vehicle = CreateVehicle(VehicleName,Coords["x"],Coords["y"],Coords["z"],Heading,true,true)
    
        while not DoesEntityExist(Vehicle) and Randomize <= 1000 do
          Randomize = Randomize + 1
          Wait(100)
        end
    
        if DoesEntityExist(Vehicle) then
          SetVehicleNumberPlateText(Vehicle,Plate)
          SetVehicleBodyHealth(Vehicle,1000.0)
          local Network = NetworkGetEntityFromNetworkId(NetworkGetNetworkIdFromEntity(Vehicle))
          SetVehicleDoorsLocked(Network,2)
          local Nitro = GlobalState["Nitro"]
          Nitro[Plate] = Nitrox or 0
          GlobalState:set("Nitro",Nitro,true)


          vGARAGE.CreateVehicle(-1,VehicleName,Network,1000,1000,nil,false,false)
          TriggerEvent("engine:tryFuel",Plate,100)
          SetPedIntoVehicle(Ped,Vehicle,-1)
          local Plates = GlobalState["Plates"]
          Plates[Plate] = Passport
          GlobalState:set("Plates",Plates,true)

        end
      end
    end
  end
end
function src.Kill(a)
  local source = source
  for fl, fm in pairs(config.perm_QuickActions_Kill) do
    if vRP.HasPermission(vRP.Passport(source), fm[1]) then
      if a then
        if vRP.Source(parseInt(a)) then
          vRPclient.SetHealth(vRP.Source(parseInt(a)), 0)
        end
      else
        vRPclient.SetHealth(source, 0)
      end
    end
  end
end
function src.Revive(a)
  for fk, fl in pairs(config.perm_QuickActions_Revive) do
    if vRP.HasPermission(vRP.Passport(source), fl[1]) then
      if a then
        if vRP.Source(parseInt(a)) then

          vRP.Revive(vRP.Source(parseInt(a)),200)
          vRP.UpgradeThirst(parseInt(a),100)
          vRP.UpgradeHunger(parseInt(a),100)
          vRP.DowngradeStress(parseInt(a),100)
          TriggerClientEvent("hud:Active",parseInt(a),true)
          TriggerClientEvent("paramedic:Reset",vRP.Source(parseInt(a)))
          vRPclient.removeObjects(vRP.Source(parseInt(a)))
        end
      else

        vRP.Revive(source,200)
        vRP.UpgradeThirst(vRP.Passport(source),100)
        vRP.UpgradeHunger(vRP.Passport(source),100)
        vRP.DowngradeStress(vRP.Passport(source),100)
        TriggerClientEvent("hud:Active",vRP.Passport(source),true)
        TriggerClientEvent("paramedic:Reset",source)
        vRPclient.removeObjects(source)

      end
    end
  end
end
function src.upgradeVeh()
  for fj, fk in pairs(config.perm_QuickActions_UpgradeVeh) do
    if vRP.HasPermission(vRP.Passport(source), fk[1]) then
      TriggerClientEvent("vehtuning", source)
    end
  end
end
function src.addWl(a)
  for fj, fk in pairs(config.perm_QuickActions_WLManage) do
    if vRP.HasPermission(vRP.Passport(source), fk[1]) then
      vRP.Query("accounts/updateWhitelist",{ id = parseInt(a), whitelist = 1 })
    end
  end
end
function src.removeWl(a)
  for fj, fk in pairs(config.perm_QuickActions_WLManage) do
    if vRP.HasPermission(vRP.Passport(source), fk[1]) then
      vRP.Query("accounts/updateWhitelist",{ id = parseInt(a), whitelist = 0 })
    end
  end
end
function src.kickSpecified(a)
  for fj, fk in pairs(config.perm_QuickActions_KickID) do
    if vRP.HasPermission(vRP.Passport(source), fk[1]) and vRP.Source(parseInt(a)) then
      vRP.Kick(vRP.Source(parseInt(a)), "Voc\195\170 foi expulso da cidade.")
    end
  end
end
function src.banSpecified(a)
  for fk, fl in pairs(config.perm_QuickActions_BanManage) do
    if vRP.HasPermission(vRP.Passport(source), fl[1]) then
      if vRP.Source(parseInt(a)) then
        vRP.setBanned(vRP.Passport((vRP.Source(parseInt(a)))), true)
        vRP.Query("banneds/InsertBanned",{ license = vRP.Identity(parseInt(a))["license"], time = Days })
        vRP.Kick(vRP.Source(parseInt(a)), "Voc\195\170 foi expulso da cidade.")
      else
        vRP.setBanned(a, true)
      end
    end
  end
end
function src.unbanSpecified(a)
  for fk, fl in pairs(config.perm_QuickActions_BanManage) do
    if vRP.HasPermission(vRP.Passport(source), fl[1]) then
      vRP.setBanned(a, false)
    end
  end
end
function src.setUserGroup(a, b, c)
  local source = source
  for fl, fm in pairs(config.perm_GroupManagement) do
    if vRP.HasPermission(vRP.Passport(source), fm[1]) and vRP.Source(tonumber(a)) then
      vRP.SetPermission(parseInt(a),tostring(b),tonumber(c))
    end
  end
end
function src.removeUserGroup(a, b)
  local source = source
  for fl, fm in pairs(config.perm_GroupManagement) do
    if vRP.HasPermission(vRP.Passport(source), fm[1]) and vRP.Source(tonumber(parseInt(a))) then
      vRP.RemovePermission(parseInt(a),tostring(b))
    end
  end
end
function src.takeItem(a, b)
  local source = source
  for fl, fm in pairs(config.perm_ItemManagement) do
    if vRP.HasPermission(vRP.Passport(source), fm[1]) then
      vRP.GenerateItem(vRP.Passport(source),tostring(a),parseInt(b),true)
    end
  end
end
function src.giveItem(a, b, c)
  local source = source
  for fm, fo in pairs(config.perm_ItemManagement) do
    if vRP.HasPermission(vRP.Passport(source), fo[1]) and vRP.Source(parseInt(a)) then
      vRP.GenerateItem(parseInt(a),tostring(b),parseInt(c),true)
    end
  end
end
function src.clearUserInv(a)
  for fo, fp in pairs(config.perm_ItemManagement) do
    if vRP.HasPermission(vRP.Passport(source), fp[1]) then
      if vRP.Passport(tonumber((vRP.Source(tonumber((tonumber(a))))))) ~= nil then
        vRP.ClearInventory(parseInt(a))
        TriggerClientEvent("Notify", source, "sucesso", "Limpou inventario do <b>" .. vRP.Identity((vRP.Passport(tonumber((vRP.Source(tonumber((tonumber(a))))))))).name .. " " .. vRP.Identity((vRP.Passport(tonumber((vRP.Source(tonumber((tonumber(a))))))))).name2 .. "</b>.")
      else
        TriggerClientEvent("Notify", source, "negado", "O usu\195\161rio n\195\163o foi encontrado ou est\195\161 offline.")
      end
    end
  end
end
function src.teleportToMe(a)
  for fk, fl in pairs(config.perm_TeleportPlayer) do
    if vRP.HasPermission(vRP.Passport(source), fl[1]) and a then
      if vRP.Source(parseInt(a)) then

        local Ped = GetPlayerPed(vRP.Source(parseInt(a)))
				local Coords = GetEntityCoords(Ped)
				vRP.Teleport(vRP.Source(parseInt(a)),Coords["x"],Coords["y"],Coords["z"])

        TriggerClientEvent("Notify", source, "sucesso", "Teleportado.")
      else
        TriggerClientEvent("Notify", source, "negado", "ID indispon\195\173vel.", 6000)
      end
    end
  end
end
function src.TeleportToPlayer(a)
  for fk, fl in pairs(config.perm_TeleportPlayer) do
    if vRP.HasPermission(vRP.Passport(source), fl[1]) then
      if vRP.Source(parseInt(a)) then

        local Ped = GetPlayerPed(vRP.Source(parseInt(a)))
				local Coords = GetEntityCoords(Ped)
				vRP.Teleport(source,Coords["x"],Coords["y"],Coords["z"])

        TriggerClientEvent("Notify", source, "sucesso", "Teleportado.")
      else
        TriggerClientEvent("Notify", source, "negado", "ID indispon\195\173vel.", 6000)
      end
    end
  end
end
function src.TeleportWaypoint()
  for fj, fk in pairs(config.perm_TeleportPlayer) do
    if vRP.HasPermission(vRP.Passport(source), fk[1]) then
      Tunnel.getInterface("admin").teleportWay(source)
      TriggerClientEvent("Notify", source, "sucesso", "Teleportado.")
    end
  end
end
function src.giveWeapon(a, b, c)
  for fm, fo in pairs(config.perm_WeaponManagement) do
    if vRP.HasPermission(vRP.Passport(source), fo[1]) then
      if b then
        

        vRP.GenerateItem(parseInt(b),a,1,true)
        local ammo = itemAmmo(a) 
        if ammo then
          vRP.GenerateItem(parseInt(b),ammo,tonumber(c),true)
        end

      else
        vRP.GenerateItem(vRP.Passport(source),a,1,true)
        local ammo = itemAmmo(a) 
        if ammo then
          vRP.GenerateItem(vRP.Passport(source),ammo,tonumber(c),true)
        end
        
      end
    end
  end
end
function src.clearWeapons(a)
  for fk, fl in pairs(config.perm_WeaponManagement) do
    if vRP.HasPermission(vRP.Passport(source), fl[1]) then
      if a then
        local Inventory = vRP.Inventory(parseInt(a))
        for k,v in pairs(Inventory) do
            if itemType(v.item) == "Armamento" or itemType(v.item) == "Munição" then
              vRP.RemoveItem(parseInt(a),v.item,v.amount,true)
            end
        end
      else

        local Inventory = vRP.Inventory(vRP.Passport(source))
        for k,v in pairs(Inventory) do
          if itemType(v.item) == "Armamento" or itemType(v.item) == "Munição" then
              vRP.RemoveItem(vRP.Passport(source),v.item,v.amount,true)
            end
        end
      end
    end
  end
end
function src.checkGlobalPermission()
  if vRP.HasPermission(vRP.Passport(source), config.globalPerm, 1) then
    return true
  end
end
function src.getSpecifiedPlayer(a)
  if vRP.Passport(a) then
    return vRP.Identity(parseInt((vRP.Passport(a)))).name
  else
  end
end
function src.AdminNotify(a, b, c, d)
  if vRP.Passport(source) then
    for fm, fo in pairs(config.perm_NotifyPlayers) do
      if vRP.HasPermission(vRP.Passport(source), fo[1]) then
        if c ~= "" and d ~= "" and c ~= nil then
        end
        if d == nil then
          return
        end
        if not a then
          TriggerClientEvent("Notify", -1, "aviso", c .. "<br> <b>- " .. d .. "</b>", 60000)
        elseif vRP.Passport((vRP.Source(parseInt(tonumber(b))))) then
          TriggerClientEvent("Notify", vRP.Source(parseInt(tonumber(b))), "aviso", c .. "<br> <b>- " .. d .. "</b>", 60000)
        end
      end
    end
  end
end
function src.VerifyPerm(a)
  if a == "spawn_veh" then
    for fg, fh in pairs(config.perm_QuickActions_SpawnVeh) do
      if vRP.HasPermission(vRP.Passport(source), fh[1]) then
        return true
      end
    end
  elseif a == "kill" then
    for fg, fh in pairs(config.perm_QuickActions_Kill) do
      if vRP.HasPermission(vRP.Passport(source), fh[1]) then
        return true
      end
    end
  elseif a == "kill_all" then
    for fg, fh in pairs(config.perm_QuickActions_KillAll) do
      if vRP.HasPermission(vRP.Passport(source), fh[1]) then
        return true
      end
    end
  elseif a == "revive" then
    for fg, fh in pairs(config.perm_QuickActions_Revive) do
      if vRP.HasPermission(vRP.Passport(source), fh[1]) then
        return true
      end
    end
  elseif a == "revive_all" then
    for fg, fh in pairs(config.perm_QuickActions_ReviveAll) do
      if vRP.HasPermission(vRP.Passport(source), fh[1]) then
        return true
      end
    end
  elseif a == "upgrade_veh" then
    for fg, fh in pairs(config.perm_QuickActions_UpgradeVeh) do
      if vRP.HasPermission(vRP.Passport(source), fh[1]) then
        return true
      end
    end
  elseif a == "wl_manage" then
    for fg, fh in pairs(config.perm_QuickActions_WLManage) do
      if vRP.HasPermission(vRP.Passport(source), fh[1]) then
        return true
      end
    end
  elseif a == "ban_manage" then
    for fg, fh in pairs(config.perm_QuickActions_BanManage) do
      if vRP.HasPermission(vRP.Passport(source), fh[1]) then
        return true
      end
    end
  elseif a == "kick_id" then
    for fg, fh in pairs(config.perm_QuickActions_KickID) do
      if vRP.HasPermission(vRP.Passport(source), fh[1]) then
        return true
      end
    end
  elseif a == "kick_all" then
    for fg, fh in pairs(config.perm_QuickActions_KickAll) do
      if vRP.HasPermission(vRP.Passport(source), fh[1]) then
        return true
      end
    end
  elseif a == "manage_groups" then
    for fg, fh in pairs(config.perm_GroupManagement) do
      if vRP.HasPermission(vRP.Passport(source), fh[1]) then
        return true
      end
    end
  elseif a == "manage_items" then
    for fg, fh in pairs(config.perm_ItemManagement) do
      if vRP.HasPermission(vRP.Passport(source), fh[1]) then
        return true
      end
    end
  elseif a == "manage_vehicles" then
    for fg, fh in pairs(config.perm_VehicleManagement) do
      if vRP.HasPermission(vRP.Passport(source), fh[1]) then
        return true
      end
    end
  elseif a == "manage_players" then
    for fg, fh in pairs(config.perm_PlayerManagement) do
      if vRP.HasPermission(vRP.Passport(source), fh[1]) then
        return true
      end
    end
  elseif a == "manage_notify" then
    for fg, fh in pairs(config.perm_NotifyPlayers) do
      if vRP.HasPermission(vRP.Passport(source), fh[1]) then
        return true
      end
    end
  elseif a == "get_coordinates" then
    for fg, fh in pairs(config.perm_GetCoordinates) do
      if vRP.HasPermission(vRP.Passport(source), fh[1]) then
        return true
      end
    end
  elseif a == "teleport" then
    for fg, fh in pairs(config.perm_TeleportPlayer) do
      if vRP.HasPermission(vRP.Passport(source), fh[1]) then
        return true
      end
    end
  elseif a == "weapons" then
    for fg, fh in pairs(config.perm_WeaponManagement) do
      if vRP.HasPermission(vRP.Passport(source), fh[1]) then
        return true
      end
    end
  elseif a == "money" then
    for fg, fh in pairs(config.perm_MoneyManagement) do
      if vRP.HasPermission(vRP.Passport(source), fh[1]) then
        return true
      end
    end
  elseif a == "see_logs" then
    for fg, fh in pairs(config.perm_SeeLogs) do
      if vRP.HasPermission(vRP.Passport(source), fh[1]) then
        return true
      end
    end
  elseif a == "edit_logs" then
    for fg, fh in pairs(config.perm_EditLogs) do
      if vRP.HasPermission(vRP.Passport(source), fh[1]) then
        return true
      end
    end
  end
end
function tD(a)
  a = math.ceil(a * 100) / 100
  return a
end
function src.GetEntityCoords()
  local Ped = GetPlayerPed(source)
  local Coords = GetEntityCoords(Ped)
  return "['x'] = " .. tD(Coords.z) .. ", ['y'] = " .. tD(Coords.y) .. ", ['z'] = " .. tD(Coords.z)
end
function src.GiveMoney(a, b, c)
  local source =  b and vRP.Source(parseInt(b)) or source
  for fo, fp in pairs(config.perm_MoneyManagement) do
    if vRP.HasPermission(vRP.Passport(source), fp[1]) then
      if vRP.Passport(source) then
        if a == "bank" then
          vRP.GiveBank(vRP.Passport(source), parseInt(c))
        else
          vRP.GenerateItem(vRP.Passport(source), "dollars", parseInt(c), true)
        end
      end
    end
  end
end
function src.SetMoney(a, b, c)
  local source =  b and vRP.Source(parseInt(b)) or source
  for fo, fp in pairs(config.perm_MoneyManagement) do
    if vRP.HasPermission(vRP.Passport(source), fp[1]) then
      if vRP.Passport(source) then
        if a == "bank" then
          vRP.RemoveBank(vRP.Passport(source), vRP.GetBank(source))
          vRP.GiveBank(vRP.Passport(source), parseInt(c))
        else
          vRP.TakeItem(vRP.Passport(source),"dollars",vRP.ItemAmount(vRP.Passport(source),"dollars"))
          vRP.GenerateItem(vRP.Passport(source),"dollars",parseInt(c))
        end
      end
    end
  end
end
function src.CheckPlayer(a)
  if vRP.Passport((vRP.Source(parseInt(a)))) then
    return true
  end
end
function src.GetPlayerInfos(a)
  for fg = 1, #vRP.Query("aurora/get_user_identity", {user_id = a}) do
    return vRP.Query("aurora/get_user_identity", {user_id = a})[fg].name, vRP.Query("aurora/get_user_identity", {user_id = a})[fg].name2
  end
end
AddEventHandler("onResourceStart", function(a)
  if GetCurrentResourceName() == a then
  end
end)
function src.checkAuth()
  return auth
end
