class Trail
  attr_reader :location, :forecast, :trails, :id
  def initialize(location, forecast, trails)
    @location = location
    @forecast = {"summary": forecast[:weather][0][:description],"temperature": forecast[:temp]}
    @trails = trails
    @id = nil
  end
end
