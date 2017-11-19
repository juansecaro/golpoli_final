require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get weare" do
    get home_weare_url
    assert_response :success
  end

  test "should get mission" do
    get home_mission_url
    assert_response :success
  end

  test "should get contact" do
    get home_contact_url
    assert_response :success
  end

  test "should get press" do
    get home_press_url
    assert_response :success
  end

  test "should get faqs" do
    get home_faqs_url
    assert_response :success
  end

end
