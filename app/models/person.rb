# == Schema Information
#
# Table name: people
#
#  id         :bigint           not null, primary key
#  name       :string
#  birthday   :datetime
#  death_date :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Person < ApplicationRecord
  has_many :film_people
  has_many :films, through: :film_people

  validates :name, presence: true, length: { in: 1..100 }
  validates_date :birthday, between: ['01.01.1800', :today], allow_blank: true
  validates_date :death_date, between: ['01.01.1895', :today], allow_blank: true
end
