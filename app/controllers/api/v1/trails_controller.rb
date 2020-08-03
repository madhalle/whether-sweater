class Api::V1::TrailsController<ApplicationController
  def index
    location_results = Location.new(params[:location])
    trail_results = location_results.get_trails
    NewTrailService.new.create_trails(location_results, trail_results)
    latitude = location_results.latitude
    longitude = location_results.longitude
    forecast = Forecast.new(latitude, longitude).current
    require "pry"; binding.pry
    # trails_restults = TrailsService.new(latitude, longitude).get_trails
  end
end
