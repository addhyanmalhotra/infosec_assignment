require "application_system_test_case"

class EnvironmentStateAttributesTest < ApplicationSystemTestCase
  setup do
    @environment_state_attribute = environment_state_attributes(:one)
  end

  test "visiting the index" do
    visit environment_state_attributes_url
    assert_selector "h1", text: "Environment state attributes"
  end

  test "should create environment state attribute" do
    visit environment_state_attributes_url
    click_on "New environment state attribute"

    fill_in "Environment state", with: @environment_state_attribute.environment_state_id
    fill_in "Name", with: @environment_state_attribute.name
    fill_in "Values", with: @environment_state_attribute.values
    click_on "Create Environment state attribute"

    assert_text "Environment state attribute was successfully created"
    click_on "Back"
  end

  test "should update Environment state attribute" do
    visit environment_state_attribute_url(@environment_state_attribute)
    click_on "Edit this environment state attribute", match: :first

    fill_in "Environment state", with: @environment_state_attribute.environment_state_id
    fill_in "Name", with: @environment_state_attribute.name
    fill_in "Values", with: @environment_state_attribute.values
    click_on "Update Environment state attribute"

    assert_text "Environment state attribute was successfully updated"
    click_on "Back"
  end

  test "should destroy Environment state attribute" do
    visit environment_state_attribute_url(@environment_state_attribute)
    click_on "Destroy this environment state attribute", match: :first

    assert_text "Environment state attribute was successfully destroyed"
  end
end
