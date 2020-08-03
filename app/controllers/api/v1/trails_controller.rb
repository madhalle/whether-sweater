class Api::V1::TrailsController<ApplicationController
  def index
    location_results = Location.new(params[:location]).get_trails
    latitude = location_results.latitude
    longitude = location_results.longitude
    forecast = Forecast.new(latitude, longitude).current
    # trails_restults = TrailsService.new(latitude, longitude).get_trails
  end
end
