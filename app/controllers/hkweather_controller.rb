class HkweatherController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def index
		@date = Hash.new
		today = Time.new
		@weather = HkWeather.where('date >= ?',today.localtime.to_date).order('date ASC').limit(4)

		#change date format
		@weather.each_index do |k|
			date = @weather[k]['date'].mday
			month = @weather[k]['date'].mon

			@date[k] =  "#{month}/#{date}"
		end

		#get wind direction string
		@windDirect = getWindDirect(@weather[0]['wind_deg'])
	end

	def weatherapi
		date = params[:date]
		weather = HkWeather.where('date >= ?',date).order('date ASC').limit(4)

		render json: weather
	end

	private

	def getWindDirect(direct)
		case direct
			when 11.25 .. 33.75
				windDirect = 'NNE'

			when 33.75 .. 56.25
				windDirect = 'NE'

			when 56.25 .. 78.75
				windDirect = 'ENE'

			when 78.75 .. 101.25
				windDirect = 'E'

			when 101.25 .. 123.75
				windDirect = 'ESE'

			when 123.75 .. 146.25
				windDirect = 'SE'

			when 146.25 .. 168.75
				windDirect = 'SSE'

			when 168.75 .. 191.25
				windDirect = 'S'

			when 191.25 .. 213.75
				windDirect = 'SSW'

			when 213.75 .. 236.25
				windDirect = 'SW'

			when 236.25 .. 258.75
				windDirect = 'WSW'

			when 258.75 .. 281.25
				windDirect = 'W'

			when 281.25 .. 303.75
				windDirect = 'WNW'

			when 303.75 .. 326.25
				windDirect = 'NW'

			when 326.25 .. 348.75
				windDirect = 'NNW'

			else
				windDirect = 'N'
		end
	end
end
