class CreateLinkers < ActiveRecord::Migration[5.1]
  def change
    create_table :linkers do |t|
      t.references :book, foreign_key: true
      t.references :destination, foreign_key: true

      t.timestamps
    end
  end
end
