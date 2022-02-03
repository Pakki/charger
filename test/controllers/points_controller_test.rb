require 'test_helper'

class PointsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @point = points(:one)
  end

  test 'should get index' do
    get points_url, as: :json
    assert_response :success
  end
end
