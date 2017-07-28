require 'test_helper'

class AuthWebsitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_website = auth_websites(:one)
  end

  test "should get index" do
    get auth_websites_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_website_url
    assert_response :success
  end

  test "should create auth_website" do
    assert_difference('AuthWebsite.count') do
      post auth_websites_url, params: { auth_website: { descr: @auth_website.descr, mailapikey: @auth_website.mailapikey, mailapiurl: @auth_website.mailapiurl, replyemail: @auth_website.replyemail, sendfromemail: @auth_website.sendfromemail, shortname: @auth_website.shortname, title: @auth_website.title, url: @auth_website.url } }
    end

    assert_redirected_to auth_website_url(AuthWebsite.last)
  end

  test "should show auth_website" do
    get auth_website_url(@auth_website)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_website_url(@auth_website)
    assert_response :success
  end

  test "should update auth_website" do
    patch auth_website_url(@auth_website), params: { auth_website: { descr: @auth_website.descr, mailapikey: @auth_website.mailapikey, mailapiurl: @auth_website.mailapiurl, replyemail: @auth_website.replyemail, sendfromemail: @auth_website.sendfromemail, shortname: @auth_website.shortname, title: @auth_website.title, url: @auth_website.url } }
    assert_redirected_to auth_website_url(@auth_website)
  end

  test "should destroy auth_website" do
    assert_difference('AuthWebsite.count', -1) do
      delete auth_website_url(@auth_website)
    end

    assert_redirected_to auth_websites_url
  end
end
