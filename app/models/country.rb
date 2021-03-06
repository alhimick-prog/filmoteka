# == Schema Information
#
# Table name: countries
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  banner     :string           default("🏳️"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Country < ApplicationRecord
  has_many :film_countries, dependent: :destroy
  has_many :films, through: :film_countries
end
