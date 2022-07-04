require "test_helper"

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: "zsolo", email: "zsolo@example.com", password: "secret", password_confirmation: "secret")
  end
  
  # user should be valid
  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "    "
    # refute is the same as 'assert_not'
    refute @user.valid?
  end

  test "email should be present" do
    @user.email = "  "
    refute @user.valid?
  end

  test "name should not be too short" do
    @user.name = "aa"
    refute @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    refute @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    refute @user.valid?
  end

  test "should accept valid email addresses" do
    valid_emails = %w(user@example.com USER@example.COM user_name@example.com user.name@example.com user+name@example.com user-name@example.com user@example.bar.com)

    valid_emails.each do |valid_email|
      @user.email = valid_email
      assert @user.valid?, "#{valid_email.inspect} should be accepted"
    end
  end

  test "should refuse invalid email addresses" do
    invalid_emails = %w(user_at_example.com user@example user@example_bar.com user@example+bar.com)

    invalid_emails.each do |invalid_email|
      @user.email = invalid_email
      refute @user.valid?, "#{invalid_email.inspect} should be rejected"
    end
  end

  test "email should be unique" do
    @user.save
    duplicate_user = @user.dup
    refute duplicate_user.valid?
  end

  test "password should not be blank" do
    @user.password = @user.password_confirmation = " " * 6
    refute @user.valid? #"#{@user.password_confirmation} #{@user.password}"
  end

  test "password should have a minimum length of 6 chars" do
    @user.password = @user.password_confirmation = "a" * 5
    refute @user.valid?
  end

end
