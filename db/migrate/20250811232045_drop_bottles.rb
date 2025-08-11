class DropBottles < ActiveRecord::Migration[7.2]
  def change
    drop_table :bottles, force: :cascade do |t|
      t.integer :available
      t.string :flavor
      t.string :size
      t.timestamps
    end
  end
end
