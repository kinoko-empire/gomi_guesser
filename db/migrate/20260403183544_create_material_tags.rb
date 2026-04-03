class CreateMaterialTags < ActiveRecord::Migration[8.0]
  def change
    create_table :material_tags do |t|
      t.string :material_name, null: false
      t.timestamps
    end
  end
end
