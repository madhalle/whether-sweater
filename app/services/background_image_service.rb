class BackgroundImageService
  def initialize(location)
    @location = location
  end

  def get_background_image
    results = conn.get("/search/photos") do |req|
      req.params[:query] = "city of " + @location
      req.params[:client_id] = ENV["UNSPLASH_API_KEY"]
      req.headers["Accept-Version"] = "v1"
    end
    JSON.parse(results.body, symolize_names: true)
  end
  private

  def conn
    Faraday.new("https://api.unsplash.com")
  end
end
