class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  # GET /albums
  # GET /albums.json
  def index
    @albums = Album.all
    @streams = Stream.all
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
  end

  # GET /albums/new
  def new
    @album = Album.new
  end

  # GET /albums/1/edit
  def edit
  end

  # POST /albums
  # POST /albums.json
  def create
    #@album = Album.new(album_params)
    search = @discogs.search(album_params[:info], :per_page => 5, :type => :release)
    item = @discogs.get_release(search.results.first.id.to_s)

    @album = Album.new(name: item.title, year: item.year, cover_url: item.images[0].resource_url)

    for x in item.artists
      artist = Artist.where(name: x.name).first_or_create
      artist.update(country: item.country)
      @album.artists.append(artist)
    end
    for y in item.styles
      @album.genres.append(Genre.where(name: y).first_or_create)
    end

    @album.streams.append(Stream.find(album_params[:stream_id]))

    respond_to do |format|
      if @album.save
        format.html { redirect_to Stream.find(album_params[:stream_id]), notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { redirect_to streams_url, notice: 'error : Album not found' }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to albums_url, notice: 'Album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.permit(:info, :stream_id)
    end
end
