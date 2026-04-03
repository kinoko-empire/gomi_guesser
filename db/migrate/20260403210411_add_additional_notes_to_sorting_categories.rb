class AddAdditionalNotesToSortingCategories < ActiveRecord::Migration[8.0]
  def change
    add_column(:sorting_categories, :additional_notes, :text)
  end
end
