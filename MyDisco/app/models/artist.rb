class Artist < ApplicationRecord
  before_create :clean_name

  private
  def clean_name
    self.name = self.name.split.map(&:capitalize).join(' ')
  end

  has_many :album_artists
  has_many :albums, through: :album_artists
end
