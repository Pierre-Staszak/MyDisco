class AddCoverUrlToAlbums < ActiveRecord::Migration[5.1]
  def up
    add_column :albums, :cover_url, :string
  end

  def down
    remove_column :albums, :cover_url
  end
end
