class CreateItemRules < ActiveRecord::Migration[8.0]
  def change
    create_table(:item_rules, primary_key: [ :municipality_id, :item_id, :sorting_category_id, :material_tag_id  ]) do |t|
      t.references :item
      t.references :sorting_category
      t.references :material_tag
      t.references :municipality
      t.text :additional_notes
      t.timestamps
    end
  end
end
