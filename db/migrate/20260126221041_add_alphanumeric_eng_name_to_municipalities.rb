class AddAlphanumericEngNameToMunicipalities < ActiveRecord::Migration[8.0]
  def change
    add_column :municipalities, :alphanumeric_eng_name, :string, null: false, default: "municipality_alphanumeric_eng_name"
  end
end
