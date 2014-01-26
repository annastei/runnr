class FormWorkout

  include ActiveModel::Model

  attr_accessor :date, :distance, :time_period, :comment

  validates :date, presence: true
  validates :distance, presence: true, numericality: true
  validates :time_period, presence: true, format: { with: /\A([0-9]+:){0,2}[0-9]+\z/, message: "must be on the form hh:mm:ss, mm:ss or ss" }
  validates :comment, length: { maximum: 500 }

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

end
