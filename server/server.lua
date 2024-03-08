ESX = exports["es_extended"]:getSharedObject()
local pnjstart = false

--------- Give item -------------
 -- Si vous avez le poids sur votre serveur enelver les ( -- ) devant la ligne 17,20,21 et 23.
RegisterServerEvent('esx_cambriolage:giveitem')
AddEventHandler('esx_cambriolage:giveitem', function(item)
local src = source
local xPlayer = ESX.GetPlayerFromId(src)
  if xPlayer.canCarryItem(item, 1) then
	xPlayer.addInventoryItem(item, 1)
    TriggerClientEvent('esx:showNotification', src, 'Objet Volé '..item..'')
  else
  TriggerClientEvent('esx:showNotification', src, 'Vous n\':avez pas assez de place sur vous')
  end 
end)

--------- Give item -------------
ESX.RegisterServerCallback('esx_cambriolage:GetGroup', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer ~= nil then
        local playerGroup = xPlayer.getGroup()
        if playerGroup ~= nil then 
            cb(playerGroup)
        else
            cb(nil)
        end
    else
        cb(nil)
    end
end)

--------- Alerte lspd -----------
ESX.RegisterServerCallback('esx_cambriolage:getflicnombre', function(source, cb)
local src = source
local xPlayer = ESX.GetPlayerFromId(src)
local xPlayers = ESX.GetPlayers()
local flic = 0
    for i=1, #xPlayers, 1 do
      local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
       if xPlayer.job.name == 'police' or xPlayer.job.name == 'fbi' then
        flic = flic + 1
        policier = xPlayers[i]
       end
    end
    cb(flic)
end)

RegisterServerEvent('esx_cambriolage:createblip')
AddEventHandler('esx_cambriolage:createblip', function(maison)

local maison = maison
local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
    if xPlayer.job.name == 'police' or xPlayer.job.name == 'fbi' then
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'FDO INFORMATION', 'CENTRAL FDO', 'Appel d\'un citoyen concernant un ~r~cambriolage~w~ d\'une maison voisine.', 'CHAR_CHAT_CALL', 8)
			TriggerClientEvent('esx_cambriolage:blip', xPlayers[i], maison)
		end
	end
end)