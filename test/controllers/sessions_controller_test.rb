require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get '/login'
    assert_response :success
    assert_select "title", "Вход | Education ONPU"
  end
end
