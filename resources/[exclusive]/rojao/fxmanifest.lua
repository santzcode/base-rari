fx_version 'cerulean'
game 'gta5'

author 'FrancaDev'
description 'Fogos de Artifício'
version '2.0'

ui_page 'web-side/index.html'

dependency 'vrp'

client_scripts {
	"@vrp/config/Native.lua",
	"@vrp/lib/Utils.lua",
	"client-side/*"
}

server_scripts {
	"@vrp/config/Item.lua",
	"@vrp/lib/Utils.lua",
	"server-side/*"
}

files {
    'stream/**',
    "web-side/*"
}

data_file 'DLC_ITYP_REQUEST' 'stream/rojao_simples.ytyp'