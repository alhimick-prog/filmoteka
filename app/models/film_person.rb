# == Schema Information
#
# Table name: film_people
#
#  id         :bigint           not null, primary key
#  film_id    :bigint           not null
#  person_id  :bigint           not null
#  role       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class FilmPerson < ApplicationRecord
  ROLES = ['Actor', 'Director']
  enum role: ROLES

  belongs_to :film
  belongs_to :person

  validates :role, presence: true, inclusion: { in: ROLES }
end
