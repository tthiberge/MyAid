if ENV["IS_HEROKU"]
  module Net
    class HTTP
      alias_method :original_use_ssl=, :use_ssl=

      def use_ssl=(flag)
        self.ca_file = "/usr/lib/ssl/certs/ca-certificates.crt"
        self.verify_mode = OpenSSL::SSL::VERIFY_PEER
        self.original_use_ssl = flag
      end
    end
  end
end



OPENWEATHER_CLIENT = OpenWeather::Client.new(
  api_key: ENV["OPENWEATHER_API_KEY"]
)
