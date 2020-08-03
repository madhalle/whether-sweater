class Api::V1::TrailsController<ApplicationController
  def index
    location = params[:location]
    location_results = Location.new(params[:location])
    trail_results = location_results.get_trails
    trails = NewTrailService.new.create_trails(location, trail_results)
    latitude = location_results.latitude
    longitude = location_results.longitude
    forecast = Forecast.new(latitude, longitude).current
    trail_result = Trail.new(location, forecast, trails)
    render json: TrailSerializer.new(trail_result)
    # trails_restults = TrailsService.new(latitude, longitude).get_trails
  end
end
