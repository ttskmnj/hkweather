class HkweatherController < ApplicationController
	def index
		test = '2015-06-11'
		weather = HkWeather.where('date >= ?',test).order('date ASC').limit(4)

		render json:ActiveSupport::JSON.encode(weather)

	end

	def weatherapi
=begin
		test = '2015-06-11'
		weather = HkWeather.where('date >= ?',test).order('date ASC').limit(4)

		render json:ActiveSupport::JSON.encode(weather)
=end
		render plain: params[:date]
	end
end
