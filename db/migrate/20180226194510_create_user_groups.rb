class CreateUserGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :user_groups do |t|
      t.string :name

      t.timestamps
    end

    create_table :user_groups_users do |t|
      t.belongs_to :user,       index: true
      t.belongs_to :user_group, index: true
    end
  end
end
