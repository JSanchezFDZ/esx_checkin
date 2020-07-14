-- ESX Stuff (DON'T TOUCH!!!)
ESX = nil 

Citizen.CreateThread(function() 
	while ESX == nil do 
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 
		Citizen.Wait(1) 
	end 
		PlayerData = ESX.GetPlayerData() 
end) 
 
RegisterNetEvent('esx:playerLoaded') 
AddEventHandler('esx:playerLoaded', function(xPlayer) 
	PlayerData = xPlayer 
end) 
 
RegisterNetEvent('esx:setJob') 
AddEventHandler('esx:setJob', function(job) 
	PlayerData.job = job 
end) 

-- Draw 3D text 
Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
		local coords = GetEntityCoords(PlayerPedId())
		for k,v in pairs(Config.Locations) do
            if GetDistanceBetweenCoords(coords, v.Coords.x, v.Coords.y, v.Coords.z, true) < Config.TextDrawDistance then
                local location = v
                DrawText3D(v.Coords.x, v.Coords.y, v.Coords.z - 1.0, _U('requestCheckIn'))
                if IsControlJustReleased(0, 38) then
                    TriggerServerEvent('esx_checkin:keyPressed')
                end
			end
		end
	end
end)

-- 3D text function
function DrawText3D(x,y,z, text)
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
	local p = GetGameplayCamCoords()
	local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
	local scale = (1 / distance) * 2
	local fov = (1 / GetGameplayCamFov()) * 100
	local scale = scale * fov
	if onScreen then
		  SetTextScale(0.35, 0.35)
		  SetTextFont(4)
		  SetTextProportional(1)
		  SetTextColour(255, 255, 255, 215)
		  SetTextEntry("STRING")
		  SetTextCentre(1)
		  AddTextComponentString(text)
		  DrawText(_x,_y)
		  local factor = (string.len(text)) / 370
		  DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
	  end
end

