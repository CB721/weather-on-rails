require 'net/http'
require 'dotenv'

module Api
    module V1
        class NewsController < ApplicationController
            def index
                Dotenv.load
                key = ENV['NEWS_KEY']
                sources = params[:sources]
                url = URI("https://newsapi.org/v2/everything?q=politics&language=en&sources=#{sources}&apiKey=#{key}")
                news = Net::HTTP.get(url)
                render json: news, status: 200
            end
        end
    end
end