class WeatherService

  def get_weather_report(latitude, longitude)
    results = conn.get("/data/2.5/onecall") do |req|
      req.params[:lat]= latitude
      req.params[:lon]= longitude
      req.params[:exclude]= "minutely"
      req.params[:appid]= ENV["WEATHER_MAP_API"]
      req.params[:units] = "imperial"
    end
    JSON.parse(results.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new("https://api.openweathermap.org")
  end
end
