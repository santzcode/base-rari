cfg = {}

cfg.comandoXenon = "xenon"
cfg.comandoNeon = "neon"
cfg.comandoSuspensao = "suspe"

cfg.apenasDonoAcessaXenon = true
cfg.apenasDonoAcessaNeon = true
cfg.apenasDonoAcessaSuspensao = true

cfg.permissaoParaInstalar = { existePermissao = true, permissoes = { "Admin" } }

cfg.blipslocal = {

    ['x'] = 135.95, ['y'] = -3029.79, ['z'] = 7.05,
	['x'] = 145.05, ['y'] = -3030.29, ['z'] = 7.05
}



cfg.blipsShopMec = {

    { loc = { x = 126.14, y = -3027.47, z =7.05 }, perms = { "driftking.permissao" } }   -- 126.14, -3027.47, 7.05
}

cfg.valores = {
	{ item = "suspensaoar", quantidade = 1, compra = 10000 },
	{ item = "moduloneon", quantidade = 1, compra = 5000 },
	{ item = "moduloxenon", quantidade = 1, compra = 5000 },
}