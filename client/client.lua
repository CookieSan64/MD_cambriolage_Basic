local incambriolage = false
local player = GetPlayerPed(-1)
local coords = GetEntityCoords(PlayerPedId())
local tableau = false
local tele = false
local pc = false
local vase = false
local enceinte = false
local bijoux = false
local stopalerte = false
local maison
local GetBlips = true

ESX = exports["es_extended"]:getSharedObject()

---------- Entrer  --------------
Citizen.CreateThread(function(entrer)
	while true do
	Citizen.Wait(0)
		if incambriolage == false then
			for k,v in pairs(Config.marker) do
			local coords = GetEntityCoords(PlayerPedId())
				if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 1.0) then
					DrawMarker(22, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0.0, 0.0, 0.0, 0, 0, 1, 2, 0, nil, nil, 0)
					AddTextEntry("HELP", "Appuyez sur ~INPUT_REPLAY_SCREENSHOT~ ~s~ pour~b~ forcer la serrure")
					DisplayHelpTextThisFrame("HELP", true)
					if IsControlJustPressed(1, 51) then
						ESX.TriggerServerCallback('esx_cambriolage:getflicnombre', function(flic)
						if flic >= Config.flic then 
							maison = v.id 						
						
							TriggerServerEvent('esx_cambriolage:createblip', maison)
							incambriolage = true   
							tableau = true
							tele = true							
							pc = true
							vase = true
							enceinte = true
							bijoux = true
							stopalerte = true
							
							ExecuteCommand('e weld')
							exports["rs_prog"]:AfficherProgressbar(Config.entrer)
							Citizen.Wait(Config.entrer * 1000)
							exports["rs_prog"]:CacherProgressbar()
							if v.type == "luxe" then
								SetEntityCoords(GetPlayerPed(-1),-682.33, 592.34, 145.39, false, false, false, true)
							elseif v.type == "basic" then
								SetEntityCoords(GetPlayerPed(-1),265.59, -1002.84, -99.01, false, false, false, true)
							end
								Citizen.Wait(2000)
								ESX.ShowNotification("Faite vite et attention aux empreintes", "error", 5000)
							else
								ESX.ShowNotification("il n'a pas assez de policier en ville", "error", 5000)
								
							end 
						end)   
					end
				end
			end
		end
	end
end)

