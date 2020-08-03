class DistanceToService
  def find_distance(current_location, trail_address)
    response = conn.get("/directions/v2/route") do |req|
      req.params[:key] = ENV['MAPQUEST_API_KEY']
      req.params[:from] = current_location
      req.params[:to] = trail_address

    end
    result = JSON.parse(response.body, symbolize_names: true)
    return result[:route][:distance]
  end

  private

  def conn
    Faraday.new("http://www.mapquestapi.com")
  end
end
