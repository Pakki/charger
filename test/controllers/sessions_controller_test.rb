require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client = clients(:one)
    @connector = connectors(:three)
    @unfinished_session = sessions(:three)
  end

  test 'should get index' do
    get sessions_url, as: :json
    assert_response :success
  end

  test 'should create session' do
    assert_difference('Session.count') do
      post sessions_url,
           params: { session: { client_id: @client.id,
                                connector_id: @connector.id } },
           as: :json
      @session_id = JSON.parse(response.body)['id']
    end

    assert_response :created
  end

  test 'should show session' do
    get sessions_url(@unfinished_session.id), as: :json
    assert_response :success
  end

  test 'should update session' do
    post "/sessions/#{@unfinished_session.id}/stop",
         params: { session: { id: @unfinished_session.id,
                              charged: 111 } },
         as: :json
    assert_response :success
  end
end
