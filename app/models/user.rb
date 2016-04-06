# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  validates :username, presence: true
  validates :username, uniqueness: true
end
