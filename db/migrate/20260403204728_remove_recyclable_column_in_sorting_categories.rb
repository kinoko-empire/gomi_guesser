class RemoveRecyclableColumnInSortingCategories < ActiveRecord::Migration[8.0]
  def change
    remove_column(:sorting_categories, :recyclable)
  end
end
