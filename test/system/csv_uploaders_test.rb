require "application_system_test_case"

class CsvUploadersTest < ApplicationSystemTestCase
  setup do
    @csv_uploader = csv_uploaders(:one)
  end

  test "visiting the index" do
    visit csv_uploaders_url
    assert_selector "h1", text: "Csv Uploaders"
  end

  test "creating a Csv uploader" do
    visit csv_uploaders_url
    click_on "New Csv Uploader"

    fill_in "Month", with: @csv_uploader.month_id
    fill_in "Name", with: @csv_uploader.name
    click_on "Create Csv uploader"

    assert_text "Csv uploader was successfully created"
    click_on "Back"
  end

  test "updating a Csv uploader" do
    visit csv_uploaders_url
    click_on "Edit", match: :first

    fill_in "Month", with: @csv_uploader.month_id
    fill_in "Name", with: @csv_uploader.name
    click_on "Update Csv uploader"

    assert_text "Csv uploader was successfully updated"
    click_on "Back"
  end

  test "destroying a Csv uploader" do
    visit csv_uploaders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Csv uploader was successfully destroyed"
  end
end
