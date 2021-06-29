class BackupsController < ApplicationController
  before_action :find_watcher, only: [:index, :create]

  def index
    @backups = @watcher.backups
  end

  def create
    @backup = Backup.new(
      snapshot_id: @watcher.playlist.snapshot_id,
      tracks: @watcher.playlist.tracks,
      watcher: @watcher
    )

    if @backup.save
      flash[:notice] = "Success"
    end

    redirect_to watcher_backups_path(@watcher)
  end

  def show
    @backup = Backup.find(params["id"])
  end

  private

  def find_watcher
    @watcher = Watcher.find(params["watcher_id"])
  end
end
