class PostUserGroup < ApplicationRecord
  belongs_to :post
  belongs_to :user_group
end
