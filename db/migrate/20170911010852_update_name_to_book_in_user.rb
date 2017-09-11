class UpdateNameToBookInUser < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :name, :book

  end
end
