class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      #password digest is for the bcrypt gem, keeps it secured to store encrypted version
      t.string :password_digest
    end
  end
end
