require "application_system_test_case"

class PaychecksTest < ApplicationSystemTestCase
  setup do
    @paycheck = paychecks(:one)
  end

  test "visiting the index" do
    visit paychecks_url
    assert_selector "h1", text: "Paychecks"
  end

  test "creating a Paycheck" do
    visit paychecks_url
    click_on "New Paycheck"

    fill_in "Name", with: @paycheck.name
    fill_in "Payday", with: @paycheck.payday
    fill_in "Payday date", with: @paycheck.payday_date
    fill_in "User", with: @paycheck.user_id
    click_on "Create Paycheck"

    assert_text "Paycheck was successfully created"
    click_on "Back"
  end

  test "updating a Paycheck" do
    visit paychecks_url
    click_on "Edit", match: :first

    fill_in "Name", with: @paycheck.name
    fill_in "Payday", with: @paycheck.payday
    fill_in "Payday date", with: @paycheck.payday_date
    fill_in "User", with: @paycheck.user_id
    click_on "Update Paycheck"

    assert_text "Paycheck was successfully updated"
    click_on "Back"
  end

  test "destroying a Paycheck" do
    visit paychecks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Paycheck was successfully destroyed"
  end
end
