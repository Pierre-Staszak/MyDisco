class Album < ApplicationRecord
  attr_accessor :album_params
  attr_accessor :discogs

  before_create :set_name, unless: Proc.new { @album.nil? }
  before_create :set_year, unless: Proc.new { @album.nil? }
  before_create :set_cover_url, unless: Proc.new { @album.nil? }
  before_create :set_artists, unless: Proc.new { @album.nil? }
  before_create :set_genres, unless: Proc.new { @album.nil? }
  before_create :set_streams, unless: Proc.new { @album.nil? }

  has_many :album_genres
  has_many :genres, through: :album_genres, dependent: :destroy
  has_many :album_artists
  has_many :artists, through: :album_artists, dependent: :destroy
  has_many :album_streams
  has_many :streams, through: :album_streams, dependent: :destroy

  validate :album_is_present_on_discogs

  private

  def album_is_present_on_discogs
    discogs_albums = discogs.search(album_params[:info], per_page: 5, type: :release).results

    if discogs_albums.first.nil?
      self.errors.add(:base, "can't find album on discogs")
    else
      @album = discogs.get_release(discogs_albums.first&.id)
    end
  end

  def set_name
    self.name = @album.title.split.map(&:capitalize).join(' ')
  end

  def set_year
    self.year = @album.year
  end

  def set_cover_url
    self.cover_url = @album.images.first&.resource_url
  end

  def set_artists
    @album.artists&.each do |artist|
      self.artists.where(name: artist.name).first_or_create
    end
  end

  def set_genres
    @album.styles&.each do |style|
      self.genres.where(name: style).first_or_create
    end
  end

  def set_streams
    self.streams.where(id: album_params[:stream_id]).first
  end
end