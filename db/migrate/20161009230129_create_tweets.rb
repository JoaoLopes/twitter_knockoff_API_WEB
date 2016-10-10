class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :msg, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
