# == Schema Information
#
# Table name: film_countries
#
#  id         :bigint           not null, primary key
#  country_id :bigint           not null
#  film_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class FilmCountryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
