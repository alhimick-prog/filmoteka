# == Schema Information
#
# Table name: film_genres
#
#  id         :bigint           not null, primary key
#  film_id    :bigint           not null
#  genre_id   :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class FilmGenreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
