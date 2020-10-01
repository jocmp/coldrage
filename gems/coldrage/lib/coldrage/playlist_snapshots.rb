module Coldrage
  module PlaylistSnapshots
    class << self
      def take_snapshot(playlist:)
        record = Coldrage.playlist_snapshot.new(playlist)
        record.save
      end
    end
  end
end
