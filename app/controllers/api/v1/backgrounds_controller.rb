class Api::V1::BackgroundsController < ApplicationController
  def index
    image = BackgroundImage.new(location)
    BackgroundSerializer.new(image)
  end
end
