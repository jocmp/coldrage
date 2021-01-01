class WatchersController < ApplicationController
  def index
    @watchers = Watcher.where(user: current_user)
  end

  def create
    Watcher.create!(watcher_params.merge(user_id: current_user.id))
  end

  private

    def watcher_params
      params.require(:watcher).permit(:playlist_id)
    end
end
