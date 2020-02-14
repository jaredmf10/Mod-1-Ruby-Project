class CreatePlayerTable < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name 
      t.string :position 
      t.integer :rating 
      t.integer :team_id
    end 
  end
end
