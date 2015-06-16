class HkweatherController < ApplicationController
	skip_before_filter :verify_authenticity_token
	before_filter :set_headers

	def index
		today = Time.new
		@weather = HkWeather.where('date >= ?',today.localtime.to_date).order('date ASC').limit(4)
	end

	def weatherapi
		date = params[:date]
		weather = HkWeather.where('date >= ?',date).order('date ASC').limit(4)

		render json: weather
	end

  private

  def set_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Expose-Headers'] = 'ETag'
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD'
    headers['Access-Control-Allow-Headers'] = '*,x-requested-with,Content-Type,If-Modified-Since,If-None-Match'
    headers['Access-Control-Max-Age'] = '86400'
  end
end
