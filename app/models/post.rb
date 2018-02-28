class Post < ApplicationRecord
  has_many :post_user_groups
  has_many :user_groups, through: :post_user_groups

  after_create :send_notifications

  DEFAULT_PICTURE_URL = '/images/:style/missing.png'.freeze

  is_impressionable

  has_attached_file :picture, styles: { medium: '300x300>', thumb: '150x150>' },
                              default_url: DEFAULT_PICTURE_URL

  has_attached_file :attached_file

  validates_attachment :picture, size: { in: 0..5.megabytes }
  validates_attachment_content_type :picture, content_type: %r{\Aimage\/.*\z}

  validates :title, presence: true

  scope :readable, ->(user) { user.admin? ? Post.all :  Post.not_admin_readable(user) }

  def targets
    user_groups.size.zero? ? User.all : user_groups.map(&:users).flatten.uniq
  end

  private

  def send_notifications
    Posts::NewPostNotification.call(post: self)
  end

  def self.not_admin_readable(user)
    includes(:user_groups).where(user_groups: { id: [nil, *user.user_groups] })
  end
end
