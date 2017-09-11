class UpdateDestinationColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :destinations, :destination, :name
  end
end
