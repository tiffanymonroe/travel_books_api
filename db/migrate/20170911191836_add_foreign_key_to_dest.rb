class AddForeignKeyToDest < ActiveRecord::Migration[5.1]
  def change
    add_column :destinations, :user_id, :integer
  end
end
