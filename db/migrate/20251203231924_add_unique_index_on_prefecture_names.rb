class AddUniqueIndexOnPrefectureNames < ActiveRecord::Migration[8.0]
  def change
    add_index :prefectures, [ :eng_name, :kanji_name, :kana_name ], unique: true, name: "index_prefectures_on_all_names"
  end
end
