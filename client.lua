RegisterNetEvent("weather:client_change_weather")
AddEventHandler("weather:client_change_weather", function(weather)
    SetWeatherTypeOvertimePersist(weather, 15.0)
end)

AddEventHandler("playerSpawned", function()
    TriggerServerEvent("weather:request_weather")
end)