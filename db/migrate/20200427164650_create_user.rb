class CreateUser < ActiveRecord::Migration
  #creates the user table
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :password_digest
    end
  end
end
