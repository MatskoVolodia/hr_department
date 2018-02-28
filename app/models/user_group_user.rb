class UserGroupUser < ApplicationRecord
  belongs_to :user,       inverse_of: :user_groups
  belongs_to :user_group, inverse_of: :users
end
