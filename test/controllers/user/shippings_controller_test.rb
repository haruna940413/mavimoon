require 'test_helper'

class User::ShippingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_shippings_index_url
    assert_response :success
  end

  test "should get edit" do
    get user_shippings_edit_url
    assert_response :success
  end

end
