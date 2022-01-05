# == Schema Information
#
# Table name: episodes
#
#  id          :bigint           not null, primary key
#  season_id   :bigint           not null
#  title       :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Episode < ApplicationRecord
  belongs_to :season

  validates :title, presence: true, length: { in: 1..100 }
  validates :description, length: { in: 1..300 }, allow_blank: true

  def approved?
    season&.film&.approved?
  end
end
