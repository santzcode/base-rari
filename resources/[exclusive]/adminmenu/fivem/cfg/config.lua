

-- config array (!)
config = {}

-- permissão global da staff
config.globalPerm = "Admin"
-- comando padrão para abrir o menu, use "z" no começo do comando para esconde-lo das dicas do chat
config.openCommand = "admin"


-- tipos de grupo permitidos (definidos no "gtype" do groups.lua) na página de grupos da interface, cheque o arquivo de configuração dos grupos e verifique se todos possuem a tabela _config e um gtype
config.allowedGtype = { 
    { "admin" },
    { "job" },
}
--testez

-- armas permitidas para serem pegas na página de armas
config.allowedWeapons = {
    -- observação: todas essas armas foram testadas e funcionam em quase todo tipo de servidor, adicionar qualquer outra não é de responsabilidade da marca ou desenvolvedor, assegure que tudo que adicionar é compatível no seu caso.
    -- os tipos de armas suportados são: melee, handgun, submachine, assault, shotgun, throwable, rifle, special. não troque os tipos por nenhum outro que não esteja listado aqui 
    -- a interface segue a ordem dessa array, se você deseja mudar a ordem, apenas troque a ordem aqui
    { ['id'] = "WEAPON_KNIFE", ['index'] = "Faca", ['type'] = "melee" },
    { ['id'] = "WEAPON_DAGGER", ['index'] = "Adaga", ['type'] = "melee" },
    { ['id'] = "WEAPON_BAT", ['index'] = "Beisebol", ['type'] = "melee" },
    { ['id'] = "WEAPON_BOTTLE", ['index'] = "Garrafa", ['type'] = "melee" },
    { ['id'] = "WEAPON_CROWBAR", ['index'] = "Cabra", ['type'] = "melee" },
    { ['id'] = "WEAPON_FLASHLIGHT", ['index'] = "Lanterna", ['type'] = "melee" },
    { ['id'] = "WEAPON_GOLFCLUB", ['index'] = "Golf", ['type'] = "melee" },
    { ['id'] = "WEAPON_HAMMER", ['index'] = "Martelo", ['type'] = "melee" },
    { ['id'] = "WEAPON_HATCHET", ['index'] = "Machado", ['type'] = "melee" },
    { ['id'] = "WEAPON_KNUCKLE", ['index'] = "Ingles", ['type'] = "melee" },
    { ['id'] = "WEAPON_MACHETE", ['index'] = "Machete", ['type'] = "melee" },
    { ['id'] = "WEAPON_SWITCHBLADE", ['index'] = "Canivete", ['type'] = "melee" },
    { ['id'] = "WEAPON_NIGHTSTICK", ['index'] = "Cassetete", ['type'] = "melee" },
    { ['id'] = "WEAPON_WRENCH", ['index'] = "Grifo", ['type'] = "melee" },
    { ['id'] = "WEAPON_BATTLEAXE", ['index'] = "Batalha", ['type'] = "melee" },
    { ['id'] = "WEAPON_POOLCUE", ['index'] = "Sinuca", ['type'] = "melee" },
    { ['id'] = "WEAPON_STONE_HATCHET", ['index'] = "Pedra", ['type'] = "melee" },
	
    -- handguns
    { ['id'] = "WEAPON_PISTOL", ['index'] = "Pistol", ['type'] = "handgun" },
    { ['id'] = "WEAPON_PISTOL_MK2", ['index'] = "Pistol MK2", ['type'] = "handgun" },
    { ['id'] = "WEAPON_COMBATPISTOL", ['index'] = "CombatPistol", ['type'] = "handgun" },
    { ['id'] = "WEAPON_APPISTOL", ['index'] = "APPistol", ['type'] = "handgun" },
    { ['id'] = "WEAPON_STUNGUN", ['index'] = "StunGun", ['type'] = "handgun" },
    { ['id'] = "WEAPON_PISTOL50", ['index'] = "Pistol 50", ['type'] = "handgun" },
    { ['id'] = "WEAPON_SNSPISTOL", ['index'] = "SNS Pistol", ['type'] = "handgun" },
    { ['id'] = "WEAPON_HEAVYPISTOL", ['index'] = "Revolver", ['type'] = "handgun" },
    -- submachine guns
    { ['id'] = "WEAPON_SMG", ['index'] = "SMG", ['type'] = "submachine" },
    { ['id'] = "WEAPON_ASSAULTSMG", ['index'] = "Assault SMG", ['type'] = "submachine" },
    { ['id'] = "WEAPON_MICROSMG", ['index'] = "UZI", ['type'] = "submachine" },
    { ['id'] = "WEAPON_MACHINEPISTOL", ['index'] = "UZI Pistol", ['type'] = "submachine" },
    -- assault rifles
    { ['id'] = "WEAPON_CARBINERIFLE", ['index'] = "Carbine Rifle", ['type'] = "assault" },
    { ['id'] = "WEAPON_ASSAULTRIFLE", ['index'] = "AK-47", ['type'] = "assault" },
    { ['id'] = "WEAPON_CARBINERIFLE_MK2", ['index'] = "Carbine Rifle MK2", ['type'] = "assault" },
    { ['id'] = "WEAPON_ASSAULTRIFLE_MK2", ['index'] = "AK-47 mk2", ['type'] = "assault" },
    { ['id'] = "WEAPON_SPECIALCARBINE", ['index'] = "Special Carbine", ['type'] = "assault" },
    -- shotguns
    { ['id'] = "WEAPON_PUMPSHOTGUN", ['index'] = "PumpShotgun", ['type'] = "shotgun" },
    { ['id'] = "WEAPON_PUMPSHOTGUN_MK2", ['index'] = "PumpShotgun MK2", ['type'] = "shotgun" },
    { ['id'] = "WEAPON_ASSAULTSHOTGUN", ['index'] = "AssaultShotgun", ['type'] = "shotgun" },
    { ['id'] = "WEAPON_MUSKET", ['index'] = "Musket", ['type'] = "shotgun" },
    { ['id'] = "WEAPON_HEAVYSHOTGUN", ['index'] = "Heavy Shotgun", ['type'] = "shotgun" },
    -- throwables
    { ['id'] = "WEAPON_MOLOTOV", ['index'] = "Molotov", ['type'] = "throwable" },
    { ['id'] = "WEAPON_STICKYBOMB", ['index'] = "StickyBomb", ['type'] = "throwable" },
    { ['id'] = "WEAPON_FLARE", ['index'] = "Flare", ['type'] = "throwable" },
    -- sniper rifles
    { ['id'] = "WEAPON_SNIPERRIFLE", ['index'] = "Sniper", ['type'] = "rifle" },
    { ['id'] = "WEAPON_HEAVYSNIPER", ['index'] = "Heavy Sniper", ['type'] = "rifle" },
    { ['id'] = "WEAPON_MARKSMANRIFLE", ['index'] = "Marks Rifle", ['type'] = "rifle" },
    -- special weapons
    { ['id'] = "WEAPON_RPG", ['index'] = "RPG", ['type'] = "special" },
    { ['id'] = "WEAPON_MINIGUN", ['index'] = "Minigun", ['type'] = "special" },
    { ['id'] = "WEAPON_RAILGUN", ['index'] = "Railgun", ['type'] = "special" },
    { ['id'] = "WEAPON_GRENADELAUNCHER", ['index'] = "Lança Granadas", ['type'] = "special" },
    { ['id'] = "WEAPON_RAYPISTOL", ['index'] = "RayPistol", ['type'] = "special" },
}

