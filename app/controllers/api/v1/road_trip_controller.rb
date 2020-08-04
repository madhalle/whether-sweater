class Api::V1::RoadTripController<ApplicationController
  def create
    destination = Location.new(params[:destination])
    lat= destination.latitude
    lon= destination.longitude
    forecast = Forecast.new(lat, lon).hourly
    time_to = DistanceToService.new(params[:origin], params[:destination]).travel_time
    predicted_forecast = ForecastPredictorService.new(forecast, time_to).find_weather_at_destination
    trip = RoadTrip.new((params[:origin]), params[:destination], time_to, predicted_forecast)
    render json: RoadTripSerializer.new(trip)
  end
end
