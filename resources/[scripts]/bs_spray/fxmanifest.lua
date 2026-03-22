fx_version 'bodacious'
game 'gta5'

description 'bs_spray'

version '1.1.0'

client_scripts {
	"@vrp/lib/Utils.lua",
	'config.lua',
	'client/warmenu.lua',
	'client/improved_color_menu.lua',
	'client/modern_nui.lua',
	'client/fonts.lua',
	'client/determinant.lua',
	'client/raycast.lua',
	'client/client.lua',
	'client/spray_rotation.lua',
	'client/control.lua',
	'client/remove.lua',
	'client/time.lua',
	'client/cancellable_progress.lua',
}

ui_page 'nui/index.html'

files {
	'nui/index.html',
	'nui/styles.css',
	'nui/script.js'
}

server_scripts {
	"@vrp/lib/utils.lua",
	'config.lua',
	'@mysql-async/lib/MySQL.lua',
	'server/server.lua',
	'server/remove.lua'
}