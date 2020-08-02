class BackgroundImage
  def initialize(location)
    @background_image = BackgroundImageService.new(location)
  end
end
