class Location
  attr_reader :latitude, :longitude
  def initialize(location)
    @location_results = LocationService.new(location).get_location
    @latitude = @location_results[:results][0][:locations][0][:latLng][:lat]
    @longitude = @location_results[:results][0][:locations][0][:latLng][:lng]
  end

  def get_trails
    trails_restults = TrailsService.new.get_trails(@latitude, @longitude)
  end

  # def latitude
  #   @location_results[:results][0][:locations][0][:latLng][:lat]
  # end
  #
  # def longitude
  #   @location_results[:results][0][:locations][0][:latLng][:lng]
  # end
end
