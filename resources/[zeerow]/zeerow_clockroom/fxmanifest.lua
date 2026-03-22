fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Toddy - Zeerow Studio'
description 'Zeerow Studio - Sistema de preset de roupas'

version '1.0.0'

dependencies { 'ox_lib', 'vrp', 'sleepless_interact', 'oxmysql' }

shared_scripts { '@ox_lib/init.lua', '@vrp/lib/utils.lua', 'shared/**' }
client_script 'client/**'
server_scripts { '@oxmysql/lib/MySQL.lua', 'server/**', 'license.lua' }