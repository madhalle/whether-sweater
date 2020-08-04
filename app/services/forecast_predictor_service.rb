require "time"
class ForecastPredictorService
  def initialize(destination_forecast, time_to)
    @hourly_forecast = destination_forecast
    @time_to = time_to
    @arrival_time = Time.at(arrival_calculator).utc.strftime("%Y%m%d%H")
  end

  def arrival_calculator
    (Time.now.to_i.seconds) + @time_to[:total_time_in_seconds].seconds
  end

  def find_weather_at_destination
    @hourly_forecast.select do |forecast|
      return forecast[:temp] if Time.at(forecast[:dt]).utc.strftime("%Y%m%d%H") == @arrival_time
    end
  end
end
