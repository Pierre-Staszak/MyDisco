class CreateAlbumGenres < ActiveRecord::Migration[5.1]
  def up
    create_table :album_genres do |t|
      t.references :genre, foreign_key: true
      t.references :album, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_tables :album_genres
  end
end
