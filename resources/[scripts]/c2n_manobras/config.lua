cfg = {}

--[Animações]--
cfg.dict = "rcmextreme2atv"

cfg.anims = {
	"idle_b",
	"idle_c",
	"idle_d",
	"idle_e"
}

--[Others]--
cfg.keyMapSuggest = {
	command = "manobras",  		  -- Comando para iniciar as manobras
	suggestion = { 				  -- Sugestão chat 
		active = true,    		  -- true para ativar // false para desativar
		title = "/manobras",       -- Titulo
		details = "Para se preparar para as manobras." -- Detalhes
	},
}

cfg.checkVip = {
    active = true,                -- true para ativar // false para desativar [Ser vip para poder fazer as manobras]
    perms = { "Premium" } -- Se quiser mais perms coloque, perms = { "ex1.permissao","ex2.permissao","ex3.permissao" }
}

--[Keyboards]--
-- Seta Esquerda ou NumPad 4 = Manobra esquerda
-- Seta Direita ou NumPad 6 = Manobra direita
-- Seta para Baixo ou NumPad 5 = Manobra lados
-- Seta para Cima ou NumPad 8 = Manobra cima
