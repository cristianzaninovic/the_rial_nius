require "application_system_test_case"

class NiusTest < ApplicationSystemTestCase
  setup do
    @niu = nius(:one)
  end

  test "visiting the index" do
    visit nius_url
    assert_selector "h1", text: "Nius"
  end

  test "should create niu" do
    visit nius_url
    click_on "New niu"

    fill_in "Content", with: @niu.content
    fill_in "Headline", with: @niu.headline
    fill_in "Nius user", with: @niu.nius_user_id
    fill_in "Title", with: @niu.title
    click_on "Create Niu"

    assert_text "Niu was successfully created"
    click_on "Back"
  end

  test "should update Niu" do
    visit niu_url(@niu)
    click_on "Edit this niu", match: :first

    fill_in "Content", with: @niu.content
    fill_in "Headline", with: @niu.headline
    fill_in "Nius user", with: @niu.nius_user_id
    fill_in "Title", with: @niu.title
    click_on "Update Niu"

    assert_text "Niu was successfully updated"
    click_on "Back"
  end

  test "should destroy Niu" do
    visit niu_url(@niu)
    click_on "Destroy this niu", match: :first

    assert_text "Niu was successfully destroyed"
  end
end
