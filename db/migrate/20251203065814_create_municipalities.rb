class CreateMunicipalities < ActiveRecord::Migration[8.0]
  def change
    create_table :municipalities do |t|
      t.string :eng_name, null: false
      t.string :kana_name, null: false
      t.string :kanji_name, null: false
      t.string :municipality_type, null: false, default: "ward"
      t.check_constraint "type IN ('ward', 'city', 'town', 'village)", name: "municipality_type_check"

      t.timestamps
    end
  end
end
