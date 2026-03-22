 

fx_version "adamant"
game "gta5"

ui_page_preload 'yes'

ui_page "nui/index.html"

files {
	"nui/**",
}

client_scripts {
	"client_config.lua",
	"client.lua"
}

server_script {
	"server_config.lua",
	"server.lua"
}

shared_script {
	"@vrp/lib/utils.lua",
	"@vrp/config/Global.lua",
}