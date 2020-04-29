class CreateVideoGames < ActiveRecord::Migration
  #creates a video game table
  def change
    create_table :games do |t|
      t.string :title
      t.string :developers
      t.string :publishers
      t.string :genre
    end
  end
end
