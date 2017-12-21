class CreateAlbumArtists < ActiveRecord::Migration[5.1]
  def up
    create_table :album_artists do |t|
      t.references :album, foreign_key: true
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_tables :album_artists
  end
end
