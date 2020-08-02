class Api::V1::BackgroundsController < ApplicationController
  def index
    image = BackgroundImage.new(params[:location])
    render json: BackgroundImageSerializer.new(image)
  end
end
