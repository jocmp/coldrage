class WatchersController < ApplicationController
  def index
    @watchers = Watcher.where(user: current_user)
  end

  def create
    @watcher = Watcher.new(watcher_params.merge(user_id: current_user.id))

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
