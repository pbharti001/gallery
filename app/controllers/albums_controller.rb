class AlbumsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_user
  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @user = current_user
    @album = Album.new
  end

  def create
    # debugger
    @album = @user.albums.create(album_params)

    if @album.save
      redirect_to @album
    else
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])

    if @album.update(album_params)
      redirect_to @album
    else
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    redirect_to root_path
  end

  private

    def set_user
      @user = current_user
    end

    def album_params
      params.require(:album).permit(:title, :body, {image: []})
    end  
end
