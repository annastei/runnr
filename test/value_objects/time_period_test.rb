require 'test_helper'

class TimePeriodTest < ActiveSupport::TestCase

  def test_initialization
    t1 = TimePeriod.new(3600 + 120 + 15)
    assert_equal 1, t1.hours
    assert_equal 2, t1.minutes
    assert_equal 15, t1.seconds
  end

end