-- Main Event
RegisterNetEvent('esx_checkin:checkIn')
AddEventHandler('esx_checkin:checkIn', function()
	local ped = GetPlayerPed(-1)
	local pos = GetEntityCoords(ped)
	local head = GetEntityHeading(ped)
	local chance = math.random(1,8)

	-- Bed 1
	if chance == 1 then 
		TaskStartScenarioAtPosition(ped, 'WORLD_HUMAN_SUNBATHE_BACK', 357.444, -594.012, 43.4 + 1, 360.0, 0, false, true)
		FreezeEntityPosition(ped, true)
		exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText1'), 20000)
		Citizen.Wait(20000)
		exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText3'), 5000)
		while true do 
			Citizen.Wait(0)
			if IsControlJustReleased(0, 23) then 
				FreezeEntityPosition(ped, false) 
				ClearPedTasksImmediately(ped)
				TriggerServerEvent('esx_checkin:takeMoney')
				exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText2'), 4000)
				SetEntityHealth(ped, 200)
				SetEntityCoords(ped, 356.746, -593.289, 43.3, false, false, false, false)
				break
			end
		end
	end
	-- Bed 2
	if chance == 2 then 
		TaskStartScenarioAtPosition(ped, 'WORLD_HUMAN_SUNBATHE_BACK', 360.28, -587.48, 43.0 + 1, 360.0, 0, false, true)
		FreezeEntityPosition(ped, true)
		exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText1'), 20000)
		Citizen.Wait(20000)
		exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText3'), 5000)
		while true do 
			Citizen.Wait(0)
			if IsControlJustReleased(0, 23) then 
				FreezeEntityPosition(ped, false) 
				ClearPedTasksImmediately(ped)
				TriggerServerEvent('esx_checkin:takeMoney')
				exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText2'), 4000)
				SetEntityHealth(ped, 200)
				SetEntityCoords(ped, 359.04, -587.56, 43.32, false, false, false, false)
				break
			end
		end
	end
	-- Bed 3
	if chance == 3 then 
		TaskStartScenarioAtPosition(ped, 'WORLD_HUMAN_SUNBATHE_BACK', 354.32, -592.72, 43.12 + 1, 360.0, 0, false, true)
		FreezeEntityPosition(ped, true)
		exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText1'), 20000)
		Citizen.Wait(20000)
		exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText3'), 5000)
		while true do 
			Citizen.Wait(0)
			if IsControlJustReleased(0, 23) then 
				FreezeEntityPosition(ped, false) 
				ClearPedTasksImmediately(ped)
				TriggerServerEvent('esx_checkin:takeMoney')
				exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText2'), 4000)
				SetEntityHealth(ped, 200)
				SetEntityCoords(ped, 353.28, -591.8, 43.32, false, false, false, false)
				break
			end
		end
	end
	-- Bed 4 
	if chance == 4 then 
		TaskStartScenarioAtPosition(ped, 'WORLD_HUMAN_SUNBATHE_BACK', 356.72, -585.88, 43.12 + 1, 360.0, 0, false, true)
		FreezeEntityPosition(ped, true)
		exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText1'), 20000)
		Citizen.Wait(20000)
		exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText3'), 5000)
		while true do 
			Citizen.Wait(0)
			if IsControlJustReleased(0, 23) then 
				FreezeEntityPosition(ped, false) 
				ClearPedTasksImmediately(ped)
				TriggerServerEvent('esx_checkin:takeMoney')
				exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText2'), 4000)
				SetEntityHealth(ped, 200)
				SetEntityCoords(ped, 355.28, -585.96, 43.32, false, false, false, false)
				break
			end
		end
	end
	-- Bed 5
	if chance == 5 then 
		TaskStartScenarioAtPosition(ped, 'WORLD_HUMAN_SUNBATHE_BACK', 350.68, -591.64, 43.12 + 1, 360.0, 0, false, true)
		FreezeEntityPosition(ped, true)
		exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText1'), 20000)
		Citizen.Wait(20000)
		exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText3'), 5000)
		while true do 
			Citizen.Wait(0)
			if IsControlJustReleased(0, 23) then 
				FreezeEntityPosition(ped, false) 
				ClearPedTasksImmediately(ped)
				TriggerServerEvent('esx_checkin:takeMoney')
				exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText2'), 4000)
				SetEntityHealth(ped, 200)
				SetEntityCoords(ped, 349.76, -591.12, 43.32, false, false, false, false)
				break
			end
		end
	end
	-- Bed 6 
	if chance == 6 then 
		TaskStartScenarioAtPosition(ped, 'WORLD_HUMAN_SUNBATHE_BACK', 353.2, -584.72, 43.12 + 1, 360.0, 0, false, true)
		FreezeEntityPosition(ped, true)
		exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText1'), 20000)
		Citizen.Wait(20000)
		exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText3'), 5000)
		while true do 
			Citizen.Wait(0)
			if IsControlJustReleased(0, 23) then 
				FreezeEntityPosition(ped, false) 
				ClearPedTasksImmediately(ped)
				TriggerServerEvent('esx_checkin:takeMoney')
				exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText2'), 4000)
				SetEntityHealth(ped, 200)
				SetEntityCoords(ped, 351.76, -584.72, 43.32, false, false, false, false)
				break
			end
		end
	end
	-- Bed 7 
	if chance == 7 then 
		TaskStartScenarioAtPosition(ped, 'WORLD_HUMAN_SUNBATHE_BACK', 347.0, -590.4, 43.12 + 1, 360.0, 0, false, true)
		FreezeEntityPosition(ped, true)
		exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText1'), 20000)
		Citizen.Wait(20000)
		exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText3'), 5000)
		while true do 
			Citizen.Wait(0)
			if IsControlJustReleased(0, 23) then 
				FreezeEntityPosition(ped, false) 
				ClearPedTasksImmediately(ped)
				TriggerServerEvent('esx_checkin:takeMoney')
				exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText2'), 4000)
				SetEntityHealth(ped, 200)
				SetEntityCoords(ped, 347.6, -588.88, 43.32, false, false, false, false)
				break
			end
		end
	end
	-- Bed 8
	if chance == 8 then 
		TaskStartScenarioAtPosition(ped, 'WORLD_HUMAN_SUNBATHE_BACK', 349.6, -583.36, 43.0 + 1, 360.0, 0, false, true)
		FreezeEntityPosition(ped, true)
		exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText1'), 20000)
		Citizen.Wait(20000)
		exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText3'), 5000)
		while true do 
			Citizen.Wait(0)
			if IsControlJustReleased(0, 23) then 
				FreezeEntityPosition(ped, false) 
				ClearPedTasksImmediately(ped)
				TriggerServerEvent('esx_checkin:takeMoney')
				exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText2'), 4000)
				SetEntityHealth(ped, 200)
				SetEntityCoords(ped, 348.0, -583.36, 43.32, false, false, false, false)
				break
			end
		end
	end
end)