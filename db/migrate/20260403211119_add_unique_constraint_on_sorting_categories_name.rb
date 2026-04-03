class AddUniqueConstraintOnSortingCategoriesName < ActiveRecord::Migration[8.0]
  def change
    add_index(:sorting_categories, :name, unique: true)
  end
end
