class LineItem < ApplicationRecord
  SIZES = ["small", "medium", "large"]

  validates :bottle_size, presence: true, inclusion: { in: SIZES }

  belongs_to :order
  belongs_to :flavor
end

# == Schema Information
#
# Table name: line_items
#
#  id          :bigint           not null, primary key
#  bottle_size :string           default("medium"), not null
#  count       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  flavor_id   :bigint
#  order_id    :bigint           not null
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
