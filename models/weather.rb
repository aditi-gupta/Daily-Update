require "rest-client"
require "giphy"
require "pry"
require "json"
require "open-uri"
require "open_weather"

# Openweather2.configure do |config|
# 	config.endpoint = 'http://api.openweathermap.org/data/2.5/forecast/daily'
# 	config.apikey = '36321c64321bc29da888743a5da0781e'
# end
# weather = Openweather2.get_weather(city: 'new york', units: 'imperial')
# puts "#{weather.temperature}"

options = {units: "imperial", APPID: "36321c64321bc29da888743a5da0781e"}
weather = OpenWeather::ForecastDaily.city("New York, NY", options)

puts weather
