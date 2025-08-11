class AddBottleSizeToLineItems < ActiveRecord::Migration[7.2]
  def change
    add_column :line_items, :bottle_size, :string, default: "medium", null: false
  end
end
