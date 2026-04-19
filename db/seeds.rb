# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "csv"

# jp_prefectures.csv contains prefecture names for all prefectures in japan as of 2025 (that I am aware of) - total 47
# based on https://github.com/nobuf/list-of-cities-in-japan/blob/master/build/prefectures.csv
# jp_municipalities.csv contains names of all wards, cities, villages in Tokyo metropolitan that I am aware of - total 23
# based on https://github.com/nobuf/list-of-cities-in-japan/blob/master/build/cities_in_japan_2024.csv
def create_seed_data
  puts "starting seed script"
  prefecture_id_map = {}

  prefectures_text = File.read(Rails.root.join("db", "seed_data", "jp_prefectures.csv"))
  prefectures_csv = CSV.parse(prefectures_text, headers: true, encoding: "UTF-8")

  if !Prefecture.first
    puts "seeding #{prefectures_csv.length} prefectures"

    prefectures_csv.each do |row|
      # keeping prefecture_id in the csv file in case I find later that it makes more sense to hard code the ids instead of letting rails generate them
      p = Prefecture.find_or_create_by(eng_name: row["eng_name"]) do |c|
        c.kanji_name = row["kanji_name"]
        c.kana_name = row["kana_name"]
        c.alphanumeric_eng_name = row["alphanumeric_eng_name"]
      end

      prefecture_id_map[p.eng_name] = p.id
    end
  else
    puts "prefectures already exist, skipping"
  end

  municipalities_text = File.read(Rails.root.join("db", "seed_data", "jp_municipalities.csv"))
  municipalities_csv = CSV.parse(municipalities_text, headers: true, encoding: "UTF-8")

  # create mapping so an item_rule can find correct foreign keys when being created
  item_rule_id_references = {
    municipality_ids: {},
    sorting_category_map: {},
    material_tag_map: {},
    item_map: {}
  }

  if !Municipality.first
    puts "seeding #{municipalities_csv.length} municipalities"

    municipalities_csv.each do |row|
      munc = Municipality.find_or_create_by(eng_name: row["eng_name"], prefecture_id: prefecture_id_map[row["prefecture_name"]]) do |c|
        c.kanji_name = row["kanji_name"]
        c.kana_name = row["kana_name"]
        c.municipality_type = row["municipality_type"]
        c.alphanumeric_eng_name = row["alphanumeric_eng_name"]
        c.info_url = row["info_url"]
      end

      item_rule_id_references[:municipality_ids]["#{row["eng_name"]}-#{row["prefecture_name"]}"] = munc.id
    end
  else
    puts "municipalities already exist, skipping "
  end

  sorting_categories_text = File.read(Rails.root.join("db", "seed_data", "sorting_categories.csv"))
  sorting_categories_csv = CSV.parse(sorting_categories_text, headers: true, encoding: "UTF-8")

  if !SortingCategory.first
    puts "seeding sorting categories"

    sorting_categories_csv.each do |row|
      sc = SortingCategory.create(name: row["name"])

      item_rule_id_references[:sorting_category_map][row["name"]] = sc.id
    end
  else
    puts "sorting categories already exist, skipping"
  end

  material_tags_text = File.read(Rails.root.join("db", "seed_data", "material_tags.csv"))
  material_tags_csv = CSV.parse(material_tags_text, headers: true, encoding: "UTF-8")

  if !MaterialTag.first
    puts "seeding material tags"

    material_tags_csv.each do |row|
      mt = MaterialTag.create(material_name: row["material_name"])

      item_rule_id_references[:material_tag_map][row["material_name"]] = mt.id
    end
  else
    puts "material tags already exist, skipping"
  end

  items_text = File.read(Rails.root.join("db", "seed_data", "item_list.csv"))
  items_csv = CSV.parse(items_text, headers: true, encoding: "UTF-8")

  if !Item.first
    puts "seeding items"

    items_csv.each do |row|
      item = Item.create(eng_name: row["eng_name"])

      item_rule_id_references[:item_map][row["eng_name"]] = item.id
    end
  else
    puts "items already exist, skipping"
  end

  item_rules_text = File.read(Rails.root.join("db", "seed_data", "item_rules.csv"))
  item_rules_csv = CSV.parse(item_rules_text, headers: true, encoding: "UTF-8")

  puts item_rule_id_references

  if !ItemRule.first
    puts "seeding item rules"

    item_rules_csv.each do |row|
      ItemRule.create(
        municipality_id: item_rule_id_references[:municipality_ids]["#{row["municipality_name"]}-#{row["prefecture_name"]}"],
        sorting_category_id: item_rule_id_references[:sorting_category_map][row["sorting_category"]],
        material_tag_id: item_rule_id_references[:material_tag_map][row["material_name"]],
        item_id: item_rule_id_references[:item_map][row["item_name"]],
        additional_notes: row["additional_notes"]
      )
    end
  else
    puts "item rules already exist, skipping"
  end

  puts "seed script finished"
end

create_seed_data
