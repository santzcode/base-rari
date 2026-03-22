fx_version "bodacious"
game "gta5"
lua54 "yes"

name "fortal_admin"

ui_page "web/build/index.html"

shared_scripts {
	"@vrp/lib/Utils.lua",
	"shared/*.lua"
}

client_scripts {
	"client/*",
}

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "@vrp/config/Item.lua", 
    "@vrp/config/Vehicle.lua",
    "server/*"
}

files {
	"web/*",
	"web/build/**/*"
}
