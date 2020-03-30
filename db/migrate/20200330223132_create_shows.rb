class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :name
      t.string :category
      t.integer :seasons
      t.string :description
      t.integer :user_id
    end

  end
end
