require "test_helper"

class AuthRulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_rule = auth_rules(:one)
  end

  test "should get index" do
    get auth_rules_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_rule_url
    assert_response :success
  end

  test "should create auth_rule" do
    assert_difference("AuthRule.count") do
      post auth_rules_url, params: { auth_rule: { da: @auth_rule.da, dav: @auth_rule.dav, esa: @auth_rule.esa, esav: @auth_rule.esav, oa: @auth_rule.oa, oav: @auth_rule.oav, operation_id: @auth_rule.operation_id, ua: @auth_rule.ua, uav: @auth_rule.uav } }
    end

    assert_redirected_to auth_rule_url(AuthRule.last)
  end

  test "should show auth_rule" do
    get auth_rule_url(@auth_rule)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_rule_url(@auth_rule)
    assert_response :success
  end

  test "should update auth_rule" do
    patch auth_rule_url(@auth_rule), params: { auth_rule: { da: @auth_rule.da, dav: @auth_rule.dav, esa: @auth_rule.esa, esav: @auth_rule.esav, oa: @auth_rule.oa, oav: @auth_rule.oav, operation_id: @auth_rule.operation_id, ua: @auth_rule.ua, uav: @auth_rule.uav } }
    assert_redirected_to auth_rule_url(@auth_rule)
  end

  test "should destroy auth_rule" do
    assert_difference("AuthRule.count", -1) do
      delete auth_rule_url(@auth_rule)
    end

    assert_redirected_to auth_rules_url
  end
end
