class NewTrailService

  def create_trails(location_results, trail_results)
    trails = []
    trail_results[:trails].each do |trail|
      # trail_address = ReverseGeocodeService.new.get_address(trail[:longitude], trail[:latitude])
      trail_address = "#{trail[:latitude]},#{trail[:longitude]}"
      distance = DistanceToService.new.find_distance(location_results, trail_address)
      trails<< ForTrailsTrail.new(name: trail[:name],
                    summary: trail[:summary],
                    difficulty: trail[:difficulty],
                    location: trail[:location],
                    distance_to_trail: distance

                    )
      
    end
    trails
  end
end
