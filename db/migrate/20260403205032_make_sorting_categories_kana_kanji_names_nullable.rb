class MakeSortingCategoriesKanaKanjiNamesNullable < ActiveRecord::Migration[8.0]
  def change
    change_column_null(:sorting_categories, :kana_name, true)
    change_column_null(:sorting_categories, :kanji_name, true)
  end
end
