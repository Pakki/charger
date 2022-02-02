require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  def setup
    @client = Client.new(name: 'Buzz Lighter', phone_number: '23451234567')
  end

  test "client's name should be present" do
    @client.name = '    '
    assert_not @client.save
  end

  test "client's phone number should be present" do
    @client.phone_number = nil
    assert_not @client.save
  end

  test 'phone number should be 11 digits' do
    @client.phone_number = '1' * 12
    assert_not @client.valid?
  end
end
