require "application_system_test_case"

class OperationAttributesTest < ApplicationSystemTestCase
  setup do
    @operation_attribute = operation_attributes(:one)
  end

  test "visiting the index" do
    visit operation_attributes_url
    assert_selector "h1", text: "Operation attributes"
  end

  test "should create operation attribute" do
    visit operation_attributes_url
    click_on "New operation attribute"

    fill_in "Name", with: @operation_attribute.name
    fill_in "Operation", with: @operation_attribute.operation_id
    fill_in "Values", with: @operation_attribute.values
    click_on "Create Operation attribute"

    assert_text "Operation attribute was successfully created"
    click_on "Back"
  end

  test "should update Operation attribute" do
    visit operation_attribute_url(@operation_attribute)
    click_on "Edit this operation attribute", match: :first

    fill_in "Name", with: @operation_attribute.name
    fill_in "Operation", with: @operation_attribute.operation_id
    fill_in "Values", with: @operation_attribute.values
    click_on "Update Operation attribute"

    assert_text "Operation attribute was successfully updated"
    click_on "Back"
  end

  test "should destroy Operation attribute" do
    visit operation_attribute_url(@operation_attribute)
    click_on "Destroy this operation attribute", match: :first

    assert_text "Operation attribute was successfully destroyed"
  end
end
