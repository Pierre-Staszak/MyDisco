class Album < ApplicationRecord
  has_many :album_genres
  has_many :genres, through: :album_genres

  has_many :album_artists
  has_many :artists, through: :album_genres

  has_many :album_streams
  has_many :streams, through: :album_streams
end
