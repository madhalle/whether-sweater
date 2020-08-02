class LocationService
  def initialize(location)
    @location = location
  end

  def get_location
    response = conn.get("/geocoding/v1/address") do |req|
      req.params[:key] = ENV['MAPQUEST_API_KEY']
      req.params[:location] = @location
    end
    v = JSON.parse(response.body, symbolize_names: true)

  end
  private

  def conn
    Faraday.new("http://www.mapquestapi.com")
  end
end
