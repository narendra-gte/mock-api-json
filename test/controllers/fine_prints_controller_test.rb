require 'test_helper'

class FinePrintsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fine_print = fine_prints(:one)
  end

  test "should get index" do
    get fine_prints_url
    assert_response :success
  end

  test "should get new" do
    get new_fine_print_url
    assert_response :success
  end

  test "should create fine_print" do
    assert_difference('FinePrint.count') do
      post fine_prints_url, params: { fine_print: { product_id: @fine_print.product_id, text: @fine_print.text } }
    end

    assert_redirected_to fine_print_url(FinePrint.last)
  end

  test "should show fine_print" do
    get fine_print_url(@fine_print)
    assert_response :success
  end

  test "should get edit" do
    get edit_fine_print_url(@fine_print)
    assert_response :success
  end

  test "should update fine_print" do
    patch fine_print_url(@fine_print), params: { fine_print: { product_id: @fine_print.product_id, text: @fine_print.text } }
    assert_redirected_to fine_print_url(@fine_print)
  end

  test "should destroy fine_print" do
    assert_difference('FinePrint.count', -1) do
      delete fine_print_url(@fine_print)
    end

    assert_redirected_to fine_prints_url
  end
end
