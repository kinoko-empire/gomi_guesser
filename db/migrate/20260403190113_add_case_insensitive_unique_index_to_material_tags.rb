class AddCaseInsensitiveUniqueIndexToMaterialTags < ActiveRecord::Migration[8.0]
  def change
        add_index :material_tags, 'lower(material_name)', unique: true
  end
end
