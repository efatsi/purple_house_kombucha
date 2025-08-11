class LineItem < ApplicationRecord
  belongs_to :order
  belongs_to :flavor
end

# == Schema Information
#
# Table name: line_items
#
#  id         :bigint           not null, primary key
#  count      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  flavor_id  :bigint
#  order_id   :bigint           not null
#
# Indexes
#
#  index_line_items_on_flavor_id  (flavor_id)
#  index_line_items_on_order_id   (order_id)
#
# Foreign Keys
#
#  fk_rails_...  (flavor_id => flavors.id)
#  fk_rails_...  (order_id => orders.id)
#
