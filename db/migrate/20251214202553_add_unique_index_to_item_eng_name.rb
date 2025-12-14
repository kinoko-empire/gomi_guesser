class AddUniqueIndexToItemEngName < ActiveRecord::Migration[8.0]
  def change
    add_index(:items, :eng_name, unique: true)
  end
end
