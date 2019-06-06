require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get '/create'
    assert_response :success
    assert_select "title", "Создать аккаунт | #{@base_title}"
  end
end
