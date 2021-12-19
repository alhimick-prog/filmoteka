# == Schema Information
#
# Table name: watch_items
#
#  id         :bigint           not null, primary key
#  film_id    :bigint           not null
#  user_id    :bigint           not null
#  status     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class WatchItem < ApplicationRecord
  enum status: { Watching: 0, Viewed: 1, WillWatch: 2 }

  belongs_to :user
  belongs_to :film

  validates :status, presence: true
end
