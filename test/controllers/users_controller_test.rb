require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @site_name = "Microposter"
  end

  test "should get new" do
    get signup_path
    assert_response :success
    assert_select "title", "Sign Up | #{@site_name}"
    assert_equal full_title("Sign Up"), "Sign Up | #{@site_name}"
  end

end
