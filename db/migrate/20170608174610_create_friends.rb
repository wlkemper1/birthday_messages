class CreateFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :friends do |t|
      t.date :date
      t.string :email
      t.integer :user_id
      t.date :birthday
      t.string :friend_name
      t.string :email_subject
      t.text :email_body

      t.timestamps

    end
  end
end
