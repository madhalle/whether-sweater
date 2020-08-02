class BackgroundImageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :image_urls, :description, :photographer_info
  set_id :nil_id
end
