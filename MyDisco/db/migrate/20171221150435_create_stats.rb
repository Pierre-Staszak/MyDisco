class CreateStats < ActiveRecord::Migration[5.1]
  def up
    create_table :stats do |t|
      t.string :name
      t.integer :elem
      t.integer :total

      t.timestamps
    end
  end

  def down
    drop_tables :stats
  end
end
