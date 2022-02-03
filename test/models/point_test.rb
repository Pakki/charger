require 'test_helper'

class PointTest < ActiveSupport::TestCase
  def setup
    @point = Point.new(title: 'Regular place', latitude: 55.767488, longitude: 37.658360)
  end

  test "Point's title should be present" do
    @point.title = '    '
    assert_not @point.valid?
  end

  test "Point's latitude should be present" do
    @point.latitude = nil
    assert_not @point.valid?
  end

  test "Point's longitude should be present" do
    @point.longitude = nil
    assert_not @point.valid?
  end
end
