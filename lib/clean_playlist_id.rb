class CleanPlaylistId
  # @type method clean: (String?) -> String?
  def self.clean(playlist_id)
    playlist_id.split(":").last
  end
end
