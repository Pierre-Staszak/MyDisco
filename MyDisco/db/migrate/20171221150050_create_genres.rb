class CreateGenres < ActiveRecord::Migration[5.1]
  def up
    create_table :genres do |t|
      t.string :name

      t.timestamps
    end
  end

  def down
    drop_tables :genres
  end
end
