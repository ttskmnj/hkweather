require 'net/http'

class WelcomeController < ApplicationController
	def index
		uri = URI('http://api.openweathermap.org/data/2.5/forecast/daily')
        params = {q:'hongkong', units:'metric', APPID:'cd9bb27eb4d1808e2d53a1d9277bddeb', cnt:16}
        uri.query = URI.encode_www_form(params)

        test = Net::HTTP.get(uri)
		
        render plain:test
	end
end





=begin
	jsaon sample 
	[
			{"date":20150608, "temp":{"day":27.39,"min":27.39,"max":27.4,"night":27.4,"eve":27.39,"morn":27.39},  "pressure":1018.16, "humidity":87, "weather":[{"description":"sky is clear","icon":"02n"}],"speed":5.31, "deg":197, 
			"clouds":8   },
			{"date":20150608, "temp":{"day":27.39,"min":27.39,"max":27.4,"night":27.4,"eve":27.39,"morn":27.39},  "pressure":1018.16, "humidity":87, "weather":[{"description":"sky is clear","icon":"02n"}],"speed":5.31, "deg":197, 
			"clouds":8   },
			{"date":20150608, "temp":{"day":27.39,"min":27.39,"max":27.4,"night":27.4,"eve":27.39,"morn":27.39},  "pressure":1018.16, "humidity":87, "weather":[{"description":"sky is clear","icon":"02n"}],"speed":5.31, "deg":197, 
			"clouds":8   },
			{"date":20150608, "temp":{"day":27.39,"min":27.39,"max":27.4,"night":27.4,"eve":27.39,"morn":27.39},  "pressure":1018.16, "humidity":87, "weather":[{"description":"sky is clear","icon":"02n"}],"speed":5.31, "deg":197, 
			"clouds":8   },
			{"date":20150608, "temp":{"day":27.39,"min":27.39,"max":27.4,"night":27.4,"eve":27.39,"morn":27.39},  "pressure":1018.16, "humidity":87, "weather":[{"description":"sky is clear","icon":"02n"}],"speed":5.31, "deg":197, 
			"clouds":8   },
			{"date":20150608, "temp":{"day":27.39,"min":27.39,"max":27.4,"night":27.4,"eve":27.39,"morn":27.39},  "pressure":1018.16, "humidity":87, "weather":[{"description":"sky is clear","icon":"02n"}],"speed":5.31, "deg":197, 
			"clouds":8   },
			{"date":20150608, "temp":{"day":27.39,"min":27.39,"max":27.4,"night":27.4,"eve":27.39,"morn":27.39},  "pressure":1018.16, "humidity":87, "weather":[{"description":"sky is clear","icon":"02n"}],"speed":5.31, "deg":197, 
			"clouds":8   }
		]
=end
