class RemoveAdditionalNotesFromSortingCategories < ActiveRecord::Migration[8.0]
  def change
    remove_column(:sorting_categories, :additional_notes)
  end
end
