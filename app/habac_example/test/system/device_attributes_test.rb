require "application_system_test_case"

class DeviceAttributesTest < ApplicationSystemTestCase
  setup do
    @device_attribute = device_attributes(:one)
  end

  test "visiting the index" do
    visit device_attributes_url
    assert_selector "h1", text: "Device attributes"
  end

  test "should create device attribute" do
    visit device_attributes_url
    click_on "New device attribute"

    fill_in "Device", with: @device_attribute.device_id
    fill_in "Name", with: @device_attribute.name
    fill_in "Values", with: @device_attribute.values
    click_on "Create Device attribute"

    assert_text "Device attribute was successfully created"
    click_on "Back"
  end

  test "should update Device attribute" do
    visit device_attribute_url(@device_attribute)
    click_on "Edit this device attribute", match: :first

    fill_in "Device", with: @device_attribute.device_id
    fill_in "Name", with: @device_attribute.name
    fill_in "Values", with: @device_attribute.values
    click_on "Update Device attribute"

    assert_text "Device attribute was successfully updated"
    click_on "Back"
  end

  test "should destroy Device attribute" do
    visit device_attribute_url(@device_attribute)
    click_on "Destroy this device attribute", match: :first

    assert_text "Device attribute was successfully destroyed"
  end
end
