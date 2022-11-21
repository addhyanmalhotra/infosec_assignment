require "test_helper"

class UserAttributesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_attribute = user_attributes(:one)
  end

  test "should get index" do
    get user_attributes_url
    assert_response :success
  end

  test "should get new" do
    get new_user_attribute_url
    assert_response :success
  end

  test "should create user_attribute" do
    assert_difference("UserAttribute.count") do
      post user_attributes_url, params: { user_attribute: { name: @user_attribute.name, user_id: @user_attribute.user_id, values: @user_attribute.values } }
    end

    assert_redirected_to user_attribute_url(UserAttribute.last)
  end

  test "should show user_attribute" do
    get user_attribute_url(@user_attribute)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_attribute_url(@user_attribute)
    assert_response :success
  end

  test "should update user_attribute" do
    patch user_attribute_url(@user_attribute), params: { user_attribute: { name: @user_attribute.name, user_id: @user_attribute.user_id, values: @user_attribute.values } }
    assert_redirected_to user_attribute_url(@user_attribute)
  end

  test "should destroy user_attribute" do
    assert_difference("UserAttribute.count", -1) do
      delete user_attribute_url(@user_attribute)
    end

    assert_redirected_to user_attributes_url
  end
end
