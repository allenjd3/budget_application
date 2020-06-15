require 'test_helper'

class CsvUploadersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @csv_uploader = csv_uploaders(:one)
    sign_in users(:one)
  end

  test "should get new" do
    get new_csv_uploader_url
    assert_response :success
  end

#  test "should create csv_uploader" do
#    assert_difference('CsvUploader.count') do
#      post csv_uploaders_url, params: { csv_uploader: { month_id: @csv_uploader.month_id, name: @csv_uploader.name } }
#    end
#
#    assert_redirected_to csv_uploader_url(CsvUploader.last)
#  end
#
#  test "should show csv_uploader" do
#    get csv_uploader_url(@csv_uploader)
#    assert_response :success
#  end
#
#  test "should get edit" do
#    get edit_csv_uploader_url(@csv_uploader)
#    assert_response :success
#  end
#
#  test "should update csv_uploader" do
#    patch csv_uploader_url(@csv_uploader), params: { csv_uploader: { month_id: @csv_uploader.month_id, name: @csv_uploader.name } }
#    assert_redirected_to csv_uploader_url(@csv_uploader)
#  end
#
#  test "should destroy csv_uploader" do
#    assert_difference('CsvUploader.count', -1) do
#      delete csv_uploader_url(@csv_uploader)
#    end
#
#    assert_redirected_to csv_uploaders_url
#  end
end
