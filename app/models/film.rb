# == Schema Information
#
# Table name: films
#
#  id              :bigint           not null, primary key
#  title           :string           not null
#  description     :text
#  trailer_url     :text
#  release_date    :datetime         default(Thu, 01 Jan 1970 00:00:00.000000000 UTC +00:00), not null
#  duration        :integer          not null
#  age_restriction :integer          default(0), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  users_id        :bigint
#
class Film < ApplicationRecord
  has_many :category, through: :film_category
  has_many :country, through: :film_country
  has_many :genre, through: :film_genre
  has_many :person, through: :film_person
  has_many :tag, through: :film_tag
  has_many :season
  belongs_to :user
  has_many :user, through: :watch_item
  has_many :comment, as: commentable
end
