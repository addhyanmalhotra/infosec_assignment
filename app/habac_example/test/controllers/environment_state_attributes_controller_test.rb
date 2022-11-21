require "test_helper"

class EnvironmentStateAttributesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @environment_state_attribute = environment_state_attributes(:one)
  end

  test "should get index" do
    get environment_state_attributes_url
    assert_response :success
  end

  test "should get new" do
    get new_environment_state_attribute_url
    assert_response :success
  end

  test "should create environment_state_attribute" do
    assert_difference("EnvironmentStateAttribute.count") do
      post environment_state_attributes_url, params: { environment_state_attribute: { environment_state_id: @environment_state_attribute.environment_state_id, name: @environment_state_attribute.name, values: @environment_state_attribute.values } }
    end

    assert_redirected_to environment_state_attribute_url(EnvironmentStateAttribute.last)
  end

  test "should show environment_state_attribute" do
    get environment_state_attribute_url(@environment_state_attribute)
    assert_response :success
  end

  test "should get edit" do
    get edit_environment_state_attribute_url(@environment_state_attribute)
    assert_response :success
  end

  test "should update environment_state_attribute" do
    patch environment_state_attribute_url(@environment_state_attribute), params: { environment_state_attribute: { environment_state_id: @environment_state_attribute.environment_state_id, name: @environment_state_attribute.name, values: @environment_state_attribute.values } }
    assert_redirected_to environment_state_attribute_url(@environment_state_attribute)
  end

  test "should destroy environment_state_attribute" do
    assert_difference("EnvironmentStateAttribute.count", -1) do
      delete environment_state_attribute_url(@environment_state_attribute)
    end

    assert_redirected_to environment_state_attributes_url
  end
end
