class AlbumGenresController < ApplicationController
  before_action :set_album_genre, only: [:show, :edit, :update, :destroy]

  # GET /album_genres
  # GET /album_genres.json
  def index
    @album_genres = AlbumGenre.all
  end

  # GET /album_genres/1
  # GET /album_genres/1.json
  def show
  end

  # GET /album_genres/new
  def new
    @album_genre = AlbumGenre.new
  end

  # GET /album_genres/1/edit
  def edit
  end

  # POST /album_genres
  # POST /album_genres.json
  def create
    @album_genre = AlbumGenre.new(album_genre_params)

    respond_to do |format|
      if @album_genre.save
        format.html { redirect_to @album_genre, notice: 'Album genre was successfully created.' }
        format.json { render :show, status: :created, location: @album_genre }
      else
        format.html { render :new }
        format.json { render json: @album_genre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /album_genres/1
  # PATCH/PUT /album_genres/1.json
  def update
    respond_to do |format|
      if @album_genre.update(album_genre_params)
        format.html { redirect_to @album_genre, notice: 'Album genre was successfully updated.' }
        format.json { render :show, status: :ok, location: @album_genre }
      else
        format.html { render :edit }
        format.json { render json: @album_genre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /album_genres/1
  # DELETE /album_genres/1.json
  def destroy
    @album_genre.destroy
    respond_to do |format|
      format.html { redirect_to album_genres_url, notice: 'Album genre was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album_genre
      @album_genre = AlbumGenre.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_genre_params
      params.require(:album_genre).permit(:genre_id, :album_id)
    end
end
