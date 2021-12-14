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
require "test_helper"

class FilmTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
