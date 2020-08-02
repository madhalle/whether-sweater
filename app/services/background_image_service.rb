class BackgroundImageService
  def initialize(location)
    @location = location
  end

  private

  def conn
    Faraday.new("")
  end
end
