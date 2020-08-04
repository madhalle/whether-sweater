class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :origin, :destination, :time_to, :forecast
  set_id :id
end
