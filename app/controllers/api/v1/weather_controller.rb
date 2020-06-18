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
                todayWeather = URI("http://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{long}&appid=#{key}&units=imperial")
                weather = Net::HTTP.get(todayWeather)
                forecastWeather = URI("https://api.openweathermap.org/data/2.5/forecast?q=?lat=#{lat}&lon=#{long}&appid=#{key}&units=imperial&mode=json")
                forecast = Net::HTTP.get(forecastWeather)
                allWeather = { weather, forecast }
                render json: {status: 'SUCCESS', message: 'Loaded Weather', data: allWeather}, status: :ok
            end

            def delete
                render json: {status: 'Error', message: 'Invalid Request'}, status: :unprocessable_entity
            end
        end
    end
end