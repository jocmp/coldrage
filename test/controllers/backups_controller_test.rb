require "test_helper"

class BackupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @backup = backups(:one)
  end

  test "should get index" do
    get backups_url
    assert_response :success
  end

  test "should get new" do
    get new_backup_url
    assert_response :success
  end

  test "should create backup" do
    assert_difference('Backup.count') do
      post backups_url, params: { backup: {  } }
    end

    assert_redirected_to backup_url(Backup.last)
  end

  test "should show backup" do
    get backup_url(@backup)
    assert_response :success
  end

  test "should get edit" do
    get edit_backup_url(@backup)
    assert_response :success
  end

  test "should update backup" do
    patch backup_url(@backup), params: { backup: {  } }
    assert_redirected_to backup_url(@backup)
  end

  test "should destroy backup" do
    assert_difference('Backup.count', -1) do
      delete backup_url(@backup)
    end

    assert_redirected_to backups_url
  end
end
