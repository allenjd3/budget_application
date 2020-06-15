require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transaction = transactions(:one)
    sign_in users(:one)

  end

 # test "should create transaction" do
 #   assert_difference('Transaction.count') do
 #     post transactions_url, params: { transaction: { item_id: @transaction.item_id, name: @transaction.name, spent: @transaction.spent, spent_date: @transaction.spent_date, user_id: @transaction.user_id } }
 #   end

 #   assert_redirected_to transaction_url(Transaction.last)
 # end

#  test "should update transaction" do
#    patch transaction_url(@transaction), params: { transaction: { item_id: @transaction.item_id, name: @transaction.name, spent: @transaction.spent, spent_date: @transaction.spent_date, user_id: @transaction.user_id } }
#    assert_redirected_to "/cp"
#  end
#
#  test "should destroy transaction" do
#    assert_difference('Transaction.count', -1) do
#      delete transaction_url(@transaction)
#    end
#
#    assert_redirected_to transactions_url
#  end
end
