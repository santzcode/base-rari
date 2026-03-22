-----------------------------------------------------------------------------------------------------------------------------------------
-- GROUPS
-----------------------------------------------------------------------------------------------------------------------------------------
Groups = {
	-- Staff
	["Admin"] = {
		["Parent"] = {
			["Admin"] = true
		},
		["Hierarchy"] = { 
			[1] = "Administrador",
			[2] = "Moderador",
			[3] = "Suporte" 
		},
		["Service"] = {}
	},
	["Som"] = {
		["Parent"] = {
			["Som"] = true
		},
		["Hierarchy"] = { "Som", "Admin" },
		["Service"] = {},
	},
	["Vereficado"] = {
		["Parent"] = {
			["Som"] = true
		},
		["Hierarchy"] = { "Vereficado", "Admin" },
		["Service"] = {},
	},
	-- Buff Org
	["Buff"] = {
		["Parent"] = {
			["Buff"] = true
		},
		["Hierarchy"] = { "Chefe" },
		["Salary"] = { 2250 },
		["Service"] = {}
	},
	-- Vip
	["Premium"] = {
		["Parent"] = {
			["Bronze"] = true,
			["Prata"] = true,
			["Ouro"] = true,
			["Diamante"] = true,
			["Patrocinador"] = true,
		},
		["Hierarchy"] = {},
		["Salary"] = {},
		["Service"] = {}
	},
	["Bronze"] = {
		["Parent"] = {
			["Bronze"] = true
		},
		["Hierarchy"] = { "Bronze" },
		["Salary"] = { 2500 },
		["Service"] = {},
		["Type"] = "Premium",
	},
	["Prata"] = {
		["Parent"] = {
			["Prata"] = true
		},
		["Hierarchy"] = { "Prata" },
		["Salary"] = { 3500 },
		["Service"] = {},
		["Type"] = "Premium",
	},
	["Ouro"] = {
		["Parent"] = {
			["Ouro"] = true
		},
		["Hierarchy"] = { "Ouro" },
		["Salary"] = { 5500 },
		["Service"] = {},
		["Type"] = "Premium",
	},
	["Diamante"] = {
		["Parent"] = {
			["Diamante"] = true
		},
		["Hierarchy"] = { "Diamante" },
		["Salary"] = { 7500 },
		["Service"] = {},
		["Type"] = "Premium",
	},
	["Patrocinador"] = {
		["Parent"] = {
			["Patrocinador"] = true
		},
		["Hierarchy"] = { "Patrocinador" },
		["Salary"] = { 10500 },
		["Service"] = {},
		["Type"] = "Premium",
	},	-- Advogado
	["Advogado"] = {
		["Parent"] = {
			["Buff"] = true
		},
		["Hierarchy"] = { "Advogado" },
		["Salary"] = { 3250 },
		["Service"] = {}
	},
	["Juiz"] = {
		["Parent"] = {
			["Buff"] = true
		},
		["Hierarchy"] = { "Juiz" },
		["Salary"] = { 5250 },
		["Service"] = {}
	},
	-- Policia
	["Policia"] = {
		["Parent"] = {
			["Pcesp"] = true,
			["Pmesp"] = true,
			["1BPChq"] = true,
			["Prf"] = true,
		},
		["Hierarchy"] = { "Membro" },
		["Service"] = {}
	},
	["Pcesp"] = {
		["Name"] = "Policia Civil",
		["Parent"] = {
			["Pcesp"] = true,
		},
		["Hierarchy"] = {  
			[1] = "Delegado", 
			[2] = "Investigador", 
			[3] = "Escrivão", 
			[4] = "Perito Criminal", 
			[5] = "Médico Legista", 
			[6] = "Auxiliar de Papiloscopista",
		},
		["Salary"] = { 
			[1] = 45000, 
			[2] = 40500, 
			[3] = 38000, 
			[4] = 35000, 
			[5] = 33000, 
			[6] = 29000, 
		},
		["Service"] = {},
		["Type"] = "Policia",
		["Client"] = true
	},
	["Pmesp"] = {
		["Name"] = "Policia Militar",
		["Parent"] = {
			["Pmesp"] = true,
		},
		["Hierarchy"] = { "Comandante Geral", "Coronel", "Tenente Coronel", "Major", "Capitão", "Primeiro Tenente", "Segundo Tenente", "Aspirante a Oficial", "Terceiro Aluno", "Segundo Aluno", "Primeiro Aluno", "Aluno Csta", "Subtenente", "Primeiro Sargento", "Segundo Sargento", "Terceiro Sargento", "Aluno Sargento", "Cabo", "Soldado" },
		-- ["Salary"] = { [1] = 35000, [2] = 32000, [3] = 28000, [4] = 25000, [5] = 23000, [6] = 20000, [7] = 18000, [8] = 16000, [9] = 14000, [10] = 12000, [11] = 10000, [12] = 9000, [13] = 8000, [14] = 7000,[15] = 6000, [16] = 5000, [17] = 4000, [18] = 3000, [19] = 2000 },
		["Salary"] = { [1] = 30000, [2] = 28000, [3] = 23000, [4] = 18750, [5] = 16000, [6] = 15680, [7] = 13000, [8] = 9150, [9] = 8800, [10] = 7800, [11] = 7500, [12] = 7300, [13] = 7000, [14] = 6800,[15] = 6500, [16] = 6300, [17] = 6000, [18] = 5000, [19] = 5000 },
		["Service"] = {},
		["Type"] = "Policia",
		["Client"] = true
	},
	["1BPChq"] = {
		["Name"] = "Batalhão Rota",
		["Parent"] = {
			["1BPChq"] = true,
		},
		["Hierarchy"] = { "Coronel", "Tenente Coronel", "Major", "Capitão", "Primeiro Tenente", "Segundo Tenente", "Subtenente", "Primeiro Sargento", "Segundo Sargento", "Terceiro Sargento", "Cabo", "Soldado" },
		["Salary"] = { 30000, 28000, 23000, 18750, 16000, 15600, 13000, 9500, 8800, 7800, 7500, 7300 },
		["Service"] = {},
		["Type"] = "Policia",
		["Client"] = true
	},
	["2BPChq"] = {
		["Name"] = "Batalhão Anchieta",
		["Parent"] = {
			["2BPChq"] = true,
		},
		["Hierarchy"] = { "Coronel", "Tenente Coronel", "Major", "Capitão", "Primeiro Tenente", "Segundo Tenente", "Subtenente", "Primeiro Sargento", "Segundo Sargento", "Terceiro Sargento", "Cabo", "Soldado" },
		["Salary"] = { 30000, 28000, 23000, 18750, 16000, 15600, 13000, 9500, 8800, 7800, 7500, 7300 },
		["Service"] = {},
		["Type"] = "Policia",
		["Client"] = true
	},
	["3BPChq"] = {
		["Name"] = "Batalhão Humaitá",
		["Parent"] = {
			["3BPChq"] = true,
		},
		["Hierarchy"] = { "Coronel", "Tenente Coronel", "Major", "Capitão", "Primeiro Tenente", "Segundo Tenente", "Subtenente", "Primeiro Sargento", "Segundo Sargento", "Terceiro Sargento", "Cabo", "Soldado" },
		["Salary"] = { 30000, 28000, 23000, 18750, 16000, 15600, 13000, 9500, 8800, 7800, 7500, 7300 },
		["Service"] = {},
		["Type"] = "Policia",
		["Client"] = true
	},
	["4BPChq"] = {
		["Name"] = "Batalhão de Operações Especiais",
		["Parent"] = {
			["4BPChq"] = true,
		},
		["Hierarchy"] = { "Coronel", "Tenente Coronel", "Major", "Capitão", "Primeiro Tenente", "Segundo Tenente", "Subtenente", "Primeiro Sargento", "Segundo Sargento", "Terceiro Sargento", "Cabo", "Soldado" },
		["Salary"] = { 30000, 28000, 23000, 18750, 16000, 15600, 13000, 9500, 8800, 7800, 7500, 7300 },
		["Service"] = {},
		["Type"] = "Policia",
		["Client"] = true,
		["Pmesp"] = true
	},
	["Baep"] = {
		["Name"] = "Batalhão de Ações Especiais de Polícia",
		["Parent"] = {
			["Baep"] = true,
		},
		["Hierarchy"] = { "Coronel", "Tenente Coronel", "Major", "Capitão", "Primeiro Tenente", "Segundo Tenente", "Subtenente", "Primeiro Sargento", "Segundo Sargento", "Terceiro Sargento", "Cabo", "Soldado" },
		-- ["Salary"] = { 13000, 10500, 8000, 7800, 7000, 6750, 6000, 5680, 5000, 4300, 4150, 3500, 2800, 2000 },
		["Salary"] = { 30000, 28000, 25000, 23000, 20000, 18750, 16000, 15680, 13000, 11300, 9150, 8500, 7800, 5000 },
		["Service"] = {},
		["Type"] = "Policia",
		["Client"] = true,
		["Pmesp"] = true
	},
	["Rota"] = {
		["Name"] = "Rota",
		["Parent"] = {
			["Rota"] = true,
		},
		["Hierarchy"] = { "Coronel", "Tenente Coronel", "Major", "Capitão", "Primeiro Tenente", "Segundo Tenente", "Subtenente", "Primeiro Sargento", "Segundo Sargento", "Terceiro Sargento", "Cabo", "Soldado" },
		-- ["Salary"] = { 13000, 10500, 8000, 7800, 7000, 6750, 6000, 5680, 5000, 4300, 4150, 3500, 2800, 2000 },
		["Salary"] = { 30000, 28000, 25000, 23000, 20000, 18750, 16000, 15680, 13000, 11300, 9150, 8500, 7800, 5000 },
		["Service"] = {},
		["Type"] = "Policia",
		["Client"] = true,
		["Pmesp"] = true
	},


	["Prf"] = {
		["Name"] = "Policia Rodoviaria Federal",
		["Parent"] = {
			["Prf"] = true,
		},
		["Hierarchy"] = { [1] = "Comandante Geral", [2] = "Coronel", [3] = "Tenente Coronel", [4] = "Major", "Capitão", [5] = "Primeiro Tenente", [6] = "Segundo Tenente", [7] = "Aspirante a Oficial", [8] = "Terceiro Aluno", [9] = "Segundo Aluno", [10] = "Primeiro Aluno", [11] = "Aluno Csta", [12] = "Subtenente", [13] = "Primeiro Sargento", [14] = "Segundo Sargento", [15] = "Terceiro Sargento", [16] = "Aluno Sargento", [17] = "Cabo", [19] = "Soldado" },
		["Salary"] = { [1] = 9900, [2] = 8200, [3] = 7600, [4] = 7200, [5] = 6800, [6] = 6300, [7] = 4300, [8] = 4300, [9] = 3500, [10] = 4300, [11] = 4150, [12] = 3500, [13] = 3000, [14] = 2700,[15] = 2500, [16] = 2350, [17] = 2250, [18] = 2200, [19] = 2000 },
		["Service"] = {},
		["Type"] = "Policia",
		["Client"] = true
	},
	["Exercito"] = {
		["Name"] = "Forças Armadas",
		["Parent"] = {
			["Exercito"] = true,
		},
		["Hierarchy"] = { 
			"General de Exército",
			"General de Divisão",
			"General de Brigada",
			"Coronel",
			"Tenente Coronel",
			"Major",
			"Capitão",
			"Primeiro Tenente",
			"Segundo Tenente",
			"Aspirante à Oficial",
			"Sub Tenente",
			"Primeiro Sargento",
			"Segundo Sargento",
			"Terceiro Sargento",
			"Cabo",
			"Soldado",
			"Recruta"	
		},
		["Salary"] = {  13471, 12912, 12490, 11451, 11250, 11088, 9135, 8245, 7490, 6993, 6169, 5483, 4770, 3825, 2627, 1852, 956 },
		["Service"] = {},
		["Type"] = "Gov",
		["Client"] = true
	},
	-- Hospital
	["Hospital"] = {
		["Parent"] = {
			["Hospital"] = true
		},
		["Hierarchy"] = { "Diretor","Medico","Paramedico","Enfermeiro" },
		-- ["Salary"] = { 35000,25000,15000,10000 },
		["Salary"] = { 45000,42000,18000,12000 },
		["Service"] = {},
		["Type"] = "Hospital"
	},	-- Bombeiro
	["Bombeiro"] = {
		["Parent"] = {
			["Bombeiro"] = true
		},
		["Hierarchy"] = { "Diretor","Medico","Bombeiro","Enfermeiro" },
		-- ["Salary"] = { 35000,25000,15000,10000 },
		["Salary"] = { 45000,42000,18000,12000 },
		["Service"] = {},
		["Type"] = "Bombeiro"
	},
	-- Mecanica 
	-- ["AutoSport"] = {
	-- 	["Parent"] = {
	-- 		["AutoSport"] = true
	-- 	},
	-- 	["Hierarchy"] = { "Chefe","Gerente","Membro" },
	-- 	-- ["Salary"] = { 12000,8000,6000 },
	-- 	["Salary"] = { 15700,10000,6500 },
	-- 	["Service"] = {},
	-- 	["Type"] = "Mecanica"
	-- },
	["Redline"] = {
		["Parent"] = {
			["Redline"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		-- ["Salary"] = { 12000,8000,6000 },
		["Salary"] = { 15700,10000,6500 },
		["Service"] = {},
		["Type"] = "Mecanica"
	},
	["EastCustoms"] = {
		["Parent"] = {
			["EastCustoms"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		-- ["Salary"] = { 12000,8000,6000 },
		["Salary"] = { 15700,10000,6500 },
		["Service"] = {},
		["Type"] = "Mecanica"
	},
	-- FastFood
	["McDonalds"] = {
		["Parent"] = {
			["McDonalds"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Funcionário" },
		["Service"] = {},
		["Type"] = "FastFood"
	},
	-- Armamento
	["Makiavel"] = {
		["Parent"] = {
			["Makiavel"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Salary"] = { 20000, 15000, 10000, 7500, 5000 },
		["Service"] = {},
		["Type"] = "Armamento"
	},
	["Vaticano"] = {
		["Parent"] = {
			["Vaticano"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Salary"] = { 20000, 15000, 10000, 7500, 5000 },
		["Service"] = {},
		["Type"] = "Armamento"
	},
	["Hotel"] = {
		["Parent"] = {
			["Hotel"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Armamento"
	},
	["Fazenda"] = {
		["Parent"] = {
			["Fazenda"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Armamento"
	},
	-- Municao
	["Vinhedo"] = {
		["Parent"] = {
			["Vinhedo"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Municao"
	},
	["Playboy"] = {
		["Parent"] = {
			["Playboy"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Municao"
	},
	-- Contrabando
	-- ["CidadeLider"] = {
	-- 	["Parent"] = {
	-- 		["CidadeLider"] = true
	-- 	},
	-- 	["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
	-- 	["Service"] = {},
	-- 	["Type"] = "Contrabando"
	-- },
	["Cidadetiradentes"] = {
		["Parent"] = {
			["Cidadetiradentes"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Contrabando"
	},
	["Motoclub"] = {
		["Parent"] = {
			["Motoclub"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Contrabando"
	},
	["Porto"] = {
		["Parent"] = {
			["Porto"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Contrabando"
	},
	-- Lavagem
	["Bololo"] = {
		["Parent"] = {
			["Bololo"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Lavagem"
	},
	["Vanilla"] = {
		["Parent"] = {
			["Vanilla"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Lavagem"
	},
	["Bahamas"] = {
		["Parent"] = {
			["Bahamas"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Lavagem"
	},
	-- Desmanche
	["Harmony"] = {
		["Parent"] = {
			["Harmony"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Desmanche"
	},
	["Beekers"] = {
		["Parent"] = {
			["Beekers"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Desmanche"
	},
-------------------------------------------------------------------------- DROGAS
	["Vilaprudente"] = {
		["Parent"] = {
			["Vilaprudente"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Favela"
	},
	["Capaoredondo"] = {
		["Parent"] = {
			["Capaoredondo"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Favela"
	},
	["Itaquera"] = {
		["Parent"] = {
			["Itaquera"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Favela"
	},
	["Cumbica"] = {
		["Parent"] = {
			["Cumbica"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Favela"
	},

	-- Desmanche
	["China"] = {
		["Parent"] = {
			["China"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Favela"
	},
	["Escocia"] = {
		["Parent"] = {
			["ESCOCIA"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Favela"
	},
	["Turquia"] = {
		["Parent"] = {
			["Turquia"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Favela"
	},
	["Croacia"] = {
		["Parent"] = {
			["Croacia"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Favela"
	},
	["Franca"] = {
		["Parent"] = {
			["Franca"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Favela"
	},
	["Israel"] = {
		["Parent"] = {
			["Israel"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Favela"
	},
	["Brasilandia"] = {
		["Parent"] = {
			["Brasilandia"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Favela"
	},
	["Suecia"] = {
		["Parent"] = {
			["Suecia"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Favela"
	},
	["Pcc"] = {
		["Parent"] = {
			["Pcc"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Salary"] = { 20000, 15000, 10000, 7500, 5000 },
		["Service"] = {},
		["Type"] = "Favela"
	},
}