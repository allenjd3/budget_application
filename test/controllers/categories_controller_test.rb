require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)

    sign_in users(:one)

  end

#  test "should create category" do
#    assert_difference('Category.count') do
#      post categories_url, params: { category: { name: @category.name, user_id: @category.user_id } }
#    end
#
#    assert_redirected_to category_url(Category.last)
#  end
#
#
#  test "should update category" do
#    patch category_url(@category), params: { category: { name: @category.name, user_id: @category.user_id } }
#    assert_redirected_to "/cp"
#  end
#
#  test "should destroy category" do
#    assert_difference('Category.count', -1) do
#      delete category_url(@category)
#    end
#
#    assert_redirected_to categories_url
#  end
end
