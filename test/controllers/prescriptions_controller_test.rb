require "test_helper"

class PrescriptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get prescriptions_index_url
    assert_response :success
  end
end
