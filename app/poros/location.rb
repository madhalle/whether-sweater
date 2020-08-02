class Location

  def initialize(location)
    @location_results = LocationService.new(location).get_location
  end

  def latitude
    @location_results[:results][0][:locations][0][:latLng][:lat]
  end

  def longitude
    @location_results[:results][0][:locations][0][:latLng][:lng]
  end
end
 
