require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get index_path
    assert_response :success
  end

  test "should get show" do
    get show_path
    assert_response :success
  end

  #test "should get new" do
    #get static_pages_new_url
    #assert_response :success
  #end

  #test "should get home" do
    #get home_path
    #assert_response :success
  #end

end
