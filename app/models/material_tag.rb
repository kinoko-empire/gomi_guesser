class MaterialTag < ApplicationRecord
  validates :material_name, presence: true, uniqueness: { case_sensitive: false }
end
