require 'test_helper'

class AuthTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_tag = auth_tags(:one)
  end

  test "should get index" do
    get auth_tags_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_tag_url
    assert_response :success
  end

  test "should create auth_tag" do
    assert_difference('AuthTag.count') do
      post auth_tags_url, params: { auth_tag: { auth_tagtype_id: @auth_tag.auth_tagtype_id, name: @auth_tag.name } }
    end

    assert_redirected_to auth_tag_url(AuthTag.last)
  end

  test "should show auth_tag" do
    get auth_tag_url(@auth_tag)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_tag_url(@auth_tag)
    assert_response :success
  end

  test "should update auth_tag" do
    patch auth_tag_url(@auth_tag), params: { auth_tag: { auth_tagtype_id: @auth_tag.auth_tagtype_id, name: @auth_tag.name } }
    assert_redirected_to auth_tag_url(@auth_tag)
  end

  test "should destroy auth_tag" do
    assert_difference('AuthTag.count', -1) do
      delete auth_tag_url(@auth_tag)
    end

    assert_redirected_to auth_tags_url
  end
end
