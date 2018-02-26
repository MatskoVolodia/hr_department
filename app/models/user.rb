class User < ApplicationRecord
  devise :database_authenticatable

  has_and_belongs_to_many :user_groups

  def admin?
    is_a? Admin
  end

  def employee?
    is_a? Employee
  end
end
