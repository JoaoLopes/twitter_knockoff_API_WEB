class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.references :user

      t.timestamps null: false
    end
    add_index :roles, :name, unique: true
  end
end
