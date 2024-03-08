fx_version 'adamant'
game 'gta5'

dependency {
'rs_prog',
'rpemotes',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    '@es_extended/locale.lua',
    'config.lua',
    'server/server.lua',
}

client_scripts {
    '@es_extended/locale.lua',
    'config.lua',
    'client/client.lua',
    'Menu/dependencies/jamsou_dep.lua'
}

shared_script '@es_extended/imports.lua'