class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email_address, null: false
      t.string :password_digest, null: false
      t.string :username, null: false # i added
      t.string :role, null: false, default: "standard" # i added
      t.check_constraint "role IN ('standard', 'admin')", name: "role_check" # i added

      t.timestamps
    end
    add_index :users, :email_address, unique: true
  end
end
