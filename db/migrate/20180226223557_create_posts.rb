class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string     :title
      t.text       :content
      t.attachment :picture
      t.attachment :attached_file

      t.timestamps
    end

    create_table :posts_user_groups do |t|
      t.belongs_to :post,       index: true
      t.belongs_to :user_group, index: true
    end
  end
end
