class Workout < ActiveRecord::Base

  validates :date, presence: true
  validates :distance, presence: true, numericality: true
  validates :duration, presence: true
  validates :comment, length: { maximum: 500 }

end
