class TimePeriod

  attr_accessor :hours, :minutes, :seconds

  def self.from_seconds(seconds)
    time = self.new
    time.hours, seconds = seconds.divmod(3600)
    time.minutes, seconds = seconds.divmod(60)
    time.seconds = seconds
    time
  end

  def self.from_s(string)
    time = self.new
    arr = string.split ':'
    time.seconds = arr.pop.to_i
    time.minutes = arr.pop.to_i
    time.hours = arr.pop.to_i
    time
  end

  def total_seconds
    @hours * 3600 + @minutes * 60 + @seconds
  end

  def hash
    self.to_s.hash
  end

  def eql?(other)
    to_s == other.to_s
  end

  def to_s
    "#{@hours}:#{@minutes}:#{@seconds}"
  end

end
