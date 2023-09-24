local ChangeWeather = function()
    local weather = Config.Options[math.random(1, #Config.Options)]
    print("ChangeWeather", weather)
    TriggerClientEvent("weather:client_change_weather", -1, weather)
end

RegisterServerEvent("weather:server_change_weather")
AddEventHandler("weather:server_change_weather", function(weather)
    TriggerClientEvent("weather:client_change_weather", -1, weather)
end)

Citizen.CreateThread(function()
    while true do
        ChangeWeather()
        Citizen.Wait(Config.ChangeInterval * 1000)
    end
end)