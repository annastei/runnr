require 'test_helper'

class TimePeriodTest < ActiveSupport::TestCase

  def test_from_seconds
    t1 = TimePeriod.from_seconds(3600 + 120 + 15)
    assert_equal 1, t1.hours
    assert_equal 2, t1.minutes
    assert_equal 15, t1.seconds
  end

  def test_from_string
    t1 = TimePeriod.from_s "1:02:15"
    assert_equal 1, t1.hours
    assert_equal 2, t1.minutes
    assert_equal 15, t1.seconds
  end

  def test_from_string_min_sec
    t1 = TimePeriod.from_s "02:15"
    assert_equal 0, t1.hours
    assert_equal 2, t1.minutes
    assert_equal 15, t1.seconds
  end

  def test_from_string_sec
    t1 = TimePeriod.from_s "15"
    assert_equal 0, t1.hours
    assert_equal 0, t1.minutes
    assert_equal 15, t1.seconds
  end

end
