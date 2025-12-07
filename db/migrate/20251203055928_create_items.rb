class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.string :eng_name, null: false
      t.string :kana_name
      t.string :kanji_name

      t.timestamps
    end
  end
end
