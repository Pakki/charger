require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @session = sessions(:one)
  end

  test 'should get index' do
    get sessions_url, as: :json
    assert_response :success
  end

  test 'should create session' do
    assert_difference('Session.count') do
      post sessions_url, params: { session: { client_id: @session.client_id, connector_id: @session.connector_id } },
                         as: :json
    end

    assert_response :created
  end

  test 'should show session' do
    get session_url(@session), as: :json
    assert_response :success
  end

  test 'should update session' do
    post "/sessions/#{@session.id}/stop", params: { session: { id: @session.id, charged: @session.charged } },
                                          as: :json
    assert_response :success
  end
end
