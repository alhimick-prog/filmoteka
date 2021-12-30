# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  name                   :string           not null
#  role                   :integer          default(0), not null
#  nickname               :string
#  birthday               :datetime         default(Thu, 01 Jan 1970 00:00:00.000000000 UTC +00:00), not null
#  address                :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: { subscriber: 0, editor: 1, admin: 2 }

  has_many :creator_films, class_name: 'Film', foreign_key: :creator_id, dependent: :nullify, inverse_of: :creator
  has_many :watch_items, dependent: :destroy
  has_many :films, through: :watch_items
  has_many :comment, dependent: nil
end
