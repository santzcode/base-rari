Config = {}

Config.Main = {
    cmd = 'org', -- Comando para abrir Painel
    cmdAdm = 'orgadm', -- Comando para abrir Painel ADM
    createAutomaticOrganizations = true,
    storeUrl = 'https://discord.gg/RS4j9e5y', -- Link da Sua Loja
    serverLogo = 'https://i.imgur.com/yDj60WH.png',
    blackList = 3, -- Tempo de black em dias (3 Dia(s))
    clearChestLogs = 15, -- Logs do Bau limpar automaticamente de 15 em 15 dias. ( Evitar consumo da tabela )
}

Config.defaultPermissions = { 
    invite = { -- Permissao Para Convidar
        name = "Convidar",
        description = "Esta permissao permite vc convidar as pessoas para sua facção."
    },
    demote = { -- Permissao Para Rebaixar
        name = "Rebaixar",
        description = "Essa permissão permite que o cargo selecionado rebaixe um cargo inferior."
    }, 
    promote = { -- Permissao Para Promover
        name = "Promover",
        description = "Essa permissão permite que o cargo selecionado promova um cargo."
    }, 
    dismiss = { -- Permissao Para Rebaixar
        name = "Demitir",
        description = "Essa permissão permite que o cargo selecionado demita um cargo inferior."
    }, 
    withdraw = { -- Permissao Para Sacar Dinheiro
        name = "Sacar dinheiro",
        description = "Permite que esse cargo selecionado possa sacar dinheiro do banco da facção."
    }, 
    deposit = { -- Permissao Para Depositar Dinheiro
        name = "Depositar dinheiro",
        description = "Permite que esse cargo selecionado possa depositar dinheiro no banco da facção."
    }, 
    message = { -- Permissao para Escrever nas anotaçoes
        name = "Escrever anotações",
        description = "Permite que esse cargo selecionado possa escrever anotações."
    },
    alerts = { -- Permissao para enviar alertas
        name = "Escrever Alertas",
        description = "Permite que esse cargo selecionado possa enviar alertas para todos jogadores."
    },
    chat = { -- Permissao para Falar no chat
        name = "Escrever no chat",
        description = "Permite que esse cargo selecionado possa se comunicar no chat da facção"
    },
}

