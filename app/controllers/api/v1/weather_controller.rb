require 'net/http'
require 'dotenv'

module Api
    module V1
        class WeatherController < ApplicationController
            def index
                headers['Access-Control-Allow-Origin'] = '*'
                headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
                headers['Access-Control-Request-Method'] = '*'
                headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
                Dotenv.load
                key = ENV['WEATHER_KEY']
                lat = params[:lat]
                long = params[:long]
                todayWeather = URI("http://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{long}&appid=#{key}&units=imperial")
                weather = Net::HTTP.get(todayWeather)
                render json: {status: 'SUCCESS', message: 'Loaded Weather', data: weather}, status: 200
            end

            def create
                headers['Access-Control-Allow-Origin'] = '*'
                headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
                headers['Access-Control-Request-Method'] = '*'
                headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
                Dotenv.load
                key = ENV['WEATHER_KEY']
                lat = params[:lat]
                long = params[:long]
                todayWeather = URI("https://api.openweathermap.org/data/2.5/forecast?lat=#{lat}&lon=#{long}&appid=#{key}&units=imperial")
                weather = Net::HTTP.get(todayWeather)
                render json: {status: 'SUCCESS', message: 'Loaded Forecast', data: weather}, status: 201
            end

            def delete
                render json: {status: 'Error', message: 'Invalid Request'}, status: :unprocessable_entity
            end
        end

    end
end