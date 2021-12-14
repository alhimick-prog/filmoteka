# == Schema Information
#
# Table name: comments
#
#  id               :bigint           not null, primary key
#  commentable_id   :bigint
#  commentable_type :string
#  user_id          :bigint           not null
#  body             :text             not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Comment < ApplicationRecord
end
