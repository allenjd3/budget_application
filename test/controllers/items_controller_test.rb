require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = items(:one)

    sign_in users(:one)
  end

#  test "should create item" do
#    assert_difference('Item.count') do
#      post items_url, params: { item: { category_id: @item.category_id, name: @item.name, planned: @item.planned, user_id: @item.user_id } }
#    end
#
#    assert_redirected_to item_url(Item.last)
#  end
#
#  test "should update item" do
#    patch item_url(@item), params: { item: { category_id: @item.category_id, name: @item.name, planned: @item.planned, user_id: @item.user_id } }
#    assert_redirected_to item_url(@item)
#  end
#
#  test "should destroy item" do
#    assert_difference('Item.count', -1) do
#      delete item_url(@item)
#    end
#
#    assert_redirected_to items_url
#  end
end
