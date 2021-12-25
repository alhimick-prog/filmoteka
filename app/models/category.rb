# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord
  has_many :film_categories, dependent: :destroy
  has_many :films, through: :film_categories

  validates :name, presence: true, length: { in: 1..20 }
end
