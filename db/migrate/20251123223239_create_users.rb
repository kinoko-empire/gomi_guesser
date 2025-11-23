class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :username, null: false
      t.string :password_digest, null: false
      # using enums in sqlite and rails - https://jasonchee.me/notes/enum-with-sqlite/
      t.string :role, null: false, default: "standard"
      t.check_constraint "role IN ('standard', 'admin')", name: "role_check"

      t.timestamps
    end
  end
end
