class AlbumStreamsController < ApplicationController
  before_action :set_album_stream, only: [:show, :edit, :update, :destroy]

  # GET /album_streams
  # GET /album_streams.json
  def index
    @album_streams = AlbumStream.all
  end

  # GET /album_streams/1
  # GET /album_streams/1.json
  def show
  end

  # GET /album_streams/new
  def new
    @album_stream = AlbumStream.new
  end

  # GET /album_streams/1/edit
  def edit
  end

  # POST /album_streams
  # POST /album_streams.json
  def create
    @album_stream = AlbumStream.new(album_stream_params)

    respond_to do |format|
      if @album_stream.save
        format.html { redirect_to @album_stream, notice: 'Album stream was successfully created.' }
        format.json { render :show, status: :created, location: @album_stream }
      else
        format.html { render :new }
        format.json { render json: @album_stream.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /album_streams/1
  # PATCH/PUT /album_streams/1.json
  def update
    respond_to do |format|
      if @album_stream.update(album_stream_params)
        format.html { redirect_to @album_stream, notice: 'Album stream was successfully updated.' }
        format.json { render :show, status: :ok, location: @album_stream }
      else
        format.html { render :edit }
        format.json { render json: @album_stream.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /album_streams/1
  # DELETE /album_streams/1.json
  def destroy
    @album_stream.destroy
    respond_to do |format|
      format.html { redirect_to album_streams_url, notice: 'Album stream was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album_stream
      @album_stream = AlbumStream.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_stream_params
      params.require(:album_stream).permit(:album_id, :stream_id)
    end
end
