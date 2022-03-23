RegisterCommand("spawn", function(source, args)
    -- account for the argument not being passed
    local vehicleName = args[1] or "adder"

    if not IsModelInCdimage(vehicleName) or not IsModelAVehicle(vehicleName) then
        TriggerEvent("chat:addMessage", {
            args = {"~r~Vehicle Not Vaild "  .. vehicleName}
        })
        return
    end
    

    RequestModel(vehicleName)

    while not HasModelLoaded(vehicleName) do
        wait(500)
    end
    local playerPed = PlayerPedId() -- get the local player ped

    local pos = GetEntityCoords(playerPed) -- get the position of the local player ped

    local vehicle = CreateVehicle(vehicleName, pos.x, pos.y, pos.z, GetEntityHeading(playerPed), true, false)

    SetPedIntoVehicle(playerPed, vehicle, -1)

    SetEntityAsNoLongerNeeded(vehicleName)

    SetModelAsNoLongerNeeded(vehicleName)

    -- tell the player
    TriggerEvent("chat:addMessage", {
        args = {"You Have Spawned a" .. vehicleName ..'.'}
    })
end, false)
