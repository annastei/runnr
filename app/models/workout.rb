class Workout < ActiveRecord::Base

  validates :date, presence: true
  validates :distance, presence: true, numericality: true
  validates :comment, length: { maximum: 500 }
  validate :duration_string_format, on: :create
  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }

  attr_accessor :duration_string

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
    self.duration = TimePeriod.from_s(string).total_seconds if !string.blank?
  end

  def duration_string=(string)
    if !string.blank?
      @duration_string = string
      self.time_period = string
    end
  end

  def duration_string_format
    if !duration_string.nil? && duration_string !~ /\A([0-9]+:){0,2}[0-9]+\z/
      errors.add(:duration, "must be on the format hh:mm:ss, mm:ss or ss")
    end
  end

end
