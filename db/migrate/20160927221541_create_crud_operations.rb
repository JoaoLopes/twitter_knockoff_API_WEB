class CreateCrudOperations < ActiveRecord::Migration
  def change
    create_table :crud_operations do |t|
      t.string :crud_op, null: false
      t.integer :role_id, null: false
      t.string :controller, null: false
      t.string :eval_exp, null: false
      t.references :user

      t.timestamps null: false
    end
  end
end
