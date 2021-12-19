# == Schema Information
#
# Table name: genres
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Genre < ApplicationRecord
  has_many :film_genres
  has_many :films, through: :film_genres

  validates :name, presence: true, length: { in: 1..20 }
end