Config.Groups = {
    -- ['Admin'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 50000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Founder Admin'] = { prefix = 'Founder', tier = 1 },
    --         ['COO Admin'] = { prefix = 'COO', tier = 2 },
    --         ['Diretor Admin'] = { prefix = 'Diretor', tier = 3 },
    --         ['Supervisor Admin'] = { prefix = 'Supervisor', tier = 4 },
    --         ['Administrador Admin'] = { prefix = 'Administrador', tier = 5 },
    --         ['Moderador Admin'] = { prefix = 'Moderador', tier = 6 },
    --         ['Suporte Admin'] = { prefix = 'Suporte', tier = 7 },
    --         ['Helper Admin'] = { prefix = 'Helper', tier = 8 },
    --         ['SS Admin'] = { prefix = 'SS', tier = 9 },
    --     }
    -- },

    -- ['Pcesp'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 50000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Delegado Pcerj'] = { prefix = 'Delegado', tier = 1 },
    --         ['Investigador Pcerj'] = { prefix = 'Investigador', tier = 2 },
    --         ['Escrivão Pcerj'] = { prefix = 'Escrivão', tier = 3 },
    --         ['Perito Criminal Pcerj'] = { prefix = 'Perito Criminal', tier = 4 },
    --         ['Médico Legista Pcerj'] = { prefix = 'Médico Legista', tier = 5 },
    --         ['Auxiliar de Papiloscopista Pcerj'] = { prefix = 'Auxiliar de Papiloscopista', tier = 6 },
    --     }
    -- },

    -- ['Pmesp'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 50000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Comandante Geral Pmerj'] = { prefix = 'Comandante Geral', tier = 1 },
    --         ['Coronel Pmerj'] = { prefix = 'Coronel', tier = 2 },
    --         ['Tenente Coronel Pmerj'] = { prefix = 'Tenente Coronel', tier = 3 },
    --         ['Major Pmerj'] = { prefix = 'Major', tier = 4 },
    --         ['Capitão Pmerj'] = { prefix = 'Capitão', tier = 5 },
    --         ['Primeiro Tenente Pmerj'] = { prefix = 'Primeiro Tenente', tier = 6 },
    --         ['Segundo Tenente Pmerj'] = { prefix = 'Segundo Tenente', tier = 7 },
    --         ['Aspirante a Oficial Pmerj'] = { prefix = 'Aspirante a Oficial', tier = 8 },
    --         ['Terceiro Aluno Pmerj'] = { prefix = 'Terceiro Aluno', tier = 9 },
    --         ['Segundo Aluno Pmerj'] = { prefix = 'Segundo Aluno', tier = 10 },
    --         ['Primeiro Aluno Pmerj'] = { prefix = 'Primeiro Aluno', tier = 11 },
    --         ['Aluno Csta Pmerj'] = { prefix = 'Aluno Csta', tier = 12 },
    --         ['Subtenente Pmerj'] = { prefix = 'Subtenente', tier = 13 },
    --         ['Primeiro Sargento Pmerj'] = { prefix = 'Primeiro Sargento', tier = 14 },
    --         ['Segundo Sargento Pmerj'] = { prefix = 'Segundo Sargento', tier = 15 },
    --         ['Terceiro Sargento Pmerj'] = { prefix = 'Terceiro Sargento', tier = 16 },
    --         ['Aluno Sargento Pmerj'] = { prefix = 'Aluno Sargento', tier = 17 },
    --         ['Cabo Pmerj'] = { prefix = 'Cabo', tier = 18 },
    --         ['Soldado Pmerj'] = { prefix = 'Soldado', tier = 19 },
    --     }
    -- },

    -- ['1BPChq'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 50000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Coronel Bope'] = { prefix = 'Coronel', tier = 1 },
    --         ['Tenente Coronel Bope'] = { prefix = 'Tenente Coronel', tier = 2 },
    --         ['Major Bope'] = { prefix = 'Major', tier = 3 },
    --         ['Capitão Bope'] = { prefix = 'Capitão', tier = 4 },
    --         ['Primeiro Tenente Bope'] = { prefix = 'Primeiro Tenente', tier = 5 },
    --         ['Segundo Tenente Bope'] = { prefix = 'Segundo Tenente', tier = 6 },
    --         ['Subtenente Bope'] = { prefix = 'Subtenente', tier = 7 },
    --         ['Primeiro Sargento Bope'] = { prefix = 'Primeiro Sargento', tier = 8 },
    --         ['Segundo Sargento Bope'] = { prefix = 'Segundo Sargento', tier = 9 },
    --         ['Terceiro Sargento Bope'] = { prefix = 'Terceiro Sargento', tier = 10 },
    --         ['Cabo Bope'] = { prefix = 'Cabo', tier = 11 },
    --         ['Soldado Bope'] = { prefix = 'Soldado', tier = 12 },
    --     }
    -- },

    -- ['Prf'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 50000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Delegado PoliciaFederal'] = { prefix = 'Delegado', tier = 1 },
    --         ['Perito Criminal PoliciaFederal'] = { prefix = 'Perito Criminal', tier = 2 },
    --         ['Escrivao PoliciaFederal'] = { prefix = 'Escrivao', tier = 3 },
    --         ['COT PoliciaFederal'] = { prefix = 'COT', tier = 4 },
    --         ['Agente PF PoliciaFederal'] = { prefix = 'Agente PF', tier = 5 },
    --     }
    -- },

    -- ['Recom'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 50000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Coronel Recom'] = { prefix = 'Coronel', tier = 1 },
    --         ['Tenente Coronel Recom'] = { prefix = 'Tenente Coronel', tier = 2 },
    --         ['Major Recom'] = { prefix = 'Major', tier = 3 },
    --         ['Capitão Recom'] = { prefix = 'Capitão', tier = 4 },
    --         ['Primeiro Tenente Recom'] = { prefix = 'Primeiro Tenente', tier = 5 },
    --         ['Segundo Tenente Recom'] = { prefix = 'Segundo Tenente', tier = 6 },
    --         ['Subtenente Recom'] = { prefix = 'Subtenente', tier = 7 },
    --         ['Primeiro Sargento Recom'] = { prefix = 'Primeiro Sargento', tier = 8 },
    --         ['Segundo Sargento Recom'] = { prefix = 'Segundo Sargento', tier = 9 },
    --         ['Terceiro Sargento Recom'] = { prefix = 'Terceiro Sargento', tier = 10 },
    --         ['Cabo Recom'] = { prefix = 'Cabo', tier = 11 },
    --         ['Soldado Recom'] = { prefix = 'Soldado', tier = 12 },
    --     }
    -- },

    -- ['Choque'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 50000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Coronel Choque'] = { prefix = 'Coronel', tier = 1 },
    --         ['Tenente Coronel Choque'] = { prefix = 'Tenente Coronel', tier = 2 },
    --         ['Major Choque'] = { prefix = 'Major', tier = 3 },
    --         ['Capitão Choque'] = { prefix = 'Capitão', tier = 4 },
    --         ['Primeiro Tenente Choque'] = { prefix = 'Primeiro Tenente', tier = 5 },
    --         ['Segundo Tenente Choque'] = { prefix = 'Segundo Tenente', tier = 6 },
    --         ['Subtenente Choque'] = { prefix = 'Subtenente', tier = 7 },
    --         ['Primeiro Sargento Choque'] = { prefix = 'Primeiro Sargento', tier = 8 },
    --         ['Segundo Sargento Choque'] = { prefix = 'Segundo Sargento', tier = 9 },
    --         ['Terceiro Sargento Choque'] = { prefix = 'Terceiro Sargento', tier = 10 },
    --         ['Cabo Choque'] = { prefix = 'Cabo', tier = 11 },
    --         ['Soldado Choque'] = { prefix = 'Soldado', tier = 12 },
    --     }
    -- },

    -- ['Core'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 50000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Coronel Core'] = { prefix = 'Coronel', tier = 1 },
    --         ['Tenente Coronel Core'] = { prefix = 'Tenente Coronel', tier = 2 },
    --         ['Major Core'] = { prefix = 'Major', tier = 3 },
    --         ['Capitão Core'] = { prefix = 'Capitão', tier = 4 },
    --         ['Primeiro Tenente Core'] = { prefix = 'Primeiro Tenente', tier = 5 },
    --         ['Segundo Tenente Core'] = { prefix = 'Segundo Tenente', tier = 6 },
    --         ['Subtenente Core'] = { prefix = 'Subtenente', tier = 7 },
    --         ['Primeiro Sargento Core'] = { prefix = 'Primeiro Sargento', tier = 8 },
    --         ['Segundo Sargento Core'] = { prefix = 'Segundo Sargento', tier = 9 },
    --         ['Terceiro Sargento Core'] = { prefix = 'Terceiro Sargento', tier = 10 },
    --         ['Cabo Core'] = { prefix = 'Cabo', tier = 11 },
    --         ['Soldado Core'] = { prefix = 'Soldado', tier = 12 },
    --     }
    -- },

    -- ['Prf'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 50000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Comandante Geral Prf'] = { prefix = 'Comandante Geral', tier = 1 },
    --         ['Coronel Prf'] = { prefix = 'Coronel', tier = 2 },
    --         ['Tenente Coronel Prf'] = { prefix = 'Tenente Coronel', tier = 3 },
    --         ['Major Prf'] = { prefix = 'Major', tier = 4 },
    --         ['Capitão Prf'] = { prefix = 'Capitão', tier = 5 },
    --         ['Primeiro Tenente Prf'] = { prefix = 'Primeiro Tenente', tier = 6 },
    --         ['Segundo Tenente Prf'] = { prefix = 'Segundo Tenente', tier = 7 },
    --         ['Aspirante a Oficial Prf'] = { prefix = 'Aspirante a Oficial', tier = 8 },
    --         ['Terceiro Aluno Prf'] = { prefix = 'Terceiro Aluno', tier = 9 },
    --         ['Segundo Aluno Prf'] = { prefix = 'Segundo Aluno', tier = 10 },
    --         ['Primeiro Aluno Prf'] = { prefix = 'Primeiro Aluno', tier = 11 },
    --         ['Aluno Csta Prf'] = { prefix = 'Aluno Csta', tier = 12 },
    --         ['Subtenente Prf'] = { prefix = 'Subtenente', tier = 13 },
    --         ['Primeiro Sargento Prf'] = { prefix = 'Primeiro Sargento', tier = 14 },
    --         ['Segundo Sargento Prf'] = { prefix = 'Segundo Sargento', tier = 15 },
    --         ['Terceiro Sargento Prf'] = { prefix = 'Terceiro Sargento', tier = 16 },
    --         ['Aluno Sargento Prf'] = { prefix = 'Aluno Sargento', tier = 17 },
    --         ['Cabo Prf'] = { prefix = 'Cabo', tier = 18 },
    --         ['Soldado Prf'] = { prefix = 'Soldado', tier = 19 },
    --     }
    -- },

    -- ['Exercito'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 50000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['General de Exército Exercito'] = { prefix = 'General de Exército', tier = 1 },
    --         ['General de Divisão Exercito'] = { prefix = 'General de Divisão', tier = 2 },
    --         ['General de Brigada Exercito'] = { prefix = 'General de Brigada', tier = 3 },
    --         ['Coronel Exercito'] = { prefix = 'Coronel', tier = 4 },
    --         ['Tenente Coronel Exercito'] = { prefix = 'Tenente Coronel', tier = 5 },
    --         ['Major Exercito'] = { prefix = 'Major', tier = 6 },
    --         ['Capitão Exercito'] = { prefix = 'Capitão', tier = 7 },
    --         ['Primeiro Tenente Exercito'] = { prefix = 'Primeiro Tenente', tier = 8 },
    --         ['Segundo Tenente Exercito'] = { prefix = 'Segundo Tenente', tier = 9 },
    --         ['Aspirante à Oficial Exercito'] = { prefix = 'Aspirante à Oficial', tier = 10 },
    --         ['Sub Tenente Exercito'] = { prefix = 'Sub Tenente', tier = 11 },
    --         ['Primeiro Sargento Exercito'] = { prefix = 'Primeiro Sargento', tier = 12 },
    --         ['Segundo Sargento Exercito'] = { prefix = 'Segundo Sargento', tier = 13 },
    --         ['Terceiro Sargento Exercito'] = { prefix = 'Terceiro Sargento', tier = 14 },
    --         ['Cabo Exercito'] = { prefix = 'Cabo', tier = 15 },
    --         ['Soldado Exercito'] = { prefix = 'Soldado', tier = 16 },
    --         ['Recruta Exercito'] = { prefix = 'Recruta', tier = 17 },
    --     }
    -- },

    -- ['Hospital'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 50000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Diretor Hospital'] = { prefix = 'Diretor', tier = 1 },
    --         ['Medico Hospital'] = { prefix = 'Medico', tier = 2 },
    --         ['Paramedico Hospital'] = { prefix = 'Paramedico', tier = 3 },
    --         ['Enfermeiro Hospital'] = { prefix = 'Enfermeiro', tier = 4 },
    --     }
    -- },

    -- ['AutoSport'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 50000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Dono AutoSport'] = { prefix = 'Dono', tier = 1 },
    --         ['Gerente AutoSport'] = { prefix = 'Gerente', tier = 2 },
    --         ['Mecanico AutoSport'] = { prefix = 'Mecanico', tier = 3 },
    --         ['MecAuxilar AutoSport'] = { prefix = 'MecAuxilar', tier = 4 },
    --     }
    -- },

    ['Redline'] = {
        Config = {
            Salary = {
                active = false,
                amount = 50000,
                time = 10,
            },
            Goals = {
                defaultReward = 0,
                itens = {}
            }
        },
        List = {
            ['Dono Redline'] = { prefix = 'Dono', tier = 1 },
            ['Gerente Redline'] = { prefix = 'Gerente', tier = 2 },
            ['Mecanico Redline'] = { prefix = 'Mecanico', tier = 3 },
            ['MecAuxilar Redline'] = { prefix = 'MecAuxilar', tier = 4 },
        }
    },

    ['EastCustoms'] = {
        Config = {
            Salary = {
                active = false,
                amount = 50000,
                time = 10,
            },
            Goals = {
                defaultReward = 0,
                itens = {}
            }
        },
        List = {
            ['Dono EastCustoms'] = { prefix = 'Dono', tier = 1 },
            ['Gerente EastCustoms'] = { prefix = 'Gerente', tier = 2 },
            ['Mecanico EastCustoms'] = { prefix = 'Mecanico', tier = 3 },
            ['MecAuxilar EastCustoms'] = { prefix = 'MecAuxilar', tier = 4 },
        }
    },

    -- ['Penha'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 50000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Dono Penha'] = { prefix = 'Dono', tier = 1 },
    --         ['Frente Penha'] = { prefix = 'Frente', tier = 2 },
    --         ['Gerente Penha'] = { prefix = 'Gerente', tier = 3 },
    --         ['Vapor Penha'] = { prefix = 'Vapor', tier = 4 },
    --         ['Soldado Penha'] = { prefix = 'Soldado', tier = 5 },
    --         ['Radinho Penha'] = { prefix = 'Radinho', tier = 6 },
    --     }
    -- },

    -- ['Vidigal'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 50000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Dono Vidigal'] = { prefix = 'Dono', tier = 1 },
    --         ['Frente Vidigal'] = { prefix = 'Frente', tier = 2 },
    --         ['Gerente Vidigal'] = { prefix = 'Gerente', tier = 3 },
    --         ['Vapor Vidigal'] = { prefix = 'Vapor', tier = 4 },
    --         ['Soldado Vidigal'] = { prefix = 'Soldado', tier = 5 },
    --         ['Radinho Vidigal'] = { prefix = 'Radinho', tier = 6 },
    --     }
    -- },

    -- ['CidadeAlta'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 50000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Dono CidadeAlta'] = { prefix = 'Dono', tier = 1 },
    --         ['Frente CidadeAlta'] = { prefix = 'Frente', tier = 2 },
    --         ['Gerente CidadeAlta'] = { prefix = 'Gerente', tier = 3 },
    --         ['Vapor CidadeAlta'] = { prefix = 'Vapor', tier = 4 },
    --         ['Soldado CidadeAlta'] = { prefix = 'Soldado', tier = 5 },
    --         ['Radinho CidadeAlta'] = { prefix = 'Radinho', tier = 6 },
    --     }
    -- },

    -- ['Pedreira'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 50000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 5000,
    --             itens = {
    --                 -- Metas para DONO (tier 1)
    --                 {
    --                     tier = 1,
    --                     name = "Meta Diária - Dono",
    --                     description = "Coletar 50x weedbud e 30x sulfuric",
    --                     items = {
    --                         {item = "weedbud", amount = 50},
    --                         {item = "sulfuric", amount = 30}
    --                     },
    --                     reward = 10000,
    --                     rewardType = "money"
    --                 },
    --                 {
    --                     tier = 1,
    --                     name = "Meta Semanal - Dono",
    --                     description = "Coletar 200x weedbud e 100x sulfuric",
    --                     items = {
    --                         {item = "weedbud", amount = 200},
    --                         {item = "sulfuric", amount = 100}
    --                     },
    --                     reward = 50000,
    --                     rewardType = "money"
    --                 },
    --                 -- Metas para FRENTE (tier 2)
    --                 {
    --                     tier = 2,
    --                     name = "Meta Diária - Frente",
    --                     description = "Coletar 30x weedbud e 20x sulfuric",
    --                     items = {
    --                         {item = "weedbud", amount = 30},
    --                         {item = "sulfuric", amount = 20}
    --                     },
    --                     reward = 5000,
    --                     rewardType = "money"
    --                 }
    --             }
    --         }
    --     },
    --     List = {
    --         ['Dono Pedreira'] = { prefix = 'Dono', tier = 1 },
    --         ['Frente Pedreira'] = { prefix = 'Frente', tier = 2 },
    --         ['Gerente Pedreira'] = { prefix = 'Gerente', tier = 3 },
    --         ['Vapor Pedreira'] = { prefix = 'Vapor', tier = 4 },
    --         ['Soldado Pedreira'] = { prefix = 'Soldado', tier = 5 },
    --         ['Radinho Pedreira'] = { prefix = 'Radinho', tier = 6 },
    --     }
    -- },

    -- ['Camara'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 50000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Dono Camara'] = { prefix = 'Dono', tier = 1 },
    --         ['Frente Camara'] = { prefix = 'Frente', tier = 2 },
    --         ['Gerente Camara'] = { prefix = 'Gerente', tier = 3 },
    --         ['Vapor Camara'] = { prefix = 'Vapor', tier = 4 },
    --         ['Soldado Camara'] = { prefix = 'Soldado', tier = 5 },
    --         ['Radinho Camara'] = { prefix = 'Radinho', tier = 6 },
    --     }
    -- },

    -- ['Chapadao'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 50000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Dono Chapadao'] = { prefix = 'Dono', tier = 1 },
    --         ['Frente Chapadao'] = { prefix = 'Frente', tier = 2 },
    --         ['Gerente Chapadao'] = { prefix = 'Gerente', tier = 3 },
    --         ['Vapor Chapadao'] = { prefix = 'Vapor', tier = 4 },
    --         ['Soldado Chapadao'] = { prefix = 'Soldado', tier = 5 },
    --         ['Radinho Chapadao'] = { prefix = 'Radinho', tier = 6 },
    --     }
    -- },

    -- ['3Pontes'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 50000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Dono 3Pontes'] = { prefix = 'Dono', tier = 1 },
    --         ['Frente 3Pontes'] = { prefix = 'Frente', tier = 2 },
    --         ['Gerente 3Pontes'] = { prefix = 'Gerente', tier = 3 },
    --         ['Vapor 3Pontes'] = { prefix = 'Vapor', tier = 4 },
    --         ['Soldado 3Pontes'] = { prefix = 'Soldado', tier = 5 },
    --         ['Radinho 3Pontes'] = { prefix = 'Radinho', tier = 6 },
    --     }
    -- },

    -- ['5Bocas'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 50000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Dono 5Bocas'] = { prefix = 'Dono', tier = 1 },
    --         ['Frente 5Bocas'] = { prefix = 'Frente', tier = 2 },
    --         ['Gerente 5Bocas'] = { prefix = 'Gerente', tier = 3 },
    --         ['Vapor 5Bocas'] = { prefix = 'Vapor', tier = 4 },
    --         ['Soldado 5Bocas'] = { prefix = 'Soldado', tier = 5 },
    --         ['Radinho 5Bocas'] = { prefix = 'Radinho', tier = 6 },
    --     }
    -- },

    -- ['Dick'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 50000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Dono Dick'] = { prefix = 'Dono', tier = 1 },
    --         ['Frente Dick'] = { prefix = 'Frente', tier = 2 },
    --         ['Gerente Dick'] = { prefix = 'Gerente', tier = 3 },
    --         ['Vapor Dick'] = { prefix = 'Vapor', tier = 4 },
    --         ['Soldado Dick'] = { prefix = 'Soldado', tier = 5 },
    --         ['Radinho Dick'] = { prefix = 'Radinho', tier = 6 },
    --     }
    -- },

    -- ['NovaHolanda'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 50000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Dono NovaHolanda'] = { prefix = 'Dono', tier = 1 },
    --         ['Frente NovaHolanda'] = { prefix = 'Frente', tier = 2 },
    --         ['Gerente NovaHolanda'] = { prefix = 'Gerente', tier = 3 },
    --         ['Vapor NovaHolanda'] = { prefix = 'Vapor', tier = 4 },
    --         ['Soldado NovaHolanda'] = { prefix = 'Soldado', tier = 5 },
    --         ['Radinho NovaHolanda'] = { prefix = 'Radinho', tier = 6 },
    --     }
    -- },

    -- ['VJ'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 50000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Dono VJ'] = { prefix = 'Dono', tier = 1 },
    --         ['Frente VJ'] = { prefix = 'Frente', tier = 2 },
    --         ['Gerente VJ'] = { prefix = 'Gerente', tier = 3 },
    --         ['Vapor VJ'] = { prefix = 'Vapor', tier = 4 },
    --         ['Soldado VJ'] = { prefix = 'Soldado', tier = 5 },
    --         ['Radinho VJ'] = { prefix = 'Radinho', tier = 6 },
    --     }
    -- },

    -- ['Fuba'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 50000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Dono Fuba'] = { prefix = 'Dono', tier = 1 },
    --         ['Frente Fuba'] = { prefix = 'Frente', tier = 2 },
    --         ['Gerente Fuba'] = { prefix = 'Gerente', tier = 3 },
    --         ['Vapor Fuba'] = { prefix = 'Vapor', tier = 4 },
    --         ['Soldado Fuba'] = { prefix = 'Soldado', tier = 5 },
    --         ['Radinho Fuba'] = { prefix = 'Radinho', tier = 6 },
    --     }
    -- },

    -- ['Jacare'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 50000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Dono Jacare'] = { prefix = 'Dono', tier = 1 },
    --         ['Frente Jacare'] = { prefix = 'Frente', tier = 2 },
    --         ['Gerente Jacare'] = { prefix = 'Gerente', tier = 3 },
    --         ['Vapor Jacare'] = { prefix = 'Vapor', tier = 4 },
    --         ['Soldado Jacare'] = { prefix = 'Soldado', tier = 5 },
    --         ['Radinho Jacare'] = { prefix = 'Radinho', tier = 6 },
    --     }
    -- },

    -- ['Serrinha'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 50000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Dono Serrinha'] = { prefix = 'Dono', tier = 1 },
    --         ['Frente Serrinha'] = { prefix = 'Frente', tier = 2 },
    --         ['Gerente Serrinha'] = { prefix = 'Gerente', tier = 3 },
    --         ['Vapor Serrinha'] = { prefix = 'Vapor', tier = 4 },
    --         ['Soldado Serrinha'] = { prefix = 'Soldado', tier = 5 },
    --         ['Radinho Serrinha'] = { prefix = 'Radinho', tier = 6 },
    --     }
    -- },

    -- ['Jorgeturco'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 50000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Dono Jorgeturco'] = { prefix = 'Dono', tier = 1 },
    --         ['Frente Jorgeturco'] = { prefix = 'Frente', tier = 2 },
    --         ['Gerente Jorgeturco'] = { prefix = 'Gerente', tier = 3 },
    --         ['Vapor Jorgeturco'] = { prefix = 'Vapor', tier = 4 },
    --         ['Soldado Jorgeturco'] = { prefix = 'Soldado', tier = 5 },
    --         ['Radinho Jorgeturco'] = { prefix = 'Radinho', tier = 6 },
    --     }
    -- },

    -- -- GRUPOS VIP DO VRP
    -- ['VipDesempregado'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 0,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Vip Desempregado'] = { prefix = 'Vip Desempregado', tier = 1 },
    --     }
    -- },

    -- ['VipCLT'] = {
    --     Config = {
    --         Salary = {
    --             active = true,
    --             amount = 810,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Vip CLT'] = { prefix = 'Vip CLT', tier = 1 },
    --     }
    -- },

    -- ['VipEmpreendedor'] = {
    --     Config = {
    --         Salary = {
    --             active = true,
    --             amount = 1134,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Vip Empreendedor'] = { prefix = 'Vip Empreendedor', tier = 1 },
    --     }
    -- },

    -- ['VipAposentado'] = {
    --     Config = {
    --         Salary = {
    --             active = true,
    --             amount = 1350,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Vip Aposentado'] = { prefix = 'Vip Aposentado', tier = 1 },
    --     }
    -- },

    -- ['VipNobre'] = {
    --     Config = {
    --         Salary = {
    --             active = true,
    --             amount = 1590,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Vip Nobre'] = { prefix = 'Vip Nobre', tier = 1 },
    --     }
    -- },

    -- ['VipBarao'] = {
    --     Config = {
    --         Salary = {
    --             active = true,
    --             amount = 1890,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Vip Barão'] = { prefix = 'Vip Barão', tier = 1 },
    --     }
    -- },

    -- ['VipRei/Rainha'] = {
    --     Config = {
    --         Salary = {
    --             active = true,
    --             amount = 2334,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Vip Rei/Rainha'] = { prefix = 'Vip Rei/Rainha', tier = 1 },
    --     }
    -- },

    -- ['VipImperial'] = {
    --     Config = {
    --         Salary = {
    --             active = true,
    --             amount = 2520,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Vip Imperial'] = { prefix = 'Vip Imperial', tier = 1 },
    --     }
    -- },

    -- ['VipRoyalty'] = {
    --     Config = {
    --         Salary = {
    --             active = true,
    --             amount = 3220,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Vip Royalty'] = { prefix = 'Vip Royalty', tier = 1 },
    --     }
    -- },

    -- ['VipBaby'] = {
    --     Config = {
    --         Salary = {
    --             active = true,
    --             amount = 1000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Vip Baby'] = { prefix = 'Vip Baby', tier = 1 },
    --     }
    -- },

    -- -- GRUPOS VIP FACS
    -- ['VipMafia'] = {
    --     Config = {
    --         Salary = {
    --             active = true,
    --             amount = 1325,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Vip Mafia'] = { prefix = 'Vip Mafia', tier = 1 },
    --     }
    -- },

    -- ['VipGangster'] = {
    --     Config = {
    --         Salary = {
    --             active = true,
    --             amount = 1525,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Vip Gangster'] = { prefix = 'Vip Gangster', tier = 1 },
    --     }
    -- },

    -- ['VipChefao'] = {
    --     Config = {
    --         Salary = {
    --             active = true,
    --             amount = 1725,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Vip Chefão'] = { prefix = 'Vip Chefão', tier = 1 },
    --     }
    -- },

    -- -- GRUPOS VIP LEGAL
    -- ['VipPolice'] = {
    --     Config = {
    --         Salary = {
    --             active = true,
    --             amount = 1000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Vip Police'] = { prefix = 'Vip Police', tier = 1 },
    --     }
    -- },

    -- ['VipHospital'] = {
    --     Config = {
    --         Salary = {
    --             active = true,
    --             amount = 1500,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Vip Hospital'] = { prefix = 'Vip Hospital', tier = 1 },
    --     }
    -- },

    -- ['VipMecanica'] = {
    --     Config = {
    --         Salary = {
    --             active = true,
    --             amount = 1500,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Vip Mecânica'] = { prefix = 'Vip Mecânica', tier = 1 },
    --     }
    -- },

    -- -- GRUPOS VIP ESPECIAIS
    -- ['VipApoiador'] = {
    --     Config = {
    --         Salary = {
    --             active = true,
    --             amount = 1350,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Vip Apoiador'] = { prefix = 'Vip Apoiador', tier = 1 },
    --     }
    -- },

    -- ['VipInfluencer'] = {
    --     Config = {
    --         Salary = {
    --             active = true,
    --             amount = 1000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Vip Influencer'] = { prefix = 'Vip Influencer', tier = 1 },
    --     }
    -- },

    -- ['VipBooster'] = {
    --     Config = {
    --         Salary = {
    --             active = true,
    --             amount = 700,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['VipBooster'] = { prefix = 'VipBooster', tier = 1 },
    --     }
    -- },

    -- ['VipHeliVip'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 0,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['VipHeliVip'] = { prefix = 'VipHeliVip', tier = 1 },
    --     }
    -- },

    -- -- GRUPOS EXTRAS
    -- ['Spotify'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 0,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Spotify'] = { prefix = 'Spotify', tier = 1 },
    --     }
    -- },

    -- ['Verificado'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 0,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Verificado'] = { prefix = 'Verificado', tier = 1 },
    --     }
    -- },

    -- ['Premium'] = {
    --     Config = {
    --         Salary = {
    --             active = true,
    --             amount = 1400,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Diamante'] = { prefix = 'Diamante', tier = 1 },
    --         ['Platina'] = { prefix = 'Platina', tier = 2 },
    --         ['Ouro'] = { prefix = 'Ouro', tier = 3 },
    --         ['Prata'] = { prefix = 'Prata', tier = 4 },
    --         ['Bronze'] = { prefix = 'Bronze', tier = 5 },
    --         ['Spotify'] = { prefix = 'Spotify', tier = 6 },
    --     }
    -- },

    -- ['Verify'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 0,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Verify'] = { prefix = 'Verify', tier = 1 },
    --     }
    -- },

    -- -- GRUPOS DE TRABALHO DO VRP (ATUALIZADOS)
    -- ['Police'] = {
    --     Config = {
    --         Salary = {
    --             active = true,
    --             amount = 40000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 2000,
    --             itens = {
    --                 -- Metas para CORONEL (tier 1)
    --                 {
    --                     tier = 1,
    --                     name = "Meta Diária - Coronel",
    --                     description = "Realizar 5 prisões e 3 multas",
    --                     items = {
    --                         {item = "prisoes", amount = 5},
    --                         {item = "multas", amount = 3}
    --                     },
    --                     reward = 15000,
    --                     rewardType = "money"
    --                 },
    --                 {
    --                     tier = 1,
    --                     name = "Meta Semanal - Coronel",
    --                     description = "Realizar 25 prisões e 15 multas",
    --                     items = {
    --                         {item = "prisoes", amount = 25},
    --                         {item = "multas", amount = 15}
    --                     },
    --                     reward = 75000,
    --                     rewardType = "money"
    --                 },
    --                 -- Metas para DELEGADO (tier 2)
    --                 {
    --                     tier = 2,
    --                     name = "Meta Diária - Delegado",
    --                     description = "Realizar 3 prisões e 2 multas",
    --                     items = {
    --                         {item = "prisoes", amount = 3},
    --                         {item = "multas", amount = 2}
    --                     },
    --                     reward = 10000,
    --                     rewardType = "money"
    --                 }
    --             }
    --         }
    --     },
    --     List = {
    --         ['Coronel'] = { prefix = 'Coronel', tier = 1 },
    --         ['Delegado'] = { prefix = 'Delegado', tier = 2 },
    --         ['Prfe'] = { prefix = 'Prfe', tier = 3 },
    --         ['Dip'] = { prefix = 'Dip', tier = 4 },
    --     }
    -- },

    -- -- ['Dip'] = {
    -- --     Config = {
    -- --         Salary = {
    -- --             active = true,
    -- --             amount = 5000,
    -- --             time = 10,
    -- --         },
    -- --         Goals = {
    -- --             defaultReward = 0,
    -- --             itens = {}
    -- --         }
    -- --     },
    -- --     List = {
    -- --         ['Chefe'] = { prefix = 'Chefe', tier = 1 },
    -- --         ['Capitão'] = { prefix = 'Capitão', tier = 2 },
    -- --         ['Tenente'] = { prefix = 'Tenente', tier = 3 },
    -- --         ['Sargento'] = { prefix = 'Sargento', tier = 4 },
    -- --         ['Corporal'] = { prefix = 'Corporal', tier = 5 },
    -- --         ['Oficial'] = { prefix = 'Oficial', tier = 6 },
    -- --         ['Cadete'] = { prefix = 'Cadete', tier = 7 },
    -- --     }
    -- -- },

    -- ['Prfe'] = {
    --     Config = {
    --         Salary = {
    --             active = true,
    --             amount = 5000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Chefe'] = { prefix = 'Chefe', tier = 1 },
    --         ['Capitão'] = { prefix = 'Capitão', tier = 2 },
    --         ['Tenente'] = { prefix = 'Tenente', tier = 3 },
    --         ['Sargento'] = { prefix = 'Sargento', tier = 4 },
    --         ['Corporal'] = { prefix = 'Corporal', tier = 5 },
    --         ['Oficial'] = { prefix = 'Oficial', tier = 6 },
    --         ['Cadete'] = { prefix = 'Cadete', tier = 7 },
    --     }
    -- },

    -- ['Paramedic'] = {
    --     Config = {
    --         Salary = {
    --             active = true,
    --             amount = 5000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 1500,
    --             itens = {
    --                 -- Metas para DOUTOR (tier 1)
    --                 {
    --                     tier = 1,
    --                     name = "Meta Diária - Doutor",
    --                     description = "Atender 8 pacientes e usar 5 kits médicos",
    --                     items = {
    --                         {item = "pacientes_atendidos", amount = 8},
    --                         {item = "kit_medico", amount = 5}
    --                     },
    --                     reward = 12000,
    --                     rewardType = "money"
    --                 },
    --                 {
    --                     tier = 1,
    --                     name = "Meta Semanal - Doutor",
    --                     description = "Atender 40 pacientes e usar 25 kits médicos",
    --                     items = {
    --                         {item = "pacientes_atendidos", amount = 40},
    --                         {item = "kit_medico", amount = 25}
    --                     },
    --                     reward = 60000,
    --                     rewardType = "money"
    --                 },
    --                 -- Metas para CONSELHEIRO (tier 2)
    --                 {
    --                     tier = 2,
    --                     name = "Meta Diária - Conselheiro",
    --                     description = "Atender 5 pacientes e usar 3 kits médicos",
    --                     items = {
    --                         {item = "pacientes_atendidos", amount = 5},
    --                         {item = "kit_medico", amount = 3}
    --                     },
    --                     reward = 8000,
    --                     rewardType = "money"
    --                 }
    --             }
    --         }
    --     },
    --     List = {
    --         ['Doutor'] = { prefix = 'Doutor', tier = 1 },
    --         ['Conselheiro'] = { prefix = 'Conselheiro', tier = 2 },
    --         ['Médico'] = { prefix = 'Médico', tier = 3 },
    --     }
    -- },

    -- ['Juridic'] = {
    --     Config = {
    --         Salary = {
    --             active = true,
    --             amount = 8000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Juiz'] = { prefix = 'Juiz', tier = 1 },
    --         ['Promotor'] = { prefix = 'Promotor', tier = 2 },
    --         ['Advogado'] = { prefix = 'Advogado', tier = 3 },
    --     }
    -- },

    -- ['Mechanic'] = {
    --     Config = {
    --         Salary = {
    --             active = true,
    --             amount = 5000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 1000,
    --             itens = {
    --                 -- Metas para CHEFE (tier 1)
    --                 {
    --                     tier = 1,
    --                     name = "Meta Diária - Chefe",
    --                     description = "Reparar 10 veículos e usar 15 peças",
    --                     items = {
    --                         {item = "veiculos_reparados", amount = 10},
    --                         {item = "pecas_usadas", amount = 15}
    --                     },
    --                     reward = 10000,
    --                     rewardType = "money"
    --                 },
    --                 {
    --                     tier = 1,
    --                     name = "Meta Semanal - Chefe",
    --                     description = "Reparar 50 veículos e usar 75 peças",
    --                     items = {
    --                         {item = "veiculos_reparados", amount = 50},
    --                         {item = "pecas_usadas", amount = 75}
    --                     },
    --                     reward = 50000,
    --                     rewardType = "money"
    --                 },
    --                 -- Metas para SUB-CHEFE (tier 2)
    --                 {
    --                     tier = 2,
    --                     name = "Meta Diária - Sub-Chefe",
    --                     description = "Reparar 6 veículos e usar 10 peças",
    --                     items = {
    --                         {item = "veiculos_reparados", amount = 6},
    --                         {item = "pecas_usadas", amount = 10}
    --                     },
    --                     reward = 7000,
    --                     rewardType = "money"
    --                 }
    --             }
    --         }
    --     },
    --     List = {
    --         ['Chefe'] = { prefix = 'Chefe', tier = 1 },
    --         ['Sub-Chefe'] = { prefix = 'Sub-Chefe', tier = 2 },
    --         ['Gerente'] = { prefix = 'Gerente', tier = 3 },
    --         ['Mêcanico'] = { prefix = 'Mêcanico', tier = 4 },
    --         ['Borracheiro'] = { prefix = 'Borracheiro', tier = 5 },
    --     }
    -- },

    -- ['Mecanica01'] = {
    --     Config = {
    --         Salary = {
    --             active = true,
    --             amount = 5000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Chefe'] = { prefix = 'Chefe', tier = 1 },
    --         ['Sub-Chefe'] = { prefix = 'Sub-Chefe', tier = 2 },
    --         ['Gerente'] = { prefix = 'Gerente', tier = 3 },
    --         ['Mêcanico'] = { prefix = 'Mêcanico', tier = 4 },
    --         ['Borracheiro'] = { prefix = 'Borracheiro', tier = 5 },
    --     }
    -- },

    -- ['Mecanica02'] = {
    --     Config = {
    --         Salary = {
    --             active = true,
    --             amount = 5000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Chefe'] = { prefix = 'Chefe', tier = 1 },
    --         ['Sub-Chefe'] = { prefix = 'Sub-Chefe', tier = 2 },
    --         ['Gerente'] = { prefix = 'Gerente', tier = 3 },
    --         ['Mêcanico'] = { prefix = 'Mêcanico', tier = 4 },
    --         ['Borracheiro'] = { prefix = 'Borracheiro', tier = 5 },
    --     }
    -- },

    -- ['BurgerShot'] = {
    --     Config = {
    --         Salary = {
    --             active = true,
    --             amount = 4000,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Chefe'] = { prefix = 'Chefe', tier = 1 },
    --         ['Sub-Chefe'] = { prefix = 'Sub-Chefe', tier = 2 },
    --         ['Gerente'] = { prefix = 'Gerente', tier = 3 },
    --         ['Conselheiro'] = { prefix = 'Conselheiro', tier = 4 },
    --         ['Membro'] = { prefix = 'Membro', tier = 5 },
    --     }
    -- },

    -- ['Vanilla'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 0,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Chefe'] = { prefix = 'Chefe', tier = 1 },
    --         ['Sub-Chefe'] = { prefix = 'Sub-Chefe', tier = 2 },
    --         ['Gerente'] = { prefix = 'Gerente', tier = 3 },
    --         ['Conselheiro'] = { prefix = 'Conselheiro', tier = 4 },
    --         ['Membro'] = { prefix = 'Membro', tier = 5 },
    --     }
    -- },

    -- ['Vagos'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 0,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Chefe'] = { prefix = 'Chefe', tier = 1 },
    --         ['Sub-Chefe'] = { prefix = 'Sub-Chefe', tier = 2 },
    --         ['Gerente'] = { prefix = 'Gerente', tier = 3 },
    --         ['Conselheiro'] = { prefix = 'Conselheiro', tier = 4 },
    --         ['Membro'] = { prefix = 'Membro', tier = 5 },
    --     }
    -- },

    -- ['Bloods'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 0,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Chefe'] = { prefix = 'Chefe', tier = 1 },
    --         ['Sub-Chefe'] = { prefix = 'Sub-Chefe', tier = 2 },
    --         ['Gerente'] = { prefix = 'Gerente', tier = 3 },
    --         ['Conselheiro'] = { prefix = 'Conselheiro', tier = 4 },
    --         ['Membro'] = { prefix = 'Membro', tier = 5 },
    --     }
    -- },

    -- ['Qg01'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 0,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Chefe'] = { prefix = 'Chefe', tier = 1 },
    --         ['Sub-Chefe'] = { prefix = 'Sub-Chefe', tier = 2 },
    --         ['Gerente'] = { prefix = 'Gerente', tier = 3 },
    --         ['Traficante'] = { prefix = 'Traficante', tier = 4 },
    --         ['Vapo'] = { prefix = 'Vapo', tier = 5 },
    --         ['Morador'] = { prefix = 'Morador', tier = 6 },
    --     }
    -- },

    -- ['Qg02'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 0,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Chefe'] = { prefix = 'Chefe', tier = 1 },
    --         ['Sub-Chefe'] = { prefix = 'Sub-Chefe', tier = 2 },
    --         ['Gerente'] = { prefix = 'Gerente', tier = 3 },
    --         ['Traficante'] = { prefix = 'Traficante', tier = 4 },
    --         ['Vapo'] = { prefix = 'Vapo', tier = 5 },
    --         ['Morador'] = { prefix = 'Morador', tier = 6 },
    --     }
    -- },

    -- ['Desmanche01'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 0,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Chefe'] = { prefix = 'Chefe', tier = 1 },
    --         ['Sub-Chefe'] = { prefix = 'Sub-Chefe', tier = 2 },
    --         ['Gerente'] = { prefix = 'Gerente', tier = 3 },
    --         ['Traficante'] = { prefix = 'Traficante', tier = 4 },
    --         ['Vapo'] = { prefix = 'Vapo', tier = 5 },
    --         ['Morador'] = { prefix = 'Morador', tier = 6 },
    --     }
    -- },

    -- ['Mafia'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 0,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Chefe'] = { prefix = 'Chefe', tier = 1 },
    --         ['Sub-Chefe'] = { prefix = 'Sub-Chefe', tier = 2 },
    --         ['Gerente'] = { prefix = 'Gerente', tier = 3 },
    --         ['Conselheiro'] = { prefix = 'Conselheiro', tier = 4 },
    --         ['Membro'] = { prefix = 'Membro', tier = 5 },
    --     }
    -- },

    -- ['Triads'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 0,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Chefe'] = { prefix = 'Chefe', tier = 1 },
    --         ['Sub-Chefe'] = { prefix = 'Sub-Chefe', tier = 2 },
    --         ['Gerente'] = { prefix = 'Gerente', tier = 3 },
    --         ['Conselheiro'] = { prefix = 'Conselheiro', tier = 4 },
    --         ['Membro'] = { prefix = 'Membro', tier = 5 },
    --     }
    -- },

    -- ['Lester'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 0,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Chefe'] = { prefix = 'Chefe', tier = 1 },
    --         ['Sub-Chefe'] = { prefix = 'Sub-Chefe', tier = 2 },
    --         ['Gerente'] = { prefix = 'Gerente', tier = 3 },
    --         ['Conselheiro'] = { prefix = 'Conselheiro', tier = 4 },
    --         ['Membro'] = { prefix = 'Membro', tier = 5 },
    --     }
    -- },

    -- ['Emergency'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 0,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Chefe'] = { prefix = 'Chefe', tier = 1 },
    --     }
    -- },

    -- ['Restaurants'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 0,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Chefe'] = { prefix = 'Chefe', tier = 1 },
    --     }
    -- },

    -- -- FAVELAS DO VRP
    -- ['Favela01'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 0,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 3000,
    --             itens = {
    --                 -- Metas para CHEFE (tier 1)
    --                 {
    --                     tier = 1,
    --                     name = "Meta Diária - Chefe",
    --                     description = "Coletar 40x weedbud e 25x sulfuric",
    --                     items = {
    --                         {item = "weedbud", amount = 40},
    --                         {item = "sulfuric", amount = 25}
    --                     },
    --                     reward = 8000,
    --                     rewardType = "money"
    --                 },
    --                 {
    --                     tier = 1,
    --                     name = "Meta Semanal - Chefe",
    --                     description = "Coletar 150x weedbud e 80x sulfuric",
    --                     items = {
    --                         {item = "weedbud", amount = 150},
    --                         {item = "sulfuric", amount = 80}
    --                     },
    --                     reward = 40000,
    --                     rewardType = "money"
    --                 },
    --                 -- Metas para SUB-CHEFE (tier 2)
    --                 {
    --                     tier = 2,
    --                     name = "Meta Diária - Sub-Chefe",
    --                     description = "Coletar 25x weedbud e 15x sulfuric",
    --                     items = {
    --                         {item = "weedbud", amount = 25},
    --                         {item = "sulfuric", amount = 15}
    --                     },
    --                     reward = 5000,
    --                     rewardType = "money"
    --                 }
    --             }
    --         }
    --     },
    --     List = {
    --         ['Chefe'] = { prefix = 'Chefe', tier = 1 },
    --         ['Sub-Chefe'] = { prefix = 'Sub-Chefe', tier = 2 },
    --         ['Gerente'] = { prefix = 'Gerente', tier = 3 },
    --         ['Traficante'] = { prefix = 'Traficante', tier = 4 },
    --         ['Vapo'] = { prefix = 'Vapo', tier = 5 },
    --         ['Morador'] = { prefix = 'Morador', tier = 6 },
    --     }
    -- },

    -- ['Favela02'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 0,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Chefe'] = { prefix = 'Chefe', tier = 1 },
    --         ['Sub-Chefe'] = { prefix = 'Sub-Chefe', tier = 2 },
    --         ['Gerente'] = { prefix = 'Gerente', tier = 3 },
    --         ['Traficante'] = { prefix = 'Traficante', tier = 4 },
    --         ['Vapo'] = { prefix = 'Vapo', tier = 5 },
    --         ['Morador'] = { prefix = 'Morador', tier = 6 },
    --     }
    -- },

    -- ['Favela03'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 0,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Chefe'] = { prefix = 'Chefe', tier = 1 },
    --         ['Sub-Chefe'] = { prefix = 'Sub-Chefe', tier = 2 },
    --         ['Gerente'] = { prefix = 'Gerente', tier = 3 },
    --         ['Traficante'] = { prefix = 'Traficante', tier = 4 },
    --         ['Vapo'] = { prefix = 'Vapo', tier = 5 },
    --         ['Morador'] = { prefix = 'Morador', tier = 6 },
    --     }
    -- },

    -- ['Favela04'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 0,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Chefe'] = { prefix = 'Chefe', tier = 1 },
    --         ['Sub-Chefe'] = { prefix = 'Sub-Chefe', tier = 2 },
    --         ['Gerente'] = { prefix = 'Gerente', tier = 3 },
    --         ['Traficante'] = { prefix = 'Traficante', tier = 4 },
    --         ['Vapo'] = { prefix = 'Vapo', tier = 5 },
    --         ['Morador'] = { prefix = 'Morador', tier = 6 },
    --     }
    -- },

    -- ['Favela05'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 0,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Chefe'] = { prefix = 'Chefe', tier = 1 },
    --         ['Sub-Chefe'] = { prefix = 'Sub-Chefe', tier = 2 },
    --         ['Gerente'] = { prefix = 'Gerente', tier = 3 },
    --         ['Traficante'] = { prefix = 'Traficante', tier = 4 },
    --         ['Vapo'] = { prefix = 'Vapo', tier = 5 },
    --         ['Morador'] = { prefix = 'Morador', tier = 6 },
    --     }
    -- },

    -- ['Favela06'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 0,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Chefe'] = { prefix = 'Chefe', tier = 1 },
    --         ['Sub-Chefe'] = { prefix = 'Sub-Chefe', tier = 2 },
    --         ['Gerente'] = { prefix = 'Gerente', tier = 3 },
    --         ['Traficante'] = { prefix = 'Traficante', tier = 4 },
    --         ['Vapo'] = { prefix = 'Vapo', tier = 5 },
    --         ['Morador'] = { prefix = 'Morador', tier = 6 },
    --     }
    -- },

    -- ['Favela07'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 0,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Chefe'] = { prefix = 'Chefe', tier = 1 },
    --         ['Sub-Chefe'] = { prefix = 'Sub-Chefe', tier = 2 },
    --         ['Gerente'] = { prefix = 'Gerente', tier = 3 },
    --         ['Traficante'] = { prefix = 'Traficante', tier = 4 },
    --         ['Vapo'] = { prefix = 'Vapo', tier = 5 },
    --         ['Morador'] = { prefix = 'Morador', tier = 6 },
    --     }
    -- },

    -- ['Favela08'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 0,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Chefe'] = { prefix = 'Chefe', tier = 1 },
    --         ['Sub-Chefe'] = { prefix = 'Sub-Chefe', tier = 2 },
    --         ['Gerente'] = { prefix = 'Gerente', tier = 3 },
    --         ['Traficante'] = { prefix = 'Traficante', tier = 4 },
    --         ['Vapo'] = { prefix = 'Vapo', tier = 5 },
    --         ['Morador'] = { prefix = 'Morador', tier = 6 },
    --     }
    -- },

    -- ['Favela09'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 0,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Chefe'] = { prefix = 'Chefe', tier = 1 },
    --         ['Sub-Chefe'] = { prefix = 'Sub-Chefe', tier = 2 },
    --         ['Gerente'] = { prefix = 'Gerente', tier = 3 },
    --         ['Traficante'] = { prefix = 'Traficante', tier = 4 },
    --         ['Vapo'] = { prefix = 'Vapo', tier = 5 },
    --         ['Morador'] = { prefix = 'Morador', tier = 6 },
    --     }
    -- },

    -- ['Favela10'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 0,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Chefe'] = { prefix = 'Chefe', tier = 1 },
    --         ['Sub-Chefe'] = { prefix = 'Sub-Chefe', tier = 2 },
    --         ['Gerente'] = { prefix = 'Gerente', tier = 3 },
    --         ['Traficante'] = { prefix = 'Traficante', tier = 4 },
    --         ['Vapo'] = { prefix = 'Vapo', tier = 5 },
    --         ['Morador'] = { prefix = 'Morador', tier = 6 },
    --     }
    -- },

    -- ['Favela11'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 0,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Chefe'] = { prefix = 'Chefe', tier = 1 },
    --         ['Sub-Chefe'] = { prefix = 'Sub-Chefe', tier = 2 },
    --         ['Gerente'] = { prefix = 'Gerente', tier = 3 },
    --         ['Traficante'] = { prefix = 'Traficante', tier = 4 },
    --         ['Vapo'] = { prefix = 'Vapo', tier = 5 },
    --         ['Morador'] = { prefix = 'Morador', tier = 6 },
    --     }
    -- },

    -- ['Favela12'] = {
    --     Config = {
    --         Salary = {
    --             active = false,
    --             amount = 0,
    --             time = 10,
    --         },
    --         Goals = {
    --             defaultReward = 0,
    --             itens = {}
    --         }
    --     },
    --     List = {
    --         ['Chefe'] = { prefix = 'Chefe', tier = 1 },
    --         ['Sub-Chefe'] = { prefix = 'Sub-Chefe', tier = 2 },
    --         ['Gerente'] = { prefix = 'Gerente', tier = 3 },
    --         ['Traficante'] = { prefix = 'Traficante', tier = 4 },
    --         ['Vapo'] = { prefix = 'Vapo', tier = 5 },
    --         ['Morador'] = { prefix = 'Morador', tier = 6 },
    --     }
    -- },


    ['Cidadetiradentes'] = {
        Config = {
            Salary = {
                active = false,
                amount = 0,
                time = 10,
            },
            Goals = {
                defaultReward = 0,
                itens = {}
            }
        },
        List = {
            ['Chefe'] = { prefix = 'Chefe', tier = 1 },
            ['Sub-Chefe'] = { prefix = 'Sub-Chefe', tier = 2 },
            ['Gerente'] = { prefix = 'Gerente', tier = 3 },
            ['Conselheiro'] = { prefix = 'Conselheiro', tier = 4 },
            ['Membro'] = { prefix = 'Membro', tier = 5 },
        }
    },

    ['Capaoredondo'] = {
        Config = {
            Salary = {
                active = false,
                amount = 0,
                time = 10,
            },
            Goals = {
                defaultReward = 0,
                itens = {}
            }
        },
        List = {
            ['Chefe'] = { prefix = 'Chefe', tier = 1 },
            ['Sub-Chefe'] = { prefix = 'Sub-Chefe', tier = 2 },
            ['Gerente'] = { prefix = 'Gerente', tier = 3 },
            ['Conselheiro'] = { prefix = 'Conselheiro', tier = 4 },
            ['Membro'] = { prefix = 'Membro', tier = 5 },
        }
    },

    ['Pcc'] = {
        Config = {
            Salary = {
                active = false,
                amount = 0,
                time = 10,
            },
            Goals = {
                defaultReward = 0,
                itens = {}
            }
        },
        List = {
            ['Chefe'] = { prefix = 'Chefe', tier = 1 },
            ['Sub-Chefe'] = { prefix = 'Sub-Chefe', tier = 2 },
            ['Gerente'] = { prefix = 'Gerente', tier = 3 },
            ['Conselheiro'] = { prefix = 'Conselheiro', tier = 4 },
            ['Membro'] = { prefix = 'Membro', tier = 5 },
        }
    },

    ['Brasilandia'] = {
        Config = {
            Salary = {
                active = false,
                amount = 0,
                time = 10,
            },
            Goals = {
                defaultReward = 0,
                itens = {}
            }
        },
        List = {
            ['Chefe'] = { prefix = 'Chefe', tier = 1 },
            ['Sub-Chefe'] = { prefix = 'Sub-Chefe', tier = 2 },
            ['Gerente'] = { prefix = 'Gerente', tier = 3 },
            ['Conselheiro'] = { prefix = 'Conselheiro', tier = 4 },
            ['Membro'] = { prefix = 'Membro', tier = 5 },
        }
    },

    ['China'] = {
        Config = {
            Salary = {
                active = false,
                amount = 0,
                time = 10,
            },
            Goals = {
                defaultReward = 0,
                itens = {}
            }
        },
        List = {
            ['Chefe'] = { prefix = 'Chefe', tier = 1 },
            ['Sub-Chefe'] = { prefix = 'Sub-Chefe', tier = 2 },
            ['Gerente'] = { prefix = 'Gerente', tier = 3 },
            ['Conselheiro'] = { prefix = 'Conselheiro', tier = 4 },
            ['Membro'] = { prefix = 'Membro', tier = 5 },
        }
    },

    ['Makiavel'] = {
        Config = {
            Salary = {
                active = false,
                amount = 0,
                time = 10,
            },
            Goals = {
                defaultReward = 0,
                itens = {}
            }
        },
        List = {
            ['Chefe'] = { prefix = 'Chefe', tier = 1 },
            ['Sub-Chefe'] = { prefix = 'Sub-Chefe', tier = 2 },
            ['Gerente'] = { prefix = 'Gerente', tier = 3 },
            ['Conselheiro'] = { prefix = 'Conselheiro', tier = 4 },
            ['Membro'] = { prefix = 'Membro', tier = 5 },
        }
    },

    ['Beekers'] = {
        Config = {
            Salary = {
                active = false,
                amount = 0,
                time = 10,
            },
            Goals = {
                defaultReward = 0,
                itens = {}
            }
        },
        List = {
            ['Chefe'] = { prefix = 'Chefe', tier = 1 },
            ['Sub-Chefe'] = { prefix = 'Sub-Chefe', tier = 2 },
            ['Gerente'] = { prefix = 'Gerente', tier = 3 },
            ['Conselheiro'] = { prefix = 'Conselheiro', tier = 4 },
            ['Membro'] = { prefix = 'Membro', tier = 5 },
        }
    },

    ['Vaticano'] = {
        Config = {
            Salary = {
                active = false,
                amount = 0,
                time = 10,
            },
            Goals = {
                defaultReward = 0,
                itens = {}
            }
        },
        List = {
            ['Chefe'] = { prefix = 'Chefe', tier = 1 },
            ['Sub-Chefe'] = { prefix = 'Sub-Chefe', tier = 2 },
            ['Gerente'] = { prefix = 'Gerente', tier = 3 },
            ['Conselheiro'] = { prefix = 'Conselheiro', tier = 4 },
            ['Membro'] = { prefix = 'Membro', tier = 5 },
        }
    },
}

