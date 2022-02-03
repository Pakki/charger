require 'test_helper'

class ConnectorTest < ActiveSupport::TestCase
  def setup
    @station = stations(:one)
    @connector = @station.connectors.new(connector_type: :chademo, state: 1, power: 3.5)
  end

  test 'station should be present' do
    @connector.station = nil
    assert_not @connector.valid?
  end
end
