class Stream < ApplicationRecord
  has_many :album_streams
  has_many :albums, through: :album_streams

  belongs_to :user
end