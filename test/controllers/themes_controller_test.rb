require 'test_helper'

class ThemesControllerTest < ActionDispatch::IntegrationTest
  test "should get create_lecture" do
    get '/themes/:id/create_lecture'
    assert_response :success
    assert_select "title", "Создать лекцию | #{@base_title}"
  end
end
