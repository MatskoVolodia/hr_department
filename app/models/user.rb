class User < ApplicationRecord
  devise :database_authenticatable, :validatable

  has_many :user_group_users
  has_many :user_groups, through: :user_group_users

  def admin?
    is_a? Admin
  end

  def employee?
    is_a? Employee
  end
end
