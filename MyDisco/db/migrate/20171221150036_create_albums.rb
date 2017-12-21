class CreateAlbums < ActiveRecord::Migration[5.1]
  def up
    create_table :albums do |t|
      t.string :name
      t.integer :year
      t.boolean :artist_known

      t.timestamps
    end
  end

  def down
    drop_tables :albums
  end
end
