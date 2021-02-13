require "application_system_test_case"

class BackupsTest < ApplicationSystemTestCase
  setup do
    @backup = backups(:one)
  end

  test "visiting the index" do
    visit backups_url
    assert_selector "h1", text: "Backups"
  end

  test "creating a Backup" do
    visit backups_url
    click_on "New Backup"

    click_on "Create Backup"

    assert_text "Backup was successfully created"
    click_on "Back"
  end

  test "updating a Backup" do
    visit backups_url
    click_on "Edit", match: :first

    click_on "Update Backup"

    assert_text "Backup was successfully updated"
    click_on "Back"
  end

  test "destroying a Backup" do
    visit backups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Backup was successfully destroyed"
  end
end
