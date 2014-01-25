class TimePeriod

  attr_reader :hours, :minutes, :seconds

  def initialize(seconds)
    @total_seconds = seconds
    @hours, seconds = seconds.divmod(3600)
    @minutes, seconds = seconds.divmod(60)
    @seconds = seconds
  end

  def hash
    @total_seconds.hash
  end

  def eql?(other)
    to_s == other.to_s
  end

  def to_s
    @total_seconds.to_s
  end

end
