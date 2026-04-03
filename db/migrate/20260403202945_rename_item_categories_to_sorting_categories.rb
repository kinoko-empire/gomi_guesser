class RenameItemCategoriesToSortingCategories < ActiveRecord::Migration[8.0]
  def change
    rename_table("item_categories", "sorting_categories")
  end
end
