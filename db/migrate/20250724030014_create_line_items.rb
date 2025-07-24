class CreateLineItems < ActiveRecord::Migration[7.2]
  def change
    create_table :line_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :bottle, null: false, foreign_key: true
      t.integer :count

      t.timestamps
    end
  end
end
