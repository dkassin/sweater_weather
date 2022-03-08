class Direction
  attr_reader :hour, :min, :start_latlng, :end_latlng, :arrival_time, :rounded_hours

  def initialize(data)
    @time = data[:route][:formattedTime].split(':')
    @hour = @time[0].to_i
    @min = @time[1].to_i + (@time[2].to_f/60).round
    @start_latlng = data[:route][:boundingBox][:ul]
    @end_latlng = data[:route][:boundingBox][:lr]
    @current_time = Time.now.round
    @arrival_time = @current_time + (((@hour * 60)+(@min))*60)
    @rounded_hours = (@hour + ((@time[1].to_f)/60).round).to_i
  end
end
