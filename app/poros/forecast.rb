class Forecast
  def initialize(latitude, longitude)
    @weather_results = WeatherService.new.get_weather_report(latitude, longitude)
    
  end
end
