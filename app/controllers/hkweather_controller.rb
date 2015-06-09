class HkweatherController < ApplicationController
	def index
=begin
		test = '2015-06-11'
		weather = HkWeather.where('date >= ?',test).order('date ASC').limit(4)

		render json:ActiveSupport::JSON.encode(weather)
=end
		render plain: params[:date]
	end
end
