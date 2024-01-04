local CurrentWeather = nil

local Config = {
    ChangeInterval = 60 * 60, -- seconds

    Options = {
        "EXTRASUNNY",
        "CLEAR",
        "SMOG",
        "FOGGY",
        "OVERCAST",
        "CLOUDS",
        "CLEARING",
        "RAIN",
        "THUNDER",
        "HALLOWEEN"
    }
}

RegisterServerEvent("weather:request_weather")
AddEventHandler("weather:request_weather", function()
    local playerSource = source
    TriggerClientEvent("weather:client_change_weather", playerSource, CurrentWeather)
end)

local ChangeWeather = function()
    CurrentWeather = Config.Options[math.random(1, #Config.Options)]
    TriggerClientEvent("weather:client_change_weather", -1, CurrentWeather)
end

CreateThread(function()
    while true do
        ChangeWeather()
        Wait(Config.ChangeInterval * 1000)
    end
end)
