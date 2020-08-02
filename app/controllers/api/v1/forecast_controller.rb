class Api::V1::ForecastController<ApplicationController
  def index
    location_results = Location.new(params[:location])
    latitude = location_results.latitude
    longitude = location_results.longitude
    forecast = Forecast.new(latitude, longitude)
    render json: ForecastSerializer.new(forecast)
  end
end
