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
require "test_helper"

class EpisodeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