------ Prendre l'objet ----------
Citizen.CreateThread(function()
   while true do
       Citizen.Wait(0)
       local coords = GetEntityCoords(PlayerPedId())
            if incambriolage == true then
               for k,v in pairs(Config.objet) do
                    if v.item =="tableau" and tableau == true and v.type == "luxe" then
                        if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 15.0) then
							DrawMarker(22, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0.0, 255.0, 0.0, 170, 0, 1, 2, 0, nil, nil, 0)
                            if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 1.0) then 
								AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~ pour ~g~prendre le tableau.")
								DisplayHelpTextThisFrame("HELP", true)
                                if IsControlJustPressed(1, 51) then                  
                                     action(v.item)
                                    tableau = false
                                end   
                            end
                        end
                     end
                    if v.item =="tableau" and tableau == true and v.type == "basic" then
                        if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 15.0) then
							DrawMarker(22, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0.0, 255.0, 0.0, 170, 0, 1, 2, 0, nil, nil, 0)
                            if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 1.0) then 
								AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~ pour ~g~prendre le tableau.")
								DisplayHelpTextThisFrame("HELP", true)
                                if IsControlJustPressed(1, 51) then                  
                                    action(v.item)
                                    tableau = false
                                end   
                            end
                        end
                    end

					if v.item =="tele" and tele == true and v.type == "luxe" then
						if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 15.0) then
							DrawMarker(22, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0.0, 255.0, 0.0, 170, 0, 1, 2, 0, nil, nil, 0)
							if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 1.0) then 
								AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~ pour ~g~prendre la télé.")
								DisplayHelpTextThisFrame("HELP", true)
								if IsControlJustPressed(1, 51) then 
									action(v.item)
									tele = false
							   
								end   
							end
						end
					end
					if v.item =="tele" and tele == true and v.type == "basic" then
						if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 15.0) then
							DrawMarker(22, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0.0, 255.0, 0.0, 170, 0, 1, 2, 0, nil, nil, 0)
							if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 1.0) then 
								AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~ pour ~g~prendre la télé.")
								DisplayHelpTextThisFrame("HELP", true)
								if IsControlJustPressed(1, 51) then 
									action(v.item)
									tele = false
							   
								 end   
							end
						end
				    end
					if v.item =="pc" and pc == true then
						if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 15.0) then
							DrawMarker(22, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0.0, 255.0, 0.0, 170, 0, 1, 2, 0, nil, nil, 0)
							if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 1.0) then 
								AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~ pour ~g~prendre le pc portable")
								DisplayHelpTextThisFrame("HELP", true)
								if IsControlJustPressed(1, 51) then 
									action(v.item)
									pc = false				
								end   
							end
						end
				    end
					if v.item =="enceinte" and enceinte == true and v.type == "luxe" then
						if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 15.0) then
							DrawMarker(22, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0.0, 255.0, 0.0, 170, 0, 1, 2, 0, nil, nil, 0)
							if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 1.0) then 
								AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~ pour ~g~prendre l'enceinte")
								DisplayHelpTextThisFrame("HELP", true)
								if IsControlJustPressed(1, 51) then 
									action(v.item)
									enceinte = false                       
								end   
							end
						end
				    end
					if v.item =="enceinte" and enceinte == true and v.type == "basic" then
						if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 15.0) then
							DrawMarker(22, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0.0, 255.0, 0.0, 170, 0, 1, 2, 0, nil, nil, 0)
							if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 1.0) then 
								AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~ pour ~g~prendre l'enceinte")
								DisplayHelpTextThisFrame("HELP", true)
								if IsControlJustPressed(1, 51) then 
									action(v.item)
									enceinte = false                       
								end   
							 end
						end
				    end
					if v.item =="vase" and vase == true then
						if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 15.0) then
							DrawMarker(22, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0.0, 255.0, 0.0, 170, 0, 1, 2, 0, nil, nil, 0)
							if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 1.0) then 
								AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~ pour ~g~prendre le vase")
								DisplayHelpTextThisFrame("HELP", true)
								if IsControlJustPressed(1, 51) then 
									action(v.item)
									vase = false                          
								end   
							end
						end
				    end
				   if v.item =="bijoux" and bijoux == true and v.type == "luxe" then
						if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 15.0) then
							DrawMarker(22, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0.0, 255.0, 0.0, 170, 0, 1, 2, 0, nil, nil, 0)
							if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 1.0) then 
								AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~ pour ~g~prendre les bijoux")
								DisplayHelpTextThisFrame("HELP", true)
								if IsControlJustPressed(1, 51) then 
									action(v.item)
									bijoux = false                        
							
								end   
						    end
					    end
				    end
				   if v.item =="bijoux" and bijoux == true and v.type == "basic" then
						if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 15.0) then
							DrawMarker(22, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0.0, 255.0, 0.0, 170, 0, 1, 2, 0, nil, nil, 0)
							if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 1.0) then 
								AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~ pour ~g~prendre les bijoux")
								DisplayHelpTextThisFrame("HELP", true)
								if IsControlJustPressed(1, 51) then 
									action(v.item)
									bijoux = false                        
							
								end   
							end
						end
				   end
            end
        end 
    end
end) 

