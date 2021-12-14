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
require "test_helper"

class CountryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
