# == Schema Information
#
# Table name: film_categories
#
#  id          :bigint           not null, primary key
#  film_id     :bigint           not null
#  category_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class FilmCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
