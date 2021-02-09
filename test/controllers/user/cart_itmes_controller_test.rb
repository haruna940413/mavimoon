require 'test_helper'

class User::CartItmesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_cart_itmes_index_url
    assert_response :success
  end

end
