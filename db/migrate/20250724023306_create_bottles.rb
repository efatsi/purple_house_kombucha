class CreateBottles < ActiveRecord::Migration[7.2]
  def change
    create_table :bottles do |t|
      t.integer :available, default: 0
      t.string :flavor
      t.string :size

      t.timestamps
    end
  end
end
