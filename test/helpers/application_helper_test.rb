require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase

  def setup
    @site_name = "Microposter"
  end

  test "full title helper" do
    assert_equal @site_name, full_title
    assert_equal "Contact Us | #{@site_name}", full_title("Contact Us")
  end
end