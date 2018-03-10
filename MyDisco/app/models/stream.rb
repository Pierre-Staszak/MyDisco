class Stream < ApplicationRecord
  before_destroy do
    self.albums.clear
  end

  has_many :album_streams
  has_many :albums, through: :album_streams

  belongs_to :user
end