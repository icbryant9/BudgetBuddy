require "application_system_test_case"

class UserOptionsTest < ApplicationSystemTestCase
  setup do
    @user_option = user_options(:one)
  end

  test "visiting the index" do
    visit user_options_url
    assert_selector "h1", text: "User Options"
  end

  test "creating a User option" do
    visit user_options_url
    click_on "New User Option"

    fill_in "Budget", with: @user_option.budget_id
    click_on "Create User option"

    assert_text "User option was successfully created"
    click_on "Back"
  end

  test "updating a User option" do
    visit user_options_url
    click_on "Edit", match: :first

    fill_in "Budget", with: @user_option.budget_id
    click_on "Update User option"

    assert_text "User option was successfully updated"
    click_on "Back"
  end

  test "destroying a User option" do
    visit user_options_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User option was successfully destroyed"
  end
end
