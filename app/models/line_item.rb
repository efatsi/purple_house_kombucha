class LineItem < ApplicationRecord
  belongs_to :order
  belongs_to :bottle
end

# == Schema Information
#
# Table name: line_items
#
#  id         :bigint           not null, primary key
#  count      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  bottle_id  :bigint           not null
#  order_id   :bigint           not null
#
# Indexes
#
#  index_line_items_on_bottle_id  (bottle_id)
#  index_line_items_on_order_id   (order_id)
#
# Foreign Keys
#
#  fk_rails_...  (bottle_id => bottles.id)
#  fk_rails_...  (order_id => orders.id)
#
