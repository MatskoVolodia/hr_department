class Post < ApplicationRecord
  has_and_belongs_to_many :user_groups

  is_impressionable

  has_attached_file :picture, styles: { medium: '300x300>', thumb: '150x150>' }, default_url: '/images/:style/missing.png'
  has_attached_file :attached_file

  validates_attachment :picture, size: { in: 0..5.megabytes }
end
