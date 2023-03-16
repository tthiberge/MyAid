

if ENV["IS_HEROKU"]
  OpenWeather.configure do |config|
    config.ca_file = "/usr/lib/ssl/certs/ca-certificates.crt"
  end
end



OPENWEATHER_CLIENT = OpenWeather::Client.new(
  api_key: ENV["OPENWEATHER_API_KEY"]
)
