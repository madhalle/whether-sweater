class DistanceToService
  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def travel_time
    response = conn.get("/directions/v2/route") do |req|
      req.params[:key] = ENV['MAPQUEST_API_KEY']
      req.params[:from] = @origin
      req.params[:to] = @destination
    end
    result = JSON.parse(response.body, symbolize_names:true)
    hours = result[:route][:realTime]/3600
    total_time_in_seconds = result[:route][:realTime]
    minutes = (result[:route][:realTime]%3600)/60
    return {hours: hours, minutes: minutes, total_time_in_seconds: total_time_in_seconds }
  end

  private

  def conn
    Faraday.new("http://www.mapquestapi.com")
  end
end
