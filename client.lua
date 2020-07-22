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

-- Set Ped 
Citizen.CreateThread(function()
	local hash = GetHashKey('s_m_m_paramedic_01')
	while not HasModelLoaded(hash) do
		RequestModel(hash)
		Wait(20)
	end 

	local ped = CreatePed(21, hash, 306.2, -597.24, 43.28 -1, 0.0, true, true)
	FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_GUARD_STAND', 0, true)
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
                	local ped = GetPlayerPed(-1)
                	exports['pogressBar']:drawBar(5000, 'Checking in to the hospital.')
                	TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_CLIPBOARD', 0, true)
                	Citizen.Wait(5000)
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

-- Revive function 
function RespawnPed(ped, coords, heading)
	SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, true)
	NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
	SetPlayerInvincible(ped, false)
	TriggerEvent('playerSpawned', coords.x, coords.y, coords.z)
	ClearPedBloodDamage(ped)
	StopScreenEffect('DeathFailOut')

	ESX.UI.Menu.CloseAll()
end

-- Main Event
RegisterNetEvent('esx_checkin:checkIn')
AddEventHandler('esx_checkin:checkIn', function()
	local ped = GetPlayerPed(-1)
	local pos = GetEntityCoords(ped)
	local head = GetEntityHeading(ped)
	local chance = math.random(1,8)
	local coords1 = {
		x = 357.444,
		y = -594.012,
		z = 43.4 + 1
	}
	local coords2 = {
		x = 360.28,
		y = -587.48,
		z = 43.0 + 1
	}
	local coords3 = {
		x = 354.32,
		y = -592.72,
		z = 43.12 + 1
	}
	local coords4 = {
		x = 356.72,
		y = -585.88,
		z = 43.12 + 1
	}
	local coords5 = {
		x = 350.68,
		y = -591.64,
		z = 43.12 + 1
	}
	local coords6 = {
		x = 353.2,
		y = -584.72,
		z = 43.12 + 1
	}
	local coords7 = {
		x = 347.0,
		y = -590.4,
		z = 43.12 + 1
	}
	local coords8 = {
		x = 349.6,
		y = -583.36,
		z = 43.0 + 1
	}

	-- Bed 1
	if chance == 1 then 
		RespawnPed(ped, coords1, 0.0)
		TaskStartScenarioAtPosition(ped, 'WORLD_HUMAN_SUNBATHE_BACK', 357.444, -594.012, 43.4 + 1, 360.0, 0, false, true)
		FreezeEntityPosition(ped, true)
		exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText1'), Config.BedTime * 1000)
		Citizen.Wait(Config.BedTime * 1000)
		FreezeEntityPosition(ped, false) 
		ClearPedTasksImmediately(ped)
		TriggerServerEvent('esx_checkin:takeMoney')
		exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText2'), 4000)
		SetEntityCoords(ped, 356.746, -593.289, 43.3, false, false, false, false)
	end
	-- Bed 2
	if chance == 2 then 
		RespawnPed(ped, coords2, 0.0)
		TaskStartScenarioAtPosition(ped, 'WORLD_HUMAN_SUNBATHE_BACK', 360.28, -587.48, 43.0 + 1, 360.0, 0, false, true)
		FreezeEntityPosition(ped, true)
		exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText1'), Config.BedTime * 1000)
		Citizen.Wait(Config.BedTime * 1000)
		FreezeEntityPosition(ped, false) 
		ClearPedTasksImmediately(ped)
		TriggerServerEvent('esx_checkin:takeMoney')
		exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText2'), 4000)
		SetEntityCoords(ped, 359.04, -587.56, 43.32, false, false, false, false)
	end
	-- Bed 3
	if chance == 3 then 
		RespawnPed(ped, coords3, 0.0)
		TaskStartScenarioAtPosition(ped, 'WORLD_HUMAN_SUNBATHE_BACK', 354.32, -592.72, 43.12 + 1, 360.0, 0, false, true)
		FreezeEntityPosition(ped, true)
		exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText1'), Config.BedTime * 1000)
		Citizen.Wait(Config.BedTime * 1000)
		FreezeEntityPosition(ped, false) 
		ClearPedTasksImmediately(ped)
		TriggerServerEvent('esx_checkin:takeMoney')
		exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText2'), 4000)
		SetEntityCoords(ped, 353.28, -591.8, 43.32, false, false, false, false)
	end
	-- Bed 4 
	if chance == 4 then 
		RespawnPed(ped, coords4, 0.0)
		TaskStartScenarioAtPosition(ped, 'WORLD_HUMAN_SUNBATHE_BACK', 356.72, -585.88, 43.12 + 1, 360.0, 0, false, true)
		FreezeEntityPosition(ped, true)
		exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText1'), Config.BedTime * 1000)
		Citizen.Wait(Config.BedTime * 1000)
		FreezeEntityPosition(ped, false) 
		ClearPedTasksImmediately(ped)
		TriggerServerEvent('esx_checkin:takeMoney')
		exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText2'), 4000)
		SetEntityCoords(ped, 355.28, -585.96, 43.32, false, false, false, false)
	end
	-- Bed 5
	if chance == 5 then 
		RespawnPed(ped, coords5, 0.0)
		TaskStartScenarioAtPosition(ped, 'WORLD_HUMAN_SUNBATHE_BACK', 350.68, -591.64, 43.12 + 1, 360.0, 0, false, true)
		FreezeEntityPosition(ped, true)
		exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText1'), Config.BedTime * 1000)
		Citizen.Wait(Config.BedTime * 1000)
		FreezeEntityPosition(ped, false) 
		ClearPedTasksImmediately(ped)
		TriggerServerEvent('esx_checkin:takeMoney')
		exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText2'), 4000)
		SetEntityCoords(ped, 349.76, -591.12, 43.32, false, false, false, false)
	end
	-- Bed 6 
	if chance == 6 then 
		RespawnPed(ped, coords6, 0.0)
		TaskStartScenarioAtPosition(ped, 'WORLD_HUMAN_SUNBATHE_BACK', 353.2, -584.72, 43.12 + 1, 360.0, 0, false, true)
		FreezeEntityPosition(ped, true)
		exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText1'), Config.BedTime * 1000)
		Citizen.Wait(Config.BedTime * 1000)
		FreezeEntityPosition(ped, false) 
		ClearPedTasksImmediately(ped)
		TriggerServerEvent('esx_checkin:takeMoney')
		exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText2'), 4000)
		SetEntityCoords(ped, 351.76, -584.72, 43.32, false, false, false, false)
	end
	-- Bed 7 
	if chance == 7 then 
		RespawnPed(ped, coords7, 0.0)
		TaskStartScenarioAtPosition(ped, 'WORLD_HUMAN_SUNBATHE_BACK', 347.0, -590.4, 43.12 + 1, 360.0, 0, false, true)
		FreezeEntityPosition(ped, true)
		exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText1'), Config.BedTime * 1000)
		Citizen.Wait(Config.BedTime * 1000)
		FreezeEntityPosition(ped, false) 
		ClearPedTasksImmediately(ped)
		TriggerServerEvent('esx_checkin:takeMoney')
		exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText2'), 4000)
		SetEntityCoords(ped, 347.6, -588.88, 43.32, false, false, false, false)
	end
	-- Bed 8
	if chance == 8 then 
		RespawnPed(ped, coords8, 0.0)
		TaskStartScenarioAtPosition(ped, 'WORLD_HUMAN_SUNBATHE_BACK', 349.6, -583.36, 43.0 + 1, 360.0, 0, false, true)
		FreezeEntityPosition(ped, true)
		exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText1'), Config.BedTime * 1000)
		Citizen.Wait(Config.BedTime * 1000)
		FreezeEntityPosition(ped, false) 
		ClearPedTasksImmediately(ped)
		TriggerServerEvent('esx_checkin:takeMoney')
		exports['mythic_notify']:DoCustomHudText('inform', _U('notificationText2'), 4000)
		SetEntityCoords(ped, 348.0, -583.36, 43.32, false, false, false, false)
	end
end)