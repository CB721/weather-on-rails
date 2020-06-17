require 'net/http'

module Api
    module V1
        class WeatherController < ApplicationController
            def index
                lat = params[:lat]
                long = params[:long]
                uri = URI("http://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{long}&appid=95e1597bd5768bde56e965c059d28cdf&units=imperial")
                weather = Net::HTTP.get(uri);
                render json: {status: 'SUCCESS', message: 'Loaded Weather', data: weather}, status: :ok
            end
        end
    end
end