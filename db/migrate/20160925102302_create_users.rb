class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :hashed_password, null: false
      t.integer :created_by, null: false

      t.timestamps null: false
    end
  end
end
