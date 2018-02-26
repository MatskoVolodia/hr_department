class DeviseCreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''

      t.string :first_name,         null: false, default: ''
      t.string :last_name,          null: false, default: ''

      t.string :type

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
  end
end
