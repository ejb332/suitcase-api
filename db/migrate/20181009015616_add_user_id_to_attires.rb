class AddUserIdToAttires < ActiveRecord::Migration[5.0]
  def change
    add_column :attires, :user_id, :string
  end
end
