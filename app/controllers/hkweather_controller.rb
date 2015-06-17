class HkweatherController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def index
		@date = Hash.new
		today = Time.new
		@weather = HkWeather.where('date >= ?',today.localtime.to_date).order('date ASC').limit(4)
		@weather.each_index do |k|
			date = @weather[k]['date'].mday
			month = @weather[k]['date'].mon

			@date[k] =  "#{month}/#{date}"
		end
	end

	def weatherapi
		date = params[:date]
		weather = HkWeather.where('date >= ?',date).order('date ASC').limit(4)

		render json: weather
	end
end
