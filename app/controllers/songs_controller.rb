class SongsController < ApplicationController
  before_action :fetch_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def edit
  end

  def create
    @song = Song.new(song_params)

    respond_to do |format|
      if @song.save
        format.html { redirect_to song_url(@song), notice: 'Song was successfully created.' }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to song_url(@song), notice: 'Song was successfully updated.' }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @song.destroy

    respond_to do |format|
      format.html { redirect_to song_url, notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def fetch_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :description)
  end
end