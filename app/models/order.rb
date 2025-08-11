class Order < ApplicationRecord
  STATUSES = ["pre_flight", "open", "paid", "canceled"]

  validates :status, presence: true, inclusion: { in: STATUSES }

  belongs_to :user
  has_many :line_items
end

# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  paid       :boolean          default(FALSE)
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_orders_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
