module.exports = {
	// Informe o token da sua loja. Caso ainda não o tenha acesse https://app.centralcart.com.br/settings/plugin/fivem para obtê-lo
	token: "c0cf964b-a0c3-43f3-9709-a1e0a510ede7",
	framework: "auto",

	commands: {
		vip: "vip", // Comando para ver o tempo restante dos produtos
	},

	game: {
		vehicles_table: "auto",
		homes_table: "auto",
	},

	// Personalize a mensagem que aparecerá para todos os jogadores quando houver alguma venda na loja
	chat: {
		enabled: true,
		message: "{name} comprou {packages} na nossa loja!",
		style: [
			"font-size: 16px",
			"display: flex",
			"align-items: center",
			"padding: 0.7vw",
			"background-image: linear-gradient(to right, #00dc82 3%, rgba(0, 0, 0,0) 95%)",
			"border-radius: 5px",
		],
	},

	// Personalize a notificação que aparecerá para o jogador que fez a compra na loja
	notification: {
		enabled: true,
		type: "default", // Tipos de notificação (https://docs.centralcart.com.br/general/config-cfx#notificacoes)
		content: {
			title: "A compra de {packages} foi concluída!",
			position: "top-right", // Posições (https://docs.centralcart.com.br/general/config-cfx#posicoes-da-notificacao)
		},
	},

	debug: false,
};

// Veja o que significa cada propriedade do arquivo de configuração (https://docs.centralcart.com.br/general/config-cfx)