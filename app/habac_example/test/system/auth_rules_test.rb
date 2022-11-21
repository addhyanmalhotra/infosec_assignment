require "application_system_test_case"

class AuthRulesTest < ApplicationSystemTestCase
  setup do
    @auth_rule = auth_rules(:one)
  end

  test "visiting the index" do
    visit auth_rules_url
    assert_selector "h1", text: "Auth rules"
  end

  test "should create auth rule" do
    visit auth_rules_url
    click_on "New auth rule"

    fill_in "Da", with: @auth_rule.da
    fill_in "Dav", with: @auth_rule.dav
    fill_in "Esa", with: @auth_rule.esa
    fill_in "Esav", with: @auth_rule.esav
    fill_in "Oa", with: @auth_rule.oa
    fill_in "Oav", with: @auth_rule.oav
    fill_in "Operation", with: @auth_rule.operation_id
    fill_in "Ua", with: @auth_rule.ua
    fill_in "Uav", with: @auth_rule.uav
    click_on "Create Auth rule"

    assert_text "Auth rule was successfully created"
    click_on "Back"
  end

  test "should update Auth rule" do
    visit auth_rule_url(@auth_rule)
    click_on "Edit this auth rule", match: :first

    fill_in "Da", with: @auth_rule.da
    fill_in "Dav", with: @auth_rule.dav
    fill_in "Esa", with: @auth_rule.esa
    fill_in "Esav", with: @auth_rule.esav
    fill_in "Oa", with: @auth_rule.oa
    fill_in "Oav", with: @auth_rule.oav
    fill_in "Operation", with: @auth_rule.operation_id
    fill_in "Ua", with: @auth_rule.ua
    fill_in "Uav", with: @auth_rule.uav
    click_on "Update Auth rule"

    assert_text "Auth rule was successfully updated"
    click_on "Back"
  end

  test "should destroy Auth rule" do
    visit auth_rule_url(@auth_rule)
    click_on "Destroy this auth rule", match: :first

    assert_text "Auth rule was successfully destroyed"
  end
end
