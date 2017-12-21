class CreateScores < ActiveRecord::Migration[5.1]
  def up
    create_table :scores do |t|
      t.integer :state

      t.timestamps
    end
  end

  def down
    drop_tables :scores
  end
end
