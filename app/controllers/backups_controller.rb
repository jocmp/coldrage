class BackupsController < ApplicationController
  before_action :find_watcher, only: [:index, :create]
  before_action :set_backup, only: [:show, :edit, :update, :destroy]

  def index
    @backups = @watcher.backups
  end

  def show
  end

  def new
    @backup = Backup.new
  end

  def edit
  end

  def create
    @backup = Backup.new(backup_params)

    respond_to do |format|
      if @backup.save
        format.html { redirect_to @backup, notice: "Backup was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @backup.update(backup_params)
        redirect_to @backup, notice: "Backup was successfully updated."
      else
        render :edit
      end
    end
  end

  def destroy
    @backup.destroy
    respond_to do |format|
      format.html { redirect_to backups_url, notice: "Backup was successfully destroyed." }
    end
  end

  private

  def set_backup
    @backup = Backup.find(params[:id])
  end

  def backup_params
    {
      snapshot_id: @watcher.playlist.snapshot_id,
      tracks: @watcher.playlist.tracks,
      watcher: @watcher
    }
  end
end
