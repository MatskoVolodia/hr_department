class RenameTables < ActiveRecord::Migration[5.1]
  def change
    rename_table :user_groups_users, :user_group_users
    rename_table :posts_user_groups, :post_user_groups
  end
end
