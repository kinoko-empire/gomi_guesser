class AddAlphanumericEngNameToPrefectures < ActiveRecord::Migration[8.0]
  def change
    add_column :prefectures, :alphanumeric_eng_name, :string, null: false, default: "test"
  end
end
