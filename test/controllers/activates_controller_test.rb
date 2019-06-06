require 'test_helper'

class ActivatesControllerTest < ActionDispatch::IntegrationTest
  test "should get signup" do
    get '/signup'
    assert_response :success
    assert_select "title", "Регистрация | #{@base_title}"
  end
end
