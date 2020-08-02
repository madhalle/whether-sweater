class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :current, :hourly, :daily
  set_id :nil_id
end
