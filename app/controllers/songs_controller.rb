class SongsController < ApplicationController
  beforce_action :set_artist
  beforce_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = @artist.songs
  end

  def show
  end

  def new
    @billboards = Billboard.all - @artist.billboards 
    @song = @artist.songs.new
  end

  def create
    @song = @artist.songs.new(song_params)
    if @song.save
      redirect_to artist_songs_path(@artist)
    else
      render :new
    end
  end

  def edit
    @billboards = Billboard.all - @artist.billboards
  end

  def update
    if @songs.update(song_params)
      redirect_to artist_songs_path(@artist)
    else
      render :edit 
    end 
  end

  def destroy
    @song.destroy
    redirect_to artist_songs_path(@artist)
  end

  def set_song
    @songs = @artist.songs.find(params[:id])
  end 

  private
    def set_artist
      @artist =Artist.find(params[:artist_id])
    end
    
    def song_params
      params.require(:song).permit(:role, :billboard_id)
    end
end
