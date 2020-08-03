class TrailsService

  def get_trails(latitude, longitude)
    response = conn.get("/data/get-trails") do |req|
      req.params[:lat] = latitude
      req.params[:lon] = longitude
      req.params[:maxDistance]
      req.params[:sort] = "distance"
      req.params[:key] = ENV["HIKING_PROJ_API"]
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new("https://www.hikingproject.com")
  end
end
