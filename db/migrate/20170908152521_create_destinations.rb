class CreateDestinations < ActiveRecord::Migration[5.1]
  def change
    create_table :destinations do |t|
      t.string :destination
      t.string :purpose
      t.string :transportation
      t.string :season
      t.string :climate

      t.timestamps
    end
  end
end
