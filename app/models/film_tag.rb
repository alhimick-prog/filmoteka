# == Schema Information
#
# Table name: film_tags
#
#  id         :bigint           not null, primary key
#  film_id    :bigint           not null
#  tag_id     :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class FilmTag < ApplicationRecord
end
