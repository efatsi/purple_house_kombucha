class AddPaidToOrders < ActiveRecord::Migration[7.2]
  def change
    add_column :orders, :paid, :boolean, default: false
  end
end
