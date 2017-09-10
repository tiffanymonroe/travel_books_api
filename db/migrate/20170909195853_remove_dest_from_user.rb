class RemoveDestFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :destination_id
  end
end
