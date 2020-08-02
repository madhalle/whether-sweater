class BackgroundImage
  attr_reader :description, :image_urls, :photographer_info, :nil_id
  def initialize(location)
    @background_image = BackgroundImageService.new(location).get_background_image
    @description = @background_image["results"].first["description"]
    @image_urls = @background_image["results"].first["urls"]
    @photographer_info = @background_image["results"].first["user"]
    @nil_id = nil
  end
end
