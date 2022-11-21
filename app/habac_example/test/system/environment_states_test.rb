require "application_system_test_case"

class EnvironmentStatesTest < ApplicationSystemTestCase
  setup do
    @environment_state = environment_states(:one)
  end

  test "visiting the index" do
    visit environment_states_url
    assert_selector "h1", text: "Environment states"
  end

  test "should create environment state" do
    visit environment_states_url
    click_on "New environment state"

    fill_in "Name", with: @environment_state.name
    click_on "Create Environment state"

    assert_text "Environment state was successfully created"
    click_on "Back"
  end

  test "should update Environment state" do
    visit environment_state_url(@environment_state)
    click_on "Edit this environment state", match: :first

    fill_in "Name", with: @environment_state.name
    click_on "Update Environment state"

    assert_text "Environment state was successfully updated"
    click_on "Back"
  end

  test "should destroy Environment state" do
    visit environment_state_url(@environment_state)
    click_on "Destroy this environment state", match: :first

    assert_text "Environment state was successfully destroyed"
  end
end
