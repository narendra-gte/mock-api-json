require 'test_helper'

class ImagesTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @images_tag = images_tags(:one)
  end

  test "should get index" do
    get images_tags_url
    assert_response :success
  end

  test "should get new" do
    get new_images_tag_url
    assert_response :success
  end

  test "should create images_tag" do
    assert_difference('ImagesTag.count') do
      post images_tags_url, params: { images_tag: {  } }
    end

    assert_redirected_to images_tag_url(ImagesTag.last)
  end

  test "should show images_tag" do
    get images_tag_url(@images_tag)
    assert_response :success
  end

  test "should get edit" do
    get edit_images_tag_url(@images_tag)
    assert_response :success
  end

  test "should update images_tag" do
    patch images_tag_url(@images_tag), params: { images_tag: {  } }
    assert_redirected_to images_tag_url(@images_tag)
  end

  test "should destroy images_tag" do
    assert_difference('ImagesTag.count', -1) do
      delete images_tag_url(@images_tag)
    end

    assert_redirected_to images_tags_url
  end
end
