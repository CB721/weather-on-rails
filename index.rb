require 'net/http'

# get user coordinates
def get_user_coords()
    lat = 0
    lon = 0
    while lat == 0
        puts "Please enter your latitude"
        lat = gets.to_i
    end
    while lon == 0
        puts "Please enter your longititude"
        lon = gets.to_i
    end
    return lat, lon
end

# make request to open weather api
def get_weather()
    coords = get_user_coords
    lat = coords.first
    lon = coords[1]
    uri = URI("http://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lon}&appid=95e1597bd5768bde56e965c059d28cdf&units=imperial")
    return Net::HTTP.get(uri)
end
# return weather data
puts get_weather()
