require 'test_helper'

class WorkoutsControllerTest < ActionController::TestCase

  def test_count
    get :count, :format => :json
    assert_response :success
    data = JSON.parse @response.body
    assert_not_nil data["count"]
    assert_equal 1, data.size
  end

  def test_average_speed
    get :average_speed, :format => :json
    assert_response :success
    data = JSON.parse @response.body
    assert_not_nil data["average_speed"]
    assert_equal 1, data.size
  end

  def test_average_per_week
    get :average_per_week, :format => :json
    assert_response :success
    data = JSON.parse @response.body
    assert_not_nil data["average_per_week"]
    assert_equal 1, data.size
  end

  def test_statistics_contents
    get :statistics, :format => :json
    assert_response :success
    data = JSON.parse @response.body
    assert_not_nil data["count"]
    assert_not_nil data["average_speed"]
    assert_not_nil data["average_per_week"]
    assert_equal 3, data.size
  end

end
