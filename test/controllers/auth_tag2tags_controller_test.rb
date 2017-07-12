require 'test_helper'

class AuthTag2tagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_tag2tag = auth_tag2tags(:one)
  end

  test "should get index" do
    get auth_tag2tags_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_tag2tag_url
    assert_response :success
  end

  test "should create auth_tag2tag" do
    assert_difference('AuthTag2tag.count') do
      post auth_tag2tags_url, params: { auth_tag2tag: { ctag_id: @auth_tag2tag.ctag_id, ptag_id: @auth_tag2tag.ptag_id } }
    end

    assert_redirected_to auth_tag2tag_url(AuthTag2tag.last)
  end

  test "should show auth_tag2tag" do
    get auth_tag2tag_url(@auth_tag2tag)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_tag2tag_url(@auth_tag2tag)
    assert_response :success
  end

  test "should update auth_tag2tag" do
    patch auth_tag2tag_url(@auth_tag2tag), params: { auth_tag2tag: { ctag_id: @auth_tag2tag.ctag_id, ptag_id: @auth_tag2tag.ptag_id } }
    assert_redirected_to auth_tag2tag_url(@auth_tag2tag)
  end

  test "should destroy auth_tag2tag" do
    assert_difference('AuthTag2tag.count', -1) do
      delete auth_tag2tag_url(@auth_tag2tag)
    end

    assert_redirected_to auth_tag2tags_url
  end
end
