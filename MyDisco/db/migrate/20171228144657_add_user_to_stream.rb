class AddUserToStream < ActiveRecord::Migration[5.1]
  def up
    add_reference :streams, :user, foreign_key: true
  end

  def down
    remove_reference :streams, :user
  end
end
