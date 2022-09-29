function OpenMenu()
    local Ped = ESX.PlayerData.ped
    local EntityCoords = GetEntityCoords(Ped)
    local Veh, distance = ESX.Game.GetClosestVehicle(EntityCoords)
    if distance <= 5.0 then
        local Elements = {{
            unselectable = true,
            icon = "fas fa-info-circle",
            title = "Fake Plate"
        }, {
            icon = "",
            title = "Plate",
            input = true,
            inputType = "text",
            inputPlaceholder = "Plate...",
            name = "textinput1"
        }}
        if Entity(Veh).state.lastPlate then
            Elements[#Elements + 1] = {
                title = "Reset",
                value = "reset"
            }
        end
        Elements[#Elements + 1] = {
            title = "Confirm",
            value = "Confirm"
        }
        ESX.OpenContext("right", Elements, function(menu, element)
            if element.value == "Confirm" then
                SetPlate(Veh, menu.eles[2].inputValue)
                ESX.CloseContext()
            elseif element.value == "reset" then
                SetVehicleNumberPlateText(Veh, Entity(Veh).state.lastPlate)
                ESX.CloseContext()
            end
        end, function(menu)
        end)
    end
end

function SetPlate(Veh, Value)
    local OriginalPlate = Entity(Veh).state.lastPlate
    if not OriginalPlate then
        Entity(Veh).state:set("lastPlate", GetVehicleNumberPlateText(Veh), true)
    end
    SetVehicleNumberPlateText(Veh, Value)
end

RegisterNetEvent("openmenu", OpenMenu)

