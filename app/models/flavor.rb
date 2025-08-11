class Flavor < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :available_oz, numericality: { greater_than_or_equal_to: 0 }
end

# == Schema Information
#
# Table name: flavors
#
#  id           :bigint           not null, primary key
#  available_oz :integer          default(0)
#  description  :string
#  name         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
