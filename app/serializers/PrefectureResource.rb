class PrefectureResource < ApplicationResource
  attributes :id, :eng_name, :kanji_name, :kana_name, :updated_at, :created_at

  many :municipalities, resource: MunicipalityResource
end
