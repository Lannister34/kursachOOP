require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Name", email: "1@a.com", password: "123321", code: "scz")
  end

  test "should be valid" do
    assert @user.valid?
  end


  test "code should be present" do
    @user.code = "     "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end


  test "email addresses should be saved as lower-case" do
  mixed_case_email = "Foo@ExAMPle.CoM"
  @user.email = mixed_case_email
  @user.save
  assert_equal mixed_case_email.downcase, @user.reload.email
end

end
