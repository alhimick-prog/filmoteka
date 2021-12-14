# == Schema Information
#
# Table name: film_people
#
#  id         :bigint           not null, primary key
#  film_id    :bigint           not null
#  person_id  :bigint           not null
#  role       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class FilmPersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
