class HkweatherController < ApplicationController
	skip_before_filter :verify_authenticity_token
	before_filter :cors_preflight_check
	after_filter :cors_set_access_control_headers
	

	def index
		today = Time.new
		@weather = HkWeather.where('date >= ?',today.localtime.to_date).order('date ASC').limit(4)
	end

	def weatherapi
		date = params[:date]
		weather = HkWeather.where('date >= ?',date).order('date ASC').limit(4)

		render json: weather
	end
end
