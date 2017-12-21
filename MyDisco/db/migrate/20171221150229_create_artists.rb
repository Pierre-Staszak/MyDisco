class CreateArtists < ActiveRecord::Migration[5.1]
  def up
    create_table :artists do |t|
      t.string :name
      t.string :country
      t.boolean :saw_live

      t.timestamps
    end
  end

  def down
    drop_tables :artists
  end
end
