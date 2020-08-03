class ReverseGeocodeService
  def get_address(longitude, latitude)
    location = "#{latitude},#{longitude}"
    response = conn.get("/geocoding/v1/reverse") do |req|
      req.params[:key] = ENV['MAPQUEST_API_KEY']
      req.params[:location] = location
      req.params[:includeRoadMetadata] = true
      req.params[:includeNearestIntersection] = true
    end
    results = JSON.parse(response.body, symbolise_names: true )
    street = results["results"][0]["locations"][0]["nearestIntersection"]["streetDisplayName"]
    city = results["results"][0]["locations"][0]["adminArea4"]
    state = results["results"][0]["locations"][0]["adminArea3"]
    zip = results["results"][0]["locations"][0]["postalCode"]
    return "#{street}, #{city}, #{state}, #{zip}"
  end

  private

  def conn
    Faraday.new("http://www.mapquestapi.com")
  end
end
