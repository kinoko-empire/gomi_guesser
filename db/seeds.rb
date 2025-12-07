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
  else
    puts "prefectures already exist, skipping "
  end

  prefectures_csv.each do |row|
    # keeping prefecture_id in the csv file in case I find later that it makes more sense to hard code the ids instead of letting rails generate them
    p = Prefecture.find_or_create_by(eng_name: row["eng_name"]) do |c|
      c.kanji_name = row["kanji_name"]
      c.kana_name = row["kana_name"]
    end

    prefecture_id_map[p.eng_name] = p.id
  end

  municipalities_text = File.read(Rails.root.join("db", "seed_data", "jp_municipalities.csv"))
  municipalities_csv = CSV.parse(municipalities_text, headers: true, encoding: "UTF-8")



  if !Municipality.first
    puts "seeding #{municipalities_csv.length} prefectures"
  else
    puts "municipalities already exist, skipping "
  end

  municipalities_csv.each do |row|
    Municipality.find_or_create_by(eng_name: row["eng_name"], prefecture_id: prefecture_id_map[row["prefecture_name"]]) do |c|
      c.kanji_name = row["kanji_name"]
      c.kana_name = row["kana_name"]
      c.municipality_type = row["municipality_type"]
    end
  end

  puts "seed script finished"
end

create_seed_data
