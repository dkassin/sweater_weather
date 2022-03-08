class Direction
  attr_reader :hour, :min, :rounded_hours, :message

  def initialize(data)
      @time = data[:route][:formattedTime].split(':')
      @hour = @time[0].to_i
      @min = @time[1].to_i + (@time[2].to_f/60).round
      @rounded_hours = (@hour + ((@time[1].to_f)/60).round).to_i
      @message = []
  end
end
