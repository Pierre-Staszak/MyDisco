class CreateDiscogsWrapper < ActiveRecord::Migration[5.1]
  def up
    create_table :discogs_wrappers do |t|
    end
  end

  def down
    drop_table :discogs_wrappers
  end
end
