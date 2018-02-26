class User < ApplicationRecord
  devise :database_authenticatable

  def admin?
    is_a? Admin
  end

  def employee?
    is_a? Employee
  end
end
