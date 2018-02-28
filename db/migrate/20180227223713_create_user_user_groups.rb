class CreateUserUserGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :user_user_groups do |t|

      t.timestamps
    end
  end
end
