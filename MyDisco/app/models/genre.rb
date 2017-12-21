class Genre < ApplicationRecord
  has_many :album_genres
  has_many :albums, through: :album_genres
end
