class AddCaseInsensitiveUniqueIndexToItemEngName < ActiveRecord::Migration[8.0]
  def change
    remove_index :items, column: :eng_name
    add_index :items, 'lower(eng_name)', unique: true
  end
end
