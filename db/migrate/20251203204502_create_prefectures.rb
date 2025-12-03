class CreatePrefectures < ActiveRecord::Migration[8.0]
  def change
    create_table :prefectures do |t|
      t.string :eng_name, null: false
      t.string :kana_name, null: false
      t.string :kanji_name, null: false

      t.timestamps
    end
  end
end
