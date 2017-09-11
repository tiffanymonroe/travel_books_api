class AddDestColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :destination, :string
  end
end
