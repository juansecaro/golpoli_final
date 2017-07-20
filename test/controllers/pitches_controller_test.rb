require 'test_helper'

class PitchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pitch = pitches(:one)
  end

  test "should get index" do
    get pitches_url
    assert_response :success
  end

  test "should get new" do
    get new_pitch_url
    assert_response :success
  end

  test "should create pitch" do
    assert_difference('Pitch.count') do
      post pitches_url, params: { pitch: { active: @pitch.active, image1: @pitch.image1, image2: @pitch.image2, image3: @pitch.image3, institution_id: @pitch.institution_id, kind: @pitch.kind, name: @pitch.name, normal_price: @pitch.normal_price, other: @pitch.other, special_price: @pitch.special_price } }
    end

    assert_redirected_to pitch_url(Pitch.last)
  end

  test "should show pitch" do
    get pitch_url(@pitch)
    assert_response :success
  end

  test "should get edit" do
    get edit_pitch_url(@pitch)
    assert_response :success
  end

  test "should update pitch" do
    patch pitch_url(@pitch), params: { pitch: { active: @pitch.active, image1: @pitch.image1, image2: @pitch.image2, image3: @pitch.image3, institution_id: @pitch.institution_id, kind: @pitch.kind, name: @pitch.name, normal_price: @pitch.normal_price, other: @pitch.other, special_price: @pitch.special_price } }
    assert_redirected_to pitch_url(@pitch)
  end

  test "should destroy pitch" do
    assert_difference('Pitch.count', -1) do
      delete pitch_url(@pitch)
    end

    assert_redirected_to pitches_url
  end
end
