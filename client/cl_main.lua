local WeatherOPtions = {
    "Blizzard",
    "Clear",
    "Clearing",
    "Clouds",
    "Extrasunny",
    "Foggy",
    "Halloween",
    "Neutral",
    "Overcast",
    "Rain",
    "Smog",
    "Snow",
    "Snowlight",
    "Thunder",
    "Xmas"
}

RegisterNetEvent("weather:client_change_weather")
AddEventHandler("weather:client_change_weather", function(weather)
    SetWeatherTypeOvertimePersist(weather, 15.0)
end)

local GetWeatherButtons = function()
    local tbl = {}

    for _, weather in pairs(WeatherOPtions) do
        table.insert(tbl, { name = weather, ask = "", askX = true, data = weather, weather = true })
    end
    
    return tbl
end

local WeatherMenu = {
	Base = { Header = { "commonmenu", "interaction_bgd" }, Color = { color_black }, HeaderColor = { 255, 255, 255 }, Title = "Weather Menu" },
	Data = { currentMenu = "Weather options", "WEATHER_OPTIONS_MENU" },
	Events = {
		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
            if btn.weather then
                TriggerServerEvent("weather:server_change_weather", btn.data)
            end
	    end,
    },

	Menu = {
		["Weather options"] = {
			b = GetWeatherButtons()
        },
	}
}

Citizen.CreateThread(function()
    while true do
        if IsControlJustReleased(0, 57) then
            CreateMenu(WeatherMenu)
        end
        Citizen.Wait(0)
    end
end)