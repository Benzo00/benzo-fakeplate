ESX.RegisterUsableItem(Config.LicensePlateItem, function(source)
   local xPlayer = ESX.GetPlayerFromId(source)
   TriggerClientEvent("openmenu", source)
   if Config.RemovePlateAfterUse then
   xPlayer.removeInventoryItem(Config.LicensePlateItem, 1)
   end
end)
