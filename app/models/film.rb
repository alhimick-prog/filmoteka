# == Schema Information
#
# Table name: films
#
#  id              :bigint           not null, primary key
#  title           :string           not null
#  description     :text
#  trailer_url     :text
#  release_date    :datetime         default(Tue, 01 Jan 1895 00:00:00.000000000 UTC +00:00), not null
#  duration        :integer          not null
#  age_restriction :integer          default(0), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  creator_id      :bigint
#  approved        :boolean          default(FALSE), not null
#
require 'uri'

class Film < ApplicationRecord
  belongs_to :creator, class_name: 'User', optional: true

  has_many :film_categories, dependent: :destroy
  has_many :categories, through: :film_categories
  has_many :film_countries, dependent: :destroy
  has_many :countries, through: :film_countries
  has_many :film_genres, dependent: :destroy
  has_many :genres, through: :film_genres
  has_many :film_people, dependent: :destroy
  has_many :people, through: :film_people
  has_many :film_tags, dependent: :destroy
  has_many :tags, through: :film_tags
  has_many :seasons, dependent: :destroy
  has_many :watch_items, dependent: :destroy
  has_many :users, through: :watch_items
  has_many :comments, as: :commentable, dependent: :destroy

  validates :title, presence: true, length: { in: 1..100 }
  validates :description, presence: true, length: { in: 10..500 }
  validates :trailer_url, format: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/, allow_blank: true
  validates_date :release_date, between: ['01.01.1895', :today]
  validates :duration,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 3, less_than_or_equal_to: 600 }
  validates :age_restriction,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 21 }

  accepts_nested_attributes_for :film_categories, :film_genres, :film_tags, :film_countries, :film_people, allow_destroy: true

  self.per_page = 15

  attr_accessor :tags_string, :countries_string, :actors_string, :directors_string

  def tags_string
    tags.map(&:name).join(', ')
  end

  def countries_string
    countries.map(&:name).join(', ')
  end

  def actors_string
    names = film_people.where(role: 'Actor').map do |film_person|
      film_person.person.name
    end
    names.join(', ')
  end

  def directors_string
    names = film_people.where(role: 'Director').map do |film_person|
      film_person.person.name
    end
    names.join(', ')
  end
end
