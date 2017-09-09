class AddDestToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :destination_id, :integer
  end
end
