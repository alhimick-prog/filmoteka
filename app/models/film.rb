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
  belongs_to :creator, class_name: 'User', optional: true

  has_many :film_categories
  has_many :categories, through: :film_categories
  has_many :film_countries
  has_many :countries, through: :film_countries
  has_many :film_genres
  has_many :genres, through: :film_genres
  has_many :film_people
  has_many :people, through: :film_people
  has_many :film_tags
  has_many :tags, through: :film_tags
  has_many :season
  has_many :watch_items
  has_many :users, through: :watch_items
  has_many :comments, as: :commentable
end
