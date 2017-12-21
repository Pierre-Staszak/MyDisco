class CreateStreams < ActiveRecord::Migration[5.1]
  def up
    create_table :streams do |t|
      t.string :name

      t.timestamps
    end
  end

  def down
    drop_tables :streams
  end
end
