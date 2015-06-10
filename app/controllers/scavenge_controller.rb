require 'net/http'

class ScavengeController < ApplicationController
	def index
		#get hongkong weather forecast 
		uri = URI('http://api.openweathermap.org/data/2.5/forecast/daily')
        params = {q:'hongkong', units:'metric', APPID:'cd9bb27eb4d1808e2d53a1d9277bddeb', cnt:16}
        uri.query = URI.encode_www_form(params)

        weatherRaw = Net::HTTP.get(uri)
        weatherHash = ActiveSupport::JSON.decode(weatherRaw)

        #save weather forecast to database
        weatherHash['list'].each do |wData|
        	tmpDate = Time.at(wData['dt'])
        	date = tmpDate.to_date

        	weather = HkWeather.find_or_initialize_by(date: date)
        	weather.update(date: date, temp_day: wData['temp']['day'],temp_min:wData['temp']['min'],temp_max:wData['temp']['max'], temp_night:wData['temp']['night'],temp_eve:wData['temp']['eve'],temp_morn:wData['temp']['morn'],pressure:wData['pressure'],humidity:wData['humidity'],weather_description:wData['weather'][0]['description'],weather_icon:wData['weather'][0]['icon'],wind_speed:wData['speed'],wind_deg:wData['deg'],clouds:wData['clouds'])
        end
	end
end
