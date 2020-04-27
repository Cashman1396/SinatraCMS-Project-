class AddUserIdColumn < ActiveRecord::Migration
  #adds a column for user ids
  def change
    add_column :games, :user_id, :integer
  end
end
