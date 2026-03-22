fx_version "bodacious"
game "gta5"

ui_page "nui/index.html"

client_scripts {
	"@vrp/lib/Utils.lua",
	"client/*",
	"cfg/*"
}

server_scripts {
	"@vrp/lib/Utils.lua",
	"server/*",
	"cfg/*"
}

files {
	"nui/*",
	"nui/imgs/*",
	"nui/sounds/*"
}