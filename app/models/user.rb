class User < ApplicationRecord
  has_many :orders
end

# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  phone      :string
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
