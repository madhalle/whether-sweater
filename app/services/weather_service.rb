class WeatherService

  def get_weather_report(latitude, longitude)
    # code
  end

  private

  def conn
    results = Faraday.new()
  end
end
