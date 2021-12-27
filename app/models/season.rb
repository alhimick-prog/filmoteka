# == Schema Information
#
# Table name: seasons
#
#  id           :bigint           not null, primary key
#  film_id      :bigint           not null
#  title        :string           not null
#  description  :text
#  release_date :datetime         not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Season < ApplicationRecord
  belongs_to :film
  has_many :episode, dependent: :destroy

  validates :title, presence: true, length: { in: 1..100 }
  validates :description, length: { in: 1..300 }, allow_blank: true
  validates_date :release_date, presence: true, between: ['01.01.1800', :today]
end
