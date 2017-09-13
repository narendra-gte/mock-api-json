require 'test_helper'

class CategoriesProductTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @categories_product_type = categories_product_types(:one)
  end

  test "should get index" do
    get categories_product_types_url
    assert_response :success
  end

  test "should get new" do
    get new_categories_product_type_url
    assert_response :success
  end

  test "should create categories_product_type" do
    assert_difference('CategoriesProductType.count') do
      post categories_product_types_url, params: { categories_product_type: { category_id: @categories_product_type.category_id, product_type_id: @categories_product_type.product_type_id } }
    end

    assert_redirected_to categories_product_type_url(CategoriesProductType.last)
  end

  test "should show categories_product_type" do
    get categories_product_type_url(@categories_product_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_categories_product_type_url(@categories_product_type)
    assert_response :success
  end

  test "should update categories_product_type" do
    patch categories_product_type_url(@categories_product_type), params: { categories_product_type: { category_id: @categories_product_type.category_id, product_type_id: @categories_product_type.product_type_id } }
    assert_redirected_to categories_product_type_url(@categories_product_type)
  end

  test "should destroy categories_product_type" do
    assert_difference('CategoriesProductType.count', -1) do
      delete categories_product_type_url(@categories_product_type)
    end

    assert_redirected_to categories_product_types_url
  end
end
