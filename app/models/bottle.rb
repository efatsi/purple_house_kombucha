class Bottle < ApplicationRecord
  SIZES = ["small", "medium", "large"]

  validates :size, presence: true, inclusion: { in: SIZES }
  validates :flavor, presence: true

  def size_in_oz
    {
      "small": "8 oz",
      "medium": "16 oz",
      "large": "32 oz"
    }[size]
  end
end

# == Schema Information
#
# Table name: bottles
#
#  id         :bigint           not null, primary key
#  available  :integer          default(0)
#  flavor     :string
#  size       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
