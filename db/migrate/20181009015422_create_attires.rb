class CreateAttires < ActiveRecord::Migration[5.0]
  def change
    create_table :attires do |t|
      t.string "item_name"
      t.string "color"
      t.string "size"
      t.string "quantity"
      t.string "category"
      t.timestamps
    end
  end
end
