require 'test_helper'

class FormWorkoutTest < ActiveSupport::TestCase

  def test_time_period_validation
    form_workout = build :form_workout, {time_period: '1:02:15'}
    assert form_workout.valid?
  end

  def test_time_period_validation_min_sec
    form_workout = build :form_workout, {time_period: '2:15'}
    assert form_workout.valid?
  end

  def test_time_period_validation_sec
    form_workout = build :form_workout, {time_period: '15'}
    assert form_workout.valid?
  end

  def test_time_period_non_numeric
    form_workout = build :form_workout, {time_period: 'foobar'}
    assert !form_workout.valid?
  end

  def test_time_period_faulty_syntax
    form_workout = build :form_workout, {time_period: '2::4'}
    assert !form_workout.valid?
  end

end
