class Workout < ActiveRecord::Base

  validates :date, presence: true
  validates :distance, presence: true, numericality: true
  validates :comment, length: { maximum: 500 }
  validate :duration_must_be_larger_than_zero, on: :create

  def self.from_form(form_workout)
    workout = Workout.new
    ['date', 'distance', 'time_period', 'comment'].each do |attr|
      send("#{attr}=", form_workout.send(attr))
    end
  end

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
    self.duration = TimePeriod.from_s(string).total_seconds
  end

  def duration_must_be_larger_than_zero
    if duration <= 0
      errors.add(:time_period, "must be greater than zero")
    end
  end

end
