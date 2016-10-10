class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest, null: false
      t.integer :user_id
      t.integer :role_id, null: false

      t.timestamps null: false
    end
  end
end
