require 'test_helper'

class PageControllerTest < ActionDispatch::IntegrationTest
   test "should get home" do
    get '/'
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get about" do
    get '/about'
    assert_response :success
    assert_select "title", "Про нас | #{@base_title}"
  end
end
