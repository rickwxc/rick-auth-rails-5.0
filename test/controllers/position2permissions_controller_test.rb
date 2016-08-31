require 'test_helper'

class Position2permissionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @position2permission = position2permissions(:one)
  end

  test "should get index" do
    get position2permissions_url
    assert_response :success
  end

  test "should get new" do
    get new_position2permission_url
    assert_response :success
  end

  test "should create position2permission" do
    assert_difference('Position2permission.count') do
      post position2permissions_url, params: { position2permission: { permission_id: @position2permission.permission_id, position_id: @position2permission.position_id } }
    end

    assert_redirected_to position2permission_url(Position2permission.last)
  end

  test "should show position2permission" do
    get position2permission_url(@position2permission)
    assert_response :success
  end

  test "should get edit" do
    get edit_position2permission_url(@position2permission)
    assert_response :success
  end

  test "should update position2permission" do
    patch position2permission_url(@position2permission), params: { position2permission: { permission_id: @position2permission.permission_id, position_id: @position2permission.position_id } }
    assert_redirected_to position2permission_url(@position2permission)
  end

  test "should destroy position2permission" do
    assert_difference('Position2permission.count', -1) do
      delete position2permission_url(@position2permission)
    end

    assert_redirected_to position2permissions_url
  end
end
