require 'test_helper'

class PostItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get post_items_index_url
    assert_response :success
  end

  test "should get show" do
    get post_items_show_url
    assert_response :success
  end

  test "should get new" do
    get post_items_new_url
    assert_response :success
  end

  test "should get edit" do
    get post_items_edit_url
    assert_response :success
  end

  test "should get complete" do
    get post_items_complete_url
    assert_response :success
  end

end