------- Function d'objet --------
function action(item)
local player = GetPlayerPed(-1)
	if item == "tableau" then
		ExecuteCommand('e kneel2')
		exports["rs_prog"]:AfficherProgressbar(Config.tempstableau)
		Citizen.Wait(Config.tempstableau * 1000)
		exports["rs_prog"]:CacherProgressbar()
		ClearPedTasksImmediately(player)
       
	end
	if item == "tele" then
		ExecuteCommand('e kneel2')
		exports["rs_prog"]:AfficherProgressbar(Config.tempstele)
		Citizen.Wait(Config.tempstele * 1000)
		exports["rs_prog"]:CacherProgressbar()
		ClearPedTasksImmediately(player)
       
	end
	if item == "pc" then
		ExecuteCommand('e bumbin')
		exports["rs_prog"]:AfficherProgressbar(Config.tempspc)
		Citizen.Wait(Config.tempspc * 1000)
		exports["rs_prog"]:CacherProgressbar()
		ClearPedTasksImmediately(player)
      
	end
	if item == "enceinte" then
		ExecuteCommand('e kneel2')
		exports["rs_prog"]:AfficherProgressbar(Config.tempsenceinte)
		Citizen.Wait(Config.tempsenceinte * 1000)
		exports["rs_prog"]:CacherProgressbar()
		ClearPedTasksImmediately(player)
      
	end
	if item == "vase" then
		ExecuteCommand('e kneel2')
		exports["rs_prog"]:AfficherProgressbar(Config.tempsvase)
		Citizen.Wait(Config.tempsvase * 1000)
		exports["rs_prog"]:CacherProgressbar()
		ClearPedTasksImmediately(player)
      
	end
	if item == "bijoux" then
		ExecuteCommand('e kneel2')
		exports["rs_prog"]:AfficherProgressbar(Config.tempsbijoux)
		Citizen.Wait(Config.tempsbijoux * 1000)
		exports["rs_prog"]:CacherProgressbar()
		ClearPedTasksImmediately(player)


	end
   TriggerServerEvent('esx_cambriolage:giveitem',item)   
end

---------- Sortie ---------------
Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
      local coords = GetEntityCoords(PlayerPedId())
        if incambriolage == true then
			for k,v in pairs(Config.sortie) do
				if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 1.0) then
					DrawMarker(22, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0.0, 255.0, 0.0, 170, 0, 1, 2, 0, nil, nil, 0)
					AddTextEntry("HELP", "Appuyez sur ~INPUT_REPLAY_SCREENSHOT~ pour~g~ sortir de la maison")
					DisplayHelpTextThisFrame("HELP", false)
					if IsControlJustPressed(1, 303) then   
						for k,v in pairs(Config.marker) do 
						if maison == v.id then		
						SetEntityCoords(GetPlayerPed(-1),v.Pos.x, v.Pos.y, v.Pos.z, false, false, false, true)
						end
						Citizen.Wait(0)
						incambriolage = false
						tableau = false
						tele = false
						pc = false
						vase = false
						enceinte = false
						bijoux = false
						stopalerte = false
						end
					end
				end
			end
		end
    end
end)

-------- alerte police ----------
RegisterNetEvent('esx_cambriolage:blip')
AddEventHandler('esx_cambriolage:blip', function(maison)  
    for k,v in pairs(Config.marker) do 
		if maison == v.id then
		blipslspd = AddBlipForCoord(v.Pos.x, v.Pos.y, v.Pos.z)
		SetBlipSprite(blipslspd , 161)
		SetBlipScale(blipslspd , 0.8)
		SetBlipColour(blipslspd,3 )
		PulseBlip(blipslspd)
		Citizen.Wait(Config.tempsalerte * 1000)
		RemoveBlip(blipslspd)
		end
	end
end)

------- option makers  ----------

Citizen.CreateThread(function()
while true do
		Citizen.Wait(0)
	if cartemakers == true then
		
		local coords = GetEntityCoords(PlayerPedId())
			for k,v in pairs(Config.marker) do
				if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 1.0) then
					DrawMarker(22, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0.0, 255.0, 0.0, 170, 0, 1, 2, 0, nil, nil, 0)
				end
			end
	end
	 if GetBlips == true then
--				addblip2()
            end
		end
end)
