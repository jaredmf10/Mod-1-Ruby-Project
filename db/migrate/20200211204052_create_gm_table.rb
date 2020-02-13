class CreateGmTable < ActiveRecord::Migration[5.2]
  def change
    create_table :gms do |t|
      t.string :name 
    end 
  end
end
