class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.string :adress, null: false
      t.timestamps
    end
  end
end
