class PostUserGroup < ApplicationRecord
  belongs_to :post,       inverse_of: :user_groups
  belongs_to :user_group, inverse_of: :posts
end
