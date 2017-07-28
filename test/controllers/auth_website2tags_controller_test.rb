require 'test_helper'

class AuthWebsite2tagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_website2tag = auth_website2tags(:one)
  end

  test "should get index" do
    get auth_website2tags_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_website2tag_url
    assert_response :success
  end

  test "should create auth_website2tag" do
    assert_difference('AuthWebsite2tag.count') do
      post auth_website2tags_url, params: { auth_website2tag: { auth_tag_id: @auth_website2tag.auth_tag_id, auth_website_id: @auth_website2tag.auth_website_id, idx: @auth_website2tag.idx } }
    end

    assert_redirected_to auth_website2tag_url(AuthWebsite2tag.last)
  end

  test "should show auth_website2tag" do
    get auth_website2tag_url(@auth_website2tag)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_website2tag_url(@auth_website2tag)
    assert_response :success
  end

  test "should update auth_website2tag" do
    patch auth_website2tag_url(@auth_website2tag), params: { auth_website2tag: { auth_tag_id: @auth_website2tag.auth_tag_id, auth_website_id: @auth_website2tag.auth_website_id, idx: @auth_website2tag.idx } }
    assert_redirected_to auth_website2tag_url(@auth_website2tag)
  end

  test "should destroy auth_website2tag" do
    assert_difference('AuthWebsite2tag.count', -1) do
      delete auth_website2tag_url(@auth_website2tag)
    end

    assert_redirected_to auth_website2tags_url
  end
end
