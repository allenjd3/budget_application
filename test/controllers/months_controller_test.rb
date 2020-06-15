require 'test_helper'

class MonthsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @month = months(:one)

    sign_in users(:one)

  end

  test "should get new" do
    get new_month_url
    assert_response :success
  end

  test "should create month" do
    assert_difference('Month.count') do
      post months_url, params: { month: { month: @month.month, year: @month.year } }
    end

    assert_redirected_to "/month/" + @month.month + "/year/" + @month.year.to_s
  end


  test "should update month" do
    patch month_url(@month), params: { month: { month: @month.month, year: @month.year } }
    assert_redirected_to "/cp"
  end

 # test "should destroy month" do
 #   assert_difference('Month.count', -1) do
 #     delete month_url(@month)
 #   end

 #   assert_redirected_to months_url
 # end
end
