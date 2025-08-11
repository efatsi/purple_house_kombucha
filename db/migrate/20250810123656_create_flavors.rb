class CreateFlavors < ActiveRecord::Migration[7.2]
  def change
    create_table :flavors do |t|
      t.string :name, null: false
      t.string :description
      t.integer :available_oz, default: 0

      t.timestamps
    end
  end
end
