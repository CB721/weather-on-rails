require 'net/http'
require 'dotenv'

module Api
    module V1
        class WeatherController < ApplicationController
            def index
                Dotenv.load
                key = ENV['WEATHER_KEY']
                lat = params[:lat]
                long = params[:long]
                uri = URI("http://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{long}&appid=#{key}&units=imperial")
                weather = Net::HTTP.get(uri);
                render json: {status: 'SUCCESS', message: 'Loaded Weather', data: weather}, status: :ok
            end
        end
    end
end