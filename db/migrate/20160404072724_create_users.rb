class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name,                 null: false
      t.string :email,                null: false,   unique: true
      t.string :phone
      t.string :address
      t.string :password_digest,      null: false
      t.text :avatar
      t.boolean :user_custom_avatar, null: false, default: false
      t.timestamps null: false
    end
  end
end
