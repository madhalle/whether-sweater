class RoadTrip
  attr_reader :origin, :destination, :time_to, :forecast, :id
  def initialize(origin, destination, time_to, forecast)
    @origin = origin
    @destination = destination
    @time_to = time_to
    @forecast = forecast
    @id = nil
  end
end
