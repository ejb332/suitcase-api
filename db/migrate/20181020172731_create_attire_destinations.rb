class CreateAttireDestinations < ActiveRecord::Migration[5.0]
  def change
    create_table :attire_destinations do |t|
      t.integer :attire_id
      t.integer :destination_id

      t.timestamps
    end
  end
end