Config.Langs = {
    ['offlinePlayer'] = function(source) TriggerClientEvent("Notify", source,"vermelho","Este jogador não está online.",5000) end,
    ['alreadyFaction'] = function(source) TriggerClientEvent("Notify", source,"vermelho","Este jogador já esta em uma organização.",5000)  end,
    ['alreadyBlacklist'] = function(source) TriggerClientEvent("Notify", source,"vermelho","Você está na black-list, não pode receber convites.",5000)  end,
    ['alreadyUserBlacklist'] = function(source) TriggerClientEvent("Notify",source,"vermelho","Este jogador está em black-list.",5000)  end,
    ['sendInvite'] = function(source) TriggerClientEvent("Notify",source,"verde","Você enviou o convite.",5000)  end,
    ['acceptInvite'] = function(source) TriggerClientEvent("Notify",source,"verde","Você aceitou o convite.",5000) end,
    ['acceptedInvite'] = function(source, ply_id) TriggerClientEvent("Notify",source,"verde","O "..ply_id.." aceitou o convite. ",5000) end,
    ['bestTier'] = function(source) TriggerClientEvent("Notify",source,"vermelho","Você não pode fazer isso com alguem com um cargo igual ou maior que o seu.",5000)   end,
    ['youPromoved'] = function(source) TriggerClientEvent("Notify",source,"verde","Você foi promovido.",5000)  end,
    ['youPromovedUser'] = function(source, ply_id, group) TriggerClientEvent("Notify",source,"verde","Você promoveu o ID: "..ply_id.." para "..group..".",5000) end,
    ['youDemote'] = function(source) TriggerClientEvent("Notify",source,"verde","Você foi rebaixado.",5000)  end,
    ['youDemoteUser'] = function(source, ply_id, group) TriggerClientEvent("Notify",source,"verde","Você rebaixou o ID: "..ply_id.." para ".. group ..".",5000) end,
    ['youDismiss'] = function(source) TriggerClientEvent("Notify",source,"verde","Você foi demitido de sua organização .",5000)  end,
    ['youDismissUser'] = function(source, ply_id) TriggerClientEvent("Notify", source,"verde","Você demitiu o ID "..ply_id.." .",5000)  end,
    ['waitCooldown'] = function(source) TriggerClientEvent("Notify",source,"vermelho","Aguarde para fazer isso..",5000) end,
    ['bankNotMoney'] = function(source) TriggerClientEvent("Notify",source,"vermelho","O Banco da organização não possui essa quantia.",5000)  end,
    ['rewardedGoal'] = function(source, amount) TriggerClientEvent("Notify",source,"verde","Você resgatou sua meta diaria e recebeu <b>R$ "..amount.."</b> por isso.",5000) end,
    ['notPermission'] = function(source) TriggerClientEvent("Notify",source,"vermelho","Você não possui permissão.",5000)  end,
    ['notMoneyDeposit'] = function(source) TriggerClientEvent("Notify",source,"vermelho","Você não possui dinheiro para depositar.",5000)  end,
    ['alreadyGoal'] = function(source) TriggerClientEvent("Notify",source,"vermelho","Você não possui mais nenhum item do farm pare receber recompensa.",5000)  end,
    ['doesntHaveGoals'] = function(source) TriggerClientEvent("Notify",source,"vermelho","Você não possui items suficientes para isso.",5000)  end,
    ['doesntHaveMinimumGoals'] = function(source, ItemName, ItemAmount) TriggerClientEvent("Notify",source,"vermelho","Você precisa de "..ItemName.." "..ItemAmount.."x para obter o prêmio selecionado.",5000)  end,
    ['bankMetaComplete'] = function(source, amount) TriggerClientEvent("Notify",source,"verde","Você completou a meta diária com sucesso!, dinheiro recebido: "..amount..".",5000)  end

}

