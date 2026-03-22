fx_version 'cerulean'
games {'gta5'}
lua54 'yes'

author 'DEVHUB (store.devhub.gg)'
description 'DEVHUB RACING'
version '1.0.7'
 
ui_page "html/index.html"

files {
    "html/**/*",
}

client_scripts {
    'configs/c.*.lua',
    'escrowed/client/c.*.lua',
    'escrowed/client/ui/c.*.lua',
}
server_scripts {
    'configs/s.*.lua',
    'escrowed/server/s.*.lua',
    'escrowed/server/class/s.*.lua',
    'escrowed/server/convertSql/s.*.lua',
}

shared_scripts {
    'configs/sh.*.lua',
    'escrowed/sh.*.lua',
}

escrow_ignore {
    'configs/*.lua',
}
dependency '/assetpacks'