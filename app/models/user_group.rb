class UserGroup < ApplicationRecord
  has_many :user_group_users
  has_many :users, through: :user_group_users

  has_many :post_user_groups
  has_many :posts, through: :post_user_groups

  validates :group_name, presence: true
end
