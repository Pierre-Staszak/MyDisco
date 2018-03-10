class Album < ApplicationRecord
  before_create :clean_name
  before_destroy do
    self.genres.clear
    self.artists.clear
    self.streams.clear
  end

  private
  def clean_name
    self.name = self.name.split.map(&:capitalize).join(' ')
  end

  has_many :album_genres
  has_many :genres, through: :album_genres

  has_many :album_artists
  has_many :artists, through: :album_artists

  has_many :album_streams
  has_many :streams, through: :album_streams
end