# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tag < ApplicationRecord
  has_many :film_tags, dependent: :destroy
  has_many :films, through: :film_tags

  validates :name, presence: true, length: { in: 1..20 }
end
