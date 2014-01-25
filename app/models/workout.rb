class Workout < ActiveRecord::Base

  validates :date, presence: true
  validates :distance, presence: true, numericality: true
  validates :duration, presence: true
  validates :comment, length: { maximum: 500 }

  def self.average_speed
    self.count == 0 ? 0 : self.sum('distance') / (self.sum('duration') / 3600.0)
  end

  def self.average_per_week
    self.count == 0 ? 0 : self.count.to_f / (Date.parse(self.maximum('date').to_s).cweek - Date.parse(self.minimum('date').to_s).cweek + 1)
  end

  def time_period
    @time_period ||= TimePeriod.from_seconds(duration)
  end

  def time_period=(string)
    @time_period = TimePeriod.from_s(string)
  end

end
