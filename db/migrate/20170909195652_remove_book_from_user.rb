class RemoveBookFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :book_id
  end
end
