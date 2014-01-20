require 'test_helper'

class WorkoutTest < ActiveSupport::TestCase

  def test_default_is_zero
    assert_equal 0, Workout.count
  end

  def test_number
    workout = create :workout
    assert_equal 1, Workout.count
  end

  def test_average_speed_empty
    assert_equal 0, Workout.average_speed
  end

  def test_average_speed_one
    workout = create :workout, {duration: 30*60, distance: 5}
    assert_equal 10, Workout.average_speed
  end

  def test_average_workouts_per_week_empty
    assert_equal 0, Workout.average_per_week
  end

  def test_average_workouts_3weeks
    create :workout, {date: Time.zone.now}
    create :workout, {date: 2.week.ago}
    create :workout, {date: 2.week.ago}
    assert_equal 1, Workout.average_per_week
  end

end
