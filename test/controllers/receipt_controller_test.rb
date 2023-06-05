require 'test_helper'

class ReceiptControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get charge_index_url
    assert_response :success
  end
end
