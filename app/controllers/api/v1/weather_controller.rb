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
                render json: {status: 'SUCCESS', message: 'Loaded Weather', data: weather}, status: 201
            end

            def forecast
                Dotenv.load
                key = ENV['WEATHER_KEY']
                lat = params[:lat]
                long = params[:long]
                forecastWeather = URI("https://api.openweathermap.org/data/2.5/forecast?q=?lat=#{lat}&lon=#{long}&appid=#{key}&units=imperial&mode=json")
                forecast = Net::HTTP.get(forecastWeather)
                render json: {status: 'SUCCESS', message: 'Loaded Weather', data: forecast}, status: 201
            end

            def delete
                render json: {status: 'Error', message: 'Invalid Request'}, status: :unprocessable_entity
            end
        end
    end
end