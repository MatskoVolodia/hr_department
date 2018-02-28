class Post < ApplicationRecord
  has_many :post_user_groups
  has_many :user_groups, through: :post_user_groups

  is_impressionable

  has_attached_file :picture, styles: { medium: '300x300>', thumb: '150x150>' }, default_url: '/images/:style/missing.png'
  has_attached_file :attached_file

  validates_attachment :picture, size: { in: 0..5.megabytes }

  scope :readable, -> (user) { includes(:user_groups).where(user_groups: { id: [nil, *user.user_groups] }) }
end
