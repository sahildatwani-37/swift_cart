require "test_helper"

class Api::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get api_products_search_url
    assert_response :success
  end
end
