class Invalid
  attr_reader :message

  def initialize(data)
    @message = data[:info][:messages][0]
  end
end
