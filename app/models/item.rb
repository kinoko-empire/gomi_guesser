class Item < ApplicationRecord
  validates :eng_name, presence: true, uniqueness: { case_sensitive: false }
end
