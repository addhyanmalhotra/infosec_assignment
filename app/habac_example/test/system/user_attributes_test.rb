require "application_system_test_case"

class UserAttributesTest < ApplicationSystemTestCase
  setup do
    @user_attribute = user_attributes(:one)
  end

  test "visiting the index" do
    visit user_attributes_url
    assert_selector "h1", text: "User attributes"
  end

  test "should create user attribute" do
    visit user_attributes_url
    click_on "New user attribute"

    fill_in "Name", with: @user_attribute.name
    fill_in "User", with: @user_attribute.user_id
    fill_in "Values", with: @user_attribute.values
    click_on "Create User attribute"

    assert_text "User attribute was successfully created"
    click_on "Back"
  end

  test "should update User attribute" do
    visit user_attribute_url(@user_attribute)
    click_on "Edit this user attribute", match: :first

    fill_in "Name", with: @user_attribute.name
    fill_in "User", with: @user_attribute.user_id
    fill_in "Values", with: @user_attribute.values
    click_on "Update User attribute"

    assert_text "User attribute was successfully updated"
    click_on "Back"
  end

  test "should destroy User attribute" do
    visit user_attribute_url(@user_attribute)
    click_on "Destroy this user attribute", match: :first

    assert_text "User attribute was successfully destroyed"
  end
end
