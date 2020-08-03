class TrailSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location, :forecast, :trails
  set_id :id
end
