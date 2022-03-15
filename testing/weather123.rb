require 'open-weather-ruby-client'

# adding a comment - another change
CLIENT = OpenWeather::Client.new(
  api_key: "API_KEY"
)

# 1. Ability to get different types of data, e.g. difference in weather between 2 places
# 2. Instead of current weather, get a forecast for the week and format each day's data with "puts"
# 3. In addition to the current weather of a city/country combination, include the weather of the country itself and show comparison
# (e.g. "Berlin feels like 50, but Germany generally feels like 45")

def get_weather(city, country)
  weather_data = CLIENT.current_weather(
      city: city,
      country: country,
      units: "metric"
    )

    weather_data.main.feels_like
  rescue Faraday::ResourceNotFound => e
    puts "City or country not found. Please try again."
    return # kill the execution of the entire program
  end

def get_weather2(city, country)
  weather_data = CLIENT.current_weather(
      city: city,
      country: country,
      units: "metric"
    )

    weather_data.main.feels_like
  rescue Faraday::ResourceNotFound => e
    puts "City or country not found. Please try again."
    return # kill the execution of the entire program
  end

puts "Please provide a city 1"
city = gets.chomp # captures user input
puts "Please provide a country 1"
country = gets.chomp
puts "Please provide a city 2"
city2 = gets.chomp # captures user input
puts "Please provide a country 2"
country2 = gets.chomp

temperature = get_weather(city, country)
temperature2 = get_weather(city2, country2)

if temperature > temperature2
  puts "The weather today in #{city}, #{country} is #{temperature} - #{temperature2} degrees higher than in #{city2}, #{country2}"
  elsif temperature == temperature2
  puts "The weather today in #{city}, #{country} is the same as in #{city2}, #{country2}"
  else
  puts "The weather today in #{city}, #{country} is #{temperature} - #{temperature2} degrees lower than in #{city2}, #{country2}"
end
