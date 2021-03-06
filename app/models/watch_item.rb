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
  STATUSES = %w[watching viewed will_watch].freeze
  enum status: STATUSES

  belongs_to :user
  belongs_to :film

  validates :status, presence: true, inclusion: { in: STATUSES }
end
