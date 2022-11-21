require "test_helper"

class EnvironmentStatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @environment_state = environment_states(:one)
  end

  test "should get index" do
    get environment_states_url
    assert_response :success
  end

  test "should get new" do
    get new_environment_state_url
    assert_response :success
  end

  test "should create environment_state" do
    assert_difference("EnvironmentState.count") do
      post environment_states_url, params: { environment_state: { name: @environment_state.name } }
    end

    assert_redirected_to environment_state_url(EnvironmentState.last)
  end

  test "should show environment_state" do
    get environment_state_url(@environment_state)
    assert_response :success
  end

  test "should get edit" do
    get edit_environment_state_url(@environment_state)
    assert_response :success
  end

  test "should update environment_state" do
    patch environment_state_url(@environment_state), params: { environment_state: { name: @environment_state.name } }
    assert_redirected_to environment_state_url(@environment_state)
  end

  test "should destroy environment_state" do
    assert_difference("EnvironmentState.count", -1) do
      delete environment_state_url(@environment_state)
    end

    assert_redirected_to environment_states_url
  end
end
