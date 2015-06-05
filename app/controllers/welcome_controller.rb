require 'net/http'

class WelcomeController < ApplicationController
	def index
		uri = URI('http://api.openweathermap.org/data/2.5/forecast')
        params = {:q => 'hongkong'}
        uri.query = URI.encode_www_form(params)

        test = Net::HTTP.get(uri)
		
        render plain:test
	end
end
