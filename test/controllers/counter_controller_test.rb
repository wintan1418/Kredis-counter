require "test_helper"

class CounterControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get counter_show_url
    assert_response :success
  end
end
