class NewTrailService
  def create_trails(location_results, trail_results)
    trail_results[:trails].each do |trail|
      trail_address = ReverseGeocodeService.new.get_address(trail[:longitude], trail[:latitude])
      distance = DistanceToService.new.find_distance(location_results, trail_address)
      Trail.create!(name: trails[:name],
                    summary: trails[:summary],
                    difficulty: trails[:difficulty],
                    location: trails[:location],
                    distance_to_trail: distance
                    )
    end
  end
end
