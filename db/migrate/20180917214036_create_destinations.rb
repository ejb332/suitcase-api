class CreateDestinations < ActiveRecord::Migration[5.0]
  def change
    create_table :destinations do |t|
      t.string :location
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