if SERVER then
    -- CAPTURAR GRUPOS COM JOGADOR OFFLINE
    function getUserGroups(user_id)
        local ReturnData = {}

        local Groups = vRP.Groups()
        for Permission,_ in pairs(Groups) do
            local Data = vRP.DataGroups(Permission)
            if Data[user_id] then
                ReturnData[#ReturnData+1] = Permission
            end
        end

        return ReturnData
    end

    -- SETAR GRUPO COM JOGADOR OFFLINE
    function updateUserGroups(user_id, groups)
        local ReturnData = {}

        local GroupsRem = vRP.Groups()
        for Permission,_ in pairs(GroupsRem) do
            local Data = vRP.DataGroups(Permission)
            if Data[user_id] then
                vRP.RemovePermission(user_id,Permission)
            end
        end

        for Permission,_ in pairs(groups) do
            vRP.SetPermission(user_id,Permission,false,false)
        end
    end

    -- PEGAR DINHEIRO DO BANCO DO JOGADOR
    function getBankMoney(user_id)
        return vRP.GetBank(user_id)
    end

    -- IDENTIDADE
    function getUserIdentity(user_id)
        local identity = vRP.Identity(user_id)
        if identity then
            if identity.name then
                identity.name = identity.name
                identity.firstname = identity.name2
            end
        end

        return identity
    end

    function getUserSource(user_id)
        return vRP.Source(user_id)
    end

    function getUserId(source)
        return vRP.Passport(source)
    end

    function getUsers()
        --user_id,source
        return vRP.Players()
    end

    function getAmountPermission(Permission, Index)
        local ReturnAmount = 0

        -- Dá pra mudar a lógica apenas pondo: Hierarchy == Index, se hierarquia for igual ao index, ou seja o amount só aumenta se a hierarquia for a mesma que a função pede
        local Data = vRP.DataGroups(Permission)
        for Passport,Hierarchy in pairs(Data) do
            if Index then
                if Hierarchy <= Index then
                    ReturnAmount = ReturnAmount + 1
                end
            else
                ReturnAmount = ReturnAmount + 1
            end
        end

        return ReturnAmount
    end

    function getUserMyGroups(user_id)
        local ReturnData = {}

        local Groups = vRP.Groups()
        for Permission,_ in pairs(Groups) do
            local Data = vRP.DataGroups(Permission)
            if Data[user_id] then
                ReturnData[#ReturnData+1] = Permission
            end
        end

        return ReturnData
    end

    function hasGroup(user_id, group)
        return vRP.HasGroup(user_id, group)
    end

    function addUserGroup(user_id, group, tier)
        return vRP.SetPermission(user_id, group, tier, false)
    end

    function tryFullPayment(user_id, amount)
        return vRP.PaymentFull(user_id, amount)
    end

    function giveBankMoney(user_id, amount)
        if user_id and amount and tonumber(amount) then 
            return vRP.GiveBank(user_id, amount)
        end
    end

    function getBankMoney(user_id)
        return vRP.GetBank(user_id)
    end

    function getItemName(item)
        return itemName(item) or item
    end

    function request(source, text, time)
        return vRP.Request(source, text)
    end

    function removeUserGroup(user_id, group)
        return vRP.RemovePermission(user_id, group)
    end

   
    RegisterCommand('blacklist', function(source,args)
        local user_id = getUserId(source)
        if not user_id then return end

        local ply_id = tonumber(args[1])
        if not ply_id then return end

        if vRP.HasPermission(user_id,"Admin", 1) then
            TriggerClientEvent("Notify", source, "verde","Você removeu a blacklist do ID: "..ply_id..".",5000) 
            BLACKLIST:remUser(ply_id)
        end
    end)

    AddEventHandler('CharacterChosen', function(user_id, source)
        TriggerEvent('five_orgs_v2:playerSpawn', user_id, source)
    end)

    AddEventHandler('Disconnect', function(user_id)
        TriggerEvent('five_orgs_v2:playerLeave', user_id)
    end)
end


--[[ 
    Como Utilizar EXPORT de Guardar / Retirar Item no Bau:
    ( Colocar Esse EXPORT na função de retirar/guardar item de seu inventario)
    
    user_id: user_id, -- ID Do Jogador,
    action: withdraw or deposit, -- Ação que foi feita Retirou/Depositou
    item: item, -- Spawn do item que foi retirado/guardado.
    amount: quantidade, -- Quantidade do item que foi depositada/retirada

    EXPORT: 
    exports.five_orgs_v2:addLogChest(user_id, action, item, amount)
]]

--[[ 
    Como Utilizar EXPORT De METAS DIARIAS:
    ( Colocar esse EXPORT na função de Guardar Itens no Armazem ou Coletar Itens no Farm )

    user_id: user_id, -- ID Do Jogador,
    item: item, -- Spawn do item que foi guardado/farmado.
    amount: quantidade, -- Quantidade do item que foi guardada/farmada.

    EXPORT: 
    exports.five_orgs_v2:addGoal(user_id, item, amount)
]]