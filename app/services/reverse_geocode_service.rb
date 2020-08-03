class ReverseGeocodeService
  def get_address(longitude, latitude)
    location = "#{latitude}, #{longitude}"
    response = conn.get("/geocoding/v1/reverse") do |req|
      req.params[:key] = ENV['MAPQUEST_API_KEY']
      req.params[:location] = location,
      req.params[:outFormat] = "json"
    end
    v= JSON.parse(response.body, symbolise_names:true )
    require "pry"; binding.pry
  end

  private

  def conn
    Faraday.new("http://www.mapquestapi.com")
  end
end
