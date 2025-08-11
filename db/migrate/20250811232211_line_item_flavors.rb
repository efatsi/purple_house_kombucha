class LineItemFlavors < ActiveRecord::Migration[7.2]
  def change
    remove_reference :line_items, :bottle
    add_reference :line_items, :flavor, foreign_key: true
  end
end
