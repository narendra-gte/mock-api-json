require 'test_helper'

class PurchaseOptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purchase_option = purchase_options(:one)
  end

  test "should get index" do
    get purchase_options_url
    assert_response :success
  end

  test "should get new" do
    get new_purchase_option_url
    assert_response :success
  end

  test "should create purchase_option" do
    assert_difference('PurchaseOption.count') do
      post purchase_options_url, params: { purchase_option: { max_per_person: @purchase_option.max_per_person, min_price: @purchase_option.min_price, name: @purchase_option.name, product_id: @purchase_option.product_id, quantity_available: @purchase_option.quantity_available, redemption_qty: @purchase_option.redemption_qty, retail_price: @purchase_option.retail_price, sku: @purchase_option.sku } }
    end

    assert_redirected_to purchase_option_url(PurchaseOption.last)
  end

  test "should show purchase_option" do
    get purchase_option_url(@purchase_option)
    assert_response :success
  end

  test "should get edit" do
    get edit_purchase_option_url(@purchase_option)
    assert_response :success
  end

  test "should update purchase_option" do
    patch purchase_option_url(@purchase_option), params: { purchase_option: { max_per_person: @purchase_option.max_per_person, min_price: @purchase_option.min_price, name: @purchase_option.name, product_id: @purchase_option.product_id, quantity_available: @purchase_option.quantity_available, redemption_qty: @purchase_option.redemption_qty, retail_price: @purchase_option.retail_price, sku: @purchase_option.sku } }
    assert_redirected_to purchase_option_url(@purchase_option)
  end

  test "should destroy purchase_option" do
    assert_difference('PurchaseOption.count', -1) do
      delete purchase_option_url(@purchase_option)
    end

    assert_redirected_to purchase_options_url
  end
end
