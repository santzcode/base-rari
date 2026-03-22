cfg = {}

cfg.comandoXenon = "xenon"
cfg.comandoNeon = "neon"
cfg.comandoSuspensao = "suspe"

cfg.apenasDonoAcessaXenon = true
cfg.apenasDonoAcessaNeon = true
cfg.apenasDonoAcessaSuspensao = true

cfg.permissaoParaInstalar = { existePermissao = true, permissoes = { "Admin" } }

cfg.blipsShopMec = {
    { loc = {x= 51.06, y= -892.87, z= 30.14}, perms = { "Admin" } }, --sport racer  
	 { loc = {x=546.65, y=-166.75, z=54.5}, perms = { "Admin" } }, --Auto Exotic
	 { loc = {x=-352.84, y=-130.14, z=39.02}, perms = { "Admin" } }    
}

cfg.valores = {
	{ item = "suspensaoar", quantidade = 1, compra = 10000 },
	{ item = "moduloneon", quantidade = 1, compra = 5000 },
	{ item = "moduloxenon", quantidade = 1, compra = 5000 },
}