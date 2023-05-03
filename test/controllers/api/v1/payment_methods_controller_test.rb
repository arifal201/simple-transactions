require 'test_helper'

class Api::V1::PaymentMethodsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_payment_methods_index_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_payment_methods_show_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_payment_methods_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_payment_methods_update_url
    assert_response :success
  end

  test "should get delete" do
    get api_v1_payment_methods_delete_url
    assert_response :success
  end

end
