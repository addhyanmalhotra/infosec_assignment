require "test_helper"

class DeviceAttributesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @device_attribute = device_attributes(:one)
  end

  test "should get index" do
    get device_attributes_url
    assert_response :success
  end

  test "should get new" do
    get new_device_attribute_url
    assert_response :success
  end

  test "should create device_attribute" do
    assert_difference("DeviceAttribute.count") do
      post device_attributes_url, params: { device_attribute: { device_id: @device_attribute.device_id, name: @device_attribute.name, values: @device_attribute.values } }
    end

    assert_redirected_to device_attribute_url(DeviceAttribute.last)
  end

  test "should show device_attribute" do
    get device_attribute_url(@device_attribute)
    assert_response :success
  end

  test "should get edit" do
    get edit_device_attribute_url(@device_attribute)
    assert_response :success
  end

  test "should update device_attribute" do
    patch device_attribute_url(@device_attribute), params: { device_attribute: { device_id: @device_attribute.device_id, name: @device_attribute.name, values: @device_attribute.values } }
    assert_redirected_to device_attribute_url(@device_attribute)
  end

  test "should destroy device_attribute" do
    assert_difference("DeviceAttribute.count", -1) do
      delete device_attribute_url(@device_attribute)
    end

    assert_redirected_to device_attributes_url
  end
end