-- all menu actions permissions
-- be aware that, this are global permissions, changing one action permission, will change all permissions related to this action in a global way in the panel
-- who can spawn vehicles
config.perm_QuickActions_SpawnVeh = {
    {"Admin"},
}
-- who can kill a specified id
config.perm_QuickActions_Kill =  { 
    {"Admin"},
}
-- who can kill all in the server
config.perm_QuickActions_KillAll = { 
    {"Admin"},
}
-- who can revive, specified id or itself
config.perm_QuickActions_Revive = { 
    {"Admin"},
}
-- who can revive all in the server
config.perm_QuickActions_ReviveAll = { 
    {"Admin"},
}
-- who can upgrade it own vehicle
config.perm_QuickActions_UpgradeVeh = { 
    {"Admin"},
}
-- who can add/remove people from whitelist and access the wl management page
config.perm_QuickActions_WLManage = { 
    {"Admin"},
}
-- who can ban or unban people from the server
config.perm_QuickActions_BanManage = { 
    {"Admin"},
}
-- who can kick all in the server
config.perm_QuickActions_KickAll = { 
    {"Admin"},
}
-- who can kick a specified id
config.perm_QuickActions_KickID = { 
    {"Admin"},
}

-- who can add/remove a group from any user and access the groups page
config.perm_GroupManagement = { 
    {"Admin"},
}
-- who can take or give any item to any player including itself, and access the items page
config.perm_ItemManagement = {
    {"Admin"},
}
-- who can add/remove a vehicle from any person's garage, and access the items page
config.perm_VehicleManagement = {
    {"Admin"},
}
-- who can access the playerlist page and search an id
config.perm_PlayerManagement = {
    {"Admin"},
}
-- who can notify any player, or the whole server
config.perm_NotifyPlayers = {
    {"Admin"},
}
-- who can get itself's coordinates
config.perm_GetCoordinates = {
    {"Admin"},
}
-- who can teleport itself to other players, or teleport other players to itself, or teleport itself to a waypoint
config.perm_TeleportPlayer = {
    {"Admin"},
}
-- who can give/remove weapons to/from other players or itself
config.perm_WeaponManagement = {
    {"Admin"},
}
-- who can give/set itself or other's money, and access the economy page
config.perm_MoneyManagement = {
    {"Admin"},
}
-- who can see all menu logs
config.perm_SeeLogs = {
    {"Admin"},
}
-- who can delete all menu logs
config.perm_EditLogs = {
    {"Admin"},
}

-- images directory for item list
config.ItemDirectory = "nui://vrp/config/inventory"
-- images directory for vehicle list
config.VehicleDirectory = "http://151.244.40.71/veiculos"
-- images directory for weapon list
config.WeaponDirectory = "nui://vrp/config/inventory"

-- this is a test for the future ticket system, leave it blank.
config.openTicketCommand = ""

-- returns all config data (!)
return config