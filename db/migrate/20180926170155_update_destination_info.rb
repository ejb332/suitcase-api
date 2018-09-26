class UpdateDestinationInfo < ActiveRecord::Migration[5.0]
  def change
    add_column :destinations, :city, :string
    add_column :destinations, :country, :string
    remove_column :destinations, :location, :string
  end
end
