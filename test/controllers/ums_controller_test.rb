require 'test_helper'

class UmsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @um = ums(:one)
  end

  test "should get index" do
    get ums_url
    assert_response :success
  end

  test "should get new" do
    get new_um_url
    assert_response :success
  end

  test "should create um" do
    assert_difference('Um.count') do
      post ums_url, params: { um: { content: @um.content, provider: @um.provider, user_id: @um.user_id } }
    end

    assert_redirected_to um_url(Um.last)
  end

  test "should show um" do
    get um_url(@um)
    assert_response :success
  end

  test "should get edit" do
    get edit_um_url(@um)
    assert_response :success
  end

  test "should update um" do
    patch um_url(@um), params: { um: { content: @um.content, provider: @um.provider, user_id: @um.user_id } }
    assert_redirected_to um_url(@um)
  end

  test "should destroy um" do
    assert_difference('Um.count', -1) do
      delete um_url(@um)
    end

    assert_redirected_to ums_url
  end
end
