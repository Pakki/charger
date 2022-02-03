require "test_helper"

class StationTest < ActiveSupport::TestCase

  def setup
    @station = points(:one).stations.new(sn: '12345678')
  end
  
  test 'point should be present' do
    @station.point = nil
    assert_not @station.valid?
  end

end
