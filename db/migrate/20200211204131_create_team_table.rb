class CreateTeamTable < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :gm_id
    end 
  end
end
