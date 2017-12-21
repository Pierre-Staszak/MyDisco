class CreateAlbumStreams < ActiveRecord::Migration[5.1]
  def up
    create_table :album_streams do |t|
      t.references :album, foreign_key: true
      t.references :stream, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_tables :album_streams
  end
end
