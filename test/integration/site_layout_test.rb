require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
  test "layout links" do
    get root_path
    assert_response :success
    assert_template "static_pages/home"
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", about_path, count: 1, text: "About"
    assert_select "a[href=?]", help_path, count: 1, text: "Help"
    assert_select "a[href=?]", contact_path, count: 1, text: "Contact"
    assert_select "a[href=?]", signup_path
  end

end
