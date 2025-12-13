class CreateItemCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :item_categories do |t|
      t.string :name, null: false
      t.string :kanji_name, null: false
      t.string :kana_name, null: false
      t.boolean :recyclable, null: false

      t.timestamps
    end
  end
end
