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
  has_many :episode
end
