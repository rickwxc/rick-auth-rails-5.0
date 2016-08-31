require 'test_helper'

class User2positionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user2position = user2positions(:one)
  end

  test "should get index" do
    get user2positions_url
    assert_response :success
  end

  test "should get new" do
    get new_user2position_url
    assert_response :success
  end

  test "should create user2position" do
    assert_difference('User2position.count') do
      post user2positions_url, params: { user2position: { position: @user2position.position, user_id: @user2position.user_id } }
    end

    assert_redirected_to user2position_url(User2position.last)
  end

  test "should show user2position" do
    get user2position_url(@user2position)
    assert_response :success
  end

  test "should get edit" do
    get edit_user2position_url(@user2position)
    assert_response :success
  end

  test "should update user2position" do
    patch user2position_url(@user2position), params: { user2position: { position: @user2position.position, user_id: @user2position.user_id } }
    assert_redirected_to user2position_url(@user2position)
  end

  test "should destroy user2position" do
    assert_difference('User2position.count', -1) do
      delete user2position_url(@user2position)
    end

    assert_redirected_to user2positions_url
  end
end
