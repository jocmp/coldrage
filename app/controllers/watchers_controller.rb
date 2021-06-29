class WatchersController < ApplicationController
  def index
    @watchers = Watcher.where(user: current_user)
  end

  def create
    @watcher = Watcher.new(
      user_id: current_user.id,
      playlist_id: CleanPlaylistId.clean(watcher_params[:playlist_id])
    )

    if @watcher.save
      flash[:notice] = "Success"
      redirect_to watchers_path
    else
      render "new"
    end
  end

  def new
    @watcher = Watcher.new
  end

  def destroy
    Watcher.find_by(id: params[:id]).destroy!

    redirect_to watchers_path
  end

  private

  def watcher_params
    params.require(:watcher).permit(:playlist_id)
  end
end
