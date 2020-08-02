class Forecast
  attr_reader :current, :hourly, :daily, :nil_id
  def initialize(latitude, longitude)
    @weather_results = WeatherService.new.get_weather_report(latitude, longitude)
    @current = @weather_results[:current]
    @hourly = @weather_results[:hourly]
    @daily = @weather_results[:daily]
    @nil_id = nil
  end
end
