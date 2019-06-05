require 'test_helper'

class TestsControllerTest < ActionDispatch::IntegrationTest
  test "should get create_test" do
    get '/tests/create_test'
    assert_response :success
    assert_select "title", "Создать тест | Education ONPU"
  end

  test "should get show_test" do
    get '/tests/:id'
    assert_response :success
    assert_select "title", " {title} | Education ONPU"
  end

  test "should get add_question" do
    get '/tests/:id/add_question'
    assert_response :success
  end
end
