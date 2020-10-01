require "test_helper"
require "./lib/coldrage/playlist_snapshots"

class PlaylistSnaphotTest < Minitest::Test
  def create_dao(playlist)
    dao = Minitest::Mock.new
    record = Minitest::Mock.new
    dao.expect(:new, record, [playlist])
    Coldrage.playlist_snapshot = dao
    record
  end

  def test_snapshots
    playlist = {"foo" => "baz"}
    record = create_dao(playlist)

    record.expect(:save, nil)

    Coldrage::PlaylistSnapshots.take_snapshot(playlist: playlist)

    record.verify
  end
end
