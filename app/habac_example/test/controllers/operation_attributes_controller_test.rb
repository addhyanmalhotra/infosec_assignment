require "test_helper"

class OperationAttributesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @operation_attribute = operation_attributes(:one)
  end

  test "should get index" do
    get operation_attributes_url
    assert_response :success
  end

  test "should get new" do
    get new_operation_attribute_url
    assert_response :success
  end

  test "should create operation_attribute" do
    assert_difference("OperationAttribute.count") do
      post operation_attributes_url, params: { operation_attribute: { name: @operation_attribute.name, operation_id: @operation_attribute.operation_id, values: @operation_attribute.values } }
    end

    assert_redirected_to operation_attribute_url(OperationAttribute.last)
  end

  test "should show operation_attribute" do
    get operation_attribute_url(@operation_attribute)
    assert_response :success
  end

  test "should get edit" do
    get edit_operation_attribute_url(@operation_attribute)
    assert_response :success
  end

  test "should update operation_attribute" do
    patch operation_attribute_url(@operation_attribute), params: { operation_attribute: { name: @operation_attribute.name, operation_id: @operation_attribute.operation_id, values: @operation_attribute.values } }
    assert_redirected_to operation_attribute_url(@operation_attribute)
  end

  test "should destroy operation_attribute" do
    assert_difference("OperationAttribute.count", -1) do
      delete operation_attribute_url(@operation_attribute)
    end

    assert_redirected_to operation_attributes_url
  end
end
