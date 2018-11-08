class AddResId < ActiveRecord::Migration[5.2]
  def change
    add_column :houses, :resident_id, :integer
  end
end
