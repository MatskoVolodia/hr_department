class Post < ApplicationRecord
  has_many :post_user_groups
  has_many :user_groups, through: :post_user_groups

  after_create :send_notifications

  is_impressionable

  has_attached_file :picture, styles: { medium: '300x300>', thumb: '150x150>' }, default_url: '/images/:style/missing.png'
  has_attached_file :attached_file

  validates_attachment :picture, size: { in: 0..5.megabytes }
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  validates :title, presence: true

  scope :readable, -> (user) { includes(:user_groups).where(user_groups: { id: [nil, *user.user_groups] }) }

  def targets
    user_groups.size.zero? ? User.all : user_groups.map(&:users).flatten.uniq
  end

  def send_notifications
    Posts::NewPostNotification.call(post: self)
  end
end
