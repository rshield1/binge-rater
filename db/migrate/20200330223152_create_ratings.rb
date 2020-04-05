class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :number
      t.integer :show_id
    end
  end
end
