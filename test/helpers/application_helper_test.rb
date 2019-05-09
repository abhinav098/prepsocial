require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,  "PrepSocial"
    assert_equal full_title("Help"), "Help | PrepSocial"
    assert_equal full_title("About"), "About | PrepSocial"
    assert_equal full_title("Contact"), "Contact | PrepSocial"
  end
end
